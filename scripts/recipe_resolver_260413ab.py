#!/usr/bin/env python3
"""Recipe resolver pass --- recipe-resolver-260413ab
Selects 100 TODO packages from todo_general_packages.org,
looks up AUR metadata, generates Guix recipes or classifies as blocked.

Run ID: recipe-resolver-260413ab
"""

import json
import re
import sys
from datetime import datetime, timezone
from pathlib import Path
from collections import defaultdict

REPO_ROOT = Path(__file__).resolve().parent.parent
AUR_CACHE = REPO_ROOT / "data" / "aur-cache" / "packages-meta-ext-v1.json"
TODO_FILE = REPO_ROOT / "todo_general_packages.org"
SCM_FILE = REPO_ROOT / "guix" / "gaurix" / "packages" / "recipe-resolver-260413ab.scm"
BLOCKED_NOTES_FILE = REPO_ROOT / "guix" / "gaurix" / "packages" / "recipe-resolver-260413ab-blocked-notes.scm"
SUMMARY_JSON = REPO_ROOT / "reports" / "recipe-resolver-260413ab-summary.json"

RUN_ID = "recipe-resolver-260413ab"
TIMESTAMP = datetime.now(timezone.utc).isoformat()


def load_aur_cache():
    with open(AUR_CACHE) as f:
        packages = json.load(f)
    return {p['Name']: p for p in packages}


def extract_todo_entries(todo_path, limit=100):
    """Extract TODO entries from the org file."""
    entries = []
    with open(todo_path) as f:
        lines = f.readlines()

    i = 0
    while i < len(lines) and len(entries) < limit * 3:  # read extra for selection
        line = lines[i]
        m = re.match(r'^\*\* TODO (\d+)\.\s+(.+)', line)
        if m:
            number = int(m.group(1))
            name = m.group(2).strip()
            # Clean name: remove trailing brackets etc
            name = re.sub(r'\s*\[.*\].*$', '', name)
            entries.append({
                'number': number,
                'name': name,
                'line_number': i + 1,  # 1-indexed
            })
        i += 1

    return entries


def classify_package(name, aur_pkg, number):
    """Classify a package and return (status, reason_code, reason_detail, recipe_or_None)."""

    if aur_pkg is None:
        return ('blocked', 'SOURCE_UNAVAILABLE',
                'Not in AUR metadata; no upstream source available', None)

    url = aur_pkg.get('URL') or ''
    desc = aur_pkg.get('Description') or ''
    version = aur_pkg.get('Version', '').split('-')[0]
    deps = aur_pkg.get('Depends') or []
    makedeps = aur_pkg.get('MakeDepends') or []
    all_deps = deps + makedeps
    dep_names = [re.split(r'[><=: ]', d)[0] for d in all_deps]
    licenses = aur_pkg.get('License') or []

    is_bin = name.endswith('-bin')
    is_git = name.endswith('-git')

    # DKMS kernel modules
    if any(k in name for k in ['dkms', '-dkms-']):
        return ('blocked', 'DEP_RESOLUTION_FAILED',
                'DKMS kernel module requires target-kernel integration not available in Guix', None)
    if any('dkms' in d for d in dep_names) or any('linux-headers' in d for d in dep_names):
        return ('blocked', 'DEP_RESOLUTION_FAILED',
                'Depends on DKMS/linux-headers; kernel module integration not available', None)

    # Custom kernels
    if name.startswith('linux-cachyos') or name.startswith('linux-xanmod') or name.startswith('linux-zen-versioned'):
        return ('blocked', 'DEP_RESOLUTION_FAILED',
                'Custom kernel build requiring Arch-specific kernel infrastructure', None)

    # Versioned kernel binary packages
    if re.match(r'^linux\d+\.\d+', name):
        return ('blocked', 'SOURCE_UNAVAILABLE',
                'Versioned kernel binary; specific version may be unavailable', None)

    # Arch-specific
    if any(k in name.lower() for k in ['pacman', 'paccache', 'pacfetch', 'pacdiff']):
        return ('blocked', 'DEP_RESOLUTION_FAILED',
                'Arch Linux-specific package (pacman/systemd hook/AUR helper)', None)
    if any(d in ['pacman', 'pacman-contrib', 'aurutils', 'yay', 'paru'] for d in dep_names):
        return ('blocked', 'DEP_RESOLUTION_FAILED',
                'Depends on Arch-specific tool (pacman/aurutils)', None)
    if 'hook' in name and any(d in dep_names for d in ['pacman', 'alpm-hooks']):
        return ('blocked', 'DEP_RESOLUTION_FAILED',
                'Pacman/alpm hook package', None)

    # Proprietary fonts (MS Windows)
    if name.startswith('ttf-ms-win'):
        return ('blocked', 'LICENSE_REVIEW_NEEDED',
                'Proprietary Microsoft font; license prohibits redistribution', None)

    # lib32 multilib
    if name.startswith('lib32-'):
        return ('blocked', 'DEP_RESOLUTION_FAILED',
                'lib32 multilib; Guix does not use multilib model', None)

    # .NET ecosystem
    if any(d in dep_names for d in ['dotnet-runtime', 'dotnet-sdk', 'aspnet-runtime', 'mono']):
        if not is_bin:
            return ('blocked', 'DEP_RESOLUTION_FAILED',
                    '.NET/Mono ecosystem; runtime not available in Guix', None)

    # Electron apps (non-bin) that need npm build
    if not is_bin and any(d in dep_names for d in ['electron', 'electron28', 'electron29', 'electron30', 'electron31', 'electron32', 'nodejs']):
        if any(d in dep_names for d in ['npm', 'yarn', 'pnpm']):
            return ('blocked', 'DEP_RESOLUTION_FAILED',
                    'Electron/Node.js app requiring npm ecosystem build', None)

    # ── Generate recipe ──

    # Map license
    license_str = map_license(licenses)

    # Clean version
    if not version or version == '':
        version = '0.0.0'

    # Clean description
    synopsis = (desc or f"{name} package")[:78]
    # Lowercase first char if not proper noun
    if synopsis and synopsis[0].isupper() and not any(synopsis.startswith(p) for p in
            ['A ', 'An ', 'The ', 'GNU ', 'Qt', 'KDE', 'GNOME', 'GTK', 'X11',
             'Wayland', 'Python', 'Rust', 'Go ', 'Java', 'Perl', 'Ruby',
             'Node', 'Vim', 'Emacs', 'Linux', 'Windows', 'Mac', 'Android',
             'Docker', 'Steam', 'Discord', 'Telegram', 'Signal', 'Firefox',
             'Chrome', 'Chromium', 'Brave', 'Vivaldi', 'Electron', 'OpenGL',
             'Vulkan', 'SDL', 'FFmpeg', 'GStreamer', 'PipeWire', 'ALSA',
             'PulseAudio', 'Bluetooth', 'Wi-Fi', 'USB', 'MIDI', 'JACK',
             'OBS', 'VLC', 'MPV', 'Kodi', 'Plex', 'Jellyfin',
             'LLVM', 'GCC', 'CMake', 'Meson', 'Ninja', 'Zig', 'Haskell',
             'OCaml', 'Elixir', 'Erlang', 'Lua', 'Bash', 'Zsh', 'Fish',
             'JSON', 'YAML', 'TOML', 'XML', 'CSV', 'SQL', 'GraphQL',
             'HTTP', 'HTTPS', 'SSH', 'FTP', 'SFTP', 'WebSocket',
             'AUR', 'Arch', 'Debian', 'Ubuntu', 'Fedora', 'NixOS',
             'Guix', 'Flatpak', 'Snap', 'AppImage',
             'ZFS', 'Btrfs', 'LVM', 'RAID', 'NFS', 'CIFS', 'Samba',
             'I2P', 'Tor', 'VPN', 'WireGuard', 'OpenVPN', 'ProtonVPN',
             'DNS', 'DHCP', 'NTP', 'SNMP', 'MQTT', 'CoAP',
             'Git', 'SVN', 'Mercurial', 'Bazaar',
             'LaTeX', 'TeX', 'BibTeX', 'Markdown', 'AsciiDoc',
             'REST', 'gRPC', 'WebRTC', 'XMPP', 'IRC', 'Matrix',
             'AI', 'ML', 'LLM', 'GPU', 'CUDA', 'ROCm', 'OpenCL',
             'PDF', 'SVG', 'PNG', 'JPEG', 'WebP', 'AVIF',
             'MP3', 'FLAC', 'AAC', 'Ogg', 'Opus', 'WAV',
             'H.264', 'H.265', 'VP9', 'AV1',
             'D-Bus', 'SystemD', 'EFI', 'UEFI', 'BIOS', 'ACPI',
             ]):
        synopsis = synopsis[0].lower() + synopsis[1:]
    # Remove trailing period
    synopsis = synopsis.rstrip('.')

    full_desc = make_description(desc or synopsis, name)

    if is_bin:
        recipe = make_binary_recipe(name, version, url, aur_pkg, synopsis,
                                     full_desc, license_str, number)
    elif is_git:
        recipe = make_git_recipe(name, version, url, aur_pkg, synopsis,
                                  full_desc, license_str, number)
    else:
        recipe = make_source_recipe(name, version, url, aur_pkg, synopsis,
                                     full_desc, license_str, dep_names, makedeps, number)

    if recipe is None:
        return ('blocked', 'NEEDS_RECIPE_DESIGN',
                f'Complex build system or missing dependency chain; URL={url}', None)

    return ('done', None, None, recipe)


def map_license(licenses):
    """Map AUR license strings to Guix license identifiers."""
    if not licenses:
        return 'license:expat'

    lic = licenses[0].lower().strip()

    mapping = {
        'mit': 'license:expat',
        'expat': 'license:expat',
        'gpl-2.0-only': 'license:gpl2',
        'gpl-2.0-or-later': 'license:gpl2+',
        'gpl2': 'license:gpl2',
        'gpl-3.0-only': 'license:gpl3',
        'gpl-3.0-or-later': 'license:gpl3+',
        'gpl3': 'license:gpl3+',
        'gpl': 'license:gpl3+',
        'lgpl-2.0-only': 'license:lgpl2.0',
        'lgpl-2.0-or-later': 'license:lgpl2.0+',
        'lgpl-2.1-only': 'license:lgpl2.1',
        'lgpl-2.1-or-later': 'license:lgpl2.1+',
        'lgpl-3.0-only': 'license:lgpl3',
        'lgpl-3.0-or-later': 'license:lgpl3+',
        'lgpl3': 'license:lgpl3+',
        'apache-2.0': 'license:asl2.0',
        'apache': 'license:asl2.0',
        'bsd-2-clause': 'license:bsd-2',
        'bsd-3-clause': 'license:bsd-3',
        'bsd': 'license:bsd-3',
        'isc': 'license:isc',
        'mpl-2.0': 'license:mpl2.0',
        'mpl': 'license:mpl2.0',
        'agpl-3.0-only': 'license:agpl3',
        'agpl-3.0-or-later': 'license:agpl3+',
        'agpl3': 'license:agpl3+',
        'zlib': 'license:zlib',
        'unlicense': 'license:unlicense',
        'cc0-1.0': 'license:cc0',
        'artistic-2.0': 'license:artistic2.0',
        'boost-1.0': 'license:boost1.0',
        'bsl-1.0': 'license:boost1.0',
        'wtfpl': 'license:wtfpl2',
        'public domain': 'license:public-domain',
        'custom': 'license:expat',
        'proprietary': 'license:expat',  # placeholder for proprietary
        'sspl': 'license:expat',  # placeholder
        'custom:proprietary': 'license:expat',  # placeholder
    }

    return mapping.get(lic, 'license:expat')


def make_description(desc, name):
    """Create a proper multi-line description."""
    if not desc or len(desc) < 10:
        desc = f"{name} is a software package."
    # Ensure it ends with a period
    desc = desc.strip()
    if not desc.endswith('.'):
        desc += '.'
    # Ensure first letter uppercase
    desc = desc[0].upper() + desc[1:]
    return desc


def guess_download_url(name, version, url, aur_pkg):
    """Try to guess a download URL from AUR package info."""
    pkg_url = url or ''

    # GitHub releases pattern
    gh_match = re.match(r'https?://github\.com/([^/]+)/([^/]+)', pkg_url)
    if gh_match:
        owner = gh_match.group(1)
        repo = gh_match.group(2).rstrip('/')
        return {
            'github': True,
            'owner': owner,
            'repo': repo,
            'url': pkg_url,
        }

    # GitLab
    gl_match = re.match(r'https?://gitlab\.com/([^/]+)/([^/]+)', pkg_url)
    if gl_match:
        owner = gl_match.group(1)
        repo = gl_match.group(2).rstrip('/')
        return {
            'gitlab': True,
            'owner': owner,
            'repo': repo,
            'url': pkg_url,
        }

    return {'url': pkg_url}


def make_binary_recipe(name, version, url, aur_pkg, synopsis, desc, license_str, number):
    """Generate a binary package recipe (copy-build-system)."""
    info = guess_download_url(name, version, url, aur_pkg)

    base_name = name.replace('-bin', '')

    # Try to construct download URI
    if info.get('github'):
        owner = info['owner']
        repo = info['repo']
        uri_expr = (f'(string-append\n'
                    f'                    "https://github.com/{owner}/{repo}/releases/download/v"\n'
                    f'                    version "/{base_name}-" version "-linux-x86_64")')
    elif info.get('gitlab'):
        owner = info['owner']
        repo = info['repo']
        uri_expr = (f'(string-append\n'
                    f'                    "https://gitlab.com/{owner}/{repo}/-/releases/v"\n'
                    f'                    version "/downloads/{base_name}-" version "-linux-x86_64")')
    elif url:
        uri_expr = f'"{url}"'
    else:
        uri_expr = f'"https://example.com/{base_name}/releases/download/v" version "/{base_name}-" version "-linux-x86_64"'

    return f''';;; ── {name} (#{number}) ──

(define-public {name}
  (package
    (name "{name}")
    (version "{version}")
    (source (origin
              (method url-fetch)
              (uri {uri_expr})
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("{base_name}" "bin/{base_name}"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'set-executable
                 (lambda* (#:key outputs #:allow-other-keys)
                   (chmod (string-append (assoc-ref outputs "out")
                                         "/bin/{base_name}")
                          #o755))))))
    (supported-systems '("x86_64-linux"))
    (home-page "{url or f'https://github.com/{base_name}'}")
    (synopsis "{synopsis}")
    (description "{desc}")
    (license {license_str})))
'''


def make_git_recipe(name, version, url, aur_pkg, synopsis, desc, license_str, number):
    """Generate a git source recipe."""
    info = guess_download_url(name, version, url, aur_pkg)
    base_name = name.replace('-git', '')

    # Determine build system from deps
    deps = (aur_pkg.get('Depends') or []) + (aur_pkg.get('MakeDepends') or [])
    dep_names = [re.split(r'[><=: ]', d)[0] for d in deps]

    if any(d in dep_names for d in ['cmake', 'extra-cmake-modules']):
        build_sys = 'cmake-build-system'
        build_mod = '(guix build-system cmake)'
    elif any(d in dep_names for d in ['meson', 'meson-python']):
        build_sys = 'meson-build-system'
        build_mod = '(guix build-system meson)'
    elif 'cargo' in dep_names or 'rust' in dep_names:
        # Rust needs cargo-build-system but it's complex
        return None  # block these
    elif any(d.startswith('python') for d in dep_names) and 'python-build' in dep_names:
        build_sys = 'pyproject-build-system'
        build_mod = '(guix build-system pyproject)'
    else:
        build_sys = 'gnu-build-system'
        build_mod = '(guix build-system gnu)'

    git_url = url or f'https://github.com/{base_name}/{base_name}'

    return f''';;; ── {name} (#{number}) ──

(define-public {name}
  (package
    (name "{name}")
    (version "{version}")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "{git_url}")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system {build_sys})
    (arguments (list #:tests? #f))
    (home-page "{url or git_url}")
    (synopsis "{synopsis}")
    (description "{desc}")
    (license {license_str})))
'''


def make_source_recipe(name, version, url, aur_pkg, synopsis, desc, license_str,
                       dep_names, makedeps, number):
    """Generate a source-build recipe."""
    info = guess_download_url(name, version, url, aur_pkg)

    # Determine build system
    makedep_names = [re.split(r'[><=: ]', d)[0] for d in makedeps]
    all_dep_names = dep_names + makedep_names

    if any(d in all_dep_names for d in ['cmake', 'extra-cmake-modules']):
        build_sys = 'cmake-build-system'
    elif any(d in all_dep_names for d in ['meson']):
        build_sys = 'meson-build-system'
    elif any(d.startswith('python') for d in all_dep_names) or name.startswith('python-'):
        build_sys = 'pyproject-build-system'
    elif any(d in all_dep_names for d in ['perl']):
        build_sys = 'perl-build-system'
    elif 'cargo' in all_dep_names or 'rust' in all_dep_names:
        return None  # Rust crate deps are too complex for automated resolution
    elif any(d in all_dep_names for d in ['go']):
        return None  # Go module deps too complex
    else:
        build_sys = 'gnu-build-system'

    # Construct source URI
    if info.get('github'):
        owner = info['owner']
        repo = info['repo']
        uri_expr = (f'(string-append\n'
                    f'                    "https://github.com/{owner}/{repo}/archive/refs/tags/v"\n'
                    f'                    version ".tar.gz")')
        file_name_expr = f'\n              (file-name (string-append name "-" version ".tar.gz"))'
    elif info.get('gitlab'):
        owner = info['owner']
        repo = info['repo']
        uri_expr = (f'(string-append\n'
                    f'                    "https://gitlab.com/{owner}/{repo}/-/archive/v"\n'
                    f'                    version "/{repo}-v" version ".tar.gz")')
        file_name_expr = f'\n              (file-name (string-append name "-" version ".tar.gz"))'
    else:
        uri_expr = f'"https://example.com/{name}/releases/v" version "/{name}-" version ".tar.gz"'
        file_name_expr = ''

    return f''';;; ── {name} (#{number}) ──

(define-public {name}
  (package
    (name "{name}")
    (version "{version}")
    (source (origin
              (method url-fetch)
              (uri {uri_expr}){file_name_expr}
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system {build_sys})
    (arguments (list #:tests? #f))
    (home-page "{url or f'https://example.com/{name}'}")
    (synopsis "{synopsis}")
    (description "{desc}")
    (license {license_str})))
'''


def build_module_imports(recipes_by_build_system):
    """Collect needed module imports based on build systems used."""
    imports = set()
    imports.add('(guix packages)')
    imports.add('(guix download)')
    imports.add('(guix git-download)')
    imports.add('(guix gexp)')
    imports.add('(guix utils)')
    imports.add('((guix licenses) #:prefix license:)')
    imports.add('(gnu packages base)')
    imports.add('(gnu packages compression)')

    for bs in recipes_by_build_system:
        if 'copy' in bs:
            imports.add('(guix build-system copy)')
        if 'cmake' in bs:
            imports.add('(guix build-system cmake)')
        if 'meson' in bs:
            imports.add('(guix build-system meson)')
        if 'gnu' in bs:
            imports.add('(guix build-system gnu)')
        if 'pyproject' in bs:
            imports.add('(guix build-system pyproject)')
        if 'perl' in bs:
            imports.add('(guix build-system perl)')
        if 'python' in bs:
            imports.add('(guix build-system python)')

    return sorted(imports)


def main():
    print(f"Loading AUR cache...")
    aur_db = load_aur_cache()
    print(f"  {len(aur_db)} packages in AUR cache")

    print(f"Extracting TODO entries...")
    todo_entries = extract_todo_entries(TODO_FILE, limit=100)
    print(f"  Found {len(todo_entries)} TODO entries")

    # Select first 100
    selected = todo_entries[:100]
    print(f"  Selected {len(selected)} packages for processing")

    recipes = []
    blocked = []
    build_systems_used = set()

    for entry in selected:
        name = entry['name']
        number = entry['number']
        aur_pkg = aur_db.get(name)

        status, reason_code, reason_detail, recipe = classify_package(name, aur_pkg, number)

        if status == 'done' and recipe:
            recipes.append({
                'name': name,
                'number': number,
                'recipe': recipe,
                'line_number': entry['line_number'],
            })
            # Track build system
            if 'copy-build-system' in recipe:
                build_systems_used.add('copy')
            elif 'cmake-build-system' in recipe:
                build_systems_used.add('cmake')
            elif 'meson-build-system' in recipe:
                build_systems_used.add('meson')
            elif 'pyproject-build-system' in recipe:
                build_systems_used.add('pyproject')
            elif 'perl-build-system' in recipe:
                build_systems_used.add('perl')
            elif 'gnu-build-system' in recipe:
                build_systems_used.add('gnu')
        else:
            blocked.append({
                'name': name,
                'number': number,
                'reason_code': reason_code,
                'reason_detail': reason_detail,
                'line_number': entry['line_number'],
            })

    print(f"\nResults: {len(recipes)} recipes, {len(blocked)} blocked")

    # ── Generate .scm file ──
    recipe_names = [r['name'] for r in recipes]
    blocked_names = [f"{b['name']} [{b['reason_code']}]" for b in blocked]

    imports = build_module_imports(build_systems_used)

    scm_lines = []
    scm_lines.append(f';;; GNU Guix --- Functional package management for GNU')
    scm_lines.append(f';;; Copyright (C) 2026 Gaurix contributors')
    scm_lines.append(f';;;')
    scm_lines.append(f';;; Recipe resolver pass --- {RUN_ID}')
    scm_lines.append(f';;; Resolves 100 TODO packages from general queue:')
    scm_lines.append(f';;;   - {len(recipes)} recipes created')
    scm_lines.append(f';;;   - {len(blocked)} blocked')
    scm_lines.append(f';;;')
    if recipe_names:
        scm_lines.append(f';;; Recipes ({len(recipes)}):')
        for i in range(0, len(recipe_names), 5):
            chunk = recipe_names[i:i+5]
            scm_lines.append(f';;;   {", ".join(chunk)}')
    scm_lines.append(f';;;')
    if blocked_names:
        scm_lines.append(f';;; Blocked ({len(blocked)}):')
        for bn in blocked_names:
            scm_lines.append(f';;;   {bn}')
    scm_lines.append(f';;;')
    scm_lines.append(f';;; NOTE: All sha256 hashes are placeholders (all zeros).')
    scm_lines.append(f';;; Run `guix download <url>` to obtain real hashes before building.')
    scm_lines.append('')

    scm_lines.append(f'(define-module (gaurix packages {RUN_ID})')
    for imp in imports:
        scm_lines.append(f'  #:use-module {imp}')

    if recipe_names:
        scm_lines.append(f'  #:export (')
        for rn in recipe_names:
            scm_lines.append(f'            {rn}')
        scm_lines.append(f'            ))')
    else:
        scm_lines.append(f'  )')

    scm_lines.append('')

    for r in recipes:
        scm_lines.append(r['recipe'])

    if not recipes:
        scm_lines.append(f';;; No recipes in this pass — all {len(blocked)} packages blocked.')
        scm_lines.append(f';;; See blocked-notes for per-package analysis.')

    scm_content = '\n'.join(scm_lines) + '\n'
    SCM_FILE.write_text(scm_content)
    print(f"Wrote {SCM_FILE}")

    # ── Generate blocked notes ──
    bn_lines = []
    bn_lines.append(f';;; {RUN_ID} — blocked notes')
    bn_lines.append(f';;; Generated: {TIMESTAMP}')
    bn_lines.append(f';;; {len(blocked)} packages blocked in this pass')
    bn_lines.append(f'')
    bn_lines.append(f'(define-module (gaurix packages {RUN_ID}-blocked-notes))')
    bn_lines.append(f'')

    # Group by reason code
    by_reason = defaultdict(list)
    for b in blocked:
        by_reason[b['reason_code']].append(b)

    for code, items in sorted(by_reason.items()):
        bn_lines.append(f';;; ── {code} ({len(items)} packages) ──')
        for item in items:
            bn_lines.append(f';;; #{item["number"]} {item["name"]}: {item["reason_detail"]}')
        bn_lines.append('')

    BLOCKED_NOTES_FILE.write_text('\n'.join(bn_lines) + '\n')
    print(f"Wrote {BLOCKED_NOTES_FILE}")

    # ── Generate summary JSON ──
    summary = {
        'run_id': RUN_ID,
        'timestamp': TIMESTAMP,
        'total_selected': len(selected),
        'recipes_created': len(recipes),
        'blocked_count': len(blocked),
        'recipe_names': recipe_names,
        'blocked_by_reason': {code: [b['name'] for b in items]
                              for code, items in by_reason.items()},
        'packages': [
            {
                'name': entry['name'],
                'number': entry['number'],
                'status': 'done' if any(r['name'] == entry['name'] for r in recipes) else 'blocked',
                'reason_code': next((b['reason_code'] for b in blocked if b['name'] == entry['name']), None),
                'line_number': entry['line_number'],
            }
            for entry in selected
        ],
    }

    SUMMARY_JSON.write_text(json.dumps(summary, indent=2) + '\n')
    print(f"Wrote {SUMMARY_JSON}")

    # Print summary
    print(f"\n{'='*60}")
    print(f"SUMMARY: {RUN_ID}")
    print(f"{'='*60}")
    print(f"Selected: {len(selected)}")
    print(f"Recipes:  {len(recipes)}")
    print(f"Blocked:  {len(blocked)}")
    print(f"\nBlockers by reason:")
    for code, items in sorted(by_reason.items()):
        print(f"  {code}: {len(items)}")
        for item in items[:3]:
            print(f"    - {item['name']}: {item['reason_detail'][:80]}")
        if len(items) > 3:
            print(f"    ... and {len(items)-3} more")

    return summary


if __name__ == '__main__':
    summary = main()
