# VOIDZ HUB — Fling Things & People Exploit Hub

## Loadstring (always at top)

```lua
loadstring(game:HttpGet("https://raw.githubusercontent.com/fungamer1234/voidz-hub/main/VOIDZ_HUB.lua", true))()
```

Build: `2026-07-29-1.2.105` · Access Key: `VOIDZHUB`  

One loadstring for all updates — always pulls latest `main` from GitHub (no `?v=` needed).

1. Join **Fling Things and People** (PlaceId `6961824067`).
2. Execute the loadstring above.
3. Key **`VOIDZHUB`**. RightShift show/hide.

GitHub: https://github.com/fungamer1234/voidz-hub

## Recent (1.2.105)

- **Auto Attacker + Gucci dual-launch fix** — Counter fling now severs grab welds first, skips force while still linked, then zeros *your* velocity so only the grabber gets launched.

## Recent (1.2.104)

- **WAR MODE classic restore** — Invuln (full heal) + **constant house hop** again (unkickable/unkillable). House TP works without Anti-Kill toggle. Not a “bring people to you” mode.

## Recent (1.2.103)

- **Blobman grab fix** — Loop no longer home-TPs off the blob or hard re-parks every tick (that broke CreatureGrab while still “TPing” to them). Closer park, multi-part fire, soft hold-maintain, remount if unseated.

## Recent (1.2.102)

- **Sticky Seat opt-in** — No longer auto-on for all Blobman grab/wreck/kick tools. Only sticks when you toggle **Sticky Seat** on.

## Recent (1.2.101)

- **Gucci MAX** — Deny grab latch before IsHeld (destroy attacking GrabParts + Struggle).
- **Anti-Fling** removed from Protect UI (still used inside WAR MODE).
- **Auto Attacker** modes: Repulsion/Fling/Kick/Sky/Freeze/Death/Void/Ragdoll/Bring · force up to **100k**.

## Recent (1.2.100)

- Based on **1.2.78** (stable blobman).
- **WAR MODE** restored (Protect tab bottom + `/war-mode` `/unwar-mode` `/war-burst`) — isolated, does not flip other toggles.
- **Gucci** — no more lag-when-grabbed (no anchor spam / no RenderStepped / short anti-toss).
- **Anti-Fling** — actually stops launches (lower thresholds, strip every tick when hot, FE StopAllVelocity).


## Recent (1.2.98)

- Loop grab: instant latch + plot-only warps (no despawn).

## Recent (1.2.97)

- **Blobman loop grab** — No sticky lock; ground map warps + fling kick while holding.

## Recent (1.2.96)

- **Blobman Loop Grab hold-warp** — While holding someone, TPs you+blob around the map with sky fling (helps kick).

## Recent (1.2.95)

- **Blobman Loop Grab** — Restored exact pre-Blitz (1.2.86) VOIDZ path: park, CreatureGrab root, home TP, 0.35s loop.

## Recent (1.2.94)

- **Blobman move fix** — No more freeze: SNO + PivotTo chase, unanchor always; loop grab no longer TPs you home (that stranded the blob).

## Recent (1.2.93)

- **Blobman Loop Grab** — Fully restored original kit (LeftDetector + torso CreatureGrab, 0.35s loop).

## Recent (1.2.92)

- **Blobman Loop Grab restored** — Classic mount → park near → CreatureGrab → home TP. Also cut grab-line/gucci FPS spam.

## Recent (1.2.91)

- **Grab line + lag** — Anti-Lag is smart: keeps rope while grabbing; keep-alive repairs beam under FPS spikes.

## Recent (1.2.90)

- **OP polish pass** — Stronger fling/kill/Phoenix kick, higher defaults, faster war loops, cleaner combat ownership.

## Recent (1.2.89)

- **Gucci hard free-move + anti-throw** — Instant walk while grabbed; longer throw-guard kills right-click toss.

## Recent (1.2.88)

- **Phoenix Kick** — New default kick type: dual BP+BV multi-part sky hold + ~2.3s sustain re-SNO (Phoenix Hub style).

## Recent (1.2.87)

- **Blobman Blitz stack** — Grab/kick/wreck use L+R CreatureGrab, multi-limb, SNO, sky fling (not weak CFrame park).

## Recent (1.2.86)

- **Grab line keep-alive** — Fixes random invisible rope (no bare DestroyGrabLine, no beam-script flip, faster restore while holding).

## Recent (1.2.85)

- **Gucci feel fix** — No more force-jump / weird fall: keep gravity, no mid-air anchor, no sticky Jump, shorter post-grab damp.

## Recent (1.2.84)

- **WAR MODE isolated** — Max protect stack runs without flipping other Protect toggles. OFF restores your previous settings (nothing left stuck on).

## Recent (1.2.83)

- **WAR toggle fix** — Can turn WAR MODE off from Protect; pill hard-syncs OFF. WAR section moved to **bottom** of Protect. Added **Force WAR OFF**.

## Recent (1.2.82)

- **WAR chat** — `/unwar-mode` (also `/unwar` `/war-off`) turns WAR MODE off. `/war-mode` only turns on (no accidental toggle-off).

## Recent (1.2.81)

- **WAR MODE (FE)** — Chat `/war-mode` / `/war-burst`. FE remotes: Struggle, DestroyGrabLine, StopAllVelocity, SNO, house escape.

## Recent (1.2.80)

- **WAR MODE** — Earlier max stack (superseded by FE-focused 1.2.81).

## Recent (1.2.79)

- **Harder antis** — Gucci/anti-kill/fling stack (see prior).

## Recent (1.2.78)

- **Perf** — Lag cut: collision-group anti-fling, slower grab keep-alive, lighter Gucci/mouse.

## Recent (1.2.77)

- **Anti-Fling (Blitz)** / **Gucci** improvements (see prior notes).

## Recent (1.2.76)

- **Grab broken fix** — Never disable `GrabbingScript`; softer anti-voice hooks.

## Recent (1.2.75)

- **Anti Voice Chat Ban** — Loads with the script (default ON). Best-effort client shield (Kick + UI). Not 100% vs Roblox server voice AI.

## Recent (1.2.74)

- **Grab line** — Stronger keep-alive: force beam script even if Anti-Lag was on, multi-pass restore, render-step force while holding.

## Recent (1.2.73)

- **Load chat** — `💀 VoIdZ HuB LoAdEd 💀` (skulls on both sides; text stays ASCII so no □ boxes).

## Recent (1.2.72)

- **Load chat** — Hardcoded pure ASCII only: `VoIdZ HuB LoAdEd`. Removed math fonts that caused □□□.

## Recent (1.2.71)

- **Load chat** — Alternating case (UfDefF style): `VoIdZ HuB LoAdEd`.

## Recent (1.2.70)

- **Load chat** — Switched off Mathematical Bold (Roblox shows □□□). Fullwidth attempt (superseded by 1.2.71 alt-case).

## Recent (1.2.69)

- **Load chat** — Hardcoded mathematical bold (boxed in Roblox chat; fixed in 1.2.70).

## Recent (1.2.68)

- **Load chat** — Only says `VOIDZ HUB LOADED` once in cool bold unicode font. No symbols, no system spam, no multi-sends.

## Recent (1.2.67)

- **Load chat (no spam)** — Earlier anti-spam pass (still had system line + extras; cleaned in 1.2.68).

## Recent (1.2.66)

- **Load chat** — Cold opium-style line after key (had multi-send spam; fixed in 1.2.67).

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
