#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
CACHE_DIR="$ROOT/data/aur-cache"
mkdir -p "$CACHE_DIR"

URL="https://aur.archlinux.org/packages-meta-ext-v1.json.gz"
STAMP="$(date -u +%Y%m%dT%H%M%SZ)"
TMP_GZ="$CACHE_DIR/packages-meta-ext-v1.json.gz.tmp"
TMP_JSON="$CACHE_DIR/packages-meta-ext-v1.json.tmp"

curl -fsSL "$URL" -o "$TMP_GZ"
gzip -dc "$TMP_GZ" > "$TMP_JSON"

# Minimal sanity check (must be valid JSON array)
python3 - <<'PY' "$TMP_JSON"
import json,sys
p=sys.argv[1]
with open(p,'r',encoding='utf-8') as f:
    data=json.load(f)
if not isinstance(data,list):
    raise SystemExit('AUR cache is not a JSON array')
print(f'validated {len(data)} packages')
PY

mv "$TMP_GZ" "$CACHE_DIR/packages-meta-ext-v1.json.gz"
mv "$TMP_JSON" "$CACHE_DIR/packages-meta-ext-v1.json"
printf '%s\n' "$STAMP" > "$CACHE_DIR/last-updated-utc.txt"

echo "AUR cache updated at $STAMP"
