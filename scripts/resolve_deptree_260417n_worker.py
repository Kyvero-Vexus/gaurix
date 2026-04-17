#!/usr/bin/env python3
"""Worker for deptree-resolver-260417n: updates todo, packages.scm, general-compat.scm.

Resolved packages (13):
  cook (#14634): single-file C build system
  capnproto-java (#14567): Cap'n Proto Java bindings
  zef (#14612): Raku module manager
  vs1clickmodinstaller (#14602): Vintage Story mod installer
  libjxl-doc (#14607): JPEG XL documentation
  arrow-c-glib (#14610): Apache Arrow GLib bindings
  mayo (#14604): 3D CAD viewer (Qt5 + OpenCascade)
  swaysettings (#14632): Sway desktop settings GUI
  ghostty (#14572): GPU-accelerated terminal emulator
  xpipe-ptb (#14608): remote shell connection hub (binary)
  atom-ng-bin (#14629): Atom editor fork (binary)
  gridmonger (#14492): cRPG dungeon mapping tool (Nim)
  ccdciel (#14615): CCD capture for amateur astronomy

Remaining BLOCKED (16):
  raidrivecli (#14202) - PROPRIETARY
  godot-double-mono (#14495) - MISSING_DEP (dotnet-sdk)
  transistor-git (#14539) - SOURCE_UNAVAILABLE (GitLab 403)
  lenovolegionlinux-dkms-git (#14563) - MISSING_DEP + DKMS
  chatgqt (#14575) - SOURCE_UNAVAILABLE
  void-electron-latest-bin (#14576) - SOURCE_UNAVAILABLE
  python-gradio (#14579) - DEP_CHAIN_TOO_DEEP
  python-torchaudio-rocm (#14583) - DEP_CHAIN_TOO_DEEP
  pacwall-git (#14584) - ARCH_SPECIFIC
  asp (#14587) - ARCH_SPECIFIC
  watchman (#14593) - MISSING_DEP (fbthrift/fizz/wangle/edencommon)
  omada-controller (#14599) - MISSING_DEP (MongoDB)
  xilinx-ise (#14616) - PROPRIETARY
  elmerfem-git (#14617) - COMPLEX_BUILD
  electron-builder (#14623) - DEP_CHAIN_TOO_DEEP
  leetmouse-driver-dkms (#14633) - DKMS_UNSUPPORTED
"""

import json
import re
import shutil
import tempfile
from datetime import datetime, timezone
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
TODO_FILE = ROOT / "todo_general_packages.org"
PACKAGES_SCM = ROOT / "guix" / "gaurix" / "packages.scm"
COMPAT_SCM = ROOT / "guix" / "gaurix" / "packages" / "general-compat.scm"
PASS_ID = "deptree-resolver-260417n"

# Packages resolved with recipes
RESOLVED = {
    14634: ("cookc", "gnu-build-system recipe, simple Makefile C build from GitHub hanion/cook v0.1.1"),
    14567: ("capnproto-java", "gnu-build-system recipe, javac + capnpc from GitHub capnproto/capnproto-java v0.1.16"),
    14612: ("zef", "copy-build-system recipe, Raku module manager from GitHub ugexe/zef v1.0.0"),
    14602: ("vs1clickmodinstaller", "copy-build-system recipe, Python script from GitHub maximalmax90/vs1clickmodinstaller v0.2"),
    14607: ("libjxl-doc-git", "cmake-build-system recipe, Doxygen doc build from libjxl v0.11.1"),
    14610: ("arrow-c-glib", "meson-build-system recipe, GLib wrapper from apache/arrow v23.0.0 c_glib/"),
    14604: ("mayo-git", "cmake-build-system recipe, Qt5 + OpenCascade from GitHub fougue/mayo v0.9.0"),
    14632: ("swaysettings-git", "meson-build-system recipe, Vala + GTK4 from GitHub ErikReider/SwaySettings v0.5.0"),
    14572: ("ghostty-git", "zig-build-system recipe, GTK4 terminal emulator from GitHub ghostty-org/ghostty v1.3.1"),
    14608: ("xpipe-ptb", "copy-build-system binary from GitHub xpipe-io/xpipe-ptb v22.10-4"),
    14629: ("atom-ng-bin", "copy-build-system binary from GitHub Alex313031/atom-ng v1.66.12"),
    14492: ("gridmonger-git", "gnu-build-system recipe, Nim build from GitHub johnnovak/gridmonger v1.2.0"),
    14615: ("ccdciel", "gnu-build-system recipe, Lazarus/FPC build from GitHub pchev/ccdciel v0.9.92"),
}

# Packages remaining blocked with updated notes
STILL_BLOCKED = {
    14202: ("raidrivecli", "PROPRIETARY: not in AUR cache, proprietary cloud storage CLI, not freely redistributable"),
    14495: ("godot-double-mono", "MISSING_DEP: needs dotnet-sdk not available in Guix; Mono/.NET runtime packaging not mature"),
    14539: ("transistor-git", "SOURCE_UNAVAILABLE: GitLab repo (driglu4it/transistor) returns 403; project may be private/deleted"),
    14563: ("lenovolegionlinux-dkms-git", "MISSING_DEP + DKMS_UNSUPPORTED: depends on lenovolegionlinux-git (not packaged); DKMS kernel module model incompatible with Guix"),
    14575: ("chatgqt", "SOURCE_UNAVAILABLE: no URL in AUR metadata; original GitHub repo returns 404"),
    14576: ("void-electron-latest-bin", "SOURCE_UNAVAILABLE: void-editor project fragmented across forks; no stable Linux binary release found"),
    14579: ("python-gradio", "DEP_CHAIN_TOO_DEEP: 40+ transitive Python deps not in Guix (fastapi, pydantic-v2, starlette, uvicorn, etc.)"),
    14583: ("python-torchaudio-rocm", "DEP_CHAIN_TOO_DEEP: requires full PyTorch + ROCm/HIP compiler stack; massive dependency chain"),
    14584: ("pacwall-git", "ARCH_SPECIFIC: shell script fundamentally depends on pacman package manager commands; no Guix analogue"),
    14587: ("asp", "ARCH_SPECIFIC: Arch Linux build source management tool; depends on pacman infrastructure; no use outside Arch"),
    14593: ("watchman", "MISSING_DEP: needs fbthrift, fizz, wangle, edencommon (Meta C++ infrastructure stack not in Guix); folly alone insufficient"),
    14599: ("omada-controller", "MISSING_DEP: needs MongoDB server (not in Guix); complex Java service with systemd integration"),
    14616: ("xilinx-ise", "PROPRIETARY: registration-walled download requiring Xilinx account; 6GB+ installer; not freely redistributable"),
    14617: ("elmerfem-git", "COMPLEX_BUILD: 40+ deps; many MakeDepends not in Guix (cli11, ospray, anari-sdk, adios2, liblas, pdal, openvr)"),
    14623: ("electron-builder", "DEP_CHAIN_TOO_DEEP: 200+ Node.js/npm transitive dependencies; npm ecosystem packaging not feasible at scale"),
    14633: ("leetmouse-driver-dkms", "DKMS_UNSUPPORTED: DKMS kernel module model incompatible with Guix declarative kernel management"),
}

# Guix symbol names for exports
EXPORT_SYMBOLS = [
    "cook",
    "capnproto-java",
    "zef",
    "vs1clickmodinstaller",
    "libjxl-doc",
    "arrow-c-glib",
    "mayo",
    "swaysettings",
    "ghostty",
    "xpipe-ptb",
    "atom-ng-bin",
    "gridmonger",
    "ccdciel",
]


def update_todo():
    """Update todo_general_packages.org entries."""
    print(f"[{PASS_ID}] Updating todo_general_packages.org...")

    with open(TODO_FILE, "r") as f:
        lines = f.readlines()

    output = []
    i = 0
    resolved_count = 0
    blocked_updated = 0

    while i < len(lines):
        line = lines[i]

        # Check for BLOCKED header
        m = re.match(r"^(\*\*\s+)BLOCKED(\s+)(\d+)\.\s+(\S+)(.*)", line)
        if m:
            prefix = m.group(1)
            space = m.group(2)
            number = int(m.group(3))
            name = m.group(4)
            rest = m.group(5)

            if number in RESOLVED:
                pkg_name, detail = RESOLVED[number]
                # Change header to DONE
                new_header = f"{prefix}DONE{space}{number}. {name} [RESOLVED: {PASS_ID}]{rest}\n"
                output.append(new_header)
                # Add status line
                output.append(f"   - Status: DONE: recipe in {PASS_ID}.scm ({pkg_name}, RECIPE: {detail})\n")
                resolved_count += 1
                i += 1
                continue

            elif number in STILL_BLOCKED:
                pkg_name, detail = STILL_BLOCKED[number]
                # Keep BLOCKED header, add updated note
                output.append(line)
                output.append(f"   - Status: BLOCKED: {detail} ({PASS_ID})\n")
                blocked_updated += 1
                i += 1
                continue

        output.append(line)
        i += 1

    # Atomic write
    with tempfile.NamedTemporaryFile(mode="w", dir=TODO_FILE.parent,
                                     suffix=".tmp", delete=False) as tmp:
        tmp.writelines(output)
        tmp_path = Path(tmp.name)
    shutil.move(str(tmp_path), str(TODO_FILE))

    print(f"  Resolved {resolved_count} entries, updated {blocked_updated} blocked entries")


def update_packages_scm():
    """Add new package symbols to packages.scm using deterministic transform."""
    print(f"[{PASS_ID}] Updating packages.scm...")

    with open(PACKAGES_SCM, "r") as f:
        content = f.read()

    # Find existing exports and add new ones
    existing_symbols = set(re.findall(r'\b([\w-]+)\b', content))
    new_symbols = [s for s in EXPORT_SYMBOLS if s not in existing_symbols]

    if not new_symbols:
        print("  No new symbols to add to packages.scm")
        return

    # Find insertion point: after the last package name line
    lines = content.split("\n")
    insert_idx = None
    for idx, line in enumerate(lines):
        stripped = line.strip()
        if stripped and not stripped.startswith(";") and not stripped.startswith("("):
            # Looks like a package name
            insert_idx = idx

    if insert_idx is None:
        insert_idx = len(lines) - 1

    # Add new symbols
    comment = f"  ; {PASS_ID} (13 BLOCKED resolved)"
    new_lines = [comment] + [f"  {s}" for s in new_symbols]
    lines = lines[:insert_idx + 1] + new_lines + lines[insert_idx + 1:]

    with tempfile.NamedTemporaryFile(mode="w", dir=PACKAGES_SCM.parent,
                                     suffix=".tmp", delete=False) as tmp:
        tmp.write("\n".join(lines))
        tmp_path = Path(tmp.name)
    shutil.move(str(tmp_path), str(PACKAGES_SCM))

    print(f"  Added {len(new_symbols)} symbols: {', '.join(new_symbols)}")


def update_general_compat():
    """Add module import and re-exports to general-compat.scm."""
    print(f"[{PASS_ID}] Updating general-compat.scm...")

    with open(COMPAT_SCM, "r") as f:
        content = f.read()

    # Check if already added
    if PASS_ID in content:
        print(f"  {PASS_ID} already present in general-compat.scm")
        return

    lines = content.split("\n")
    new_lines = []

    # Find where to insert the #:use-module line
    last_use_module_idx = None
    for idx, line in enumerate(lines):
        if "#:use-module" in line:
            last_use_module_idx = idx

    if last_use_module_idx is None:
        print("  ERROR: Could not find #:use-module in general-compat.scm")
        return

    # Insert the new module import
    module_line = f"  #:use-module (gaurix packages {PASS_ID})"
    for idx, line in enumerate(lines):
        new_lines.append(line)
        if idx == last_use_module_idx:
            new_lines.append(module_line)

    # Add re-exports at the end
    re_exports = [f"; {PASS_ID}"] + [f"(re-export {s})" for s in EXPORT_SYMBOLS]
    # Remove trailing empty lines then add re-exports
    while new_lines and new_lines[-1].strip() == "":
        new_lines.pop()
    new_lines.extend(re_exports)
    new_lines.append("")  # trailing newline

    with tempfile.NamedTemporaryFile(mode="w", dir=COMPAT_SCM.parent,
                                     suffix=".tmp", delete=False) as tmp:
        tmp.write("\n".join(new_lines))
        tmp_path = Path(tmp.name)
    shutil.move(str(tmp_path), str(COMPAT_SCM))

    print(f"  Added module import and {len(EXPORT_SYMBOLS)} re-exports")


def write_summary():
    """Write summary report."""
    timestamp = datetime.now(timezone.utc).isoformat().replace("+00:00", "Z")
    summary = {
        "pass_id": PASS_ID,
        "timestamp": timestamp,
        "total_blocked_before": 29,
        "total_blocked_unique": 29,
        "resolved": [
            {"number": num, "name": name, "detail": detail}
            for num, (name, detail) in sorted(RESOLVED.items())
        ],
        "still_blocked": [
            {"number": num, "name": name, "reason": reason}
            for num, (name, reason) in sorted(STILL_BLOCKED.items())
        ],
        "resolved_count": len(RESOLVED),
        "still_blocked_count": len(STILL_BLOCKED),
        "new_packages": EXPORT_SYMBOLS,
    }

    summary_path = ROOT / "reports" / f"{PASS_ID}-summary.json"
    with open(summary_path, "w") as f:
        json.dump(summary, f, indent=2)
    print(f"  Wrote {summary_path}")

    return summary


def main():
    print(f"\n{'=' * 60}")
    print(f"  {PASS_ID} Worker")
    print(f"{'=' * 60}\n")

    update_todo()
    update_packages_scm()
    update_general_compat()
    summary = write_summary()

    print(f"\n{'=' * 60}")
    print(f"  Summary")
    print(f"{'=' * 60}")
    print(f"  Resolved: {summary['resolved_count']} packages")
    print(f"  Still blocked: {summary['still_blocked_count']} packages")
    print(f"  New Guix packages: {', '.join(EXPORT_SYMBOLS)}")
    print(f"{'=' * 60}\n")


if __name__ == "__main__":
    main()
