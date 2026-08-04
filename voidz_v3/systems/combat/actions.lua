--[[ Core player actions: fling, bring, kill, void, ragdoll, tp, spectate ]]
return function(require)
	local Services = require("core.services")
	local State = require("core.state")
	local Util = require("core.util")
	local Bus = require("core.bus")
	local Ownership = require("systems.object.ownership")

	local Actions = {}

	local function power()
		return tonumber(State.getValue("flingPower", 12000)) or 12000
	end

	local function forceUnsit(p)
		local h = p.Character and p.Character:FindFirstChildOfClass("Humanoid")
		if h then
			pcall(function()
				h.Sit = false
				h.PlatformStand = false
			end)
		end
	end

	local function applyVel(part, pwr, up)
		if not part then
			return
		end
		pwr = pwr or power()
		up = up == nil and 0.5 or up
		local cam = workspace.CurrentCamera
		local look = cam and cam.CFrame.LookVector or Vector3.new(0, 0, -1)
		local dir = Vector3.new(look.X, up, look.Z)
		if dir.Magnitude < 1e-3 then
			dir = Vector3.new(0, 1, 0)
		end
		dir = dir.Unit
		local spd = math.clamp(pwr, 400, 1e5)
		pcall(function()
			local old = part:FindFirstChild("FlingAuraVelocity") or part:FindFirstChild("VOIDZ_BV")
			if old then
				old:Destroy()
			end
			local bv = Instance.new("BodyVelocity")
			bv.Name = "FlingAuraVelocity"
			bv.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
			bv.Velocity = dir * spd
			bv.Parent = part
			Services.Debris:AddItem(bv, 0.55)
			part.AssemblyLinearVelocity = dir * spd
			part.AssemblyAngularVelocity = Vector3.new(spd / 40, spd / 35, spd / 40)
		end)
	end

	local function skyVel(part)
		if not part then
			return
		end
		pcall(function()
			part.AssemblyLinearVelocity = Vector3.new(0, 1e5, 0)
			local bv = part:FindFirstChild("SkyVelocity")
			if not bv then
				bv = Instance.new("BodyVelocity")
				bv.Name = "SkyVelocity"
				bv.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
				bv.Parent = part
			end
			bv.Velocity = Vector3.new(0, 1e14, 0)
		end)
	end

	local function homeCF()
		local me = Util.hrp()
		return me and me.CFrame
	end

	local function restore(home)
		local me = Util.hrp()
		if home and me then
			pcall(function()
				me.CFrame = home
				me.AssemblyLinearVelocity = Vector3.zero
			end)
		end
	end

	local function visit(p, frames, fn)
		for _ = 1, frames do
			if not Util.validP(p) then
				break
			end
			local r = Util.rootOf(p)
			if not r then
				break
			end
			local me = Util.hrp()
			if me then
				if r.Position.Y <= -12 then
					me.CFrame = CFrame.new(r.Position + Vector3.new(0, 5, -15))
				else
					me.CFrame = CFrame.new(r.Position + Vector3.new(0, -10, -10))
				end
			end
			Ownership.sno(r)
			Ownership.snoPlayer(p)
			forceUnsit(p)
			if fn then
				fn(r)
			end
			local owned = false
			pcall(function()
				owned = r.AssemblyLinearVelocity.Magnitude > 500
			end)
			if owned then
				break
			end
			task.wait()
		end
	end

	function Actions.fling(p, pwr, quiet)
		if not Util.validP(p) then
			return false
		end
		pwr = tonumber(pwr) or power()
		local home = homeCF()
		local r
		visit(p, 50, function(root)
			r = root
		end)
		r = Util.rootOf(p)
		if r then
			applyVel(r, pwr, 0.1)
		end
		restore(home)
		if not quiet then
			Bus.emit("action.fling", p)
		end
		return true
	end

	function Actions.kill(p, quiet)
		if not Util.validP(p) then
			return false
		end
		local home = homeCF()
		visit(p, 50, function(r)
			local h = p.Character and p.Character:FindFirstChildOfClass("Humanoid")
			if h then
				pcall(function()
					h.BreakJointsOnDeath = false
					h:ChangeState(Enum.HumanoidStateType.Dead)
					h.Jump = true
					h.Sit = false
				end)
			end
			skyVel(r)
		end)
		local r = Util.rootOf(p)
		if r then
			skyVel(r)
		end
		restore(home)
		if not quiet then
			Bus.emit("action.kill", p)
		end
		return true
	end

	function Actions.void(p, quiet)
		if not Util.validP(p) then
			return false
		end
		local home = homeCF()
		for _ = 1, 20 do
			if not Util.validP(p) then
				break
			end
			local r = Util.rootOf(p)
			if not r then
				break
			end
			Ownership.snoPlayer(p)
			forceUnsit(p)
			pcall(function()
				r.CanCollide = false
				r.AssemblyLinearVelocity = Vector3.new(0, -5000, 0)
				r.CFrame = CFrame.new(r.Position.X, math.min(r.Position.Y - 15, -30), r.Position.Z)
				local h = p.Character and p.Character:FindFirstChildOfClass("Humanoid")
				if h then
					h:ChangeState(Enum.HumanoidStateType.Dead)
				end
			end)
			task.wait()
		end
		restore(home)
		if not quiet then
			Bus.emit("action.void", p)
		end
		return true
	end

	function Actions.bring(p, quiet)
		if not Util.validP(p) then
			return false
		end
		local me = Util.hrp()
		if not me then
			return false
		end
		local home = me.CFrame
		local dest = home * CFrame.new(0, 1.5, -6)
		visit(p, 50, function(r)
			Ownership.createGrabLine(
				p.Character:FindFirstChild("Torso") or p.Character:FindFirstChild("UpperTorso") or r,
				r.CFrame
			)
			if (r.Position - home.Position).Magnitude < 45 then
				pcall(function()
					r.CFrame = dest
					local bp = r:FindFirstChild("BringBody")
					if not bp then
						bp = Instance.new("BodyPosition")
						bp.Name = "BringBody"
						bp.MaxForce = Vector3.new(1e5, 1e5, 1e5)
						bp.P = 2e4
						bp.Parent = r
					end
					bp.Position = dest.Position
					Services.Debris:AddItem(bp, 1.2)
				end)
			end
		end)
		local r = Util.rootOf(p)
		if r then
			pcall(function()
				r.CFrame = dest
			end)
		end
		restore(home)
		if not quiet then
			Bus.emit("action.bring", p)
		end
		return true
	end

	function Actions.ragdoll(p)
		if not Util.validP(p) then
			return false
		end
		local r = Util.rootOf(p)
		Ownership.snoPlayer(p)
		local remote = Services.FTAP.RagdollRemote
		if remote and r then
			for _ = 1, 3 do
				pcall(function()
					remote:FireServer(r, 0)
				end)
			end
		end
		local h = p.Character and p.Character:FindFirstChildOfClass("Humanoid")
		if h then
			pcall(function()
				h:ChangeState(Enum.HumanoidStateType.Physics)
				h.PlatformStand = true
			end)
		end
		return true
	end

	function Actions.tpTo(p)
		local me = Util.hrp()
		local r = Util.rootOf(p)
		if me and r then
			me.CFrame = r.CFrame + Vector3.new(0, 3, 0)
			return true
		end
		return false
	end

	function Actions.spectate(p)
		local cam = workspace.CurrentCamera
		local t = p and p.Character
		if cam and t then
			cam.CameraSubject = t:FindFirstChildOfClass("Humanoid") or t
			return true
		end
		return false
	end

	function Actions.unspectate()
		local cam = workspace.CurrentCamera
		local h = Util.hum()
		if cam and h then
			cam.CameraSubject = h
			return true
		end
		return false
	end

	function Actions.sky(p)
		if not Util.validP(p) then
			return false
		end
		local home = homeCF()
		visit(p, 25, function(r)
			skyVel(r)
			applyVel(r, power(), 2)
		end)
		restore(home)
		return true
	end

	function Actions.spin(p)
		local r = Util.rootOf(p)
		if not r then
			return false
		end
		Ownership.sno(r)
		pcall(function()
			r.AssemblyAngularVelocity = Vector3.new(0, 120, 0)
		end)
		return true
	end

	function Actions.destroyGrab(p)
		local r = Util.rootOf(p)
		if not r then
			return false
		end
		local model = p.Character
		if model then
			for _, d in ipairs(model:GetDescendants()) do
				if d.Name == "GrabParts" or d.Name == "PartOwner" then
					pcall(function()
						d:Destroy()
					end)
				end
			end
		end
		Ownership.destroyGrabLine(r)
		return true
	end

	function Actions.applyVel(part, pwr, up)
		return applyVel(part, pwr, up)
	end

	function Actions.skyVel(part)
		return skyVel(part)
	end

	return Actions
end
