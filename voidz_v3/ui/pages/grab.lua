return function(require)
	local C = require("ui.components")
	local Theme = require("ui.theme")
	local State = require("core.state")
	local Config = require("core.config")
	local Notify = require("ui.notify")
	local Grab = require("systems.grab.core")
	local Select = require("systems.player.select")

	return function(parent)
		local scroll = C.scroll(parent)

		local sec = C.section(scroll, "GRAB LINE")
		C.label(sec, "Target: " .. Select.label(), { size = 12, color = Theme.textMuted, h = 18 })
		C.label(sec, "Phase: " .. tostring(Grab.phase), { size = 12, color = Theme.accentGlow, h = 18 })

		C.button(sec, "Latch selected", function()
			local t = Select.get()
			if not t then
				Notify.warn("Grab", "Pick a player in Player tab")
				return
			end
			task.spawn(function()
				local ok = Grab.latch(t)
				Notify.info("Grab", ok and "Holding" or "Failed")
			end)
		end, { w = 150, accent = true })

		C.button(sec, "Release", function()
			Grab.release()
			Notify.info("Grab", "Released")
		end, { w = 120 })

		C.toggle(sec, "Loop latch selected", function()
			return State.getToggle("grabLoop")
		end, function(v)
			if v and not Select.get() then
				Notify.warn("Grab", "Pick a player first")
				return
			end
			Grab.loopSelected(v)
			Config.save()
		end)

		C.label(scroll, "For Blobman CreatureGrab use the Blobman tab (classic park + LeftDetector).", {
			size = 11,
			color = Theme.textDim,
			wrap = true,
			h = 36,
		})
	end
end
