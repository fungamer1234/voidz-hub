--[[
  Kick types: Phoenix, Velocity, Sky, Hard, Void, Ragdoll, Blobman, GrabKick, StackKick.
  Shared context; restore local physics after.
]]
return function(require)
	local Services = require("core.services")
	local State = require("core.state")
	local Util = require("core.util")
	local Bus = require("core.bus")
	local Loop = require("core.loop")
	local Ownership = require("systems.object.ownership")
	local Blobman = require("systems.grab.blobman")

	local Kick = {
		TYPES = {
			"Phoenix",
			"Velocity",
			"Sky",
			"Hard",
			"Void",
			"Ragdoll",
			"Blobman",
			"GrabKick",
			"StackKick",
		},
	}

	local function power()
		return tonumber(State.getValue("flingPower", 12000)) or 12000
	end

	local function forceUnsit(player)
		local h = player.Character and player.Character:FindFirstChildOfClass("Humanoid")
		if h then
			pcall(function()
				h.Sit = false
				h.PlatformStand = false
			end)
		end
	end

	local function applyVel(part, mag, yMul)
		if not part then
			return
		end
		yMul = yMul or 1
		pcall(function()
			part.AssemblyLinearVelocity = Vector3.new(
				(math.random() - 0.5) * mag,
				mag * yMul,
				(math.random() - 0.5) * mag
			)
		end)
	end

	local function skyVel(part)
		if not part then
			return
		end
		pcall(function()
			part.AssemblyLinearVelocity = Vector3.new(0, math.clamp(power(), 2000, 50000), 0)
			part.AssemblyAngularVelocity = Vector3.zero
		end)
	end

	local function createKickPhysical(part, mode)
		if not part or not part.Parent then
			return
		end
		mode = mode or "Sky"
		pcall(function()
			local bp = part:FindFirstChild("KickAuraP")
			if not bp then
				bp = Instance.new("BodyPosition")
				bp.Name = "KickAuraP"
				bp.D = 1250
				bp.P = 30000
				bp.Parent = part
			end
			local bv = part:FindFirstChild("KickAuraP1")
			if not bv then
				bv = Instance.new("BodyVelocity")
				bv.Name = "KickAuraP1"
				bv.Velocity = Vector3.new(0, 400, 0)
				bv.Parent = part
			end
			local zero = Vector3.zero
			local skyForce = Vector3.new(0, 12500, 0)
			local floatForce = Vector3.new(4000, 4000, 4000)
			local skyPos = Vector3.new(math.random(50, 250), 250, math.random(50, 250))
			if mode == "Float" then
				bv.MaxForce = floatForce
				bv.Velocity = Vector3.new(0, 400, 0)
				bp.MaxForce = zero
			else
				bp.MaxForce = floatForce
				bp.Position = skyPos
				bv.MaxForce = zero
			end
		end)
	end

	local function saveHome()
		local me = Util.hrp()
		return me and me.CFrame or nil
	end

	local function restoreHome(home)
		local me = Util.hrp()
		local hum = Util.hum()
		if home and me then
			pcall(function()
				me.CFrame = home
				me.AssemblyLinearVelocity = Vector3.zero
				me.AssemblyAngularVelocity = Vector3.zero
			end)
		end
		if hum then
			pcall(function()
				hum.PlatformStand = false
				hum.Sit = false
			end)
		end
	end

	local function destroyGrabOn(root)
		if not root then
			return
		end
		local model = root:FindFirstAncestorOfClass("Model") or root.Parent
		if not model then
			return
		end
		for _, d in ipairs(model:GetDescendants()) do
			if d.Name == "GrabParts" or d.Name == "PartOwner" then
				pcall(function()
					d:Destroy()
				end)
			end
		end
		Ownership.destroyGrabLine(root)
	end

	function Kick.run(player, ktype, quiet)
		if not Util.validP(player) then
			return false
		end
		ktype = ktype or State.getValue("kickType", "Phoenix") or "Phoenix"
		local home = saveHome()
		local r = Util.rootOf(player)
		if not r then
			return false
		end

		forceUnsit(player)
		Ownership.resolve()

		if ktype == "Phoenix" then
			for _ = 1, 12 do
				r = Util.rootOf(player)
				if not r then
					break
				end
				Ownership.sno(r)
				destroyGrabOn(r)
				skyVel(r)
				applyVel(r, power(), 1.2)
				createKickPhysical(r, "Sky")
				task.wait()
			end
		elseif ktype == "Velocity" or ktype == "Hard" then
			for _ = 1, 10 do
				r = Util.rootOf(player)
				if not r then
					break
				end
				Ownership.sno(r)
				applyVel(r, math.max(power(), 8000), 0.9)
				task.wait()
			end
		elseif ktype == "Sky" then
			for _ = 1, 10 do
				r = Util.rootOf(player)
				if not r then
					break
				end
				Ownership.sno(r)
				createKickPhysical(r, "Sky")
				skyVel(r)
				applyVel(r, power(), 2.5)
				task.wait()
			end
		elseif ktype == "Void" then
			for _ = 1, 8 do
				r = Util.rootOf(player)
				if not r then
					break
				end
				Ownership.sno(r)
				pcall(function()
					r.CFrame = CFrame.new(0, -500, 0)
					r.AssemblyLinearVelocity = Vector3.new(0, -1e5, 0)
				end)
				task.wait()
			end
		elseif ktype == "Ragdoll" then
			local hum = player.Character and player.Character:FindFirstChildOfClass("Humanoid")
			local remote = Services.FTAP.RagdollRemote
			if remote then
				pcall(function()
					if remote:IsA("RemoteEvent") then
						remote:FireServer(true)
					end
				end)
			end
			if hum then
				pcall(function()
					hum:ChangeState(Enum.HumanoidStateType.Ragdoll)
					hum.PlatformStand = true
				end)
			end
			r = Util.rootOf(player)
			if r then
				Ownership.sno(r)
				applyVel(r, power() * 0.6, 0.5)
			end
		elseif ktype == "Blobman" then
			Blobman.ensure(true)
			for _ = 1, 18 do
				r = Util.rootOf(player)
				if not r then
					break
				end
				Ownership.snoPlayer(player)
				local me = Util.hrp()
				if me then
					pcall(function()
						r.CFrame = me.CFrame * CFrame.new(0, 4, 0)
					end)
				end
				destroyGrabOn(r)
				skyVel(r)
				applyVel(r, 22000, 0.08)
				task.wait()
			end
		elseif ktype == "GrabKick" then
			for _ = 1, 15 do
				r = Util.rootOf(player)
				if not r then
					break
				end
				local me = Util.hrp()
				if me then
					pcall(function()
						me.CFrame = r.CFrame * CFrame.new(0, 1, 2)
					end)
				end
				Ownership.sno(r)
				local t = player.Character
					and (player.Character:FindFirstChild("Torso") or player.Character:FindFirstChild("UpperTorso") or r)
				Ownership.createGrabLine(t, t.CFrame)
				skyVel(r)
				applyVel(r, 18000, 0.15)
				task.wait()
			end
		elseif ktype == "StackKick" then
			-- phased timers; no jitter spam
			local phases = {
				{ wait = 0.05, y = -10, z = -10 },
				{ wait = 0.05, y = -10, z = -10 },
				{ wait = 0.08, y = 5, z = -15 },
			}
			for i = 0, 50 do
				r = Util.rootOf(player)
				if not r then
					break
				end
				Ownership.snoPlayer(player)
				Ownership.sno(r)
				local owned = false
				pcall(function()
					owned = r:GetNetworkOwner() == Services.LP
				end)
				local speed = 0
				pcall(function()
					speed = r.AssemblyLinearVelocity.Magnitude
				end)
				if owned or speed > 500 or i > 40 then
					destroyGrabOn(r)
					task.wait(0.03)
					skyVel(r)
					applyVel(r, 22000, 0.1)
					createKickPhysical(r, "Sky")
					break
				end
				local ph = phases[(i % #phases) + 1]
				local me = Util.hrp()
				if me then
					pcall(function()
						if r.Position.Y <= -12 then
							me.CFrame = CFrame.new(r.Position + Vector3.new(0, 5, -15))
						else
							me.CFrame = CFrame.new(r.Position + Vector3.new(0, ph.y, ph.z))
						end
					end)
				end
				task.wait(ph.wait)
			end
		else
			-- default phoenix-like
			r = Util.rootOf(player)
			if r then
				Ownership.sno(r)
				skyVel(r)
				applyVel(r, power(), 1)
			end
		end

		restoreHome(home)
		if not quiet then
			Bus.emit("kick.done", player, ktype)
		end
		return true
	end

	function Kick.selected(ktype)
		local t = State.selected
		if not t then
			return false
		end
		return Kick.run(t, ktype or State.getValue("kickType", "Phoenix"))
	end

	function Kick.loop(on, ktype)
		local id = "kickLoop"
		if not on then
			Loop.stop(id)
			State.setToggle("kickLoop", false)
			return
		end
		State.setToggle("kickLoop", true)
		local kt = ktype or State.getValue("kickType", "Phoenix")
		Loop.start(id, 0.55, function()
			if not State.getToggle("kickLoop") then
				return
			end
			local t = State.selected
			if Util.validP(t) then
				Kick.run(t, kt, true)
			end
		end)
	end

	return Kick
end
