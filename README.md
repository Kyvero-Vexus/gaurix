# Gaurix

> [!WARNING]
> ## ⚠️ AI-GENERATED PROJECT — DO NOT BLINDLY TRUST ⚠️
> This repository is heavily AI-generated and may contain mistakes, insecure patterns, or incorrect package definitions.
> **All code, packaging logic, and build instructions must be reviewed by a human before use in production.**

Gaurix is a Guix channel for AUR→Guix conversion experiments and packaging.

## Layout

- `.guix-channel` — channel metadata and dependencies
- `guix/gaurix/` — channel modules
  - `packages/` — package definitions
  - `services/` — service definitions (future)
- `channels.scm` — sample file for adding this channel to Guix
- `tests/` — test scaffolding

## Available packages (initial)

- `hello-gaurix`
- `localsend-bin` (from popular AUR package `localsend-bin`, not present in Guix/nonguix at packaging time)

## Quick test

```bash
guix time-machine -C channels.scm -- build hello-gaurix
# or
guix time-machine -C channels.scm -- build localsend-bin
```

## Add channel

Copy/edit `channels.scm`, then:

```bash
guix pull -C channels.scm
```

## AUR metadata cache (official, non-scraping)

- Refresh cache: `scripts/update-aur-cache.sh`
- Search cache: `scripts/search-aur-cache.py <query> --limit 20`
- Cache files live in: `data/aur-cache/`

This uses AUR's official metadata dump (`packages-meta-ext-v1.json.gz`) to reduce repeated network load.
- Pick next package from TODO org files using cache: `scripts/select-next-package-from-todos.py`
