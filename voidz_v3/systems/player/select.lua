--[[ Player selection + multi loop-targets + whitelist ]]
return function(require)
	local Services = require("core.services")
	local State = require("core.state")
	local Util = require("core.util")
	local Bus = require("core.bus")

	local Select = {}

	State.loopTargets = State.loopTargets or {}
	State.whitelist = State.whitelist or {}

	function Select.list(filter)
		local out = {}
		local f = filter and string.lower(filter) or nil
		for _, p in ipairs(Services.Players:GetPlayers()) do
			if p ~= Services.LP then
				local lab = Util.playerLabel(p)
				if not f or string.find(string.lower(p.Name), f, 1, true) or string.find(string.lower(lab), f, 1, true) then
					out[#out + 1] = p
				end
			end
		end
		table.sort(out, function(a, b)
			return string.lower(a.Name) < string.lower(b.Name)
		end)
		return out
	end

	function Select.set(player)
		if player and player ~= Services.LP then
			State.selected = player
			Bus.emit("player.selected", player)
			return true
		end
		State.selected = nil
		Bus.emit("player.selected", nil)
		return false
	end

	function Select.get()
		local s = State.selected
		if s and s.Parent then
			return s
		end
		State.selected = nil
		return nil
	end

	function Select.label()
		local s = Select.get()
		return s and Util.playerLabel(s) or "(none)"
	end

	function Select.toggleLoopTarget(player)
		if not player then
			return
		end
		if State.loopTargets[player] then
			State.loopTargets[player] = nil
		else
			State.loopTargets[player] = true
			State.selected = player
		end
		Bus.emit("player.loopTargets")
	end

	function Select.isLoopTarget(player)
		return State.loopTargets[player] == true
	end

	function Select.targets()
		local out = {}
		for p in pairs(State.loopTargets) do
			if p and p.Parent and p ~= Services.LP then
				out[#out + 1] = p
			else
				State.loopTargets[p] = nil
			end
		end
		if #out == 0 then
			local s = Select.get()
			if s then
				out[1] = s
			end
		end
		return out
	end

	function Select.clearLoops()
		State.loopTargets = {}
		Bus.emit("player.loopTargets")
	end

	function Select.whitelist(player, on)
		if not player then
			return
		end
		if on then
			State.whitelist[player.Name] = true
		else
			State.whitelist[player.Name] = nil
		end
	end

	function Select.isWhitelisted(player)
		return player and State.whitelist[player.Name] == true
	end

	function Select.byName(name)
		if not name or name == "" then
			return nil
		end
		local lower = string.lower(name)
		for _, p in ipairs(Select.list()) do
			if string.lower(p.Name) == lower or string.find(string.lower(p.Name), lower, 1, true) then
				return p
			end
		end
		return nil
	end

	return Select
end
