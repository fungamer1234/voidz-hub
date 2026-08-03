return function(require)
	local C = require("ui.components")
	local Theme = require("ui.theme")
	local State = require("core.state")
	local Config = require("core.config")
	local Notify = require("ui.notify")
	local Kick = require("systems.combat.kick")
	local Select = require("systems.player.select")

	return function(parent)
		local scroll = C.scroll(parent)

		local head = C.section(scroll, "KICK")
		C.label(head, "Target: " .. Select.label(), { size = 12, color = Theme.textMuted, h = 18 })
		C.label(head, "Type: " .. tostring(State.getValue("kickType", "Phoenix")), {
			size = 12,
			color = Theme.accentGlow,
			h = 18,
		})

		local types = C.section(scroll, "KICK TYPE")
		for _, kt in ipairs(Kick.TYPES) do
			C.button(types, kt, function()
				State.setValue("kickType", kt)
				Config.save()
				Notify.info("Kick", "Type = " .. kt)
			end, {
				w = 100,
				h = 28,
				accent = State.getValue("kickType", "Phoenix") == kt,
			})
		end

		local act = C.section(scroll, "ACTIONS")
		C.button(act, "Kick selected", function()
			local t = Select.get()
			if not t then
				Notify.warn("Kick", "Pick a player in Player tab")
				return
			end
			task.spawn(function()
				local ok = Kick.run(t, State.getValue("kickType", "Phoenix"))
				Notify.info("Kick", ok and ("Done -> " .. t.Name) or "Failed")
			end)
		end, { w = 150, accent = true })

		C.button(act, "Stack Kick selected", function()
			local t = Select.get()
			if not t then
				Notify.warn("Kick", "Pick a player first")
				return
			end
			task.spawn(function()
				Kick.run(t, "StackKick")
				Notify.info("Kick", "StackKick -> " .. t.Name)
			end)
		end, { w = 160 })

		C.toggle(act, "Loop kick selected", function()
			return State.getToggle("kickLoop")
		end, function(v)
			if v and not Select.get() then
				Notify.warn("Kick", "Pick a player first")
				return
			end
			Kick.loop(v, State.getValue("kickType", "Phoenix"))
			Config.save()
		end)
	end
end
