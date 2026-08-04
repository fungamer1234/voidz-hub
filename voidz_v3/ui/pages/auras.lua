return function(require)
	local C = require("ui.components")
	local Theme = require("ui.theme")
	local State = require("core.state")
	local Config = require("core.config")
	local Notify = require("ui.notify")
	local Aura = require("systems.combat.aura")

	return function(parent)
		local scroll = C.scroll(parent)
		local head = C.section(scroll, "AURAS")
		C.label(head, "Affect nearby players (radius " .. tostring(State.getValue("auraRadius", 45)) .. ").", {
			size = 12,
			color = Theme.textMuted,
			h = 20,
		})

		local rad = C.section(scroll, "RADIUS")
		local row = C.row(rad)
		for _, v in ipairs({ 25, 45, 75, 120 }) do
			C.chip(row, tostring(v), function()
				State.setValue("auraRadius", v)
				Config.save()
				Notify.info("Aura", "Radius " .. v)
			end, { on = State.getValue("auraRadius", 45) == v, w = 64 })
		end

		local list = C.section(scroll, "NEARBY EFFECTS")
		for _, d in ipairs(Aura.defs) do
			C.toggle(list, d.title, function()
				return State.getToggle("aura_" .. d.id)
			end, function(v)
				Aura.set(d.id, v)
				Config.save()
				Notify.info(d.title, v and "ON" or "OFF")
			end)
		end
	end
end
