--[[ VOIDZ V3 - single source of truth ]]
return function(require)
	local State = {
		version = "2.0.0",
		phase = 5,
		hubOpen = false,
		unlocked = false,
		device = "PC",
		selected = nil,
		toggles = {},
		values = {},
		keybinds = {
			toggleHub = Enum.KeyCode.RightShift,
		},
		themeName = "VoidGlass",
		conns = {},
		loops = {},
		loopGen = {},
		page = "home",
	}

	function State.setToggle(id, on)
		State.toggles[id] = on == true
	end

	function State.getToggle(id)
		return State.toggles[id] == true
	end

	function State.setValue(id, v)
		State.values[id] = v
	end

	function State.getValue(id, default)
		local v = State.values[id]
		if v == nil then
			return default
		end
		return v
	end

	return State
end
