--[[ VOIDZ V3 — save / load preferences ]]
return function(require)
	local Services = require("core.services")
	local State = require("core.state")
	local Errors = require("core.errors")

	local Config = {
		fileName = "voidz_v3_config.json",
	}

	local function defaults()
		return {
			version = 3,
			theme = State.themeName or "VoidGlass",
			page = "home",
			toggles = {},
			values = {},
			keybinds = { toggleHub = "RightShift" },
		}
	end

	function Config.snapshot()
		local snap = defaults()
		snap.theme = State.themeName
		snap.page = State.page
		for k, v in pairs(State.toggles) do
			snap.toggles[k] = v == true
		end
		for k, v in pairs(State.values) do
			snap.values[k] = v
		end
		local kb = State.keybinds.toggleHub
		local isEnum = false
		if type(typeof) == "function" then
			isEnum = typeof(kb) == "EnumItem"
		elseif type(kb) == "userdata" then
			isEnum = true
		end
		if isEnum and kb.Name then
			snap.keybinds.toggleHub = kb.Name
		end

		return snap
	end

	function Config.apply(data)
		if type(data) ~= "table" then return end
		if type(data.theme) == "string" then State.themeName = data.theme end
		if type(data.page) == "string" then State.page = data.page end
		if type(data.toggles) == "table" then
			for k, v in pairs(data.toggles) do
				State.toggles[k] = v == true
			end
		end
		if type(data.values) == "table" then
			for k, v in pairs(data.values) do
				State.values[k] = v
			end
		end
		if type(data.keybinds) == "table" and type(data.keybinds.toggleHub) == "string" then
			local ok, en = pcall(function()
				return Enum.KeyCode[data.keybinds.toggleHub]
			end)
			if ok and en then State.keybinds.toggleHub = en end
		end
	end

	function Config.save()
		local snap = Config.snapshot()
		local ok, encoded = pcall(function()
			return Services.HttpService:JSONEncode(snap)
		end)
		if not ok then
			Errors.report("config.save", encoded)
			return false
		end
		if writefile then
			local wok, werr = pcall(writefile, Config.fileName, encoded)
			if not wok then
				Errors.report("config.writefile", werr)
				return false
			end
			return true
		end
		local g = getgenv and getgenv() or _G
		g.VOIDZ_V3_CONFIG = snap
		return true
	end

	function Config.load()
		local raw = nil
		if isfile and isfile(Config.fileName) and readfile then
			local ok, data = pcall(readfile, Config.fileName)
			if ok then raw = data end
		end
		if not raw then
			local g = getgenv and getgenv() or _G
			if type(g.VOIDZ_V3_CONFIG) == "table" then
				Config.apply(g.VOIDZ_V3_CONFIG)
				return true
			end
			return false
		end
		local ok, data = pcall(function()
			return Services.HttpService:JSONDecode(raw)
		end)
		if not ok then
			Errors.report("config.load", data)
			return false
		end
		Config.apply(data)
		return true
	end

	function Config.reset()
		local Defaults = require("config.defaults")
		local d = Defaults
		if type(Defaults) == "function" then
			d = Defaults()
		end
		d = d or {}
		State.toggles = {}
		State.values = {}
		for k, v in pairs(d.toggles or {}) do
			State.toggles[k] = v
		end
		for k, v in pairs(d.values or {}) do
			State.values[k] = v
		end
		State.page = "home"
		State.themeName = "VoidGlass"
		return Config.save()
	end

	return Config
end

