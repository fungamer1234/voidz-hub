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

		local speed = C.section(scroll, "WALK SPEED")
		local g = C.grid(speed, 100, 34, 8)
		for _, v in ipairs({ 16, 24, 32, 48, 64, 100 }) do
			C.button(g, "SPD " .. v, function()
				local h = Util.hum()
				if h then
					h.WalkSpeed = v
					Notify.info("Move", "WalkSpeed " .. v)
				end
			end, { w = 100, h = 34, accent = v == 32 })
		end

		local jump = C.section(scroll, "JUMP")
		local jg = C.grid(jump, 100, 34, 8)
		for _, v in ipairs({ 50, 75, 100, 150 }) do
			C.button(jg, "JP " .. v, function()
				local h = Util.hum()
				if h then
					pcall(function()
						h.UseJumpPower = true
						h.JumpPower = v
					end)
					Notify.info("Move", "JumpPower " .. v)
				end
			end, { w = 100, h = 34 })
		end
		C.button(jg, "Reset", function()
			local h = Util.hum()
			if h then
				h.WalkSpeed = 16
				pcall(function()
					h.JumpPower = 50
				end)
			end
		end, { w = 100, h = 34 })

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
		end)

		local fly = C.section(scroll, "FLY")
		local frow = C.row(fly)
		for _, v in ipairs({ 40, 60, 90, 140 }) do
			C.chip(frow, "Fly " .. v, function()
				State.setValue("flySpeed", v)
				Config.save()
			end, { on = State.getValue("flySpeed", 60) == v, w = 72 })
		end
		C.toggle(fly, "Fly (WASD Space/Ctrl)", function()
			return State.getToggle("fly")
		end, function(v)
			State.setToggle("fly", v)
			Config.save()
			if not v then
				Loop.stop("move.fly")
				local h = Util.hum()
				local hrp = Util.hrp()
				if h then
					h.PlatformStand = false
				end
				if hrp then
					local bv = hrp:FindFirstChild("VOIDZ_V3_Fly")
					if bv then
						bv:Destroy()
					end
				end
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
				if uis:IsKeyDown(Enum.KeyCode.LeftControl) then
					dir = dir - Vector3.new(0, 1, 0)
				end
				local spd = tonumber(State.getValue("flySpeed", 60)) or 60
				bv.Velocity = dir.Magnitude > 0 and dir.Unit * spd or Vector3.zero
			end)
			Notify.info("Move", "Fly ON")
		end)
	end
end
