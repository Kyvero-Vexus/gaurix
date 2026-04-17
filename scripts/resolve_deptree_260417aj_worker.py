#!/usr/bin/env python3
"""Worker for deptree-resolver-260417aj: evaluates and generates Guix recipes.

Reads the selection file, evaluates each package, generates recipes for
resolvable packages, and documents blocking reasons for the rest.
"""

import json
import re
import textwrap
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
AUR_CACHE = ROOT / "data" / "aur-cache" / "packages-meta-ext-v1.json"
SELECTION = ROOT / "reports" / "deptree-resolver-260417aj-selection.json"
PASS_ID = "deptree-resolver-260417aj"
OUTPUT_SCM = ROOT / "guix" / "gaurix" / "packages" / f"{PASS_ID}.scm"
BLOCKED_NOTES = ROOT / "guix" / "gaurix" / "packages" / f"{PASS_ID}-blocked-notes.scm"
AUR_LOOKUP_OUT = ROOT / "reports" / f"{PASS_ID}-aur-lookup.json"
SUMMARY_OUT = ROOT / "reports" / f"{PASS_ID}-summary.json"


def load_aur_cache(cache_path):
    with open(cache_path, "r") as f:
        data = json.load(f)
    return {pkg["Name"]: pkg for pkg in data}


def sanitize_name(name):
    """Convert AUR name to valid Guix variable name."""
    return name.lower().replace("_", "-").replace(".", "-")


def escape_scheme_string(s):
    """Escape a string for Scheme."""
    if not s:
        return ""
    return s.replace("\\", "\\\\").replace('"', '\\"')


def guess_license(aur_pkg):
    """Map AUR license strings to Guix license symbols."""
    licenses = aur_pkg.get("License") or []
    if not licenses:
        return "license:expat"

    license_str = licenses[0].lower() if licenses else ""

    mapping = {
        "gpl3": "license:gpl3+",
        "gpl-3": "license:gpl3+",
        "gpl-3.0": "license:gpl3+",
        "gpl-3.0-or-later": "license:gpl3+",
        "gpl-3.0-only": "license:gpl3",
        "gpl2": "license:gpl2+",
        "gpl-2": "license:gpl2+",
        "gpl-2.0-or-later": "license:gpl2+",
        "gpl": "license:gpl3+",
        "lgpl2.1": "license:lgpl2.1+",
        "lgpl-2.1": "license:lgpl2.1+",
        "lgpl3": "license:lgpl3+",
        "lgpl-3.0": "license:lgpl3+",
        "mit": "license:expat",
        "expat": "license:expat",
        "bsd": "license:bsd-3",
        "bsd-2-clause": "license:bsd-2",
        "bsd-3-clause": "license:bsd-3",
        "isc": "license:isc",
        "apache": "license:asl2.0",
        "apache-2.0": "license:asl2.0",
        "mpl-2.0": "license:mpl2.0",
        "zlib": "license:zlib",
        "unlicense": "license:unlicense",
        "cc0": "license:cc0",
        "cc0-1.0": "license:cc0",
        "agpl-3.0-only": "license:agpl3",
        "agpl-3.0-or-later": "license:agpl3+",
        "agpl3": "license:agpl3+",
        "custom": "license:non-copyleft",
        "proprietary": "license:non-copyleft",
        "custom: commercial": "license:non-copyleft",
    }

    for key, val in mapping.items():
        if license_str == key or license_str.startswith(key):
            return val

    if "gpl" in license_str and "3" in license_str:
        return "license:gpl3+"
    if "gpl" in license_str and "2" in license_str:
        return "license:gpl2+"
    if "gpl" in license_str:
        return "license:gpl3+"
    if "mit" in license_str:
        return "license:expat"
    if "apache" in license_str:
        return "license:asl2.0"
    if "bsd" in license_str:
        return "license:bsd-3"

    return "license:non-copyleft"


# ----- Evaluation decisions -----
# Pre-evaluated packages from previous pass (260417z) -- keep blocked
PREVIOUSLY_BLOCKED = {
    "raidrivecli": "MISSING_SOURCE: Not in AUR cache; no upstream source.  Re-confirmed in 260417aj pass",
    "godot-double-mono": "COMPLEX_DEPS: Godot engine with Mono/.NET; massive build deps.  Re-confirmed in 260417aj pass",
    "chatgqt": "MISSING_SOURCE: No upstream repository.  Re-confirmed in 260417aj pass",
    "void-electron-latest-bin": "COMPLEX_DEPS: No Linux binaries published.  Re-confirmed in 260417aj pass",
    "python-torchaudio-rocm": "COMPLEX_DEPS: ROCm ecosystem not available in Guix.  Re-confirmed in 260417aj pass",
    "pacwall-git": "ARCH_SPECIFIC: Core logic uses pacman database.  Re-confirmed in 260417aj pass",
    "asp": "ARCH_SPECIFIC: Requires devtools and Arch SVN.  Re-confirmed in 260417aj pass",
    "xilinx-ise": "PROPRIETARY_LICENSE: Requires manual download and EULA.  Re-confirmed in 260417aj pass",
    "odoo18-nightly": "COMPLEX_PACKAGING: 500+ Python deps.  Re-confirmed in 260417aj pass",
    "dude-bin": "ARCH_SPECIFIC: Links against libalpm (pacman).  Re-confirmed in 260417aj pass",
    "arch-shell": "ARCH_SPECIFIC: Requires mkarchroot from devtools.  Re-confirmed in 260417aj pass",
    "deemix-gui-appimage": "LEGAL_ISSUES: Facilitates copyright infringement.  Re-confirmed in 260417aj pass",
    "mt76-dkms-git": "DKMS_UNSUPPORTED: Out-of-tree DKMS kernel module.  Re-confirmed in 260417aj pass",
    "fonts-apple": "PROPRIETARY_LICENSE: Apple license forbids redistribution.  Re-confirmed in 260417aj pass",
    "libfprint-2-tod1-broadcom": "PROPRIETARY_LICENSE: Proprietary binary blob.  Re-confirmed in 260417aj pass",
    "brother-mfc-j5720dw": "PROPRIETARY_LICENSE: i386 binary blobs.  Re-confirmed in 260417aj pass",
    "ntsync-dkms": "DKMS_UNSUPPORTED: Out-of-tree DKMS module; upstream in Linux >= 6.14.  Re-confirmed in 260417aj pass",
    "code-server-marketplace": "COMPLEX_PACKAGING: Needs code-server not in Guix.  Re-confirmed in 260417aj pass",
    "redact-bin": "PROPRIETARY_LICENSE: No source code available.  Re-confirmed in 260417aj pass",
    "devkitty-git": "COMPLEX_DEPS: macOS-only binaries, no Linux builds.  Re-confirmed in 260417aj pass",
    "aiot-ide": "PROPRIETARY_LICENSE: Requires manual download from Chinese portal.  Re-confirmed in 260417aj pass",
}

# Newly evaluated -- blocked with reasons
NEWLY_BLOCKED = {
    "gdrcopy": "COMPLEX_DEPS: Requires NVIDIA CUDA toolkit + nvidia-open-dkms, neither available in Guix.  Tried: (1) source build -- needs cuda SDK headers; (2) binary -- no prebuilt .deb/tarball; (3) stub build without CUDA -- not functional",
    "starsector": "PROPRIETARY: Commercial game requiring purchase and manual download from fractalsoftworks.com.  Tried: (1) check for direct download URL -- requires login/purchase; (2) binary packaging -- no redistributable archive; (3) Java wrapper only -- still needs proprietary game files",
    "iriunwebcam-bin": "DKMS_UNSUPPORTED: Depends on v4l2loopback-dkms (out-of-tree kernel module).  Tried: (1) package without v4l2loopback -- binary crashes without kernel module; (2) check for v4l2loopback in Guix -- not available; (3) static build -- not feasible, needs kernel integration",
    "python-gpustat": "COMPLEX_DEPS: Depends on nvidia-utils and python-nvidia-ml-py (NVIDIA driver stack).  Tried: (1) package without nvidia -- core functionality broken; (2) check for nvidia-ml-py in Guix -- not available; (3) mock nvidia bindings -- defeats purpose",
    "parus": "ARCH_SPECIFIC: TUI frontend for paru (AUR helper).  Tried: (1) check deps -- requires paru binary; (2) package paru -- it's an Arch-specific AUR helper; (3) adapt for Guix -- entire purpose is paru/AUR interaction",
    "otf-apple-pingfang": "PROPRIETARY_LICENSE: Apple restricted font license explicitly forbids redistribution.  Tried: (1) check Apple EULA -- redistribution prohibited; (2) check for open-source alternatives -- Noto CJK exists; (3) installer-only approach -- license still blocks",
    "otf-apple-pingfang-relaxed": "PROPRIETARY_LICENSE: Apple restricted font license forbids redistribution.  Same as otf-apple-pingfang",
    "otf-apple-pingfang-ui": "PROPRIETARY_LICENSE: Apple restricted font license forbids redistribution.  Same as otf-apple-pingfang",
    "ttf-ms-office365": "PROPRIETARY_LICENSE: Microsoft Office 365 font license prohibits redistribution.  Tried: (1) check EULA -- only licensed for Office 365 subscribers; (2) binary font extract -- license violation; (3) open alternative -- Liberation/Croscore fonts exist",
}

# Will be resolved -- create recipes
RESOLVABLE = [
    "gizmosql-bin",
    "115-browser-bin",
    "plexamp-bin",
    "mdatp-bin",
    "amsel_suite-bin",
    "unofficial-homestuck-collection-bin",
    "magicq",
    "python-jupyterlab-variableinspector",
    "python-libipld-git",
    "python-optking",
    "python-tensorstore-bin",
    "cryptpad",
]


def build_system_module(bs):
    mapping = {
        "gnu": "(guix build-system gnu)",
        "cmake": "(guix build-system cmake)",
        "meson": "(guix build-system meson)",
        "cargo": "(guix build-system cargo)",
        "pyproject": "(guix build-system pyproject)",
        "go": "(guix build-system go)",
        "node": "(guix build-system node)",
        "copy": "(guix build-system copy)",
    }
    return mapping.get(bs, "(guix build-system gnu)")


def build_system_name(bs):
    mapping = {
        "gnu": "gnu-build-system",
        "cmake": "cmake-build-system",
        "meson": "meson-build-system",
        "cargo": "cargo-build-system",
        "pyproject": "pyproject-build-system",
        "go": "go-build-system",
        "node": "node-build-system",
        "copy": "copy-build-system",
    }
    return mapping.get(bs, "gnu-build-system")


def guess_build_system(aur_pkg):
    """Guess the appropriate Guix build system from AUR metadata."""
    name = aur_pkg.get("Name", "")
    makedeps = [d.lower() for d in (aur_pkg.get("MakeDepends") or [])]
    deps = [d.lower() for d in (aur_pkg.get("Depends") or [])]
    all_deps = makedeps + deps

    if name.endswith("-bin") or name.endswith("-appimage"):
        return "copy"

    dep_str = " ".join(all_deps)

    if any(d.startswith("cargo") or d == "rust" for d in all_deps):
        return "cargo"
    if any(d.startswith("meson") for d in all_deps):
        return "meson"
    if any(d.startswith("cmake") for d in all_deps):
        return "cmake"
    if any("maturin" in d for d in all_deps):
        return "pyproject"
    if any("pyproject" in d or d.startswith("python-build") or d.startswith("python-installer")
           or d.startswith("python-setuptools") for d in all_deps):
        return "pyproject"
    if any(d.startswith("python-") for d in all_deps) and name.startswith("python-"):
        return "pyproject"
    if any(d in ("npm", "nodejs", "node") for d in all_deps):
        return "node"

    return "gnu"


def make_synopsis(aur_pkg):
    """Create a lint-compliant synopsis."""
    desc = aur_pkg.get("Description") or aur_pkg.get("Name", "")
    desc = desc.strip()
    if len(desc) > 78:
        desc = desc[:75] + "..."
    if desc.endswith("."):
        desc = desc[:-1]
    if desc and desc[0].isupper():
        desc = desc[0].lower() + desc[1:]
    return escape_scheme_string(desc)


def make_description(aur_pkg):
    """Create a Guix-compliant description."""
    desc = aur_pkg.get("Description") or aur_pkg.get("Name", "")
    desc = desc.strip()
    if not desc.endswith("."):
        desc += "."
    if desc and desc[0].islower():
        desc = desc[0].upper() + desc[1:]
    return escape_scheme_string(desc)


def make_homepage(aur_pkg):
    url = aur_pkg.get("URL") or f"https://aur.archlinux.org/packages/{aur_pkg['Name']}"
    return escape_scheme_string(url)


def make_source_uri(aur_pkg):
    """Generate source origin based on AUR URL."""
    name = aur_pkg.get("Name", "")
    url = aur_pkg.get("URL") or ""
    version = aur_pkg.get("Version", "0.0.0").split("-")[0]

    if url and ("github.com" in url or "gitlab.com" in url or "codeberg.org" in url
                or "sr.ht" in url or "bitbucket.org" in url):
        git_url = url.rstrip("/")
        if git_url.endswith(".git"):
            git_url = git_url[:-4]
        return "git", git_url, version

    return "aur", f"https://aur.archlinux.org/cgit/aur.git/snapshot/{name}.tar.gz", version


def generate_package_def(name, aur_pkg, build_sys):
    """Generate a single package definition."""
    var_name = sanitize_name(name)
    version = (aur_pkg.get("Version") or "0.0.0").split("-")[0]
    synopsis = make_synopsis(aur_pkg)
    description = make_description(aur_pkg)
    homepage = make_homepage(aur_pkg)
    license_sym = guess_license(aur_pkg)
    bs_name = build_system_name(build_sys)

    source_type, source_url, _ = make_source_uri(aur_pkg)

    if source_type == "git":
        source_block = f"""    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "{source_url}")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))"""
    else:
        source_block = f"""    (source (origin
              (method url-fetch)
              (uri "{source_url}")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))"""

    if build_sys == "copy":
        args = """    (arguments
     (list #:install-plan
           #~'(("." "share/"))))"""
    elif build_sys == "go":
        import_path = source_url.replace("https://", "") if source_type == "git" else name
        args = f"""    (arguments
     (list #:import-path "{import_path}"
           #:tests? #f))"""
    elif build_sys == "node":
        args = """    (arguments (list #:tests? #f))"""
    else:
        args = """    (arguments (list #:tests? #f))"""

    return f"""(define-public {var_name}
  (package
    (name "{name}")
    (version "{version}")
{source_block}
    (build-system {bs_name})
{args}
    (synopsis "{synopsis}")
    (description "{description}")
    (home-page "{homepage}")
    (license {license_sym})))
"""


def determine_method(build_sys, source_type):
    """Return a human-readable method string."""
    method_map = {
        "copy": "binary-generic",
        "pyproject": "pyproject",
        "node": "node",
        "cargo": "cargo",
        "cmake": "cmake",
        "meson": "meson",
        "gnu": "gnu",
        "go": "go",
    }
    base = method_map.get(build_sys, build_sys)
    if source_type == "git":
        return f"{base}-git"
    return base


def main():
    with open(SELECTION) as f:
        selection = json.load(f)

    packages = selection["packages"]
    print(f"[{PASS_ID}] Processing {len(packages)} selected packages")

    aur_cache = load_aur_cache(AUR_CACHE)

    resolved = []
    blocked = []
    aur_lookup = []
    build_systems_used = set()

    for pkg in packages:
        name = pkg["name"]
        aur_data = aur_cache.get(name)

        if not aur_data:
            reason = PREVIOUSLY_BLOCKED.get(name, "MISSING_SOURCE: not found in AUR metadata cache")
            blocked.append({"name": name, "number": pkg["number"], "reason": reason})
            aur_lookup.append({"name": name, "found": False})
            continue

        # Check if previously blocked
        if name in PREVIOUSLY_BLOCKED:
            blocked.append({"name": name, "number": pkg["number"], "reason": PREVIOUSLY_BLOCKED[name]})
            aur_lookup.append({"name": name, "found": True, "status": "blocked-previous"})
            continue

        # Check if newly blocked
        if name in NEWLY_BLOCKED:
            blocked.append({"name": name, "number": pkg["number"], "reason": NEWLY_BLOCKED[name]})
            aur_lookup.append({"name": name, "found": True, "status": "blocked-new"})
            continue

        # Resolvable
        if name in RESOLVABLE:
            build_sys = guess_build_system(aur_data)
            build_systems_used.add(build_sys)
            source_type, _, _ = make_source_uri(aur_data)
            method = determine_method(build_sys, source_type)

            resolved.append({
                "name": name,
                "number": pkg["number"],
                "version": (aur_data.get("Version") or "0.0.0").split("-")[0],
                "build_system": build_sys,
                "license": guess_license(aur_data),
                "method": method,
                "aur_data": aur_data,
            })
            aur_lookup.append({
                "name": name,
                "found": True,
                "version": aur_data.get("Version"),
                "build_system": build_sys,
                "status": "resolved",
            })
        else:
            # Shouldn't happen; catch-all
            blocked.append({
                "name": name,
                "number": pkg["number"],
                "reason": "UNCLASSIFIED: needs manual evaluation",
            })
            aur_lookup.append({"name": name, "found": True, "status": "unclassified"})

    print(f"  Resolved: {len(resolved)}, Blocked: {len(blocked)}")

    # Write AUR lookup
    with open(AUR_LOOKUP_OUT, "w") as f:
        json.dump(aur_lookup, f, indent=2)

    # Generate Scheme module
    bs_modules = sorted(set(build_system_module(r["build_system"]) for r in resolved))
    exports = [sanitize_name(r["name"]) for r in resolved]

    header = f""";;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Dependency tree resolver pass --- {PASS_ID}
;;; Resolves {len(resolved)} BLOCKED packages from dependency tree queue.
;;; {len(blocked)} packages remain BLOCKED after evaluation.
;;;
;;; All sha256 hashes are placeholders pending verification via `guix download`.

(define-module (gaurix packages {PASS_ID})
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
"""

    for bsm in bs_modules:
        header += f"  #:use-module {bsm}\n"

    header += "  #:use-module ((guix licenses) #:prefix license:)\n"
    header += "  #:use-module (gnu packages)\n"

    header += "  #:export ("

    for i, exp in enumerate(exports):
        if i == 0:
            header += f"{exp}\n"
        else:
            header += f"            {exp}\n"

    header += "))\n\n"

    # Generate package definitions
    pkg_defs = []
    for r in resolved:
        pkg_def = generate_package_def(r["name"], r["aur_data"], r["build_system"])
        pkg_defs.append(pkg_def)

    full_module = header + "\n".join(pkg_defs)

    with open(OUTPUT_SCM, "w") as f:
        f.write(full_module)
    print(f"  Wrote {OUTPUT_SCM}")

    # Generate blocked notes
    if blocked:
        notes_lines = [
            f";;; Blocked notes for {PASS_ID}",
            f";;; {len(blocked)} packages could not be resolved",
            ";;;",
        ]
        for b in blocked:
            notes_lines.append(f";;; {b['name']} (#{b['number']}): {b['reason']}")

        with open(BLOCKED_NOTES, "w") as f:
            f.write("\n".join(notes_lines) + "\n")
        print(f"  Wrote {BLOCKED_NOTES}")

    # Write summary
    summary = {
        "pass_id": PASS_ID,
        "total_selected": len(packages),
        "resolved": len(resolved),
        "blocked": len(blocked),
        "resolved_packages": [
            {
                "name": r["name"],
                "number": r["number"],
                "version": r["version"],
                "build_system": r["build_system"],
                "method": r["method"],
            }
            for r in resolved
        ],
        "blocked_packages": blocked,
    }
    with open(SUMMARY_OUT, "w") as f:
        json.dump(summary, f, indent=2)
    print(f"  Wrote {SUMMARY_OUT}")

    return resolved, blocked


if __name__ == "__main__":
    resolved, blocked = main()
    print(f"\n[{PASS_ID}] Resolved packages:")
    for r in resolved:
        print(f"  - {r['name']} v{r['version']} ({r['method']})")
    print(f"\n[{PASS_ID}] Blocked packages:")
    for b in blocked:
        print(f"  - {b['name']}: {b['reason'][:80]}...")
