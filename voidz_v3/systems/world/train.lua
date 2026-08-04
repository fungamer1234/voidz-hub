--[[ Blue train drive - mount seat + SNO soft control ]]
return function(require)
	local Services = require("core.services")
	local State = require("core.state")
	local Loop = require("core.loop")
	local Util = require("core.util")
	local Ownership = require("systems.object.ownership")

	local Train = { seat = nil, model = nil }

	local function findTrainSeat()
		local me = Util.hrp()
		if not me then
			return nil
		end
		local best, bestD = nil, 200
		for _, d in ipairs(workspace:GetDescendants()) do
			if d:IsA("VehicleSeat") then
				local n = string.lower(d:GetFullName())
				if string.find(n, "train", 1, true) or string.find(n, "alwayshere", 1, true) or string.find(n, "blue", 1, true) then
					local dist = (d.Position - me.Position).Magnitude
					if dist < bestD then
						bestD = dist
						best = d
					end
				end
			end
		end
		if best then
			return best
		end
		-- nearest vehicle seat fallback
		for _, d in ipairs(workspace:GetDescendants()) do
			if d:IsA("VehicleSeat") then
				local dist = (d.Position - me.Position).Magnitude
				if dist < bestD then
					bestD = dist
					best = d
				end
			end
		end
		return best
	end

	function Train.mount()
		local seat = findTrainSeat()
		if not seat then
			return false
		end
		local me = Util.hrp()
		local h = Util.hum()
		if not me or not h then
			return false
		end
		pcall(function()
			me.CFrame = seat.CFrame * CFrame.new(0, 3, 0)
			h.Sit = true
			seat:Sit(h)
		end)
		task.wait(0.15)
		pcall(function()
			seat:Sit(h)
			h.Sit = true
		end)
		Train.seat = seat
		Train.model = seat:FindFirstAncestorOfClass("Model") or seat.Parent
		return h.SeatPart == seat or (h.SeatPart and h.SeatPart:IsA("VehicleSeat"))
	end

	function Train.drive(on)
		State.setToggle("trainDrive", on == true)
		if not on then
			Loop.stop("world.train")
			local h = Util.hum()
			if h then
				pcall(function()
					h.Sit = false
				end)
			end
			return
		end
		if not Train.mount() then
			State.setToggle("trainDrive", false)
			return false
		end
		Loop.start("world.train", 0.05, function()
			if not State.getToggle("trainDrive") then
				return
			end
			local h = Util.hum()
			local seat = h and h.SeatPart
			if not seat or not seat:IsA("VehicleSeat") then
				Train.mount()
				return
			end
			local model = seat:FindFirstAncestorOfClass("Model") or seat.Parent
			for _, p in ipairs(model:GetDescendants()) do
				if p:IsA("BasePart") then
					Ownership.sno(p)
				end
			end
			local cam = workspace.CurrentCamera
			local uis = Services.UserInputService
			local dir = Vector3.zero
			if cam then
				if uis:IsKeyDown(Enum.KeyCode.W) then
					dir = dir + cam.CFrame.LookVector
				end
				if uis:IsKeyDown(Enum.KeyCode.S) then
					dir = dir - cam.CFrame.LookVector
				end
				if uis:IsKeyDown(Enum.KeyCode.A) then
					dir = dir - cam.CFrame.RightVector
				end
				if uis:IsKeyDown(Enum.KeyCode.D) then
					dir = dir + cam.CFrame.RightVector
				end
			end
			local spd = tonumber(State.getValue("trainSpeed", 140)) or 140
			if dir.Magnitude > 0 then
				dir = Vector3.new(dir.X, 0, dir.Z)
				if dir.Magnitude > 0 then
					dir = dir.Unit * spd
					pcall(function()
						if model.PrimaryPart then
							model:PivotTo(model:GetPivot() + dir * 0.05)
						end
						seat.AssemblyLinearVelocity = Vector3.new(dir.X, seat.AssemblyLinearVelocity.Y, dir.Z)
					end)
				end
			end
			-- soft re-sit
			if h and not h.Sit then
				pcall(function()
					seat:Sit(h)
				end)
			end
		end)
		return true
	end

	return Train
end
