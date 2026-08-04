--[[ Player loop actions (selected / multi-target) ]]
return function(require)
	local State = require("core.state")
	local Loop = require("core.loop")
	local Util = require("core.util")
	local Select = require("systems.player.select")
	local Actions = require("systems.combat.actions")
	local Kick = require("systems.combat.kick")
	local Ownership = require("systems.object.ownership")

	local Loops = {
		defs = {
			{ id = "loopFling", title = "Keep Throwing", wait = 0.45 },
			{ id = "loopKick", title = "Loop Kick", wait = 0.55 },
			{ id = "loopKill", title = "Loop Kill", wait = 0.6 },
			{ id = "loopBring", title = "Keep Bringing", wait = 0.5 },
			{ id = "loopTp", title = "Loop TP To", wait = 0.25 },
			{ id = "loopSky", title = "Loop Sky Launch", wait = 0.5 },
			{ id = "loopVoid", title = "Loop Void", wait = 0.55 },
			{ id = "loopSpin", title = "Loop Spin", wait = 0.2 },
			{ id = "loopSNO", title = "Loop Network Own", wait = 0.15 },
			{ id = "loopGrab", title = "Loop Grab Line", wait = 0.35 },
			{ id = "loopStackKick", title = "Loop Stack Kick", wait = 0.7 },
			{ id = "loopHardFling", title = "Loop Hard Fling", wait = 0.4 },
			{ id = "loopDestroyGrab", title = "Loop Destroy Grab", wait = 0.25 },
			{ id = "loopStalk", title = "Stalk Teleport", wait = 0.2 },
		},
	}

	local function targets()
		return Select.targets()
	end

	local function runOne(id, p)
		if not Util.validP(p) then
			return
		end
		if id == "loopFling" then
			Actions.fling(p, State.getValue("flingPower", 6000), true)
		elseif id == "loopKick" then
			Kick.run(p, State.getValue("kickType", "Phoenix"), true)
		elseif id == "loopKill" then
			Actions.kill(p, true)
		elseif id == "loopBring" then
			Actions.bring(p, true)
		elseif id == "loopTp" then
			Actions.tpTo(p)
		elseif id == "loopSky" then
			Actions.sky(p)
		elseif id == "loopVoid" then
			Actions.void(p, true)
		elseif id == "loopSpin" then
			Actions.spin(p)
		elseif id == "loopSNO" then
			Ownership.snoPlayer(p)
		elseif id == "loopGrab" then
			local r = Util.rootOf(p)
			if r then
				Ownership.createGrabLine(r, r.CFrame)
			end
		elseif id == "loopStackKick" then
			Kick.run(p, "StackKick", true)
		elseif id == "loopHardFling" then
			Actions.fling(p, 20000, true)
		elseif id == "loopDestroyGrab" then
			Actions.destroyGrab(p)
		elseif id == "loopStalk" then
			local me, r = Util.hrp(), Util.rootOf(p)
			if me and r then
				me.CFrame = r.CFrame * CFrame.new(0, 0, 4)
			end
		end
	end

	function Loops.set(id, on)
		State.setToggle(id, on == true)
		local loopId = "player." .. id
		if not on then
			Loop.stop(loopId)
			return
		end
		local wait = 0.4
		for _, d in ipairs(Loops.defs) do
			if d.id == id then
				wait = d.wait
				break
			end
		end
		Loop.start(loopId, wait, function()
			if not State.getToggle(id) then
				return
			end
			for _, p in ipairs(targets()) do
				pcall(runOne, id, p)
			end
		end)
	end

	function Loops.syncAll()
		for _, d in ipairs(Loops.defs) do
			if State.getToggle(d.id) then
				Loops.set(d.id, true)
			else
				Loop.stop("player." .. d.id)
			end
		end
	end

	return Loops
end
