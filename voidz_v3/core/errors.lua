--[[ VOIDZ V3 - non-fatal error reporting + ring buffer ]]
return function(require)
	local Errors = {
		last = nil,
		recent = {}, -- { scope, err, at }
		maxRecent = 12,
	}

	function Errors.report(scope, err)
		local msg = string.format("[VOIDZ V3][%s] %s", tostring(scope), tostring(err))
		Errors.last = msg
		local entry = {
			scope = tostring(scope),
			err = tostring(err),
			at = os.clock(),
		}
		local r = Errors.recent
		r[#r + 1] = entry
		while #r > Errors.maxRecent do
			table.remove(r, 1)
		end
		warn(msg)
		local ok, Bus = pcall(require, "core.bus")
		if ok and Bus and type(Bus.emit) == "function" then
			Bus.emit("error", scope, err)
		end
	end

	function Errors.wrap(scope, fn)
		return function(...)
			local ok, a, b, c = pcall(fn, ...)
			if not ok then
				Errors.report(scope, a)
				return nil
			end
			return a, b, c
		end
	end

	function Errors.getRecent()
		return Errors.recent
	end

	return Errors
end
