#!/usr/bin/env python3
"""
Research AUR metadata for the 100 selected packages from deptree-resolver-260408f.
Output JSON with all metadata needed for recipe generation.
"""

import json
import re
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
AUR_CACHE = ROOT / "data" / "aur-cache" / "packages-meta-ext-v1.json"
SELECTED_JSON = ROOT / "reports" / "deptree-resolver-260408f-selection.json"

def main():
    with open(SELECTED_JSON) as f:
        selection = json.load(f)
    selected_names = selection["selected"]

    with open(AUR_CACHE) as f:
        aur_data = json.load(f)
    by_name = {p["Name"]: p for p in aur_data}

    results = []
    for name in selected_names:
        pkg = by_name.get(name, {})
        results.append({
            "name": name,
            "version": pkg.get("Version", ""),
            "description": pkg.get("Description", ""),
            "url": pkg.get("URL", ""),
            "license": pkg.get("License") or [],
            "depends": pkg.get("Depends") or [],
            "makedepends": pkg.get("MakeDepends") or [],
            "provides": pkg.get("Provides") or [],
            "conflicts": pkg.get("Conflicts") or [],
            "keywords": pkg.get("Keywords") or [],
            "popularity": pkg.get("Popularity", 0),
            "votes": pkg.get("NumVotes", 0),
        })

    # Print as formatted JSON
    print(json.dumps(results, indent=2))


if __name__ == "__main__":
    main()
