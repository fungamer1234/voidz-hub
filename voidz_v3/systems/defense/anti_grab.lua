--[[
  Anti-Grab - multi-strategy break stack (15 methods).
  NEVER share free-move paths with Gucci.
]]
return function(require)
	local Services = require("core.services")
	local State = require("core.state")
	local Loop = require("core.loop")
	local Util = require("core.util")
	local Bus = require("core.bus")

	local AntiGrab = {
		id = "antiGrab",
		active = false,
		lastBreak = 0,
		immuneUntil = 0,
		scores = {}, -- strategy id -> demote until clock
		stats = {},
		_childConns = {},
	}

	local STRATS = {
		"deny_grabparts",
		"destroy_grabparts",
		"struggle",
		"destroy_grabline_self",
		"strip_welds",
		"clear_partowner",
		"stop_velocity",
		"ragdoll_clear",
		"hum_state",
		"unsit",
		"collide_restore",
		"net_reclaim",
		"safe_tp",
		"immune_window",
		"scoreboard",
	}

	for _, id in ipairs(STRATS) do
		AntiGrab.scores[id] = 0
		AntiGrab.stats[id] = { ok = 0, fail = 0 }
	end

	local function demoted(id)
		return (AntiGrab.scores[id] or 0) > os.clock()
	end

	local function mark(id, success)
		local s = AntiGrab.stats[id]
		if not s then
			return
		end
		if success then
			s.ok = s.ok + 1
		else
			s.fail = s.fail + 1
			-- demote failing strategy ~4s
			AntiGrab.scores[id] = os.clock() + 4
		end
	end

	local function char()
		return Util.char()
	end

	local function underAttack()
		local c = char()
		if not c then
			return false
		end
		if c:GetAttribute("IsHeld") == true then
			return true
		end
		if c:FindFirstChild("GrabParts", true) then
			return true
		end
		for _, d in ipairs(c:GetDescendants()) do
			if d.Name == "PartOwner" or d.Name == "GrabWeld" then
				return true
			end
			if d:IsA("Weld") or d:IsA("WeldConstraint") then
				local p0, p1 = d.Part0, d.Part1
				if p0 and p1 then
					local o0 = p0:FindFirstAncestorOfClass("Model")
					local o1 = p1:FindFirstAncestorOfClass("Model")
					if o0 and o1 and o0 ~= o1 and (o0 == c or o1 == c) then
						return true
					end
				end
			end
		end
		local lp = Services.LP
		for _, p in ipairs(Services.Players:GetPlayers()) do
			if p ~= lp and p.Character then
				local gp = p.Character:FindFirstChild("GrabParts")
				if gp then
					for _, w in ipairs(gp:GetDescendants()) do
						if (w:IsA("Weld") or w:IsA("WeldConstraint")) and w.Part0 and w.Part1 then
							if w.Part0:IsDescendantOf(c) or w.Part1:IsDescendantOf(c) then
								return true
							end
						end
					end
				end
			end
		end
		return false
	end

	-- 1 early deny via ChildAdded (wired in enable)
	local function s_deny_grabparts()
		-- passive; success if no GrabParts under char
		local c = char()
		if not c then
			return false
		end
		local gp = c:FindFirstChild("GrabParts")
		return gp == nil
	end

	-- 2 destroy attacking GrabParts (local only)
	local function s_destroy_grabparts()
		local c = char()
		if not c then
			return false
		end
		local did = false
		local gp = c:FindFirstChild("GrabParts")
		if gp then
			pcall(function()
				gp:Destroy()
			end)
			did = true
		end
		for _, d in ipairs(c:GetDescendants()) do
			if d.Name == "GrabParts" or d.Name == "GrabPart" then
				pcall(function()
					d:Destroy()
				end)
				did = true
			end
		end
		-- attacker grab kits welded to us
		local lp = Services.LP
		for _, p in ipairs(Services.Players:GetPlayers()) do
			if p ~= lp and p.Character then
				local ag = p.Character:FindFirstChild("GrabParts")
				if ag then
					for _, w in ipairs(ag:GetDescendants()) do
						if (w:IsA("Weld") or w:IsA("WeldConstraint")) and w.Part0 and w.Part1 then
							if w.Part0:IsDescendantOf(c) or w.Part1:IsDescendantOf(c) then
								pcall(function()
									w:Destroy()
								end)
								did = true
							end
						end
					end
				end
			end
		end
		return did
	end

	-- 3 FE Struggle
	local function s_struggle()
		local r = Services.FTAP.Struggle
		if not r then
			return false
		end
		local ok = false
		for _ = 1, 3 do
			local s = pcall(function()
				if r:IsA("RemoteEvent") then
					r:FireServer()
				elseif r:IsA("RemoteFunction") then
					r:InvokeServer()
				end
			end)
			ok = ok or s
		end
		return ok
	end

	-- 4 DestroyGrabLine on self parts only
	local function s_destroy_grabline_self()
		local r = Services.FTAP.DestroyGrabLine
		local c = char()
		local hrp = Util.hrp()
		if not r or not c or not hrp then
			return false
		end
		local ok = false
		for _, part in ipairs(c:GetChildren()) do
			if part:IsA("BasePart") then
				local s = pcall(function()
					if r:IsA("RemoteEvent") then
						r:FireServer(part)
					end
				end)
				ok = ok or s
			end
		end
		pcall(function()
			if r:IsA("RemoteEvent") then
				r:FireServer(hrp)
			end
		end)
		return ok
	end

	-- 5 strip foreign welds / aligns on local char
	local function s_strip_welds()
		local c = char()
		if not c then
			return false
		end
		local did = false
		for _, d in ipairs(c:GetDescendants()) do
			local cls = d.ClassName
			if cls == "Weld" or cls == "WeldConstraint" or cls == "AlignPosition" or cls == "AlignOrientation" or cls == "RigidConstraint" then
				-- keep Motor6D (character joints)
				local kill = true
				if cls == "Weld" or cls == "WeldConstraint" then
					local p0, p1 = d.Part0, d.Part1
					if p0 and p1 and p0:IsDescendantOf(c) and p1:IsDescendantOf(c) then
						-- internal weld - only kill if named grab-like
						local n = string.lower(d.Name)
						kill = string.find(n, "grab") ~= nil or string.find(n, "hold") ~= nil
					end
				end
				if kill then
					pcall(function()
						d:Destroy()
					end)
					did = true
				end
			end
		end
		return did
	end

	-- 6 clear PartOwner markers
	local function s_clear_partowner()
		local c = char()
		if not c then
			return false
		end
		local did = false
		for _, d in ipairs(c:GetDescendants()) do
			if d.Name == "PartOwner" or d.Name == "GrabbedBy" then
				pcall(function()
					d:Destroy()
				end)
				did = true
			end
			pcall(function()
				if d:GetAttribute("PartOwner") ~= nil then
					d:SetAttribute("PartOwner", nil)
					did = true
				end
			end)
		end
		return did
	end

	-- 7 StopAllVelocity FE
	local function s_stop_velocity()
		local r = Services.FTAP.StopAllVelocity
		local hrp = Util.hrp()
		if hrp then
			pcall(function()
				hrp.AssemblyLinearVelocity = Vector3.zero
				hrp.AssemblyAngularVelocity = Vector3.zero
			end)
		end
		if not r then
			return hrp ~= nil
		end
		return pcall(function()
			if r:IsA("RemoteEvent") then
				r:FireServer()
			elseif r:IsA("RemoteFunction") then
				r:InvokeServer()
			end
		end)
	end

	-- 8 ragdoll clear
	local function s_ragdoll_clear()
		local hum = Util.hum()
		local r = Services.FTAP.RagdollRemote
		local ok = false
		if hum then
			ok = pcall(function()
				hum:ChangeState(Enum.HumanoidStateType.GettingUp)
				hum:SetStateEnabled(Enum.HumanoidStateType.Ragdoll, false)
				hum:SetStateEnabled(Enum.HumanoidStateType.FallingDown, false)
			end)
		end
		if r then
			pcall(function()
				if r:IsA("RemoteEvent") then
					r:FireServer(false)
				end
			end)
		end
		return ok
	end

	-- 9 humanoid state reset
	local function s_hum_state()
		local hum = Util.hum()
		if not hum then
			return false
		end
		return pcall(function()
			hum:ChangeState(Enum.HumanoidStateType.Running)
			hum.PlatformStand = false
			hum.AutoRotate = true
		end)
	end

	-- 10 unsit
	local function s_unsit()
		local hum = Util.hum()
		if not hum then
			return false
		end
		return pcall(function()
			hum.Sit = false
			hum.PlatformStand = false
			if hum.SeatPart then
				hum.SeatPart:Sit(nil)
			end
		end)
	end

	-- 11 collision restore
	local function s_collide_restore()
		local c = char()
		if not c then
			return false
		end
		local did = false
		for _, p in ipairs(c:GetDescendants()) do
			if p:IsA("BasePart") and p.Name ~= "HumanoidRootPart" then
				if p.CanCollide == false and (p.Name == "Torso" or p.Name == "UpperTorso" or p.Name == "LowerTorso" or string.find(p.Name, "Leg") or string.find(p.Name, "Foot")) then
					pcall(function()
						p.CanCollide = true
					end)
					did = true
				end
			end
		end
		return did
	end

	-- 12 network reclaim local roots
	local function s_net_reclaim()
		local c = char()
		local sno = Services.FTAP.SetNetworkOwner
		if not c then
			return false
		end
		local ok = false
		for _, p in ipairs(c:GetDescendants()) do
			if p:IsA("BasePart") then
				pcall(function()
					p:SetNetworkOwner(Services.LP)
					ok = true
				end)
				if sno then
					pcall(function()
						if sno:IsA("RemoteEvent") then
							sno:FireServer(p)
						elseif sno:IsA("RemoteFunction") then
							sno:InvokeServer(p)
						end
						ok = true
					end)
				end
			end
		end
		return ok
	end

	-- 13 optional safe TP (house) - only if user toggle antiGrabSafeTP
	local function s_safe_tp()
		if not State.getToggle("antiGrabSafeTP") then
			return false
		end
		local hrp = Util.hrp()
		if not hrp then
			return false
		end
		-- light hop up, not house spam
		return pcall(function()
			hrp.CFrame = hrp.CFrame + Vector3.new(0, 8, 0)
		end)
	end

	-- 14 immune window after break
	local function s_immune_window()
		AntiGrab.immuneUntil = os.clock() + 1.25
		return true
	end

	-- 15 scoreboard tick (bookkeeping)
	local function s_scoreboard()
		return true
	end

	local RUNNERS = {
		deny_grabparts = s_deny_grabparts,
		destroy_grabparts = s_destroy_grabparts,
		struggle = s_struggle,
		destroy_grabline_self = s_destroy_grabline_self,
		strip_welds = s_strip_welds,
		clear_partowner = s_clear_partowner,
		stop_velocity = s_stop_velocity,
		ragdoll_clear = s_ragdoll_clear,
		hum_state = s_hum_state,
		unsit = s_unsit,
		collide_restore = s_collide_restore,
		net_reclaim = s_net_reclaim,
		safe_tp = s_safe_tp,
		immune_window = s_immune_window,
		scoreboard = s_scoreboard,
	}

	function AntiGrab.runStack()
		if os.clock() < AntiGrab.immuneUntil then
			return
		end
		if not underAttack() then
			return
		end
		local broke = false
		for _, id in ipairs(STRATS) do
			if not demoted(id) then
				local fn = RUNNERS[id]
				if fn then
					local ok, res = pcall(fn)
					local success = ok and res == true
					mark(id, success)
					if success and id ~= "scoreboard" and id ~= "immune_window" and id ~= "deny_grabparts" then
						broke = true
					end
				end
			end
		end
		if broke then
			AntiGrab.lastBreak = os.clock()
			s_immune_window()
			Bus.emit("antigrab.break")
		end
	end

	function AntiGrab.tick()
		if not State.getToggle("antiGrab") then
			return
		end
		AntiGrab.runStack()
	end

	local function clearChildConns()
		for _, c in ipairs(AntiGrab._childConns) do
			pcall(function()
				c:Disconnect()
			end)
		end
		AntiGrab._childConns = {}
	end

	local function wireChar(c)
		clearChildConns()
		if not c then
			return
		end
		-- strategy 1: deny GrabParts attaching
		local conn = c.ChildAdded:Connect(function(ch)
			if not State.getToggle("antiGrab") then
				return
			end
			if ch.Name == "GrabParts" or ch.Name == "GrabPart" or ch.Name == "PartOwner" then
				task.defer(function()
					pcall(function()
						ch:Destroy()
					end)
					mark("deny_grabparts", true)
				end)
			end
		end)
		AntiGrab._childConns[#AntiGrab._childConns + 1] = conn
		local dconn = c.DescendantAdded:Connect(function(d)
			if not State.getToggle("antiGrab") then
				return
			end
			if d.Name == "GrabParts" or d.Name == "PartOwner" then
				task.defer(function()
					pcall(function()
						d:Destroy()
					end)
				end)
			end
		end)
		AntiGrab._childConns[#AntiGrab._childConns + 1] = dconn
	end

	function AntiGrab.enable()
		State.setToggle("antiGrab", true)
		AntiGrab.active = true
		Services.resolveFTAP()
		wireChar(char())
		AntiGrab._spawnConn = Services.LP.CharacterAdded:Connect(wireChar)
		Loop.start("sys.antigrab", 0.08, AntiGrab.tick)
		Bus.emit("antigrab.enabled", true)
	end

	function AntiGrab.disable()
		State.setToggle("antiGrab", false)
		AntiGrab.active = false
		Loop.stop("sys.antigrab")
		clearChildConns()
		if AntiGrab._spawnConn then
			pcall(function()
				AntiGrab._spawnConn:Disconnect()
			end)
			AntiGrab._spawnConn = nil
		end
		Bus.emit("antigrab.enabled", false)
	end

	function AntiGrab.sync()
		if State.getToggle("antiGrab") then
			AntiGrab.enable()
		else
			AntiGrab.disable()
		end
	end

	function AntiGrab.getStrategyList()
		local out = {}
		for i, id in ipairs(STRATS) do
			local st = AntiGrab.stats[id]
			out[i] = {
				id = id,
				ok = st.ok,
				fail = st.fail,
				demoted = demoted(id),
			}
		end
		return out
	end

	return AntiGrab
end
