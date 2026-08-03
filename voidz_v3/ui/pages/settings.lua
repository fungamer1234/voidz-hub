return function(require)
	local C = require("ui.components")
	local Theme = require("ui.theme")
	local Config = require("core.config")
	local Notify = require("ui.notify")
	local State = require("core.state")
	local Bus = require("core.bus")

	return function(parent)
		local scroll = C.scroll(parent)

		local ui = C.section(scroll, "INTERFACE")
		C.toggle(ui, "Animations", function()
			return State.getToggle("uiAnimations")
		end, function(v)
			State.setToggle("uiAnimations", v)
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
			Notify.warn("Config", "Reset to defaults — reopen hub to refresh UI")
		end, { w = 140 })

		local hub = C.section(scroll, "HUB")
		C.button(hub, "Unload VOIDZ V3", function()
			Bus.emit("hub:unload")
		end, { w = 160, bg = Theme.danger, hover = Color3.fromRGB(220, 70, 90) })

		C.label(scroll, "Version: " .. tostring(State.version) .. "  |  ship target 2.0.0", {
			size = 11,
			color = Theme.textDim,
			h = 20,
		})

	end
end
