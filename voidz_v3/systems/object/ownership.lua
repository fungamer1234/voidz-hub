--[[ Safe FTAP remote wrappers - never bare-fire DestroyGrabLine without a part. ]]
return function(require)
	local Services = require("core.services")

	local Ownership = {}

	function Ownership.resolve()
		return Services.resolveFTAP()
	end

	function Ownership.sno(part)
		if not part or not part.Parent then
			return false
		end
		local r = Services.FTAP.SetNetworkOwner
		if not r then
			Ownership.resolve()
			r = Services.FTAP.SetNetworkOwner
		end
		if not r then
			return false
		end
		return pcall(function()
			if r:IsA("RemoteEvent") then
				r:FireServer(part)
			elseif r:IsA("RemoteFunction") then
				r:InvokeServer(part)
			end
		end)
	end

	function Ownership.snoPlayer(player)
		if not player or not player.Character then
			return false
		end
		local ok = false
		for _, d in ipairs(player.Character:GetDescendants()) do
			if d:IsA("BasePart") then
				if Ownership.sno(d) then
					ok = true
				end
			end
		end
		return ok
	end

	function Ownership.createGrabLine(part, cf)
		if not part or not part.Parent then
			return false
		end
		local r = Services.FTAP.CreateGrabLine
		if not r then
			Ownership.resolve()
			r = Services.FTAP.CreateGrabLine
		end
		if not r then
			return false
		end
		return pcall(function()
			if r:IsA("RemoteEvent") then
				r:FireServer(part, cf or part.CFrame)
			elseif r:IsA("RemoteFunction") then
				r:InvokeServer(part, cf or part.CFrame)
			end
		end)
	end

	function Ownership.destroyGrabLine(part)
		-- NEVER fire with nil - that kills your own line
		if not part or not part.Parent then
			return false
		end
		local r = Services.FTAP.DestroyGrabLine
		if not r then
			Ownership.resolve()
			r = Services.FTAP.DestroyGrabLine
		end
		if not r then
			return false
		end
		return pcall(function()
			if r:IsA("RemoteEvent") then
				r:FireServer(part)
			elseif r:IsA("RemoteFunction") then
				r:InvokeServer(part)
			end
		end)
	end

	function Ownership.stopAllVelocity()
		local r = Services.FTAP.StopAllVelocity
		if not r then
			Ownership.resolve()
			r = Services.FTAP.StopAllVelocity
		end
		if not r then
			return false
		end
		return pcall(function()
			if r:IsA("RemoteEvent") then
				r:FireServer()
			elseif r:IsA("RemoteFunction") then
				r:InvokeServer()
			end
		end)
	end

	-- Visit part roots with SNO for N frames (kick / fling helpers)
	function Ownership.visit(partOrModel, frames, onOwned)
		frames = math.clamp(tonumber(frames) or 20, 1, 120)
		local parts = {}
		if typeof(partOrModel) == "Instance" then
			if partOrModel:IsA("BasePart") then
				parts[1] = partOrModel
			elseif partOrModel:IsA("Model") then
				for _, d in ipairs(partOrModel:GetDescendants()) do
					if d:IsA("BasePart") then
						parts[#parts + 1] = d
					end
				end
			end
		end
		task.spawn(function()
			for _ = 1, frames do
				for _, p in ipairs(parts) do
					if p.Parent then
						Ownership.sno(p)
						if onOwned then
							pcall(onOwned, p)
						end
					end
				end
				task.wait()
			end
		end)
		return #parts > 0
	end

	function Ownership.status()
		local f = Services.FTAP
		return {
			ok = f.ok == true,
			CreateGrabLine = f.CreateGrabLine ~= nil,
			DestroyGrabLine = f.DestroyGrabLine ~= nil,
			SetNetworkOwner = f.SetNetworkOwner ~= nil,
			SpawnToy = f.SpawnToy ~= nil,
			BuyToy = f.BuyToy ~= nil,
			Struggle = f.Struggle ~= nil,
			StopAllVelocity = f.StopAllVelocity ~= nil,
		}
	end

	return Ownership
end

