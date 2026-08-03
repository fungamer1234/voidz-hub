# VOIDZ HUB V3

**Status:** Phase 4 — Anchor + Toys + Ownership  
**Packed:** [`../VOIDZ_HUB_V3.lua`](../VOIDZ_HUB_V3.lua)  
**Git branch:** `v3` (V1 stays on `main`)

## Run

```bash
python3 voidz_v3/build/pack.py
```

```lua
local src = readfile("VOIDZ_HUB_V3.lua") -- or HttpGet raw from branch v3
local fn, err = loadstring(src)
if not fn then warn("compile:", err) return end
fn()
```

- **Key:** `VOIDZHUB` · **Toggle:** RightShift  
- **Unload:** `getgenv().VOIDZ_V3_UNLOAD()`

### GitHub (V3 branch, does not replace V1)

```lua
loadstring(game:HttpGet("https://raw.githubusercontent.com/fungamer1234/voidz-hub/v3/VOIDZ_HUB_V3.lua", true))()
```

## Phase map

| Phase | Status |
|-------|--------|
| 0–3 | done |
| 4 Anchor + toys | done |
| 5 Polish → 2.0.0 | next |

## Phase 4

- **World tab:** ray/mouse select, Highlight, anchor toggle, auto-replace (max 4/10s), SNO  
- **Toys tab:** common spawn list, destroy nearest, safe Buy/Spawn  
- **Ownership:** visit/SNO helpers, remote status  
