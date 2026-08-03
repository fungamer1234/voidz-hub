--[[
  Gucci - visual free hold (NOT anti-grab).
  Looks held; local player keeps free movement. Never destroys attacker kit.
]]
return function(require)
	local Services = require("core.services")
	local State = require("core.state")
	local Loop = require("core.loop")
	local Util = require("core.util")
	local Bus = require("core.bus")

	local Gucci = {
		id = "gucci",
		active = false,
		_held = false,
	}

	local MOVER_CLASSES = {
		BodyVelocity = true,
		BodyPosition = true,
		BodyAngularVelocity = true,
		BodyForce = true,
		BodyThrust = true,
		LinearVelocity = true,
		AlignPosition = true,
		AlignOrientation = true,
		VectorForce = true,
		Torque = true,
		AngularVelocity = true,
	}

	local function isHeld()
		local char = Util.char()
		if not char then
			return false
		end
		if char:GetAttribute("IsHeld") == true or char:GetAttribute("Held") == true then
			return true
		end
		local hum = Util.hum()
		if hum then
			if hum:GetAttribute("IsHeld") == true then
				return true
			end
			-- Grab seat / platform stand from hostile hold often sets Sit
			local ok, seated = pcall(function()
				return hum.Sit
			end)
			if ok and seated then
				-- only treat as gucci-held if foreign grab parts present
			end
		end
		for _, d in ipairs(char:GetDescendants()) do
			local n = d.Name
			if n == "GrabParts" or n == "GrabPart" or n == "PartOwner" then
				return true
			end
			if d:IsA("Weld") or d:IsA("WeldConstraint") or d:IsA("Motor6D") then
				local p0 = d.Part0
				local p1 = d.Part1
				if p0 and p1 then
					local c0 = p0:FindFirstAncestorOfClass("Model")
					local c1 = p1:FindFirstAncestorOfClass("Model")
					if c0 and c1 and (c0 == char or c1 == char) and c0 ~= c1 then
						-- foreign weld involving us
						if c0 ~= char or c1 ~= char then
							return true
						end
					end
				end
			end
		end
		-- world GrabParts targeting us
		local lp = Services.LP
		for _, p in ipairs(Services.Players:GetPlayers()) do
			if p ~= lp and p.Character then
				local gp = p.Character:FindFirstChild("GrabParts")
				if gp then
					for _, part in ipairs(gp:GetDescendants()) do
						if part:IsA("Weld") or part:IsA("WeldConstraint") then
							local a, b = part.Part0, part.Part1
							if a and b then
								if a:IsDescendantOf(char) or b:IsDescendantOf(char) then
									return true
								end
							end
						elseif part:IsA("BasePart") then
							local w = part:FindFirstChildOfClass("Weld")
							if w and ((w.Part0 and w.Part0:IsDescendantOf(char)) or (w.Part1 and w.Part1:IsDescendantOf(char))) then
								return true
							end
						end
					end
				end
			end
		end
		return false
	end

	local function freeLocalPhysics()
		local char = Util.char()
		local hrp = Util.hrp()
		local hum = Util.hum()
		if not char or not hrp or not hum then
			return
		end

		-- keep walk enabled while "held"
		pcall(function()
			hum.PlatformStand = false
			hum.AutoRotate = true
			if hum.WalkSpeed < 12 then
				hum.WalkSpeed = 16
			end
			if hum.JumpPower < 40 and hum.UseJumpPower then
				hum.JumpPower = 50
			end
			if hum.JumpHeight ~= nil and hum.JumpHeight < 5 then
				hum.JumpHeight = 7.2
			end
		end)

		-- neutralize hostile drag on OUR roots only (do not destroy attacker visuals)
		for _, d in ipairs(char:GetDescendants()) do
			if MOVER_CLASSES[d.ClassName] then
				-- skip if clearly our own tool movers named VOIDZ
				if not string.find(string.lower(d.Name), "voidz") then
					pcall(function()
						if d:IsA("BodyVelocity") then
							d.Velocity = Vector3.zero
							d.MaxForce = Vector3.zero
						elseif d:IsA("BodyAngularVelocity") then
							d.AngularVelocity = Vector3.zero
							d.MaxTorque = Vector3.zero
						elseif d:IsA("BodyPosition") then
							d.MaxForce = Vector3.zero
						elseif d:IsA("LinearVelocity") then
							d.VectorVelocity = Vector3.zero
							d.MaxForce = 0
						elseif d:IsA("AlignPosition") then
							d.Enabled = false
						elseif d:IsA("AlignOrientation") then
							d.Enabled = false
						elseif d:IsA("VectorForce") then
							d.Force = Vector3.zero
							d.Enabled = false
						elseif d:IsA("AngularVelocity") then
							d.AngularVelocity = Vector3.zero
							d.Enabled = false
						end
					end)
				end
			end
		end

		-- kill residual velocity so throws don't stick
		pcall(function()
			hrp.AssemblyLinearVelocity = Vector3.zero
			hrp.AssemblyAngularVelocity = Vector3.zero
		end)
	end

	function Gucci.tick()
		if not State.getToggle("gucci") then
			return
		end
		local held = isHeld()
		if held ~= Gucci._held then
			Gucci._held = held
			Bus.emit("gucci.held", held)
		end
		if held then
			freeLocalPhysics()
		end
	end

	function Gucci.enable()
		State.setToggle("gucci", true)
		Gucci.active = true
		Loop.start("sys.gucci", 0.05, Gucci.tick)
		Bus.emit("gucci.enabled", true)
	end

	function Gucci.disable()
		State.setToggle("gucci", false)
		Gucci.active = false
		Gucci._held = false
		Loop.stop("sys.gucci")
		Bus.emit("gucci.enabled", false)
	end

	function Gucci.sync()
		if State.getToggle("gucci") then
			Gucci.enable()
		else
			Gucci.disable()
		end
	end

	return Gucci
end
