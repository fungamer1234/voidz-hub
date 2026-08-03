--[[
  Anchor Grab - ray/select object, highlight, anchor toggle, auto-replace with rate limit.
]]
return function(require)
	local Services = require("core.services")
	local State = require("core.state")
	local Loop = require("core.loop")
	local Util = require("core.util")
	local Bus = require("core.bus")
	local Ownership = require("systems.object.ownership")

	local Anchor = {
		selection = nil, -- BasePart
		model = nil,
		highlight = nil,
		box = nil,
		autoReplace = false,
		_replaceTimes = {}, -- clock stamps
		_lastName = nil,
		_lastCf = nil,
		_lastToyName = nil,
	}

	local MAX_REPLACE_PER_10S = 4

	local function clearVisuals()
		if Anchor.highlight then
			pcall(function()
				Anchor.highlight:Destroy()
			end)
			Anchor.highlight = nil
		end
		if Anchor.box then
			pcall(function()
				Anchor.box:Destroy()
			end)
			Anchor.box = nil
		end
	end

	local function paint(part)
		clearVisuals()
		if not part or not part.Parent then
			return
		end
		local parent = part
		local model = part:FindFirstAncestorOfClass("Model")
		local adorn = model or part

		local okH, hl = pcall(function()
			local h = Instance.new("Highlight")
			h.Name = "VOIDZ_V3_AnchorHL"
			h.FillColor = Color3.fromRGB(140, 90, 255)
			h.OutlineColor = Color3.fromRGB(180, 140, 255)
			h.FillTransparency = 0.65
			h.OutlineTransparency = 0
			h.Adornee = adorn
			h.Parent = adorn
			return h
		end)
		if okH and hl then
			Anchor.highlight = hl
		else
			local box = Instance.new("SelectionBox")
			box.Name = "VOIDZ_V3_AnchorBox"
			box.LineThickness = 0.05
			box.Color3 = Color3.fromRGB(140, 90, 255)
			box.Adornee = part
			box.Parent = part
			Anchor.box = box
		end
	end

	function Anchor.clear()
		clearVisuals()
		Anchor.selection = nil
		Anchor.model = nil
		Bus.emit("anchor.cleared")
	end

	function Anchor.set(part)
		if not part or not part:IsA("BasePart") then
			Anchor.clear()
			return false
		end
		-- skip local character
		local char = Util.char()
		if char and part:IsDescendantOf(char) then
			return false
		end
		Anchor.selection = part
		Anchor.model = part:FindFirstAncestorOfClass("Model")
		Anchor._lastName = part.Name
		Anchor._lastCf = part.CFrame
		if Anchor.model then
			Anchor._lastToyName = Anchor.model.Name
		else
			Anchor._lastToyName = part.Name
		end
		paint(part)
		Bus.emit("anchor.selected", part)
		return true
	end

	function Anchor.raySelect()
		local cam = workspace.CurrentCamera
		local me = Util.hrp()
		if not cam then
			return nil
		end
		local origin = cam.CFrame.Position
		local dir = cam.CFrame.LookVector * 80
		if me then
			-- prefer from character look if camera far
			origin = cam.CFrame.Position
		end
		local params = RaycastParams.new()
		params.FilterType = Enum.RaycastFilterType.Exclude
		local filter = {}
		local char = Util.char()
		if char then
			filter[#filter + 1] = char
		end
		params.FilterDescendantsInstances = filter
		local hit = workspace:Raycast(origin, dir, params)
		if hit and hit.Instance and hit.Instance:IsA("BasePart") then
			Anchor.set(hit.Instance)
			return hit.Instance
		end
		return nil
	end

	function Anchor.mouseSelect()
		local UIS = Services.UserInputService
		local cam = workspace.CurrentCamera
		if not cam then
			return Anchor.raySelect()
		end
		local mouse = UIS:GetMouseLocation()
		local ray = cam:ViewportPointToRay(mouse.X, mouse.Y)
		local params = RaycastParams.new()
		params.FilterType = Enum.RaycastFilterType.Exclude
		local filter = {}
		local char = Util.char()
		if char then
			filter[#filter + 1] = char
		end
		params.FilterDescendantsInstances = filter
		local hit = workspace:Raycast(ray.Origin, ray.Direction * 200, params)
		if hit and hit.Instance and hit.Instance:IsA("BasePart") then
			Anchor.set(hit.Instance)
			return hit.Instance
		end
		return nil
	end

	function Anchor.setAnchored(on)
		local part = Anchor.selection
		if not part or not part.Parent then
			return false
		end
		Ownership.sno(part)
		local ok = pcall(function()
			if Anchor.model then
				for _, d in ipairs(Anchor.model:GetDescendants()) do
					if d:IsA("BasePart") then
						Ownership.sno(d)
						d.Anchored = on == true
						if on then
							d.AssemblyLinearVelocity = Vector3.zero
							d.AssemblyAngularVelocity = Vector3.zero
						end
					end
				end
			else
				part.Anchored = on == true
				if on then
					part.AssemblyLinearVelocity = Vector3.zero
					part.AssemblyAngularVelocity = Vector3.zero
				end
			end
		end)
		if ok then
			Bus.emit("anchor.toggled", on)
		end
		return ok
	end

	function Anchor.toggle()
		local part = Anchor.selection
		if not part or not part.Parent then
			return false
		end
		return Anchor.setAnchored(not part.Anchored)
	end

	local function canReplace()
		local now = os.clock()
		local cut = now - 10
		local kept = {}
		for _, t in ipairs(Anchor._replaceTimes) do
			if t >= cut then
				kept[#kept + 1] = t
			end
		end
		Anchor._replaceTimes = kept
		return #kept < MAX_REPLACE_PER_10S
	end

	function Anchor.tryReplace()
		if not State.getToggle("anchorAutoReplace") then
			return false
		end
		if not canReplace() then
			return false
		end
		local Toys = require("systems.object.toys")
		local name = Anchor._lastToyName
		local cf = Anchor._lastCf
		if not name or not cf then
			return false
		end
		Anchor._replaceTimes[#Anchor._replaceTimes + 1] = os.clock()
		local ok, model = Toys.spawn(name, cf, { skipBuy = false, silent = true })
		if ok and model then
			local primary = model.PrimaryPart or model:FindFirstChildWhichIsA("BasePart", true)
			if primary then
				Anchor.set(primary)
				if State.getToggle("anchorKeepAnchored") then
					Anchor.setAnchored(true)
				end
			end
			Bus.emit("anchor.replaced", model)
			return true
		end
		return false
	end

	function Anchor.tickWatch()
		if not State.getToggle("anchorWatch") and not State.getToggle("anchorAutoReplace") then
			return
		end
		local part = Anchor.selection
		if part and part.Parent then
			Anchor._lastCf = part.CFrame
			return
		end
		-- selection gone
		if Anchor.selection ~= nil or (Anchor._lastToyName and State.getToggle("anchorAutoReplace")) then
			clearVisuals()
			Anchor.selection = nil
			Anchor.model = nil
			if State.getToggle("anchorAutoReplace") then
				Anchor.tryReplace()
			end
		end
	end

	function Anchor.startWatch()
		State.setToggle("anchorWatch", true)
		Loop.start("anchor.watch", 0.35, Anchor.tickWatch)
	end

	function Anchor.stopWatch()
		State.setToggle("anchorWatch", false)
		Loop.stop("anchor.watch")
	end

	function Anchor.sync()
		if State.getToggle("anchorWatch") or State.getToggle("anchorAutoReplace") then
			Anchor.startWatch()
		else
			Anchor.stopWatch()
		end
	end

	function Anchor.destroy()
		Anchor.stopWatch()
		Anchor.clear()
	end

	function Anchor.label()
		local p = Anchor.selection
		if not p or not p.Parent then
			return "(none)"
		end
		local m = Anchor.model
		if m then
			return m.Name .. " / " .. p.Name
		end
		return p:GetFullName()
	end

	return Anchor
end
