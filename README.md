# VOIDZ HUB — Fling Things & People Exploit Hub

## Loadstring (always at top)

```lua
loadstring(game:HttpGet("https://raw.githubusercontent.com/fungamer1234/voidz-hub/main/VOIDZ_HUB.lua", true))()
```

Build: `2026-08-22-1.3.1` · Free key: `FREMIUM` · Premium key: `VOIDZHUB`  

**Xeno-compatible** (also Delta / MacSploit / Solara / Fluxus / UNC). Missing exploit APIs fall back safely — hub still opens on PlayerGui.

**Use this `main` loadstring only.** Do **not** use the experimental `v3` branch for daily play.

One loadstring for all updates — always pulls latest `main` from GitHub (no `?v=` needed).

1. Join **Fling Things and People** (PlaceId `6961824067`).
2. Execute the loadstring above.
3. Key **`FREMIUM`** (free) or **`VOIDZHUB`** (premium). RightShift show/hide.

GitHub: https://github.com/fungamer1234/voidz-hub

## Recent (1.3.1) — Gucci = Bloody V2

Gucci was anchoring you (Blitz anti-grab freeze) every Heartbeat while grabbed, so you could not walk and the hold stuck.

- **Bloody-style seat break**: sit AlwaysHere train `VehicleSeat` for 2 frames, then warp back to your CFrame (FE ownership reset).
- Heartbeat: Struggle + RagdollRemote(0) + DestroyGrabLine + kill attacking GrabParts. **Never Anchor.**
- CanQuery off while Gucci is on so grab rays miss you.
- Anti-Grab toggle still uses the old Blitz freeze-struggle path.

## Recent (1.3.0) — ScriptBlox-reliable fling (last core physics pass)

Fling was missing a lot because ownership used a broken look-at and skipped BodyVelocity when the PartOwner flag never flipped.

- **SetNetworkOwner** now always fires `lookAt(YOUR HumanoidRootPart, target)` like Blitz / ScriptBlox FTAP hubs — never lookAt(target, target).
- Server only grants ownership inside **~30 studs**. Fling now closes the gap first, then SNO.
- **CreateGrabLine** fires before the velocity burst.
- **Always applies `FlingAuraVelocity`** on HRP / Torso / Head after the SNO burst (no more TP-home-with-no-fling).
- Fling All, Throw All, Keep Throwing, Hard Fling, Bring+Fling, grab-throw, and fling aura all use this path.

## Recent (1.2.145) — auto attack fixed

- Auto Attacker: light `findGrabAttacker` + throttled counter (no 0.08s full-body weld scans).
- All Attack Modes fixed (Kick used invalid type "Phoenix" → now uses Kick Type).
- Sever-grab before counter is light (2 Struggle, not 6× + full workspace thrash).
- Auto Fling/Kick Nearest: nil-safe roots, one target per tick.

## Recent (1.2.144) — faster loop explode

- Missile auto-strike / fire once: explode **as soon as bomb spawns** (no sky-park batch wait).
- `explodeBombAt` no longer waits 6×0.03s — hop + double FireServer.

## Recent (1.2.143) — Free + Premium keys

- **Free key:** `FREMIUM` — full core hub (combat, blob single, gucci, protect, movement…).
- **Premium key:** `VOIDZHUB` — unlocks wreck server, loop grab all, war mode, destroy hybrid, etc.
- Key screen accepts either (case-insensitive).

## Recent (1.2.142) — Blitz Gucci/Antis + banana feet + Bloody limbs

- **Gucci / Anti-Grab**: Blitz path — on `IsHeld` Heartbeat: Anchor + `Struggle` + `RagdollRemote(0)` + DestroyGrabLine stack.
- **Anti-Banana**: removes **feet/legs** (Motor6D detach then destroy) when slip/sit pins you; peels no-collide.
- **Limb rip**: Bloody-style `Motor6D.Part0 = nil` then Destroy.
- **Anti-Burn**: Blitz extinguish `firetouchinterest` on map ExtinguishPart.

## Recent (1.2.141) — Gucci SERVER ungrab + blob sit fix

- **Gucci** fires Struggle + DestroyGrabLine + kill GrabParts every ~0.05s (server remotes) so holds cannot stick; free-move if still held.
- **Blob** finds VehicleSeat on CreatureBlobman, mounts reliably, loop parks without HRP hop (no unseat), remount CD 2.5s only if ejected.

## Recent (1.2.140) — Blitz + Endoris patterns

- Scanned readable **Blitz (25ms leak)** + **Endoris** sources into `_ref/`.
- **Blob grab/wreck**: Blitz seated-only `CreatureGrab` fire (no force-sit loops). Sit first, then loop.
- **Destroy Server**: while on blob → grab all → fling (Blitz BringAll style).
- **Gucci**: Blitz `CanQuery=false` not-grabbable + free walk / non-body while held.

## Recent (1.2.139) — Gucci non-body + blob bring + wreck fling

- **Gucci** — Non-body free-hold: limbs massless/no-collide while held, grab visual stays, you still walk/jump.
- **Blob loop** — Brings targets *to* your blob; soft re-sit only (2s CD, no force-sit thrash / hop spam).
- **Wreck Server (blob)** — Loop: bring everyone to blob → CreatureGrab → fling.

## Recent (1.2.138b) — cache bust

Same MacSploit blob fix as 1.2.138. Re-execute script (old raw CDN was stuck on 1.2.137).

## Recent (1.2.138) — MacSploit blob loop fix

- **No home-TP** every tick (was ejecting you + spawning more blobs).
- **Soft park** — PivotTo only while seated; no anchor thrash / HRP hop.
- **Spawn cooldown 12s** — re-sits existing seat mid-loop; won’t spam new Blobmen.
- Soft single sit (no multi-hop fall on/off).

## Recent (1.2.137) — load chat + classic blob loop

- **Load chat message** — Settings → LOAD CHAT: set your auto-load line (default skulls). Saves to `voidz_hub_settings.json` on the executor.
- **Blob Loop Grab** — Restored **v1.2.50 classic** path (before sticky seat): mount → park → CreatureGrab → home-TP loop.

## Recent (1.2.136) — BloodyV2-style blob loop grab

- **Loop Grab** rebuilt like BloodyV2: force sticky seat while loop is on, aggressive spawn/sit, close park (2.5–3 studs), hard latch + soft hold, burst CreatureGrab multi-part fire.
- Remounts if ejected; keeps following while held.

## Recent (1.2.135) — hub scale fix

- **Hub Scale** — Real UIScale on the whole panel (was hard-coded to 520×340). Fits viewport, 60–130%, survives reopen/resize.

## Recent (1.2.134) — blob loop fix + simple Home

- **Blob Loop Grab restored (1.2.128 path)** — Auto spawn/sit, multi-pass seat, park near target with re-sit after unanchor, remount if ejected. Loop keeps moving again.
- **Home tab** — Back to normal Welcome / Quick Map / Status (not the heavy dashboard cards).

## Recent (1.2.133) — UI toward your panel mock

- **Shell** — Wider hub, purple logo mark, version chip, top **search** (jumps to matching features/tabs).
- **Sidebar** — Numbered nav + purple **pill** active state; Premium Lifetime chip; reordered toward mock (Dashboard first).
- **Dashboard** — Card grid: Player Overview (live stats), Base Options (god/noclip/infjump), Player Info (target), Quick Jump, mini Console, Quick Actions (fling/bring/kill/kick…).
- **Footer** — Status bar with player count + build.

## Recent (1.2.131) — power polish (Blitz/Res-pattern)

- **Blob grab** — No more anchor/unseat thrash; classic PivotTo park only while seated. Loop never spawns; must Spawn+Sit first then loop only fires CreatureGrab.
- **Gucci** — Every Heartbeat free-move while held (huge BV + SNO self + step CFrame). Never nukes their GrabParts.
- **Anti-Grab** — When held: freeFromGrabInstant + hard break stack every tick.
- **BlobHover kick** — Hover 12 studs on blob, shake, hard sky slam (public kick pattern).


## Recent (1.2.129)

- Gucci/Anti-Grab toggle split + blob park without CFrame hop.


## Recent (1.2.128)

- **Blobman Loop Grab kit fix** — Seat→blob resolve, L+R detectors, non-blocking CreatureGrab, SNO, UserId target lock.


## Recent (1.2.127)

- **Res-style UI polish** — Deeper glass purple theme, cleaner sections/buttons, larger hub shell.
- **Splash overhaul** — Premium glass boot card, ring loader, animated status, skip-to-open.


## Recent (1.2.126)

- **Official restore** — Full V1 hub on `main` again. Ignore V3 experiment for play.


## Recent (1.2.125)

- **Blobman grab perfected (1.2.75 core)** — Reuse blob, spawn cooldown, re-sit after park, torso+HRP CreatureGrab, no home-TP unseat, busy-lock loop.

## Recent (1.2.124-note)

- **Blobman loop grab** — Stop spawn-spam: reuse existing blob, 4s spawn cooldown, re-sit after park, grab fire while seated.

## Recent (1.2.122)

- **Chat break fix (keep skulls)** — Still posts `💀 VoIdZ HuB LoAdEd 💀` in public chat. No dual inject with legacy system chat; one announce per server; lighter war chat hooks.

## Recent (1.2.120)

- **Load chat classic** — Public announce is `💀 VoIdZ HuB LoAdEd 💀` again (original style).

## Recent (1.2.118)

- **Load message public again** — Posts once to public chat.

## Recent (1.2.117)

- **Chat break fix** — Removed hangul/invisible fillers; debounced single-channel SendAsync; translate never posts into game chat.

## Recent (1.2.116)

- **Train control rewrite** — Sit or **weld** to seat; exploit `setnetworkowner` + FTAP SNO every frame; full-model PivotTo + huge BV.

## Recent (1.2.115)

- **Train sit hard-force** — Multi-offset CFrame + kick occupant + Seat:Sit + prompt/touch.

## Recent (1.2.114)

- **Train locate rewrite** — Finds train by nearest seat first (if it’s in front of you), then AlwaysHere/Map. Looser filters so real map train isn’t rejected.

## Recent (1.2.113)

- **Reverted heavy obfuscation** — Full rename/minify broke the hub. Back to light/safe string encoding only.

## Recent (1.2.111)

- **War mode lighter** — Less remote spam / no constant house hop (was lagging + kicking). Threat-only protect.
- **Train stable sit** — One mount TP, then soft re-Sit like Bloody (no loop-TP onto the train).

## Recent (1.2.110)

- **Train target fix** — Must be a real **VehicleSeat** multi-part train (rejects rocks/props). Drive aborts unless you actually sit. FE SNO only while seated.

## Recent (1.2.109)

- **Train Bloody-style FE** — Drive mounts + sits VehicleSeat (real FE ownership), SNO + multi-part BV/Pivot, re-sit if ejected. Safe path only (won't follow into void).

## Recent (1.2.108)

- **Train FE / no player TP** — Drive Blue Train never teleports you (even once). Uses `SetNetworkOwner` + BV so train motion is FE/server-owned. Optional TP is its own button only.

## Recent (1.2.107)

- **Train void/water death fix** — No more loop-TP onto the train into void/water. Height clamped; anti-kill house hop paused while driving.

## Recent (1.2.106)

- **Train drive freestanding** — No more force-sit loop. Drive Blue Train uses SNO + CFrame control while you stay standing.

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
