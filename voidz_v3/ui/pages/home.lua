return function(require)
	local C = require("ui.components")
	local Theme = require("ui.theme")
	local State = require("core.state")
	local Services = require("core.services")
	local Loop = require("core.loop")
	local Ownership = require("systems.object.ownership")

	return function(parent)
		local scroll = C.scroll(parent)

		local hero = C.section(scroll, nil)
		C.label(hero, "VOIDZ HUB", { bold = true, size = 22, color = Theme.accentGlow, h = 28 })
		C.label(hero, "2.0.0  -  modular FTAP hub", { size = 13, color = Theme.text, h = 20 })
		C.label(hero, "Phase 5 complete  |  ship tag 2.0.0", { size = 11, color = Theme.success, h = 16 })

		local status = C.section(scroll, "STATUS")
		local lp = Services.LP
		C.label(status, "Player: " .. (lp and lp.Name or "?"), { size = 12, color = Theme.text, h = 18 })
		C.label(status, "PlaceId: " .. tostring(game.PlaceId), { size = 12, color = Theme.textMuted, h = 18 })
		C.label(status, "Build: " .. tostring(State.version), {
			size = 12,
			color = Theme.textMuted,
			h = 18,
		})
		C.label(status, "FTAP remotes: " .. (Services.FTAP.ok and "resolved" or "pending / offline"), {
			size = 12,
			color = Services.FTAP.ok and Theme.success or Theme.warn,
			h = 18,
		})

		local st = Ownership.status()
		C.label(status, string.format(
			"SNO:%s  GrabLine:%s  SpawnToy:%s",
			st.SetNetworkOwner and "Y" or "N",
			st.CreateGrabLine and "Y" or "N",
			st.SpawnToy and "Y" or "N"
		), { size = 11, color = Theme.textDim, h = 16 })

		local loops = Loop.list()
		C.label(status, "Active loops: " .. (#loops > 0 and table.concat(loops, ", ") or "none"), {
			size = 11,
			color = Theme.textDim,
			wrap = true,
			h = 28,
		})

		local map = C.section(scroll, "SHIPPED")
		local items = {
			"Defense: Gucci / Anti-Grab (15) / War - separate",
			"Blobman 1.2.75 grab + sticky opt-in",
			"Kicks + StackKick",
			"Anchor grab + toys + ownership",
			"Move: speed / noclip / simple fly",
		}
		for _, line in ipairs(items) do
			C.label(map, "*  " .. line, { size = 12, color = Theme.textMuted, h = 18 })
		end

		local tip = C.section(scroll, "NOTE")
		C.label(tip, "Gucci (visual free hold) and Anti-Grab (break/prevent) stay separate. Never merge.", {
			size = 12,
			color = Theme.warn,
			wrap = true,
			h = 48,
		})
	end
end
