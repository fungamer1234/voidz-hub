return function(require)
	local C = require("ui.components")
	local Theme = require("ui.theme")
	local State = require("core.state")
	local Config = require("core.config")
	local Notify = require("ui.notify")
	local Gucci = require("systems.defense.gucci")
	local AntiGrab = require("systems.defense.anti_grab")
	local War = require("systems.defense.war")

	return function(parent)
		local scroll = C.scroll(parent)

		local note = C.section(scroll, "SEPARATION RULE")
		C.label(note, "Gucci = visual free hold. Anti-Grab = break / prevent grabs. War = light threat protect. Never merge.", {
			size = 12,
			color = Theme.warn,
			wrap = true,
			h = 48,
		})

		local gucci = C.section(scroll, "GUCCI")
		C.toggle(gucci, "Enable Gucci (free while held)", function()
			return State.getToggle("gucci")
		end, function(v)
			if v then
				Gucci.enable()
			else
				Gucci.disable()
			end
			Config.save()
			Notify.info("Gucci", v and "ON" or "OFF")
		end)

		local ag = C.section(scroll, "ANTI-GRAB")
		C.toggle(ag, "Enable Anti-Grab (15 strategies)", function()
			return State.getToggle("antiGrab")
		end, function(v)
			if v then
				AntiGrab.enable()
			else
				AntiGrab.disable()
			end
			Config.save()
			Notify.info("Anti-Grab", v and "ON" or "OFF")
		end)
		C.toggle(ag, "Safe TP hop (optional)", function()
			return State.getToggle("antiGrabSafeTP")
		end, function(v)
			State.setToggle("antiGrabSafeTP", v)
			Config.save()
		end)

		local list = C.section(scroll, "STRATEGY SCOREBOARD")
		local rows = AntiGrab.getStrategyList()
		for _, row in ipairs(rows) do
			local tag = row.demoted and " [demoted]" or ""
			C.label(list, string.format("%s  ok:%d fail:%d%s", row.id, row.ok, row.fail, tag), {
				size = 11,
				color = row.demoted and Theme.warn or Theme.textMuted,
				h = 16,
			})
		end

		local war = C.section(scroll, "WAR MODE")
		C.toggle(war, "Light threat protect", function()
			return State.getToggle("warMode")
		end, function(v)
			if v then
				War.enable()
			else
				War.disable()
			end
			Config.save()
			Notify.info("War", v and "ON" or "OFF")
		end)
		C.toggle(war, "Use StopAllVelocity on threat", function()
			return State.getToggle("warUseStopVel")
		end, function(v)
			State.setToggle("warUseStopVel", v)
			Config.save()
		end)
	end
end
