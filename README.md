# VOIDZ HUB — Fling Things & People Exploit Hub

Build: `2026-07-24-register-fix` · Access Key: `TESTRUN`

A full-featured FTAP exploit hub with 19 tabs, 270+ features. Press **RightShift** to toggle the hub.

---

## Tabs Overview

### HOME
Build info, place ID, key display, Link Game Remotes button (re-resolve FTAP remotes if features stop working).

### COMBAT
- **Hit One Person** — Throw strength slider (400–20000), kick type dropdown (11 types: Sky Anchor, Float Pin, Velocity, Hard, Void, Sky, Ragdoll, Blobman, Silent, GrabKick, StackKick), player target list.
- **House / Plot** — Ambush on plot exit (auto-grab when they leave), try pull from house (best-effort CreateGrabLine while they're inside), grab selected on exit button.
- **Actions** — TP, throw, kick, kill, bring, ragdoll, void, burn, poison, freeze, unfreeze, massless grab.
- **Blob Main Grab** — Spawns blobman + CreatureGrab. Works inside plots (bypasses house protection). Grab selected, grab all, persistent grab loop.
- **Aim** — Silent aim with FOV circle and range slider.

### PLAYER
Infinite jump, god mode, auto heal, noclip, big/tiny head, big torso, spin self, float/hover, anti-drown. Super jump + speed with sliders. Reset button.

### GRAB
- **Scroll Distance** — Mouse wheel stretches grab range while holding someone. Distance slider (11–120) + step size slider.
- **Grab Line** — Invisible line (hide grab lines), crazy line (spam lines on everyone).
- **When You Let Go** — Throw, spin, launch up, zero-g, freeze, item follow. Individual strength sliders.
- **While You Hold** — Super throw, massless grab, hold through walls, kill/ragdoll/poison/burn/freeze held player, no collision, strength multiplier.
- **Silent Aim (Grab)** — Pallet and shuriken auto-aim at nearest player.
- **Nearby Stuff** — Throw nearby objects, float objects, balloons, auto-grab closest player.

### AURAS
24 individual auras, each with toggle + target/range/power settings. Extended range for objects. Telekinesis shape (tornado/blackhole).

Fling, kick, kill, poison, burn, brief freeze, tornado, pull to cursor, pull to me, push away, sky blast, ragdoll, bring, phase through floor, bury underground, orbit, yeet, soft push, levitate, spike, hold still, random fling, ground press.

### SERVER
- **Lag Server** — Spam CreateGrabLine + SetNetworkOwner. Intensity slider (1–500).
- **Wreck Server** — Ride blobman + CreatureGrab every player.
- **Loop Kill/Throw/Kick/Bring/Ragdoll/Burn/Vomit All** — Cycle delay slider (0.1–5 sec).
- **Master Control** — Stop All Server button.

### LOOPS
Multi-select target list with search. 21 loop toggles:

Keep Throwing, Keep Kicking, Keep Killing, Keep Ragdolling, Keep Bringing, Loop Teleport To, Loop Sky Launch, Loop Void, Loop Spin, Loop Network Own, Loop Grab Line, Loop Hard Fling, Loop Blobman Kick, Loop Grab Kick, Loop Stack Kick, Loop Silent Kick, Loop Fire, Loop Poison, Loop Banana, Loop Paint, Loop Bring+Fling, Loop Long Reach Bring, Loop Spam SNO Parts, Loop Destroy Their Grab.

Stalk teleport. Whitelist friends/selected. Rejoin persistence — targets re-acquire when they rejoin.

### PROTECT
- **Rejoin If Kicked** — Preemptive self-kick + rejoin before game AC finishes.
- **Gucci Anti** — Hard anti-grab via IsHeld + PartOwner + GrabParts. Struggle spam + DestroyGrabLine. Also counter-attacks the grabber when Auto Attacker is enabled.
- **Auto Attacker** — When grabbed or low HP: instantly counter-attack. Modes: Repulsion, Freeze, Death, Kick. Force slider (2000–30000).
- **Anti-* suite** — Anti-fling, anti-burn, anti-paint, anti-banana, anti-void, anti-explosion, anti-sticky, anti-lag, anti-sit, anti-ragdoll, anti-train/blobman.
- Client god heal. Bypass house protection toggle.

### MOVEMENT
WalkSpeed + CFrame speed override. Fly (WASD + Space + Shift), noclip, infinite jump, water walk, jump power override. Map teleport: 11 named locations + player TP + loop TP.

### VISUALS
Character invisibility. Player ESP with name/role/distance, fill/outline transparency, depth mode (AlwaysOnTop/Occluded). Fullbright, no fog, night/day mode, FOV slider. 3rd person mode + distance.

### TOYS
Toy limit detection (gamepass-aware). Keybinds: Q = pallet, TAB = selected toy. Stick to pallet center.

Quick spawn: pallet, blobman, missile, campfire, kunai, shuriken, banana, dice, spray, snowball, decoy, glass box, bread, drum.

Form builds: heart, wings, suit, robot, star, circle, arrow, cross, cube, sphere, triangle, smiley. Cancel/remove mid-build.

Pallet/blobman/snowball stacks. Auto pallet path. Toy management (destroy all, destroy pallets, count). Owned inventory + unowned map items.

### EXPLOSIONS
Missile types: BombMissile, FireworkMissile, BombBalloon, BombDarkMatter. Burst count slider (1–12). Auto strike target. Delete missiles button.

### WORLD
Network ownership aura, object/player fling aura, unanchor aura, clear nearby bodymovers, delete touched parts, bring all nearby objects.

### AUTO
Anti-AFK, auto fling/kick nearest, auto SNO, auto pallet spawn, auto rejoin, auto claim plot, auto spin coins, auto time-reset, missile strike, destroy server, lag server, destroy hybrid.

### MISC
Anti-kill (water/acid TP), invincible lock-in-house, spam TP. Anti-kick, anti-AFK, anti-lag. Rejoin, copy JobId, reset character, kill all loops. Command console.

### TRANS
Auto chat translator (12 languages). Chat log with translations.

### SOUNDS
31 voice lines. Play once or spam loop with speed slider. Quick play buttons.

### FUN
Control player (manual/look/nearest/NPC). Hold + eat instruments. Spray paint target. Auto break plot with missiles. Sparkler effects (6 shapes). Pallet wings. Force animations (11 types). Troll: spin, spam jump, shaky camera. Limb removal + steal limbs (keep-attached loop, limb steal aura). Server actions: lag, destroy lines, ragdoll all, rip limbs.

### CONFIG
Themes: Purple, Red, White, Black, Green, Blue. Device: PC/Mobile. Hub scale. Unlock mouse. Whitelist management (scrollable list with per-player remove). 12 keybind toggles. Global power sliders. Export/Import config (JSON). Auto mode (beta). Reset all. Unload script.

---

GitHub: https://github.com/fungamer1234/voidz-hub
