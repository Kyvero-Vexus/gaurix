#!/usr/bin/env python3
import argparse
import json
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
CACHE = ROOT / "data" / "aur-cache" / "packages-meta-ext-v1.json"

ap = argparse.ArgumentParser(description="Search local AUR metadata cache")
ap.add_argument("query", help="substring query")
ap.add_argument("--limit", type=int, default=20)
args = ap.parse_args()

if not CACHE.exists():
    raise SystemExit(f"Cache not found: {CACHE}. Run scripts/update-aur-cache.sh first.")

q = args.query.lower()
with CACHE.open("r", encoding="utf-8") as f:
    pkgs = json.load(f)

hits = []
for p in pkgs:
    name = (p.get("Name") or "")
    desc = (p.get("Description") or "")
    if q in name.lower() or q in desc.lower():
        hits.append((float(p.get("Popularity") or 0), int(p.get("NumVotes") or 0), name, desc))

hits.sort(reverse=True)
for pop, votes, name, desc in hits[: args.limit]:
    print(f"{name}\tpop={pop:.6f}\tvotes={votes}\t{desc}")
