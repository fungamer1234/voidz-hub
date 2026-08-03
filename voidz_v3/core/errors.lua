--[[ VOIDZ V3 — non-fatal error reporting ]]
return function(require)
	local Errors = { last = nil }

	function Errors.report(scope, err)
		local msg = string.format("[VOIDZ V3][%s] %s", tostring(scope), tostring(err))
		Errors.last = msg
		warn(msg)
		local ok, Bus = pcall(require, "core.bus")
		if ok and Bus then
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

	return Errors
end
