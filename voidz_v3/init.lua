--[[
  VOIDZ HUB V3 - entry
  Ship: 2.0.0 (Phase 5 polish)
]]

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
	local Anchor = require("systems.grab.anchor")
	local Toys = require("systems.object.toys")
	local Ownership = require("systems.object.ownership")
	local Chat = require("systems.utility.chat")

	local VOIDZ = {
		version = "2.0.0",
		phase = 5,
		Blobman = Blobman,
		Grab = Grab,
		Kick = Kick,
		Anchor = Anchor,
		Toys = Toys,
		Ownership = Ownership,
		Chat = Chat,
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
			Config.save()
		end)
		pcall(function()
			State.setToggle("fly", false)
			State.setToggle("noclip", false)
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
		g.VOIDZ_UNLOAD_V3 = nil
		print("[VOIDZ V3] unloaded 2.0.0")
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
		VOIDZ.phase = 5

		Bootstrap.run()
		pcall(Ownership.resolve)

		-- never auto-enable heavy systems beyond saved toggles
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

		-- force move loops off on fresh boot (safety)
		State.setToggle("fly", false)
		State.setToggle("noclip", false)

		Root.mount()

		if State.getToggle("publicLoadChat") then
			pcall(function()
				Chat.announceLoadOnce()
			end)
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
		Bus.on("error", function(scope, err)
			-- soft surface for critical scopes only
			if type(scope) == "string" and string.find(scope, "loop:", 1, true) then
				-- already warned via Errors.report
			end
		end)

		Bus.emit("voidz.ready", VOIDZ)
		print("[VOIDZ V3] 2.0.0 ready")
		return VOIDZ
	end

	return VOIDZ.bootstrap()
end
