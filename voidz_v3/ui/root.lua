--[[ VOIDZ HUB 2.0 - premium dual-pane shell ]]
return function(require)
	local Services = require("core.services")
	local State = require("core.state")
	local Config = require("core.config")
	local Bus = require("core.bus")
	local Util = require("core.util")
	local Theme = require("ui.theme")
	local C = require("ui.components")
	local Notify = require("ui.notify")
	local Select = require("systems.player.select")

	local Root = {
		gui = nil,
		main = nil,
		content = nil,
		playerList = nil,
		navButtons = {},
		_conns = {},
		_targetLab = nil,
	}

	local TABS = {
		{ id = "home", label = "Home", icon = "01" },
		{ id = "combat", label = "Combat", icon = "02" },
		{ id = "blobman", label = "Blobman", icon = "BM" },
		{ id = "player", label = "Player", icon = "03" },
		{ id = "grab", label = "Grab", icon = "04" },
		{ id = "auras", label = "Auras", icon = "05" },
		{ id = "loops", label = "Loops", icon = "06" },
		{ id = "defense", label = "Protect", icon = "07" },
		{ id = "move", label = "Move", icon = "08" },
		{ id = "visuals", label = "Visuals", icon = "09" },
		{ id = "toys", label = "Toys", icon = "10" },
		{ id = "world", label = "World", icon = "11" },
		{ id = "server", label = "Server", icon = "12" },
		{ id = "settings", label = "Settings", icon = "13" },
	}

	local PAGE_MODS = {
		home = "ui.pages.home",
		combat = "ui.pages.combat",
		blobman = "ui.pages.blobman",
		player = "ui.pages.player",
		grab = "ui.pages.grab",
		auras = "ui.pages.auras",
		loops = "ui.pages.loops",
		defense = "ui.pages.defense",
		move = "ui.pages.move",
		visuals = "ui.pages.visuals",
		toys = "ui.pages.toys",
		world = "ui.pages.world",
		server = "ui.pages.server",
		settings = "ui.pages.settings",
	}

	local KEY = "VOIDZHUB"

	local function track(conn)
		Root._conns[#Root._conns + 1] = conn
		return conn
	end

	local function disconnectAll()
		for _, c in ipairs(Root._conns) do
			pcall(function()
				if type(c) == "function" then
					c()
				elseif c and c.Disconnect then
					c:Disconnect()
				end
			end)
		end
		Root._conns = {}
	end

	local function makeDrag(handle, target)
		local dragging, startPos, startInput = false, nil, nil
		track(handle.InputBegan:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
				dragging = true
				startPos = target.Position
				startInput = input.Position
				local ended
				ended = input.Changed:Connect(function()
					if input.UserInputState == Enum.UserInputState.End then
						dragging = false
						if ended then
							ended:Disconnect()
						end
					end
				end)
			end
		end))
		track(Services.UserInputService.InputChanged:Connect(function(input)
			if not dragging then
				return
			end
			if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
				local d = input.Position - startInput
				target.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + d.X, startPos.Y.Scale, startPos.Y.Offset + d.Y)
			end
		end))
	end

	local function clearContent()
		if not Root.content then
			return
		end
		for _, child in ipairs(Root.content:GetChildren()) do
			if not child:IsA("UIListLayout") and not child:IsA("UIPadding") then
				child:Destroy()
			end
		end
	end

	local function paintNav(activeId)
		for id, btn in pairs(Root.navButtons) do
			local on = id == activeId
			btn.BackgroundColor3 = on and Theme.navOn or Theme.navOff
			btn.TextColor3 = on and Theme.text or Theme.textMuted
			local s = btn:FindFirstChildOfClass("UIStroke")
			if s then
				s.Color = on and Theme.accent or Theme.strokeSoft
				s.Transparency = on and 0.15 or 0.5
			end
		end
	end

	function Root.showPage(id)
		id = PAGE_MODS[id] and id or "home"
		State.page = id
		clearContent()
		paintNav(id)
		local ok, mount = pcall(require, PAGE_MODS[id])
		if not ok or type(mount) ~= "function" then
			Notify.error("UI", "Failed page: " .. tostring(id))
			return
		end
		local mok, err = pcall(mount, Root.content)
		if not mok then
			Notify.error("UI", tostring(err))
		end
		if Root._targetLab then
			Root._targetLab.Text = Select.label()
		end
	end

	local function refreshPlayers()
		if not Root.playerList then
			return
		end
		for _, ch in ipairs(Root.playerList:GetChildren()) do
			if ch:IsA("TextButton") then
				ch:Destroy()
			end
		end
		local filter = Root._search and Root._search.Text or ""
		for _, p in ipairs(Select.list(filter)) do
			local selected = State.selected == p
			local looped = Select.isLoopTarget(p)
			local b = Instance.new("TextButton")
			b.AutoButtonColor = false
			b.Font = Theme.font
			b.TextSize = 11
			b.TextXAlignment = Enum.TextXAlignment.Left
			b.TextColor3 = Theme.text
			b.BackgroundColor3 = selected and Theme.navOn or Theme.panelSoft
			b.BorderSizePixel = 0
			b.Size = UDim2.new(1, -4, 0, 30)
			b.Text = "  "
				.. Util.playerLabel(p)
				.. (selected and "  *" or "")
				.. (looped and "  L" or "")
			b.Parent = Root.playerList
			C.corner(b, Theme.radiusSm)
			if looped then
				C.stroke(b, Theme.accent, 1, 0.2)
			end
			b.MouseButton1Click:Connect(function()
				Select.set(p)
				refreshPlayers()
				if Root._targetLab then
					Root._targetLab.Text = Select.label()
				end
				Notify.info("Target", p.Name)
			end)
			b.MouseButton2Click:Connect(function()
				Select.set(p)
				Select.toggleLoopTarget(p)
				refreshPlayers()
				Notify.info("Loop", p.Name .. (Select.isLoopTarget(p) and " ON" or " OFF"))
			end)

		end
	end

	local function buildMain()
		local parent = Util.getUiParent()
		local gui = Instance.new("ScreenGui")
		gui.Name = "VOIDZ_V3_Hub"
		gui.ResetOnSpawn = false
		gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
		gui.DisplayOrder = 90
		gui.IgnoreGuiInset = true
		pcall(function()
			gui.Parent = parent
		end)
		if not gui.Parent then
			gui.Parent = Services.LP:WaitForChild("PlayerGui")
		end
		Root.gui = gui

		local vs = Vector2.new(1280, 720)
		pcall(function()
			if workspace.CurrentCamera then
				vs = workspace.CurrentCamera.ViewportSize
			end
		end)
		local winW = math.clamp(math.floor(vs.X * 0.72), 720, 980)
		local winH = math.clamp(math.floor(vs.Y * 0.7), 460, 620)
		if Services.UserInputService.TouchEnabled and vs.X < 900 then
			winW = math.clamp(math.floor(vs.X * 0.96), 340, 520)
			winH = math.clamp(math.floor(vs.Y * 0.78), 420, 640)
		end

		-- drop shadow
		local shadow = Instance.new("Frame")
		shadow.Name = "Shadow"
		shadow.BackgroundColor3 = Theme.shadow
		shadow.BackgroundTransparency = 0.55
		shadow.BorderSizePixel = 0
		shadow.Size = UDim2.new(0, winW + 16, 0, winH + 16)
		shadow.Position = UDim2.new(0.5, -math.floor(winW / 2) - 4, 0.5, -math.floor(winH / 2) + 6)
		shadow.Parent = gui
		C.corner(shadow, Theme.radiusLg)

		local win = Instance.new("Frame")
		win.Name = "Main"
		win.BackgroundColor3 = Theme.bg
		win.BorderSizePixel = 0
		win.Size = UDim2.new(0, winW, 0, winH)
		win.Position = UDim2.new(0.5, -math.floor(winW / 2), 0.5, -math.floor(winH / 2))
		win.Parent = gui
		Root.main = win
		C.corner(win, Theme.radiusLg)
		C.stroke(win, Theme.strokeGlow, 1.5, 0.35)
		C.gradient(win, Theme.bg, Theme.bgGlass, 120)

		-- top accent line
		local top = Instance.new("Frame")
		top.BorderSizePixel = 0
		top.BackgroundColor3 = Theme.accent
		top.Size = UDim2.new(1, 0, 0, 2)
		top.Parent = win
		C.gradient(top, Theme.accent2, Theme.accent, 0)

		-- title bar
		local titleBar = Instance.new("Frame")
		titleBar.BackgroundColor3 = Theme.bgElevated
		titleBar.BorderSizePixel = 0
		titleBar.Size = UDim2.new(1, 0, 0, Theme.titleH)
		titleBar.Parent = win
		C.corner(titleBar, Theme.radiusLg)

		local titleFill = Instance.new("Frame")
		titleFill.BackgroundColor3 = Theme.bgElevated
		titleFill.BorderSizePixel = 0
		titleFill.Position = UDim2.new(0, 0, 1, -12)
		titleFill.Size = UDim2.new(1, 0, 0, 12)
		titleFill.Parent = titleBar

		C.label(titleBar, "VOIDZ", {
			bold = true,
			size = 16,
			color = Theme.accentGlow,
			h = Theme.titleH,
			sizeUDim = UDim2.new(0, 90, 1, 0),
			pos = UDim2.new(0, 16, 0, 0),
		})
		C.label(titleBar, "HUB  2.0", {
			bold = true,
			size = 16,
			color = Theme.text,
			h = Theme.titleH,
			sizeUDim = UDim2.new(0, 90, 1, 0),
			pos = UDim2.new(0, 78, 0, 0),
		})
		C.label(titleBar, tostring(State.version or "2.0.0"), {
			size = 11,
			color = Theme.textDim,
			h = Theme.titleH,
			sizeUDim = UDim2.new(0, 80, 1, 0),
			pos = UDim2.new(0, 175, 0, 0),
		})

		Root._targetLab = C.label(titleBar, Select.label(), {
			size = 11,
			color = Theme.accent2,
			h = Theme.titleH,
			sizeUDim = UDim2.new(0, 220, 1, 0),
			pos = UDim2.new(0, 260, 0, 0),
			truncate = true,
		})

		local closeBtn = C.button(titleBar, "X", function()
			Root.setVisible(false)
		end, { w = 34, h = 28, pos = UDim2.new(1, -44, 0.5, -14), danger = true })
		closeBtn.TextSize = 14
		makeDrag(titleBar, win)
		makeDrag(titleBar, shadow)

		-- body
		local body = Instance.new("Frame")
		body.BackgroundTransparency = 1
		body.Position = UDim2.new(0, 0, 0, Theme.titleH)
		body.Size = UDim2.new(1, 0, 1, -Theme.titleH)
		body.Parent = win

		-- left nav
		local sidebar = Instance.new("ScrollingFrame")
		sidebar.Name = "Sidebar"
		sidebar.BackgroundColor3 = Theme.sidebar
		sidebar.BorderSizePixel = 0
		sidebar.ScrollBarThickness = 2
		sidebar.ScrollBarImageColor3 = Theme.accent
		sidebar.CanvasSize = UDim2.new(0, 0, 0, 0)
		sidebar.AutomaticCanvasSize = Enum.AutomaticSize.Y
		sidebar.Size = UDim2.new(0, Theme.sidebarW, 1, 0)
		sidebar.Parent = body
		local navList = Instance.new("UIListLayout")
		navList.SortOrder = Enum.SortOrder.LayoutOrder
		navList.Padding = UDim.new(0, 4)
		navList.Parent = sidebar
		C.padding(sidebar, 10, 8, 14, 8)

		Root.navButtons = {}
		for i, tab in ipairs(TABS) do
			local btn = Instance.new("TextButton")
			btn.Name = tab.id
			btn.AutoButtonColor = false
			btn.Font = Theme.fontBold
			btn.TextSize = 12
			btn.TextXAlignment = Enum.TextXAlignment.Left
			btn.Text = "  " .. tab.icon .. "  " .. tab.label
			btn.TextColor3 = Theme.textMuted
			btn.BackgroundColor3 = Theme.navOff
			btn.BorderSizePixel = 0
			btn.Size = UDim2.new(1, 0, 0, 34)
			btn.LayoutOrder = i
			btn.Parent = sidebar
			C.corner(btn, Theme.radiusSm)
			C.stroke(btn, Theme.strokeSoft, 1, 0.5)
			Root.navButtons[tab.id] = btn
			track(btn.MouseButton1Click:Connect(function()
				Root.showPage(tab.id)
				pcall(Config.save)
			end))
		end

		-- center content
		local contentHost = Instance.new("Frame")
		contentHost.Name = "Content"
		contentHost.BackgroundColor3 = Theme.bg
		contentHost.BorderSizePixel = 0
		contentHost.Position = UDim2.new(0, Theme.sidebarW, 0, 0)
		contentHost.Size = UDim2.new(1, -(Theme.sidebarW + Theme.playerW), 1, 0)
		contentHost.Parent = body
		C.padding(contentHost, 12, 10, 10, 12)
		Root.content = contentHost

		-- right player rail
		local rail = Instance.new("Frame")
		rail.Name = "PlayerRail"
		rail.BackgroundColor3 = Theme.rail
		rail.BorderSizePixel = 0
		rail.Position = UDim2.new(1, -Theme.playerW, 0, 0)
		rail.Size = UDim2.new(0, Theme.playerW, 1, 0)
		rail.Parent = body

		C.label(rail, "PLAYERS", {
			bold = true,
			size = 11,
			color = Theme.accentGlow,
			h = 28,
			sizeUDim = UDim2.new(1, -16, 0, 28),
			pos = UDim2.new(0, 10, 0, 6),
		})

		Root._search = C.input(rail, "Search...", {
			sizeUDim = UDim2.new(1, -16, 0, 30),
		})
		Root._search.Position = UDim2.new(0, 8, 0, 34)

		local list = Instance.new("ScrollingFrame")
		list.BackgroundTransparency = 1
		list.BorderSizePixel = 0
		list.ScrollBarThickness = 3
		list.ScrollBarImageColor3 = Theme.accent
		list.Position = UDim2.new(0, 6, 0, 72)
		list.Size = UDim2.new(1, -10, 1, -110)
		list.CanvasSize = UDim2.new(0, 0, 0, 0)
		list.AutomaticCanvasSize = Enum.AutomaticSize.Y
		list.Parent = rail
		Root.playerList = list
		local ll = Instance.new("UIListLayout")
		ll.SortOrder = Enum.SortOrder.LayoutOrder
		ll.Padding = UDim.new(0, 4)
		ll.Parent = list

		C.button(rail, "Clear loops", function()
			Select.clearLoops()
			refreshPlayers()
			Notify.info("Players", "Loop targets cleared")
		end, { w = Theme.playerW - 16, h = 28, pos = UDim2.new(0, 8, 1, -36) })

		track(Root._search:GetPropertyChangedSignal("Text"):Connect(refreshPlayers))
		track(Services.Players.PlayerAdded:Connect(function()
			task.defer(refreshPlayers)
		end))
		track(Services.Players.PlayerRemoving:Connect(function()
			task.defer(refreshPlayers)
		end))
		refreshPlayers()

		Root.showPage(State.page or "home")
		State.hubOpen = true

		-- keep shadow with window when dragging title only moves both if we drag shadow too - sync on render
		track(Services.RunService.RenderStepped:Connect(function()
			if win and shadow and win.Parent then
				shadow.Position = UDim2.new(
					win.Position.X.Scale,
					win.Position.X.Offset - 4,
					win.Position.Y.Scale,
					win.Position.Y.Offset + 6
				)
			end
		end))

		return gui
	end

	local function buildKeyGate(onUnlock)
		local parent = Util.getUiParent()
		local gui = Instance.new("ScreenGui")
		gui.Name = "VOIDZ_V3_Key"
		gui.ResetOnSpawn = false
		gui.DisplayOrder = 95
		gui.IgnoreGuiInset = true
		pcall(function()
			gui.Parent = parent
		end)
		if not gui.Parent then
			gui.Parent = Services.LP:WaitForChild("PlayerGui")
		end

		local dim = Instance.new("Frame")
		dim.BackgroundColor3 = Color3.new(0, 0, 0)
		dim.BackgroundTransparency = 0.4
		dim.BorderSizePixel = 0
		dim.Size = UDim2.new(1, 0, 1, 0)
		dim.Parent = gui

		local card = Instance.new("Frame")
		card.BackgroundColor3 = Theme.panel
		card.BorderSizePixel = 0
		card.Size = UDim2.new(0, 360, 0, 220)
		card.Position = UDim2.new(0.5, -180, 0.5, -110)
		card.Parent = gui
		C.corner(card, Theme.radiusLg)
		C.stroke(card, Theme.accent, 1.5, 0.25)
		C.padding(card, 22, 22, 22, 22)
		local list = Instance.new("UIListLayout")
		list.SortOrder = Enum.SortOrder.LayoutOrder
		list.Padding = UDim.new(0, 10)
		list.Parent = card

		C.label(card, "VOIDZ HUB 2.0", { bold = true, size = 20, color = Theme.accentGlow, h = 26 })
		C.label(card, "Enter access key", { size = 12, color = Theme.textMuted, h = 18 })
		local box = C.input(card, "Key...")
		local status = C.label(card, "", { size = 11, color = Theme.danger, h = 16 })
		local function tryUnlock()
			local typed = string.upper(string.gsub(box.Text or "", "%s+", ""))
			if typed == KEY then
				State.unlocked = true
				gui:Destroy()
				onUnlock()
			else
				status.Text = "Invalid key"
				box.Text = ""
			end
		end
		C.button(card, "Unlock", tryUnlock, { w = 130, h = 36, accent = true })
		track(box.FocusLost:Connect(function(enter)
			if enter then
				tryUnlock()
			end
		end))
	end

	function Root.setVisible(vis)
		if Root.main then
			Root.main.Visible = vis == true
		end
		local sh = Root.gui and Root.gui:FindFirstChild("Shadow")
		if sh then
			sh.Visible = vis == true
		end
		State.hubOpen = vis == true
	end

	function Root.toggle()
		if not State.unlocked or not Root.main then
			return
		end
		Root.setVisible(not Root.main.Visible)
	end

	function Root.refreshPlayers()
		refreshPlayers()
	end

	function Root.mount()
		if Root.gui then
			return Root
		end
		local function openHub()
			buildMain()
			Notify.success("VOIDZ 2.0", "Loaded - pick a player on the right")
			Bus.emit("hub:ready")
		end
		if State.unlocked then
			openHub()
		else
			buildKeyGate(openHub)
		end
		track(Services.UserInputService.InputBegan:Connect(function(input, gp)
			if gp then
				return
			end
			if input.KeyCode == (State.keybinds.toggleHub or Enum.KeyCode.RightShift) then
				Root.toggle()
			end
		end))
		track(Bus.on("hub:unload", function()
			local g = (getgenv and getgenv()) or _G
			if type(g.VOIDZ_V3_UNLOAD) == "function" then
				g.VOIDZ_V3_UNLOAD()
			else
				Root.destroy()
			end
		end))
		track(Bus.on("player.selected", function()
			if Root._targetLab then
				Root._targetLab.Text = Select.label()
			end
			refreshPlayers()
		end))
		return Root
	end

	function Root.destroy()
		disconnectAll()
		if Root.gui then
			pcall(function()
				Root.gui:Destroy()
			end)
		end
		local parent = Util.getUiParent()
		for _, name in ipairs({ "VOIDZ_V3_Hub", "VOIDZ_V3_Key" }) do
			local g = parent:FindFirstChild(name)
			if g then
				pcall(function()
					g:Destroy()
				end)
			end
		end
		Notify.destroy()
		Root.gui, Root.main, Root.content, Root.playerList = nil, nil, nil, nil
		Root.navButtons = {}
		State.hubOpen = false
	end

	return Root
end
