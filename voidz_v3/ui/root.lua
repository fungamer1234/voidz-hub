--[[ VOIDZ HUB V3 — Premium shell: key gate + main window + tabs ]]
return function(require)
	local Services = require("core.services")
	local State = require("core.state")
	local Config = require("core.config")
	local Bus = require("core.bus")
	local Util = require("core.util")
	local Theme = require("ui.theme")
	local C = require("ui.components")
	local Notify = require("ui.notify")

	local Root = {
		gui = nil,
		main = nil,
		content = nil,
		navButtons = {},
		_conns = {},
	}

	local TABS = {
		{ id = "home", label = "Home" },
		{ id = "combat", label = "Combat" },
		{ id = "grab", label = "Grab" },
		{ id = "defense", label = "Defense" },
		{ id = "blobman", label = "Blobman" },
		{ id = "world", label = "World" },
		{ id = "toys", label = "Toys" },
		{ id = "player", label = "Player" },
		{ id = "move", label = "Move" },
		{ id = "settings", label = "Settings" },
	}

	local PAGE_MODS = {
		home = "ui.pages.home",
		combat = "ui.pages.combat",
		grab = "ui.pages.grab",
		defense = "ui.pages.defense",
		blobman = "ui.pages.blobman",
		world = "ui.pages.world",
		toys = "ui.pages.toys",
		player = "ui.pages.player",
		move = "ui.pages.move",
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
		local dragging = false
		local startPos, startInput
		track(handle.InputBegan:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseButton1
				or input.UserInputType == Enum.UserInputType.Touch
			then
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
			if input.UserInputType == Enum.UserInputType.MouseMovement
				or input.UserInputType == Enum.UserInputType.Touch
			then
				local delta = input.Position - startInput
				target.Position = UDim2.new(
					startPos.X.Scale,
					startPos.X.Offset + delta.X,
					startPos.Y.Scale,
					startPos.Y.Offset + delta.Y
				)
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
			btn.BackgroundColor3 = on and Theme.accentSoft or Theme.sidebar
			btn.TextColor3 = on and Theme.text or Theme.textMuted
		end
	end

	function Root.showPage(id)
		id = id or "home"
		if not PAGE_MODS[id] then
			id = "home"
		end
		State.page = id
		clearContent()
		paintNav(id)
		local ok, mount = pcall(require, PAGE_MODS[id])
		if not ok or type(mount) ~= "function" then
			Notify.error("UI", "Failed to load page: " .. tostring(id))
			return
		end
		local mok, err = pcall(mount, Root.content)
		if not mok then
			Notify.error("UI", tostring(err))
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

		local win = Instance.new("Frame")
		win.Name = "Main"
		win.BackgroundColor3 = Theme.bg
		win.BorderSizePixel = 0
		win.Size = UDim2.new(0, 720, 0, 460)
		win.Position = UDim2.new(0.5, -360, 0.5, -230)
		win.Parent = gui
		Root.main = win
		C.corner(win, UDim.new(0, 14))
		C.stroke(win, Theme.accent, 1.5)
		local stroke = win:FindFirstChildOfClass("UIStroke")
		if stroke then
			stroke.Transparency = 0.35
		end

		-- soft gradient accent bar
		local topGlow = Instance.new("Frame")
		topGlow.BorderSizePixel = 0
		topGlow.BackgroundColor3 = Theme.accent
		topGlow.BackgroundTransparency = 0.85
		topGlow.Size = UDim2.new(1, 0, 0, 3)
		topGlow.Parent = win

		local titleBar = Instance.new("Frame")
		titleBar.Name = "TitleBar"
		titleBar.BackgroundColor3 = Theme.bgElevated
		titleBar.BorderSizePixel = 0
		titleBar.Size = UDim2.new(1, 0, 0, Theme.titleH)
		titleBar.Parent = win
		C.corner(titleBar, UDim.new(0, 14))

		-- square bottom corners of title
		local titleMask = Instance.new("Frame")
		titleMask.BackgroundColor3 = Theme.bgElevated
		titleMask.BorderSizePixel = 0
		titleMask.Position = UDim2.new(0, 0, 1, -10)
		titleMask.Size = UDim2.new(1, 0, 0, 10)
		titleMask.Parent = titleBar

		C.label(titleBar, "VOIDZ HUB", {
			bold = true,
			size = 14,
			color = Theme.accentGlow,
			h = Theme.titleH,
			sizeUDim = UDim2.new(0, 160, 1, 0),
			pos = UDim2.new(0, 16, 0, 0),
		})
		C.label(titleBar, State.version, {
			size = 11,
			color = Theme.textDim,
			h = Theme.titleH,
			sizeUDim = UDim2.new(0, 120, 1, 0),
			pos = UDim2.new(0, 140, 0, 0),
		})

		local closeBtn = C.button(titleBar, "X", function()
			Root.setVisible(false)
		end, {

			w = 32,
			h = 28,
			pos = UDim2.new(1, -40, 0.5, -14),
			bg = Theme.button,
		})
		closeBtn.TextSize = 18

		makeDrag(titleBar, win)

		local body = Instance.new("Frame")
		body.Name = "Body"
		body.BackgroundTransparency = 1
		body.Position = UDim2.new(0, 0, 0, Theme.titleH)
		body.Size = UDim2.new(1, 0, 1, -Theme.titleH)
		body.Parent = win

		local sidebar = Instance.new("Frame")
		sidebar.Name = "Sidebar"
		sidebar.BackgroundColor3 = Theme.sidebar
		sidebar.BorderSizePixel = 0
		sidebar.Size = UDim2.new(0, Theme.sidebarW, 1, 0)
		sidebar.Parent = body

		local navList = Instance.new("UIListLayout")
		navList.SortOrder = Enum.SortOrder.LayoutOrder
		navList.Padding = UDim.new(0, 4)
		navList.Parent = sidebar
		C.padding(sidebar, 10, 8, 10, 8)

		Root.navButtons = {}
		for i, tab in ipairs(TABS) do
			local btn = Instance.new("TextButton")
			btn.Name = tab.id
			btn.AutoButtonColor = false
			btn.Font = Theme.fontBold
			btn.TextSize = 12
			btn.TextXAlignment = Enum.TextXAlignment.Left
			btn.Text = "  " .. tab.label
			btn.TextColor3 = Theme.textMuted
			btn.BackgroundColor3 = Theme.sidebar
			btn.BorderSizePixel = 0
			btn.Size = UDim2.new(1, 0, 0, 34)
			btn.LayoutOrder = i
			btn.Parent = sidebar
			C.corner(btn, Theme.radiusSm)
			Root.navButtons[tab.id] = btn
			track(btn.MouseButton1Click:Connect(function()
				Root.showPage(tab.id)
				pcall(Config.save)
			end))
		end

		local contentHost = Instance.new("Frame")
		contentHost.Name = "Content"
		contentHost.BackgroundColor3 = Theme.bg
		contentHost.BorderSizePixel = 0
		contentHost.Position = UDim2.new(0, Theme.sidebarW, 0, 0)
		contentHost.Size = UDim2.new(1, -Theme.sidebarW, 1, 0)
		contentHost.Parent = body
		C.padding(contentHost, 12, 12, 12, 12)
		Root.content = contentHost

		local footer = Instance.new("TextLabel")
		footer.BackgroundTransparency = 1
		footer.Font = Theme.font
		footer.TextSize = 10
		footer.TextColor3 = Theme.textDim
		footer.TextXAlignment = Enum.TextXAlignment.Right
		footer.Text = "RightShift = toggle  |  key VOIDZHUB"

		footer.Size = UDim2.new(1, -16, 0, 16)
		footer.Position = UDim2.new(0, 0, 1, -18)
		footer.Parent = win

		Root.showPage(State.page or "home")
		State.hubOpen = true
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
		dim.BackgroundTransparency = 0.45
		dim.BorderSizePixel = 0
		dim.Size = UDim2.new(1, 0, 1, 0)
		dim.Parent = gui

		local card = Instance.new("Frame")
		card.BackgroundColor3 = Theme.panel
		card.BorderSizePixel = 0
		card.Size = UDim2.new(0, 340, 0, 200)
		card.Position = UDim2.new(0.5, -170, 0.5, -100)
		card.Parent = gui
		C.corner(card, UDim.new(0, 14))
		C.stroke(card, Theme.accent, 1.5)
		C.padding(card, 20, 20, 20, 20)

		local list = Instance.new("UIListLayout")
		list.SortOrder = Enum.SortOrder.LayoutOrder
		list.Padding = UDim.new(0, 10)
		list.Parent = card

		C.label(card, "VOIDZ HUB V3", { bold = true, size = 18, color = Theme.accentGlow, h = 24 })
		C.label(card, "Enter key to unlock", { size = 12, color = Theme.textMuted, h = 18 })

		local box = Instance.new("TextBox")
		box.BackgroundColor3 = Theme.bg
		box.BorderSizePixel = 0
		box.Font = Theme.font
		box.TextSize = 14
		box.TextColor3 = Theme.text
		box.PlaceholderText = "Key..."

		box.PlaceholderColor3 = Theme.textDim
		box.Text = ""
		box.ClearTextOnFocus = false
		box.Size = UDim2.new(1, 0, 0, 36)
		box.Parent = card
		C.corner(box, Theme.radiusSm)
		C.stroke(box, Theme.stroke, 1)

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

		C.button(card, "Unlock", tryUnlock, { w = 120, h = 34, accent = true })
		track(box.FocusLost:Connect(function(enter)
			if enter then
				tryUnlock()
			end
		end))
		return gui
	end

	function Root.setVisible(vis)
		if Root.main then
			Root.main.Visible = vis == true
		end
		State.hubOpen = vis == true
	end

	function Root.toggle()
		if not State.unlocked or not Root.main then
			return
		end
		Root.setVisible(not Root.main.Visible)
	end

	function Root.mount()
		if Root.gui then
			return Root
		end

		local function openHub()
			buildMain()
			Notify.success("VOIDZ", "Hub loaded - " .. State.version)

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
			local pg = Services.LP:FindFirstChild("PlayerGui")
			if pg then
				local g2 = pg:FindFirstChild(name)
				if g2 then
					pcall(function()
						g2:Destroy()
					end)
				end
			end
		end
		Notify.destroy()
		Root.gui = nil
		Root.main = nil
		Root.content = nil
		Root.navButtons = {}
		State.hubOpen = false
	end


	return Root
end
