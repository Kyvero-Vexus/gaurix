#!/usr/bin/env python3
"""Update packages.scm to include deptree-resolver-260408g module."""

import os
import shutil
import tempfile
from pathlib import Path

RUN_ID = "deptree-resolver-260408g"
ROOT = Path(__file__).resolve().parent.parent
PACKAGES_SCM = ROOT / "guix" / "gaurix" / "packages.scm"

EXPORTS = [
    "llama-swap-bin", "llog-bin", "localias-bin", "log2ram", "logmonster-bin",
    "lstr-bin", "lx-bin", "magiskboot-bin", "mangcli-bin", "maptool-bin",
    "mcjoin", "median", "mercator-bin", "min-ed-launcher-bin", "mod-desktop-bin",
    "mongoclock", "monika-after-story", "monika-after-story-bin", "mping",
    "mynav-bin", "nav-cli", "nexttrace-bin", "norwester-otf", "noxdir-bin",
    "nvidia-gpu-exporter-bin", "obsidian-2-theme", "omnidotdev-cli-bin",
    "omnidotdev-eden-bin", "openide-bin", "openscad-attachable-text3d",
    "openscad-bosl2-git", "orbit-bin", "orbolay-bin", "otel-weaver-bin",
    "otf-arsenal", "otf-font-awesome-4", "otf-font-awesome-5", "otf-garamontio",
    "otf-garamontio-capo", "otf-geist", "otf-geist-mono", "otf-tesla",
    "ovrport-bin", "oyasumi-bin", "path-utils", "pent-bin", "pi-hole-web",
    "picsort-bin", "pistol-bin", "plist-bin", "popsicle-bin", "powerline-go-bin",
    "pxsum-bin", "qqqa-bin", "qui-bin", "radicle-httpd-bin", "rbackup",
    "recall-bin", "rep-bin", "repo-security-scanner-bin", "rexuiz-bin",
    "rimsort-bin", "rinetd", "scooter-bin", "seclists", "seristack-bin",
    "shadps4-qtlauncher-bin", "shc", "shim-signed", "slack", "slackdump-bin",
    "slides-bin",
]

def main():
    content = PACKAGES_SCM.read_text()

    # Idempotency check
    if f"(gaurix packages {RUN_ID})" in content:
        print(f"packages.scm: {RUN_ID} already present, skipping")
        return

    # 1. Add #:use-module imports after the last deptree-resolver-260408f entry
    marker = "#:use-module (gaurix packages deptree-resolver-260408f-blocked-notes)"
    idx = content.rfind(marker)
    if idx < 0:
        print("ERROR: could not find deptree-resolver-260408f-blocked-notes marker")
        return
    eol = content.index("\n", idx) + 1
    use_lines = (
        f"  #:use-module (gaurix packages {RUN_ID})\n"
        f"  #:use-module (gaurix packages {RUN_ID}-blocked-notes)\n"
    )
    content = content[:eol] + use_lines + content[eol:]

    # 2. Add exports before closing paren
    # Find the last ) in file
    last_paren = content.rstrip().rfind(")")
    if last_paren < 0:
        print("ERROR: could not find closing paren")
        return

    export_block = f"            ;; {RUN_ID}\n"
    for exp in sorted(EXPORTS):
        export_block += f"            {exp}\n"

    content = content[:last_paren] + export_block + content[last_paren:]

    # 3. Atomic write
    fd, tmp = tempfile.mkstemp(dir=str(ROOT), suffix=".scm.tmp")
    with os.fdopen(fd, "w") as f:
        f.write(content)
    shutil.move(tmp, str(PACKAGES_SCM))
    print(f"packages.scm updated with {RUN_ID} ({len(EXPORTS)} exports)")


if __name__ == "__main__":
    main()
