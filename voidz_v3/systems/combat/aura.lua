--[[ Nearby auras - fling / kill / pull / sky / ragdoll / bring etc. ]]
return function(require)
	local Services = require("core.services")
	local State = require("core.state")
	local Loop = require("core.loop")
	local Util = require("core.util")
	local Actions = require("systems.combat.actions")
	local Ownership = require("systems.object.ownership")

	local Aura = {
		defs = {
			{ id = "fling", title = "Fling Nearby" },
			{ id = "kill", title = "Kill Nearby" },
			{ id = "bring", title = "Bring Nearby" },
			{ id = "sky", title = "Sky Blast" },
			{ id = "ragdoll", title = "Ragdoll Nearby" },
			{ id = "pull", title = "Pull Nearby" },
			{ id = "push", title = "Push Away" },
			{ id = "own", title = "Own Nearby" },
			{ id = "spin", title = "Spin Nearby" },
			{ id = "void", title = "Void Nearby" },
		},
	}

	local function radius()
		return tonumber(State.getValue("auraRadius", 45)) or 45
	end

	local function nearby()
		local me = Util.hrp()
		if not me then
			return {}
		end
		local out = {}
		local r = radius()
		local skipFriends = State.getToggle("wlFriends")
		for _, p in ipairs(Services.Players:GetPlayers()) do
			if Util.validP(p) then
				if skipFriends and Services.LP:IsFriendsWith(p.UserId) then
					-- skip
				else
					local root = Util.rootOf(p)
					if root and (root.Position - me.Position).Magnitude <= r then
						out[#out + 1] = p
					end
				end
			end
		end
		return out
	end

	local function tickAura(id)
		local list = nearby()
		for _, p in ipairs(list) do
			if id == "fling" then
				local r = Util.rootOf(p)
				if r then
					Ownership.sno(r)
					Actions.applyVel(r, State.getValue("flingPower", 8000), 0.3)
				end
			elseif id == "kill" then
				Actions.kill(p, true)
			elseif id == "bring" then
				Actions.bring(p, true)
			elseif id == "sky" then
				Actions.sky(p)
			elseif id == "ragdoll" then
				Actions.ragdoll(p)
			elseif id == "pull" then
				local me, r = Util.hrp(), Util.rootOf(p)
				if me and r then
					Ownership.sno(r)
					local d = me.Position - r.Position
					if d.Magnitude > 1 then
						pcall(function()
							r.AssemblyLinearVelocity = d.Unit * 120
						end)
					end
				end
			elseif id == "push" then
				local me, r = Util.hrp(), Util.rootOf(p)
				if me and r then
					Ownership.sno(r)
					local d = r.Position - me.Position
					if d.Magnitude > 1 then
						pcall(function()
							r.AssemblyLinearVelocity = d.Unit * 160
						end)
					end
				end
			elseif id == "own" then
				Ownership.snoPlayer(p)
			elseif id == "spin" then
				Actions.spin(p)
			elseif id == "void" then
				Actions.void(p, true)
			end
		end
	end

	function Aura.set(id, on)
		local key = "aura_" .. id
		local loopId = "aura." .. id
		State.setToggle(key, on == true)
		if not on then
			Loop.stop(loopId)
			return
		end
		Loop.start(loopId, 0.2, function()
			if not State.getToggle(key) then
				return
			end
			tickAura(id)
		end)
	end

	function Aura.syncAll()
		for _, d in ipairs(Aura.defs) do
			local on = State.getToggle("aura_" .. d.id)
			if on then
				Aura.set(d.id, true)
			else
				Loop.stop("aura." .. d.id)
			end
		end
	end

	return Aura
end
