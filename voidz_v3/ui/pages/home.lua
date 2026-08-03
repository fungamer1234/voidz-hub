return function(require)
	local C = require("ui.components")
	local Theme = require("ui.theme")
	local State = require("core.state")
	local Services = require("core.services")

	return function(parent)
		local scroll = C.scroll(parent)

		local hero = C.section(scroll, nil)
		C.label(hero, "VOIDZ HUB", { bold = true, size = 22, color = Theme.accentGlow, h = 28 })
		C.label(hero, "V3 rebuild - premium shell", { size = 12, color = Theme.textMuted, h = 18 })
		C.label(hero, "Ship target 2.0.0 - modular systems", { size = 11, color = Theme.textDim, h = 16 })


		local status = C.section(scroll, "STATUS")
		local lp = Services.LP
		C.label(status, "Player: " .. (lp and lp.Name or "?"), { size = 12, color = Theme.text, h = 18 })
		C.label(status, "PlaceId: " .. tostring(game.PlaceId), { size = 12, color = Theme.textMuted, h = 18 })
		C.label(status, "Build: " .. tostring(State.version) .. "  phase " .. tostring(State.phase), {
			size = 12,
			color = Theme.textMuted,
			h = 18,
		})

		C.label(status, "FTAP remotes: " .. (Services.FTAP.ok and "resolved" or "pending / offline"), {
			size = 12,
			color = Services.FTAP.ok and Theme.success or Theme.warn,
			h = 18,
		})

		local map = C.section(scroll, "ROADMAP")
		local items = {
			"Phase 1 - Core + UI shell (done)",
			"Phase 2 - Gucci + Anti-Grab + War (done)",
			"Phase 3 - Grab + Blobman + kicks (done)",
			"Phase 4 - Anchor grab + ownership / toys (you are here)",
			"Phase 5 - Polish -> 2.0.0",
		}

		for _, line in ipairs(items) do
			C.label(map, "*  " .. line, { size = 12, color = Theme.textMuted, h = 18 })
		end


		local tip = C.section(scroll, "NOTE")
		C.label(tip, "Gucci (visual free hold) and Anti-Grab (break/prevent) are separate systems. Never merge them.", {
			size = 12,
			color = Theme.warn,
			wrap = true,
			h = 48,
		})
	end
end
