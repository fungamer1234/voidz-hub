return function(require)
	local C = require("ui.components")
	local Theme = require("ui.theme")
	local State = require("core.state")
	local Config = require("core.config")
	local Notify = require("ui.notify")
	local Anchor = require("systems.grab.anchor")
	local Ownership = require("systems.object.ownership")
	local Train = require("systems.world.train")

	return function(parent)
		local scroll = C.scroll(parent)

		local train = C.section(scroll, "TRAIN")
		C.label(train, "Drive Blue/map train (mount seat + SNO). WASD while seated.", {
			size = 12,
			color = Theme.textMuted,
			wrap = true,
			h = 32,
		})
		local trow = C.row(train)
		C.button(trow, "Mount Train", function()
			Notify.info("Train", Train.mount() and "Mounted" or "No seat found")
		end, { w = 130, h = 34, accent = true })
		C.toggle(train, "Drive Train", function()
			return State.getToggle("trainDrive")
		end, function(v)
			local ok = Train.drive(v)
			if v and not ok then
				Notify.warn("Train", "Mount failed")
			else
				Notify.info("Train", v and "Drive ON" or "OFF")
			end
			Config.save()
		end)

		local sec = C.section(scroll, "ANCHOR GRAB")
		C.label(sec, "Selection: " .. Anchor.label(), { size = 12, color = Theme.accentGlow, h = 18 })
		local g = C.grid(sec, 140, 34, 8)
		C.button(g, "Ray Select", function()
			local p = Anchor.raySelect()
			Notify.info("Anchor", p and p.Name or "No hit")
		end, { w = 140, h = 34, accent = true })
		C.button(g, "Mouse Select", function()
			local p = Anchor.mouseSelect()
			Notify.info("Anchor", p and p.Name or "No hit")
		end, { w = 140, h = 34 })
		C.button(g, "Toggle Anchor", function()
			Notify.info("Anchor", Anchor.toggle() and "Toggled" or "None")
		end, { w = 140, h = 34 })
		C.button(g, "Force Anchor", function()
			Anchor.setAnchored(true)
		end, { w = 140, h = 34 })
		C.button(g, "Unanchor", function()
			Anchor.setAnchored(false)
		end, { w = 140, h = 34 })
		C.button(g, "SNO Selection", function()
			if Anchor.selection then
				Ownership.sno(Anchor.selection)
			end
		end, { w = 140, h = 34 })
		C.button(g, "Clear", function()
			Anchor.clear()
		end, { w = 140, h = 34 })

		local auto = C.section(scroll, "AUTO-REPLACE")
		C.toggle(auto, "Watch selection", function()
			return State.getToggle("anchorWatch")
		end, function(v)
			if v then
				Anchor.startWatch()
			elseif not State.getToggle("anchorAutoReplace") then
				Anchor.stopWatch()
			end
			State.setToggle("anchorWatch", v)
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
		end)
		C.toggle(auto, "Keep anchored after replace", function()
			return State.getToggle("anchorKeepAnchored")
		end, function(v)
			State.setToggle("anchorKeepAnchored", v)
			Config.save()
		end)
	end
end
