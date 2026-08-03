# VOIDZ HUB V3 — **2.0.0**

Ship tag **2.0.0** (Phase 5 complete).  
V1 remains on GitHub **`main`**. V3 lives on branch **`v3`**.

## Loadstring

```lua
loadstring(game:HttpGet("https://raw.githubusercontent.com/fungamer1234/voidz-hub/v3/VOIDZ_HUB_V3.lua", true))()
```

Or local:

```lua
local src = readfile("VOIDZ_HUB_V3.lua")
local fn, err = loadstring(src)
if not fn then warn("compile:", err) return end
fn()
```

- **Key:** `VOIDZHUB`  
- **Toggle UI:** RightShift  
- **Unload:** Settings, or `getgenv().VOIDZ_V3_UNLOAD()`

## Build from source

```bash
python3 voidz_v3/build/pack.py
# writes ../VOIDZ_HUB_V3.lua
```

## What’s in 2.0.0

| Area | Features |
|------|----------|
| Defense | Gucci, Anti-Grab (15 strategies), War — **separate** |
| Blobman | 1.2.75 park + CreatureGrab, sticky opt-in, no home-TP spam |
| Combat | Phoenix / Velocity / Sky / Hard / Void / Ragdoll / Blobman / GrabKick / StackKick |
| Grab | Grab-line latch + loop |
| World | Anchor select, highlight, auto-replace (rate limited) |
| Toys | Spawn list + destroy nearest |
| Move | Walk speed, noclip, simple fly |
| Core | Config save/load, error ring, loop perf, load chat once/JobId |

## Phases (all done)

0 Design → 1 UI → 2 Defense → 3 Grab/Blob/Kicks → 4 Anchor/Toys → **5 Polish 2.0.0**
