#!/usr/bin/env python3
"""
Recipe resolver pass: recipe-resolver-260418b
Updates todo_general_packages.org for 30 NEEDS_RECIPE_DESIGN packages.

Maps AUR/upstream package names to Guix recipe names in recipe-resolver-260418b.scm.
"""
import re
import shutil
import tempfile

PASS_ID = "recipe-resolver-260418b"
ORG_FILE = "todo_general_packages.org"

# (org_package_name, guix_name, version, build_system, license)
RESOLVED = [
    ("janet-lang-git", "janet-lang", "1.37.2", "gnu-build-system", "MIT"),
    ("go-mtpfs-git", "go-mtpfs", "1.0.0", "go-build-system", "BSD-3"),
    ("tiptop-cli", "tiptop-cli", "0.5.1", "pyproject-build-system", "MIT"),
    ("seqtui", "seqtui", "0.3.1", "cargo-build-system", "MIT"),
    ("seqtui-git", "seqtui", "0.3.1", "cargo-build-system", "MIT"),
    ("typeracer", "terminal-typeracer", "2.1.0", "cargo-build-system", "GPL-3.0+"),
    ("hyprland-workspaces", "hyprland-workspaces", "2.1.2", "cargo-build-system", "MIT"),
    ("leakdice-rust-git", "leakdice", "0.1.0", "cargo-build-system", "GPL-2.0"),
    ("imapgoose", "imapgoose", "0.3.0", "go-build-system", "ISC"),
    ("mf-cli", "mf-cli", "0.2.0", "cargo-build-system", "GPL-2.0"),
    ("bitbake", "bitbake", "2.9.3", "python-build-system", "MIT/GPL-2.0"),
    ("mvw", "mvw", "0.1.3", "python-build-system", "GPL-3.0"),
    ("tqftpserv-git", "tqftpserv", "0.3", "meson-build-system", "BSD-3"),
    ("wordlist-git", "wordlist-generator", "0.3.3", "cargo-build-system", "MIT"),
    ("fts", "fts-transfer", "1.4.0", "pyproject-build-system", "MIT"),
    ("gomu", "gomu", "2.1.0", "go-build-system", "MIT"),
    ("gonic", "gonic", "0.16.5", "go-build-system", "GPL-3.0+"),
    ("heirloom-doctools", "heirloom-doctools", "191015", "gnu-build-system", "CDDL-1.0"),
    ("wired", "wired-notify", "0.10.6", "cargo-build-system", "MIT"),
    ("ragnarwm", "ragnarwm", "1.0", "gnu-build-system", "GPL-3.0"),
    ("polybar-git", "polybar", "3.7.2", "cmake-build-system", "MIT"),
    ("telegram-bot-api-git", "telegram-bot-api", "8.3", "cmake-build-system", "BSL-1.0"),
    ("kst", "kst2", "2.0.8", "cmake-build-system", "GPL-2.0+"),
    ("vtun-ng", "vtun-ng", "0.4.0", "cargo-build-system", "GPL-3.0"),
    ("marble-marcher-ce", "marble-marcher-ce", "1.4.0", "cmake-build-system", "GPL-2.0"),
    ("supersayer", "supersayer", "0.2.0", "pyproject-build-system", "MIT"),
    ("project-monalisa-git", "project-monalisa", "1.0", "copy-build-system", "MIT"),
    ("catnap", "catnap", "1.3.4", "gnu-build-system", "MIT"),
    ("greetd-qtgreet", "greetd-qtgreet", "2.0.2", "cmake-build-system", "GPL-3.0"),
    ("virtualbmc", "virtualbmc", "3.2.0", "pyproject-build-system", "Apache-2.0"),
    ("fcitx5-meta", "fcitx5-configtool", "5.1.8", "cmake-build-system", "GPL-2.0+"),
]

# Build lookup: org_name -> (guix_name, version, build_system, license)
LOOKUP = {}
for org_name, guix_name, ver, bs, lic in RESOLVED:
    LOOKUP[org_name.lower()] = (guix_name, ver, bs, lic)


def main():
    with open(ORG_FILE, "r") as f:
        lines = f.readlines()

    # Pattern for header lines: ** FAILED 5830. gomu
    header_re = re.compile(r"^(\*\* )(FAILED|TODO|BLOCKED)( +\d+\.\s+)(\S+)(.*)")
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
                    else:
                        # Append resolution note even if status format differs
                        new_lines[j] = new_lines[j].rstrip() + "\n"
                        new_lines.insert(j + 1,
                            f"   - Status: DONE: NEEDS_RECIPE_DESIGN resolved"
                            f" — recipe in {PASS_ID}.scm"
                            f" ({guix_name} {ver}, {bs}, {lic})"
                            f" ({PASS_ID})\n"
                        )
                    break

    # Atomic write
    with tempfile.NamedTemporaryFile(mode="w", dir=".", suffix=".org",
                                     delete=False) as tmp:
        tmp.writelines(new_lines)
        tmp_name = tmp.name
    shutil.move(tmp_name, ORG_FILE)
    print(f"Updated {changes} package headers in {ORG_FILE}")


if __name__ == "__main__":
    main()
