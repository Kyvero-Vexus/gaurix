#!/usr/bin/env python3
"""Generate 2000 new AUR candidate entries for todo_general_packages.org.

Uses the local AUR cache as primary source. Excludes packages already in the
todo file, already in Guix upstream, already in nonguix, or suspicious.
"""

import json
import os
import re
import subprocess
import sys

REPO_ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
CACHE_PATH = os.path.join(REPO_ROOT, "data/aur-cache/packages-meta-ext-v1.json")
TODO_PATH = os.path.join(REPO_ROOT, "todo_general_packages.org")
TARGET_COUNT = 2000

# Patterns for suspicious/malware packages
SUSPICIOUS_PATTERNS = [
    r"^(hack|crack|keygen|patch|cheat|exploit|payload|rat|trojan|malware|virus|worm|backdoor|rootkit|keylog|spyware|ransomware|phish|brute)",
    r"(hack|crack|keygen|warez|pirat)$",
    r"(-crack|-keygen|-patch|-hack|-cheat)$",
    r"^(xxx|porn|nsfw|hentai)",
    r"(fortnite|valorant|csgo|pubg)[-_]?(hack|cheat|aim|esp|wall)",
]
SUSPICIOUS_RE = [re.compile(p, re.IGNORECASE) for p in SUSPICIOUS_PATTERNS]

# Prefixes for low-value/meta packages to deprioritize
LOW_VALUE_PREFIXES = [
    "lib32-", "mingw-w64-",
]


def load_existing_names(todo_path):
    """Extract all package names already in the todo file."""
    names = set()
    pattern = re.compile(r'^\*\* \S+\s+\d+\.\s+(\S+)')
    with open(todo_path, 'r') as f:
        for line in f:
            m = pattern.match(line)
            if m:
                names.add(m.group(1).lower())
    return names


def load_guix_packages():
    """Get set of packages available in upstream Guix."""
    try:
        result = subprocess.run(
            ["guix", "package", "-A"],
            capture_output=True, text=True, timeout=120
        )
        pkgs = set()
        for line in result.stdout.splitlines():
            parts = line.split('\t')
            if parts:
                pkgs.add(parts[0].strip().lower())
        return pkgs
    except (subprocess.TimeoutExpired, FileNotFoundError):
        print("Warning: Could not query Guix packages, proceeding without exclusion", file=sys.stderr)
        return set()


def load_nonguix_packages():
    """Try to get nonguix package names from channel if available."""
    # Check if there's a local nonguix list
    nonguix_list = os.path.join(REPO_ROOT, "data", "nonguix-packages.txt")
    if os.path.exists(nonguix_list):
        with open(nonguix_list) as f:
            return {line.strip().lower() for line in f if line.strip()}
    return set()


def is_suspicious(pkg):
    """Check if package name matches suspicious patterns."""
    name = pkg.get("Name", "")
    desc = pkg.get("Description", "") or ""
    for pat in SUSPICIOUS_RE:
        if pat.search(name):
            return True
    # Check for no maintainer + very low votes (orphaned & unpopular)
    if pkg.get("Maintainer") is None and pkg.get("NumVotes", 0) < 2:
        return True
    return False


def is_low_value(name):
    """Check if package is likely low-value."""
    for prefix in LOW_VALUE_PREFIXES:
        if name.startswith(prefix):
            return True
    return False


def main():
    # Load cache
    print(f"Loading AUR cache from {CACHE_PATH}...")
    with open(CACHE_PATH) as f:
        packages = json.load(f)
    print(f"  Loaded {len(packages)} packages")

    # Load exclusions
    print("Loading existing todo entries...")
    existing = load_existing_names(TODO_PATH)
    print(f"  Found {len(existing)} existing entries")

    print("Loading Guix upstream packages...")
    guix_pkgs = load_guix_packages()
    print(f"  Found {len(guix_pkgs)} Guix packages")

    print("Loading nonguix packages...")
    nonguix_pkgs = load_nonguix_packages()
    print(f"  Found {len(nonguix_pkgs)} nonguix packages")

    # Also load package names from our repo's .scm files
    repo_pkgs = set()
    pkg_dir = os.path.join(REPO_ROOT, "guix", "gaurix", "packages")
    if os.path.isdir(pkg_dir):
        for fname in os.listdir(pkg_dir):
            if fname.endswith(".scm"):
                # Extract define-public names
                fpath = os.path.join(pkg_dir, fname)
                with open(fpath) as f:
                    for line in f:
                        m = re.search(r'\(define-public\s+(\S+)', line)
                        if m:
                            repo_pkgs.add(m.group(1).lower())
    print(f"  Found {len(repo_pkgs)} repo packages")

    all_excluded = existing | guix_pkgs | nonguix_pkgs | repo_pkgs

    # Filter and rank candidates
    print("Filtering and ranking candidates...")
    candidates = []
    for pkg in packages:
        name = pkg.get("Name", "")
        name_lower = name.lower()

        # Skip excluded
        if name_lower in all_excluded:
            continue

        # Skip suspicious
        if is_suspicious(pkg):
            continue

        # Skip low-value
        if is_low_value(name_lower):
            continue

        # Skip packages with no description
        if not pkg.get("Description"):
            continue

        # Skip out-of-date packages with very low votes
        if pkg.get("OutOfDate") and pkg.get("NumVotes", 0) < 5:
            continue

        votes = pkg.get("NumVotes", 0)
        popularity = pkg.get("Popularity", 0.0)

        # Score: weighted combination of votes and popularity
        score = votes * 0.3 + popularity * 100

        candidates.append((score, pkg))

    # Sort by score descending
    candidates.sort(key=lambda x: -x[0])
    print(f"  Found {len(candidates)} eligible candidates")

    # Take top 2000
    selected = candidates[:TARGET_COUNT]
    print(f"  Selected top {len(selected)} candidates")

    # Find the last number in the todo file
    last_num = 0
    num_pattern = re.compile(r'^\*\* \S+\s+(\d+)\.')
    with open(TODO_PATH) as f:
        for line in f:
            m = num_pattern.match(line)
            if m:
                n = int(m.group(1))
                if n > last_num:
                    last_num = n
    print(f"  Last entry number: {last_num}")

    # Generate org entries
    lines = []
    for i, (score, pkg) in enumerate(selected, start=last_num + 1):
        name = pkg["Name"]
        desc = (pkg.get("Description") or "No description").replace("\n", " ").strip()
        votes = pkg.get("NumVotes", 0)
        pop = pkg.get("Popularity", 0.0)
        lines.append(f"** TODO {i}. {name}")
        lines.append(f"   - AUR votes: {votes}, popularity: {pop}")
        lines.append(f"   - Note: {desc}")
        lines.append(f"   - TODO Status: TODO")
        lines.append("")

    # Append to file
    print(f"Appending {len(selected)} entries to {TODO_PATH}...")
    with open(TODO_PATH, 'a') as f:
        f.write("\n")
        f.write("\n".join(lines))

    print(f"Done! Added entries #{last_num + 1} through #{last_num + len(selected)}")
    print(f"Top 10 by score:")
    for score, pkg in selected[:10]:
        print(f"  {pkg['Name']}: votes={pkg.get('NumVotes',0)}, pop={pkg.get('Popularity',0):.2f}, score={score:.1f}")


if __name__ == "__main__":
    main()
