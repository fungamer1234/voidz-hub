--[[
  War mode - light threat-based FE protect.
  No constant house hop. Isolated from Gucci / Anti-Grab logic paths.
]]
return function(require)
	local Services = require("core.services")
	local State = require("core.state")
	local Loop = require("core.loop")
	local Util = require("core.util")
	local Bus = require("core.bus")

	local War = {
		id = "warMode",
		active = false,
		threat = false,
		_lastProtect = 0,
	}

	local function nearbyThreat()
		local hrp = Util.hrp()
		if not hrp then
			return false
		end
		local lp = Services.LP
		local origin = hrp.Position
		for _, p in ipairs(Services.Players:GetPlayers()) do
			if p ~= lp and p.Character then
				local r = Util.rootOf(p)
				if r then
					local dist = (r.Position - origin).Magnitude
					if dist < 28 then
						-- tools that imply combat
						local ch = p.Character
						if ch:FindFirstChild("GrabParts") or ch:FindFirstChildOfClass("Tool") then
							return true
						end
						if dist < 12 then
							return true
						end
					end
				end
			end
		end
		local c = Util.char()
		if c and (c:GetAttribute("IsHeld") or c:FindFirstChild("GrabParts")) then
			return true
		end
		return false
	end

	local function lightProtect()
		local now = os.clock()
		if now - War._lastProtect < 0.35 then
			return
		end
		War._lastProtect = now
		local hrp = Util.hrp()
		local hum = Util.hum()
		if hum then
			pcall(function()
				hum.PlatformStand = false
				if hum.Health > 0 and hum.Health < hum.MaxHealth * 0.15 then
					-- no heal exploit; just state recovery
					hum:ChangeState(Enum.HumanoidStateType.Running)
				end
			end)
		end
		if hrp then
			pcall(function()
				local v = hrp.AssemblyLinearVelocity
				if v.Magnitude > 180 then
					hrp.AssemblyLinearVelocity = v.Unit * 40
				end
			end)
		end
		-- optional soft FE velocity stop (rare)
		local r = Services.FTAP.StopAllVelocity
		if r and State.getToggle("warUseStopVel") then
			pcall(function()
				if r:IsA("RemoteEvent") then
					r:FireServer()
				end
			end)
		end
	end

	function War.tick()
		if not State.getToggle("warMode") then
			return
		end
		local t = nearbyThreat()
		if t ~= War.threat then
			War.threat = t
			Bus.emit("war.threat", t)
		end
		if t then
			lightProtect()
		end
	end

	function War.enable()
		State.setToggle("warMode", true)
		War.active = true
		Services.resolveFTAP()
		Loop.start("sys.war", 0.12, War.tick)
		Bus.emit("war.enabled", true)
	end

	function War.disable()
		State.setToggle("warMode", false)
		War.active = false
		War.threat = false
		Loop.stop("sys.war")
		Bus.emit("war.enabled", false)
	end

	function War.sync()
		if State.getToggle("warMode") then
			War.enable()
		else
			War.disable()
		end
	end

	return War
end
