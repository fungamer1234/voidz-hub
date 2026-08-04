return function(require)
	local C = require("ui.components")
	local Theme = require("ui.theme")
	local State = require("core.state")
	local Config = require("core.config")
	local Notify = require("ui.notify")
	local Select = require("systems.player.select")
	local Actions = require("systems.combat.actions")
	local Kick = require("systems.combat.kick")
	local Loop = require("core.loop")
	local Util = require("core.util")

	return function(parent)
		local scroll = C.scroll(parent)
		C.targetBanner(scroll, Select)

		local tip = C.section(scroll, "HOW TO TARGET")
		C.label(tip, "Left-click a player on the right rail to select. Right-click to add/remove loop multi-target.", {
			size = 12,
			color = Theme.textMuted,
			wrap = true,
			h = 40,
		})

		local quick = C.section(scroll, "QUICK")
		local g = C.grid(quick, 130, 34, 8)
		C.button(g, "Fling", function()
			local p = Select.get()
			if p then
				task.spawn(Actions.fling, p)
			end
		end, { w = 130, h = 34, danger = true })
		C.button(g, "Kick", function()
			local p = Select.get()
			if p then
				task.spawn(Kick.run, p, State.getValue("kickType", "Phoenix"))
			end
		end, { w = 130, h = 34, danger = true })
		C.button(g, "Kill", function()
			local p = Select.get()
			if p then
				task.spawn(Actions.kill, p)
			end
		end, { w = 130, h = 34, danger = true })
		C.button(g, "Bring", function()
			local p = Select.get()
			if p then
				task.spawn(Actions.bring, p)
			end
		end, { w = 130, h = 34, accent = true })
		C.button(g, "TP To", function()
			local p = Select.get()
			if p then
				Actions.tpTo(p)
			end
		end, { w = 130, h = 34 })
		C.button(g, "Spectate", function()
			Actions.spectate(Select.get())
		end, { w = 130, h = 34 })
		C.button(g, "Unspectate", function()
			Actions.unspectate()
		end, { w = 130, h = 34 })
		C.button(g, "Whitelist", function()
			local p = Select.get()
			if p then
				Select.whitelist(p, true)
				Notify.info("WL", p.Name)
			end
		end, { w = 130, h = 34 })
		C.button(g, "Un-Whitelist", function()
			local p = Select.get()
			if p then
				Select.whitelist(p, false)
			end
		end, { w = 130, h = 34 })

		local stalk = C.section(scroll, "STALK")
		C.toggle(stalk, "Stalk teleport (behind target)", function()
			return State.getToggle("loopStalk")
		end, function(v)
			local Loops = require("systems.combat.loops")
			Loops.set("loopStalk", v)
			Config.save()
		end)

		C.toggle(stalk, "Skip friends in auras", function()
			return State.getToggle("wlFriends")
		end, function(v)
			State.setToggle("wlFriends", v)
			Config.save()
		end)

		local n = 0
		for _ in pairs(State.loopTargets or {}) do
			n = n + 1
		end
		C.label(scroll, "Loop multi-targets: " .. n .. "  |  Selected: " .. Select.label(), {
			size = 11,
			color = Theme.textDim,
			h = 20,
		})
	end
end
