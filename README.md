# VOIDZ HUB — Fling Things & People Exploit Hub

## Loadstring (always at top)

```lua
loadstring(game:HttpGet("https://raw.githubusercontent.com/fungamer1234/voidz-hub/main/VOIDZ_HUB.lua", true))()
```

Build: `2026-07-28-1.2.66` · Access Key: `VOIDZHUB`

1. Join **Fling Things and People** (PlaceId `6961824067`).
2. Execute the loadstring above in your executor.
3. Enter key **`VOIDZHUB`** when prompted.
4. Press **RightShift** to show/hide the hub.

GitHub: https://github.com/fungamer1234/voidz-hub

---

A full-featured FTAP exploit hub with multi-tab UI, FE-aware toy spawn, network ownership (SNO), combat, auras, server tools, and more.

## Recent (1.2.66)

- **Load chat** — Cold opium-style line after key: `𖤐 ＶＯＩＤＺ　ＨＵＢ　ＬＯＡＤＥＤ 𖤐` (public + system). No hearts. Filter-safe fullwidth + `[>::<]` backup.

## Recent (1.2.65)

- **Load chat (fixed)** — After key unlock, forces a chat system line via `DisplaySystemMessage` + fullwidth/emoji letter variants + retries (old send was silent/no-op).

## Recent (1.2.64)

- **Load chat** — After key unlock, sends `VOIDZ HUB LOADED` in emoji letters to Roblox chat (once).

## Recent (1.2.63)

- **Grab line fades over time** — Continuous watchdog forces beams visible (~12Hz), watches Beam Enabled/Transparency, stops spam-restarting CharacterAndBeamMove (that was killing the rope).

## Recent (1.2.62)

- **Blobman + grab line** — Blobman control no longer bare-fires `DestroyGrabLine()` (that killed your rope). Restores + hard-restarts CharacterAndBeamMove after blob control/grab/dismount.

## Recent (1.2.61)

- **Unlock Mouse** — Fixed cursor stuck centered on the hub (Modal 1×1 + every-3rd-frame force was losing to FTAP re-lock). Full-screen Modal + every-frame free + CameraMode Classic while hub open.

## Recent (1.2.60)

- **Anti-Explosion + Gucci** — No longer anchors you while grabbing or while Gucci free-move (that combo was freezing you / killing the grab line). Restores beam after unpin.

## Recent (1.2.59)

- **Gucci + grab line** — Gucci Anti no longer kills your grab rope (false victim / Align strip / toggle burst). Restores CharacterAndBeamMove after break.

## Recent (1.2.58)

- **Grab black box** — Line restore no longer forces DragPart visible (that was the black cube at the grab tip). Handles stay fully transparent.

## Recent (1.2.57)

- **Blobman get-off** — Sticky no longer locks you forever (sticky loop itself no longer counts as “features on”). Turning off loops / sticky / Dismount hard-leaves the seat (break welds, multi-pass unsit, short re-sit lock).

## Recent (1.2.56)

- **Blobman sticky** — Turning OFF any blob loop/wreck fully stops sticky and force-dismounts so you are not stuck on the seat.

## Recent (1.2.55)

- **Blobman tab** — Loops and on/off tools are toggles: control, grab selected/all loops, extract plots loop, wreck, kick loop, sticky, anti-seat. One-shots stay buttons.

## Recent (1.2.54)

- **Blobman tab** — Added player search + selector so you can pick who grab/extract/kick hits without leaving the tab.

## Recent (1.2.53)

- **Grab line** — On hub load, Invisible Line is forced OFF, CharacterAndBeamMove re-enabled, beams restored + keep-alive so the line does not stay invisible.

## Recent (1.2.52)

- **Blobman sticky seat** — While any Blobman tool is on (grab/wreck/spawn session), you auto re-sit if ejected. Anti-blob/anti-sit won't kick you off your own ride.

## Recent (1.2.51)

- **Blobman tab** — All Blobman tools in one place: spawn/sit, control, grab, plot extract, wreck, kick, anti-seat.

## Recent (1.2.50)

- **NPC / Blobman control (Blitz-style)** — Hard SNO + grab-line claim, Humanoid:Move + BodyVelocity/Gyro, stick under creature, WASD/Space/Ctrl.

## Recent (1.2.49)

- **Combat Clear + Fling** — Clear is always visible and keeps your pick; HIT ONE click selects only (no loop-toggle mess); fling/getLoopTargets falls back to selected player.

## Recent (1.2.48)

- **Combat player list** — Fixed Clear under HIT ONE PERSON (used missing `C.accentSoft`, which broke list refresh).

## Recent (1.2.47)

- **Blobman control** — Works without HumanoidRootPart name, hard SNO, full 3D move (WASD + Space/Ctrl), **Control Blobman** button. Other NPCs use same root finder.

## Recent (1.2.46)

- **Sparklers** — Full rewrite: fixed burst (was only spawning 1 toy), spawn around target not you, radius/shapes/Fountain/Halo, **Sparkler Aura** follow+spin, clear button.

## Recent (1.2.45)

- **Snow grab** — Fixed force-drop: no more permanent FarmSnowball pin after grow, no SNO while holding (that was killing the grab). Grown balls free to hold.

## Recent (1.2.44)

- **Snow grab** — Earlier attempt: pin strip + SNO assist (SNO-while-hold made drops worse).

## Recent (1.2.43)

- **Snow farm** — Growing snowballs use a collision group so they never collide with each other (still hit the ground). Restored for grab when farm ends.

## Recent (1.2.42)

- **Grab** — Safer DragPart lookup (no WaitForChild spam). Console "DragPart is not a valid member" should stop; grabs still work.

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
- **Gucci** — No longer breaks YOUR grabs (only when you are IsHeld).
- **Snowballs** — After farm ends, strip client FarmSnowball pins so YOU can grab.
- **Train control** — Bloody-style light mount (sit + rate-limited SNO).
- **Bring** — No permanent pin; releases so you can grab.

## Prior

- **Gucci anti-toss** — Cancels right-click throw on release (~2.7s velocity/mover guard).
- **UI text** — Removed fancy symbols that showed as `?` on key screen and hub.
- **Blue flying train** — Map monorail under `AlwaysHereTweenedObjects` (not cave).
- **1.2.17** — Key `VOIDZHUB`, Blitz snow farm, partial public obfuscation.

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
- **Train control** — blue map train drive
- **Auto snowball maker** — mountain roll-grow
- Trolls, limbs, sparks, etc.

### SETTINGS
Themes, device PC/Mobile, keybinds, whitelist, unload.

---

## Notes

- Toy stacks must spawn **serially** (`CanSpawnToy`).
- Snowballs only grow when rolling on **snow terrain** (mountain farm coords).
- Train needs the map area streamed for best results.
