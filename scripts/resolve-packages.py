#!/usr/bin/env python3
"""Extract detailed AUR metadata for the top 100 selected packages."""
import json
import re
from pathlib import Path

REPO_ROOT = Path(__file__).resolve().parent.parent
AUR_CACHE = REPO_ROOT / "data" / "aur-cache" / "packages-meta-ext-v1.json"
TREE_JSON = REPO_ROOT / "reports" / "blocked-dependency-tree.json"

def load_aur_cache(cache_path):
    with open(cache_path, 'r', encoding='utf-8') as f:
        first_char = f.read(1)
        f.seek(0)
        if first_char == '[':
            data = json.load(f)
        else:
            data = [json.loads(line) for line in f if line.strip()]
    return {pkg['Name']: pkg for pkg in data}

def main():
    with open(TREE_JSON) as f:
        tree = json.load(f)

    top100 = [p['name'] for p in tree['queue'][:100]]
    aur = load_aur_cache(AUR_CACHE)

    for name in top100:
        pkg = aur.get(name, {})
        print(f"\n=== {name} ===")
        print(f"  Version: {pkg.get('Version', 'N/A')}")
        print(f"  Description: {pkg.get('Description', 'N/A')}")
        print(f"  URL: {pkg.get('URL', 'N/A')}")
        print(f"  License: {pkg.get('License', 'N/A')}")
        print(f"  Depends: {pkg.get('Depends', [])}")
        print(f"  MakeDepends: {pkg.get('MakeDepends', [])}")
        print(f"  Provides: {pkg.get('Provides', [])}")
        print(f"  Conflicts: {pkg.get('Conflicts', [])}")

if __name__ == '__main__':
    main()
