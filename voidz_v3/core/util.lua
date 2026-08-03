--[[ VOIDZ V3 — shared helpers ]]
return function(require)
	local Services = require("core.services")
	local LP = Services.LP

	local Util = {}

	function Util.char()
		return LP.Character
	end

	function Util.hum()
		local c = LP.Character
		return c and c:FindFirstChildOfClass("Humanoid")
	end

	function Util.hrp()
		local c = LP.Character
		return c and c:FindFirstChild("HumanoidRootPart")
	end

	function Util.rootOf(p)
		if not p or not p.Character then return nil end
		return p.Character:FindFirstChild("HumanoidRootPart")
			or p.Character:FindFirstChild("Torso")
			or p.Character:FindFirstChild("UpperTorso")
	end

	function Util.validP(p)
		return p and p.Parent and p ~= LP and p.Character and Util.rootOf(p) ~= nil
	end

	function Util.playerLabel(p)
		if not p then return "?" end
		if p.DisplayName and p.DisplayName ~= "" and p.DisplayName ~= p.Name then
			return p.DisplayName .. " (@" .. p.Name .. ")"
		end
		return "@" .. p.Name
	end

	function Util.corner(inst, r)
		local c = Instance.new("UICorner")
		c.CornerRadius = UDim.new(0, r or 10)
		c.Parent = inst
		return c
	end

	function Util.stroke(inst, col, th, tr)
		local s = Instance.new("UIStroke")
		s.Color = col
		s.Thickness = th or 1
		s.Transparency = tr or 0
		s.Parent = inst
		return s
	end

	function Util.pad(inst, t, b, l, r)
		local p = Instance.new("UIPadding")
		p.PaddingTop = UDim.new(0, t or 8)
		p.PaddingBottom = UDim.new(0, b or 8)
		p.PaddingLeft = UDim.new(0, l or 8)
		p.PaddingRight = UDim.new(0, r or 8)
		p.Parent = inst
		return p
	end

	function Util.tween(o, props, t, style)
		local tw = Services.TweenService:Create(
			o,
			TweenInfo.new(t or 0.2, style or Enum.EasingStyle.Quint, Enum.EasingDirection.Out),
			props
		)
		tw:Play()
		return tw
	end

	function Util.getUiParent()
		if type(gethui) == "function" then
			local ok, h = pcall(gethui)
			if ok and h then
				return h
			end
		end
		local ok2 = pcall(function()
			local t = Instance.new("Folder")
			t.Parent = Services.CoreGui
			t:Destroy()
		end)
		if ok2 then
			return Services.CoreGui
		end
		return LP:WaitForChild("PlayerGui")
	end


	return Util
end
