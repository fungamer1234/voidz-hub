--[[
  Classic grab-line latch (non-blob).
  State: Idle -> Mounting -> Parked -> Firing -> Holding -> Released/Failed
]]
return function(require)
	local Services = require("core.services")
	local State = require("core.state")
	local Util = require("core.util")
	local Bus = require("core.bus")
	local Ownership = require("systems.object.ownership")
	local Loop = require("core.loop")

	local Grab = {
		phase = "Idle",
		target = nil,
	}

	local function setPhase(p)
		Grab.phase = p
		Bus.emit("grab.phase", p)
	end

	function Grab.latch(player)
		if not Util.validP(player) then
			setPhase("Failed")
			return false
		end
		local r = Util.rootOf(player)
		local me = Util.hrp()
		if not r or not me then
			setPhase("Failed")
			return false
		end
		setPhase("Mounting")
		Ownership.resolve()
		local ok = false
		pcall(function()
			me.CFrame = r.CFrame * CFrame.new(0, 1, 2.5)
		end)
		setPhase("Parked")
		local torso = player.Character
			and (player.Character:FindFirstChild("Torso") or player.Character:FindFirstChild("UpperTorso") or r)
		setPhase("Firing")
		for _ = 1, 6 do
			r = Util.rootOf(player)
			if not r then
				break
			end
			Ownership.sno(r)
			if Ownership.createGrabLine(torso or r, (torso or r).CFrame) then
				ok = true
			end
			task.wait(0.03)
		end
		if ok then
			Grab.target = player
			setPhase("Holding")
			Bus.emit("grab.holding", player)
		else
			setPhase("Failed")
		end
		return ok
	end

	function Grab.release()
		local player = Grab.target
		if player and player.Character then
			for _, part in ipairs(player.Character:GetChildren()) do
				if part:IsA("BasePart") then
					Ownership.destroyGrabLine(part)
				end
			end
		end
		Grab.target = nil
		setPhase("Released")
	end

	function Grab.loopSelected(on)
		local id = "grabLoop"
		if not on then
			Loop.stop(id)
			State.setToggle("grabLoop", false)
			return
		end
		State.setToggle("grabLoop", true)
		Loop.start(id, 0.35, function()
			if not State.getToggle("grabLoop") then
				return
			end
			local t = State.selected
			if Util.validP(t) then
				Grab.latch(t)
			end
		end)
	end

	return Grab
end
