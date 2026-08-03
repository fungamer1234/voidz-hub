return function(require)
	local C = require("ui.components")
	local Theme = require("ui.theme")
	local State = require("core.state")
	local Config = require("core.config")
	local Notify = require("ui.notify")
	local Util = require("core.util")
	local Loop = require("core.loop")
	local Services = require("core.services")

	return function(parent)
		local scroll = C.scroll(parent)

		local note = C.section(scroll, "MOVEMENT")
		C.label(note, "Light utilities for 2.0.0. Full movement suite can expand later.", {
			size = 12,
			color = Theme.textMuted,
			wrap = true,
			h = 36,
		})

		local speed = C.section(scroll, "WALK SPEED")
		C.button(speed, "Speed 16 (default)", function()
			local h = Util.hum()
			if h then
				h.WalkSpeed = 16
				Notify.info("Move", "WalkSpeed 16")
			end
		end, { w = 150 })
		C.button(speed, "Speed 32", function()
			local h = Util.hum()
			if h then
				h.WalkSpeed = 32
				Notify.info("Move", "WalkSpeed 32")
			end
		end, { w = 120, accent = true })
		C.button(speed, "Speed 64", function()
			local h = Util.hum()
			if h then
				h.WalkSpeed = 64
				Notify.info("Move", "WalkSpeed 64")
			end
		end, { w = 120 })

		local nclip = C.section(scroll, "NOCLIP")
		C.toggle(nclip, "Noclip", function()
			return State.getToggle("noclip")
		end, function(v)
			State.setToggle("noclip", v)
			Config.save()
			if not v then
				Loop.stop("move.noclip")
				local c = Util.char()
				if c then
					for _, p in ipairs(c:GetDescendants()) do
						if p:IsA("BasePart") then
							p.CanCollide = p.Name ~= "HumanoidRootPart"
						end
					end
				end
				Notify.info("Move", "Noclip OFF")
				return
			end
			Loop.start("move.noclip", 0.08, function()
				local c = Util.char()
				if not c or not State.getToggle("noclip") then
					return
				end
				for _, p in ipairs(c:GetDescendants()) do
					if p:IsA("BasePart") then
						p.CanCollide = false
					end
				end
			end)
			Notify.info("Move", "Noclip ON")
		end)

		local fly = C.section(scroll, "FLY (simple)")
		C.toggle(fly, "Fly", function()
			return State.getToggle("fly")
		end, function(v)
			State.setToggle("fly", v)
			Config.save()
			if not v then
				Loop.stop("move.fly")
				local h = Util.hum()
				if h then
					h.PlatformStand = false
				end
				Notify.info("Move", "Fly OFF")
				return
			end
			local bv
			Loop.start("move.fly", 0.03, function()
				if not State.getToggle("fly") then
					return
				end
				local hrp = Util.hrp()
				local hum = Util.hum()
				local cam = workspace.CurrentCamera
				if not hrp or not hum or not cam then
					return
				end
				hum.PlatformStand = true
				if not bv or not bv.Parent then
					bv = Instance.new("BodyVelocity")
					bv.Name = "VOIDZ_V3_Fly"
					bv.MaxForce = Vector3.new(1e5, 1e5, 1e5)
					bv.Parent = hrp
				end
				local dir = Vector3.zero
				local uis = Services.UserInputService
				if uis:IsKeyDown(Enum.KeyCode.W) then
					dir = dir + cam.CFrame.LookVector
				end
				if uis:IsKeyDown(Enum.KeyCode.S) then
					dir = dir - cam.CFrame.LookVector
				end
				if uis:IsKeyDown(Enum.KeyCode.A) then
					dir = dir - cam.CFrame.RightVector
				end
				if uis:IsKeyDown(Enum.KeyCode.D) then
					dir = dir + cam.CFrame.RightVector
				end
				if uis:IsKeyDown(Enum.KeyCode.Space) then
					dir = dir + Vector3.new(0, 1, 0)
				end
				if uis:IsKeyDown(Enum.KeyCode.LeftControl) or uis:IsKeyDown(Enum.KeyCode.LeftShift) then
					dir = dir - Vector3.new(0, 1, 0)
				end
				local spd = tonumber(State.getValue("flySpeed", 60)) or 60
				if dir.Magnitude > 0 then
					bv.Velocity = dir.Unit * spd
				else
					bv.Velocity = Vector3.zero
				end
			end)
			Notify.info("Move", "Fly ON (WASD Space/Ctrl)")
		end)
	end
end
