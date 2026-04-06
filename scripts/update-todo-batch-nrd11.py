#!/usr/bin/env python3
"""Batch update todo_general_packages.org for NRD11 pass."""
import re, sys, shutil, tempfile, os

TODO = "todo_general_packages.org"

# Map: package_number -> (new_status_keyword, new_status_text)
updates = {
    # Compat aliases → DONE
    3886: ("DONE", "DONE: Compat alias `helixbinhx` inheriting Guix `helix` added to general-compat.scm; NRD11 pass 2026-04-06."),
    3874: ("DONE", "DONE: Compat alias `libwireplumber-4.0-compat` inheriting Guix `wireplumber` added to general-compat.scm; NRD11 pass 2026-04-06."),
    3895: ("DONE", "DONE: Compat alias `mediainfo-gui-qt` inheriting Guix `mediainfo` added to general-compat.scm; NRD11 pass 2026-04-06."),
    3897: ("DONE", "DONE: Compat alias `wlrobs-hg` inheriting Guix `obs-wlrobs` added to general-compat.scm; NRD11 pass 2026-04-06."),
    3900: ("DONE", "DONE: Compat alias `rpatool-git` inheriting Guix `rpatool` added to general-compat.scm; NRD11 pass 2026-04-06."),
    # Binary/copy recipes → DONE
    3871: ("DONE", "DONE: Recipe in cron-c79f127f-r22-w03-nrd11.scm (copy-build-system, SourceForge binary v1.233.1.0); NRD11 pass 2026-04-06."),
    3879: ("DONE", "DONE: Recipe in cron-c79f127f-r22-w03-nrd11.scm (copy-build-system, prebuilt binary v3.37.2); NRD11 pass 2026-04-06."),
    3887: ("DONE", "DONE: Recipe in cron-c79f127f-r22-w03-nrd11.scm (copy-build-system, prebuilt binary v0.2.2 from charmbracelet); NRD11 pass 2026-04-06."),
    3903: ("DONE", "DONE: Recipe in cron-c79f127f-r22-w03-nrd11.scm (copy-build-system, prebuilt binary v1.0.21 from ventoy/PXE); NRD11 pass 2026-04-06."),
    3902: ("DONE", "DONE: Recipe in cron-c79f127f-r22-w03-nrd11.scm (copy-build-system, GRUB2 theme files from github.com/fghibellini/arch-silence); NRD11 pass 2026-04-06."),
    # Python recipe → DONE
    3883: ("DONE", "DONE: Recipe in cron-c79f127f-r22-w03-nrd11.scm (python-build-system, v0.0.10 from codeberg.org/necklace/libray); NRD11 pass 2026-04-06."),
    # Source-reference recipes → DONE
    3888: ("DONE", "DONE: Source-reference recipe in cron-c79f127f-r22-w03-nrd11.scm (cmake-build-system, v2.2.0; needs Qt5/FFmpeg/SDL2 dep packaging); NRD11 pass 2026-04-06."),
    3898: ("DONE", "DONE: Source-reference recipe in cron-c79f127f-r22-w03-nrd11.scm (go-build-system, v0.50.2; needs Go module dep packaging); NRD11 pass 2026-04-06."),
    3901: ("DONE", "DONE: Source-reference recipe in cron-c79f127f-r22-w03-nrd11.scm (cargo-build-system, v0.1.16; needs Rust cargo dep packaging); NRD11 pass 2026-04-06."),
    3891: ("DONE", "DONE: Source-reference recipe in cron-c79f127f-r22-w03-nrd11.scm (gnu-build-system, v1.0rc; needs npm/TypeScript build toolchain); NRD11 pass 2026-04-06."),
    # Re-blocked with reasons
    3872: ("BLOCKED", "BLOCKED: NIM_ECOSYSTEM_MISSING | Chawan needs Nim compiler chain with C FFI bindings (brotli, libssh2, openssl); batch-infeasible."),
    3875: ("BLOCKED", "BLOCKED: DKMS_KERNEL_MODULE | rtl8821ce is a DKMS kernel module; Guix uses linux-module-build-system requiring kernel-specific compilation."),
    3877: ("BLOCKED", "BLOCKED: PROPRIETARY_BINARY_DEB | Brother printer driver from .deb packages; non-free EULA + i386 binary extraction + CUPS wrapper."),
    3876: ("BLOCKED", "BLOCKED: ELECTRON_RUNTIME_MISSING | Cherry Studio needs electron40 runtime; Guix has no standalone Electron package."),
    3873: ("BLOCKED", "BLOCKED: TAURI_WEBKIT2GTK_DEPS | Portmaster is a Tauri app needing webkit2gtk-4.1 + libappindicator + complex patchelf."),
    3880: ("BLOCKED", "BLOCKED: NPM_NATIVE_DEPS | Audiobookshelf is Node.js with native better-sqlite3 C++ addon; node-build-system cannot handle this."),
    3892: ("BLOCKED", "BLOCKED: DOWNLOAD_FAILED | Sparrow Wallet v2.4.2 x86_64 tarball URL returned 404; also needs JRE wrapper."),
    3896: ("BLOCKED", "BLOCKED: DOWNLOAD_FAILED | Streamlink Twitch GUI v2.5.3 linux64 tarball URL returned 404; NW.js app needs complex patching."),
    3884: ("BLOCKED", "BLOCKED: MISSING_DEP_CHAIN | nsz-git needs python-enlighten which needs python-prefixed; two-deep missing dep chain."),
    3885: ("BLOCKED", "BLOCKED: MISSING_DEP_FORTUNE_MOD | fortune-mod-portal-game build uses strfile from fortune-mod which is not in Guix."),
    3889: ("BLOCKED", "BLOCKED: MASSIVE_BUILD_INFRA | LLVM BOLT requires full LLVM monorepo rebuild (~2GB source, hours of compilation)."),
    3899: ("BLOCKED", "BLOCKED: DOWNLOAD_FAILED | jira-cli v1.7.0 tarball URL returned 404; Go module deps would also need packaging."),
    3881: ("BLOCKED", "BLOCKED: DOWNLOAD_FAILED | simple-thumbnailer-stl v0.4.0 GitLab archive URL returned 404; Rust cargo deps also needed."),
    3893: ("BLOCKED", "BLOCKED: DOWNLOAD_FAILED | vfstool-git v2.5 tarball URL returned 404 (tried both tag patterns); Rust cargo deps also needed."),
    3894: ("BLOCKED", "BLOCKED: DOWNLOAD_FAILED | kate-discord-rpc-git main.tar.gz URL returned 404; repo may be removed/private."),
}

with open(TODO, 'r') as f:
    lines = f.readlines()

for pkg_num, (new_kw, new_status) in updates.items():
    # Find the header line for this package number
    header_pat = re.compile(rf'^\*\* (BLOCKED|DONE|FAILED) {pkg_num}\. ')
    found = False
    for i, line in enumerate(lines):
        m = header_pat.match(line)
        if m:
            # Update header keyword
            lines[i] = re.sub(r'^\*\* (BLOCKED|DONE|FAILED)', f'** {new_kw}', line)
            # Find the Status line (within next 5 lines)
            for j in range(i+1, min(i+6, len(lines))):
                if lines[j].strip().startswith('- Status:'):
                    lines[j] = f'   - Status: {new_status}\n'
                    found = True
                    break
            # Also update TODO Status line
            for j in range(i+1, min(i+8, len(lines))):
                if lines[j].strip().startswith('- TODO Status:'):
                    lines[j] = f'   - TODO Status: {new_kw}\n'
                    break
            break
    if not found:
        print(f"WARNING: Could not find package #{pkg_num}", file=sys.stderr)

# Atomic write
fd, tmp = tempfile.mkstemp(dir='.', suffix='.org')
with os.fdopen(fd, 'w') as f:
    f.writelines(lines)
shutil.move(tmp, TODO)
print(f"Updated {len(updates)} entries in {TODO}")
