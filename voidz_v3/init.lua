--[[
  VOIDZ HUB V3 - entry
  Phase 4: Anchor grab + toys / ownership
]]

return function(require)
	local State = require("core.state")
	local Bootstrap = require("core.bootstrap")
	local Bus = require("core.bus")
	local Loop = require("core.loop")
	local Root = require("ui.root")
	local Notify = require("ui.notify")
	local Gucci = require("systems.defense.gucci")
	local AntiGrab = require("systems.defense.anti_grab")
	local War = require("systems.defense.war")
	local Blobman = require("systems.grab.blobman")
	local Grab = require("systems.grab.core")
	local Kick = require("systems.combat.kick")
	local Anchor = require("systems.grab.anchor")
	local Toys = require("systems.object.toys")
	local Ownership = require("systems.object.ownership")

	local VOIDZ = {
		version = State.version,
		phase = 4,
		Blobman = Blobman,
		Grab = Grab,
		Kick = Kick,
		Anchor = Anchor,
		Toys = Toys,
		Ownership = Ownership,
	}

	local function env()
		if type(getgenv) == "function" then
			local ok, g = pcall(getgenv)
			if ok and type(g) == "table" then
				return g
			end
		end
		return _G
	end

	local function unload()
		pcall(function()
			Anchor.destroy()
		end)
		pcall(function()
			Blobman.dismount()
		end)
		pcall(function()
			Grab.loopSelected(false)
			Grab.release()
		end)
		pcall(function()
			Kick.loop(false)
		end)
		pcall(function()
			Gucci.disable()
		end)
		pcall(function()
			AntiGrab.disable()
		end)
		pcall(function()
			War.disable()
		end)
		pcall(function()
			Root.destroy()
		end)
		pcall(function()
			Bootstrap.teardown()
		end)
		pcall(function()
			Notify.destroy()
		end)
		pcall(function()
			Loop.stopAll()
		end)
		local g = env()
		g.VOIDZ_V3 = nil
		g.VOIDZ_V3_UNLOAD = nil
		g.VOIDZ_UNLOAD_V3 = nil
		print("[VOIDZ V3] unloaded")
	end

	function VOIDZ.unload()
		unload()
	end

	function VOIDZ.bootstrap()
		local g = env()
		if type(g.VOIDZ_V3_UNLOAD) == "function" then
			pcall(g.VOIDZ_V3_UNLOAD)
		end

		State.phase = 4
		State.version = "3.0.0-dev.p4"
		VOIDZ.version = State.version
		VOIDZ.phase = 4

		Bootstrap.run()
		pcall(Ownership.resolve)

		pcall(function()
			Gucci.sync()
		end)
		pcall(function()
			AntiGrab.sync()
		end)
		pcall(function()
			War.sync()
		end)
		pcall(function()
			Blobman.sync()
		end)
		pcall(function()
			Anchor.sync()
		end)

		Root.mount()

		g.VOIDZ_V3 = VOIDZ
		g.VOIDZ_V3_UNLOAD = unload
		g.VOIDZ_UNLOAD_V3 = unload

		Bus.on("toggle.gucci", function(v)
			if v then
				Gucci.enable()
			else
				Gucci.disable()
			end
		end)
		Bus.on("toggle.antiGrab", function(v)
			if v then
				AntiGrab.enable()
			else
				AntiGrab.disable()
			end
		end)
		Bus.on("toggle.warMode", function(v)
			if v then
				War.enable()
			else
				War.disable()
			end
		end)

		Bus.emit("voidz.ready", VOIDZ)
		return VOIDZ
	end

	return VOIDZ.bootstrap()
end
