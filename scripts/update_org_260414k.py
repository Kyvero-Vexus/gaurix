#!/usr/bin/env python3
"""
Deterministic org-file updater for recipe-resolver-260414k pass.
Resolves 30 NEEDS_RECIPE_DESIGN packages:
  - 7 recipes created (DONE)
  - 23 marked NEEDS_RECIPE_DESIGN_EXHAUSTED (BLOCKED)
"""

import re
import sys
import shutil
import tempfile
import os

ORG_FILE = "todo_general_packages.org"

# --- Updates to apply ---
# Format: (header_pattern, new_status_line, new_header_status)
# header_pattern: regex to match the ** BLOCKED N. name line
# new_status_line: status line to append after the section
# new_header_status: if not None, replace the header's TODO Status and BLOCKED tag

DONE_ITEMS = [
    # 7 recipes created
    (r'^\*\* BLOCKED 13081\. mihomo-alpha-git',
     '   - Status: DONE: Recipe added in recipe-resolver-260414k.scm (recipe-resolver-260414k)',
     'DONE'),
    (r'^\*\* BLOCKED 13054\. local-ai',
     '   - Status: DONE: Recipe added in recipe-resolver-260414k.scm (recipe-resolver-260414k)',
     'DONE'),
    (r'^\*\* BLOCKED 12971\. livebook',
     '   - Status: DONE: Recipe added in recipe-resolver-260414k.scm (recipe-resolver-260414k)',
     'DONE'),
    (r'^\*\* BLOCKED 12915\. video2x-git',
     '   - Status: DONE: Recipe added in recipe-resolver-260414k.scm (recipe-resolver-260414k)',
     'DONE'),
    (r'^\*\* BLOCKED 12533\. pandora-launcher',
     '   - Status: DONE: Recipe added in recipe-resolver-260414k.scm (recipe-resolver-260414k)',
     'DONE'),
    (r'^\*\* BLOCKED 12560\. alcom',
     '   - Status: DONE: Recipe added in recipe-resolver-260414k.scm (recipe-resolver-260414k)',
     'DONE'),
    (r'^\*\* BLOCKED 15612\. polymc-git',
     '   - Status: DONE: Recipe added in recipe-resolver-260414k.scm (recipe-resolver-260414k)',
     'DONE'),
]

EXHAUSTED_ITEMS = [
    # Header-based NEEDS_RECIPE_DESIGN items
    (r'^\*\* BLOCKED 10131\. dotnet-sdk-preview-bin',
     '   - Status: BLOCKED: NEEDS_RECIPE_DESIGN_EXHAUSTED — PROPRIETARY_BINARY: proprietary .NET SDK, license prohibits redistribution; A1: binary repack blocked by license; A2: source unavailable; A3: mono is different runtime (recipe-resolver-260414k)',
     None),
    (r'^\*\* BLOCKED 12803\. r8127-dkms',
     '   - Status: BLOCKED: NEEDS_RECIPE_DESIGN_EXHAUSTED — DKMS_KERNEL_MODULE: out-of-tree kernel module requires kernel source tree and DKMS infrastructure not available in Guix; A1: no pre-built .ko distribution; A2: Guix lacks DKMS framework; A3: kernel module packaging infeasible without full kernel source (recipe-resolver-260414k)',
     None),
    (r'^\*\* BLOCKED 12841\. antiafk-rbx-sober',
     '   - Status: BLOCKED: NEEDS_RECIPE_DESIGN_EXHAUSTED — FLATPAK_DEPENDENCY: requires Sober Flatpak runtime (proprietary Roblox Wine wrapper); A1: no standalone binary; A2: Flatpak runtime not packageable in Guix; A3: game-specific tool with no alternative runtime (recipe-resolver-260414k)',
     None),
    (r'^\*\* BLOCKED 12870\. clean-chroot-manager',
     '   - Status: BLOCKED: NEEDS_RECIPE_DESIGN_EXHAUSTED — ARCH_SPECIFIC: Arch Linux makechrootpkg wrapper, depends on devtools/pacman; A1: requires pacman ecosystem; A2: no equivalent Guix functionality; A3: fundamentally Arch-only tool (recipe-resolver-260414k)',
     None),
    (r'^\*\* BLOCKED 12893\. pacman-static',
     '   - Status: BLOCKED: NEEDS_RECIPE_DESIGN_EXHAUSTED — ARCH_SPECIFIC: statically linked Arch Linux pacman package manager; A1: requires libalpm and Arch infrastructure; A2: no cross-distro use case; A3: fundamentally Arch-only tool (recipe-resolver-260414k)',
     None),
    (r'^\*\* BLOCKED 12907\. firefly-iii',
     '   - Status: BLOCKED: NEEDS_RECIPE_DESIGN_EXHAUSTED — PHP_WEBAPP: Laravel PHP web application requiring Apache/nginx + MySQL/PostgreSQL; A1: no php-build-system in Guix; A2: 100+ Composer PHP dependencies unpackaged; A3: web app deployment model incompatible with Guix package paradigm (recipe-resolver-260414k)',
     None),
    (r'^\*\* BLOCKED 12911\. python-dlib-cuda',
     '   - Status: BLOCKED: NEEDS_RECIPE_DESIGN_EXHAUSTED — PROPRIETARY_CUDA: CUDA variant requires proprietary NVIDIA CUDA toolkit; A1: base dlib already in Guix (gnu packages machine-learning); A2: CUDA toolkit not in Guix (proprietary); A3: would need nonguix channel for CUDA support (recipe-resolver-260414k)',
     None),
    (r'^\*\* BLOCKED 12917\. servo-git',
     '   - Status: BLOCKED: NEEDS_RECIPE_DESIGN_EXHAUSTED — COMPLEX_RUST: massive Rust web engine with 500+ crate dependencies + SpiderMonkey; A1: cargo-build-system requires each crate individually packaged; A2: SpiderMonkey build is Firefox-level complexity; A3: vendored source tarball available but against Guix conventions (recipe-resolver-260414k)',
     None),
    (r'^\*\* BLOCKED 12920\. esp-idf',
     '   - Status: BLOCKED: NEEDS_RECIPE_DESIGN_EXHAUSTED — CROSS_COMPILER_SDK: IoT dev framework requiring Espressif custom Xtensa/RISC-V GCC toolchain; A1: custom cross-compiler not in Guix; A2: idf.py setup requires internet access (incompatible with Guix sandbox); A3: git submodule components downloaded at build time (recipe-resolver-260414k)',
     None),
    (r'^\*\* BLOCKED 12985\. lsfg-vk-git',
     '   - Status: BLOCKED: NEEDS_RECIPE_DESIGN_EXHAUSTED — PROPRIETARY_DEPENDENCY: Vulkan layer wrapping proprietary Windows Lossless Scaling DLL; A1: depends on non-free lossless.dll; A2: no Vulkan layer packaging precedent in Guix; A3: proprietary dependency makes it incompatible with Guix free-software policy (recipe-resolver-260414k)',
     None),
    (r'^\*\* BLOCKED 13026\. openutau',
     '   - Status: BLOCKED: NEEDS_RECIPE_DESIGN_EXHAUSTED — DOTNET_APP: .NET/C# singing synthesizer requiring .NET SDK; A1: no dotnet-build-system in Guix; A2: .NET SDK is proprietary Microsoft software; A3: NuGet package ecosystem not supported in Guix (recipe-resolver-260414k)',
     None),
    # Re-evaluated items (upgrading from NEEDS_RECIPE_DESIGN to EXHAUSTED)
    (r'^\*\* BLOCKED 3617\. aurto',
     '   - Status: BLOCKED: NEEDS_RECIPE_DESIGN_EXHAUSTED — ARCH_SPECIFIC: AUR auto-build tool depending on pacman/aurutils; A1: requires pacman ecosystem; A2: no cross-distro use case; A3: fundamentally Arch-only tool (recipe-resolver-260414k)',
     None),
    (r'^\*\* BLOCKED 3633\. ladybird-git',
     '   - Status: BLOCKED: NEEDS_RECIPE_DESIGN_EXHAUSTED — COMPLEX_DEPS: web browser engine with AUR-only deps (angle, simdutf-git, cpptrace); A1: heavy dependency chain requiring 10+ custom packages; A2: no pre-built binary releases; A3: rapid development pace makes packaging unstable (recipe-resolver-260414k)',
     None),
    (r'^\*\* BLOCKED 3636\. pamac-all',
     '   - Status: BLOCKED: NEEDS_RECIPE_DESIGN_EXHAUSTED — ARCH_SPECIFIC: Manjaro package manager GUI depending on libpamac-full/pacman; A1: requires pacman/libalpm; A2: Manjaro-specific functionality; A3: fundamentally Arch-ecosystem tool (recipe-resolver-260414k)',
     None),
    (r'^\*\* BLOCKED 3644\. lazarus-gtk2',
     '   - Status: BLOCKED: NEEDS_RECIPE_DESIGN_EXHAUSTED — MISSING_GUIX_DEPS: requires Free Pascal Compiler (fpc) not packaged in Guix; A1: fpc is a bootstrap compiler (needs itself to build); A2: no fpc package or importer in Guix; A3: Pascal ecosystem entirely absent from Guix (recipe-resolver-260414k)',
     None),
    (r'^\*\* BLOCKED 3645\. lyrionmusicserver',
     '   - Status: BLOCKED: NEEDS_RECIPE_DESIGN_EXHAUSTED — PERL_VERSION_PINNING: vendor build pinning Perl 5.40-5.43 with 200+ CPAN deps; A1: massive CPAN dependency tree unpackaged; A2: Perl version pinning incompatible with Guix single-Perl model; A3: vendor/ bundle approach against Guix conventions (recipe-resolver-260414k)',
     None),
    (r'^\*\* BLOCKED 3962\. mozillavpn-git',
     '   - Status: BLOCKED: NEEDS_RECIPE_DESIGN_EXHAUSTED — BUILD_SYSTEM_TOO_COMPLEX: Rust+Go+CMake+Qt6 triple-compiler build; A1: requires Qt6 modules not in Guix; A2: three separate build systems in one project; A3: Mozilla-specific Go networking stack (recipe-resolver-260414k)',
     None),
    (r'^\*\* BLOCKED 3994\. vrms-arch',
     '   - Status: BLOCKED: NEEDS_RECIPE_DESIGN_EXHAUSTED — ARCH_SPECIFIC: depends on pyalpm (Arch pacman Python bindings); A1: requires libalpm/pacman; A2: Arch-only utility for checking non-free packages; A3: no equivalent use case on Guix (recipe-resolver-260414k)',
     None),
    (r'^\*\* BLOCKED 3997\. bilibili',
     '   - Status: BLOCKED: NEEDS_RECIPE_DESIGN_EXHAUSTED — ELECTRON_APP: Electron/nvm/pnpm build chain; A1: no viable Electron packaging path in Guix; A2: nvm/pnpm not in Guix; A3: Electron apps require Chromium build infrastructure (recipe-resolver-260414k)',
     None),
    # Additional items from status-line pool
    (r'^\*\* BLOCKED 15922\. lceda-pro-bin',
     '   - Status: BLOCKED: NEEDS_RECIPE_DESIGN_EXHAUSTED — PROPRIETARY: proprietary Chinese EDA tool (LCEDA Pro/EasyEDA Pro); A1: no redistributable download URL; A2: proprietary closed-source; A3: requires online account activation (recipe-resolver-260414k)',
     None),
    (r'^\*\* BLOCKED 18341\. python-urllib3-future-git',
     '   - Status: BLOCKED: NEEDS_RECIPE_DESIGN_EXHAUSTED — MISSING_PYTHON_DEPS: requires h11+jh2+qh3 HTTP/2/3 libraries not in Guix; A1: 5+ unpackaged Python deps (h11, jh2, qh3, wassima); A2: complex C extension builds for HTTP/3; A3: niche fork with limited adoption (recipe-resolver-260414k)',
     None),
    (r'^\*\* BLOCKED 18784\. python-niquests-git',
     '   - Status: BLOCKED: NEEDS_RECIPE_DESIGN_EXHAUSTED — MISSING_PYTHON_DEPS: depends on python-urllib3-future+wassima not in Guix; A1: urllib3-future itself blocked (see #18341); A2: wassima requires Rust cryptography extensions; A3: transitive dep chain too deep (recipe-resolver-260414k)',
     None),
    (r'^\*\* BLOCKED 12916\. feishu-bin',
     '   - Status: BLOCKED: NEEDS_RECIPE_DESIGN_EXHAUSTED — PROPRIETARY: ByteDance Feishu/Lark client; A1: proprietary closed-source; A2: no stable versioned download URL; A3: requires ByteDance account and license agreement (recipe-resolver-260414k)',
     None),
]

def update_org_file():
    with open(ORG_FILE, 'r') as f:
        lines = f.readlines()

    all_updates = []
    for pattern, status_line, new_state in DONE_ITEMS:
        all_updates.append((pattern, status_line, new_state))
    for pattern, status_line, new_state in EXHAUSTED_ITEMS:
        all_updates.append((pattern, status_line, new_state))

    # Find line numbers for each pattern
    matches = []
    for pattern, status_line, new_state in all_updates:
        found = False
        for i, line in enumerate(lines):
            if re.match(pattern, line.rstrip()):
                matches.append((i, pattern, status_line, new_state))
                found = True
                break
        if not found:
            print(f"WARNING: Pattern not found: {pattern}", file=sys.stderr)

    # Sort by line number in reverse order (apply from bottom to top)
    matches.sort(key=lambda x: x[0], reverse=True)

    for line_idx, pattern, status_line, new_state in matches:
        # Find the end of this section (next ** header or EOF)
        section_end = len(lines)
        for j in range(line_idx + 1, len(lines)):
            if lines[j].startswith('** '):
                section_end = j
                break

        # Insert new status line before the section end
        insert_at = section_end
        # Find last non-empty line in section
        for j in range(section_end - 1, line_idx, -1):
            if lines[j].strip():
                insert_at = j + 1
                break

        lines.insert(insert_at, status_line + '\n')
        if new_state:
            lines.insert(insert_at + 1, f'   - TODO Status: {new_state}\n')

        # Update header if changing to DONE
        if new_state == 'DONE':
            old_header = lines[line_idx]
            new_header = old_header.replace('** BLOCKED', '** DONE', 1)
            # Remove [BLOCKED: ...] tag if present
            new_header = re.sub(r'\s*\[BLOCKED:.*?\]', '', new_header)
            lines[line_idx] = new_header
        elif new_state is None and 'EXHAUSTED' in status_line:
            # Update the header's BLOCKED tag to include EXHAUSTED
            old_header = lines[line_idx]
            # Extract the exhaustion reason
            reason_match = re.search(r'NEEDS_RECIPE_DESIGN_EXHAUSTED — ([^(]+)', status_line)
            if reason_match:
                reason_short = reason_match.group(1).strip()
                if len(reason_short) > 80:
                    reason_short = reason_short[:77] + '...'
                # Check if header already has a [BLOCKED: ...] tag
                if '[BLOCKED:' in old_header:
                    new_header = re.sub(
                        r'\[BLOCKED:.*?\]',
                        f'[BLOCKED: NEEDS_RECIPE_DESIGN_EXHAUSTED: {reason_short}]',
                        old_header
                    )
                else:
                    # Add tag before newline
                    new_header = old_header.rstrip() + f' [BLOCKED: NEEDS_RECIPE_DESIGN_EXHAUSTED: {reason_short}]\n'
                lines[line_idx] = new_header

    # Write atomically
    fd, tmp_path = tempfile.mkstemp(dir='.', suffix='.org.tmp')
    try:
        with os.fdopen(fd, 'w') as f:
            f.writelines(lines)
        shutil.move(tmp_path, ORG_FILE)
    except:
        os.unlink(tmp_path)
        raise

    print(f"Updated {len(matches)} entries in {ORG_FILE}")
    for line_idx, pattern, status_line, new_state in sorted(matches, key=lambda x: x[0]):
        state_str = new_state if new_state else 'EXHAUSTED'
        pkg = re.search(r'\d+\.\s+\S+', lines[line_idx]).group(0) if re.search(r'\d+\.\s+\S+', lines[line_idx]) else pattern
        print(f"  Line {line_idx+1}: {state_str}")

if __name__ == '__main__':
    update_org_file()
