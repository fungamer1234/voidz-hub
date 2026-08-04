return function(require)
	local C = require("ui.components")
	local Theme = require("ui.theme")
	local State = require("core.state")
	local Config = require("core.config")
	local Notify = require("ui.notify")
	local Grab = require("systems.grab.core")
	local Select = require("systems.player.select")
	local Actions = require("systems.combat.actions")
	local Ownership = require("systems.object.ownership")

	return function(parent)
		local scroll = C.scroll(parent)
		C.targetBanner(scroll, Select)

		local sec = C.section(scroll, "GRAB LINE")
		C.label(sec, "Phase: " .. tostring(Grab.phase), { size = 12, color = Theme.accentGlow, h = 18 })

		local g = C.grid(sec, 140, 34, 8)
		C.button(g, "Latch Selected", function()
			local t = Select.get()
			if not t then
				Notify.warn("Grab", "Pick a player")
				return
			end
			task.spawn(function()
				Notify.info("Grab", Grab.latch(t) and "Holding" or "Failed")
			end)
		end, { w = 140, h = 34, accent = true })
		C.button(g, "Release", function()
			Grab.release()
			Notify.info("Grab", "Released")
		end, { w = 140, h = 34 })
		C.button(g, "Destroy Their Grab", function()
			local t = Select.get()
			if t then
				Actions.destroyGrab(t)
			end
		end, { w = 140, h = 34, danger = true })
		C.button(g, "SNO Target", function()
			local t = Select.get()
			if t then
				Ownership.snoPlayer(t)
			end
		end, { w = 140, h = 34 })

		C.toggle(sec, "Loop latch selected", function()
			return State.getToggle("grabLoop")
		end, function(v)
			if v and not Select.get() then
				Notify.warn("Grab", "Pick a player")
				return
			end
			Grab.loopSelected(v)
			Config.save()
		end)

		C.label(scroll, "Blobman CreatureGrab is on the Blobman tab (classic park path).", {
			size = 11,
			color = Theme.textDim,
			h = 24,
		})
	end
end
