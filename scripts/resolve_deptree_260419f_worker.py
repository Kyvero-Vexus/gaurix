#!/usr/bin/env python3
"""Worker for deptree-resolver-260419f: resolve BLOCKED packages.

For each BLOCKED package:
- If genuinely impossible → FAILED with exhaustive documentation
- If resolvable → generate Guix recipe

This pass: 1 BLOCKED package (simple-live-app).
All approaches exhausted → FAILED.
"""

import json
from datetime import datetime, timezone
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
AUR_CACHE = ROOT / "data" / "aur-cache" / "packages-meta-ext-v1.json"
SELECTION = ROOT / "reports" / "deptree-resolver-260419f-selection.json"
PASS_ID = "deptree-resolver-260419f"
BLOCKED_NOTES = ROOT / "guix" / "gaurix" / "packages" / f"{PASS_ID}-blocked-notes.scm"
AUR_LOOKUP_OUT = ROOT / "reports" / f"{PASS_ID}-aur-lookup.json"
SUMMARY_OUT = ROOT / "reports" / f"{PASS_ID}-summary.json"

# Exhaustive failure documentation
FAIL_REASONS = {
    "simple-live-app": (
        "FLUTTER_SDK_REQUIRED: Flutter/Dart SDK not available in Guix. "
        "5 approaches exhausted: "
        "(1) Source build requires Flutter 3.38+ and Dart SDK — neither packaged in Guix; "
        "(2) No upstream releases — README explicitly states no release packages provided, "
        "GitHub releases page empty; "
        "(3) GitHub Actions CI artifacts exist (linux build ~37MB from 2026-01-23) but are "
        "ephemeral (90-day expiry), require authentication, and are not stable source URLs; "
        "(4) Flatpak CI workflow exists but last run failed (2025-04-10); "
        "(5) AUR simple-live-app-bin v1.8.6 exists but itself depends on non-existent "
        "upstream release binaries. "
        "No viable packaging path until Flutter SDK is available in Guix or upstream "
        "publishes stable Linux release binaries."
    ),
}


def load_aur_cache(cache_path):
    with open(cache_path, "r") as f:
        data = json.load(f)
    return {pkg["Name"]: pkg for pkg in data}


def main():
    with open(SELECTION) as f:
        selection = json.load(f)

    packages = selection["packages"]
    print(f"[{PASS_ID}] Processing {len(packages)} selected BLOCKED packages")

    aur_cache = load_aur_cache(AUR_CACHE)
    timestamp = datetime.now(timezone.utc).isoformat().replace("+00:00", "Z")

    resolved = []
    failed = []
    aur_lookup = []

    for pkg in packages:
        name = pkg["name"]

        if name in FAIL_REASONS:
            failed.append({
                "name": name,
                "number": pkg["number"],
                "reason": FAIL_REASONS[name],
            })
            aur_lookup.append({
                "name": name,
                "found": name in aur_cache,
                "status": "FAILED",
                "reason": FAIL_REASONS[name],
            })
            continue

        # Should not reach here for this pass
        aur_data = aur_cache.get(name)
        if not aur_data:
            failed.append({
                "name": name,
                "number": pkg["number"],
                "reason": "MISSING_SOURCE: not found in AUR metadata cache",
            })
            aur_lookup.append({"name": name, "found": False, "status": "FAILED"})
            continue

    print(f"  Resolved: {len(resolved)}, Failed: {len(failed)}")

    with open(AUR_LOOKUP_OUT, "w") as f:
        json.dump(aur_lookup, f, indent=2)

    # Write blocked/failed notes
    notes_lines = [
        f";;; Notes for {PASS_ID}",
        f";;; Timestamp: {timestamp}",
        f";;; {len(failed)} packages moved to FAILED status",
        f";;; {len(resolved)} packages resolved",
        ";;;",
        ";;; === FAILED packages (all approaches exhausted) ===",
    ]
    for b in failed:
        notes_lines.append(f";;; {b['name']} (#{b['number']}): {b['reason']}")

    with open(BLOCKED_NOTES, "w") as f:
        f.write("\n".join(notes_lines) + "\n")
    print(f"  Wrote {BLOCKED_NOTES}")

    summary = {
        "pass_id": PASS_ID,
        "timestamp": timestamp,
        "total_selected": len(packages),
        "resolved": len(resolved),
        "failed": len(failed),
        "still_blocked": 0,
        "resolved_packages": [],
        "failed_packages": failed,
        "still_blocked_packages": [],
    }
    with open(SUMMARY_OUT, "w") as f:
        json.dump(summary, f, indent=2)
    print(f"  Wrote {SUMMARY_OUT}")

    return resolved, failed


if __name__ == "__main__":
    resolved, failed = main()
