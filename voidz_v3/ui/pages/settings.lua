return function(require)
	local C = require("ui.components")
	local Theme = require("ui.theme")
	local Config = require("core.config")
	local Notify = require("ui.notify")
	local State = require("core.state")
	local Bus = require("core.bus")
	local Errors = require("core.errors")
	local Loop = require("core.loop")

	return function(parent)
		local scroll = C.scroll(parent)

		local ui = C.section(scroll, "INTERFACE")
		C.toggle(ui, "Animations", function()
			return State.getToggle("uiAnimations")
		end, function(v)
			State.setToggle("uiAnimations", v)
			Config.save()
		end)
		C.toggle(ui, "Public load chat line", function()
			return State.getToggle("publicLoadChat")
		end, function(v)
			State.setToggle("publicLoadChat", v)
			Config.save()
		end)


		local data = C.section(scroll, "CONFIG")
		C.button(data, "Save config", function()
			if Config.save() then
				Notify.success("Config", "Saved")
			else
				Notify.error("Config", "Save failed")
			end
		end, { w = 140, accent = true })

		C.button(data, "Reload defaults", function()
			Config.reset()
			Notify.warn("Config", "Reset to defaults - reopen hub to refresh UI")
		end, { w = 140 })

		local perf = C.section(scroll, "PERFORMANCE")
		C.button(perf, "Stop all feature loops", function()
			Loop.stopAll()
			Notify.warn("Perf", "All loops stopped")
		end, { w = 180 })

		local loops = Loop.list()
		C.label(perf, "Running: " .. (#loops > 0 and table.concat(loops, ", ") or "none"), {
			size = 11,
			color = Theme.textDim,
			wrap = true,
			h = 32,
		})

		local err = C.section(scroll, "ERRORS")
		local recent = Errors.getRecent()
		if #recent == 0 then
			C.label(err, "No recent errors", { size = 12, color = Theme.textMuted, h = 18 })
		else
			for i = math.max(1, #recent - 4), #recent do
				local e = recent[i]
				C.label(err, e.scope .. ": " .. e.err, {
					size = 11,
					color = Theme.danger,
					wrap = true,
					h = 28,
				})
			end
		end

		local hub = C.section(scroll, "HUB")
		C.button(hub, "Unload VOIDZ V3", function()
			Bus.emit("hub:unload")
		end, { w = 160, bg = Theme.danger, hover = Color3.fromRGB(220, 70, 90) })

		C.label(scroll, "VOIDZ HUB 2.0.0  |  key VOIDZHUB  |  RightShift toggle", {
			size = 11,
			color = Theme.textDim,
			h = 20,
		})
	end
end
