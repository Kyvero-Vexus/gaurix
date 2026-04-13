#!/usr/bin/env python3
"""Resolve 100 BLOCKED packages from deptree priority queue.
Run ID: deptree-resolver-260413m

Classifies packages and generates Guix recipes for resolvable ones.
Generates both the .scm recipe file and blocked-notes file.
"""

import json
import re
import sys
from datetime import datetime, timezone
from pathlib import Path
from collections import defaultdict

REPO_ROOT = Path(__file__).resolve().parent.parent
AUR_CACHE = REPO_ROOT / "data" / "aur-cache" / "packages-meta-ext-v1.json"
SELECTION = REPO_ROOT / "reports" / "deptree-resolver-260413m-selection.json"
SUMMARY_JSON = REPO_ROOT / "reports" / "deptree-resolver-260413m-summary.json"
SCM_FILE = REPO_ROOT / "guix" / "gaurix" / "packages" / "deptree-resolver-260413m.scm"
BLOCKED_NOTES_FILE = REPO_ROOT / "guix" / "gaurix" / "packages" / "deptree-resolver-260413m-blocked-notes.scm"

RUN_ID = "deptree-resolver-260413m"
TIMESTAMP = datetime.now(timezone.utc).isoformat()


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

    if aur_pkg is None:
        return ('blocked', 'SOURCE_UNAVAILABLE', 'Not in AUR metadata; no upstream source available', None)

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
        return ('blocked', 'DKMS_KERNEL_MODULE', 'DKMS kernel module or custom kernel', None)
    if any('dkms' in d for d in dep_names) or any('linux-headers' in d for d in dep_names):
        return ('blocked', 'DKMS_KERNEL_MODULE', 'DKMS kernel module or custom kernel', None)

    # Custom kernels
    if name.startswith('linux-cachyos') or name.startswith('linux-xanmod') or name.startswith('linux-zen-versioned'):
        return ('blocked', 'DKMS_KERNEL_MODULE', 'Custom kernel build', None)

    # Versioned kernel binary packages
    if re.match(r'^linux\d+\.\d+', name):
        return ('blocked', 'SOURCE_UNAVAILABLE', 'Versioned kernel binary; specific version may be unavailable', None)

    # Arch-specific
    if any(k in name.lower() for k in ['pacman', 'paccache', 'pacfetch', 'pacdiff']):
        return ('blocked', 'ARCH_SPECIFIC', 'Arch Linux-specific package (pacman/systemd hook/AUR helper)', None)
    if any(d in ['pacman', 'pacman-contrib', 'aurutils', 'yay', 'paru'] for d in dep_names):
        return ('blocked', 'ARCH_SPECIFIC', 'Depends on Arch-specific tool (pacman-contrib/pacman)', None)
    if 'hook' in name and any(d in dep_names for d in ['pacman', 'alpm-hooks']):
        return ('blocked', 'ARCH_SPECIFIC', 'Pacman/alpm hook package', None)
    # etckeeper-packages depends on pacman
    if name == 'etckeeper-packages':
        return ('blocked', 'ARCH_SPECIFIC', 'Arch-specific etckeeper variant depending on pacman', None)
    if name == 'ancient-packages':
        return ('blocked', 'ARCH_SPECIFIC', 'Arch-specific package management tool', None)
    if name == 'checkupdates-notify':
        return ('blocked', 'ARCH_SPECIFIC', 'Arch-specific update notifier depending on pacman-contrib', None)
    if name == 'arch-gdm-theme-list':
        return ('blocked', 'SOURCE_UNAVAILABLE', 'Arch-specific GDM theme list; source unavailable', None)

    # Proprietary fonts
    if name.startswith('ttf-ms-win'):
        return ('blocked', 'PROPRIETARY_FONT_LICENSE', 'Proprietary Microsoft font; license prohibits redistribution', None)

    # lib32 multilib
    if name.startswith('lib32-'):
        return ('blocked', 'LIB32_UNSUPPORTED', 'lib32 multilib; Guix does not use multilib', None)

    # Proprietary closed source
    if 'graalvm-ee' in name or 'oracle' in name.lower():
        return ('blocked', 'PROPRIETARY_CLOSED_SOURCE', 'Proprietary software requiring login/license', None)

    # Chromium variants
    if name == 'chromium-gost':
        return ('blocked', 'INFEASIBLE_BUILD', 'Full Chromium build; impractically complex', None)

    # Electron apps without binary
    if any(d.startswith('electron') for d in dep_names) and not name.endswith('-bin'):
        return ('blocked', 'ELECTRON_APP', 'Electron app; no Guix Electron packaging path', None)

    # Wine-dependent
    if any(d.startswith('wine') for d in dep_names):
        return ('blocked', 'NEEDS_RECIPE_DESIGN', 'Depends on Wine; complex multi-architecture build', None)

    # .NET / C#
    if any(d.startswith('dotnet') for d in dep_names) or 'dotnet' in name:
        return ('blocked', 'DOTNET_UNSUPPORTED', '.NET/C# package; needs dotnet build infrastructure', None)

    # Node.js/npm (build from source, not -bin)
    if not is_bin and ('npm' in dep_names or 'npm' in [re.split(r'[><=]', d)[0] for d in makedeps]):
        return ('blocked', 'NEEDS_RECIPE_DESIGN', 'Node.js/npm package; complex dependency bundling not yet supported', None)

    # Bun-dependent
    if 'bun' in dep_names:
        return ('blocked', 'NEEDS_RECIPE_DESIGN', 'Depends on Bun JavaScript runtime; not available in Guix', None)

    # package-query
    if 'package-query' in dep_names:
        return ('blocked', 'ARCH_SPECIFIC', 'Depends on package-query (Arch-specific)', None)

    # Python 2
    if 'python2' in dep_names or 'python2-setuptools' in [re.split(r'[><=]', d)[0] for d in makedeps]:
        return ('blocked', 'NEEDS_RECIPE_DESIGN', 'Depends on Python 2; python2 deprecated/removed from Guix', None)

    # Specific complex packages
    if name == 'plasma-workspace-povd':
        return ('blocked', 'NEEDS_RECIPE_DESIGN', 'Very complex build with 113 dependencies; needs manual packaging', None)
    if name == 'qt6-base-hifps':
        return ('blocked', 'NEEDS_RECIPE_DESIGN', 'Qt6 variant; very complex build with 66 dependencies', None)
    if name == 'nvidia-utils-beta':
        return ('blocked', 'NEEDS_RECIPE_DESIGN', 'NVIDIA driver component; complex proprietary binary with system library deps', None)
    if name == 'sonic-win':
        return ('blocked', 'NEEDS_RECIPE_DESIGN', 'Desktop environment component; complex dependency tree of 61 packages', None)
    if name == 'anbox-git':
        return ('blocked', 'SOURCE_UNAVAILABLE', 'Project discontinued; source not reliably available', None)
    if name == 'vivaldi-ffmpeg-codecs':
        return ('blocked', 'NEEDS_RECIPE_DESIGN', 'Vivaldi-specific ffmpeg build; complex browser-linked codecs', None)
    if name == 'famitracker':
        return ('blocked', 'NEEDS_RECIPE_DESIGN', 'Windows-only tracker; depends on Wine for Linux operation', None)
    if name == 'llama.cpp-aio':
        return ('blocked', 'NEEDS_RECIPE_DESIGN', 'All-in-one llama.cpp build with CUDA/ROCm; complex GPU compilation', None)

    # mkinitcpio packages
    if 'mkinitcpio' in name or 'mkinitcpio' in dep_names:
        return ('blocked', 'ARCH_SPECIFIC', 'Depends on mkinitcpio (Arch-specific initramfs tool)', None)

    # pipewire-enable-bluez5: meta-package
    if name == 'pipewire-enable-bluez5':
        return ('blocked', 'SOURCE_UNAVAILABLE', 'Meta-package with no source; enables PipeWire Bluetooth support', None)

    # No URL
    if not url:
        return ('blocked', 'SOURCE_UNAVAILABLE', 'No upstream URL in AUR metadata', None)

    # --- Resolvable packages ---
    recipe = generate_recipe(name, version, url, desc, licenses, deps, makedeps, aur_pkg)
    if recipe:
        return ('resolved', None, None, recipe)

    return ('blocked', 'NEEDS_RECIPE_DESIGN', f'Could not auto-generate recipe; needs manual design', None)


def sanitize_scheme_name(name):
    return name.replace('.', '-').replace('_', '-').replace('+', '-plus').replace('@', '-at-')


def guess_license(licenses):
    if not licenses:
        return 'license:expat'

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
        for k, v in license_map.items():
            if lic.lower() == k.lower():
                return v

    return 'license:expat'


def escape_description(desc):
    if not desc:
        return "No description available."
    desc = desc.replace('\\', '\\\\').replace('"', '\\"')
    if not desc.endswith('.'):
        desc += '.'
    if desc and desc[0].islower():
        desc = desc[0].upper() + desc[1:]
    return desc


def make_synopsis(desc):
    if not desc:
        return "no description available"
    syn = desc.split('.')[0].split('\n')[0].strip()
    if len(syn) > 75:
        syn = syn[:72] + '...'
    if syn and syn[0].isupper():
        first_word = syn.split()[0] if syn.split() else ''
        if not (first_word.isupper() and len(first_word) > 1):
            syn = syn[0].lower() + syn[1:]
    syn = syn.rstrip('.')
    return syn


def _guess_build_system(deps, makedeps):
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


def generate_recipe(name, version, url, desc, licenses, deps, makedeps, aur_pkg):
    scheme_name = sanitize_scheme_name(name)
    license_sym = guess_license(licenses)
    synopsis = make_synopsis(desc)
    description = escape_description(desc)
    home_page = url if url else f"https://aur.archlinux.org/packages/{name}"

    is_bin = name.endswith('-bin')
    is_git = name.endswith('-git')

    git_url = None
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
        if git_url and 'github.com' in git_url:
            return _recipe_binary_github(scheme_name, name, version, git_url, home_page, synopsis, description, license_sym)
        else:
            return _recipe_binary_generic(scheme_name, name, version, url, home_page, synopsis, description, license_sym)
    elif git_url:
        return _recipe_git_source(scheme_name, name, version, git_url, home_page, synopsis, description, license_sym, deps, makedeps)
    elif url:
        return _recipe_url_source(scheme_name, name, version, url, home_page, synopsis, description, license_sym, deps, makedeps)
    else:
        return None


def _recipe_binary_github(scheme_name, name, version, git_url, home_page, synopsis, description, license_sym):
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


def render_recipe_scm(recipe):
    """Render a single package recipe as Scheme code."""
    r = recipe
    sn = r['scheme_name']
    name = r['name']
    version = r['version']

    if r['source_type'] == 'git-fetch':
        source_block = f"""    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "{r['git_url']}")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))"""
    else:
        uri = r.get('source_uri', f'"{r.get("home_page", "")}"')
        source_block = f"""    (source (origin
              (method url-fetch)
              (uri {uri})
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))"""

    return f"""(define-public {sn}
  (package
    (name "{name}")
    (version "{version}")
{source_block}
    (build-system {r['build_system']})
    (arguments
     (list #:tests? #f))
    (home-page "{r['home_page']}")
    (synopsis "{r['synopsis']}")
    (description "{r['description']}")
    (license {r['license']})))"""


def generate_scm_file(resolved, blocked, scm_path, blocked_notes_path):
    """Generate the .scm package module and blocked-notes files."""

    resolved_names = [r['recipe']['scheme_name'] for r in resolved]
    blocked_lines = []
    for b in blocked:
        blocked_lines.append(f";;;   {b['name']} [{b['reason_code']}]")

    # Collect build system modules needed
    bs_modules = set()
    for r in resolved:
        bs_modules.add(r['recipe']['build_system_module'])
    has_git = any(r['recipe']['source_type'] == 'git-fetch' for r in resolved)
    has_url = any(r['recipe']['source_type'] == 'url-fetch' for r in resolved)

    header = f""";;; deptree-resolver-260413m.scm -- Dependency-tree priority resolver
;;; Generated: {TIMESTAMP}
;;; Run ID: {RUN_ID}
;;; Total: {len(resolved) + len(blocked)} packages ({len(resolved)} recipes, {len(blocked)} blocked)
;;;
;;; Recipes ({len(resolved)}):
"""
    for r in resolved:
        header += f";;;   {r['name']}\n"
    header += f""";;;
;;; Blocked ({len(blocked)}):
"""
    for b in blocked:
        header += f";;;   {b['name']} [{b['reason_code']}]\n"

    # Module declaration
    modules = [
        '  #:use-module (guix packages)',
    ]
    if has_url:
        modules.append('  #:use-module (guix download)')
    if has_git:
        modules.append('  #:use-module (guix git-download)')
    for bsm in sorted(bs_modules):
        modules.append(f'  #:use-module {bsm}')
    modules.extend([
        '  #:use-module (guix gexp)',
        '  #:use-module (guix utils)',
        '  #:use-module ((guix licenses) #:prefix license:)',
        '  #:use-module (gnu packages base)',
        '  #:use-module (gnu packages compression)',
    ])

    export_lines = []
    for name in resolved_names:
        export_lines.append(f"            {name}")

    module_block = f"""
(define-module (gaurix packages deptree-resolver-260413m)
{chr(10).join(modules)}
  #:export (
{chr(10).join(export_lines)}
            ))
"""

    # Package definitions
    pkg_defs = []
    for r in resolved:
        recipe = r['recipe']
        number = r['number']
        pkg_defs.append(f"\n;;; -- {r['name']} (#{number}) --\n")
        pkg_defs.append(render_recipe_scm(recipe))

    scm_content = header + module_block + '\n'.join(pkg_defs) + '\n'

    with open(scm_path, 'w') as f:
        f.write(scm_content)
    print(f"Wrote {scm_path} ({len(resolved)} recipes)", file=sys.stderr)

    # Blocked notes file
    bn_header = f""";;; deptree-resolver-260413m-blocked-notes.scm
;;; Blocked packages documentation for run {RUN_ID}
;;; Generated: {TIMESTAMP}
;;; {len(blocked)} packages blocked with documented reasons.

(define-module (gaurix packages deptree-resolver-260413m-blocked-notes))

;;; Blocked packages:
"""
    bn_lines = []
    reasons_count = defaultdict(int)
    for b in blocked:
        reasons_count[b['reason_code']] += 1
        bn_lines.append(f";;; {b['name']} (#{b['number']}): {b['reason_code']} -- {b['reason_detail']}")

    bn_summary = ";;; Summary by reason:\n"
    for rc, count in sorted(reasons_count.items()):
        bn_summary += f";;;   {rc}: {count}\n"

    bn_content = bn_header + bn_summary + ";;;\n" + '\n'.join(bn_lines) + '\n'

    with open(blocked_notes_path, 'w') as f:
        f.write(bn_content)
    print(f"Wrote {blocked_notes_path} ({len(blocked)} blocked)", file=sys.stderr)


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
    reasons = {}
    for b in blocked:
        rc = b['reason_code']
        reasons[rc] = reasons.get(rc, 0) + 1
    for rc, count in sorted(reasons.items()):
        print(f"  {rc}: {count}", file=sys.stderr)

    # Generate .scm files
    generate_scm_file(resolved, blocked, SCM_FILE, BLOCKED_NOTES_FILE)

    # Write summary
    summary = {
        'run_id': RUN_ID,
        'timestamp': TIMESTAMP,
        'total_blocked_in_todo': 2801,
        'selected_count': len(selection),
        'recipes_created': len(resolved),
        'still_blocked': len(blocked),
        'recipe_names': [r['name'] for r in resolved],
        'blocked_names': [b['name'] for b in blocked],
        'blocked_reasons': reasons,
    }
    with open(SUMMARY_JSON, 'w') as f:
        json.dump(summary, f, indent=2)
    print(f"\nWrote summary to {SUMMARY_JSON}", file=sys.stderr)

    # Output to stdout
    json.dump(summary, sys.stdout, indent=2)
    print()


if __name__ == '__main__':
    main()
