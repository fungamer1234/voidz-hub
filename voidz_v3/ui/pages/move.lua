return function(require)
	local C = require("ui.components")
	return function(parent)
		local scroll = C.scroll(parent)
		C.placeholder(scroll, "MOVEMENT", "Speed, fly, noclip, and movement tools — later phase.")
	end
end
