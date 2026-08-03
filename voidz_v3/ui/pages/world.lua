return function(require)
	local C = require("ui.components")
	local Theme = require("ui.theme")
	local State = require("core.state")
	local Config = require("core.config")
	local Notify = require("ui.notify")
	local Anchor = require("systems.grab.anchor")
	local Ownership = require("systems.object.ownership")

	return function(parent)
		local scroll = C.scroll(parent)

		local sec = C.section(scroll, "ANCHOR GRAB")
		C.label(sec, "Selection: " .. Anchor.label(), { size = 12, color = Theme.accentGlow, h = 18 })

		C.button(sec, "Ray select (look)", function()
			local p = Anchor.raySelect()
			Notify.info("Anchor", p and ("Selected " .. p.Name) or "No hit")
		end, { w = 160, accent = true })

		C.button(sec, "Mouse select", function()
			local p = Anchor.mouseSelect()
			Notify.info("Anchor", p and ("Selected " .. p.Name) or "No hit")
		end, { w = 140 })

		C.button(sec, "Toggle anchor", function()
			if Anchor.toggle() then
				Notify.success("Anchor", "Toggled")
			else
				Notify.warn("Anchor", "Nothing selected")
			end
		end, { w = 140 })

		C.button(sec, "Force anchored ON", function()
			if Anchor.setAnchored(true) then
				Notify.success("Anchor", "Anchored")
			else
				Notify.warn("Anchor", "Failed")
			end
		end, { w = 150 })

		C.button(sec, "Unanchor", function()
			Anchor.setAnchored(false)
			Notify.info("Anchor", "Unanchored")
		end, { w = 120 })

		C.button(sec, "Clear selection", function()
			Anchor.clear()
			Notify.info("Anchor", "Cleared")
		end, { w = 140 })

		local auto = C.section(scroll, "AUTO-REPLACE")
		C.toggle(auto, "Watch selection", function()
			return State.getToggle("anchorWatch")
		end, function(v)
			if v then
				Anchor.startWatch()
			else
				if not State.getToggle("anchorAutoReplace") then
					Anchor.stopWatch()
				end
				State.setToggle("anchorWatch", v)
			end
			Config.save()
		end)

		C.toggle(auto, "Auto-replace if destroyed", function()
			return State.getToggle("anchorAutoReplace")
		end, function(v)
			State.setToggle("anchorAutoReplace", v)
			if v then
				Anchor.startWatch()
			end
			Config.save()
			Notify.info("Anchor", v and "Auto-replace ON (max 4/10s)" or "Auto-replace OFF")
		end)

		C.toggle(auto, "Keep anchored after replace", function()
			return State.getToggle("anchorKeepAnchored")
		end, function(v)
			State.setToggle("anchorKeepAnchored", v)
			Config.save()
		end)

		local own = C.section(scroll, "OWNERSHIP")
		C.button(own, "SNO selection", function()
			local p = Anchor.selection
			if not p then
				Notify.warn("SNO", "No selection")
				return
			end
			Ownership.sno(p)
			if Anchor.model then
				for _, d in ipairs(Anchor.model:GetDescendants()) do
					if d:IsA("BasePart") then
						Ownership.sno(d)
					end
				end
			end
			Notify.info("SNO", "Fired")
		end, { w = 140, accent = true })

		C.label(scroll, "Highlight on select. Auto-replace rate-limited (max 4 per 10s).", {
			size = 11,
			color = Theme.textDim,
			wrap = true,
			h = 36,
		})
	end
end
