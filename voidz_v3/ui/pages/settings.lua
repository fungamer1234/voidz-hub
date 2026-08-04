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
		C.toggle(ui, "Public load chat line", function()
			return State.getToggle("publicLoadChat")
		end, function(v)
			State.setToggle("publicLoadChat", v)
			Config.save()
		end)

		local data = C.section(scroll, "CONFIG")
		local row = C.row(data)
		C.button(row, "Save", function()
			Notify.info("Config", Config.save() and "Saved" or "Failed")
		end, { w = 100, h = 34, accent = true })
		C.button(row, "Defaults", function()
			Config.reset()
			Notify.warn("Config", "Reset")
		end, { w = 100, h = 34 })

		local perf = C.section(scroll, "PERFORMANCE")
		C.button(perf, "Stop ALL loops", function()
			Loop.stopAll()
			Notify.warn("Perf", "Stopped")
		end, { w = 160, h = 34, danger = true })
		local loops = Loop.list()
		C.label(perf, "Running: " .. (#loops > 0 and table.concat(loops, ", ") or "none"), {
			size = 11,
			color = Theme.textDim,
			wrap = true,
			h = 36,
		})

		local err = C.section(scroll, "ERRORS")
		local recent = Errors.getRecent()
		if #recent == 0 then
			C.label(err, "No recent errors", { size = 12, color = Theme.textMuted, h = 18 })
		else
			for i = math.max(1, #recent - 5), #recent do
				local e = recent[i]
				C.label(err, e.scope .. ": " .. e.err, { size = 11, color = Theme.danger, wrap = true, h = 28 })
			end
		end

		local hub = C.section(scroll, "HUB")
		C.button(hub, "Unload VOIDZ", function()
			Bus.emit("hub:unload")
		end, { w = 150, h = 36, danger = true })

		C.label(scroll, "VOIDZ HUB 2.0.0  |  VOIDZHUB  |  RightShift", {
			size = 11,
			color = Theme.textDim,
			h = 20,
		})
	end
end
