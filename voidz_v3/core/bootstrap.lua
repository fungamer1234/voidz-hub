--[[ VOIDZ V3 — wire core services ]]
return function(require)
	local Services = require("core.services")
	local State = require("core.state")
	local Config = require("core.config")
	local Defaults = require("config.defaults")
	local Bus = require("core.bus")
	local Errors = require("core.errors")

	local Bootstrap = {}

	function Bootstrap.run()
		local d = Defaults
		if type(Defaults) == "function" then
			d = Defaults()
		end
		d = d or {}
		for k, v in pairs(d.toggles or {}) do
			if State.toggles[k] == nil then
				State.toggles[k] = v
			end
		end
		for k, v in pairs(d.values or {}) do
			if State.values[k] == nil then
				State.values[k] = v
			end
		end
		pcall(Config.load)
		pcall(Services.resolveFTAP)
		Bus.emit("core.ready")
		return true
	end


	function Bootstrap.teardown()
		local Loop = require("core.loop")
		Loop.stopAll()
		for _, c in pairs(State.conns) do
			pcall(function() c:Disconnect() end)
		end
		State.conns = {}
		Bus.clear()
	end

	return Bootstrap
end
