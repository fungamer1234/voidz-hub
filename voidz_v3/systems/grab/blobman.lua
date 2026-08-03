--[[
  Blobman - classic 1.2.75-style mount + park + CreatureGrab.
  Reuse seat, spawn cooldown, re-sit after park, sticky opt-in only, no home-TP unseat.
]]
return function(require)
	local Services = require("core.services")
	local State = require("core.state")
	local Loop = require("core.loop")
	local Util = require("core.util")
	local Bus = require("core.bus")

	local Blobman = {
		lastSpawnAt = 0,
		busy = false,
		kit = nil,
		_stickyGen = 0,
	}

	local SPAWN_CD = 3.5
	local PARK = CFrame.new(0, 1, 7)
	local LP = Services.LP

	local function isBlobSeat(seat)
		if not seat or not seat.Parent then
			return false
		end
		local n = string.lower(tostring(seat.Name) .. " " .. tostring(seat.Parent.Name))
		if string.find(n, "blob", 1, true) then
			return true
		end
		local blob = seat.Parent
		return blob:FindFirstChild("BlobmanSeatAndOwnerScript") ~= nil
			or blob:FindFirstChild("BlobmanSeatAndOwnerScript", true) ~= nil
	end

	function Blobman.isOn()
		local h = Util.hum()
		if not h or not h.SeatPart then
			return false
		end
		return isBlobSeat(h.SeatPart)
	end

	function Blobman.findExistingSeat()
		local h = Util.hum()
		local seats = {}
		local function scan(root)
			if not root then
				return
			end
			for _, d in ipairs(root:GetDescendants()) do
				if (d:IsA("Seat") or d:IsA("VehicleSeat")) and isBlobSeat(d) then
					seats[#seats + 1] = d
				end
			end
		end
		scan(workspace:FindFirstChild(LP.Name .. "SpawnedInToys"))
		if #seats == 0 then
			for _, pl in ipairs(Services.Players:GetPlayers()) do
				scan(workspace:FindFirstChild(pl.Name .. "SpawnedInToys"))
				if #seats > 0 then
					break
				end
			end
		end
		for _, seat in ipairs(seats) do
			if not seat.Occupant or seat.Occupant == h then
				return seat
			end
		end
		return seats[1]
	end

	function Blobman.sit(seat)
		local me = Util.hrp()
		local h = Util.hum()
		if not me or not h or not seat or not seat.Parent then
			return false
		end
		pcall(function()
			if seat.Occupant and seat.Occupant ~= h then
				seat.Occupant.Sit = false
			end
		end)
		pcall(function()
			me.AssemblyLinearVelocity = Vector3.zero
			me.CFrame = seat.CFrame * CFrame.new(0, 2.5, 0)
			h.PlatformStand = false
			h.Sit = true
			seat:Sit(h)
		end)
		task.wait(0.1)
		pcall(function()
			h.Sit = true
			seat:Sit(h)
		end)
		task.wait(0.08)
		return Blobman.isOn()
	end

	function Blobman.ensure(quiet)
		Services.resolveFTAP()
		if Blobman.isOn() then
			if State.getToggle("blobStickySeat") then
				Blobman.startSticky()
			end
			return true
		end
		local me = Util.hrp()
		if not me then
			return false
		end

		local existing = Blobman.findExistingSeat()
		if existing and Blobman.sit(existing) then
			if State.getToggle("blobStickySeat") then
				Blobman.startSticky()
			end
			return true
		end

		local now = os.clock()
		if Blobman.lastSpawnAt > 0 and (now - Blobman.lastSpawnAt) < SPAWN_CD then
			for _ = 1, 12 do
				task.wait(0.1)
				existing = Blobman.findExistingSeat()
				if existing and Blobman.sit(existing) then
					if State.getToggle("blobStickySeat") then
						Blobman.startSticky()
					end
					return true
				end
				if Blobman.isOn() then
					return true
				end
			end
			return Blobman.isOn()
		end
		Blobman.lastSpawnAt = now

		local FTAP = Services.FTAP
		pcall(function()
			if FTAP.BuyToy then
				FTAP.BuyToy:InvokeServer("CreatureBlobman")
			end
		end)
		task.wait(0.15)
		pcall(function()
			if FTAP.SpawnToy then
				FTAP.SpawnToy:InvokeServer("CreatureBlobman", me.CFrame * CFrame.new(0, 0, -5), Vector3.zero)
			end
		end)

		for _ = 1, 25 do
			task.wait(0.08)
			if Blobman.isOn() then
				if State.getToggle("blobStickySeat") then
					Blobman.startSticky()
				end
				return true
			end
			existing = Blobman.findExistingSeat()
			if existing and Blobman.sit(existing) then
				if State.getToggle("blobStickySeat") then
					Blobman.startSticky()
				end
				return true
			end
		end
		return Blobman.isOn()
	end

	function Blobman.getKit()
		local h = Util.hum()
		if not h or not h.SeatPart or not h.SeatPart.Parent then
			return nil
		end
		local blob = h.SeatPart.Parent
		local n = string.lower(tostring(blob.Name))
		if not (string.find(n, "blob", 1, true) or blob:FindFirstChild("BlobmanSeatAndOwnerScript") or blob:FindFirstChild("BlobmanSeatAndOwnerScript", true)) then
			return nil
		end
		local leftDet = blob:FindFirstChild("LeftDetector") or blob:FindFirstChild("LeftDetector", true)
		if not leftDet then
			for _, d in ipairs(blob:GetDescendants()) do
				if d:IsA("BasePart") and string.find(string.lower(d.Name), "detector", 1, true) then
					leftDet = d
					break
				end
			end
		end
		if not leftDet then
			return nil
		end
		local leftWeld = leftDet:FindFirstChild("LeftWeld")
			or leftDet:FindFirstChild("LeftWeld", true)
			or leftDet:FindFirstChildWhichIsA("Weld")
			or leftDet:FindFirstChildWhichIsA("WeldConstraint")
		local scriptFolder = blob:FindFirstChild("BlobmanSeatAndOwnerScript")
			or blob:FindFirstChild("BlobmanSeatAndOwnerScript", true)
		local creatureGrab = scriptFolder
			and (scriptFolder:FindFirstChild("CreatureGrab") or scriptFolder:FindFirstChild("CreatureGrab", true))
		if not creatureGrab then
			for _, d in ipairs(blob:GetDescendants()) do
				if d.Name == "CreatureGrab" and (d:IsA("RemoteEvent") or d:IsA("RemoteFunction")) then
					creatureGrab = d
					break
				end
			end
		end
		if not creatureGrab then
			return nil
		end
		local kit = {
			blob = blob,
			seat = h.SeatPart,
			leftDet = leftDet,
			leftWeld = leftWeld,
			creatureGrab = creatureGrab,
		}
		Blobman.kit = kit
		return kit
	end

	function Blobman.park(kit, targetRoot)
		if not kit or not targetRoot or not kit.blob then
			return
		end
		local pivot = kit.blob.PrimaryPart or kit.seat
		if not pivot then
			return
		end
		pcall(function()
			local dest = targetRoot.CFrame * PARK
			if kit.blob.PrimaryPart then
				kit.blob:PivotTo(dest)
			else
				pivot.CFrame = dest
			end
			for _, part in ipairs(kit.blob:GetDescendants()) do
				if part:IsA("BasePart") then
					part.Anchored = true
					part.AssemblyLinearVelocity = Vector3.zero
					part.AssemblyAngularVelocity = Vector3.zero
				end
			end
			local me = Util.hrp()
			if me then
				me.CFrame = dest * CFrame.new(0, 2, 0)
				me.AssemblyLinearVelocity = Vector3.zero
			end
			local h = Util.hum()
			if h and kit.seat and kit.seat.Parent then
				h.Sit = true
				kit.seat:Sit(h)
			end
			task.wait(0.05)
			for _, part in ipairs(kit.blob:GetDescendants()) do
				if part:IsA("BasePart") then
					part.Anchored = false
				end
			end
			if h and kit.seat and kit.seat.Parent then
				h.Sit = true
				kit.seat:Sit(h)
			end
		end)
	end

	function Blobman.fireGrab(kit, targetRoot)
		if not kit or not targetRoot or not kit.creatureGrab or not kit.leftDet then
			return
		end
		if not kit.creatureGrab.Parent or not kit.leftDet.Parent then
			return
		end
		if not kit.leftWeld or not kit.leftWeld.Parent then
			kit.leftWeld = kit.leftDet:FindFirstChild("LeftWeld")
				or kit.leftDet:FindFirstChildWhichIsA("Weld")
				or kit.leftDet:FindFirstChildWhichIsA("WeldConstraint")
		end
		local function fire(part)
			pcall(function()
				if kit.creatureGrab:IsA("RemoteEvent") then
					kit.creatureGrab:FireServer(kit.leftDet, part, kit.leftWeld)
				else
					kit.creatureGrab:InvokeServer(kit.leftDet, part, kit.leftWeld)
				end
			end)
		end
		fire(targetRoot)
		local model = targetRoot:FindFirstAncestorOfClass("Model")
		if model then
			for _, n in ipairs({ "Torso", "UpperTorso", "HumanoidRootPart" }) do
				local part = model:FindFirstChild(n)
				if part and part ~= targetRoot and part:IsA("BasePart") then
					fire(part)
				end
			end
		end
	end

	function Blobman.mount()
		if Blobman.isOn() then
			return Blobman.getKit()
		end
		local seat = Blobman.findExistingSeat()
		if seat and Blobman.sit(seat) then
			return Blobman.getKit()
		end
		pcall(function()
			Blobman.ensure(true)
		end)
		return Blobman.getKit() or Blobman.kit
	end

	function Blobman.grabOnce(player)
		if not Util.validP(player) then
			return false
		end
		local kit = Blobman.mount()
		if not kit then
			return false
		end
		local ok = false
		for _ = 1, 5 do
			local r = Util.rootOf(player)
			if not r then
				break
			end
			if not Blobman.isOn() then
				kit = Blobman.mount() or kit
			end
			if not kit then
				break
			end
			Blobman.park(kit, r)
			kit = Blobman.getKit() or kit
			if kit then
				for _ = 1, 4 do
					Blobman.fireGrab(kit, r)
					task.wait()
				end
				ok = true
			end
			task.wait(0.08)
		end
		if ok then
			Bus.emit("blobman.grab", player)
		end
		return ok
	end

	function Blobman.grabAll()
		local kit = Blobman.mount()
		if not kit then
			return false
		end
		for _, p in ipairs(Services.Players:GetPlayers()) do
			if Util.validP(p) then
				local r = Util.rootOf(p)
				if r then
					if not Blobman.isOn() then
						kit = Blobman.mount() or kit
					end
					Blobman.park(kit, r)
					kit = Blobman.getKit() or kit
					for _ = 1, 3 do
						Blobman.fireGrab(kit, r)
						task.wait()
					end
				end
			end
		end
		Bus.emit("blobman.grabAll")
		return true
	end

	function Blobman.setLoopGrab(on, player)
		local id = "blobGrabLoop"
		if not on then
			Loop.stop(id)
			State.setToggle("blobGrabLoop", false)
			Blobman.busy = false
			Bus.emit("blobman.loop", false)
			return true
		end
		if not player or not player.Parent then
			State.setToggle("blobGrabLoop", false)
			return false
		end
		Loop.stop(id)
		State.setToggle("blobGrabLoop", true)
		Blobman.busy = false
		if State.getToggle("blobStickySeat") then
			Blobman.startSticky()
		end
		local targetName = player.Name
		task.spawn(function()
			Blobman.mount()
			local t = Services.Players:FindFirstChild(targetName) or player
			if t and t.Parent then
				Blobman.grabOnce(t)
			end
		end)
		-- 1.2.75 interval; busy-lock; no home-TP
		Loop.start(id, 0.40, function()
			if not State.getToggle("blobGrabLoop") then
				return
			end
			if Blobman.busy then
				return
			end
			Blobman.busy = true
			pcall(function()
				local target = Services.Players:FindFirstChild(targetName) or State.selected
				if not target or not target.Parent then
					return
				end
				if not Blobman.isOn() then
					Blobman.mount()
				end
				if not Blobman.getKit() then
					return
				end
				Blobman.grabOnce(target)
			end)
			Blobman.busy = false
		end)
		Bus.emit("blobman.loop", true, player)
		return true
	end

	function Blobman.setLoopGrabAll(on)
		local id = "blobGrabAllLoop"
		if not on then
			Loop.stop(id)
			State.setToggle("blobGrabAllLoop", false)
			Blobman.busy = false
			return true
		end
		Loop.stop(id)
		State.setToggle("blobGrabAllLoop", true)
		if State.getToggle("blobStickySeat") then
			Blobman.startSticky()
		end
		Loop.start(id, 0.85, function()
			if not State.getToggle("blobGrabAllLoop") then
				return
			end
			if Blobman.busy then
				return
			end
			Blobman.busy = true
			pcall(Blobman.grabAll)
			Blobman.busy = false
		end)
		return true
	end

	function Blobman.startSticky()
		Blobman._stickyGen = (Blobman._stickyGen or 0) + 1
		local gen = Blobman._stickyGen
		Loop.start("blobSticky", 0.25, function()
			if gen ~= Blobman._stickyGen or not State.getToggle("blobStickySeat") then
				return
			end
			if Blobman.isOn() then
				return
			end
			-- only re-sit if a grab loop / session wants us on blob
			if not (State.getToggle("blobGrabLoop") or State.getToggle("blobGrabAllLoop")) then
				return
			end
			local seat = Blobman.findExistingSeat()
			if seat then
				Blobman.sit(seat)
			end
		end)
	end

	function Blobman.stopSticky()
		Blobman._stickyGen = (Blobman._stickyGen or 0) + 1
		Loop.stop("blobSticky")
	end

	function Blobman.dismount()
		Blobman.setLoopGrab(false)
		Blobman.setLoopGrabAll(false)
		Blobman.stopSticky()
		local h = Util.hum()
		if h then
			pcall(function()
				h.Sit = false
				h.PlatformStand = false
			end)
		end
	end

	function Blobman.sync()
		if State.getToggle("blobStickySeat") and (State.getToggle("blobGrabLoop") or State.getToggle("blobGrabAllLoop")) then
			Blobman.startSticky()
		else
			Blobman.stopSticky()
		end
		-- loops need a target; don't auto-restart grab loop without selection
		if not State.getToggle("blobGrabLoop") then
			Loop.stop("blobGrabLoop")
		end
		if not State.getToggle("blobGrabAllLoop") then
			Loop.stop("blobGrabAllLoop")
		elseif State.getToggle("blobGrabAllLoop") then
			Blobman.setLoopGrabAll(true)
		end
	end

	return Blobman
end
