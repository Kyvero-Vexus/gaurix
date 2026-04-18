#!/usr/bin/env python3
"""
Update todo_general_packages.org for recipe-resolver-260418j.
Marks 30 NEEDS_RECIPE_DESIGN packages as resolved.
"""
import re
import shutil
import tempfile

PASS_ID = "recipe-resolver-260418j"
ORG_FILE = "todo_general_packages.org"

# (org_package_name, guix_name, version, build_system, license)
RESOLVED = [
    ("libfprint-cs9711-git", "libfprint-cs9711-git", "1.94.10", "cmake-build-system", "LGPL-2.1+"),
    ("python-cirq", "python-cirq", "1.6.1", "pyproject-build-system", "Apache-2.0"),
    ("python-cirq-google", "python-cirq-google", "1.6.1", "pyproject-build-system", "Apache-2.0"),
    ("typesetter", "typesetter", "0.12.3", "meson-build-system", "GPL-3.0+"),
    ("libkompass-git", "libkompass-git", "0.1.0", "meson-build-system", "GPL-3.0"),
    ("kompass-git", "kompass-git", "0.1.0", "meson-build-system", "GPL-3.0"),
    ("wf-shell-git", "wf-shell-git", "0.8.0", "meson-build-system", "MIT"),
    ("ni-daqmx-base-bin", "ni-daqmx-base-bin", "15.0.0", "copy-build-system", "proprietary"),
    ("riscv64-gnu-toolchain-musl-bin", "riscv64-gnu-toolchain-musl-bin", "2026.04.05", "copy-build-system", "GPL-2.0"),
    ("conar-bin", "conar-bin", "0.28.1", "copy-build-system", "AGPL-3.0+"),
    ("musicfree-desktop", "musicfree-desktop", "0.0.8", "copy-build-system", "GPL-3.0"),
    ("libva-nvidia-driver-git", "libva-nvidia-driver-git", "0.0.12", "meson-build-system", "MIT"),
    ("python-tf2onnx", "python-tf2onnx", "1.16.1", "pyproject-build-system", "MIT"),
    ("python-cirq-core", "python-cirq-core", "1.6.1", "pyproject-build-system", "Apache-2.0"),
    ("mkinitcpio-git", "mkinitcpio-git", "39.1", "meson-build-system", "GPL-2.0"),
    ("ocudu-git", "ocudu-git", "26.04.0", "cmake-build-system", "BSD-3"),
    ("ignition-startup", "ignition-startup", "2.4.0", "meson-build-system", "GPL-3.0+"),
    ("vapoursynth-plugin-waifu2x-ncnn-vulkan-git", "vapoursynth-plugin-waifu2x-ncnn-vulkan-git", "5.0", "cmake-build-system", "MIT"),
    ("psi-plus-nowebengine", "psi-plus-nowebengine", "1.5.2132", "cmake-build-system", "GPL-2.0+"),
    ("salome-kernel", "salome-kernel", "9.15.0", "cmake-build-system", "LGPL-2.1+"),
    ("wallpaperengine-gui", "wallpaperengine-gui", "1.1.8", "cmake-build-system", "MIT"),
    ("wallpaperengine-gui-git", "wallpaperengine-gui-git", "1.1.8", "cmake-build-system", "MIT"),
    ("calf-nogui-git", "calf-nogui-git", "0.90.8", "cmake-build-system", "GPL-2.0+"),
    ("sdrpp-vhfvoiceradio-git", "sdrpp-vhfvoiceradio-git", "0.1.0", "cmake-build-system", "GPL-3.0+"),
    ("plasma-nano", "plasma-nano", "6.6.3", "cmake-build-system", "GPL-2.0+"),
    ("svxlink-git", "svxlink-git", "25.05.1", "cmake-build-system", "GPL-2.0"),
    ("kdeconnect-no-mdns", "kdeconnect-no-mdns", "25.12.3", "cmake-build-system", "GPL-2.0+"),
    ("aura", "aura", "4.2.0", "cargo-build-system", "GPL-3.0+"),
    ("rowheel", "rowheel", "0.1.0", "cargo-build-system", "MIT"),
    ("faketty", "faketty", "1.0.20", "cargo-build-system", "Apache-2.0/MIT"),
]

# Build lookup: org_name -> (guix_name, version, build_system, license)
LOOKUP = {}
for org_name, guix_name, ver, bs, lic in RESOLVED:
    LOOKUP[org_name.lower()] = (guix_name, ver, bs, lic)


def main():
    with open(ORG_FILE, "r") as f:
        lines = f.readlines()

    # Pattern for header lines: ** FAILED 5830. gomu
    header_re = re.compile(r"^(\*\* )(FAILED|TODO|BLOCKED|DONE)( +\d+\.\s+)(\S+)(.*)")
    status_re = re.compile(r"^(\s+- Status: )BLOCKED: NEEDS_RECIPE_DESIGN")

    # Track which packages we've resolved (by org name, case-insensitive)
    resolved_set = set(k for k in LOOKUP.keys())
    found_headers = {}  # line_idx -> org_name
    changes = 0

    # First pass: find all header lines for our packages
    for i, line in enumerate(lines):
        m = header_re.match(line)
        if m:
            pkg_name = m.group(4).lower()
            status = m.group(2)
            if pkg_name in resolved_set and status in ("FAILED", "TODO", "BLOCKED"):
                found_headers[i] = pkg_name

    # Second pass: update headers and their status lines
    new_lines = list(lines)
    for hdr_idx, pkg_name in sorted(found_headers.items()):
        m = header_re.match(new_lines[hdr_idx])
        if m:
            guix_name, ver, bs, lic = LOOKUP[pkg_name]
            # Change FAILED/TODO/BLOCKED -> DONE, add tags
            new_header = (
                f"{m.group(1)}DONE{m.group(3)}{m.group(4)}"
                f"  :{PASS_ID}:recipe-generated:\n"
            )
            new_lines[hdr_idx] = new_header
            changes += 1

            # Find and update the Status line in next 8 lines
            for j in range(hdr_idx + 1, min(hdr_idx + 9, len(new_lines))):
                if new_lines[j].strip().startswith("- Status:"):
                    sm = status_re.match(new_lines[j])
                    if sm:
                        new_lines[j] = (
                            f"{sm.group(1)}DONE: NEEDS_RECIPE_DESIGN resolved"
                            f" — recipe in {PASS_ID}.scm"
                            f" ({guix_name} {ver}, {bs}, {lic})"
                            f" ({PASS_ID})\n"
                        )
                    break

    # Write atomically
    with tempfile.NamedTemporaryFile(
        mode="w", dir=".", prefix=".todo_update_", suffix=".org",
        delete=False
    ) as tmp:
        tmp.writelines(new_lines)
        tmp_path = tmp.name
    shutil.move(tmp_path, ORG_FILE)

    print(f"[{PASS_ID}] Updated {changes} entries in {ORG_FILE}")
    for pkg_name in sorted(resolved_set):
        found = pkg_name in [v for v in found_headers.values()]
        status = "UPDATED" if found else "NOT FOUND (may already be DONE)"
        print(f"  {pkg_name}: {status}")


if __name__ == "__main__":
    main()
