return function(require)
	local C = require("ui.components")
	local Theme = require("ui.theme")
	local State = require("core.state")
	local Services = require("core.services")
	local Loop = require("core.loop")
	local Ownership = require("systems.object.ownership")
	local Select = require("systems.player.select")

	return function(parent)
		local scroll = C.scroll(parent)

		local hero = C.section(scroll, nil)
		C.label(hero, "VOIDZ HUB 2.0", { bold = true, size = 24, color = Theme.accentGlow, h = 30 })
		C.label(hero, "Premium FTAP hub  -  full toolkit restored", { size = 13, color = Theme.text, h = 20 })
		C.label(hero, "Key VOIDZHUB  |  RightShift hide  |  Right-click players = loop targets", {
			size = 11,
			color = Theme.textDim,
			h = 18,
		})

		local status = C.section(scroll, "STATUS")
		C.label(status, "Player: " .. (Services.LP and Services.LP.Name or "?"), { size = 12, h = 18 })
		C.label(status, "Target: " .. Select.label(), { size = 12, color = Theme.accent2, h = 18 })
		C.label(status, "Build: " .. tostring(State.version), { size = 12, color = Theme.textMuted, h = 18 })
		local st = Ownership.status()
		C.label(status, string.format(
			"Remotes  SNO:%s  GrabLine:%s  SpawnToy:%s",
			st.SetNetworkOwner and "Y" or "N",
			st.CreateGrabLine and "Y" or "N",
			st.SpawnToy and "Y" or "N"
		), { size = 11, color = Theme.textDim, h = 16 })
		local loops = Loop.list()
		C.label(status, "Active loops: " .. (#loops > 0 and table.concat(loops, ", ") or "none"), {
			size = 11,
			color = Theme.textDim,
			wrap = true,
			h = 32,
		})

		local tabs = C.section(scroll, "TABS")
		local items = {
			"Combat - fling, kill, bring, void, kicks, stack kick",
			"Blobman - classic 1.2.75 grab + sticky opt-in",
			"Player - quick actions, stalk, whitelist",
			"Auras - nearby effects",
			"Loops - keep throwing / kick / bring / more",
			"Protect - Gucci, Anti-Grab, War, Anti-AFK",
			"Move / Visuals / Toys / World / Server",
		}
		for _, line in ipairs(items) do
			C.label(tabs, "*  " .. line, { size = 12, color = Theme.textMuted, h = 17 })
		end
	end
end
