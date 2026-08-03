# VOIDZ HUB V3 — Design Document (Phase 0)

**Status:** Phase 4 complete (Anchor + Toys + Ownership)  
**Target tag:** `2.0.0`  
**Date:** 2026-08-03  
**Working name:** Voidz Hub V3 (user master prompt: “V3 rewrite / v2.0.0 ship”)

---

## 1. Goal

Ship a **from-scratch, modular, premium FTAP hub** that is reliable first, feature-rich second.

V1 (`VOIDZ_HUB.dev.lua`, ~24k lines, ~480 functions) is treated as:

- A **behavior reference** and feature checklist  
- **Not** a codebase to patch endlessly  

V3 is a **new tree**: `voidz_v3/` → built product `VOIDZ_HUB.lua` (or `VOIDZ_HUB_V3.lua`) via a packager.

---

## 2. Research summary (public FTAP UX patterns)

From public FTAP hubs / showcases (Blitz-style, Res-style, ScriptBlox open source, common YouTube/TikTok demos):

| Pattern | What good hubs do | V3 implication |
|--------|-------------------|----------------|
| **Defense clarity** | Separate “looks grabbed but free” vs “break grab” | **Gucci ≠ Anti-Grab** (two modules) |
| **Grab reliability** | Sit → park → remote latch; few moving parts | Blobman/grab as state machine, not stacked hacks |
| **UI** | Dark glass panels, tabs, search, notifications | New UI shell (exploit-panel-base inspired) |
| **Stability** | Fewer concurrent loops; clear on/off | One update bus; feature registries |
| **Config** | Save/load toggles + keybinds | JSON/file or `writefile` config |
| **Feedback** | Notify on fail + recover | Error bus + non-fatal pcall boundaries |

Open-source reference (behavior only):  
https://scriptblox.com/script/Fling-Things-and-People-endoris-ftap-open-source-243095  

Resaounce-class showcases emphasize **smooth UI + consistent kicks/grabs**, not spaghetti remotes.

---

## 3. Audit of current V1 (why rewrite)

| Issue | Evidence in V1 | V3 fix |
|-------|----------------|--------|
| Monolith | Single 24k-line file | Modules + packager |
| Race / spawn spam | Blob loop re-spawned every tick | State machine + cooldown + reuse |
| Coupled defense | Gucci / anti-grab / war mixed | Separate systems |
| Sticky seat chaos | Auto-sticky broke freedom | Explicit sticky policy |
| Chat side-effects | Dual inject broke TextChat | Isolated chat util |
| Train / physics | Layered rewrites fighting each other | Clean vehicle controller |
| UI | Functional but not premium | Full UI rewrite |
| Testing | Manual only | Per-module smoke hooks |

**Keep as behavior targets (not code):** blob 1.2.75-style grab, public load line, key `VOIDZHUB`, FTAP PlaceId `6961824067`.

---

## 4. Architecture

```
voidz_v3/
  init.lua                 -- entry: load order, key gate, bootstrap
  core/
    bootstrap.lua
    services.lua           -- Players, RS, remotes resolve
    state.lua              -- single source of truth (toggles, targets)
    config.lua             -- save/load
    errors.lua             -- report + recover
    bus.lua                -- events (GrabStarted, GrabEnded, …)
    loop.lua               -- named loops with gen cancel
    util.lua               -- hrp, hum, validP, notify wrapper
  ui/
    root.lua               -- ScreenGui, drag, scale
    theme.lua
    components/            -- button, toggle, slider, dropdown, section
    pages/                 -- one file per tab
    notify.lua
    icons.lua
  systems/
    grab/
      core.lua             -- detection, latch, release
      blobman.lua          -- mount, loop grab, kick helpers
      anchor.lua           -- highlight, select, anchor grab
      line.lua             -- grab line FE helpers
    defense/
      gucci.lua            -- visual hold, free move (NOT anti-grab)
      anti_grab.lua        -- multi-strategy break stack
      war.lua              -- light FE protect (threat-based)
      anti_fling.lua
      anti_kill.lua
    movement/
      fly.lua
      speed.lua
      noclip.lua
    player/
      select.lua
      esp.lua
      bring.lua
    object/
      toys.lua
      ownership.lua        -- SNO / CreateGrabLine safe wrappers
    utility/
      chat.lua
      console.lua
  config/
    defaults.lua
  assets/
    panel_ref.png          -- exploit-panel-base reference (user-supplied)
  build/
    pack.py                -- concatenate → VOIDZ_HUB.lua (+ light obf)
```

### 4.1 Runtime principles

1. **State is king** — features read/write `core.state`, never ad-hoc globals (except `getgenv().VOIDZ_*` for unload/reload).  
2. **Loops are named + generation-cancelled** (same idea as V1 `startLoop`/`stopLoop`, cleaner).  
3. **Remotes only through `systems/object/ownership.lua`** — no bare `DestroyGrabLine:FireServer()`.  
4. **UI never owns physics** — UI emits intents on the bus.  
5. **Fail closed** — one system error does not kill the hub.

### 4.2 Load / unload

```text
init
  → core.bootstrap
  → resolve FTAP remotes
  → load config
  → ui.root
  → register systems
  → key UI → main hub
getgenv().VOIDZ_UNLOAD = full teardown (loops, conns, gui)
```

---

## 5. System specs (high level)

### 5.1 Gucci (NOT anti-grab)

**Intent:** Grab looks real; effects on *you* are null.

| Do | Don’t |
|----|--------|
| Allow visual weld/arm | Break their grab kit immediately |
| Zero drag / throw velocity on local character | Combine with anti-grab “nuke grab” |
| Free walk while “held” | Anchor spam (lag) |
| Soft strip foreign movers on *local* HRP | DestroyGrabLine bare FireServer |

**State:** `defense.gucci.enabled`  
**Detect:** `IsHeld`, attacking `GrabParts`, foreign welds on local character.  
**Act:** reclaim local velocity/state; do **not** require destroying attacker visuals.

### 5.2 Anti-Grab (separate)

**Intent:** Remove or prevent hostile holds.

Strategy stack (15+ methods, ordered, with auto-fallback):

1. Early `GrabParts` ChildAdded deny  
2. Destroy attacking GrabParts (local)  
3. FE Struggle spam (bounded)  
4. FE DestroyGrabLine on **self parts only**  
5. Strip foreign Weld/WeldConstraint/Align* on local char  
6. Clear PartOwner markers  
7. StopAllVelocity (FE)  
8. Ragdoll clear remote  
9. Humanoid state reset (GettingUp/Running)  
10. Sit false + PlatformStand false  
11. Collision group / CanCollide restore  
12. Network ownership reclaim on local roots  
13. House/safe TP (optional, user toggle)  
14. Short “immune window” after break  
15. Strategy scoreboard: demote failing methods for N seconds  

**Never** share code paths with Gucci free-move.

### 5.3 Grab (player / object)

State machine: `Idle → Mounting → Parked → Firing → Holding → Released/Failed`

- Detection: valid target, plot rules, WL  
- Positioning: configurable park offset (default classic blob `0,1,7`)  
- Latch: CreatureGrab / CreateGrabLine via ownership module  
- Recovery: one remount max per cycle; cooldown on spawn  

### 5.4 Blobman

| Feature | Spec |
|---------|------|
| Spawn | Buy/Spawn once; **reuse** existing seat; cooldown ≥ 3s |
| Loop grab | Mount once → park → grab → maintain; **no** home-TP unseat |
| Sticky seat | **Opt-in only** |
| Sit loss | Soft re-sit existing; spawn only if no blob |

### 5.5 Kicks / Stack Kick

- Shared `KickContext` (target, power, type)  
- Types: Phoenix, Velocity, Sky, Hard, Void, Ragdoll, Blobman, GrabKick, StackKick  
- StackKick: explicit phase timers, no jittery reposition spam  
- Always restore local physics after  

### 5.6 Anchor Grab

- Ray/select object → highlight (SelectionBox / Highlight)  
- Anchor toggle on selection  
- Auto-replace: if instance destroyed and option on, respawn/rebind with debounce  
- No infinite replace loops (max N / 10s)  

### 5.7 War mode

- Threat-only FE protect (no constant house hop)  
- Isolated loops; does not flip other toggles  

### 5.8 Chat

- Public load: classic `💀 VoIdZ HuB LoAdEd 💀` once per JobId  
- Single TextChat SendAsync path  
- No hangul fillers; no dual legacy system inject on modern chat  

---

## 6. UI spec (premium panel)

**Inspiration:** user `exploit-panel-base` image (place in `voidz_v3/assets/`).

| Element | Behavior |
|---------|----------|
| Shell | Dark glass, blur, gradient border, soft shadow |
| Nav | Icon rail + search filters tabs/features |
| Pages | Animated crossfade / slide |
| Controls | Toggle, slider, dropdown, button, keybind capture |
| Notify | Toast stack, non-blocking |
| Themes | Purple default + packable palettes |
| Layout | Draggable, scale for mobile/PC |
| Config | Autosave feature states |

**Tabs (v1 surface area):** Home, Combat, Grab, Defense, Blobman, Player, Move, World, Visuals, Toys, Settings  

---

## 7. Config schema (sketch)

```lua
{
  version = 3,
  theme = "Purple",
  keybinds = { toggleHub = "RightShift" },
  features = {
    gucci = false,
    antiGrab = false,
    blobGrabLoop = false,
    warMode = false,
    -- …
  },
  values = {
    flingPower = 12000,
    trainSpeed = 140,
    -- …
  }
}
```

Storage: `writefile` / `readfile` when available; else `getgenv().VOIDZ_V3_CONFIG`.

---

## 8. Build & versioning

| Item | Rule |
|------|------|
| Dev | `voidz_v3/**` modules |
| Ship | `build/pack.py` → single `VOIDZ_HUB.lua` |
| Obfuscation | Light only (proven); never heavy rename minify |
| GitHub | `main` stays V1 until V3 tag; develop on branch `v3` |
| Tag | `2.0.0` when Phase 5 complete |

---

## 9. PR / phase plan (execution order)

| Phase | Name | Exit criteria |
|-------|------|----------------|
| **0** | Design + module map | This doc + scaffold dirs ✅ |
| **1** | Core + UI shell | Key gate, main window, tabs empty, notify, theme, config save/load ✅ |
| **2** | Defense | Gucci + Anti-Grab (15 strategies) + light War; no cross-bleed ✅ |
| **3** | Grab + Blobman | Classic reliable loop grab; kick types; stack kick stable ✅ |
| **4** | Anchor grab + toys/ownership | Highlight, anchor, auto-replace; safe remotes ✅ |
| **5** | Polish + ship | Perf pass, error bus, docs, tag **2.0.0** |

Parallelization: UI (1) and ownership util can land before full combat.

---

## 10. Non-goals (Phase 0–1)

- Porting every V1 aura/mass feature day one  
- Heavy obfuscation  
- Breaking public V1 `main` until V3 is ready  
- Combining Gucci with Anti-Grab  

---

## 11. Risks

| Risk | Mitigation |
|------|------------|
| Scope explosion | Strict phase exit criteria |
| FTAP remote changes | Single ownership module |
| Credits / session limits | Small vertical slices per session |
| “Copy Blitz” legal/ethics | Behavior-inspired, original code |

---

## 12. Phase 0 deliverables checklist

- [x] Design document (this file)  
- [x] Module map / folder scaffold under `voidz_v3/`  
- [x] Phase plan to 2.0.0  
- [ ] User supplies `exploit-panel-base` image → `voidz_v3/assets/panel_ref.png`  
- [ ] Phase 1 kickoff approval  

---

## 13. Next action

**Phase 4 complete.** Packed local build: `FE6_AI_Working/VOIDZ_HUB_V3.lua`. Git branch **`v3`** holds V3 sources + pack (V1 stays on `main`).

**Phase 5:** Polish + ship tag **2.0.0**.

Command when ready: **`start V3 phase 5`**




