--[[ VOIDZ HUB V3 — Toast notifications ]]
return function(require)
	local Services = require("core.services")
	local Theme = require("ui.theme")
	local Util = require("core.util")

	local Notify = {}
	local holder

	local function ensureHolder()
		if holder and holder.Parent then
			return holder
		end
		local parent = Util.getUiParent()
		local gui = parent:FindFirstChild("VOIDZ_V3_Notify")
		if not gui then
			gui = Instance.new("ScreenGui")
			gui.Name = "VOIDZ_V3_Notify"
			gui.ResetOnSpawn = false
			gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
			gui.DisplayOrder = 100
			gui.IgnoreGuiInset = true
			pcall(function()
				gui.Parent = parent
			end)
			if not gui.Parent then
				gui.Parent = Services.LP:WaitForChild("PlayerGui")
			end
		end
		holder = gui:FindFirstChild("Stack")
		if not holder then
			holder = Instance.new("Frame")
			holder.Name = "Stack"
			holder.BackgroundTransparency = 1
			holder.AnchorPoint = Vector2.new(1, 0)
			holder.Position = UDim2.new(1, -16, 0, 16)
			holder.Size = UDim2.new(0, 280, 1, -32)
			holder.Parent = gui
			local list = Instance.new("UIListLayout")
			list.SortOrder = Enum.SortOrder.LayoutOrder
			list.Padding = UDim.new(0, 8)
			list.HorizontalAlignment = Enum.HorizontalAlignment.Right
			list.Parent = holder
		end
		return holder
	end

	local COLORS = {
		info = Theme.info,
		success = Theme.success,
		warn = Theme.warn,
		error = Theme.danger,
	}

	function Notify.push(kind, title, body, duration)
		duration = duration or 3.5
		local parent = ensureHolder()
		local card = Instance.new("Frame")
		card.BackgroundColor3 = Theme.panel
		card.BorderSizePixel = 0
		card.Size = UDim2.new(1, 0, 0, 0)
		card.AutomaticSize = Enum.AutomaticSize.Y
		card.Parent = parent

		local corner = Instance.new("UICorner")
		corner.CornerRadius = Theme.radius
		corner.Parent = card

		local stroke = Instance.new("UIStroke")
		stroke.Color = COLORS[kind] or Theme.accent
		stroke.Thickness = 1.5
		stroke.Transparency = 0.25
		stroke.Parent = card

		local pad = Instance.new("UIPadding")
		pad.PaddingTop = UDim.new(0, 10)
		pad.PaddingBottom = UDim.new(0, 10)
		pad.PaddingLeft = UDim.new(0, 12)
		pad.PaddingRight = UDim.new(0, 12)
		pad.Parent = card

		local t = Instance.new("TextLabel")
		t.BackgroundTransparency = 1
		t.Font = Theme.fontBold
		t.TextSize = 13
		t.TextColor3 = COLORS[kind] or Theme.text
		t.TextXAlignment = Enum.TextXAlignment.Left
		t.Text = tostring(title or "VOIDZ")
		t.Size = UDim2.new(1, 0, 0, 16)
		t.Parent = card

		if body and body ~= "" then
			local b = Instance.new("TextLabel")
			b.BackgroundTransparency = 1
			b.Font = Theme.font
			b.TextSize = 12
			b.TextColor3 = Theme.textMuted
			b.TextXAlignment = Enum.TextXAlignment.Left
			b.TextWrapped = true
			b.Text = tostring(body)
			b.Size = UDim2.new(1, 0, 0, 0)
			b.AutomaticSize = Enum.AutomaticSize.Y
			b.Position = UDim2.new(0, 0, 0, 18)
			b.Parent = card
		end

		task.delay(duration, function()
			if card and card.Parent then
				card:Destroy()
			end
		end)
		return card
	end

	function Notify.info(title, body, d)
		return Notify.push("info", title, body, d)
	end
	function Notify.success(title, body, d)
		return Notify.push("success", title, body, d)
	end
	function Notify.warn(title, body, d)
		return Notify.push("warn", title, body, d)
	end
	function Notify.error(title, body, d)
		return Notify.push("error", title, body, d)
	end

	function Notify.destroy()
		local parent = Util.getUiParent()
		local gui = parent:FindFirstChild("VOIDZ_V3_Notify")
		if gui then
			gui:Destroy()
		end
		local pg = Services.LP:FindFirstChild("PlayerGui")
		if pg then
			local g2 = pg:FindFirstChild("VOIDZ_V3_Notify")
			if g2 then
				g2:Destroy()
			end
		end
		holder = nil
	end

	return Notify
end
