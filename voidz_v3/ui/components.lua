--[[ VOIDZ HUB V3 — Shared UI widgets ]]
return function(require)
	local Theme = require("ui.theme")

	local C = {}

	function C.corner(parent, radius)
		local c = Instance.new("UICorner")
		c.CornerRadius = radius or Theme.radius
		c.Parent = parent
		return c
	end

	function C.stroke(parent, color, thickness)
		local s = Instance.new("UIStroke")
		s.Color = color or Theme.stroke
		s.Thickness = thickness or 1
		s.Transparency = 0.2
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
		l.Size = opts.sizeUDim or UDim2.new(1, 0, 0, opts.h or 18)
		l.Position = opts.pos or UDim2.new()
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
		b.BackgroundColor3 = opts.bg or Theme.button
		b.BorderSizePixel = 0
		b.Text = text or "Button"
		b.Size = opts.sizeUDim or UDim2.new(0, opts.w or 100, 0, opts.h or 32)
		b.Position = opts.pos or UDim2.new()
		b.Parent = parent
		C.corner(b, Theme.radiusSm)
		if opts.accent then
			C.stroke(b, Theme.accent, 1)
		else
			C.stroke(b, Theme.strokeSoft, 1)
		end
		b.MouseEnter:Connect(function()
			b.BackgroundColor3 = opts.hover or Theme.buttonHover
		end)
		b.MouseLeave:Connect(function()
			b.BackgroundColor3 = opts.bg or Theme.button
		end)
		if onClick then
			b.MouseButton1Click:Connect(onClick)
		end
		return b
	end

	function C.toggle(parent, label, get, set, opts)
		opts = opts or {}
		local row = Instance.new("Frame")
		row.BackgroundTransparency = 1
		row.Size = opts.sizeUDim or UDim2.new(1, 0, 0, 36)
		row.Parent = parent

		C.label(row, label, { size = 13, h = 36 })

		local track = Instance.new("TextButton")
		track.AutoButtonColor = false
		track.Text = ""
		track.BorderSizePixel = 0
		track.Size = UDim2.new(0, 44, 0, 24)
		track.Position = UDim2.new(1, -44, 0.5, -12)
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
			-- re-read after set (handlers may reject / force off)
			paint(get and get() or false)
		end)


		return row, paint
	end

	function C.section(parent, title)
		local box = Instance.new("Frame")
		box.BackgroundColor3 = Theme.panelSoft
		box.BorderSizePixel = 0
		box.Size = UDim2.new(1, 0, 0, 0)
		box.AutomaticSize = Enum.AutomaticSize.Y
		box.Parent = parent
		C.corner(box)
		C.stroke(box, Theme.strokeSoft, 1)
		C.padding(box, 12, 12, 12, 12)

		local list = Instance.new("UIListLayout")
		list.SortOrder = Enum.SortOrder.LayoutOrder
		list.Padding = UDim.new(0, 8)
		list.Parent = box

		if title then
			C.label(box, title, { bold = true, size = 12, color = Theme.accentGlow, h = 16 })
		end
		return box
	end

	function C.scroll(parent)
		local s = Instance.new("ScrollingFrame")
		s.BackgroundTransparency = 1
		s.BorderSizePixel = 0
		s.ScrollBarThickness = 4
		s.ScrollBarImageColor3 = Theme.accent
		s.CanvasSize = UDim2.new(0, 0, 0, 0)
		s.AutomaticCanvasSize = Enum.AutomaticSize.Y
		s.Size = UDim2.new(1, 0, 1, 0)
		s.Parent = parent
		local list = Instance.new("UIListLayout")
		list.SortOrder = Enum.SortOrder.LayoutOrder
		list.Padding = UDim.new(0, 10)
		list.Parent = s
		C.padding(s, 4, 8, 12, 4)
		return s
	end

	function C.placeholder(parent, title, body)
		local box = C.section(parent, title)
		C.label(box, body or "Coming in a later phase.", {
			color = Theme.textMuted,
			size = 12,
			wrap = true,
			h = 40,
		})
		return box
	end

	return C
end
