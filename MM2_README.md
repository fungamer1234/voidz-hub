# MM2 HUB — Murder Mystery 2 Exploit Hub

Build: `2026-07-26` · Access Key: `MM2`
Author: VOIDZ

A Murder Mystery 2 exploit hub with 10 tabs. Press **RightShift** to toggle the hub.

## How to Use

```lua
loadstring(game:HttpGet("https://raw.githubusercontent.com/fungamer1234/MM2-hub/main/MM2_HUB.lua", true))()
```

Press **RightShift** to toggle the hub.

All toggles use event-based detection rather than polling loops to minimize lag.

---

## Tabs Overview

### HOME
Player count, role display, keybind reference cards (Combat, Movement, Visuals, Misc), server hop + rejoin buttons.

### COMBAT
- **Auto Shoot** — Fires equipped gun at nearest gun holder every Heartbeat (Sheriff only).
- **Auto Knife Throw** — Throws knife at closest player within 40 studs (Murderer only).
- **Kill Aura** — Auto-throws knife at players within range. Range slider (5–50 studs).
- **Auto Pickup Gun** — Grabs gun drops within 15 studs automatically.
- **Auto Kill** — Shoots closest player within 100 studs (Sheriff only). Interval slider (0.05–1 sec).
- Role detection display + refresh button.

### MOVEMENT
WalkSpeed (16–200), JumpPower (50–200) with apply buttons. Noclip (walk through walls). Fly (WASD + Space/Ctrl) with speed slider (10–200). Infinite jump. Bunny hop. Spin bot with speed slider (1–60). Hip height slider (0–20).

### VISUALS
- **Player ESP** — BillboardGui + Highlight with name, role, distance.
- **Gun Drop ESP** — Label over dropped guns.
- **Coin ESP** — "$" label over coins.
- **ESP Lines** — Beam from you to each tracked player.
- Show distance toggle. Player highlight toggle.
- Full bright with brightness slider (1–30). X-Ray (see through walls). Chams (surface gui overlay on players).

### FARM
Auto coin farm (teleport to nearest coin within 100 studs). Farm speed slider. Reset when bag full. Auto gun pickup. Coin count + gun drop status display.

### ROLES
Detection method dropdown (Tool/Character/Value/Leaderstats/All). Role + weapon display. Auto detect toggle. Round state (Active/Waiting). Role tracker list (scrollable, all players). Auto refresh (1 sec for 60 sec).

### TOSS
Touch fling (extreme velocity for contact fling). Fling target button (closest player within 100 studs). Stop fling. Emote spam. Sit/Unsit buttons.

### SERVER
Server hop, rejoin, copy server ID, copy server link. Anti-AFK. Auto server hop. Job ID + Place ID + player count display.

### WORLD
Full bright with brightness slider. Time of day override with slider (0–24 hrs) + quick buttons (Morning/Noon/Night). Remove fog + remove all atmosphere. Ambient presets (Default/Bright/Dark/Custom). X-Ray toggle. Remove barriers (makes walls transparent + non-collidable). Unlock camera. Reset lighting.

### CONFIG
- **Keybinds** — Rebind: Toggle Hub (RightShift), Noclip (T), Fly (F), ESP (E), Godmode (G).
- **Whitelist** — Add player by name, clear, view.
- **Export/Import** — Copy settings as JSON / paste from clipboard.
- **Reset All** — Restore defaults.
- Version info + disclaimer.

---

## Additional Systems

- **God Mode** (keybind G) — Keeps health at max every Heartbeat.
- **Character Respawn Handler** — Re-applies WalkSpeed, JumpPower, HipHeight, Noclip, Godmode on respawn.
- **ESP Update Loop** — RenderStepped updates roles, distances, beams.
- **Player Cleanup** — ESP objects removed when player leaves.
- **Hub Destruction** — All connections and caches cleared on GUI removal.
- **Draggable Window** — Header bar supports mouse/touch drag.
- **Minimize/Close** — Minimize collapses to header, close hides 1 sec then restores.

---

GitHub: https://github.com/fungamer1234/MM2-hub
