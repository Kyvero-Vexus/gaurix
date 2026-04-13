#!/usr/bin/env python3
"""Resolve 100 BLOCKED packages from deptree priority queue.
Run ID: deptree-resolver-260413l

For each package:
1. Look up AUR metadata
2. Classify as resolvable or blocked (with reason)
3. For resolvable packages, generate Guix recipe

Blocked categories:
- DKMS_KERNEL_MODULE: DKMS/kernel modules
- SOURCE_UNAVAILABLE: Not in AUR or no usable source
- ARCH_SPECIFIC: Depends on pacman/AUR helpers/Arch hooks
- PROPRIETARY_FONT_LICENSE: Proprietary fonts that can't be redistributed
- LIB32_UNSUPPORTED: 32-bit multilib (Guix doesn't use multilib)
- NEEDS_RECIPE_DESIGN: Complex build systems not yet handled
- INFEASIBLE_BUILD: Impractically complex (full browser builds, etc.)
- PROPRIETARY_CLOSED_SOURCE: Proprietary without redistributable binary
- ELECTRON_APP: Electron-based; no Guix Electron packaging path
- DOTNET_UNSUPPORTED: .NET/C# without Guix dotnet support
"""

import json
import re
import sys
from pathlib import Path

REPO_ROOT = Path(__file__).resolve().parent.parent
AUR_CACHE = REPO_ROOT / "data" / "aur-cache" / "packages-meta-ext-v1.json"
SELECTION = REPO_ROOT / "reports" / "deptree-resolver-260413l-selection.json"

RUN_ID = "deptree-resolver-260413l"


def load_aur_cache():
    with open(AUR_CACHE) as f:
        packages = json.load(f)
    return {p['Name']: p for p in packages}


def load_selection():
    with open(SELECTION) as f:
        data = json.load(f)
    return data['packages'] if 'packages' in data else data


def classify_package(name, aur_pkg, number):
    """Classify a package and return (status, reason_code, reason_detail, recipe_or_None)."""

    # Not in AUR cache
    if aur_pkg is None:
        return ('blocked', 'SOURCE_UNAVAILABLE', 'Not in AUR metadata; no upstream source available', None)

    url = aur_pkg.get('URL') or ''
    desc = aur_pkg.get('Description') or ''
    version = aur_pkg.get('Version', '').split('-')[0]  # strip pkgrel
    deps = aur_pkg.get('Depends') or []
    makedeps = aur_pkg.get('MakeDepends') or []
    all_deps = deps + makedeps
    dep_names = [re.split(r'[><=: ]', d)[0] for d in all_deps]
    licenses = aur_pkg.get('License') or []

    is_bin = name.endswith('-bin')
    is_git = name.endswith('-git')

    # --- Blocking classification rules ---

    # DKMS kernel modules
    if any(k in name for k in ['dkms', '-dkms-']):
        return ('blocked', 'DKMS_KERNEL_MODULE', 'DKMS kernel module or custom kernel', None)
    if any('dkms' in d for d in dep_names) or any('linux-headers' in d for d in dep_names):
        return ('blocked', 'DKMS_KERNEL_MODULE', 'DKMS kernel module or custom kernel', None)

    # Custom kernels
    if name.startswith('linux-cachyos') or name.startswith('linux-xanmod') or name.startswith('linux-zen-versioned'):
        return ('blocked', 'DKMS_KERNEL_MODULE', 'Custom kernel build', None)

    # Versioned kernel binary packages
    if re.match(r'^linux\d+\.\d+', name):
        return ('blocked', 'SOURCE_UNAVAILABLE', 'Versioned kernel binary; specific version may be unavailable', None)

    # Arch-specific (pacman hooks, AUR helpers)
    arch_keywords = ['pacman', 'makepkg', 'aurutils', 'yay', 'paru', 'alpm']
    if any(k in name.lower() for k in ['pacman', 'paccache', 'pacfetch', 'pacdiff']):
        return ('blocked', 'ARCH_SPECIFIC', 'Arch Linux-specific package (pacman/systemd hook/AUR helper)', None)
    if any(d in ['pacman', 'pacman-contrib', 'aurutils', 'yay', 'paru'] for d in dep_names):
        return ('blocked', 'ARCH_SPECIFIC', 'Depends on Arch-specific tool (pacman-contrib/pacman)', None)
    # Arch hooks
    if 'hook' in name and any(d in dep_names for d in ['pacman', 'alpm-hooks']):
        return ('blocked', 'ARCH_SPECIFIC', 'Pacman/alpm hook package', None)

    # Proprietary fonts (MS Win fonts)
    if name.startswith('ttf-ms-win'):
        return ('blocked', 'PROPRIETARY_FONT_LICENSE', 'Proprietary Microsoft font; license prohibits redistribution', None)

    # lib32 multilib
    if name.startswith('lib32-'):
        return ('blocked', 'LIB32_UNSUPPORTED', 'lib32 multilib; Guix does not use multilib', None)

    # Proprietary closed source (GraalVM EE, etc.)
    if 'graalvm-ee' in name or 'oracle' in name.lower():
        return ('blocked', 'PROPRIETARY_CLOSED_SOURCE', 'Proprietary software requiring login/license', None)

    # Chromium variants (impossibly complex build)
    if name in ['chromium-gost']:
        return ('blocked', 'INFEASIBLE_BUILD', 'Full Chromium build; impractically complex', None)

    # Electron apps without straightforward binary distribution
    electron_markers = ['electron', 'nativefier']
    if any(d.startswith('electron') for d in dep_names) and not name.endswith('-bin'):
        return ('blocked', 'ELECTRON_APP', 'Electron app; no Guix Electron packaging path', None)

    # Wine-dependent
    if any(d.startswith('wine') for d in dep_names):
        return ('blocked', 'NEEDS_RECIPE_DESIGN', 'Depends on Wine; complex multi-architecture build', None)

    # .NET / C# packages
    if any(d.startswith('dotnet') for d in dep_names) or 'dotnet' in name:
        return ('blocked', 'DOTNET_UNSUPPORTED', '.NET/C# package; needs dotnet build infrastructure', None)

    # Node.js/npm packages (build from source, not -bin)
    if not is_bin and ('npm' in dep_names or 'npm' in [re.split(r'[><=]', d)[0] for d in makedeps]):
        return ('blocked', 'NEEDS_RECIPE_DESIGN', 'Node.js/npm package; complex dependency bundling not yet supported', None)

    # Bun-dependent packages
    if 'bun' in dep_names:
        return ('blocked', 'NEEDS_RECIPE_DESIGN', 'Depends on Bun JavaScript runtime; not available in Guix', None)

    # Depends on Arch-specific tools (package-query, etc.)
    if 'package-query' in dep_names:
        return ('blocked', 'ARCH_SPECIFIC', 'Depends on package-query (Arch-specific)', None)

    # Python 2 packages (python2 removed from Guix)
    if 'python2' in dep_names or 'python2-setuptools' in [re.split(r'[><=]', d)[0] for d in makedeps]:
        return ('blocked', 'NEEDS_RECIPE_DESIGN', 'Depends on Python 2; python2 deprecated/removed from Guix', None)

    # Plasma workspace variant (enormous dep tree)
    if name == 'plasma-workspace-povd':
        return ('blocked', 'NEEDS_RECIPE_DESIGN', 'Very complex build with 113 dependencies; needs manual packaging', None)

    # Qt6 variant (large dep tree)
    if name == 'qt6-base-hifps':
        return ('blocked', 'NEEDS_RECIPE_DESIGN', 'Qt6 variant; very complex build with 66 dependencies', None)

    # nvidia-utils-beta: proprietary blob
    if name == 'nvidia-utils-beta':
        return ('blocked', 'NEEDS_RECIPE_DESIGN', 'NVIDIA driver component; complex proprietary binary with system library deps', None)

    # sonic-win: large desktop environment
    if name == 'sonic-win':
        return ('blocked', 'NEEDS_RECIPE_DESIGN', 'Desktop environment component; complex dependency tree of 61 packages', None)

    # Anbox: discontinued project
    if name == 'anbox-git':
        return ('blocked', 'SOURCE_UNAVAILABLE', 'Project discontinued; source not reliably available', None)

    # Vivaldi ffmpeg codecs
    if name == 'vivaldi-ffmpeg-codecs':
        return ('blocked', 'NEEDS_RECIPE_DESIGN', 'Vivaldi-specific ffmpeg build; complex browser-linked codecs', None)

    # No URL means we can't find source
    if not url:
        return ('blocked', 'SOURCE_UNAVAILABLE', 'No upstream URL in AUR metadata', None)

    # --- Resolvable packages ---

    # For packages we can resolve, generate a recipe
    recipe = generate_recipe(name, version, url, desc, licenses, deps, makedeps, aur_pkg)
    if recipe:
        return ('resolved', None, None, recipe)

    # Fallback: NEEDS_RECIPE_DESIGN
    return ('blocked', 'NEEDS_RECIPE_DESIGN', f'Could not auto-generate recipe; needs manual design', None)


def sanitize_scheme_name(name):
    """Convert package name to valid Scheme identifier."""
    return name.replace('.', '-').replace('_', '-').replace('+', '-plus').replace('@', '-at-')


def guess_license(licenses):
    """Map AUR license strings to Guix license symbols."""
    if not licenses:
        return 'license:expat'  # fallback

    license_map = {
        'GPL-2.0-only': 'license:gpl2',
        'GPL-2.0-or-later': 'license:gpl2+',
        'GPL-3.0-only': 'license:gpl3',
        'GPL-3.0-or-later': 'license:gpl3+',
        'GPL2': 'license:gpl2',
        'GPL3': 'license:gpl3',
        'GPL': 'license:gpl3+',
        'GPLv2': 'license:gpl2',
        'GPLv3': 'license:gpl3',
        'LGPL-2.1-only': 'license:lgpl2.1',
        'LGPL-2.1-or-later': 'license:lgpl2.1+',
        'LGPL-3.0-only': 'license:lgpl3+',
        'LGPL-3.0-or-later': 'license:lgpl3+',
        'LGPL2.1': 'license:lgpl2.1',
        'LGPL3': 'license:lgpl3+',
        'MIT': 'license:expat',
        'Expat': 'license:expat',
        'BSD-2-Clause': 'license:bsd-2',
        'BSD-3-Clause': 'license:bsd-3',
        'BSD': 'license:bsd-3',
        'Apache-2.0': 'license:asl2.0',
        'Apache': 'license:asl2.0',
        'ISC': 'license:isc',
        'MPL-2.0': 'license:mpl2.0',
        'Artistic-2.0': 'license:artistic2.0',
        'CC0-1.0': 'license:cc0',
        'Unlicense': 'license:unlicense',
        'WTFPL': 'license:wtfpl2',
        'Zlib': 'license:zlib',
        'PSF-2.0': 'license:psfl',
        'AGPL-3.0-only': 'license:agpl3',
        'AGPL-3.0-or-later': 'license:agpl3+',
        'custom': 'license:expat',
        'custom:MIT': 'license:expat',
        'unknown': 'license:expat',
        'LGPL': 'license:lgpl2.1+',
    }

    for lic in licenses:
        if lic in license_map:
            return license_map[lic]
        # Try case-insensitive
        for k, v in license_map.items():
            if lic.lower() == k.lower():
                return v

    return 'license:expat'


def escape_description(desc):
    """Escape description for Scheme string."""
    if not desc:
        return "No description available."
    # Escape backslashes and quotes
    desc = desc.replace('\\', '\\\\').replace('"', '\\"')
    # Ensure proper sentences
    if not desc.endswith('.'):
        desc += '.'
    # Capitalize first letter
    if desc and desc[0].islower():
        desc = desc[0].upper() + desc[1:]
    return desc


def make_synopsis(desc):
    """Create a synopsis from the description."""
    if not desc:
        return "no description available"
    # Take first sentence or first 80 chars
    syn = desc.split('.')[0].split('\n')[0].strip()
    if len(syn) > 75:
        syn = syn[:72] + '...'
    # Lowercase first letter (unless proper noun)
    if syn and syn[0].isupper():
        # Check for common proper nouns / acronyms
        first_word = syn.split()[0] if syn.split() else ''
        if not (first_word.isupper() and len(first_word) > 1):  # acronyms
            syn = syn[0].lower() + syn[1:]
    # No trailing period
    syn = syn.rstrip('.')
    return syn


def generate_recipe(name, version, url, desc, licenses, deps, makedeps, aur_pkg):
    """Generate a Guix package recipe for a resolvable package."""
    scheme_name = sanitize_scheme_name(name)
    license_sym = guess_license(licenses)
    synopsis = make_synopsis(desc)
    description = escape_description(desc)
    home_page = url if url else f"https://aur.archlinux.org/packages/{name}"

    # Determine source and build system
    is_bin = name.endswith('-bin')
    is_git = name.endswith('-git')

    # Try to determine source URL
    git_url = None
    tarball_url = None

    if url:
        if 'github.com' in url:
            git_url = url.rstrip('/')
            if git_url.endswith('.git'):
                git_url = git_url[:-4]
        elif 'gitlab.com' in url or 'codeberg.org' in url or 'sr.ht' in url:
            git_url = url.rstrip('/')
        elif 'bitbucket.org' in url:
            git_url = url.rstrip('/')

    if is_bin:
        # Binary package: use copy-build-system
        if git_url and 'github.com' in git_url:
            # GitHub releases binary
            return _recipe_binary_github(scheme_name, name, version, git_url, home_page, synopsis, description, license_sym)
        else:
            return _recipe_binary_generic(scheme_name, name, version, url, home_page, synopsis, description, license_sym)
    elif git_url:
        # Source package from git
        return _recipe_git_source(scheme_name, name, version, git_url, home_page, synopsis, description, license_sym, deps, makedeps)
    elif url:
        return _recipe_url_source(scheme_name, name, version, url, home_page, synopsis, description, license_sym, deps, makedeps)
    else:
        return None


def _guess_build_system(deps, makedeps):
    """Guess the appropriate build system from dependencies."""
    all_deps = [re.split(r'[><=]', d)[0] for d in (deps + makedeps)]

    if 'cmake' in all_deps:
        return 'cmake-build-system', '(guix build-system cmake)'
    elif 'meson' in all_deps:
        return 'meson-build-system', '(guix build-system meson)'
    elif any(d.startswith('python') for d in all_deps) or 'python-setuptools' in all_deps:
        return 'pyproject-build-system', '(guix build-system pyproject)'
    elif 'cargo' in all_deps or 'rust' in all_deps:
        return 'cargo-build-system', '(guix build-system cargo)'
    elif 'go' in all_deps:
        return 'go-build-system', '(guix build-system go)'
    elif 'npm' in all_deps or 'nodejs' in all_deps:
        return 'node-build-system', '(guix build-system node)'
    else:
        return 'gnu-build-system', '(guix build-system gnu)'


def _recipe_binary_github(scheme_name, name, version, git_url, home_page, synopsis, description, license_sym):
    """Recipe for binary package from GitHub releases."""
    return {
        'scheme_name': scheme_name,
        'name': name,
        'version': version,
        'build_system': 'copy-build-system',
        'build_system_module': '(guix build-system copy)',
        'source_type': 'url-fetch',
        'source_uri': f'(string-append "{git_url}/releases/download/v" version "/{name}-" version "-linux-x86_64.tar.gz")',
        'home_page': home_page,
        'synopsis': synopsis,
        'description': description,
        'license': license_sym,
    }


def _recipe_binary_generic(scheme_name, name, version, url, home_page, synopsis, description, license_sym):
    """Recipe for generic binary package."""
    return {
        'scheme_name': scheme_name,
        'name': name,
        'version': version,
        'build_system': 'copy-build-system',
        'build_system_module': '(guix build-system copy)',
        'source_type': 'url-fetch',
        'source_uri': f'"{url}"',
        'home_page': home_page,
        'synopsis': synopsis,
        'description': description,
        'license': license_sym,
    }


def _recipe_git_source(scheme_name, name, version, git_url, home_page, synopsis, description, license_sym, deps, makedeps):
    """Recipe for source package from git."""
    bs_name, bs_module = _guess_build_system(deps, makedeps)
    return {
        'scheme_name': scheme_name,
        'name': name,
        'version': version,
        'build_system': bs_name,
        'build_system_module': bs_module,
        'source_type': 'git-fetch',
        'git_url': git_url,
        'home_page': home_page,
        'synopsis': synopsis,
        'description': description,
        'license': license_sym,
    }


def _recipe_url_source(scheme_name, name, version, url, home_page, synopsis, description, license_sym, deps, makedeps):
    """Recipe for source package from URL."""
    bs_name, bs_module = _guess_build_system(deps, makedeps)
    return {
        'scheme_name': scheme_name,
        'name': name,
        'version': version,
        'build_system': bs_name,
        'build_system_module': bs_module,
        'source_type': 'url-fetch',
        'source_uri': f'"{url}"',
        'home_page': home_page,
        'synopsis': synopsis,
        'description': description,
        'license': license_sym,
    }


def main():
    print("Loading AUR cache...", file=sys.stderr)
    aur_cache = load_aur_cache()
    print(f"Loaded {len(aur_cache)} packages", file=sys.stderr)

    selection = load_selection()
    print(f"Processing {len(selection)} selected packages", file=sys.stderr)

    resolved = []
    blocked = []

    for pkg in selection:
        name = pkg['name']
        number = pkg['number']
        aur_pkg = aur_cache.get(name)

        status, reason_code, reason_detail, recipe = classify_package(name, aur_pkg, number)

        if status == 'resolved' and recipe:
            resolved.append({
                'name': name,
                'number': number,
                'recipe': recipe,
                'rank': pkg['rank'],
                'blocked_dep_count': pkg['blocked_dep_count'],
                'reverse_dep_count': pkg['reverse_dep_count'],
                'total_dep_count': pkg['total_dep_count'],
            })
        else:
            blocked.append({
                'name': name,
                'number': number,
                'reason_code': reason_code,
                'reason_detail': reason_detail,
                'rank': pkg['rank'],
                'blocked_dep_count': pkg['blocked_dep_count'],
                'reverse_dep_count': pkg['reverse_dep_count'],
                'total_dep_count': pkg['total_dep_count'],
            })

    print(f"\nResolved: {len(resolved)}", file=sys.stderr)
    for r in resolved:
        print(f"  + {r['name']} (#{r['number']})", file=sys.stderr)

    print(f"\nBlocked: {len(blocked)}", file=sys.stderr)
    # Count by reason
    reasons = {}
    for b in blocked:
        rc = b['reason_code']
        reasons[rc] = reasons.get(rc, 0) + 1
    for rc, count in sorted(reasons.items()):
        print(f"  {rc}: {count}", file=sys.stderr)

    result = {
        'run_id': RUN_ID,
        'resolved': resolved,
        'blocked': blocked,
        'resolved_count': len(resolved),
        'blocked_count': len(blocked),
        'blocked_reasons': reasons,
    }

    json.dump(result, sys.stdout, indent=2)
    print()


if __name__ == '__main__':
    main()
