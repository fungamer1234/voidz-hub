# VOIDZ HUB V3 — Design Document

**Status:** Phase 5 complete — **shipped 2.0.0**  
**Target tag:** `2.0.0`  
**Date:** 2026-08-03  
**Git:** branch `v3` (`VOIDZ_HUB_V3.lua` + `voidz_v3/`). V1 stays on `main`.

---

## Goal

From-scratch modular FTAP hub: reliable first, feature-rich second.  
V1 monolith is a behavior reference only.

## Architecture

```
voidz_v3/
  init.lua
  core/          state, config, bus, loop, errors, services, util, bootstrap
  ui/            root, theme, components, notify, pages/*
  systems/
    defense/     gucci, anti_grab, war
    grab/        blobman, core, anchor
    combat/      kick
    object/      ownership, toys
    player/      select
    utility/     chat
  config/defaults.lua
  build/pack.py  -> VOIDZ_HUB_V3.lua
```

## Rules

1. **Gucci ≠ Anti-Grab** — never merge free-hold with break/prevent.  
2. Light pack only; no heavy rename minify.  
3. Ownership wrappers only for FTAP remotes (no bare nil DestroyGrabLine).  
4. Blob sticky seat **opt-in only**.  
5. Public load chat once per JobId, single TextChat path.

## Phase plan (complete)

| Phase | Name | Status |
|-------|------|--------|
| 0 | Design + scaffold | done |
| 1 | Core + UI shell | done |
| 2 | Defense | done |
| 3 | Grab + Blobman + kicks | done |
| 4 | Anchor + toys | done |
| 5 | Polish + **2.0.0** | done |

## Load

```lua
loadstring(game:HttpGet("https://raw.githubusercontent.com/fungamer1234/voidz-hub/v3/VOIDZ_HUB_V3.lua", true))()
```

Key: `VOIDZHUB`
