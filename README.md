# VOIDZ HUB — Fling Things & People Exploit Hub

Build: `2026-07-28-1.2.41` · Access Key: `VOIDZHUB`

## Recent (1.2.41)

- **Snow farm** — Small balls also cover more of the mountain top (faster). Past safe size (~4.5) goes much harder (turbo path/speed).

## Recent (1.2.40)

- **Snow farm** — Still gentle under safe size (~4.5), then much faster with long mountain path rolls (big amp + short waits).

## Recent (1.2.39)

- **Grab line** — After snow farm ends, beam/line is forced visible again. Invisible Line OFF also restores beams (was leaving them hidden).

## Recent (1.2.38)

- **Snowballs** — Little balls grow gently (small roll amp, speed clamp, settle delay, spaced spawns) so they stop breaking when tiny.

## Recent (1.2.37)

- **Blue train** — Stronger drive (SNO burst, CFrame + BV, stay-on-train, better find/cache). No more soft stop at 80 studs that killed control.
- **Perf** — Less lag: mouse force 1 light loop, moveHB early-out, gucci idle skip, no workspace full scan for train, slower UI glow.

## Recent (1.2.36)

- **Mouse** — Cursor unlocks as soon as hub opens (Modal + last-priority force). No more spamming Toys tab to free the mouse.

## Recent (1.2.35)

- **Key screen** — Real purple borders on key field + Unlock (solid edge Frames, not UIStroke — visible in CoreGui).

## Recent (1.2.34)

- **Key screen** — Stronger purple outline on key field and Unlock button (ring frames so they read clearly).

## Recent (1.2.33)

- **UI** — Splash + key stay serious/tuff but purple (fav color), not red or candy.


## Recent (1.2.33)

- **Splash + key UI** — Colder opium look (black / ash / blood red), same animations.


## Recent (1.2.33)

- **Key screen** — Redesigned access portal (gradient wash, brand badge, polished card).


## Recent (1.2.33)

- **Snowballs** — After farm ends, strip client FarmSnowball pins so YOU can grab (not only others).


## Recent (1.2.33)

- **Train control** — Bloody-style light mount (sit + rate-limited SNO, no sticky TP spam that kicks).


## Recent (1.2.33)

- **Bring** — No permanent pin; releases so you can grab. **Snow farm off** frees balls for grab.


## Recent (1.2.33)

- **Blue train** — Sticky mount (no snap-back TP), snow farm will not TP you while driving.


## Recent (1.2.33)

- **Snow farm** — Grown snowballs hold still in place (no sky fly-away).


A full-featured FTAP exploit hub with multi-tab UI, FE-aware toy spawn, network ownership (SNO), combat, auras, server tools, and more. Press **RightShift** to toggle the hub.

## How to Use

```lua
loadstring(game:HttpGet("https://raw.githubusercontent.com/fungamer1234/voidz-hub/main/VOIDZ_HUB.lua", true))()
```

1. Join **Fling Things and People** (PlaceId `6961824067`).
2. Execute the loadstring above in your executor.
3. Enter key **`VOIDZHUB`** when prompted.
4. Press **RightShift** to show/hide the hub.

---

## Recent (1.2.33)

- **Gucci** — No longer breaks YOUR grabs (only when you are IsHeld).

## Prior

- **Gucci anti-toss** — Cancels right-click throw on release (~2.7s velocity/mover guard).

## Prior (1.2.20)

- **UI text** — Removed fancy symbols (middle-dot/arrows/ellipsis) that showed as `?` on key screen and hub.

## Prior notes

- **Blue flying train** — Map monorail under `AlwaysHereTweenedObjects` (not cave). SNO + full 3D fly (WASD / Space / Ctrl).

## Prior (1.2.18)

- **Gucci / Anti-Grab** — No more freeze on grab. Breaks welds/lines, reclaim self, force free walk (CFrame + BodyVelocity) while held so grabs barely affect you.
- **1.2.17** — Key `VOIDZHUB`, Blitz snow farm, train cave stream/drive, partial public obfuscation.

---

## Tabs Overview

### HOME
Build info, place ID, key display, Link Game Remotes, fuzzy feature search.

### COMBAT / GRAB / AURAS / SERVER / LOOPS
Combat kicks, plot ambush, blob grab, grab tools, auras, lag/wreck, multi-target loops.

### PROTECT
Gucci anti-grab, auto attacker, anti-* suite (train seat unsit is separate).

### MOVEMENT / WORLD / TOYS / EXPLOSIONS / AUTO
Speed/fly/TP (incl. Secret Train Cave), SNO auras, serial toy spawn, missiles, autofarms.

### FUN
- Control player (`=` take/release)
- **Train control** — cave stream + drive
- **Auto snowball maker** — mountain roll-grow
- Trolls, limbs, sparks, etc.

### SETTINGS
Themes, device PC/Mobile, keybinds, whitelist, unload.

---

## Notes

- Toy stacks must spawn **serially** (`CanSpawnToy`).
- Snowballs only grow when rolling on **snow terrain** (mountain farm coords).
- Train needs the map area streamed — Drive Train TPs to the cave first.

---

GitHub: https://github.com/fungamer1234/voidz-hub
