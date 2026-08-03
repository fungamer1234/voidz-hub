return function(require)
	local C = require("ui.components")
	local Theme = require("ui.theme")
	local Notify = require("ui.notify")
	local Select = require("systems.player.select")
	local Util = require("core.util")

	return function(parent)
		local scroll = C.scroll(parent)

		local head = C.section(scroll, "SELECTED")
		C.label(head, Select.label(), { size = 14, color = Theme.accentGlow, bold = true, h = 22 })

		C.button(head, "Clear selection", function()
			Select.set(nil)
			Notify.info("Player", "Cleared")
		end, { w = 140 })

		local list = C.section(scroll, "PLAYERS")
		for _, p in ipairs(Select.list()) do
			local label = Util.playerLabel(p)
			C.button(list, label, function()
				Select.set(p)
				Notify.success("Player", "Selected " .. p.Name)
			end, { w = 260, h = 30 })
		end
	end
end
