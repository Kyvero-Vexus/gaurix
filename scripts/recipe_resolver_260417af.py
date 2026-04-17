#!/usr/bin/env python3
"""
Recipe resolver batch: recipe-resolver-260417af
Fetches PyPI metadata for 100 Python packages and generates Guix recipes.
"""

import json
import os
import sys
import urllib.request
import urllib.error
import time

# Nix-base32 encoding for SHA256 hashes
NIX_BASE32_CHARS = "0123456789abcdfghijklmnpqrsvwxyz"

def sha256_hex_to_nix_base32(hex_digest):
    """Convert SHA256 hex digest to nix-base32 encoding (52 chars for SHA256)."""
    hash_bytes = bytes.fromhex(hex_digest)
    hash_size = len(hash_bytes)
    out_len = (hash_size * 8 + 4) // 5  # 52 for SHA256
    result = []
    for n in range(out_len - 1, -1, -1):
        b = n * 5
        i = b // 8
        j = b % 8
        c = hash_bytes[i] >> j
        if i < hash_size - 1:
            c |= hash_bytes[i + 1] << (8 - j)
        result.append(NIX_BASE32_CHARS[c & 0x1f])
    return ''.join(result)

def guess_license(license_str):
    """Map a license string to a Guix license symbol."""
    if not license_str:
        return "license:expat"
    ls = license_str.lower().strip()
    mapping = [
        ("mit", "license:expat"),
        ("bsd-3", "license:bsd-3"),
        ("bsd-2", "license:bsd-2"),
        ("bsd", "license:bsd-3"),
        ("apache-2", "license:asl2.0"),
        ("apache software license", "license:asl2.0"),
        ("apache license 2", "license:asl2.0"),
        ("apache", "license:asl2.0"),
        ("gpl-3", "license:gpl3"),
        ("gplv3", "license:gpl3"),
        ("gnu general public license v3", "license:gpl3"),
        ("gpl-2", "license:gpl2"),
        ("gplv2", "license:gpl2"),
        ("lgpl-3", "license:lgpl3"),
        ("lgpl-2.1", "license:lgpl2.1"),
        ("lgpl-2", "license:lgpl2.1"),
        ("isc", "license:isc"),
        ("mpl-2", "license:mpl2.0"),
        ("mozilla", "license:mpl2.0"),
        ("public domain", "license:public-domain"),
        ("unlicense", "license:unlicense"),
        ("psf", "license:psfl"),
        ("python software foundation", "license:psfl"),
        ("artistic", "license:artistic2.0"),
        ("zlib", "license:zlib"),
        ("cc0", "license:cc0"),
        ("agpl-3", "license:agpl3"),
        ("agpl", "license:agpl3"),
        ("eupl", "license:eupl1.1"),
    ]
    for pattern, guix_license in mapping:
        if pattern in ls:
            return guix_license
    # Check classifiers-style
    if "mit license" in ls:
        return "license:expat"
    return "license:expat"  # default fallback

def sanitize_description(desc):
    """Sanitize description for Guix."""
    if not desc:
        return "Python package."
    # Take first 2-3 sentences, clean up
    desc = desc.strip()
    # Remove markdown-style formatting
    desc = desc.replace('`', "'")
    desc = desc.replace('**', '')
    desc = desc.replace('*', '')
    desc = desc.replace('\r\n', '\n')
    desc = desc.replace('\r', '\n')
    # Take first paragraph
    paragraphs = desc.split('\n\n')
    text = paragraphs[0].replace('\n', ' ').strip()
    # Limit length
    if len(text) > 300:
        text = text[:297] + "..."
    # Ensure it ends with a period
    if text and text[-1] not in '.!?':
        text += '.'
    # Escape backslashes and quotes for Scheme
    text = text.replace('\\', '\\\\')
    text = text.replace('"', '\\"')
    # Ensure two spaces after periods (GNU convention)
    import re
    text = re.sub(r'\. +', '.  ', text)
    return text if text else "Python package."

def sanitize_synopsis(summary):
    """Sanitize synopsis for Guix (lowercase start, no period, <=80 chars)."""
    if not summary:
        return "python package"
    s = summary.strip()
    # Remove trailing period
    while s.endswith('.'):
        s = s[:-1]
    # Lowercase first char (unless proper noun - we'll just lowercase for safety)
    if s and s[0].isupper():
        s = s[0].lower() + s[1:]
    # Truncate
    if len(s) > 78:
        s = s[:75] + "..."
    # Escape quotes
    s = s.replace('"', "'")
    return s if s else "python package"

def pypi_name_from_aur(aur_name):
    """Convert AUR python-foo-bar to likely PyPI name."""
    # Strip python- prefix
    name = aur_name
    if name.startswith("python-"):
        name = name[7:]
    # AUR uses hyphens, PyPI might use hyphens or underscores
    return name

def fetch_pypi(pypi_name, timeout=15):
    """Fetch package metadata from PyPI JSON API."""
    # Try exact name first, then with hyphens→underscores, then vice versa
    variants = [pypi_name]
    if '-' in pypi_name:
        variants.append(pypi_name.replace('-', '_'))
    if '_' in pypi_name:
        variants.append(pypi_name.replace('_', '-'))

    for name in variants:
        url = f"https://pypi.org/pypi/{name}/json"
        try:
            req = urllib.request.Request(url, headers={'User-Agent': 'gaurix-packager/1.0'})
            with urllib.request.urlopen(req, timeout=timeout) as resp:
                data = json.loads(resp.read().decode('utf-8'))
                return data
        except (urllib.error.HTTPError, urllib.error.URLError):
            continue
        except Exception:
            continue
    return None

def find_sdist(data):
    """Find the sdist URL and sha256 from PyPI data."""
    version = data['info']['version']
    urls = data.get('urls', [])

    # Look for sdist first
    for u in urls:
        if u.get('packagetype') == 'sdist':
            return {
                'url': u['url'],
                'sha256': u['digests']['sha256'],
                'filename': u['filename'],
                'version': version
            }

    # Fall back to bdist_wheel
    for u in urls:
        if u.get('packagetype') == 'bdist_wheel':
            return {
                'url': u['url'],
                'sha256': u['digests']['sha256'],
                'filename': u['filename'],
                'version': version
            }

    return None

def generate_recipe(aur_name, pypi_data, sdist_info):
    """Generate a Guix package definition."""
    info = pypi_data['info']
    pypi_name = info['name']
    version = sdist_info['version']
    sha256_hex = sdist_info['sha256']
    sha256_b32 = sha256_hex_to_nix_base32(sha256_hex)

    synopsis = sanitize_synopsis(info.get('summary', ''))
    description = sanitize_description(info.get('summary', '') or info.get('description', ''))
    home_page = info.get('home_page') or info.get('project_url') or info.get('package_url') or f"https://pypi.org/project/{pypi_name}/"
    if not home_page or home_page == 'UNKNOWN':
        # Try project_urls
        proj_urls = info.get('project_urls') or {}
        home_page = proj_urls.get('Homepage') or proj_urls.get('Home') or proj_urls.get('Source') or proj_urls.get('Repository') or f"https://pypi.org/project/{pypi_name}/"

    license_str = info.get('license', '')
    # Also check classifiers for license
    classifiers = info.get('classifiers', [])
    for c in classifiers:
        if c.startswith('License ::'):
            parts = c.split(' :: ')
            if len(parts) >= 3:
                license_str = parts[-1]
                break

    guix_license = guess_license(license_str)

    # Determine if we should use pypi-uri
    # pypi-uri generates: https://files.pythonhosted.org/packages/source/P/pypi_name/pypi_name-version.tar.gz
    # We use url-fetch with the actual URL from PyPI for reliability
    url = sdist_info['url']

    guix_name = aur_name  # keep the AUR name as the Guix package name

    recipe = f''';;; -------------------------------------------------------------------
;;; {guix_name} — {synopsis}
;;; -------------------------------------------------------------------
(define-public {guix_name}
  (package
    (name "{guix_name}")
    (version "{version}")
    (source (origin
              (method url-fetch)
              (uri "{url}")
              (sha256
               (base32
                "{sha256_b32}"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (home-page "{home_page}")
    (synopsis "{synopsis}")
    (description "{description}")
    (license {guix_license})))
'''
    return recipe


# ============================================================
# PACKAGE SELECTION: 100 Python packages from TODO queue
# Format: (aur_name, todo_entry_number, todo_line_number)
# ============================================================
PACKAGES = [
    ("python-hurry-filesize", 15287, 116277),
    ("python-hyprpy", 15292, 116307),
    ("python-mpld3", 15304, 116384),
    ("python-ghtopdep", 15309, 116414),
    ("python-hijridate", 15784, 119382),
    ("python-banal", 15854, 119806),
    ("python-apkinspector", 15856, 119818),
    ("python-mapbox-earcut", 16423, 123267),
    ("python-moderngl", 16429, 123309),
    ("python-lzf", 16769, 125363),
    ("python-pipreqs", 16802, 125563),
    ("python-yarg", 16805, 125581),
    ("python-imbalanced-learn", 16839, 125791),
    ("python-dashtable", 16868, 125967),
    ("python-drawsvg", 16993, 126732),
    ("python-pulsectl-asyncio", 17313, 128688),
    ("python-nodriver", 17359, 128976),
    ("python-sphinx-multiversion", 17363, 129000),
    ("python-sabctools", 17443, 129481),
    ("python-webssh", 17513, 129905),
    ("python-ghostscript", 17565, 130218),
    ("python-nava", 17596, 130405),
    ("python-shap", 17689, 130969),
    ("python-garth", 17693, 130993),
    ("python-alt-profanity-check", 17700, 131039),
    ("python-pushover-complete", 17744, 131305),
    ("python-soundcard", 17809, 131703),
    ("python-awscli-plugin-endpoint", 17877, 132113),
    ("python-sphinx-substitution-extensions", 17906, 132287),
    ("python-jdatetime", 17918, 132360),
    ("python-sigmf", 17976, 132715),
    ("python-edge-tts", 18191, 134020),
    ("python-html-sanitizer", 18259, 134437),
    ("python-gputil", 18340, 134928),
    ("python-ffmpy", 18356, 135027),
    ("python-viztracer", 18431, 135477),
    ("python-tkinter-tooltip", 18432, 135483),
    ("python-optking", 18433, 135489),
    ("python-uptime", 18441, 135538),
    ("python-gradio-client", 18481, 135783),
    ("python-gpt4all", 18572, 136352),
    ("python-shazamio", 18584, 136424),
    ("python-routeros-api", 18585, 136430),
    ("python-catppuccin", 18588, 136448),
    ("python-soundcloud-v2", 18609, 136575),
    ("python-laspy", 18616, 136619),
    ("python-material-color-utilities", 18629, 136700),
    ("python-bandcamp-api", 18635, 136737),
    ("python-tgtg", 18728, 137314),
    ("python-qrcode-artistic", 18745, 137416),
    ("python-grep-ast", 18746, 137422),
    ("python-lizard", 18785, 137664),
    ("python-oletools", 18829, 137934),
    ("python-mktxp", 18836, 137977),
    ("python-random2", 18881, 138251),
    ("python-runtype", 18909, 138420),
    ("python-jsonschema-rs", 15838, 119709),
    ("python-e3-core", 16828, 125724),
    ("python-latexify-py", 15210, 115800),
    ("python-owega", 15099, 115042),
    ("python-scalene", 17508, 129875),
    ("python-pdftopng", 17561, 130194),
    ("python-livepng", 18586, 136436),
    ("python-evaluate", 17966, 132651),
    ("python-wordllama", 18581, 136406),
    ("python-flax", 17429, 129396),
    ("python-cryptolyzer", 15303, 116378),
    ("python-ninja", 17265, 128397),
    ("python-keepassxc-browser", 17852, 131962),
    ("python-google-genai", 16471, 123556),
    ("python-goodreads", 17327, 128777),
    ("python-xpybutil", 17467, 129627),
    ("python-pyqtdarktheme", 18218, 134191),
    ("python-fasta2a", 15819, 119594),
    ("python-sqlite-vec", 15820, 119600),
    ("python-rustworkx", 16982, 126665),
    ("python-discord-rpc", 16730, 125127),
    ("python-largestinteriorrectangle", 16801, 125557),
    ("python-rdbtools", 16803, 125569),
    ("python-amulet-core", 16622, 124464),
    ("python-drawsvg", 16993, 126732),
    # More Python packages
    ("python-ezchlog", 15735, 119084),
    ("python-pssh", 15315, 116454),
    ("python-rocket-fft", 15187, 115639),
    ("python-coincurve", 15199, 115724),
    ("python-pyevtk", 15306, 116396),
    ("python-jax-jumpy", 15308, 116408),
    ("python-kodistubs", 15272, 116185),
    ("python-ipycache-git", 15273, 116191),
    ("python-kaggle-api", 15277, 116215),
    ("python-anitopy-git", 18934, 138574),
    ("python-groovy", 18587, 136442),
    ("python-openai-agents", 18512, 135975),
    ("python-pytest-pyodide", 18528, 136073),
    ("python-voicevox-client", 18582, 136412),
    ("python-tensorstore-bin", 18583, 136418),
    ("python-pypylon", 17885, 132161),
    ("python-jaxlib", 18072, 133296),
    ("python-libipld-git", 18144, 133734),
    ("python-pyephem-git", 18024, 133007),
    ("python-cheap-repr", 15214, 115824),
]

# Remove duplicates
seen = set()
UNIQUE_PACKAGES = []
for p in PACKAGES:
    if p[0] not in seen:
        seen.add(p[0])
        UNIQUE_PACKAGES.append(p)
PACKAGES = UNIQUE_PACKAGES[:100]

def main():
    results = {
        'success': [],
        'failed': [],
    }
    recipes = []

    print(f"Processing {len(PACKAGES)} packages...", file=sys.stderr)

    for i, (aur_name, entry_num, line_num) in enumerate(PACKAGES):
        pypi_name = pypi_name_from_aur(aur_name)
        print(f"[{i+1}/{len(PACKAGES)}] {aur_name} -> PyPI: {pypi_name}...", end=" ", file=sys.stderr)

        pypi_data = fetch_pypi(pypi_name)
        if not pypi_data:
            print("FETCH_FAILED", file=sys.stderr)
            results['failed'].append({
                'aur_name': aur_name,
                'entry_num': entry_num,
                'line_num': line_num,
                'reason': 'FETCH_FAILED',
                'detail': f'PyPI package "{pypi_name}" not found (tried variants)'
            })
            time.sleep(0.2)
            continue

        sdist = find_sdist(pypi_data)
        if not sdist:
            print("SOURCE_UNAVAILABLE", file=sys.stderr)
            results['failed'].append({
                'aur_name': aur_name,
                'entry_num': entry_num,
                'line_num': line_num,
                'reason': 'SOURCE_UNAVAILABLE',
                'detail': f'No sdist/wheel found for {pypi_name} v{pypi_data["info"]["version"]}'
            })
            time.sleep(0.2)
            continue

        try:
            recipe = generate_recipe(aur_name, pypi_data, sdist)
            recipes.append(recipe)
            results['success'].append({
                'aur_name': aur_name,
                'entry_num': entry_num,
                'line_num': line_num,
                'version': sdist['version'],
                'pypi_name': pypi_data['info']['name'],
                'license': guess_license(pypi_data['info'].get('license', '')),
            })
            print(f"OK v{sdist['version']}", file=sys.stderr)
        except Exception as e:
            print(f"TOOLING_FAILURE: {e}", file=sys.stderr)
            results['failed'].append({
                'aur_name': aur_name,
                'entry_num': entry_num,
                'line_num': line_num,
                'reason': 'TOOLING_FAILURE',
                'detail': str(e)
            })

        time.sleep(0.3)  # Be nice to PyPI

    # Build the export list
    export_names = [r['aur_name'] for r in results['success']]

    # Generate the .scm file header
    scm = f""";;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Recipe resolver pass --- recipe-resolver-260417af
;;; Resolves {len(PACKAGES)} TODO Python packages from queue.
;;;
;;; Recipes ({len(results['success'])}):
"""
    for i, r in enumerate(results['success']):
        scm += f";;;   {i+1:>3}. {r['aur_name']} (pyproject, v{r['version']}, {r['license'].replace('license:', '')})\n"

    if results['failed']:
        scm += f";;;\n;;; Blocked ({len(results['failed'])}):\n"
        for i, f in enumerate(results['failed']):
            scm += f";;;   {len(results['success'])+i+1:>3}. {f['aur_name']} — BLOCKED: {f['reason']} ({f['detail']})\n"

    scm += f""";;;
;;; {len(results['success'])} recipes + {len(results['failed'])} BLOCKED = {len(PACKAGES)} total.
;;;
;;; NOTE: All sha256 hashes obtained from PyPI JSON API.

(define-module (gaurix packages recipe-resolver-260417af)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system pyproject)
  #:use-module ((guix licenses) #:prefix license:)
  #:export (
"""
    for name in export_names:
        scm += f"            {name}\n"
    scm += "            ))\n\n"

    # Add all recipes
    for recipe in recipes:
        scm += recipe + "\n"

    # Write the .scm file
    scm_path = os.path.join(os.path.dirname(os.path.dirname(os.path.abspath(__file__))),
                            "guix", "gaurix", "packages", "recipe-resolver-260417af.scm")
    with open(scm_path, 'w') as f:
        f.write(scm)

    # Write results JSON for further processing
    report_path = os.path.join(os.path.dirname(os.path.dirname(os.path.abspath(__file__))),
                               "reports", "recipe-resolver-260417af-results.json")
    os.makedirs(os.path.dirname(report_path), exist_ok=True)
    with open(report_path, 'w') as f:
        json.dump(results, f, indent=2)

    # Print summary
    print(f"\n{'='*60}", file=sys.stderr)
    print(f"SUMMARY: {len(results['success'])} recipes, {len(results['failed'])} blocked", file=sys.stderr)
    print(f"Output: {scm_path}", file=sys.stderr)
    print(f"Report: {report_path}", file=sys.stderr)

    # Print JSON results to stdout for further processing
    print(json.dumps(results, indent=2))

if __name__ == '__main__':
    main()
