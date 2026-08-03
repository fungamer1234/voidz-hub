return function(require)
	local C = require("ui.components")
	local Theme = require("ui.theme")
	local State = require("core.state")
	local Config = require("core.config")
	local Notify = require("ui.notify")
	local Blobman = require("systems.grab.blobman")
	local Select = require("systems.player.select")

	return function(parent)
		local scroll = C.scroll(parent)

		local sec = C.section(scroll, "BLOBMAN (1.2.75 path)")
		C.label(sec, "Target: " .. Select.label(), { size = 12, color = Theme.textMuted, h = 18 })

		C.button(sec, "Spawn / Sit", function()
			task.spawn(function()
				local ok = Blobman.ensure(false)
				Notify.info("Blobman", ok and "Seated" or "Spawn failed")
			end)
		end, { w = 140, accent = true })

		C.button(sec, "Dismount", function()
			Blobman.dismount()
			Notify.info("Blobman", "Dismounted")
		end, { w = 140 })

		C.toggle(sec, "Sticky seat (opt-in only)", function()
			return State.getToggle("blobStickySeat")
		end, function(v)
			State.setToggle("blobStickySeat", v)
			if v then
				Blobman.startSticky()
			else
				Blobman.stopSticky()
			end
			Config.save()
		end)

		local grab = C.section(scroll, "GRAB")
		C.button(grab, "Grab selected once", function()
			local t = Select.get()
			if not t then
				Notify.warn("Blobman", "Pick a player in Player tab")
				return
			end
			task.spawn(function()
				local ok = Blobman.grabOnce(t)
				Notify.info("Blobman", ok and ("Grabbed " .. t.Name) or "Grab failed")
			end)
		end, { w = 160, accent = true })

		C.button(grab, "Grab ALL once", function()
			task.spawn(function()
				Blobman.grabAll()
				Notify.info("Blobman", "Grab all fired")
			end)
		end, { w = 160 })

		C.toggle(grab, "Loop grab selected", function()
			return State.getToggle("blobGrabLoop")
		end, function(v)
			local t = Select.get()
			if v and not t then
				Notify.warn("Blobman", "Pick a player first")
				State.setToggle("blobGrabLoop", false)
				return
			end
			Blobman.setLoopGrab(v, t)
			Config.save()
			Notify.info("Blobman", v and ("Loop ON -> " .. t.Name) or "Loop OFF")
		end)

		C.toggle(grab, "Loop grab ALL", function()
			return State.getToggle("blobGrabAllLoop")
		end, function(v)
			Blobman.setLoopGrabAll(v)
			Config.save()
			Notify.info("Blobman", v and "Grab all loop ON" or "Grab all loop OFF")
		end)

		C.label(scroll, "Reuse seat + 3.5s spawn CD + park (0,1,7) + re-sit + CreatureGrab. No home-TP unseat.", {
			size = 11,
			color = Theme.textDim,
			wrap = true,
			h = 40,
		})
	end
end
