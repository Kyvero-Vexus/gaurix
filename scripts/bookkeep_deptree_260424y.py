#!/usr/bin/env python3
"""
Bookkeeping for deptree-resolver-260424y.

Updates:
- reports/*.json (selection, aur-lookup, summary)
- todo_general_packages.org (status changes)
- guix/gaurix/packages.scm (pass comment)
- guix/gaurix/packages/general-compat.scm (imports + re-exports)
"""

import json
import re
import tempfile
import shutil
from datetime import datetime, timezone
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
ORG_FILE = ROOT / "todo_general_packages.org"
AUR_CACHE = ROOT / "data" / "aur-cache" / "packages-meta-ext-v1.json"
PACKAGES_SCM = ROOT / "guix" / "gaurix" / "packages.scm"
GENERAL_COMPAT = ROOT / "guix" / "gaurix" / "packages" / "general-compat.scm"

PASS_ID = "deptree-resolver-260424y"
TIMESTAMP = datetime.now(timezone.utc).isoformat()

# Packages with new recipes
RESOLVED = {
    "wooting-udev": {
        "scm_name": "wooting-udev",
        "version": "1.0.1",
        "build_system": "trivial-build-system",
        "license": "gpl3+",
    },
    "lamzu-maya-x-udev": {
        "scm_name": "lamzu-maya-x-udev",
        "version": "1.0.1",
        "build_system": "trivial-build-system",
        "license": "gpl3+",
    },
    "udiskie-systemd-git": {
        "scm_name": "udiskie-systemd",
        "version": "0.0.1",
        "build_system": "copy-build-system",
        "license": "public-domain",
    },
    "neoforge-server": {
        "scm_name": "neoforge-server",
        "version": "21.1.172",
        "build_system": "copy-build-system",
        "license": "lgpl2.1+",
    },
    "pixelflasher": {
        "scm_name": "pixelflasher",
        "version": "9.0.2.0",
        "build_system": "copy-build-system",
        "license": "gpl3+",
    },
}

# Packages with deleted AUR repos
AUR_DELETED = [
    "celeste64", "clspv-git", "codeblocks-svn", "dotnet-runtime-5.0-bin",
    "dotnet-runtime-6.0-bin", "elp", "feather-music-git", "ffmpeg-full-git",
    "huawei-me936-udev", "kodi-addon-pvr-hts", "libga68-snapshot",
    "libgfortran-snapshot", "libgnat-snapshot", "libgo-snapshot",
    "realesrgan-ncnn-vulkan", "shadps4-git", "smuxi-server",
    "systemd-ukify-git", "thunderbird-globalmenu",
]


def load_aur_cache():
    """Load AUR metadata."""
    with open(AUR_CACHE, "r") as f:
        data = json.load(f)
    return {p["Name"]: p for p in data}


def extract_blocked_packages():
    """Extract BLOCKED package names and numbers from org file."""
    blocked = {}
    pattern = re.compile(r"^\*\* BLOCKED (\d+)\. (\S+)")
    with open(ORG_FILE, "r") as f:
        for line in f:
            m = pattern.match(line)
            if m:
                num = int(m.group(1))
                name = m.group(2)
                blocked[name] = num
    return blocked


def generate_reports(blocked, aur_by_name):
    """Generate selection, aur-lookup, and summary JSON files."""
    # Build selection data
    selection = []
    aur_lookup = {}
    for name, num in sorted(blocked.items(), key=lambda x: x[1]):
        aur = aur_by_name.get(name, {})
        entry = {
            "name": name,
            "number": num,
            "in_aur": name in aur_by_name,
            "version": aur.get("Version", ""),
            "description": aur.get("Description", ""),
            "url": aur.get("URL", ""),
            "license": aur.get("License", []),
            "depends": aur.get("Depends", []),
            "makedepends": aur.get("MakeDepends", []),
        }
        if name in RESOLVED:
            entry["status"] = "DONE"
        elif name in AUR_DELETED:
            entry["status"] = "AUR_REPO_DELETED"
        else:
            entry["status"] = "BLOCKED"
        selection.append(entry)
        if name in aur_by_name:
            aur_lookup[name] = aur

    # Write selection JSON
    sel_path = ROOT / "reports" / f"{PASS_ID}-selection.json"
    with open(sel_path, "w") as f:
        json.dump({"timestamp": TIMESTAMP, "pass_id": PASS_ID,
                   "selection": selection}, f, indent=2)
    print(f"  Written: {sel_path}")

    # Write AUR lookup JSON
    aur_path = ROOT / "reports" / f"{PASS_ID}-aur-lookup.json"
    with open(aur_path, "w") as f:
        json.dump(aur_lookup, f, indent=2)
    print(f"  Written: {aur_path}")

    # Write summary JSON
    summary = {
        "timestamp": TIMESTAMP,
        "pass_id": PASS_ID,
        "total_blocked": len(blocked),
        "resolved": len(RESOLVED),
        "aur_deleted": len(AUR_DELETED),
        "remaining_blocked": len(blocked) - len(RESOLVED) - len(AUR_DELETED),
        "resolved_names": list(RESOLVED.keys()),
        "aur_deleted_names": AUR_DELETED,
    }
    sum_path = ROOT / "reports" / f"{PASS_ID}-summary.json"
    with open(sum_path, "w") as f:
        json.dump(summary, f, indent=2)
    print(f"  Written: {sum_path}")


def update_org_file():
    """Update todo_general_packages.org with status changes."""
    lines = []
    blocked_pattern = re.compile(r"^(\*\* BLOCKED (\d+)\. (\S+))(.*)")
    changes = 0

    with open(ORG_FILE, "r") as f:
        content = f.readlines()

    i = 0
    while i < len(content):
        line = content[i]
        m = blocked_pattern.match(line)
        if m:
            full_match = m.group(0)
            num = int(m.group(2))
            name = m.group(3)
            rest = m.group(4)

            if name in RESOLVED:
                # Change BLOCKED -> DONE
                info = RESOLVED[name]
                new_header = (
                    f"** DONE {num}. {name}{rest}"
                    f"  :{PASS_ID}:recipe-generated:\n"
                )
                lines.append(new_header)
                changes += 1

                # Find the right place to insert status line
                i += 1
                inserted = False
                while i < len(content) and not content[i].startswith("** "):
                    lines.append(content[i])
                    if not inserted and content[i].strip().startswith("- Status:"):
                        # Insert our status after existing status lines
                        pass
                    if not inserted and (
                        content[i].strip().startswith("- TODO Status:")
                        or content[i].strip().startswith("- Difficulty:")
                        or (i + 1 < len(content) and content[i + 1].startswith("** "))
                    ):
                        status_line = (
                            f"   - Status: DONE: Recipe in {PASS_ID}.scm "
                            f"({info['scm_name']} v{info['version']}, "
                            f"{info['build_system']}, {info['license']}) "
                            f"({PASS_ID})\n"
                        )
                        lines.append(status_line)
                        inserted = True
                    i += 1
                if not inserted:
                    status_line = (
                        f"   - Status: DONE: Recipe in {PASS_ID}.scm "
                        f"({info['scm_name']} v{info['version']}, "
                        f"{info['build_system']}, {info['license']}) "
                        f"({PASS_ID})\n"
                    )
                    lines.append(status_line)
                continue

            elif name in AUR_DELETED:
                # Keep as BLOCKED but add AUR_REPO_DELETED tag
                if f":{PASS_ID}:" not in rest:
                    new_header = f"{full_match}  :{PASS_ID}:\n"
                else:
                    new_header = line
                lines.append(new_header)
                changes += 1

                # Insert/update status
                i += 1
                inserted = False
                while i < len(content) and not content[i].startswith("** "):
                    lines.append(content[i])
                    if not inserted and (
                        content[i].strip().startswith("- TODO Status:")
                        or (i + 1 < len(content) and content[i + 1].startswith("** "))
                    ):
                        lines.append(
                            f"   - Status: BLOCKED: AUR_REPO_DELETED: "
                            f"AUR git repository is empty/deleted as of "
                            f"2026-04-25 ({PASS_ID})\n"
                        )
                        inserted = True
                    i += 1
                if not inserted:
                    lines.append(
                        f"   - Status: BLOCKED: AUR_REPO_DELETED: "
                        f"AUR git repository is empty/deleted as of "
                        f"2026-04-25 ({PASS_ID})\n"
                    )
                continue

            else:
                # Remaining BLOCKED: add pass tag
                if f":{PASS_ID}:" not in rest:
                    new_header = f"{full_match}  :{PASS_ID}:\n"
                    lines.append(new_header)
                    changes += 1
                else:
                    lines.append(line)
                i += 1
                continue
        else:
            lines.append(line)
            i += 1

    # Atomic write
    fd, tmp_path = tempfile.mkstemp(dir=str(ROOT), suffix=".org.tmp")
    try:
        with open(tmp_path, "w") as f:
            f.writelines(lines)
        shutil.move(tmp_path, str(ORG_FILE))
        print(f"  Updated {ORG_FILE}: {changes} entries modified")
    except Exception:
        Path(tmp_path).unlink(missing_ok=True)
        raise


def update_packages_scm():
    """Add pass comment to packages.scm."""
    with open(PACKAGES_SCM, "r") as f:
        content = f.read()

    comment = (
        f"            ;; {PASS_ID}: 100 BLOCKED evaluated "
        f"(5 recipes, 19 AUR_REPO_DELETED, 76 remain BLOCKED)\n"
    )

    # Insert after (define-module line
    marker = "(define-module (gaurix packages)\n"
    if marker in content:
        content = content.replace(marker, marker + comment, 1)
    else:
        # Try alternate form
        content = content.replace(
            "(define-module (gaurix packages)",
            f"(define-module (gaurix packages)\n{comment.rstrip()}", 1
        )

    fd, tmp_path = tempfile.mkstemp(dir=str(ROOT), suffix=".scm.tmp")
    try:
        with open(tmp_path, "w") as f:
            f.write(content)
        shutil.move(tmp_path, str(PACKAGES_SCM))
        print(f"  Updated {PACKAGES_SCM}")
    except Exception:
        Path(tmp_path).unlink(missing_ok=True)
        raise


def update_general_compat():
    """Add import and re-exports to general-compat.scm."""
    with open(GENERAL_COMPAT, "r") as f:
        content = f.read()

    # Add use-module import
    import_line = f"  #:use-module (gaurix packages {PASS_ID})\n"
    # Find the last #:use-module line and add after it
    lines = content.split("\n")
    new_lines = []
    last_use_module_idx = -1
    for idx, line in enumerate(lines):
        if "#:use-module" in line:
            last_use_module_idx = idx

    for idx, line in enumerate(lines):
        new_lines.append(line)
        if idx == last_use_module_idx:
            new_lines.append(import_line.rstrip())

    # Add re-exports at the end
    export_names = [info["scm_name"] for info in RESOLVED.values()]
    re_exports = [
        "",
        f"; {PASS_ID} recipes",
    ]
    for name in export_names:
        re_exports.append(f"(re-export {name})")

    new_lines.extend(re_exports)

    fd, tmp_path = tempfile.mkstemp(dir=str(ROOT), suffix=".scm.tmp")
    try:
        with open(tmp_path, "w") as f:
            f.write("\n".join(new_lines))
        shutil.move(tmp_path, str(GENERAL_COMPAT))
        print(f"  Updated {GENERAL_COMPAT}")
    except Exception:
        Path(tmp_path).unlink(missing_ok=True)
        raise


def main():
    print(f"=== Bookkeeping for {PASS_ID} ===")
    print(f"Timestamp: {TIMESTAMP}")

    print("\n1. Loading AUR cache...")
    aur_by_name = load_aur_cache()
    print(f"   Loaded {len(aur_by_name)} packages")

    print("\n2. Extracting BLOCKED packages...")
    blocked = extract_blocked_packages()
    print(f"   Found {len(blocked)} BLOCKED packages")

    print("\n3. Generating report JSONs...")
    generate_reports(blocked, aur_by_name)

    print("\n4. Updating org file...")
    update_org_file()

    print("\n5. Updating packages.scm...")
    update_packages_scm()

    print("\n6. Updating general-compat.scm...")
    update_general_compat()

    print(f"\n=== Done ===")
    print(f"Resolved: {len(RESOLVED)} packages")
    print(f"AUR deleted: {len(AUR_DELETED)} packages")
    print(f"Remaining BLOCKED: {len(blocked) - len(RESOLVED) - len(AUR_DELETED)}")

    return 0


if __name__ == "__main__":
    exit(main())
