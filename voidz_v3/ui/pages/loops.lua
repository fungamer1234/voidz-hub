return function(require)
	local C = require("ui.components")
	local Theme = require("ui.theme")
	local State = require("core.state")
	local Config = require("core.config")
	local Notify = require("ui.notify")
	local Select = require("systems.player.select")
	local Loops = require("systems.combat.loops")

	return function(parent)
		local scroll = C.scroll(parent)
		local head = C.section(scroll, "LOOPS")
		C.label(head, "Runs on selected + multi-targets (right-click players). Target: " .. Select.label(), {
			size = 12,
			color = Theme.textMuted,
			wrap = true,
			h = 36,
		})

		local list = C.section(scroll, "PLAYER LOOPS")
		for _, d in ipairs(Loops.defs) do
			C.toggle(list, d.title, function()
				return State.getToggle(d.id)
			end, function(v)
				if v and #Select.targets() == 0 then
					Notify.warn("Loops", "Pick a player first")
					return
				end
				Loops.set(d.id, v)
				Config.save()
				Notify.info(d.title, v and "ON" or "OFF")
			end)
		end
	end
end
