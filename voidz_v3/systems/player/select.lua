--[[ Player target selection helpers ]]
return function(require)
	local Services = require("core.services")
	local State = require("core.state")
	local Util = require("core.util")
	local Bus = require("core.bus")

	local Select = {}

	function Select.list()
		local out = {}
		for _, p in ipairs(Services.Players:GetPlayers()) do
			if p ~= Services.LP then
				out[#out + 1] = p
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

	function Select.byName(name)
		if not name or name == "" then
			return nil
		end
		local lower = string.lower(name)
		for _, p in ipairs(Select.list()) do
			if string.lower(p.Name) == lower or string.lower(p.DisplayName or "") == lower then
				return p
			end
			if string.find(string.lower(p.Name), lower, 1, true) then
				return p
			end
		end
		return nil
	end

	return Select
end
