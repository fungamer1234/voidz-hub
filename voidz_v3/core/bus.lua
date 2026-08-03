--[[ VOIDZ V3 — simple event bus ]]
return function(require)
	local Bus = { _h = {} }

	function Bus.on(event, fn)
		Bus._h[event] = Bus._h[event] or {}
		local list = Bus._h[event]
		list[#list + 1] = fn
		return function()
			for i, f in ipairs(list) do
				if f == fn then
					table.remove(list, i)
					break
				end
			end
		end
	end

	function Bus.emit(event, ...)
		local list = Bus._h[event]
		if not list then return end
		for _, fn in ipairs(list) do
			pcall(fn, ...)
		end
	end

	function Bus.clear()
		Bus._h = {}
	end

	return Bus
end
