return function(require)
	local Services = require("core.services")
	local State = require("core.state")
	local Loop = require("core.loop")

	local AntiAFK = {}

	function AntiAFK.set(on)
		State.setToggle("antiafk", on == true)
		if not on then
			Loop.stop("util.antiafk")
			return
		end
		-- virtual user if available
		pcall(function()
			local vu = game:GetService("VirtualUser")
			Services.Players.LocalPlayer.Idled:Connect(function()
				if not State.getToggle("antiafk") then
					return
				end
				vu:CaptureController()
				vu:ClickButton2(Vector2.new())
			end)
		end)
		Loop.start("util.antiafk", 30, function()
			if not State.getToggle("antiafk") then
				return
			end
			pcall(function()
				local vu = game:GetService("VirtualUser")
				vu:CaptureController()
				vu:ClickButton2(Vector2.new())
			end)
		end)
	end

	function AntiAFK.sync()
		if State.getToggle("antiafk") then
			AntiAFK.set(true)
		end
	end

	return AntiAFK
end
