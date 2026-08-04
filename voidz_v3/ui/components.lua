--[[ VOIDZ HUB 2.0 - premium widgets ]]
return function(require)
	local Theme = require("ui.theme")

	local C = {}

	function C.corner(parent, radius)
		local c = Instance.new("UICorner")
		c.CornerRadius = radius or Theme.radius
		c.Parent = parent
		return c
	end

	function C.stroke(parent, color, thickness, transparency)
		local s = Instance.new("UIStroke")
		s.Color = color or Theme.stroke
		s.Thickness = thickness or 1
		s.Transparency = transparency or 0.25
		s.Parent = parent
		return s
	end

	function C.padding(parent, t, r, b, l)
		local p = Instance.new("UIPadding")
		p.PaddingTop = UDim.new(0, t or Theme.pad)
		p.PaddingRight = UDim.new(0, r or Theme.pad)
		p.PaddingBottom = UDim.new(0, b or Theme.pad)
		p.PaddingLeft = UDim.new(0, l or Theme.pad)
		p.Parent = parent
		return p
	end

	function C.gradient(parent, c0, c1, rot)
		local g = Instance.new("UIGradient")
		g.Color = ColorSequence.new(c0 or Theme.bg, c1 or Theme.panel)
		g.Rotation = rot or 90
		g.Parent = parent
		return g
	end

	function C.label(parent, text, opts)
		opts = opts or {}
		local l = Instance.new("TextLabel")
		l.BackgroundTransparency = 1
		l.Font = opts.bold and Theme.fontBold or Theme.font
		l.TextSize = opts.size or 13
		l.TextColor3 = opts.color or Theme.text
		l.TextXAlignment = opts.align or Enum.TextXAlignment.Left
		l.TextYAlignment = opts.valign or Enum.TextYAlignment.Center
		l.Text = text or ""
		l.TextWrapped = opts.wrap == true
		l.TextTruncate = opts.truncate and Enum.TextTruncate.AtEnd or Enum.TextTruncate.None
		l.Size = opts.sizeUDim or UDim2.new(1, 0, 0, opts.h or 18)
		l.Position = opts.pos or UDim2.new()
		l.ZIndex = opts.z or 1
		l.Parent = parent
		return l
	end

	function C.button(parent, text, onClick, opts)
		opts = opts or {}
		local b = Instance.new("TextButton")
		b.AutoButtonColor = false
		b.Font = Theme.fontBold
		b.TextSize = opts.size or 12
		b.TextColor3 = opts.textColor or Theme.text
		b.BackgroundColor3 = opts.bg or (opts.danger and Theme.dangerSoft or Theme.button)
		b.BorderSizePixel = 0
		b.Text = text or "Button"
		b.Size = opts.sizeUDim or UDim2.new(opts.fill and 1 or 0, opts.fill and 0 or (opts.w or 110), 0, opts.h or 34)
		b.Position = opts.pos or UDim2.new()
		b.LayoutOrder = opts.order or 0
		b.ZIndex = opts.z or 1
		b.Parent = parent
		C.corner(b, Theme.radiusSm)
		C.stroke(b, opts.accent and Theme.accent or (opts.danger and Theme.danger or Theme.strokeSoft), opts.accent and 1.2 or 1, 0.2)
		local base = b.BackgroundColor3
		b.MouseEnter:Connect(function()
			b.BackgroundColor3 = opts.hover or Theme.buttonHover
		end)
		b.MouseLeave:Connect(function()
			b.BackgroundColor3 = base
		end)
		if onClick then
			b.MouseButton1Click:Connect(onClick)
		end
		return b
	end

	function C.chip(parent, text, onClick, opts)
		opts = opts or {}
		local b = Instance.new("TextButton")
		b.AutoButtonColor = false
		b.Font = Theme.fontBold
		b.TextSize = 11
		b.TextColor3 = opts.on and Theme.text or Theme.textMuted
		b.BackgroundColor3 = opts.on and Theme.chipOn or Theme.chip
		b.BorderSizePixel = 0
		b.Text = text or ""
		b.Size = opts.sizeUDim or UDim2.new(0, opts.w or 96, 0, opts.h or 28)
		b.LayoutOrder = opts.order or 0
		b.Parent = parent
		C.corner(b, UDim.new(1, 0))
		C.stroke(b, opts.on and Theme.accent or Theme.strokeSoft, 1, 0.3)
		if onClick then
			b.MouseButton1Click:Connect(onClick)
		end
		function b:SetOn(on)
			b.BackgroundColor3 = on and Theme.chipOn or Theme.chip
			b.TextColor3 = on and Theme.text or Theme.textMuted
			local s = b:FindFirstChildOfClass("UIStroke")
			if s then
				s.Color = on and Theme.accent or Theme.strokeSoft
			end
		end
		return b
	end

	function C.toggle(parent, label, get, set, opts)
		opts = opts or {}
		local row = Instance.new("Frame")
		row.BackgroundColor3 = Theme.panelSoft
		row.BorderSizePixel = 0
		row.Size = opts.sizeUDim or UDim2.new(1, 0, 0, 40)
		row.LayoutOrder = opts.order or 0
		row.Parent = parent
		C.corner(row, Theme.radiusSm)
		C.stroke(row, Theme.strokeSoft, 1, 0.45)
		C.padding(row, 0, 10, 0, 12)

		C.label(row, label, { size = 12, h = 40, color = Theme.text })

		local track = Instance.new("TextButton")
		track.AutoButtonColor = false
		track.Text = ""
		track.BorderSizePixel = 0
		track.Size = UDim2.new(0, 46, 0, 24)
		track.Position = UDim2.new(1, -46, 0.5, -12)
		track.Parent = row
		C.corner(track, UDim.new(1, 0))

		local knob = Instance.new("Frame")
		knob.BorderSizePixel = 0
		knob.BackgroundColor3 = Theme.text
		knob.Size = UDim2.new(0, 18, 0, 18)
		knob.Parent = track
		C.corner(knob, UDim.new(1, 0))

		local function paint(on)
			track.BackgroundColor3 = on and Theme.toggleOn or Theme.toggleOff
			knob.Position = on and UDim2.new(1, -21, 0.5, -9) or UDim2.new(0, 3, 0.5, -9)
		end
		paint(get and get() or false)
		track.MouseButton1Click:Connect(function()
			local nextVal = not (get and get())
			if set then
				set(nextVal)
			end
			paint(get and get() or false)
		end)
		return row, paint
	end

	function C.section(parent, title, opts)
		opts = opts or {}
		local box = Instance.new("Frame")
		box.BackgroundColor3 = Theme.panel
		box.BorderSizePixel = 0
		box.Size = UDim2.new(1, 0, 0, 0)
		box.AutomaticSize = Enum.AutomaticSize.Y
		box.LayoutOrder = opts.order or 0
		box.Parent = parent
		C.corner(box, Theme.radius)
		C.stroke(box, Theme.strokeSoft, 1, 0.35)
		C.padding(box, 12, 12, 12, 12)

		local list = Instance.new("UIListLayout")
		list.SortOrder = Enum.SortOrder.LayoutOrder
		list.Padding = UDim.new(0, 8)
		list.Parent = box

		if title then
			local head = Instance.new("Frame")
			head.BackgroundTransparency = 1
			head.Size = UDim2.new(1, 0, 0, 18)
			head.LayoutOrder = 0
			head.Parent = box
			local bar = Instance.new("Frame")
			bar.BorderSizePixel = 0
			bar.BackgroundColor3 = Theme.accent
			bar.Size = UDim2.new(0, 3, 1, 0)
			bar.Parent = head
			C.corner(bar, UDim.new(1, 0))
			C.label(head, title, {
				bold = true,
				size = 11,
				color = Theme.accentGlow,
				h = 18,
				pos = UDim2.new(0, 10, 0, 0),
				sizeUDim = UDim2.new(1, -10, 1, 0),
			})
		end
		return box
	end

	function C.grid(parent, cellW, cellH, pad)
		local wrap = Instance.new("Frame")
		wrap.BackgroundTransparency = 1
		wrap.Size = UDim2.new(1, 0, 0, 0)
		wrap.AutomaticSize = Enum.AutomaticSize.Y
		wrap.Parent = parent
		local layout = Instance.new("UIGridLayout")
		layout.CellSize = UDim2.new(0, cellW or 118, 0, cellH or 34)
		layout.CellPadding = UDim2.new(0, pad or 8, 0, pad or 8)
		layout.SortOrder = Enum.SortOrder.LayoutOrder
		layout.FillDirectionMaxCells = 0
		layout.Parent = wrap
		return wrap, layout
	end

	function C.row(parent)
		local wrap = Instance.new("Frame")
		wrap.BackgroundTransparency = 1
		wrap.Size = UDim2.new(1, 0, 0, 0)
		wrap.AutomaticSize = Enum.AutomaticSize.Y
		wrap.Parent = parent
		local layout = Instance.new("UIListLayout")
		layout.FillDirection = Enum.FillDirection.Horizontal
		layout.SortOrder = Enum.SortOrder.LayoutOrder
		layout.Padding = UDim.new(0, 8)
		pcall(function()
			layout.Wraps = true
		end)
		layout.Parent = wrap

		return wrap
	end

	function C.scroll(parent)
		local s = Instance.new("ScrollingFrame")
		s.BackgroundTransparency = 1
		s.BorderSizePixel = 0
		s.ScrollBarThickness = 3
		s.ScrollBarImageColor3 = Theme.accent
		s.CanvasSize = UDim2.new(0, 0, 0, 0)
		s.AutomaticCanvasSize = Enum.AutomaticSize.Y
		s.Size = UDim2.new(1, 0, 1, 0)
		s.Parent = parent
		local list = Instance.new("UIListLayout")
		list.SortOrder = Enum.SortOrder.LayoutOrder
		list.Padding = UDim.new(0, 12)
		list.Parent = s
		C.padding(s, 2, 6, 16, 2)
		return s
	end

	function C.input(parent, placeholder, opts)
		opts = opts or {}
		local box = Instance.new("TextBox")
		box.BackgroundColor3 = Theme.bg
		box.BorderSizePixel = 0
		box.Font = Theme.font
		box.TextSize = 12
		box.TextColor3 = Theme.text
		box.PlaceholderText = placeholder or ""
		box.PlaceholderColor3 = Theme.textDim
		box.Text = opts.text or ""
		box.ClearTextOnFocus = false
		box.Size = opts.sizeUDim or UDim2.new(1, 0, 0, opts.h or 34)
		box.Parent = parent
		C.corner(box, Theme.radiusSm)
		C.stroke(box, Theme.strokeSoft, 1, 0.3)
		C.padding(box, 0, 10, 0, 10)
		return box
	end

	function C.targetBanner(parent, Select)
		local box = C.section(parent, "TARGET")
		local lab = C.label(box, "Selected: " .. Select.label(), {
			size = 13,
			color = Theme.accentGlow,
			bold = true,
			h = 20,
		})
		return box, lab
	end

	return C
end
