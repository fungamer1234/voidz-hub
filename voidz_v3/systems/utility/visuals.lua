return function(require)
	local Services = require("core.services")
	local State = require("core.state")
	local Loop = require("core.loop")

	local Visuals = {}

	function Visuals.fullbright(on)
		State.setToggle("fullbright", on == true)
		if not on then
			Loop.stop("vis.fullbright")
			pcall(function()
				Services.Lighting.Brightness = 2
				Services.Lighting.ClockTime = 14
				Services.Lighting.FogEnd = 100000
				Services.Lighting.GlobalShadows = true
			end)
			return
		end
		Loop.start("vis.fullbright", 0.5, function()
			if not State.getToggle("fullbright") then
				return
			end
			pcall(function()
				Services.Lighting.Brightness = 3
				Services.Lighting.ClockTime = 14
				Services.Lighting.FogEnd = 1e6
				Services.Lighting.GlobalShadows = false
				Services.Lighting.OutdoorAmbient = Color3.new(1, 1, 1)
			end)
		end)
	end

	function Visuals.night()
		pcall(function()
			Services.Lighting.ClockTime = 0
			Services.Lighting.Brightness = 1
		end)
	end

	function Visuals.day()
		pcall(function()
			Services.Lighting.ClockTime = 14
			Services.Lighting.Brightness = 2
		end)
	end

	function Visuals.sync()
		if State.getToggle("fullbright") then
			Visuals.fullbright(true)
		end
	end

	return Visuals
end
