--[[
  Toys - BuyToy / SpawnToy via safe ownership-adjacent remotes.
  Rate-limited spawn to avoid spam.
]]
return function(require)
	local Services = require("core.services")
	local Util = require("core.util")
	local Bus = require("core.bus")
	local Ownership = require("systems.object.ownership")

	local Toys = {
		lastSpawnAt = {},
		COMMON = {
			"CreatureBlobman",
			"FoodBanana",
			"Couch",
			"Trampoline",
			"BoxingGloveLauncher",
			"SoccerBall",
			"BeachBall",
			"YouDecoy",
		},
	}

	local SPAWN_CD = 1.2

	function Toys.resolve()
		return Ownership.resolve()
	end

	function Toys.canSpawn()
		Toys.resolve()
		return Services.FTAP.SpawnToy ~= nil
	end

	function Toys.spawn(name, cf, opts)
		opts = opts or {}
		if type(name) ~= "string" or name == "" then
			return false, nil
		end
		Toys.resolve()
		local FTAP = Services.FTAP
		if not FTAP.SpawnToy then
			return false, nil
		end

		local now = os.clock()
		local last = Toys.lastSpawnAt[name] or 0
		if (now - last) < SPAWN_CD and not opts.force then
			return false, nil
		end
		Toys.lastSpawnAt[name] = now

		local me = Util.hrp()
		if not cf then
			if me then
				cf = me.CFrame * CFrame.new(0, 2, -6)
			else
				cf = CFrame.new(0, 5, 0)
			end
		end
		local rot = opts.rot or Vector3.zero

		if not opts.skipBuy and FTAP.BuyToy then
			pcall(function()
				FTAP.BuyToy:InvokeServer(name)
			end)
			task.wait(0.08)
		end

		local before = {}
		local folderName = Services.LP.Name .. "SpawnedInToys"
		local folder = workspace:FindFirstChild(folderName)
		if folder then
			for _, ch in ipairs(folder:GetChildren()) do
				before[ch] = true
			end
		end

		local ok = pcall(function()
			local remote = FTAP.SpawnToy
			if remote:IsA("RemoteFunction") then
				remote:InvokeServer(name, cf, rot)
			elseif remote:IsA("RemoteEvent") then
				remote:FireServer(name, cf, rot)
			end
		end)
		if not ok then
			return false, nil
		end

		local found = nil
		for _ = 1, 20 do
			task.wait(0.05)
			folder = workspace:FindFirstChild(folderName)
			if folder then
				for _, ch in ipairs(folder:GetChildren()) do
					if not before[ch] then
						local n = string.lower(ch.Name)
						if string.find(n, string.lower(name), 1, true) or ch.Name == name then
							found = ch
							break
						end
						if not found then
							found = ch
						end
					end
				end
			end
			if found then
				break
			end
		end

		if found then
			Bus.emit("toys.spawned", name, found)
		end
		return found ~= nil, found
	end

	function Toys.spawnInFront(name)
		local me = Util.hrp()
		if not me then
			return false, nil
		end
		return Toys.spawn(name, me.CFrame * CFrame.new(0, 1, -8))
	end

	function Toys.destroyNearest(nameHint)
		local me = Util.hrp()
		if not me then
			return false
		end
		local folder = workspace:FindFirstChild(Services.LP.Name .. "SpawnedInToys")
		if not folder then
			return false
		end
		local best, bestDist = nil, 1e9
		local hint = nameHint and string.lower(nameHint) or nil
		for _, ch in ipairs(folder:GetChildren()) do
			if not hint or string.find(string.lower(ch.Name), hint, 1, true) then
				local pp = ch.PrimaryPart or ch:FindFirstChildWhichIsA("BasePart", true)
				if pp then
					local d = (pp.Position - me.Position).Magnitude
					if d < bestDist then
						bestDist = d
						best = ch
					end
				end
			end
		end
		if best then
			pcall(function()
				best:Destroy()
			end)
			-- FE destroy toy if present
			local dt = Services.ReplicatedStorage:FindFirstChild("MenuToys")
			local remote = dt and (dt:FindFirstChild("DestroyToy") or dt:FindFirstChild("DestroyToyRemoteFunction"))
			if remote then
				pcall(function()
					if remote:IsA("RemoteFunction") then
						remote:InvokeServer(best)
					elseif remote:IsA("RemoteEvent") then
						remote:FireServer(best)
					end
				end)
			end
			Bus.emit("toys.destroyed", best)
			return true
		end
		return false
	end

	return Toys
end
