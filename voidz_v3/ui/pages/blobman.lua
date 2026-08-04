return function(require)
	local C = require("ui.components")
	local Theme = require("ui.theme")
	local State = require("core.state")
	local Config = require("core.config")
	local Notify = require("ui.notify")
	local Blobman = require("systems.grab.blobman")
	local Select = require("systems.player.select")
	local Kick = require("systems.combat.kick")

	return function(parent)
		local scroll = C.scroll(parent)
		C.targetBanner(scroll, Select)

		local sec = C.section(scroll, "BLOBMAN (1.2.75)")
		C.label(sec, "Reuse seat, spawn CD, park (0,1,7), re-sit, CreatureGrab. Sticky is opt-in only.", {
			size = 12,
			color = Theme.textMuted,
			wrap = true,
			h = 36,
		})

		local g = C.grid(sec, 140, 34, 8)
		C.button(g, "Spawn / Sit", function()
			task.spawn(function()
				Notify.info("Blobman", Blobman.ensure(false) and "Seated" or "Failed")
			end)
		end, { w = 140, h = 34, accent = true })
		C.button(g, "Dismount", function()
			Blobman.dismount()
			Notify.info("Blobman", "Dismounted")
		end, { w = 140, h = 34 })
		C.button(g, "Grab Selected", function()
			local t = Select.get()
			if not t then
				Notify.warn("Blobman", "Pick a player")
				return
			end
			task.spawn(function()
				Notify.info("Blobman", Blobman.grabOnce(t) and ("Grabbed " .. t.Name) or "Failed")
			end)
		end, { w = 140, h = 34, danger = true })
		C.button(g, "Grab ALL", function()
			task.spawn(function()
				Blobman.grabAll()
				Notify.info("Blobman", "Grab all")
			end)
		end, { w = 140, h = 34, danger = true })
		C.button(g, "Blob Kick", function()
			local t = Select.get()
			if t then
				task.spawn(Kick.run, t, "Blobman")
			end
		end, { w = 140, h = 34, danger = true })

		C.toggle(sec, "Sticky seat (opt-in)", function()
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
		C.toggle(sec, "Loop grab selected", function()
			return State.getToggle("blobGrabLoop")
		end, function(v)
			local t = Select.get()
			if v and not t then
				Notify.warn("Blobman", "Pick a player")
				return
			end
			Blobman.setLoopGrab(v, t)
			Config.save()
		end)
		C.toggle(sec, "Loop grab ALL", function()
			return State.getToggle("blobGrabAllLoop")
		end, function(v)
			Blobman.setLoopGrabAll(v)
			Config.save()
		end)
	end
end
