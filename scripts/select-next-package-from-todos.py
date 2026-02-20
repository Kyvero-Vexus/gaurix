#!/usr/bin/env python3
import json
import re
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
CACHE = ROOT / "data" / "aur-cache" / "packages-meta-ext-v1.json"

if not CACHE.exists():
    raise SystemExit("Missing AUR cache. Run scripts/update-aur-cache.sh first.")

with CACHE.open("r", encoding="utf-8") as f:
    aur = {p.get("Name"): p for p in json.load(f)}

candidates = []
for org in ROOT.glob("todo_*_packages.org"):
    text = org.read_text(encoding="utf-8")
    blocks = re.split(r"(?=^\*\* )", text, flags=re.M)
    for b in blocks:
        m = re.search(r"^\*\*\s+(TODO|DONE|FAILED)\s+\d+\.\s+([^\n]+)", b, flags=re.M)
        if not m:
            continue
        state, name = m.group(1), m.group(2).strip()
        status = re.search(r"TODO Status:\s*([A-Z_]+)", b)
        todo_status = status.group(1) if status else "TODO"
        if state in {"DONE", "FAILED"}:
            continue
        if todo_status in {"DONE", "FAILED", "IN_PROGRESS"}:
            continue
        pop = float((aur.get(name) or {}).get("Popularity") or 0.0)
        votes = int((aur.get(name) or {}).get("NumVotes") or 0)
        candidates.append((pop, votes, name, org.name))

if not candidates:
    print("NONE")
else:
    candidates.sort(reverse=True)
    pop, votes, name, orgfile = candidates[0]
    print(f"{name}\t{orgfile}\tpop={pop:.6f}\tvotes={votes}")
