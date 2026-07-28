# VOIDZ HUB — Fling Things & People Exploit Hub

Build: `2026-07-28-1.2.14` · Access Key: `TESTRUN`

A full-featured FTAP exploit hub with multi-tab UI, FE-aware toy spawn, network ownership (SNO), combat, auras, server tools, and more. Press **RightShift** to toggle the hub.

## How to Use

```lua
loadstring(game:HttpGet("https://raw.githubusercontent.com/fungamer1234/voidz-hub/main/VOIDZ_HUB.lua", true))()
```

1. Join **Fling Things and People** (PlaceId `6961824067`).
2. Execute the loadstring above in your executor.
3. Enter key **`TESTRUN`** when prompted.
4. Press **RightShift** to show/hide the hub.

---

## Recent (1.2.14)

- **Train control** — Finds map train (Secret Train Cave), SNO + sit, WASD drive, H horn, optional cave TP. Turn off Anti Train seat if it unsits you.
- **Auto snowball maker** — Serial `BallSnowball` spawn, roll-grow on snow farm, fling grown balls at target or explode with BombExplode. Grow size = server size studs (not fake client scale).
- Boot: immediate key UI + late-init hub unlock; serial toy queue (`CanSpawnToy`).

---

## Tabs Overview

### HOME
Build info, place ID, key display, Link Game Remotes button (re-resolve FTAP remotes if features stop working). Fuzzy feature search.

### COMBAT
- **Hit One Person** — Throw strength slider, kick type dropdown, player target list.
- **House / Plot** — Ambush on plot exit, try pull from house, grab selected on exit.
- **Actions** — TP, throw, kick, kill, bring, ragdoll, void, burn, poison, freeze, unfreeze, massless grab.
- **Blob Main Grab** — Spawns blobman + CreatureGrab (plot bypass). Grab selected / all / loop.
- **Aim** — Silent aim with FOV circle and range slider.

### PLAYER
Infinite jump, god mode, auto heal, noclip, big/tiny head, big torso, spin self, float/hover, anti-drown. Super jump + speed with sliders. Reset button.

### GRAB
- **Scroll Distance** — Mouse wheel stretches grab range while holding someone.
- **Grab Line** — Invisible line, crazy line spam.
- **When You Let Go** — Throw, spin, launch up, zero-g, freeze, item follow.
- **While You Hold** — Super throw, massless grab, hold through walls, status effects, no collision.
- **Silent Aim (Grab)** — Pallet and shuriken auto-aim.
- **Nearby Stuff** — Throw nearby objects, float objects, balloons, auto-grab closest.

### AURAS
Individual auras with toggle + target/range/power. Fling, kick, kill, poison, burn, freeze, tornado, pull, push, sky blast, ragdoll, bring, bury, orbit, yeet, soft push, levitate, and more.

### SERVER
Lag server, wreck server (blobman), loop kill/throw/kick/bring/ragdoll/burn/vomit all, master stop.

### LOOPS
Multi-select target list with search. Many loop toggles (throw, kick, kill, ragdoll, bring, sky, void, spin, SNO, grab line, hard fling, blob/grab/stack/silent kick, fire, poison, banana, paint, etc.). Whitelist + rejoin persistence.

### PROTECT
- **Rejoin If Kicked** — Preemptive self-kick + rejoin.
- **Gucci Anti** — Hard anti-grab (IsHeld + PartOwner + GrabParts). Does **not** force-unsit blob/train.
- **Auto Attacker** — Counter when grabbed / low HP.
- **Anti-\* suite** — fling, burn, paint, banana, void, explosion, sticky, lag, sit, ragdoll, train/blobman (separate seat unsit).
- Client god heal. Bypass house protection toggle.

### MOVEMENT
WalkSpeed + CFrame speed override. Fly (WASD + Space + Shift), noclip, infinite jump, water walk, jump power. Map teleports including **Secret Train Cave**.

### VISUALS
Invisibility, player ESP, fullbright, no fog, night/day, FOV, 3rd person.

### TOYS
Toy limit detection (gamepass-aware). Keybinds for pallet / selected toy. Serial spawn queue + `CanSpawnToy` gate.

Quick spawn: pallet, blobman, missile, campfire, kunai, shuriken, banana, dice, spray, **BallSnowball**, decoy, and more.

Form builds (heart, wings, suit, robot, shapes…). Pallet/snowball stacks. Auto pallet path. Destroy/count toys. Unowned map item bring (SNO + hold).

### EXPLOSIONS
Missile types (BombMissile, Firework, BombBalloon, BombDarkMatter). Burst count. Auto strike. Delete missiles.

### WORLD
Network ownership aura, object/player fling aura, unanchor, clear bodymovers, delete touched parts, bring nearby objects.

### AUTO
Anti-AFK, auto fling/kick nearest, auto SNO, auto pallet, auto rejoin, auto claim plot, auto spin coins, missile strike, destroy server / lag / hybrid.

### MISC
Anti-kill, invincible lock-in-house, spam TP, anti-kick, anti-AFK, anti-lag. Rejoin, copy JobId, reset, kill all loops. Command console.

### TRANS
Auto chat translator (multi-language). Chat log with translations.

### SOUNDS
Voice lines. Play once or spam loop with speed slider.

### FUN
- **Control player** — Look-at + `=` take/release, WASD drive controlled target.
- **Train control** — Map train find/sit/SNO, WASD drive, H horn, cave TP.
- **Auto snowball maker** — Farm `BallSnowball`, grow, fling at target or explode.
- Hold + eat instruments, spray paint, sparkler shapes, pallet wings, force animations, troll tools.
- Limb removal / steal limbs / limb steal aura.
- Server trolls: soft lag, destroy lines, ragdoll all, rip limbs.

### CONFIG / SETTINGS
Themes: Purple, Red, White, Black, Green, Blue. Device: PC/Mobile. Hub scale. Unlock mouse. Whitelist. Keybinds. Power sliders. Export/Import config. Reset / unload.

---

## Notes

- Built for **client-side executors** on FTAP. Features depend on live remotes (`SpawnToy`, `SetNetworkOwner`, `BombExplode`, etc.).
- Toy stacks and forms **must spawn serially** (parallel InvokeServer fails CanSpawnToy).
- Map-wide tools may still need you near the target for SNO range (~30 studs) unless freecam mass is enabled.

---

GitHub: https://github.com/fungamer1234/voidz-hub
