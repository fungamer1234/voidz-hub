--[[ VOIDZ HUB 2.0 - entry ]]
return function(require)
	local State = require("core.state")
	local Bootstrap = require("core.bootstrap")
	local Bus = require("core.bus")
	local Loop = require("core.loop")
	local Config = require("core.config")
	local Root = require("ui.root")
	local Notify = require("ui.notify")
	local Gucci = require("systems.defense.gucci")
	local AntiGrab = require("systems.defense.anti_grab")
	local War = require("systems.defense.war")
	local Blobman = require("systems.grab.blobman")
	local Grab = require("systems.grab.core")
	local Kick = require("systems.combat.kick")
	local Actions = require("systems.combat.actions")
	local Aura = require("systems.combat.aura")
	local Loops = require("systems.combat.loops")
	local Anchor = require("systems.grab.anchor")
	local Toys = require("systems.object.toys")
	local Ownership = require("systems.object.ownership")
	local Chat = require("systems.utility.chat")
	local Visuals = require("systems.utility.visuals")
	local AntiAFK = require("systems.utility.antiafk")
	local Train = require("systems.world.train")

	local VOIDZ = {
		version = "2.0.0",
		phase = 5,
		Blobman = Blobman,
		Grab = Grab,
		Kick = Kick,
		Actions = Actions,
		Aura = Aura,
		Loops = Loops,
		Anchor = Anchor,
		Toys = Toys,
		Ownership = Ownership,
		Chat = Chat,
		Train = Train,
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
		pcall(Config.save)
		pcall(function()
			State.setToggle("fly", false)
			State.setToggle("noclip", false)
			Train.drive(false)
		end)
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
		print("[VOIDZ] unloaded 2.0.0")
	end

	function VOIDZ.unload()
		unload()
	end

	function VOIDZ.bootstrap()
		local g = env()
		if type(g.VOIDZ_V3_UNLOAD) == "function" then
			pcall(g.VOIDZ_V3_UNLOAD)
		end

		State.phase = 5
		State.version = "2.0.0"
		VOIDZ.version = "2.0.0"

		Bootstrap.run()
		pcall(Ownership.resolve)

		pcall(Gucci.sync)
		pcall(AntiGrab.sync)
		pcall(War.sync)
		pcall(Blobman.sync)
		pcall(Anchor.sync)
		pcall(Aura.syncAll)
		pcall(Loops.syncAll)
		pcall(Visuals.sync)
		pcall(AntiAFK.sync)

		State.setToggle("fly", false)
		State.setToggle("noclip", false)
		State.setToggle("trainDrive", false)

		Root.mount()

		if State.getToggle("publicLoadChat") then
			pcall(Chat.announceLoadOnce)
		end

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
		print("[VOIDZ] 2.0.0 ready")
		return VOIDZ
	end

	return VOIDZ.bootstrap()
end
