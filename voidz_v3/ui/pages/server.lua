return function(require)
	local C = require("ui.components")
	local Theme = require("ui.theme")
	local Notify = require("ui.notify")
	local Services = require("core.services")
	local Util = require("core.util")
	local Actions = require("systems.combat.actions")
	local Kick = require("systems.combat.kick")
	local Select = require("systems.player.select")
	local Ownership = require("systems.object.ownership")

	local function everyone(fn)
		for _, p in ipairs(Services.Players:GetPlayers()) do
			if Util.validP(p) and not Select.isWhitelisted(p) then
				task.spawn(fn, p)
			end
		end
	end

	return function(parent)
		local scroll = C.scroll(parent)
		local warn = C.section(scroll, "SERVER / MASS")
		C.label(warn, "Hits all non-whitelisted players. Use carefully.", {
			size = 12,
			color = Theme.warn,
			wrap = true,
			h = 32,
		})

		local g = C.grid(warn, 140, 36, 8)
		C.button(g, "Mass Fling", function()
			everyone(function(p)
				Actions.fling(p, nil, true)
			end)
			Notify.warn("Server", "Mass fling")
		end, { w = 140, h = 36, danger = true })
		C.button(g, "Mass Kick", function()
			everyone(function(p)
				Kick.run(p, "Phoenix", true)
			end)
			Notify.warn("Server", "Mass kick")
		end, { w = 140, h = 36, danger = true })
		C.button(g, "Mass Kill", function()
			everyone(function(p)
				Actions.kill(p, true)
			end)
			Notify.warn("Server", "Mass kill")
		end, { w = 140, h = 36, danger = true })
		C.button(g, "Mass Bring", function()
			everyone(function(p)
				Actions.bring(p, true)
			end)
		end, { w = 140, h = 36 })
		C.button(g, "Mass Void", function()
			everyone(function(p)
				Actions.void(p, true)
			end)
		end, { w = 140, h = 36, danger = true })
		C.button(g, "Mass SNO", function()
			everyone(function(p)
				Ownership.snoPlayer(p)
			end)
		end, { w = 140, h = 36, accent = true })
		C.button(g, "Mass Ragdoll", function()
			everyone(function(p)
				Actions.ragdoll(p)
			end)
		end, { w = 140, h = 36 })
		C.button(g, "Mass Sky", function()
			everyone(function(p)
				Actions.sky(p)
			end)
		end, { w = 140, h = 36 })
	end
end
