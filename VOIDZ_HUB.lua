local _Vk=37
local function _Vzd(t)
	local o={}
	for i=1,#t do
		local n=(t[i]-_Vk)%256
		if n<0 then n=n+256 end
		o[i]=string.char(n)
	end
	return table.concat(o)
end
local function _Vj()
	local a=0
	for i=1,3 do a=a+((i*17)%9) end
	return a>0
end

local safeGetGen = function() return getgenv and getgenv() or _G end
local queue_teleport = (queue_on_teleport or (syn and syn.queue_on_teleport) or (fluxus and fluxus.queue_on_teleport) or (macsploit and macsploit.queue_on_teleport) or function() end)
local protect_gui_fn = (protect_gui or (syn and syn.protect_gui) or (macsploit and macsploit.protect_gui) or function() end)
local get_hui = (gethui or function() end)

if getgenv and type(getgenv) == "function" and getgenv().VOIDZ_LOADED then
	pcall(function() if getgenv().VOIDZ_UNLOAD then getgenv().VOIDZ_UNLOAD() end end)
end
if getgenv and type(getgenv) == "function" then getgenv().VOIDZ_LOADED = true end

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local ContextActionService = game:GetService("ContextActionService")
local TweenService = game:GetService("TweenService")
local Lighting = game:GetService("Lighting")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local StarterGui = game:GetService(_Vzd({120,153,134,151,153,138,151,108,154,142}))
local CoreGui = game:GetService("CoreGui")
local Debris = game:GetService("Debris")
local TeleportService = game:GetService("TeleportService")
local VirtualUser = game:GetService("VirtualUser")
local TextChatService = game:GetService("TextChatService")

local LP = Players.LocalPlayer
while not LP do task.wait() LP = Players.LocalPlayer end
local Mouse = LP:GetMouse()

local ACCESS_KEY = _Vzd({123,116,110,105,127,109,122,103})
local HUB_NAME = _Vzd({123,116,110,105,127,69,109,122,103})
local BUILD = _Vzd({87,85,87,91,82,85,92,82,87,93,82,86,83,87,83,86,93})
local GuiService = game:GetService("GuiService")

local THEMES = {
	Purple = {
		bg = Color3.fromRGB(7, 5, 12), bg2 = Color3.fromRGB(12, 8, 20),
		card = Color3.fromRGB(18, 12, 30), card2 = Color3.fromRGB(28, 16, 44),
		stroke = Color3.fromRGB(120, 55, 210), strokeSoft = Color3.fromRGB(70, 35, 120),
		accent = Color3.fromRGB(155, 70, 255), accent2 = Color3.fromRGB(195, 120, 255),
		accentDim = Color3.fromRGB(90, 40, 165), text = Color3.fromRGB(245, 240, 255),
		muted = Color3.fromRGB(145, 125, 175), danger = Color3.fromRGB(48, 18, 36),
		dangerText = Color3.fromRGB(255, 140, 170), dangerStroke = Color3.fromRGB(200, 70, 110),
		success = Color3.fromRGB(110, 255, 175), warn = Color3.fromRGB(255, 200, 90),
		black = Color3.fromRGB(0, 0, 0), tip = Color3.fromRGB(22, 14, 36),
	},
	Red = {
		bg = Color3.fromRGB(8, 2, 4), bg2 = Color3.fromRGB(14, 4, 8),
		card = Color3.fromRGB(22, 8, 12), card2 = Color3.fromRGB(36, 12, 18),
		stroke = Color3.fromRGB(180, 40, 55), strokeSoft = Color3.fromRGB(90, 25, 35),
		accent = Color3.fromRGB(200, 40, 60), accent2 = Color3.fromRGB(255, 90, 100),
		accentDim = Color3.fromRGB(100, 20, 30), text = Color3.fromRGB(255, 235, 235),
		muted = Color3.fromRGB(160, 110, 115), danger = Color3.fromRGB(50, 10, 14),
		dangerText = Color3.fromRGB(255, 100, 110), dangerStroke = Color3.fromRGB(200, 50, 60),
		success = Color3.fromRGB(200, 100, 110), warn = Color3.fromRGB(220, 140, 80),
		black = Color3.fromRGB(0, 0, 0), tip = Color3.fromRGB(18, 6, 8),
	},
	White = {
		bg = Color3.fromRGB(235, 235, 240), bg2 = Color3.fromRGB(250, 250, 252),
		card = Color3.fromRGB(255, 255, 255), card2 = Color3.fromRGB(240, 240, 245),
		stroke = Color3.fromRGB(40, 40, 50), strokeSoft = Color3.fromRGB(160, 160, 175),
		accent = Color3.fromRGB(30, 30, 40), accent2 = Color3.fromRGB(60, 60, 80),
		accentDim = Color3.fromRGB(200, 200, 210), text = Color3.fromRGB(15, 15, 20),
		muted = Color3.fromRGB(90, 90, 100), danger = Color3.fromRGB(255, 220, 220),
		dangerText = Color3.fromRGB(160, 20, 30), dangerStroke = Color3.fromRGB(180, 40, 50),
		success = Color3.fromRGB(20, 120, 60), warn = Color3.fromRGB(160, 100, 20),
		black = Color3.fromRGB(0, 0, 0), tip = Color3.fromRGB(245, 245, 250),
	},
	Black = {
		bg = Color3.fromRGB(0, 0, 0), bg2 = Color3.fromRGB(10, 10, 10),
		card = Color3.fromRGB(18, 18, 18), card2 = Color3.fromRGB(28, 28, 28),
		stroke = Color3.fromRGB(200, 200, 200), strokeSoft = Color3.fromRGB(80, 80, 80),
		accent = Color3.fromRGB(240, 240, 240), accent2 = Color3.fromRGB(255, 255, 255),
		accentDim = Color3.fromRGB(60, 60, 60), text = Color3.fromRGB(245, 245, 245),
		muted = Color3.fromRGB(140, 140, 140), danger = Color3.fromRGB(30, 10, 10),
		dangerText = Color3.fromRGB(255, 80, 80), dangerStroke = Color3.fromRGB(180, 40, 40),
		success = Color3.fromRGB(180, 180, 180), warn = Color3.fromRGB(200, 180, 100),
		black = Color3.fromRGB(0, 0, 0), tip = Color3.fromRGB(12, 12, 12),
	},
	Green = {
		bg = Color3.fromRGB(2, 8, 4), bg2 = Color3.fromRGB(4, 14, 8),
		card = Color3.fromRGB(8, 22, 14), card2 = Color3.fromRGB(12, 36, 22),
		stroke = Color3.fromRGB(40, 180, 90), strokeSoft = Color3.fromRGB(20, 80, 45),
		accent = Color3.fromRGB(50, 220, 110), accent2 = Color3.fromRGB(120, 255, 160),
		accentDim = Color3.fromRGB(20, 90, 50), text = Color3.fromRGB(230, 255, 235),
		muted = Color3.fromRGB(100, 150, 120), danger = Color3.fromRGB(30, 40, 20),
		dangerText = Color3.fromRGB(255, 120, 100), dangerStroke = Color3.fromRGB(160, 60, 40),
		success = Color3.fromRGB(80, 255, 140), warn = Color3.fromRGB(200, 220, 80),
		black = Color3.fromRGB(0, 0, 0), tip = Color3.fromRGB(6, 16, 10),
	},
	Blue = {
		bg = Color3.fromRGB(2, 4, 12), bg2 = Color3.fromRGB(4, 8, 20),
		card = Color3.fromRGB(10, 14, 32), card2 = Color3.fromRGB(16, 24, 48),
		stroke = Color3.fromRGB(50, 120, 220), strokeSoft = Color3.fromRGB(30, 60, 120),
		accent = Color3.fromRGB(60, 140, 255), accent2 = Color3.fromRGB(120, 190, 255),
		accentDim = Color3.fromRGB(30, 70, 140), text = Color3.fromRGB(230, 240, 255),
		muted = Color3.fromRGB(110, 130, 170), danger = Color3.fromRGB(20, 20, 40),
		dangerText = Color3.fromRGB(255, 120, 140), dangerStroke = Color3.fromRGB(160, 50, 80),
		success = Color3.fromRGB(80, 200, 255), warn = Color3.fromRGB(100, 180, 255),
		black = Color3.fromRGB(0, 0, 0), tip = Color3.fromRGB(8, 12, 24),
	},
}

local C = {}
function applyThemeColors(name)
	local t = THEMES[name] or THEMES.Purple
	for k, v in pairs(t) do C[k] = v end
end
applyThemeColors("Purple")

local S = {
	toggles = {},
	conns = {},
	loops = {},
	loopGen = {},
	auraCfg = {},
	whitelist = {},
	selected = nil,
	loopTarget = nil,
	loopTargets = {},
	loopNames = {},
	_toggleRenderers = {},
	flingPower = 8000,
	auraRange = 50,
	walkSpeed = 50,
	speedMult = 1.5,
	flySpeed = 80,
	jumpPower = 80,
	kickType = "Velocity",
	gui = nil,
	root = nil,
	tabs = {},
	panels = {},
	notify = nil,
	status = nil,
	tipFrame = nil,
	tipLabel = nil,
	playerDropdowns = {},
	unownedList = nil,
	ownedList = nil,
	settingsOpen = {},
	grabFling = false,
	grabFlingPower = 80,
	grabSpin = false,
	grabSpinSpeed = 80,
	grabGravity = false,
	grabGravityForce = 5000,
	grabZeroG = false,
	grabZeroGForce = 50000,
	grabFreeze = false,
	grabFollow = false,
	grabFollowSpeed = 50,
	superStrength = false,
	superStrengthPower = 4000,
	masslessGrab = false,
	noclipGrab = false,
	killGrab = false,
	poisonGrab = false,
	burnGrab = false,
	ragdollGrab = false,
	revengeGrab = false,
	revengeForce = 12000,
	anchorGrab = false,
	radioactiveGrab = false,
	strengthMult = 1,
	counterMode = "Repulsion",
	autoCounter = false,
	tkShape = "Tornado",
	lagIntensity = 150,
	silentRange = 200,
	theme = "Purple",
	device = "PC",
	escapeSpace = false,
}

function auraDefaults()
	return { target = "Players", range = 50, power = 2500 }
end
function getAura(id)
	if not S.auraCfg[id] then S.auraCfg[id] = auraDefaults() end
	local cfg = S.auraCfg[id]
	cfg._id = id
	if not cfg._customRange then
		cfg.range = tonumber(S.auraRange) or cfg.range or 50
	end
	if not cfg._customPower then
		cfg.power = tonumber(S.flingPower) or cfg.power or 2500
	end
	return cfg
end

function bind(id, conn)
	if S.conns[id] then pcall(function() S.conns[id]:Disconnect() end) end
	S.conns[id] = conn
	return conn
end
function stopLoop(id)
	S.loops[id] = false
	S.loopGen[id] = (S.loopGen[id] or 0) + 1
end
function startLoop(id, waitTime, fn)
	local generation = (S.loopGen[id] or 0) + 1
	S.loopGen[id] = generation
	S.loops[id] = true
	local waitSec = math.max(tonumber(waitTime) or 0.1, 0.05)
	task.spawn(function()
		while S.loops[id] and S.loopGen[id] == generation do
			local t0 = os.clock()
			pcall(fn)
			local spent = os.clock() - t0
			task.wait(math.max(waitSec - spent, 0.03))
		end
	end)
end
function tween(o, props, t, style)
	local tw = TweenService:Create(o, TweenInfo.new(t or 0.2, style or Enum.EasingStyle.Quint, Enum.EasingDirection.Out), props)
	tw:Play()
	return tw
end
function corner(i, r)
	local c = Instance.new("UICorner"); c.CornerRadius = UDim.new(0, r or 8); c.Parent = i; return c
end
function stroke(i, col, th, transparency)
	local s = Instance.new("UIStroke")
	s.Color = col or C.strokeSoft or C.stroke
	s.Thickness = th or 1.15
	s.Transparency = transparency ~= nil and transparency or 0.35
	s.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
	s.Parent = i
	s:SetAttribute("VOIDZ_Stroke", true)
	return s
end
function pad(i, a,b,c,d)
	local p = Instance.new("UIPadding")
	p.PaddingTop=UDim.new(0,a or 6); p.PaddingRight=UDim.new(0,b or 6)
	p.PaddingBottom=UDim.new(0,c or 6); p.PaddingLeft=UDim.new(0,d or 6); p.Parent=i; return p
end
function grad(i, a, b, rot)
	local g = Instance.new("UIGradient"); g.Color = ColorSequence.new(a or C.accentDim, b or C.bg); g.Rotation = rot or 90; g.Parent = i; return g
end

do local _z700=(2*6); if _z700<0 and _Vj() then _z700=_z700+1 end end

function refreshThemeVisuals()
	if not S.gui then return end
	local oldName = S._prevTheme or "Purple"
	local newName = S.theme or "Purple"
	local oldT = THEMES[oldName] or THEMES.Purple
	local newT = THEMES[newName] or THEMES.Purple
	local rgbPairs = {}
	for k, oldC in pairs(oldT) do
		if typeof(oldC) == "Color3" and typeof(newT[k]) == _Vzd({104,148,145,148,151,88}) then
			rgbPairs[#rgbPairs + 1] = { oR = oldC.R, oG = oldC.G, oB = oldC.B, nc = newT[k] }
		end
	end
	local function matchColor(c)
		for _, p in ipairs(rgbPairs) do
			if c.R == p.oR and c.G == p.oG and c.B == p.oB then return p.nc end
		end
		return nil
	end
	for _, d in ipairs(S.gui:GetDescendants()) do
		if d:IsA("GuiObject") then
			local m = matchColor(d.BackgroundColor3)
			if m then d.BackgroundColor3 = m end
		end
		if d:IsA("TextLabel") or d:IsA("TextButton") or d:IsA("TextBox") then
			local m = matchColor(d.TextColor3)
			if m then d.TextColor3 = m end
		end
		if d:IsA("UIStroke") and d:GetAttribute("VOIDZ_Stroke") then
			local m = matchColor(d.Color)
			if m then d.Color = m end
		end
		if d:IsA("ScrollingFrame") then
			local m = matchColor(d.ScrollBarImageColor3)
			if m then d.ScrollBarImageColor3 = m end
		end
		if d:IsA("UIGradient") and d.Color then
			local kps = d.Color.Keypoints
			local newKps = {}
			local changed = false
			for i = 1, #kps do
				local kp = kps[i]
				local m = matchColor(kp.Value)
				if m then
					newKps[i] = ColorSequenceKeypoint.new(kp.Time, m)
					changed = true
				else
					newKps[i] = kp
				end
			end
			if changed then d.Color = ColorSequence.new(newKps) end
		end
	end
end

function applyTheme(name)
	S._prevTheme = S.theme or "Purple"
	applyThemeColors(name)
	S.theme = name
	refreshThemeVisuals()
	pcall(function() notify(HUB_NAME, _Vzd({121,141,138,146,138,69,220,69}) .. name, 1.5) end)
end

function openOptionPanel(opts)
	opts = opts or {}
	if not S.gui then return end
	local old = S.gui:FindFirstChild("VOIDZ_OptionPanel")
	if old then old:Destroy() end
	local dim = Instance.new("TextButton")
	dim.Name = "VOIDZ_OptionPanel"
	dim.Size = UDim2.fromScale(1, 1)
	dim.BackgroundColor3 = C.black
	dim.BackgroundTransparency = 0.45
	dim.Text = ""
	dim.ZIndex = 200
	dim.Parent = S.gui
	local card = Instance.new("Frame")
	card.AnchorPoint = Vector2.new(0.5, 0.5)
	card.Position = UDim2.fromScale(0.5, 0.5)
	card.Size = UDim2.fromOffset(320, 220)
	card.BackgroundColor3 = C.bg2
	card.BorderSizePixel = 0
	card.ZIndex = 201
	card.Parent = dim
	corner(card, 12)
	stroke(card, C.accent, 2)
	local ttl = Instance.new("TextLabel")
	ttl.BackgroundTransparency = 1
	ttl.Size = UDim2.new(1, -50, 0, 28)
	ttl.Position = UDim2.fromOffset(14, 10)
	ttl.Font = Enum.Font.GothamBold
	ttl.TextSize = 15
	ttl.TextColor3 = C.accent2
	ttl.TextXAlignment = Enum.TextXAlignment.Left
	ttl.Text = opts.title or "Option"
	ttl.ZIndex = 202
	ttl.Parent = card
	local x = Instance.new(_Vzd({121,138,157,153,103,154,153,153,148,147}))
	x.Size = UDim2.fromOffset(28, 24)
	x.Position = UDim2.new(1, -36, 0, 10)
	x.BackgroundColor3 = C.card
	x.Text = "×"
	x.TextColor3 = C.dangerText
	x.Font = Enum.Font.GothamBold
	x.TextSize = 14
	x.ZIndex = 203
	x.Parent = card
	corner(x, 6)
	local body = Instance.new(_Vzd({121,138,157,153,113,134,135,138,145}))
	body.BackgroundTransparency = 1
	body.Size = UDim2.new(1, -28, 0, 90)
	body.Position = UDim2.fromOffset(14, 44)
	body.Font = Enum.Font.Gotham
	body.TextSize = 12
	body.TextColor3 = C.text
	body.TextXAlignment = Enum.TextXAlignment.Left
	body.TextYAlignment = Enum.TextYAlignment.Top
	body.TextWrapped = true
	body.Text = opts.tip or opts.desc or _Vzd({115,148,69,138,157,153,151,134,69,137,138,152,136,151,142,149,153,142,148,147,83})
	body.ZIndex = 202
	body.Parent = card
	local y = 140
	if opts.settings then
		for _, st in ipairs(opts.settings) do
			local lab = Instance.new("TextLabel")
			lab.BackgroundTransparency = 1
			lab.Size = UDim2.new(1, -28, 0, 14)
			lab.Position = UDim2.fromOffset(14, y)
			lab.Font = Enum.Font.GothamMedium
			lab.TextSize = 11
			lab.TextColor3 = C.muted
			lab.TextXAlignment = Enum.TextXAlignment.Left
			lab.Text = (st.title or st.key or "?") .. ": " .. tostring(S[st.key] or st.default or "")
			lab.ZIndex = 202
			lab.Parent = card
			y += 18
			if st.key and st.min and st.max then
				local track = Instance.new(_Vzd({121,138,157,153,103,154,153,153,148,147}))
				track.Size = UDim2.new(1, -28, 0, 10)
				track.Position = UDim2.fromOffset(14, y)
				track.BackgroundColor3 = C.card
				track.Text = ""
				track.ZIndex = 202
				track.Parent = card
				corner(track, 4)
				stroke(track, C.strokeSoft, 1)
				track.MouseButton1Click:Connect(function()
					local rel = math.clamp(UserInputService:GetMouseLocation().X - track.AbsolutePosition.X, 0, track.AbsoluteSize.X)
					local t = rel / math.max(track.AbsoluteSize.X, 1)
					local v = st.min + (st.max - st.min) * t
					if st.step then v = math.floor(v / st.step + 0.5) * st.step end
					S[st.key] = v
					lab.Text = (st.title or st.key) .. ": " .. tostring(v)
					if st.callback then pcall(st.callback, v) end
				end)
				y += 20
			end
		end
		card.Size = UDim2.fromOffset(320, math.max(220, y + 20))
	end
	local close = function() dim:Destroy() end
	x.MouseButton1Click:Connect(close)
	dim.MouseButton1Click:Connect(close)
end

function addGearButton(parent, opts)
	local g = Instance.new("TextButton")
	g.Size = UDim2.fromOffset(20, 20)
	g.Position = UDim2.new(1, -72, 0.5, -10)
	g.BackgroundColor3 = C.card2
	g.Text = "⚙"
	g.TextSize = 11
	g.TextColor3 = C.accent2
	g.Font = Enum.Font.GothamBold
	g.ZIndex = 10
	g.AutoButtonColor = false
	g.Parent = parent
	corner(g, 5)
	stroke(g, C.stroke, 1.2)
	g.MouseButton1Click:Connect(function()
		openOptionPanel(opts)
	end)
	return g
end

do local _z464=(8*6); if _z464<0 and _Vj() then _z464=_z464+1 end end

function notify(title, text, dur)
	dur = dur or 2
	pcall(function()
		StarterGui:SetCore("SendNotification", { Title = title or HUB_NAME, Text = tostring(text or ""), Duration = dur })
	end)
	if S.notify then
		S.notify.Title.Text = tostring(title or HUB_NAME)
		S.notify.Body.Text = tostring(text or "")
		S.notify.Frame.Visible = true
		S.notify.Frame.BackgroundTransparency = 0.05
		task.delay(dur, function()
			if S.notify then
				tween(S.notify.Frame, { BackgroundTransparency = 1 }, 0.25)
				task.delay(0.3, function() if S.notify then S.notify.Frame.Visible = false end end)
			end
		end)
	end
end

function voidzChat(msg)
	msg = tostring(msg or "")
	if msg == "" then return end
	pcall(function()
		local ch = TextChatService:FindFirstChild("TextChannels")
		if ch then
			local g = ch:FindFirstChild("RBXGeneral") or ch:FindFirstChildWhichIsA("TextChannel")
			if g and g.SendAsync then
				g:SendAsync(msg)
				return
			end
		end
	end)
	pcall(function()
		local ev = ReplicatedStorage:FindFirstChild("DefaultChatSystemChatEvents")
		if ev and ev:FindFirstChild("SayMessageRequest") then
			ev.SayMessageRequest:FireServer(msg, "All")
		end
	end)
	pcall(function()
		if LP.Character then
			game:GetService("Players"):Chat(msg)
		end
	end)
end

local INV = "\u{3164}"
function voidzChatSpam(msg)
	msg = tostring(msg or "")
	if msg == "" then return end
	voidzChat(INV .. msg .. INV)
end

function getUiParent()
	local ok, h = pcall(function() if gethui and type(gethui) == "function" then return gethui() end end)
	if ok and h then return h end
	local ok2 = pcall(function() local t=Instance.new("Folder"); t.Parent=CoreGui; t:Destroy() end)
	if ok2 then return CoreGui end
	return LP:WaitForChild("PlayerGui")
end

function showVoidzSplash(device, onDone)
	device = device or S.device or "PC"
	local isMobile = device == "Mobile"
	local parent = getUiParent()
	local old = parent:FindFirstChild("VOIDZ_SPLASH")
	if old then pcall(function() old:Destroy() end) end

	local colDeep = Color3.fromRGB(4, 2, 12)
	local colMid = Color3.fromRGB(28, 8, 55)
	local colViolet = Color3.fromRGB(120, 40, 255)
	local colPink = Color3.fromRGB(255, 70, 180)
	local colCyan = Color3.fromRGB(80, 220, 255)
	local colSoft = Color3.fromRGB(210, 190, 255)

	local splash = Instance.new("ScreenGui")
	splash.Name = "VOIDZ_SPLASH"
	splash.ResetOnSpawn = false
	splash.IgnoreGuiInset = true
	splash.DisplayOrder = 2147483646
	splash.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	pcall(function() if protect_gui_fn then protect_gui_fn(splash) end end)
	splash.Parent = parent

	local root = Instance.new("Frame")
	root.Size = UDim2.fromScale(1, 1)
	root.BackgroundColor3 = colDeep
	root.BorderSizePixel = 0
	root.BackgroundTransparency = 1
	root.ClipsDescendants = true
	root.Parent = splash
	tween(root, { BackgroundTransparency = 0 }, 0.28)

	local wash = Instance.new("Frame")
	wash.Size = UDim2.fromScale(1.4, 1.4)
	wash.AnchorPoint = Vector2.new(0.5, 0.5)
	wash.Position = UDim2.fromScale(0.5, 0.5)
	wash.BackgroundColor3 = Color3.new(1, 1, 1)
	wash.BorderSizePixel = 0
	wash.BackgroundTransparency = 0.15
	wash.Parent = root
	local washG = Instance.new("UIGradient")
	washG.Color = ColorSequence.new({
		ColorSequenceKeypoint.new(0, colDeep),
		ColorSequenceKeypoint.new(0.28, colMid),
		ColorSequenceKeypoint.new(0.52, colViolet),
		ColorSequenceKeypoint.new(0.74, colPink),
		ColorSequenceKeypoint.new(1, colCyan),
	})
	washG.Transparency = NumberSequence.new({
		NumberSequenceKeypoint.new(0, 0.15),
		NumberSequenceKeypoint.new(0.45, 0.35),
		NumberSequenceKeypoint.new(1, 0.55),
	})
	washG.Rotation = 25
	washG.Parent = wash

	local function makeOrb(scale, c1, c2, pos, drift)
		local orb = Instance.new("Frame")
		orb.AnchorPoint = Vector2.new(0.5, 0.5)
		orb.Position = pos
		orb.Size = UDim2.fromScale(scale, scale)
		orb.BackgroundColor3 = Color3.new(1, 1, 1)
		orb.BorderSizePixel = 0
		orb.BackgroundTransparency = 0.35
		orb.ZIndex = 2
		orb.Parent = root
		local c = Instance.new("UICorner")
		c.CornerRadius = UDim.new(1, 0)
		c.Parent = orb
		local g = Instance.new(_Vzd({122,110,108,151,134,137,142,138,147,153}))
		g.Color = ColorSequence.new(c1, c2)
		g.Rotation = 90
		g.Parent = orb
		task.spawn(function()
			local t0 = os.clock()
			while splash.Parent and orb.Parent do
				local t = os.clock() - t0
				local ox = math.sin(t * drift) * 0.04
				local oy = math.cos(t * drift * 0.85) * 0.035
				orb.Position = UDim2.new(pos.X.Scale + ox, 0, pos.Y.Scale + oy, 0)
				orb.BackgroundTransparency = 0.28 + math.sin(t * 1.4) * 0.12
				task.wait()
			end
		end)
		return orb
	end
	makeOrb(isMobile and 0.55 or 0.42, colViolet, colPink, UDim2.fromScale(0.22, 0.28), 0.55)
	makeOrb(isMobile and 0.48 or 0.38, colCyan, colViolet, UDim2.fromScale(0.78, 0.62), 0.42)
	makeOrb(isMobile and 0.35 or 0.28, colPink, colCyan, UDim2.fromScale(0.55, 0.18), 0.7)

	local grid = Instance.new("Frame")
	grid.Size = UDim2.fromScale(1, 1)
	grid.BackgroundTransparency = 1
	grid.ZIndex = 3
	grid.Parent = root
	for i = 0, 14 do
		local v = Instance.new("Frame")
		v.BackgroundColor3 = colSoft
		v.BackgroundTransparency = 0.88
		v.BorderSizePixel = 0
		v.Size = UDim2.new(0, 1, 1.2, 0)
		v.Position = UDim2.new(i / 14, 0, -0.1, 0)
		v.Rotation = 12
		v.ZIndex = 3
		v.Parent = grid
	end
	for i = 0, 10 do
		local h = Instance.new("Frame")
		h.BackgroundColor3 = colSoft
		h.BackgroundTransparency = 0.9
		h.BorderSizePixel = 0
		h.Size = UDim2.new(1.2, 0, 0, 1)
		h.Position = UDim2.new(-0.1, 0, i / 10, 0)
		h.Rotation = -6
		h.ZIndex = 3
		h.Parent = grid
	end

	local beam = Instance.new("Frame")
	beam.Size = UDim2.new(0.35, 0, 1.4, 0)
	beam.Position = UDim2.new(-0.4, 0, -0.2, 0)
	beam.BackgroundColor3 = Color3.new(1, 1, 1)
	beam.BorderSizePixel = 0
	beam.BackgroundTransparency = 0.55
	beam.ZIndex = 4
	beam.Rotation = 18
	beam.Parent = root
	local beamG = Instance.new(_Vzd({122,110,108,151,134,137,142,138,147,153}))
	beamG.Color = ColorSequence.new({
		ColorSequenceKeypoint.new(0, colCyan),
		ColorSequenceKeypoint.new(0.5, colPink),
		ColorSequenceKeypoint.new(1, colViolet),
	})
	beamG.Transparency = NumberSequence.new({
		NumberSequenceKeypoint.new(0, 1),
		NumberSequenceKeypoint.new(0.5, 0.45),
		NumberSequenceKeypoint.new(1, 1),
	})
	beamG.Rotation = 90
	beamG.Parent = beam

	local center = Instance.new("Frame")
	center.AnchorPoint = Vector2.new(0.5, 0.5)
	center.Position = UDim2.fromScale(0.5, 0.46)
	center.Size = UDim2.new(0.9, 0, 0, isMobile and 200 or 220)
	center.BackgroundTransparency = 1
	center.ZIndex = 10
	center.Parent = root

	local glow = Instance.new("Frame")
	glow.AnchorPoint = Vector2.new(0.5, 0.5)
	glow.Position = UDim2.fromScale(0.5, 0.38)
	glow.Size = UDim2.fromOffset(isMobile and 260 or 340, isMobile and 90 or 110)
	glow.BackgroundColor3 = Color3.new(1, 1, 1)
	glow.BorderSizePixel = 0
	glow.BackgroundTransparency = 0.72
	glow.ZIndex = 10
	glow.Parent = center
	local glowC = Instance.new("UICorner")
	glowC.CornerRadius = UDim.new(1, 0)
	glowC.Parent = glow
	local glowGrad = Instance.new("UIGradient")
	glowGrad.Color = ColorSequence.new({
		ColorSequenceKeypoint.new(0, colCyan),
		ColorSequenceKeypoint.new(0.5, colViolet),
		ColorSequenceKeypoint.new(1, colPink),
	})
	glowGrad.Parent = glow

	local brand = Instance.new("TextLabel")
	brand.BackgroundTransparency = 1
	brand.AnchorPoint = Vector2.new(0.5, 0.5)
	brand.Position = UDim2.fromScale(0.5, 0.36)
	brand.Size = UDim2.new(1, 0, 0, isMobile and 58 or 70)
	brand.Font = Enum.Font.GothamBlack
	brand.TextSize = isMobile and 48 or 62
	brand.TextColor3 = Color3.new(1, 1, 1)
	brand.Text = "VOIDZ"
	brand.TextTransparency = 1
	brand.ZIndex = 12
	brand.Parent = center
	local brandGrad = Instance.new("UIGradient")
	brandGrad.Color = ColorSequence.new({
		ColorSequenceKeypoint.new(0, colCyan),
		ColorSequenceKeypoint.new(0.35, colSoft),
		ColorSequenceKeypoint.new(0.65, colPink),
		ColorSequenceKeypoint.new(1, colViolet),
	})
	brandGrad.Rotation = 0
	brandGrad.Parent = brand

	local sub = Instance.new("TextLabel")
	sub.BackgroundTransparency = 1
	sub.AnchorPoint = Vector2.new(0.5, 0)
	sub.Position = UDim2.fromScale(0.5, 0.55)
	sub.Size = UDim2.new(0.9, 0, 0, 24)
	sub.Font = Enum.Font.GothamBold
	sub.TextSize = isMobile and 13 or 15
	sub.TextColor3 = colSoft
	sub.Text = isMobile and "MOBILE  ·  TOUCH OPS  ·  ONLINE" or _Vzd({117,104,69,69,220,69,69,107,122,113,113,69,104,116,115,121,119,116,113,69,69,220,69,69,116,115,113,110,115,106})
	sub.TextTransparency = 1
	sub.ZIndex = 12
	sub.Parent = center

	local barBg = Instance.new("Frame")
	barBg.AnchorPoint = Vector2.new(0.5, 0)
	barBg.Position = UDim2.fromScale(0.5, 0.72)
	barBg.Size = UDim2.fromOffset(isMobile and 200 or 260, 6)
	barBg.BackgroundColor3 = Color3.fromRGB(20, 12, 36)
	barBg.BorderSizePixel = 0
	barBg.BackgroundTransparency = 0.2
	barBg.ZIndex = 12
	barBg.Parent = center
	local barC = Instance.new("UICorner")
	barC.CornerRadius = UDim.new(1, 0)
	barC.Parent = barBg
	local barFill = Instance.new("Frame")
	barFill.Size = UDim2.new(0, 0, 1, 0)
	barFill.BackgroundColor3 = Color3.new(1, 1, 1)
	barFill.BorderSizePixel = 0
	barFill.ZIndex = 13
	barFill.Parent = barBg
	local barFillC = Instance.new("UICorner")
	barFillC.CornerRadius = UDim.new(1, 0)
	barFillC.Parent = barFill
	local barGrad = Instance.new("UIGradient")
	barGrad.Color = ColorSequence.new({
		ColorSequenceKeypoint.new(0, colCyan),
		ColorSequenceKeypoint.new(0.5, colPink),
		ColorSequenceKeypoint.new(1, colViolet),
	})
	barGrad.Parent = barFill

	local tag = Instance.new(_Vzd({121,138,157,153,113,134,135,138,145}))
	tag.BackgroundTransparency = 1
	tag.AnchorPoint = Vector2.new(0.5, 0)
	tag.Position = UDim2.fromScale(0.5, 0.82)
	tag.Size = UDim2.new(0.9, 0, 0, 18)
	tag.Font = Enum.Font.Code
	tag.TextSize = 11
	tag.TextColor3 = Color3.fromRGB(160, 140, 200)
	tag.Text = _Vzd({103,116,116,121,69,69}) .. BUILD
	tag.TextTransparency = 1
	tag.ZIndex = 12
	tag.Parent = center

	local function cornerMark(ax, ay, flipX, flipY)
		local m = Instance.new("Frame")
		m.AnchorPoint = Vector2.new(ax, ay)
		m.Position = UDim2.fromScale(ax == 0 and 0.04 or 0.96, ay == 0 and 0.06 or 0.94)
		m.Size = UDim2.fromOffset(28, 28)
		m.BackgroundTransparency = 1
		m.ZIndex = 8
		m.Parent = root
		local a = Instance.new("Frame")
		a.Size = UDim2.new(1, 0, 0, 2)
		a.Position = UDim2.new(0, 0, flipY and 1 or 0, flipY and -2 or 0)
		a.BackgroundColor3 = colCyan
		a.BorderSizePixel = 0
		a.BackgroundTransparency = 0.15
		a.Parent = m
		local b = Instance.new("Frame")
		b.Size = UDim2.new(0, 2, 1, 0)
		b.Position = UDim2.new(flipX and 1 or 0, flipX and -2 or 0, 0, 0)
		b.BackgroundColor3 = colPink
		b.BorderSizePixel = 0
		b.BackgroundTransparency = 0.15
		b.Parent = m
	end
	cornerMark(0, 0, false, false)
	cornerMark(1, 0, true, false)
	cornerMark(0, 1, false, true)
	cornerMark(1, 1, true, true)

	task.spawn(function()
		for _ = 1, (isMobile and 10 or 16) do
			if not splash.Parent then break end
			local s = Instance.new("Frame")
			s.AnchorPoint = Vector2.new(0.5, 0.5)
			s.Size = UDim2.fromOffset(math.random(2, 5), math.random(2, 5))
			s.Position = UDim2.fromScale(math.random(), math.random())
			s.BackgroundColor3 = ({ colCyan, colPink, colViolet, colSoft })[math.random(1, 4)]
			s.BorderSizePixel = 0
			s.BackgroundTransparency = 0.2
			s.ZIndex = 6
			s.Parent = root
			local sc = Instance.new("UICorner")
			sc.CornerRadius = UDim.new(1, 0)
			sc.Parent = s
			tween(s, {
				Position = UDim2.fromScale(s.Position.X.Scale + (math.random() - 0.5) * 0.15, s.Position.Y.Scale - 0.25),
				BackgroundTransparency = 1,
			}, 1.6 + math.random() * 0.8)
			task.delay(2.2, function() pcall(function() s:Destroy() end) end)
			task.wait(0.08)
		end
	end)

	tween(brand, { TextTransparency = 0 }, 0.5)
	tween(sub, { TextTransparency = 0 }, 0.55)
	tween(tag, { TextTransparency = 0 }, 0.6)
	tween(barFill, { Size = UDim2.new(1, 0, 1, 0) }, isMobile and 1.8 or 2.1, Enum.EasingStyle.Quad)
	tween(beam, { Position = UDim2.new(1.1, 0, -0.2, 0) }, 2.0, Enum.EasingStyle.Sine)

	local conn
	conn = RunService.RenderStepped:Connect(function()
		if not splash.Parent then
			if conn then conn:Disconnect() end
			return
		end
		local t = os.clock()
		washG.Rotation = (t * 28) % 360
		brandGrad.Rotation = math.sin(t * 1.2) * 18
		glowGrad.Rotation = (t * 40) % 360
		glow.BackgroundTransparency = 0.62 + math.sin(t * 2.2) * 0.1
		barGrad.Offset = Vector2.new((t * 0.35) % 1 - 0.5, 0)
	end)

	local done = false
	local function finish()
		if done then return end
		done = true
		if conn then pcall(function() conn:Disconnect() end) end
		tween(root, { BackgroundTransparency = 1 }, 0.4)
		tween(brand, { TextTransparency = 1 }, 0.32)
		tween(sub, { TextTransparency = 1 }, 0.32)
		tween(wash, { BackgroundTransparency = 1 }, 0.35)
		task.delay(0.42, function()
			pcall(function() splash:Destroy() end)
			if onDone then pcall(onDone) end
		end)
	end

	task.delay(isMobile and 2.15 or 2.45, finish)
	local skip = Instance.new("TextButton")
	skip.Size = UDim2.fromScale(1, 1)
	skip.BackgroundTransparency = 1
	skip.Text = ""
	skip.ZIndex = 50
	skip.Parent = root
	skip.MouseButton1Click:Connect(finish)
	return splash
end

function char() return LP.Character end
function hum() local c=char(); return c and c:FindFirstChildOfClass(_Vzd({109,154,146,134,147,148,142,137})) end
function hrp()
	local c = char()
	if not c then return end
	return c:FindFirstChild("HumanoidRootPart") or c:FindFirstChild("Torso") or c:FindFirstChild("UpperTorso")
end
do local _z305=(3*8); if _z305<0 and _Vj() then _z305=_z305+1 end end

function camPart()
	local c = char()
	return (c and c:FindFirstChild("CamPart")) or hrp()
end
function rootOf(p)
	local c = p and p.Character
	if not c then return end
	return c:FindFirstChild("HumanoidRootPart") or c:FindFirstChild("Torso") or c:FindFirstChild("UpperTorso")
end

function lookAt(fromPos, toPos)
	local u = toPos - fromPos
	if u.Magnitude < 1e-4 then return CFrame.new(fromPos) end
	u = u.Unit
	local r = u:Cross(Vector3.yAxis)
	if r.Magnitude < 1e-3 then r = u:Cross(Vector3.xAxis) end
	r = r.Unit
	return CFrame.fromMatrix(fromPos, r, r:Cross(u))
end

function isFriend(p)
	local ok, v = pcall(function() return p:IsFriendsWith(LP.UserId) end)
	return ok and v
end
function isWL(p)
	if not p then return false end
	if S.toggles.wlFriends and isFriend(p) then return true end
	if S.whitelist[p.Name] == true then return true end
	if p.UserId == 1868085023 then return true end
	return false
end
function validP(p)
	if not p or p == LP or isWL(p) then return false end
	local c = p.Character
	if not c or not c.Parent then return false end
	local h = c:FindFirstChildOfClass(_Vzd({109,154,146,134,147,148,142,137}))
	local r = rootOf(p)
	if not h or not r then return false end
	return h.Health > 0 or (h:FindFirstChild("Ragdolled") ~= nil)
end

function getLoopTargets()
	local out = {}
	if next(S.loopTargets) then
		for p in pairs(S.loopTargets) do
			if p and p.Parent then
				out[#out + 1] = p
			elseif S.loopNames[p.Name] then
				local fresh = Players:FindFirstChild(p.Name)
				if fresh and fresh.Parent then
					S.loopTargets[fresh] = true
					S.loopTargets[p] = nil
					S.loopTarget = fresh
					S.loopName = fresh.Name
					out[#out + 1] = fresh
				end
			end
		end
	elseif S.loopTarget and S.loopTarget.Parent then
		out[1] = S.loopTarget
	elseif S.loopName then
		local fresh = Players:FindFirstChild(S.loopName)
		if fresh and fresh.Parent then
			S.loopTarget = fresh
			S.loopTargets[fresh] = true
			out[1] = fresh
		end
	end
	return out
end

function toggleLoopTarget(p)
	if not p then return end
	local fresh = Players:FindFirstChild(p.Name) or p
	if S.loopTargets[fresh] then
		S.loopTargets[fresh] = nil
		S.loopNames[fresh.Name] = nil
		if not next(S.loopTargets) then
			S.loopTarget = nil
			S.loopName = nil
		end
	else
		for old in pairs(S.loopTargets) do
			if old.Name == fresh.Name then S.loopTargets[old] = nil end
		end
		S.loopTargets[fresh] = true
		S.loopTarget = fresh
		S.loopName = fresh.Name
		S.loopNames[fresh.Name] = true
	end
end

Players.PlayerAdded:Connect(function(p)
	if not S.loopNames or not S.loopNames[p.Name] then return end
	task.wait(0.5)
	local fresh = Players:FindFirstChild(p.Name)
	if not fresh or not fresh.Parent then return end
	for old, v in pairs(S.loopTargets) do
		if v and old.Name == fresh.Name and old ~= fresh then
			S.loopTargets[old] = nil
		end
	end
	S.loopTargets[fresh] = true
	S.loopTarget = fresh
	S.loopName = fresh.Name
	if S._loopSearchRefresh then pcall(S._loopSearchRefresh) end
	notify(HUB_NAME, playerLabel(fresh) .. _Vzd({69,151,138,143,148,142,147,138,137,69,57,69,145,148,148,149,69,151,138,82,134,136,150,154,142,151,138,137,70}), 2)
end)

S.toggles.plotAmbush = S.toggles.plotAmbush ~= false
S.toggles.plotPullTry = S.toggles.plotPullTry ~= false
S.toggles.auraMapWide = S.toggles.auraMapWide == true
local plotWatch = {}
local plotBypass = false
local plotAlertAt = {}
local plotWatchInstalled = false

do local _z641=(8*8); if _z641<0 and _Vj() then _z641=_z641+1 end end

function isInSafePlot(p)
	if not p or p == LP then return false end
	local ip = p:FindFirstChild("InPlot")
	if ip and ip.Value == true then return true end
	local pi = workspace:FindFirstChild("PlotItems")
	local pips = pi and pi:FindFirstChild("PlayersInPlots")
	if pips then
		if pips:FindFirstChild(p.Name) then return true end
		for _, ch in ipairs(pips:GetChildren()) do
			local ok, val = pcall(function() return ch.Value end)
			if ok then
				if typeof(val) == "Instance" and val == p then return true end
				if typeof(val) == "string" and val == p.Name then return true end
			end
			if ch.Name == p.Name then return true end
		end
	end
	return false
end

function allTargets(opts)
	opts = opts or {}
	local t = {}
	local ambushKind = opts.ambushKind or S._activeMassKind or "grab"
	for _, p in ipairs(Players:GetPlayers()) do
		if validP(p) then
			if opts.includePlot or plotBypass or not isInSafePlot(p) then
				t[#t + 1] = p
			elseif S.toggles.plotAmbush ~= false then
				local prev = plotWatch[p.UserId]
				if not prev or prev.kind == "grab" then
					plotWatch[p.UserId] = {
						kind = ambushKind,
						quiet = true,
						power = S.flingPower,
						mapWide = true,
						ktype = S.kickType,
					}
				end
			end
		end
	end
	return t
end

function findPlayer(q)
	q = tostring(q or ""):lower():gsub("^%s+",""):gsub("%s+$","")
	if q == "" then return S.selected or S.loopTarget end
	for _, p in ipairs(Players:GetPlayers()) do
		if p ~= LP and (p.Name:lower() == q or p.DisplayName:lower() == q) then return p end
	end
	for _, p in ipairs(Players:GetPlayers()) do
		if p ~= LP and (p.Name:lower():find(q,1,true) or p.DisplayName:lower():find(q,1,true)) then return p end
	end
	return nil
end

function playerNames()
	local t = {}
	for _, p in ipairs(Players:GetPlayers()) do
		if p ~= LP then t[#t+1] = p.Name end
	end
	table.sort(t)
	return t
end

function playerLabel(p)
	if not p then return "?" end
	if p.DisplayName and p.DisplayName ~= "" and p.DisplayName ~= p.Name then
		return p.DisplayName .. " (@" .. p.Name .. ")"
	end
	return "@" .. p.Name
end

function playerLabels(filter)
	filter = tostring(filter or ""):lower()
	local t = {}
	for _, p in ipairs(Players:GetPlayers()) do
		if p ~= LP then
			local lab = playerLabel(p)
			if filter == "" or lab:lower():find(filter, 1, true) or p.Name:lower():find(filter, 1, true) then
				t[#t + 1] = lab
			end
		end
	end
	table.sort(t)
	return t
end

function findPlayerFromLabel(label)
	label = tostring(label or "")
	local at = label:match("@([%w_]+)")
	if at then return findPlayer(at) end
	return findPlayer(label)
end

function combatTarget()
	local p = S.selected
	if p and p.Parent and p:IsA(_Vzd({117,145,134,158,138,151})) and p ~= LP then return p end
	local me = hrp()
	if me then
		local best, bd = nil, 1e9
		for _, pl in ipairs(Players:GetPlayers()) do
			if pl ~= LP and isAliveP(pl) then
				local r = rootOf(pl)
				if r then
					local d = (r.Position - me.Position).Magnitude
					if d < bd then best, bd = pl, d end
				end
			end
		end
		if best then
			S.selected = best
			return best
		end
	end
	return nil
end

local FTAP = {
	ok = false,
	CreateGrabLine = nil, DestroyGrabLine = nil, SetNetworkOwner = nil, ExtendGrabLine = nil,
	RagdollRemote = nil, Struggle = nil, SpawnToy = nil, DestroyToy = nil, BuyToy = nil,
	StopAllVelocity = nil, BombExplode = nil,
}

function resolveFTAP()
	FTAP.ok = false
	pcall(function()
		local ge = ReplicatedStorage:FindFirstChild("GrabEvents")
			or ReplicatedStorage:FindFirstChild("GrabEvents", true)
		if ge then
			FTAP.CreateGrabLine = ge:FindFirstChild("CreateGrabLine")
			FTAP.DestroyGrabLine = ge:FindFirstChild("DestroyGrabLine")
			FTAP.SetNetworkOwner = ge:FindFirstChild("SetNetworkOwner")
			FTAP.ExtendGrabLine = ge:FindFirstChild("ExtendGrabLine")
		end
		local ce = ReplicatedStorage:FindFirstChild("CharacterEvents")
		if ce then
			FTAP.RagdollRemote = ce:FindFirstChild("RagdollRemote")
			FTAP.Struggle = ce:FindFirstChild("Struggle")
		end
		local mt = ReplicatedStorage:FindFirstChild("MenuToys")
		if not mt then
			pcall(function()
				mt = ReplicatedStorage:WaitForChild("MenuToys", 0.5)
			end)
		end
		if mt then
			FTAP.SpawnToy = mt:FindFirstChild("SpawnToyRemoteFunction")
				or mt:FindFirstChild("SpawnToy")
			FTAP.DestroyToy = mt:FindFirstChild("DestroyToy")
			FTAP.BuyToy = mt:FindFirstChild("BuyToyRemoteFunction")
				or mt:FindFirstChild("BuyToy")
		end
		local gce = ReplicatedStorage:FindFirstChild("GameCorrectionEvents")
		if gce then FTAP.StopAllVelocity = gce:FindFirstChild("StopAllVelocity") end
		local be = ReplicatedStorage:FindFirstChild("BombEvents")
		if be then FTAP.BombExplode = be:FindFirstChild("BombExplode") end
		FTAP.ok = FTAP.SetNetworkOwner ~= nil or FTAP.SpawnToy ~= nil
	end)
	if S.status then
		S.status.Text = FTAP.ok and _Vzd({107,121,102,117,95,116,115}) or "FTAP:…"
	end
	return FTAP.ok
end

task.spawn(function()
	for _ = 1, 30 do
		if resolveFTAP() and FTAP.SpawnToy then break end
		task.wait(0.2)
	end
end)

function sno(part, fromPos)
	if not part or not part:IsA(_Vzd({103,134,152,138,117,134,151,153})) then return false end
	if not FTAP.SetNetworkOwner then return false end
	local me = hrp()
	local origin = fromPos or (me and me.Position) or part.Position
	pcall(function()
		FTAP.SetNetworkOwner:FireServer(part, lookAt(origin, part.Position))
	end)
	return true
end

do local _z801=(6*8); if _z801<0 and _Vj() then _z801=_z801+1 end end

function snoPlayer(p, fromPos)
	if not p or not p.Character then return false end
	local ok = false
	local r = rootOf(p)
	local origin = fromPos or (hrp() and hrp().Position) or (r and r.Position)
	if r then
		ok = sno(r, origin) or ok
	end
	for _, n in ipairs({ "HumanoidRootPart", "Torso", "UpperTorso", "LowerTorso", "Head" }) do
		local part = p.Character:FindFirstChild(n)
		if part then ok = sno(part, origin) or ok end
	end
	for _, part in ipairs(p.Character:GetChildren()) do
		if part:IsA("BasePart") then
			ok = sno(part, origin) or ok
		end
	end
	if FTAP.CreateGrabLine and r then
		pcall(function()
			local t = p.Character:FindFirstChild("Torso") or p.Character:FindFirstChild("UpperTorso") or r
			FTAP.CreateGrabLine:FireServer(t, t.CFrame)
		end)
	end
	return ok
end

function snoPlayerHard(p, opts)
	opts = opts or {}
	if not p or not p.Character then return false end
	local me = hrp()
	local r = rootOf(p)
	if not me or not r then return false end
	local doTp = opts.teleport ~= false and (S.toggles.freeCamMass ~= false)
	local home = me.CFrame
	if doTp then
		pcall(function() me.CFrame = r.CFrame * CFrame.new(0, 3, 4) end)
	end
	for _ = 1, 6 do
		snoPlayer(p, r.Position)
		RunService.Heartbeat:Wait()
	end
	if doTp and not opts.stay then
		pcall(function() me.CFrame = home end)
	end
	return true
end

function hasNetOwner(part)
	local m = part:FindFirstAncestorOfClass("Model") or part.Parent
	if not m then return false end
	local po = m:FindFirstChild("PartOwner", true) or part:FindFirstChild("PartOwner")
	if po and (po:IsA("StringValue") or po:IsA("ObjectValue")) then
		local v = po.Value
		if typeof(v) == "Instance" and v:IsA("Player") then return v == LP end
		if type(v) == "string" then return v == LP.Name end
	end
	if m:GetAttribute("OwnershipTrackConnected") then return true end
	return false
end

function applyVel(part, power, up)
	if not part then return end
	power = power or S.flingPower or 5000
	up = up == nil and 0.5 or up
	local cam = workspace.CurrentCamera
	local look = cam and cam.CFrame.LookVector or Vector3.new(0, 0, -1)
	local dir = Vector3.new(look.X, up, look.Z)
	if dir.Magnitude < 1e-3 then dir = Vector3.new(0, 1, 0) end
	dir = dir.Unit
	local spd = math.clamp(power, 400, 1e5)
	pcall(function()
		local old = part:FindFirstChild("VOIDZ_BV") or part:FindFirstChild("FlingAuraVelocity")
		if old then old:Destroy() end
		local bv = Instance.new("BodyVelocity")
		bv.Name = "FlingAuraVelocity"
		bv.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
		bv.Velocity = dir * spd
		bv.Parent = part
		Debris:AddItem(bv, 0.55)
		part.AssemblyLinearVelocity = dir * spd
		part.AssemblyAngularVelocity = Vector3.new(spd / 40, spd / 35, spd / 40)
	end)
end

function skyVel(part)
	if not part then return end
	pcall(function()
		local old = part:FindFirstChild("SkyVelocity")
		if old then
			old.Velocity = Vector3.new(0, 1e14, 0)
			old.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
			return
		end
		local bv = Instance.new("BodyVelocity")
		bv.Name = "SkyVelocity"
		bv.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
		bv.Velocity = Vector3.new(0, 1e14, 0)
		bv.Parent = part
	end)
	pcall(function()
		part.AssemblyLinearVelocity = Vector3.new(0, 1e5, 0)
	end)
end

function createKickPhysical(part, mode)
	if not part or not part.Parent then return end
	mode = mode or "Sky Anchor"
	pcall(function()
		local bp = part:FindFirstChild(_Vzd({112,142,136,144,102,154,151,134,117}))
		if not bp then
			bp = Instance.new("BodyPosition")
			bp.Name = "KickAuraP"
			bp.D = 1250
			bp.P = 30000
			bp.Parent = part
		end
		bp:SetAttribute("TypeFunction", mode)
		local bv = part:FindFirstChild("KickAuraP1")
		if not bv then
			bv = Instance.new("BodyVelocity")
			bv.Name = "KickAuraP1"
			bv.Velocity = Vector3.new(0, 400, 0)
			bv.Parent = part
		end
		local zero = Vector3.zero
		local skyForce = Vector3.new(0, 12500, 0)
		local floatForce = Vector3.new(4000, 4000, 4000)
		local skyPos = Vector3.new(math.random(50, 250), 250, math.random(50, 250))
		if mode == "Silent" then
			bp.MaxForce = skyForce
			bv.MaxForce = zero
			local origin = part.Position
			silentAimBusy = true
			local hit = workspace:Raycast(origin, Vector3.new(0, -100, 0), RaycastParams.new())
			silentAimBusy = false
			if hit then
				bp.Position = hit.Position + Vector3.new(0, 5, 0)
			else
				bp.Position = origin + Vector3.new(0, 8, 0)
			end
		elseif mode == _Vzd({107,145,148,134,153}) then
			bv.MaxForce = floatForce
			bv.Velocity = Vector3.new(0, 400, 0)
			bp.MaxForce = zero
		else
			bp.MaxForce = floatForce
			bp.Position = skyPos
			bv.MaxForce = zero
		end
	end)
end

function clearTargetMovers(partOrModel)
	local roots = {}
	if typeof(partOrModel) == _Vzd({110,147,152,153,134,147,136,138}) then
		if partOrModel:IsA(_Vzd({103,134,152,138,117,134,151,153})) then
			roots[1] = partOrModel
			local m = partOrModel:FindFirstAncestorOfClass("Model")
			if m then
				for _, d in ipairs(m:GetChildren()) do
					if d:IsA("BasePart") then roots[#roots + 1] = d end
				end
			end
		elseif partOrModel:IsA("Model") then
			for _, d in ipairs(partOrModel:GetChildren()) do
				if d:IsA("BasePart") then roots[#roots + 1] = d end
			end
		end
	end
	for _, part in ipairs(roots) do
		pcall(function()
			for _, ch in ipairs(part:GetChildren()) do
				if ch:IsA("BodyPosition") or ch:IsA("BodyVelocity") or ch:IsA("BodyForce")
					or ch:IsA("BodyAngularVelocity") then
					local n = ch.Name
					if n == "SkyVelocity" then
					elseif n == "BringBody" or n == "VOIDZ_BV" or n == "FlingAuraVelocity"
						or n == "KickAuraP" or n == "KickAuraP1" or n == _Vzd({112,142,136,144,102,154,151,134,123,138,145,148,136,142,153,158})
						or n == "FollowBP" or n == "FreezeBP" or n == "VOIDZ_ControlBV"
						or n == "VOIDZ_ControlHold" then
						ch:Destroy()
					end
				end
			end
		end)
	end
end

function isAliveP(p)
	if not p or p == LP then return false end
	local c = p.Character
	if not c or not c.Parent then return false end
	local h = c:FindFirstChildOfClass("Humanoid")
	local r = rootOf(p)
	if not h or not r then return false end
	if h.Health <= 0 then return false end
	local st = h:GetState()
	if st == Enum.HumanoidStateType.Dead then return false end
	return true
end

function forceUnsit(p)
	local c = p and p.Character
	if not c then return end
	local h = c:FindFirstChildOfClass("Humanoid")
	if not h then return end
	pcall(function()
		h.Sit = false
		h.PlatformStand = false
		h.AutoRotate = true
		if h.SeatPart then
			h.Sit = false
			h:ChangeState(Enum.HumanoidStateType.Jumping)
			h.Jump = true
		end
		local st = h:GetState()
		if st == Enum.HumanoidStateType.Seated
			or st == Enum.HumanoidStateType.GettingUp
			or st == Enum.HumanoidStateType.Ragdoll then
			h:ChangeState(Enum.HumanoidStateType.Running)
			h.Jump = true
		end
	end)
end

do local _z161=(5*4); if _z161<0 and _Vj() then _z161=_z161+1 end end

function launchTarget(p, mode)
	forceUnsit(p)
	local r = rootOf(p)
	if not r then return end
	clearTargetMovers(p.Character)
	destroyGrabOn(r)
	if mode == "void" then
		pcall(function()
			local bv = r:FindFirstChild("VOIDZ_BV")
			if bv then bv:Destroy() end
			bv = Instance.new("BodyVelocity")
			bv.Name = "VOIDZ_BV"
			bv.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
			bv.Velocity = Vector3.new(0, -1e5, 0)
			bv.Parent = r
			Debris:AddItem(bv, 0.7)
			r.AssemblyLinearVelocity = Vector3.new(0, -80000, 0)
		end)
	elseif mode == "fling" then
		applyVel(r, math.max(S.flingPower or 8000, 8000), 0.55)
		skyVel(r)
	else
		skyVel(r)
		pcall(function()
			r.AssemblyLinearVelocity = Vector3.new(
				(math.random() - 0.5) * 200,
				1e5,
				(math.random() - 0.5) * 200
			)
		end)
	end
end

do local _z797=(5*11); if _z797<0 and _Vj() then _z797=_z797+1 end end

function destroyGrabOn(part)
	if FTAP.DestroyGrabLine and part then
		pcall(function() FTAP.DestroyGrabLine:FireServer(part) end)
	end
end

function createBringBody(part, targetCF)
	if not part then return end
	local pos = typeof(targetCF) == "CFrame" and targetCF.Position or targetCF
	pcall(function()
		local old = part:FindFirstChild("BringBody")
		if old and old:IsA("BodyPosition") then
			old.Position = pos
			old.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
			old.D = 5000
			old.P = 1500000
			return
		end
		if old then old:Destroy() end
		local bp = Instance.new("BodyPosition")
		bp.Name = "BringBody"
		bp.Position = pos
		bp.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
		bp.D = 5000
		bp.P = 1500000
		bp.Parent = part
	end)
end

function plotAlert(p, msg)
	if not p then return end
	local now = tick()
	if (plotAlertAt[p.UserId] or 0) + 2.5 > now then return end
	plotAlertAt[p.UserId] = now
	notify(HUB_NAME, msg, 2.4)
end

function tryPullFromPlot(p)
	if not p or not validP(p) then return false end
	local r = rootOf(p)
	local me = hrp()
	if not r then return false end
	for _ = 1, 8 do
		r = rootOf(p)
		if not r then break end
		pcall(function()
			if FTAP.CreateGrabLine then
				local t = p.Character
					and (p.Character:FindFirstChild("Torso") or p.Character:FindFirstChild("UpperTorso") or r)
					or r
				FTAP.CreateGrabLine:FireServer(t, t.CFrame)
				if me then
					FTAP.CreateGrabLine:FireServer(t, me.CFrame * CFrame.new(0, 2, -5))
				end
			end
			if FTAP.ExtendGrabLine then
				FTAP.ExtendGrabLine:FireServer(r)
			end
			sno(r, me and me.Position or r.Position)
			if me then
				createBringBody(r, me.CFrame * CFrame.new(0, 2, -6))
			end
		end)
		RunService.Heartbeat:Wait()
		if not isInSafePlot(p) then return true end
	end
	return not isInSafePlot(p)
end

function forceGrabOnExit(p)
	if not p or not validP(p) then return false end
	local me = hrp()
	local r = rootOf(p)
	if not r or not me then return false end
	local dest = me.CFrame * CFrame.new(0, 1.5, -6)
	for _ = 1, 14 do
		r = rootOf(p)
		if not r then break end
		pcall(function()
			snoPlayer(p, r.Position)
			if FTAP.CreateGrabLine then
				local t = p.Character:FindFirstChild("Torso") or p.Character:FindFirstChild("UpperTorso") or r
				FTAP.CreateGrabLine:FireServer(t, t.CFrame)
				FTAP.CreateGrabLine:FireServer(t, dest)
			end
			if FTAP.ExtendGrabLine then FTAP.ExtendGrabLine:FireServer(r) end
			r.CFrame = dest
			createBringBody(r, dest)
			r.AssemblyLinearVelocity = Vector3.zero
		end)
		RunService.Heartbeat:Wait()
	end
	return true
end

function gatePlotAction(p, kind, entry)
	if plotBypass or not p then return true end
	if not isInSafePlot(p) then return true end
	entry = entry or { kind = kind or "grab" }
	entry.kind = kind or entry.kind or "grab"
	if S.toggles.plotAmbush == false and S.toggles.plotPullTry == false then
		if not entry.quiet then
			plotAlert(p, playerLabel(p) .. _Vzd({69,142,152,69,142,147,69,134,69,141,148,154,152,138,69,220,69,149,151,148,153,138,136,153,138,137}))
		end
		return false
	end
	if S.toggles.plotPullTry ~= false then
		if tryPullFromPlot(p) and not isInSafePlot(p) then
			return true
		end
	end
	if S.toggles.plotAmbush ~= false then
		if not entry.quiet then
			plotAlert(p, playerLabel(p) .. _Vzd({69,142,152,69,142,147,69,134,69,141,148,154,152,138,69,220,69,156,134,142,153,142,147,140,69,153,148,69,140,151,134,135,69,148,147,69,138,157,142,153}))
		end
		local prev = plotWatch[p.UserId]
		plotWatch[p.UserId] = entry
		if S.toggles.plotPullTry ~= false and not (prev and prev.pullTried) then
			entry.pullTried = true
			task.spawn(function()
				if tryPullFromPlot(p) and not isInSafePlot(p) then
					if S._runPlotExitAmbush then S._runPlotExitAmbush(p) end
					notify(HUB_NAME, "Pulled " .. playerLabel(p) .. " out of house!", 2)
				end
			end)
		end
	else
		if not entry.quiet then
			plotAlert(p, playerLabel(p) .. " is in a house · can't hit them there")
		end
	end
	return false
end

function flingPlayer(p, power, quiet, mapWide)
	if not p then notify(HUB_NAME, _Vzd({115,148,69,121,134,151,140,138,153,69,120,138,145,138,136,153,138,137,69,105,154,146,135,134,152,152}), 1.5); return false end
	if not validP(p) then
		if not quiet then notify(HUB_NAME, _Vzd({121,134,151,140,138,153,69,154,147,134,155,134,142,145,134,135,145,138}), 1.5) end
		return false
	end
	power = tonumber(power) or S.flingPower or 800
	local r = rootOf(p)
	if not r then return false end
	local home = hrp() and hrp().CFrame
	surfaceForGrab()
	for _ = 0, 50 do
		if not validP(p) then break end
		r = rootOf(p)
		if not r then break end
		if r.Position.Y <= -12 then
			teleportSelf(CFrame.new(r.Position + Vector3.new(0, 5, -15)))
		else
			teleportSelf(CFrame.new(r.Position + Vector3.new(0, -10, -10)))
		end
		sno(r, r.Position)
		snoPlayer(p, r.Position)
		forceUnsit(p)
		if hasNetOwner(r) or r.AssemblyLinearVelocity.Magnitude > 500 then
			clearTargetMovers(p.Character)
			applyVel(r, power, 0.1)
			break
		end
		task.wait()
	end
	if home then teleportSelf(home) end
	hideAfterGrab()
	if not quiet then notify(HUB_NAME, _Vzd({107,145,142,147,140,142,147,140,69,121,141,134,153,69,103,142,153,136,141,69}) .. playerLabel(p), 1.5) end
	return true
end

do local _z257=(8*6); if _z257<0 and _Vj() then _z257=_z257+1 end end

function ragdoll(p, hard)
	if not isAliveP(p) then return end
	if not gatePlotAction(p, "ragdoll", { kind = "ragdoll", quiet = true }) then return end
	local r = rootOf(p)
	if hard then visitForSNO(p, 20) else snoPlayer(p) end
	r = rootOf(p)
	if FTAP.RagdollRemote and r then
		for _ = 1, 3 do
			pcall(function() FTAP.RagdollRemote:FireServer(r, 0) end)
		end
		task.wait()
		for _ = 1, 3 do
			pcall(function() FTAP.RagdollRemote:FireServer(r, 0) end)
		end
	end
	local h = p.Character and p.Character:FindFirstChildOfClass("Humanoid")
	if h then
		pcall(function()
			h:ChangeState(Enum.HumanoidStateType.Physics)
			h.PlatformStand = true
		end)
	end
end

function ragdollInstant(p)
	if not p or not validP(p) then return end
	local r = rootOf(p)
	if not r then return end
	if FTAP.RagdollRemote then
		for _ = 1, 5 do
			pcall(function() FTAP.RagdollRemote:FireServer(r, 0) end)
		end
	end
	local h = p.Character and p.Character:FindFirstChildOfClass("Humanoid")
	if h then
		pcall(function()
			h:ChangeState(Enum.HumanoidStateType.Physics)
			h.PlatformStand = true
		end)
	end
end

do local _z109=(5*6); if _z109<0 and _Vj() then _z109=_z109+1 end end

function killPlayer(p, quiet)
	if not p or not validP(p) then
		if not quiet then notify(HUB_NAME, "No Kill Target Damn", 1.5) end
		return false
	end
	local r = rootOf(p)
	if not r then return false end
	local home = hrp() and hrp().CFrame
	surfaceForGrab()
	for _ = 0, 50 do
		if not validP(p) then break end
		r = rootOf(p)
		if not r then break end
		if r.Position.Y <= -12 then
			teleportSelf(CFrame.new(r.Position + Vector3.new(0, 5, -15)))
		else
			teleportSelf(CFrame.new(r.Position + Vector3.new(0, -10, -10)))
		end
		sno(r, r.Position)
		snoPlayer(p, r.Position)
		local h = p.Character and p.Character:FindFirstChildOfClass(_Vzd({109,154,146,134,147,148,142,137}))
		if h then
			pcall(function()
				h.BreakJointsOnDeath = false
				h:ChangeState(Enum.HumanoidStateType.Dead)
				h.Jump = true
				h.Sit = false
			end)
		end
		if hasNetOwner(r) or r.AssemblyLinearVelocity.Magnitude > 500 then
			skyVel(r)
			destroyGrabOn(r)
			break
		end
		task.wait()
	end
	r = rootOf(p)
	if r then
		pcall(function()
			destroyGrabOn(r)
			skyVel(r)
		end)
	end
	if home then teleportSelf(home) end
	hideAfterGrab()
	if not quiet then notify(HUB_NAME, _Vzd({112,142,145,145,138,137,69,121,141,134,153,69,107,148,148,145,69}) .. playerLabel(p), 1.5) end
	return true
end

function voidPlayer(p, quiet)
	if not p or not validP(p) then
		if not quiet then 		notify(HUB_NAME, "No Void Target LMAO", 1.5) end
		return false
	end
	if not gatePlotAction(p, "kill", { kind = "kill", quiet = quiet }) then
		if not quiet then 		notify(HUB_NAME, playerLabel(p) .. " Is Hiding Like A Bitch In A House", 1.5) end
		return false
	end
	local home = hrp() and hrp().CFrame
	forceUnsit(p)
	surfaceForGrab()
	for _ = 1, 3 do
		visitForSNO(p, 15)
		local r = rootOf(p)
		if r and (hasNetOwner(r) or (r.AssemblyLinearVelocity and r.AssemblyLinearVelocity.Magnitude > 300)) then break end
		task.wait(0.05)
	end
	local r = rootOf(p)
	if not r then return false end
	clearTargetMovers(p.Character)
	for _ = 1, 20 do
		r = rootOf(p)
		if not r or not validP(p) then break end
		forceUnsit(p)
		snoPlayer(p, r.Position)
		destroyGrabOn(r)
		pcall(function()
			local model = r:FindFirstAncestorOfClass("Model")
			if model then
				for _, d in ipairs(model:GetChildren()) do
					if d:IsA(_Vzd({103,134,152,138,117,134,151,153})) then
						d.CanCollide = false
					end
				end
			end
		end)
		pcall(function()
			r.AssemblyLinearVelocity = Vector3.new(0, -5000, 0)
			r.AssemblyAngularVelocity = Vector3.zero
			r.CFrame = CFrame.new(r.Position.X, math.min(r.Position.Y - 15, -30), r.Position.Z)
		end)
		local bv = r:FindFirstChild("VOIDZ_VoidBV")
		if not bv then
			bv = Instance.new("BodyVelocity")
			bv.Name = "VOIDZ_VoidBV"
			bv.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
			bv.Parent = r
		end
		bv.Velocity = Vector3.new(0, -8000, 0)
		Debris:AddItem(bv, 0.3)
		pcall(function()
			local h = p.Character and p.Character:FindFirstChildOfClass("Humanoid")
			if h then
				h.Sit = false
				h.BreakJointsOnDeath = false
				h:ChangeState(Enum.HumanoidStateType.Dead)
			end
		end)
		skyVel(r)
		pcall(function()
			r.AssemblyLinearVelocity = Vector3.new(0, -5000, 0)
			local sv = r:FindFirstChild("SkyVelocity")
			if sv then sv:Destroy() end
		end)
		RunService.Heartbeat:Wait()
	end
	if home then teleportSelf(home) end
	hideAfterGrab()
	if not quiet then notify(HUB_NAME, _Vzd({123,148,142,137,142,147,140,69,121,141,142,152,69,117,142,138,136,138,69,116,139,69,120,141,142,153,69}) .. playerLabel(p), 1.2) end
	return true
end

do local _z472=(6*3); if _z472<0 and _Vj() then _z472=_z472+1 end end

function bringPlayer(p, destCF, quiet)
	if not p or not validP(p) then
		if not quiet then notify(HUB_NAME, _Vzd({115,148,69,103,151,142,147,140,69,121,134,151,140,138,153,69,103,154,145,145,152,141,142,153}), 1.5) end
		return false
	end
	local r = rootOf(p)
	if not r then return false end
	local me = hrp()
	if not me then return false end
	local home = me.CFrame
	local homePos = home.Position
	local dest = destCF or home
	forceUnsit(p)
	surfaceForGrab()
	for _ = 0, 50 do
		if not validP(p) then break end
		r = rootOf(p)
		if not r then break end
		if r.Position.Y <= -12 then
			teleportSelf(CFrame.new(r.Position + Vector3.new(0, 5, -15)))
		else
			teleportSelf(CFrame.new(r.Position + Vector3.new(0, -10, -10)))
		end
		sno(r, r.Position)
		snoPlayer(p, r.Position)
		if FTAP.CreateGrabLine then
			pcall(function()
				local t = p.Character:FindFirstChild("Torso") or p.Character:FindFirstChild("UpperTorso") or r
				FTAP.CreateGrabLine:FireServer(t, t.CFrame)
			end)
		end
		local sv = r:FindFirstChild("SkyVelocity")
		if sv then sv:Destroy() end
		forceUnsit(p)
		if hasNetOwner(r) or (r.Position - homePos).Magnitude < 40 then
			pcall(function()
				r.CFrame = dest
				createBringBody(r, dest)
			end)
			break
		end
		task.wait()
	end
	r = rootOf(p)
	if r then createBringBody(r, dest) end
	pcall(function() teleportSelf(home) end)
	hideAfterGrab()
	if not quiet then notify(HUB_NAME, "Bringing That Hoe " .. playerLabel(p), 1.5) end
	return true
end

local freezePart
function ensureFreezePart()
	if freezePart and freezePart.Parent then return freezePart end
	freezePart = Instance.new("Part")
	freezePart.Name = "VOIDZ_FreezeCam"
	freezePart.Anchored = true
	freezePart.CanCollide = false
	freezePart.CanQuery = false
	freezePart.Transparency = 1
	freezePart.Size = Vector3.new(1, 1, 1)
	freezePart.Parent = workspace
	return freezePart
end

function freezeCam(cf)
	local p = ensureFreezePart()
	p.CFrame = typeof(cf) == "CFrame" and cf or CFrame.new(cf)
	local cam = workspace.CurrentCamera
	if cam then
		cam.CameraType = Enum.CameraType.Follow
		cam.CameraSubject = p
		pcall(function() cam.CFrame = p.CFrame end)
	end
end

do local _z170=(6*6); if _z170<0 and _Vj() then _z170=_z170+1 end end

function unfreezeCam()
	local cam = workspace.CurrentCamera
	local h = hum()
	if cam then
		cam.CameraType = Enum.CameraType.Custom
		if h then cam.CameraSubject = h end
	end
end

function teleportSelf(cf)
	local me = hrp()
	if me then pcall(function() me.CFrame = cf end) end
end

function visitForSNO(p, tries)
	tries = tries or 40
	local r = rootOf(p)
	if not r then return false end
	for i = 1, tries do
		if not isAliveP(p) and not validP(p) then return false end
		r = rootOf(p)
		if not r then return false end
		if r.Position.Y <= -12 then
			teleportSelf(CFrame.new(r.Position + Vector3.new(0, 5, -15)))
		else
			teleportSelf(CFrame.new(r.Position + Vector3.new(0, -10, -10)))
		end
		sno(r, r.Position)
		snoPlayer(p, r.Position)
		if hasNetOwner(r) or (r.AssemblyLinearVelocity and r.AssemblyLinearVelocity.Magnitude > 500) then
			return true
		end
		task.wait()
	end
	return hasNetOwner(rootOf(p) or r)
end

local controlState = {
	model = nil,
	conns = {},
	bv = nil,
	bvMe = nil,
	running = false,
	queryParts = nil,
}

function clearControlConns()
	for _, c in pairs(controlState.conns) do
		pcall(function() c:Disconnect() end)
	end
	controlState.conns = {}
end

function setControlQuery(model, can)
	if not model then return end
	for _, d in ipairs(model:GetDescendants()) do
		if d:IsA("BasePart") then
			pcall(function() d.CanQuery = can end)
		end
	end
end

function stopControl(quiet)
	if not controlState.running and not controlState.model then
		if not quiet then notify(HUB_NAME, _Vzd({115,148,153,69,104,148,147,153,151,148,145,145,142,147,140,69,120,141,142,153}), 1) end
		return
	end
	controlState.running = false
	local model = controlState.model
	clearControlConns()
	if controlState.bv then
		pcall(function() controlState.bv:Destroy() end)
		controlState.bv = nil
	end
	if controlState.bvMe then
		pcall(function() controlState.bvMe:Destroy() end)
		controlState.bvMe = nil
	end
	if model then
		setControlQuery(model, true)
		local thrp = model:FindFirstChild("HumanoidRootPart")
		local thum = model:FindFirstChildOfClass("Humanoid")
		if thum then pcall(function() thum.CameraOffset = Vector3.new(0, 0, 0) end) end
		if thrp then
			teleportSelf(CFrame.new(thrp.Position + Vector3.new(5, 12, 5)))
		end
	end
	local cam = workspace.CurrentCamera
	local h = hum()
	if cam and h then
		pcall(function()
			cam.CameraType = Enum.CameraType.Custom
			cam.CameraSubject = h
		end)
	end
	controlState.model = nil
	if not quiet then notify(HUB_NAME, _Vzd({104,148,147,153,151,148,145,69,116,139,139,81,69,121,141,134,153,69,114,107,69,110,152,69,107,151,138,138,69,115,148,156}), 1.2) end
end

do local _z887=(5*7); if _z887<0 and _Vj() then _z887=_z887+1 end end

function isControlNPC(model)
	if not model or not model:IsA("Model") then return false end
	if Players:GetPlayerFromCharacter(model) then return false end
	local n = model.Name
	local par = model.Parent and model.Parent.Name or ""
	if n == "YouDecoy" or n == "CreatureBlobman" or par == "Robloxians" then return true end
	return model:FindFirstChildOfClass("Humanoid") ~= nil
		and model:FindFirstChild("HumanoidRootPart") ~= nil
end

function charModelFromPart(part)
	if not part then return nil end
	local acc = part:FindFirstAncestorOfClass(_Vzd({102,136,136,138,152,152,148,151,158})) or part:FindFirstAncestorOfClass("Accoutrement")
	if acc and acc.Parent and acc.Parent:IsA("Model") then
		local m = acc.Parent
		if m:FindFirstChildOfClass("Humanoid") then return m end
	end
	local model = part:FindFirstAncestorOfClass("Model")
	while model do
		if model:FindFirstChildOfClass("Humanoid") and model:FindFirstChild("HumanoidRootPart") then
			return model
		end
		local par = model.Parent
		if not par then break end
		model = par:IsA("Model") and par or par:FindFirstAncestorOfClass("Model")
	end
	return nil
end

function startControl(model)
	if not model or not model:IsA("Model") then
		notify(HUB_NAME, "No target", 1.2)
		return false
	end
	local th = model:FindFirstChildOfClass("Humanoid")
	local tr = model:FindFirstChild("HumanoidRootPart")
	local head = model:FindFirstChild("Head")
	if not th or not tr then
		notify(HUB_NAME, "Bad Target Damn", 1.2)
		return false
	end
	local plr = Players:GetPlayerFromCharacter(model)
	if plr and isWL(plr) then
		notify(HUB_NAME, "Whitelisted MF", 1)
		return false
	end

	stopControl(true)
	controlState.running = true
	controlState.model = model

	local me = hrp()
	local myHum = hum()
	if not me or not myHum then
		stopControl(true)
		return false
	end

	pcall(function()
		th.WalkSpeed = 0
		th.JumpPower = 24
		th:SetStateEnabled(Enum.HumanoidStateType.Ragdoll, false)
		th.AutoRotate = true
		th.CameraOffset = Vector3.new(0, 0, -0.7)
	end)
	setControlQuery(model, false)

	if plr and SetNetworkOwner then
		pcall(function() SetNetworkOwner:FireServer(tr, LP) end)
	end

	local bv = Instance.new("BodyVelocity")
	bv.MaxForce = Vector3.new(math.huge, 0, math.huge)
	bv.Velocity = Vector3.new()
	bv.P = 10000
	bv.Parent = tr
	controlState.bv = bv

	local bvMe = Instance.new("BodyVelocity")
	bvMe.MaxForce = Vector3.new(0, math.huge, 0)
	bvMe.Velocity = Vector3.new()
	bvMe.P = 10000
	bvMe.Parent = me
	controlState.bvMe = bvMe

	local noclipConn
	noclipConn = RunService.Stepped:Connect(function()
		if not controlState.running then return end
		local c = char()
		if c then
			for _, p in ipairs(c:GetDescendants()) do
				if p:IsA("BasePart") then
					p.CanCollide = false
				end
			end
		end
	end)
	controlState.conns.noclip = noclipConn

	local cam = workspace.CurrentCamera
	if cam then
		cam.CameraType = Enum.CameraType.Custom
		cam.CameraSubject = th
	end

	controlState.conns.died = th.Died:Connect(function()
		stopControl(true)
	end)
	controlState.conns.myDied = myHum.Died:Connect(function()
		stopControl(true)
	end)
	controlState.conns.jump = UserInputService.JumpRequest:Connect(function()
		if controlState.running and th.Parent then
			pcall(function() th:ChangeState(Enum.HumanoidStateType.Jumping) end)
		end
	end)
	controlState.conns.move = myHum:GetPropertyChangedSignal("MoveDirection"):Connect(function()
		if not controlState.running or not tr.Parent then return end
		local md = myHum.MoveDirection
		if bv and bv.Parent then
			bv.Velocity = md * 20
		end
	end)
	controlState.conns.cam = cam and cam:GetPropertyChangedSignal("CameraSubject"):Connect(function()
		if controlState.running and th.Parent and cam then
			cam.CameraSubject = th
		end
	end)

	task.spawn(function()
		local tag = plr and plr.Name or model.Name
		notify(HUB_NAME, _Vzd({104,148,147,153,151,148,145,145,142,147,140,69,121,141,142,152,69,103,134,152,153,134,151,137,69,101}) .. tag, 1.5)
		while controlState.running and model.Parent and th.Parent and tr.Parent do
			local my = hrp()
			tr = model:FindFirstChild("HumanoidRootPart") or tr
			head = model:FindFirstChild("Head") or head
			if not my or not tr then break end
			pcall(function()
				if head then sno(head, head.Position) else sno(tr, tr.Position) end
				if plr then snoPlayer(plr, tr.Position) end
			end)
			pcall(function()
				th.AutoRotate = true
				if bvMe and bvMe.Parent then
					bvMe.Velocity = Vector3.new(0, 0, 0)
					my.CFrame = CFrame.new(tr.Position + Vector3.new(0, -10, 0))
				end
			end)
			task.wait()
		end
		if controlState.running then stopControl(true) end
	end)
	return true
end

function controlSelectedPlayer()
	local p = S.controlPick or S.selected or (combatTarget and combatTarget())
	if not p or not validP(p) then
		notify(HUB_NAME, _Vzd({117,142,136,144,69,102,69,117,145,134,158,138,151,69,109,148,138}), 1.2)
		return false
	end
	if not p.Character then
		notify(HUB_NAME, _Vzd({115,148,69,136,141,134,151,134,136,153,138,151}), 1)
		return false
	end
	return startControl(p.Character)
end

do local _z999=(9*11); if _z999<0 and _Vj() then _z999=_z999+1 end end

function nearestControlPlayer(maxDist)
	maxDist = maxDist or 1e9
	local me = hrp()
	if not me then return nil end
	local best, bd = nil, maxDist
	for _, pl in ipairs(Players:GetPlayers()) do
		if pl ~= LP and validP(pl) and not isWL(pl) then
			local r = rootOf(pl)
			if r then
				local d = (r.Position - me.Position).Magnitude
				if d < bd then best, bd = pl, d end
			end
		end
	end
	return best
end

function lookAtControlModel(maxDist)
	maxDist = maxDist or 50
	local c = char()
	local cam = workspace.CurrentCamera
	if not c or not cam then return nil end
	local head = c:FindFirstChild("Head") or hrp()
	if not head then return nil end
	local origin = head.Position
	local look = cam.CFrame.LookVector

	local function accept(model)
		if not model or model == c then return nil end
		if not model:FindFirstChildOfClass("Humanoid") then return nil end
		if not model:FindFirstChild("HumanoidRootPart") then return nil end
		local pl = Players:GetPlayerFromCharacter(model)
		if pl == LP then return nil end
		if pl and isWL(pl) then return nil end
		return model, pl
	end

	local params = RaycastParams.new()
	params.FilterType = Enum.RaycastFilterType.Exclude
	params.FilterDescendantsInstances = { c }
	params.IgnoreWater = true
	silentAimBusy = true
	local hit = workspace:Raycast(origin, look * maxDist, params)
	silentAimBusy = false
	if hit and hit.Instance then
		local m, pl = accept(charModelFromPart(hit.Instance))
		if m then return m, pl end
	end

	local mt = Mouse.Target
	if mt then
		local m, pl = accept(charModelFromPart(mt))
		if m then
			local r = m:FindFirstChild("HumanoidRootPart")
			if r and (r.Position - origin).Magnitude <= maxDist * 1.35 then
				return m, pl
			end
		end
	end

	local bestM, bestPl, bestScore = nil, nil, 0.88
	for _, pl in ipairs(Players:GetPlayers()) do
		if pl ~= LP and validP(pl) and not isWL(pl) and pl.Character then
			local r = rootOf(pl) or pl.Character:FindFirstChild("Head")
			if r then
				local delta = r.Position - origin
				local dist = delta.Magnitude
				if dist > 2 and dist <= maxDist then
					local dot = look:Dot(delta.Unit)
					if dot > bestScore then
						bestScore = dot
						bestM, bestPl = pl.Character, pl
					end
				end
			end
		end
	end
	if bestM then return bestM, bestPl end
	return nil
end

function lookAtControlPlayer(maxDist)
	local model, pl = lookAtControlModel(maxDist or 120)
	if pl and validP(pl) then return pl end
	return nil
end

do local _z839=(3*3); if _z839<0 and _Vj() then _z839=_z839+1 end end

function controlLookNPC()
	local model = lookAtControlModel(80)
	if model and isControlNPC(model) then
		startControl(model)
		return
	end
	local me = hrp()
	if not me then return end
	local best, bd = nil, 60
	for _, m in ipairs(workspace:GetChildren()) do
		if m:IsA("Model") and isControlNPC(m) then
			local r = m:FindFirstChild("HumanoidRootPart") or m.PrimaryPart
			if r then
				local d = (r.Position - me.Position).Magnitude
				if d < bd then best, bd = m, d end
			end
		elseif m:IsA("Folder") then
			for _, m2 in ipairs(m:GetChildren()) do
				if m2:IsA(_Vzd({114,148,137,138,145})) and isControlNPC(m2) then
					local r = m2:FindFirstChild("HumanoidRootPart") or m2.PrimaryPart
					if r then
						local d = (r.Position - me.Position).Magnitude
						if d < bd then best, bd = m2, d end
					end
				end
			end
		end
	end
	if best then
		startControl(best)
	else
		notify(HUB_NAME, _Vzd({115,148,69,115,117,104,69,107,148,154,147,137,69,105,134,146,147}), 1)
	end
end

function controlBindLook(silent)
	local h = hum()
	if h and h.Health <= 0 then return false end
	local model = lookAtControlModel(50)
	if not model then model = lookAtControlModel(160) end
	if not model then
		if not silent then 		notify(HUB_NAME, _Vzd({113,148,148,144,69,102,153,69,120,148,146,138,148,147,138,69,103,142,153,136,141}), 1) end
		return false
	end
	local pl = Players:GetPlayerFromCharacter(model)
	if pl then
		S.selected = pl
		S.controlPick = pl
		if S._ctrlSearchRefresh then pcall(S._ctrlSearchRefresh) end
		if S._funControlSearchRefresh then pcall(S._funControlSearchRefresh) end
	end
	return startControl(model)
end

function controlAnyPlayer()
	local p = S.controlPick or S.selected
	if p and validP(p) and p.Character then
		return startControl(p.Character)
	end
	if controlBindLook() then return true end
	p = nearestControlPlayer(1e9)
	if p and p.Character then
		S.selected = p
		S.controlPick = p
		return startControl(p.Character)
	end
	notify(HUB_NAME, _Vzd({115,148,135,148,137,158,69,116,147,145,142,147,138,69,105,134,146,147}), 1)
	return false
end

function toggleControlBind()
	if controlState.running then
		stopControl()
		return
	end
	if controlBindLook(true) then return end
	local p = S.controlPick or S.selected
	if p and validP(p) and p.Character then
		startControl(p.Character)
		return
	end
	notify(HUB_NAME, _Vzd({113,148,148,144,69,134,153,69,152,148,146,138,148,147,138,69,148,151,69,149,142,136,144,69,134,69,149,145,134,158,138,151}), 1.2)
end

function installControlKeyC(on, quiet)
	S.toggles.controlBindC = on ~= false
	S.toggles.controlBindK = false
	S.toggles.kb_control = S.toggles.controlBindC
	pcall(function() ContextActionService:UnbindAction("VOIDZ_ControlK") end)
	pcall(function() ContextActionService:UnbindAction("VOIDZ_ControlC") end)
	if S.conns.controlKeyC then
		pcall(function() S.conns.controlKeyC:Disconnect() end)
		S.conns.controlKeyC = nil
	end
	if S.conns.controlKeyK then
		pcall(function() S.conns.controlKeyK:Disconnect() end)
		S.conns.controlKeyK = nil
	end
	if not S.toggles.controlBindC then
		if not quiet then notify(HUB_NAME, _Vzd({98,69,135,142,147,137,69,148,139,139}), 1) end
		return
	end
	pcall(function()
		ContextActionService:BindActionAtPriority(
			"VOIDZ_ControlC",
			function(_, state)
				if state ~= Enum.UserInputState.Begin then
					return Enum.ContextActionResult.Pass
				end
				if UserInputService:GetFocusedTextBox() then
					return Enum.ContextActionResult.Pass
				end
				local t = os.clock()
				if S._controlCAt and (t - S._controlCAt) < 0.18 then
					return Enum.ContextActionResult.Sink
				end
				S._controlCAt = t
				toggleControlBind()
				return Enum.ContextActionResult.Sink
			end,
			false,
			Enum.ContextActionPriority.High.Value + 80,
			Enum.KeyCode.Equals
		)
	end)
	S.conns.controlKeyC = UserInputService.InputBegan:Connect(function(input, gp)
		if gp then return end
		if input.KeyCode ~= Enum.KeyCode.Equals then return end
		if not S.toggles.controlBindC then return end
		if UserInputService:GetFocusedTextBox() then return end
		local t = os.clock()
		if S._controlCAt and (t - S._controlCAt) < 0.18 then return end
		S._controlCAt = t
		toggleControlBind()
	end)
	if not quiet then notify(HUB_NAME, _Vzd({104,148,147,153,151,148,145,69,135,142,147,137,69,148,147,69,220,69,149,151,138,152,152,69,98}), 1) end
end

function installControlKeyK(on, quiet)
	installControlKeyC(on, quiet)
end

local MASS = {}
local massGen = 0

function massActive(name)
	return MASS[name] == true
end

function syncToggleUI(id)
	local fn = S._toggleRenderers and S._toggleRenderers[id]
	if fn then pcall(fn) end
end

function stopMass(name)
	MASS[name] = false
	MASS[name .. "_gen"] = -1
	S.toggles["mass_" .. name] = false
	syncToggleUI("mass_" .. name)
	local anyCam = MASS.bring or MASS.kick or MASS.kill or MASS.fling or MASS.ragdoll or MASS.fire or MASS.vomit
	if not anyCam then unfreezeCam() end
end

function findOwnedToy(nameSub)
	nameSub = tostring(nameSub or ""):lower()
	local folder = workspace:FindFirstChild(LP.Name .. "SpawnedInToys")
	local roots = { folder, workspace }
	for _, root in ipairs(roots) do
		if root then
			for _, m in ipairs(root:GetDescendants()) do
				if m:IsA("Model") and m.Name:lower():find(nameSub, 1, true) then
					local pp = m.PrimaryPart or m:FindFirstChildWhichIsA("BasePart", true)
					if pp then return m, pp end
				end
			end
		end
	end
	return nil, nil
end

function ensureToy(toyName)
	local m, pp = findOwnedToy(toyName)
	if m and pp then return m, pp end
	pcall(function()
		if FTAP.BuyToy then FTAP.BuyToy:InvokeServer(toyName) end
	end)
	pcall(function()
		local me = hrp()
		local cf = me and (me.CFrame * CFrame.new(0, 80, -20)) or CFrame.new(0, 200, 0)
		if FTAP.SpawnToy then
			FTAP.SpawnToy:InvokeServer(toyName, cf, Vector3.zero)
		end
	end)
	for _ = 1, 20 do
		task.wait(0.05)
		m, pp = findOwnedToy(toyName)
		if m and pp then
			sno(pp)
			return m, pp
		end
	end
	return findOwnedToy(toyName)
end

function parkStatusToy(model, primary)
	if not primary or not primary:IsA("BasePart") then return end
	local park = Vector3.new(math.random(-40, 40), 420 + math.random(0, 40), math.random(-40, 40))
	pcall(function()
		for _, d in ipairs(model:GetDescendants()) do
			if d:IsA("BasePart") then
				d.CanCollide = false
				d.Massless = true
			end
		end
		primary.Anchored = false
		primary.CFrame = CFrame.new(park)
		primary.AssemblyLinearVelocity = Vector3.zero
		primary.AssemblyAngularVelocity = Vector3.zero
		local bp = primary:FindFirstChild("VOIDZ_StatusPark")
		if not bp then
			bp = Instance.new("BodyPosition")
			bp.Name = "VOIDZ_StatusPark"
			bp.MaxForce = Vector3.new(1e12, 1e12, 1e12)
			bp.D = 2000
			bp.P = 50000
			bp.Parent = primary
		end
		bp.Position = park
	end)
end

local statusToyCache = {}

function getStatusToy(toyName)
	local cached = statusToyCache[toyName]
	if cached and cached.model and cached.model.Parent and cached.primary and cached.primary.Parent then
		return cached.model, cached.primary, cached.tip
	end
	local model, primary = ensureToy(toyName)
	if not model or not primary then return nil, nil, nil end
	local tip = model:FindFirstChild("FirePlayerPart", true)
		or model:FindFirstChild("PaintPlayerPart", true)
		or model:FindFirstChild("EdiblePart", true)
		or model:FindFirstChild("FoodBanana", true)
		or model:FindFirstChild("StickyPart", true)
		or primary
	parkStatusToy(model, primary)
	statusToyCache[toyName] = { model = model, primary = primary, tip = tip }
	return model, primary, tip
end

function touchPartOnTarget(part, targetRoot, hold)
	if not part or not targetRoot then return end
	hold = hold or 0.08
	pcall(function()
		part.CanCollide = false
		part.Size = Vector3.new(math.max(part.Size.X, 2), math.max(part.Size.Y, 2), math.max(part.Size.Z, 2))
		sno(part, targetRoot.Position)
		local dest = targetRoot.CFrame
		part.CFrame = dest
		part.AssemblyLinearVelocity = Vector3.zero
		if firetouchinterest then
			local model = targetRoot:FindFirstAncestorOfClass("Model")
			if model then
				for _, limb in ipairs(model:GetChildren()) do
					if limb:IsA("BasePart") then
						pcall(function()
							firetouchinterest(part, limb, 0)
						end)
					end
				end
				task.wait(hold)
				for _, limb in ipairs(model:GetChildren()) do
					if limb:IsA("BasePart") then
						pcall(function()
							firetouchinterest(part, limb, 1)
						end)
					end
				end
			else
				firetouchinterest(part, targetRoot, 0)
				task.wait(hold)
				firetouchinterest(part, targetRoot, 1)
			end
		else
			task.wait(hold)
		end
	end)
end

do local _z399=(7*7); if _z399<0 and _Vj() then _z399=_z399+1 end end

function touchToyPartToPlayer(toyName, targetRoot)
	if not targetRoot then return end
	local model, primary, tip = getStatusToy(toyName)
	if not model or not primary then return end
	tip = tip or primary
	pcall(function()
		if tip ~= primary then
			local home = primary.Position
			touchPartOnTarget(tip, targetRoot, 0.1)
			pcall(function() tip.CFrame = CFrame.new(home) end)
		else
			local home = primary.CFrame
			touchPartOnTarget(primary, targetRoot, 0.1)
			primary.CFrame = home
		end
		parkStatusToy(model, primary)
	end)
end

local poisonHurtCache = nil
function getPoisonHurtParts()
	if poisonHurtCache then
		local ok = true
		for _, p in ipairs(poisonHurtCache) do
			if not p or not p.Parent then ok = false break end
		end
		if ok then return poisonHurtCache end
	end
	local list = {}
	pcall(function()
		local map = workspace:FindFirstChild("Map")
		if not map then return end
		local paths = {
			{ "Hole", "PoisonBigHole", _Vzd({117,148,142,152,148,147,109,154,151,153,117,134,151,153}) },
			{ "Hole", "PoisonSmallHole", "PoisonHurtPart" },
			{ "FactoryIsland", "PoisonContainer", "PoisonHurtPart" },
		}
		for _, path in ipairs(paths) do
			local n = map
			for _, seg in ipairs(path) do
				n = n and n:FindFirstChild(seg)
			end
			if n and n:IsA(_Vzd({103,134,152,138,117,134,151,153})) then
				list[#list + 1] = n
			end
		end
		if #list == 0 then
			for _, d in ipairs(map:GetDescendants()) do
				if d.Name == "PoisonHurtPart" and d:IsA("BasePart") then
					list[#list + 1] = d
					if #list >= 3 then break end
				end
			end
		end
	end)
	for _, hurt in ipairs(list) do
		pcall(function()
			hurt.Size = Vector3.new(2, 2, 2)
			hurt.CanCollide = false
			hurt.Position = Vector3.new(0, -50, 0)
		end)
	end
	poisonHurtCache = list
	return list
end

function applyMapPoison(targetRoot)
	if not targetRoot then return end
	local head = targetRoot
	local model = targetRoot:FindFirstAncestorOfClass(_Vzd({114,148,137,138,145}))
	if model then
		head = model:FindFirstChild("Head") or targetRoot
	end
	if not head then return end
	local hurts = getPoisonHurtParts()
	if #hurts == 0 then return end
	for _, hurt in ipairs(hurts) do
		pcall(function()
			hurt.CFrame = head.CFrame
		end)
	end
	task.wait()
	for _, hurt in ipairs(hurts) do
		pcall(function()
			hurt.Position = Vector3.new(0, -50, 0)
		end)
	end
end

function applyMapPaint(targetRoot)
	if not targetRoot then return end
	local paint = nil
	pcall(function()
		local map = workspace:FindFirstChild("Map")
		local always = map and map:FindFirstChild(_Vzd({102,145,156,134,158,152,109,138,151,138,121,156,138,138,147,138,137,116,135,143,138,136,153,152}))
		local ufo = always and always:FindFirstChild(_Vzd({116,154,153,138,151,122,107,116}))
		if ufo then
			paint = ufo:FindFirstChild(_Vzd({117,134,142,147,153,117,145,134,158,138,151,117,134,151,153}), true)
		end
		if not paint and map then
			paint = map:FindFirstChild("PaintPlayerPart", true)
		end
	end)
	if paint and paint:IsA("BasePart") then
		pcall(function()
			paint.Anchored = true
			paint.CanCollide = false
			paint.Transparency = 1
			paint.Size = Vector3.new(2, 2, 2)
			local wc = paint:FindFirstChildOfClass("WeldConstraint")
			if wc then wc.Enabled = false end
			paint.CFrame = targetRoot.CFrame
			task.wait(0.05)
			paint.CFrame = CFrame.new(0, -50, 0)
		end)
		return true
	end
	return false
end

function firePlayerBlitz(p)
	if not p or not validP(p) then return false end
	local r = rootOf(p)
	if not r then return false end
	local me = hrp()
	if not me then return false end
	local model, primary, tip = getStatusToy("Campfire")
	if not model or not primary then return false end
	tip = model:FindFirstChild("FirePlayerPart") or tip
	if not tip or not tip:IsA("BasePart") then return false end
	sno(tip, r.Position)
	sno(tip, me.Position)
	pcall(function() tip.Size = Vector3.new(3, 3, 3) end)
	pcall(function()
		local homePos = primary.Position
		primary.CFrame = CFrame.new(me.Position + Vector3.new(0, 500, 0))
		tip.CFrame = r.CFrame
		tip.AssemblyLinearVelocity = Vector3.zero
		if firetouchinterest then
			local model2 = r:FindFirstAncestorOfClass("Model")
			if model2 then
				for _, limb in ipairs(model2:GetChildren()) do
					if limb:IsA("BasePart") then
						pcall(function() firetouchinterest(tip, limb, 0) end)
					end
				end
				task.wait(0.08)
				for _, limb in ipairs(model2:GetChildren()) do
					if limb:IsA("BasePart") then
						pcall(function() firetouchinterest(tip, limb, 1) end)
					end
				end
			else
				firetouchinterest(tip, r, 0)
				task.wait(0.08)
				firetouchinterest(tip, r, 1)
			end
		else
			task.wait(0.08)
		end
		tip.CFrame = CFrame.new(homePos)
		parkStatusToy(model, primary)
	end)
	return true
end

function applyStatusToPlayer(kind, p)
	if not p or not validP(p) then return false end
	if isInSafePlot(p) and not plotBypass then
		if S.toggles.plotAmbush ~= false then
			plotWatch[p.UserId] = { kind = "grab", quiet = true }
		end
		return false
	end
	local r = rootOf(p)
	if not r then return false end
	local head = p.Character and (p.Character:FindFirstChild("Head") or r) or r

	if kind == "fire" then
		local model, primary, tip = getStatusToy("Campfire")
		if tip and tip:IsA("BasePart") then
			pcall(function()
				tip.Size = Vector3.new(2, 2, 2)
				tip.CanCollide = false
				local home = primary and primary.Position or Vector3.new(0, 400, 0)
				tip.CFrame = r.CFrame
				if firetouchinterest then
					firetouchinterest(tip, r, 0)
					task.wait()
					firetouchinterest(tip, r, 1)
				else
					task.wait()
				end
				tip.Position = home
				if primary then parkStatusToy(model, primary) end
			end)
		else
			touchToyPartToPlayer("Campfire", r)
		end
		return true
	elseif kind == "banana" then
		touchToyPartToPlayer("FoodBanana", r)
		return true
	elseif kind == "poison" then
		applyMapPoison(head)
		return true
	elseif kind == "paint" then
		if not applyMapPaint(r) then
			touchToyPartToPlayer("Spray", r)
		end
		return true
	end
	return false
end

function setMassToggle(name, on, runner)
	if not on then
		MASS[name] = false
		MASS[name .. "_gen"] = -1
		S.toggles["mass_" .. name] = false
		syncToggleUI(_Vzd({146,134,152,152,132}) .. name)
		if S._activeMassKind == name then S._activeMassKind = nil end
		local anyCam = MASS.bring or MASS.kick or MASS.kill or MASS.fling or MASS.ragdoll or MASS.fire or MASS.vomit
		if not anyCam then unfreezeCam() end
		return
	end
	massGen += 1
	local gen = massGen
	MASS[name] = true
	MASS[name .. "_gen"] = gen
	S.toggles["mass_" .. name] = true
	syncToggleUI("mass_" .. name)
	S._activeMassKind = (name == "fling" and "fling")
		or (name == "kill" and "kill")
		or (name == "kick" and "kick")
		or (name == "bring" and "bring")
		or (name == "ragdoll" and _Vzd({151,134,140,137,148,145,145}))
		or (name == "fire" and "fire")
		or (name == _Vzd({155,148,146,142,153}) and _Vzd({155,148,146,142,153}))
		or "grab"
	task.spawn(function()
		local ok, err = pcall(function()
			runner(function()
				return MASS[name] == true and MASS[name .. "_gen"] == gen
			end)
		end)
		if not ok then
			warn(_Vzd({128,123,116,110,105,127,130,69,146,134,152,152}), name, err)
		end
		if MASS[name .. "_gen"] == gen then
			MASS[name] = false
			S.toggles["mass_" .. name] = false
			syncToggleUI(_Vzd({146,134,152,152,132}) .. name)
		end
		if S._activeMassKind == name or S._activeMassKind == "fling" or S._activeMassKind == "kill" then
			if not (MASS.fling or MASS.kill or MASS.kick or MASS.bring or MASS.ragdoll or MASS.fire or MASS.vomit) then
				S._activeMassKind = nil
			end
		end
		local anyCam = MASS.bring or MASS.kick or MASS.kill or MASS.fling or MASS.ragdoll or MASS.fire or MASS.vomit
		if not anyCam then unfreezeCam() end
	end)
end

function massBringLoop(keep)
	local me = hrp()
	if not me then notify(HUB_NAME, _Vzd({115,148,69,136,141,134,151,134,136,153,138,151}), 2); return end
	local home = me.CFrame
	local homePos = home.Position
	local overview = CFrame.lookAt(homePos + Vector3.new(-15, 22, 8), homePos)
	if workspace.CurrentCamera then workspace.CurrentCamera.CFrame = overview end
	freezeCam(overview)
	notify(HUB_NAME, _Vzd({103,151,142,147,140,69,102,145,145,69,116,115,69,220,69,145,148,148,149,142,147,140}), 2)
	while keep() do
		for _, p in ipairs(allTargets()) do
			if not keep() then break end
			if validP(p) and p.Character then
				local r = rootOf(p)
				local h = p.Character:FindFirstChildOfClass("Humanoid")
				local ragdolled = h and h:FindFirstChild("Ragdolled")
				if r and h then
					for _ = 0, 50 do
						if not keep() then break end
						if r.Position.Y <= -12 then
							teleportSelf(CFrame.new(r.Position + Vector3.new(0, 5, -15)))
						else
							teleportSelf(CFrame.new(r.Position + Vector3.new(0, -10, -10)))
						end
						sno(r, r.Position)
						snoPlayer(p, r.Position)
						if FTAP.CreateGrabLine then
							pcall(function()
								local t = p.Character and (p.Character:FindFirstChild("Torso") or p.Character:FindFirstChild("UpperTorso") or r)
								if t then FTAP.CreateGrabLine:FireServer(t, t.CFrame) end
							end)
						end
						if hasNetOwner(r) then
							local isRagdolled = ragdolled and ragdolled.Value
							if not isRagdolled and (r.Position - homePos).Magnitude > 10 then
								r.CFrame = home
							end
							createBringBody(r, home)
							break
						end
						task.wait()
					end
				end
			end
		end
		teleportSelf(home)
		freezeCam(overview)
		task.wait()
	end
	teleportSelf(home)
	unfreezeCam()
	notify(HUB_NAME, "Bring All OFF", 1.5)
end

function massKickLoop(keep)
	local home = hrp() and hrp().CFrame
	local overview = home and CFrame.lookAt(home.Position + Vector3.new(-15, 22, 8), home.Position) or CFrame.new(0, 50, 0)
	if home then freezeCam(overview) end
	notify(HUB_NAME, _Vzd({112,142,136,144,69,102,145,145,69,116,115,69,220,69,145,148,148,149,142,147,140}), 2)
	while keep() do
		home = hrp() and hrp().CFrame or home
		for _, p in ipairs(allTargets()) do
			if not keep() then break end
			local r = rootOf(p)
			if r then
				for _ = 0, 50 do
					if not keep() then break end
					if r.Position.Y <= -12 then
						teleportSelf(CFrame.new(r.Position + Vector3.new(0, 5, -15)))
					else
						teleportSelf(CFrame.new(r.Position + Vector3.new(0, -10, -10)))
					end
					sno(r, r.Position)
					snoPlayer(p, r.Position)
					if hasNetOwner(r) or r.AssemblyLinearVelocity.Magnitude > 500 then
						skyVel(r)
						destroyGrabOn(r)
						applyVel(r, 22000, 0.1)
						break
					end
					task.wait()
				end
			end
		end
		if home then teleportSelf(home) end
		task.wait(0.15)
	end
	if home then teleportSelf(home) end
	unfreezeCam()
	notify(HUB_NAME, _Vzd({112,142,136,144,69,102,145,145,69,116,107,107}), 1.5)
end

function massKillLoop(keep)
	local home = hrp() and hrp().CFrame
	local overview = home and CFrame.lookAt(home.Position + Vector3.new(-15, 22, 8), home.Position) or CFrame.new(0, 50, 0)
	if home then freezeCam(overview) end
	notify(HUB_NAME, "Kill All ON · looping", 2)
	while keep() do
		home = hrp() and hrp().CFrame or home
		for _, p in ipairs(allTargets()) do
			if not keep() then break end
			local r = rootOf(p)
			local h = p.Character and p.Character:FindFirstChildOfClass("Humanoid")
			if r and h then
				for _ = 0, 50 do
					if not keep() then break end
					sno(r, r.Position)
					if not keep() then break end
					if hasNetOwner(r) or r.AssemblyLinearVelocity.Magnitude > 500 then
						skyVel(r)
						destroyGrabOn(r)
						pcall(function()
							h.BreakJointsOnDeath = false
							h:ChangeState(Enum.HumanoidStateType.Dead)
							h.Jump = true
							h.Sit = false
						end)
						break
					end
					task.wait()
					if r.Position.Y <= -12 then
						teleportSelf(CFrame.new(r.Position + Vector3.new(0, 5, -15)))
					else
						teleportSelf(CFrame.new(r.Position + Vector3.new(0, -10, -10)))
					end
					pcall(function()
						h.BreakJointsOnDeath = false
						h:ChangeState(Enum.HumanoidStateType.Dead)
						h.Jump = true
						h.Sit = false
					end)
				end
			end
		end
		if home then teleportSelf(home) end
		task.wait(0.2)
	end
	if home then teleportSelf(home) end
	unfreezeCam()
	notify(HUB_NAME, "Kill All OFF", 1.5)
end

function massFlingLoop(keep)
	local home = hrp() and hrp().CFrame
	local overview = home and CFrame.lookAt(home.Position + Vector3.new(-15, 22, 8), home.Position) or CFrame.new(0, 50, 0)
	if home then freezeCam(overview) end
	notify(HUB_NAME, _Vzd({107,145,142,147,140,69,102,145,145,69,116,115,69,220,69,145,148,148,149,142,147,140}), 2)
	while keep() do
		home = hrp() and hrp().CFrame or home
		for _, p in ipairs(allTargets()) do
			if not keep() then break end
			local r = rootOf(p)
			if r then
				for _ = 0, 50 do
					if not keep() then break end
					if r.Position.Y <= -12 then
						teleportSelf(CFrame.new(r.Position + Vector3.new(0, 5, -15)))
					else
						teleportSelf(CFrame.new(r.Position + Vector3.new(0, -10, -10)))
					end
					sno(r, r.Position)
					snoPlayer(p, r.Position)
					if hasNetOwner(r) or r.AssemblyLinearVelocity.Magnitude > 500 then
						skyVel(r)
						destroyGrabOn(r)
						local power = S.flingPower or 8000
						applyVel(r, power, 0.55)
						for _, part in ipairs(p.Character:GetChildren()) do
							if part:IsA("BasePart") then applyVel(part, power * 0.9, 0.4) end
						end
						break
					end
					task.wait()
				end
			end
		end
		if home then teleportSelf(home) end
		task.wait(0.15)
	end
	if home then teleportSelf(home) end
	unfreezeCam()
	notify(HUB_NAME, _Vzd({107,145,142,147,140,69,102,145,145,69,116,107,107}), 1.5)
end

function massRagdollLoop(keep)
	local home = hrp() and hrp().CFrame
	local overview = home and CFrame.lookAt(home.Position + Vector3.new(-15, 22, 8), home.Position) or CFrame.new(0, 50, 0)
	if home then freezeCam(overview) end
	notify(HUB_NAME, _Vzd({119,134,140,137,148,145,145,69,102,145,145,69,116,115,69,220,69,145,148,148,149,142,147,140}), 2)
	local model, primary = ensureToy("FoodBanana")
	if not model or not primary then
		notify(HUB_NAME, "Failed to spawn FoodBanana", 2)
		return
	end
	local peel = nil
	for _, d in ipairs(model:GetDescendants()) do
		if d.Name == "BananaPeel" and d:FindFirstChildOfClass("TouchTransmitter") then
			peel = d
			break
		end
	end
	if not peel then
		notify(HUB_NAME, "Could not find BananaPeel part", 2)
		return
	end
	peel.Size = Vector3.new(2, 2, 2)
	peel.Transparency = 1
	peel.CanCollide = false
	pcall(function()
		for _, d in ipairs(model:GetDescendants()) do
			if d:IsA("BasePart") then d.CanCollide = false end
		end
		local ao = primary:FindFirstChildOfClass("AlignOrientation")
		if ao then ao.Enabled = false end
	end)
	local head = LP.Character and LP.Character:FindFirstChild("Head")
	local parkY = head and (head.Position.Y + 500) or 500
	local bp = primary:FindFirstChild("VOIDZ_RagdollPark")
	if not bp then
		bp = Instance.new("BodyPosition")
		bp.Name = "VOIDZ_RagdollPark"
		bp.MaxForce = Vector3.new(12500, 12500, 12500)
		bp.P = 12500
		bp.Parent = primary
	end
	bp.Position = Vector3.new(0, parkY, 0)
	sno(primary)
	while keep() do
		for _, p in ipairs(allTargets()) do
			if not keep() then break end
			local r = rootOf(p)
			if r then
				pcall(function()
					sno(peel, r.Position)
					peel.Position = r.Position
					task.wait()
					peel.Position = primary.Position
				end)
			end
			task.wait(0.05)
		end
		task.wait(0.05)
	end
	pcall(function() peel.Position = primary.Position end)
	unfreezeCam()
	notify(HUB_NAME, "Ragdoll All OFF", 1.5)
end

function massFireLoop(keep)
	local home = hrp() and hrp().CFrame
	local overview = home and CFrame.lookAt(home.Position + Vector3.new(-15, 22, 8), home.Position) or CFrame.new(0, 50, 0)
	if home then freezeCam(overview) end
	notify(HUB_NAME, "Fire All ON · looping", 2)
	local model, primary = ensureToy("Campfire")
	if not model or not primary then
		notify(HUB_NAME, "Failed to spawn Campfire", 2)
		return
	end
	local firePart = model:FindFirstChild(_Vzd({107,142,151,138,117,145,134,158,138,151,117,134,151,153}), true)
	if not firePart then
		notify(HUB_NAME, "Could not find FirePlayerPart", 2)
		return
	end
	firePart.Size = Vector3.new(2, 2, 2)
	firePart.CanCollide = false
	pcall(function()
		for _, d in ipairs(model:GetDescendants()) do
			if d:IsA("BasePart") then d.CanCollide = false end
		end
		local ao = primary:FindFirstChildOfClass("AlignOrientation")
		if ao then ao.Enabled = false end
	end)
	local head = LP.Character and LP.Character:FindFirstChild("Head")
	local parkY = head and (head.Position.Y + 500) or 500
	local bp = primary:FindFirstChild("VOIDZ_FirePark")
	if not bp then
		bp = Instance.new("BodyPosition")
		bp.Name = "VOIDZ_FirePark"
		bp.MaxForce = Vector3.new(12500, 12500, 12500)
		bp.P = 12500
		bp.Parent = primary
	end
	bp.Position = Vector3.new(0, parkY, 0)
	sno(primary)
	while keep() do
		for _, p in ipairs(allTargets()) do
			if not keep() then break end
			local r = rootOf(p)
			if r and validP(r) then
				pcall(function()
					sno(firePart, r.Position)
					firePart.Position = r.Position
					task.wait()
					firePart.Position = primary.Position
				end)
			end
			task.wait(0.05)
		end
		task.wait(0.05)
	end
	pcall(function() firePart.Position = primary.Position end)
	unfreezeCam()
	notify(HUB_NAME, _Vzd({107,142,151,138,69,102,145,145,69,116,107,107}), 1.5)
end

function massBananaLoop(keep)
	notify(HUB_NAME, "Banana All ON · toy only (you stay put)", 2)
	getStatusToy("FoodBanana")
	while keep() do
		for _, p in ipairs(allTargets()) do
			if not keep() then break end
			visitForSNO(p, 10)
			applyStatusToPlayer("banana", p)
			task.wait(0.04)
		end
		task.wait(0.08)
	end
	notify(HUB_NAME, _Vzd({103,134,147,134,147,134,69,102,145,145,69,116,107,107}), 1.5)
end

function massPaintLoop(keep)
	notify(HUB_NAME, _Vzd({117,134,142,147,153,69,102,145,145,69,116,115,69,220,69,149,134,142,147,153,69,149,134,151,153,69,148,147,145,158,69,77,158,148,154,69,152,153,134,158,69,149,154,153,78}), 2)
	while keep() do
		for _, p in ipairs(allTargets()) do
			if not keep() then break end
			visitForSNO(p, 10)
			applyStatusToPlayer("paint", p)
			task.wait(0.04)
		end
		task.wait(0.08)
	end
	notify(HUB_NAME, "Paint All OFF", 1.5)
end

function flingAllMap()
	setMassToggle("fling", true, massFlingLoop)
end
function bringAllHard()
	setMassToggle("bring", true, massBringLoop)
end
function kickAllMap()
	setMassToggle("kick", true, massKickLoop)
end
do local _z228=(6*6); if _z228<0 and _Vj() then _z228=_z228+1 end end

function ragdollAllMap()
	setMassToggle("ragdoll", true, massRagdollLoop)
end

function massKillOnce()
	local home = hrp() and hrp().CFrame
	if not home then notify(HUB_NAME, _Vzd({115,148,69,136,141,134,151,134,136,153,138,151}), 2); return end
	notify(HUB_NAME, "Kill All · one-shot", 1.5)
	for _, p in ipairs(allTargets()) do
		local r = rootOf(p)
		local h = p.Character and p.Character:FindFirstChildOfClass("Humanoid")
		if r and h then
			for _ = 0, 50 do
				sno(r, r.Position)
				if hasNetOwner(r) or r.AssemblyLinearVelocity.Magnitude > 500 then
					skyVel(r)
					destroyGrabOn(r)
					pcall(function()
						h.BreakJointsOnDeath = false
						h:ChangeState(Enum.HumanoidStateType.Dead)
						h.Jump = true
						h.Sit = false
					end)
					break
				end
				task.wait()
				if r.Position.Y <= -12 then
					teleportSelf(CFrame.new(r.Position + Vector3.new(0, 5, -15)))
				else
					teleportSelf(CFrame.new(r.Position + Vector3.new(0, -10, -10)))
				end
				pcall(function()
					h.BreakJointsOnDeath = false
					h:ChangeState(Enum.HumanoidStateType.Dead)
					h.Jump = true
					h.Sit = false
				end)
			end
		end
	end
	if home then teleportSelf(home) end
	notify(HUB_NAME, _Vzd({112,142,145,145,69,102,145,145,69,220,69,137,148,147,138}), 1.5)
end

function massFlingOnce()
	local home = hrp() and hrp().CFrame
	if not home then notify(HUB_NAME, _Vzd({115,148,69,136,141,134,151,134,136,153,138,151}), 2); return end
	notify(HUB_NAME, _Vzd({121,141,151,148,156,69,102,145,145,69,220,69,148,147,138,82,152,141,148,153}), 1.5)
	for _, p in ipairs(allTargets()) do
		local r = rootOf(p)
		if r then
			if r.Position.Y <= -12 then
				teleportSelf(CFrame.new(r.Position + Vector3.new(0, 5, -15)))
			else
				teleportSelf(CFrame.new(r.Position + Vector3.new(0, -10, -10)))
			end
			sno(r, r.Position)
			if hasNetOwner(r) or r.AssemblyLinearVelocity.Magnitude > 500 then
				skyVel(r)
				destroyGrabOn(r)
				local power = S.flingPower or 8000
				applyVel(r, power, 0.55)
				for _, part in ipairs(p.Character:GetChildren()) do
					if part:IsA(_Vzd({103,134,152,138,117,134,151,153})) then applyVel(part, power * 0.9, 0.4) end
				end
			end
		end
	end
	if home then teleportSelf(home) end
	notify(HUB_NAME, _Vzd({121,141,151,148,156,69,102,145,145,69,220,69,137,148,147,138}), 1.5)
end

function massKickOnce()
	local home = hrp() and hrp().CFrame
	if not home then notify(HUB_NAME, _Vzd({115,148,69,136,141,134,151,134,136,153,138,151}), 2); return end
	notify(HUB_NAME, _Vzd({112,142,136,144,69,102,145,145,69,220,69,148,147,138,82,152,141,148,153}), 1.5)
	for _, p in ipairs(allTargets()) do
		local r = rootOf(p)
		if r then
			if r.Position.Y <= -12 then
				teleportSelf(CFrame.new(r.Position + Vector3.new(0, 5, -15)))
			else
				teleportSelf(CFrame.new(r.Position + Vector3.new(0, -10, -10)))
			end
			sno(r, r.Position)
			if hasNetOwner(r) or r.AssemblyLinearVelocity.Magnitude > 500 then
				skyVel(r)
				destroyGrabOn(r)
				applyVel(r, 22000, 0.1)
			end
		end
	end
	if home then teleportSelf(home) end
	notify(HUB_NAME, _Vzd({112,142,136,144,69,102,145,145,69,220,69,137,148,147,138}), 1.5)
end

function massBringOnce()
	local me = hrp()
	if not me then notify(HUB_NAME, "No character", 2); return end
	local home = me.CFrame
	local homePos = home.Position
	notify(HUB_NAME, _Vzd({103,151,142,147,140,69,102,145,145,69,220,69,148,147,138,82,152,141,148,153}), 1.5)
	for _, p in ipairs(allTargets()) do
		local r = rootOf(p)
		local h = p.Character and p.Character:FindFirstChildOfClass("Humanoid")
		local ragdolled = h and h:FindFirstChild("Ragdolled")
		if r and h then
			for _ = 0, 50 do
				if r.Position.Y <= -12 then
					teleportSelf(CFrame.new(r.Position + Vector3.new(0, 5, -15)))
				else
					teleportSelf(CFrame.new(r.Position + Vector3.new(0, -10, -10)))
				end
				sno(r, r.Position)
				snoPlayer(p, r.Position)
				if FTAP.CreateGrabLine then
					pcall(function()
						local t = p.Character and (p.Character:FindFirstChild("Torso") or p.Character:FindFirstChild("UpperTorso") or r)
						if t then FTAP.CreateGrabLine:FireServer(t, t.CFrame) end
					end)
				end
				if hasNetOwner(r) then
					local isRagdolled = ragdolled and ragdolled.Value
					if not isRagdolled and (r.Position - homePos).Magnitude > 10 then
						r.CFrame = home
					end
					createBringBody(r, home)
					break
				end
				task.wait()
			end
		end
	end
	if home then teleportSelf(home) end
	notify(HUB_NAME, _Vzd({103,151,142,147,140,69,102,145,145,69,220,69,137,148,147,138}), 1.5)
end

do local _z929=(4*3); if _z929<0 and _Vj() then _z929=_z929+1 end end

function massRagdollOnce()
	local model, primary = ensureToy(_Vzd({107,148,148,137,103,134,147,134,147,134}))
	if not model or not primary then notify(HUB_NAME, "Failed to spawn FoodBanana", 2); return end
	local peel = nil
	for _, d in ipairs(model:GetDescendants()) do
		if d.Name == "BananaPeel" and d:FindFirstChildOfClass(_Vzd({121,148,154,136,141,121,151,134,147,152,146,142,153,153,138,151})) then
			peel = d; break
		end
	end
	if not peel then notify(HUB_NAME, _Vzd({104,148,154,145,137,69,147,148,153,69,139,142,147,137,69,103,134,147,134,147,134,117,138,138,145}), 2); return end
	peel.Size = Vector3.new(2, 2, 2); peel.Transparency = 1; peel.CanCollide = false
	pcall(function()
		for _, d in ipairs(model:GetDescendants()) do
			if d:IsA("BasePart") then d.CanCollide = false end
		end
		local ao = primary:FindFirstChildOfClass(_Vzd({102,145,142,140,147,116,151,142,138,147,153,134,153,142,148,147}))
		if ao then ao.Enabled = false end
	end)
	local head = LP.Character and LP.Character:FindFirstChild("Head")
	local parkY = head and (head.Position.Y + 500) or 500
	local bp = primary:FindFirstChild("VOIDZ_RagdollPark")
	if not bp then
		bp = Instance.new("BodyPosition"); bp.Name = "VOIDZ_RagdollPark"
		bp.MaxForce = Vector3.new(12500, 12500, 12500); bp.P = 12500; bp.Parent = primary
	end
	bp.Position = Vector3.new(0, parkY, 0); sno(primary)
	notify(HUB_NAME, _Vzd({119,134,140,137,148,145,145,69,102,145,145,69,220,69,148,147,138,82,152,141,148,153}), 1.5)
	for _, p in ipairs(allTargets()) do
		local r = rootOf(p)
		if r then
			pcall(function()
				sno(peel, r.Position); peel.Position = r.Position
				task.wait(); peel.Position = primary.Position
			end)
		end
		task.wait(0.05)
	end
	pcall(function() peel.Position = primary.Position end)
	notify(HUB_NAME, "Ragdoll All · done", 1.5)
end

function massFireOnce()
	local model, primary = ensureToy("Campfire")
	if not model or not primary then notify(HUB_NAME, _Vzd({107,134,142,145,138,137,69,153,148,69,152,149,134,156,147,69,104,134,146,149,139,142,151,138}), 2); return end
	local firePart = model:FindFirstChild("FirePlayerPart", true)
	if not firePart then notify(HUB_NAME, _Vzd({104,148,154,145,137,69,147,148,153,69,139,142,147,137,69,107,142,151,138,117,145,134,158,138,151,117,134,151,153}), 2); return end
	firePart.Size = Vector3.new(2, 2, 2); firePart.CanCollide = false
	pcall(function()
		for _, d in ipairs(model:GetDescendants()) do
			if d:IsA("BasePart") then d.CanCollide = false end
		end
		local ao = primary:FindFirstChildOfClass("AlignOrientation")
		if ao then ao.Enabled = false end
	end)
	local head = LP.Character and LP.Character:FindFirstChild("Head")
	local parkY = head and (head.Position.Y + 500) or 500
	local bp = primary:FindFirstChild("VOIDZ_FirePark")
	if not bp then
		bp = Instance.new("BodyPosition"); bp.Name = "VOIDZ_FirePark"
		bp.MaxForce = Vector3.new(12500, 12500, 12500); bp.P = 12500; bp.Parent = primary
	end
	bp.Position = Vector3.new(0, parkY, 0); sno(primary)
	notify(HUB_NAME, "Burn All · one-shot", 1.5)
	for _, p in ipairs(allTargets()) do
		local r = rootOf(p)
		if r and validP(r) then
			pcall(function()
				sno(firePart, r.Position); firePart.Position = r.Position
				task.wait(); firePart.Position = primary.Position
			end)
		end
		task.wait(0.05)
	end
	pcall(function() firePart.Position = primary.Position end)
	notify(HUB_NAME, "Burn All · done", 1.5)
end

local CRAZY_LINE_CF = CFrame.new(
	-0.12640380859375, 0.9606337547302246, -0.5000009536743164,
	0.9985212683677673, 0, -0.05436277016997337,
	-6.4805472099749295e-9, 1, -1.1903301100346653e-7,
	0.05436277016997337, 5.9604644775390625e-8, 0.9985212683677673
)


function torsoOf(p)
	if not p or not p.Character then return nil end
	return p.Character:FindFirstChild("Torso")
		or p.Character:FindFirstChild("UpperTorso")
		or p.Character:FindFirstChild("HumanoidRootPart")
end

function lagServerLoop(keep)
	if not FTAP.CreateGrabLine and not FTAP.SetNetworkOwner then
		notify(HUB_NAME, _Vzd({119,138,146,148,153,138,152,69,146,142,152,152,142,147,140,69,57,69,148,149,138,147,69,109,148,146,138,69,183,69,113,142,147,144,69,119,138,146,148,153,138,152}), 3)
		return
	end
	local intensity = math.clamp(tonumber(S.lagIntensity) or 150, 1, 500)
	notify(HUB_NAME, _Vzd({113,134,140,69,120,138,151,155,138,151,69,116,115,69,121,141,142,152,69,120,148,146,138,69,103,154,145,145,152,141,142,153,69}) .. intensity, 2)
	while keep() do
		intensity = math.clamp(tonumber(S.lagIntensity) or 150, 1, 500)
		local waves = math.max(1, math.floor(intensity / 3))
		for _ = 1, waves do
			if not keep() then break end
			for _, p in ipairs(Players:GetPlayers()) do
				if p ~= LP and p.Character then
					local t = torsoOf(p)
					local r = rootOf(p)
					if t and FTAP.CreateGrabLine then
						pcall(function() FTAP.CreateGrabLine:FireServer(t, t.CFrame) end)
						pcall(function() FTAP.CreateGrabLine:FireServer(t, CRAZY_LINE_CF) end)
					end
					if r then
						if FTAP.SetNetworkOwner then
							pcall(function()
								FTAP.SetNetworkOwner:FireServer(r, lookAt(r.Position + Vector3.new(0, 5, 0), r.Position))
							end)
						end
						if FTAP.DestroyGrabLine then
							pcall(function() FTAP.DestroyGrabLine:FireServer(r) end)
						end
						if FTAP.ExtendGrabLine then
							pcall(function() FTAP.ExtendGrabLine:FireServer(r) end)
						end
					end
				end
			end
		end
		task.wait(math.clamp(0.55 - (intensity / 1000), 0.02, 0.55))
	end
	notify(HUB_NAME, "Lag Server OFF Thank God", 1.5)
end

function softLagLoop(keep)
	if not FTAP.CreateGrabLine then
		notify(HUB_NAME, "CreateGrabLine missing", 2)
		return
	end
	notify(HUB_NAME, _Vzd({104,151,134,159,158,69,113,142,147,138,69,120,148,139,153,69,113,134,140,69,116,115,69,105,134,146,147,69,115,142,140,140,134}), 2)
	while keep() do
		for _, p in ipairs(Players:GetPlayers()) do
			if not keep() then break end
			if p ~= LP then
				local t = torsoOf(p)
				if t then
					pcall(function()
						FTAP.CreateGrabLine:FireServer(t, CRAZY_LINE_CF)
					end)
				end
			end
		end
		task.wait()
	end
	notify(HUB_NAME, _Vzd({120,148,139,153,69,113,134,140,69,116,107,107}), 1.5)
end

function hardLagLoop(keep)
	if not FTAP.CreateGrabLine then
		notify(HUB_NAME, _Vzd({104,151,138,134,153,138,108,151,134,135,113,142,147,138,69,146,142,152,152,142,147,140}), 2)
		return
	end
	local intensity = math.clamp(tonumber(S.lagIntensity) or 150, 1, 400)
	notify(HUB_NAME, _Vzd({109,134,151,137,69,113,134,140,69,116,115,69,121,141,142,152,69,120,148,146,138,69,119,138,134,145,69,103,154,145,145,152,141,142,153,69}) .. intensity, 3)
	while keep() do
		intensity = math.clamp(tonumber(S.lagIntensity) or 150, 1, 400)
		for _ = 1, math.max(1, math.floor(intensity / 2)) do
			if not keep() then break end
			for _, p in ipairs(Players:GetPlayers()) do
				if p ~= LP and p.Character then
					local t = torsoOf(p)
					local r = rootOf(p)
					if t then
						pcall(function() FTAP.CreateGrabLine:FireServer(t, t.CFrame) end)
						pcall(function() FTAP.CreateGrabLine:FireServer(t, CRAZY_LINE_CF) end)
					end
					if r then
						sno(r, r.Position)
						if FTAP.DestroyGrabLine then
							pcall(function() FTAP.DestroyGrabLine:FireServer(r) end)
						end
					end
				end
			end
		end
		task.wait(0.35)
	end
	notify(HUB_NAME, _Vzd({109,134,151,137,69,113,134,140,69,116,107,107}), 2)
end

local blobmanGrabAllOnce, destroyServerLoop, destroyServerHybridLoop

function massFlingObjectsLoop(keep)
	notify(HUB_NAME, "Fling Nearby Objects ON Hell Yeah", 2)
	local me = hrp()
	while keep() do
		me = hrp()
		if me then
			local n = 0
			local range = tonumber(S.auraRange) or 50
			local power = (tonumber(S.flingPower) or 2500) * (tonumber(S.strengthMult) or 1)
			local myChar = LP.Character
			for _, inst in ipairs(workspace:GetDescendants()) do
				if n >= 40 then break end
				if inst:IsA("BasePart") and not inst.Anchored then
					if myChar and inst:IsDescendantOf(myChar) then
					else
						local model = inst:FindFirstAncestorOfClass("Model")
						local plr = model and Players:GetPlayerFromCharacter(model)
						if not plr and (inst.Position - me.Position).Magnitude <= range then
							n += 1
							task.spawn(function()
								sno(inst, me.Position)
								applyVel(inst, power, 0.6)
							end)
						end
					end
				end
			end
		end
		task.wait(0.12)
	end
	notify(HUB_NAME, _Vzd({107,145,142,147,140,69,148,135,143,138,136,153,152,69,116,107,107}), 1.5)
end

function zeroGNearbyObjects(seconds)
	seconds = tonumber(seconds) or 30
	local me = hrp()
	if not me then return end
	local range = tonumber(S.auraRange) or 50
	local force = tonumber(S.grabZeroGForce) or 50000
	local myChar = LP.Character
	local myModel = myChar
	local applied = {}
	notify(HUB_NAME, _Vzd({127,138,151,148,82,108,69,148,135,143,138,136,153,152,69}) .. seconds .. "s", 2)
	local function tryPart(inst)
		if #applied >= 50 then return end
		if not inst:IsA("BasePart") or inst.Anchored then return end
		if myModel and inst:IsDescendantOf(myModel) then return end
		local model = inst:FindFirstAncestorOfClass("Model")
		if model and Players:GetPlayerFromCharacter(model) then return end
		local ok, dist = pcall(function() return (inst.Position - me.Position).Magnitude end)
		if not ok then return end
		if dist > range + 15 then return end
		pcall(function()
			sno(inst, me.Position)
			local old = inst:FindFirstChild("VOIDZ_ZeroG")
			if old then old:Destroy() end
			local bf = Instance.new(_Vzd({103,148,137,158,107,148,151,136,138}))
			bf.Name = "VOIDZ_ZeroG"
			bf.Force = Vector3.new(0, force, 0)
			bf.Parent = inst
			Debris:AddItem(bf, seconds)
			applied[#applied + 1] = inst
		end)
	end
	for _, inst in ipairs(workspace:GetChildren()) do
		if #applied >= 50 then break end
		if inst:IsA("BasePart") then
			tryPart(inst)
		elseif inst:IsA("Model") or inst:IsA("Folder") then
			for _, d in ipairs(inst:GetChildren()) do
				if #applied >= 50 then break end
				if d:IsA("BasePart") then
					tryPart(d)
				elseif d:IsA(_Vzd({114,148,137,138,145})) then
					local pp = d.PrimaryPart or d:FindFirstChildWhichIsA("BasePart")
					if pp then tryPart(pp) end
				end
			end
		end
	end
	notify(HUB_NAME, "Zero-G on " .. #applied .. _Vzd({69,148,135,143,138,136,153,152}), 2)
end

function balloonTroll(targetPlayer)
	local list = {}
	if targetPlayer and validP(targetPlayer) then
		list = { targetPlayer }
	else
		list = allTargets()
	end
	task.spawn(function()
		local okModel, okPrimary = ensureToy("BombBalloon")
		if not okModel and not okPrimary then
			notify(HUB_NAME, _Vzd({103,134,145,145,148,148,147,69,139,134,142,145,138,137,69,57,69,135,154,158,69,103,148,146,135,103,134,145,145,148,148,147,69,139,142,151,152,153}), 3)
			return
		end
		for _, p in ipairs(list) do
			if validP(p) then
				local r = rootOf(p)
				if r then
					local model, primary = ensureToy("BombBalloon")
					if model or primary then
						pcall(function()
							local balloon = model and (model.PrimaryPart or model:FindFirstChildWhichIsA("BasePart", true)) or primary
							if balloon then
								sno(balloon)
								balloon.CFrame = r.CFrame * CFrame.new(0, 6, 0)
								balloon.AssemblyLinearVelocity = Vector3.zero
								balloon.AssemblyAngularVelocity = Vector3.zero
								if firetouchinterest then
									pcall(function()
										firetouchinterest(balloon, r, 0)
										task.wait(0.05)
										firetouchinterest(balloon, r, 1)
									end)
								end
								task.wait(0.1)
							end
						end)
					end
				end
				task.wait(0.3)
			end
		end
		notify(HUB_NAME, "Balloon troll · " .. #list, 2)
	end)
end

local KICK_TYPES = {
	"Sky Anchor", "Float Pin",
	"Velocity", "Hard", "Void", "Sky", "Ragdoll",
	"Blobman", "Silent", "GrabKick", "StackKick",
}

function isOnBlobman()
	local h = hum()
	if not h or not h.Sit or not h.SeatPart then return false end
	local par = h.SeatPart.Parent
	if not par then return false end
	local n = par.Name:lower()
	return n:find("blob") ~= nil or par:FindFirstChild("BlobmanSeatAndOwnerScript") ~= nil
end

function ensureBlobman(quiet)
	if isOnBlobman() then return true end
	local me = hrp()
	if not me then return false end
	if not FTAP.BuyToy or not FTAP.SpawnToy then pcall(resolveFTAP) end
	pcall(function()
		if FTAP.BuyToy then FTAP.BuyToy:InvokeServer("CreatureBlobman") end
	end)
	task.wait(0.2)
	pcall(function()
		if FTAP.SpawnToy then
			FTAP.SpawnToy:InvokeServer("CreatureBlobman", me.CFrame * CFrame.new(0, 0, -5), Vector3.zero)
		end
	end)
	for _ = 1, 30 do
		task.wait(0.06)
		me = hrp() or me
		local folder = workspace:FindFirstChild(LP.Name .. "SpawnedInToys")
		local seats = {}
		local function scan(root)
			if not root then return end
			for _, d in ipairs(root:GetDescendants()) do
				if (d:IsA("Seat") or d:IsA("VehicleSeat")) and (d:GetFullName():lower():find("blob") or (d.Parent and d.Parent:FindFirstChild("BlobmanSeatAndOwnerScript"))) then
					seats[#seats + 1] = d
				end
			end
		end
		scan(folder)
		if #seats == 0 then scan(workspace) end
		for _, seat in ipairs(seats) do
			pcall(function()
				me.CFrame = seat.CFrame + Vector3.new(0, 3, 0)
			end)
			task.wait(0.08)
			pcall(function()
				local h = hum()
				if h then seat:Sit(h) end
			end)
			task.wait(0.12)
			if isOnBlobman() then return true end
		end
		if isOnBlobman() then return true end
	end
	if not isOnBlobman() then
		for _, d in ipairs(workspace:GetDescendants()) do
			if (d:IsA("Seat") or d:IsA("VehicleSeat")) and d:GetFullName():lower():find("blob") then
				pcall(function()
					me = hrp()
					if me then me.CFrame = d.CFrame + Vector3.new(0, 2, 0) end
				end)
				task.wait(0.1)
				pcall(function() local h = hum(); if h then d:Sit(h) end end)
				task.wait(0.15)
				if isOnBlobman() then return true end
			end
		end
	end
	if not quiet then
		notify(HUB_NAME, "Blobman spawn failed — try again", 2)
	end
	return isOnBlobman()
end

function kickPlayer(p, ktype, quiet)
	if not p or not isAliveP(p) then
		if not quiet then notify(HUB_NAME, _Vzd({115,148,69,144,142,136,144,69,153,134,151,140,138,153}), 1.5) end
		return
	end
	ktype = ktype or S.kickType or _Vzd({120,144,158,69,102,147,136,141,148,151})
	if not gatePlotAction(p, "kick", { kind = "kick", ktype = ktype, quiet = quiet }) then return end
	local me, r = hrp(), rootOf(p)
	if not r then return end
	local home = me and me.CFrame
	forceUnsit(p)
	clearTargetMovers(p.Character)
	surfaceForGrab()

	local function ownershipVisit(opts)
		opts = opts or {}
		local frames = opts.frames or 55
		local floatConn = nil
		if opts.floatSelf then
			floatConn = RunService.Stepped:Connect(function()
				local c = char()
				if not c then return end
				for _, part in ipairs(c:GetChildren()) do
					if part:IsA("BasePart") and part.CanCollide then
						part.CanCollide = false
					end
				end
			end)
		end
		for _ = 0, frames do
			if not isAliveP(p) then break end
			r = rootOf(p)
			if not r then break end
			forceUnsit(p)
			if r.Position.Y <= -12 then
				teleportSelf(CFrame.new(r.Position + Vector3.new(0, 5, -15)))
			else
				teleportSelf(CFrame.new(r.Position + Vector3.new(0, -10, -10)))
			end
			sno(r, r.Position)
			snoPlayer(p, r.Position)
			local vel = r.AssemblyLinearVelocity and r.AssemblyLinearVelocity.Magnitude or 0
			if hasNetOwner(r) or vel > 500 then
				destroyGrabOn(r)
				task.wait()
				skyVel(r)
				if opts.onOwned then opts.onOwned(r) end
				break
			end
			if opts.pulse and _ % 2 == 0 then
				skyVel(r)
				destroyGrabOn(r)
			end
			RunService.Heartbeat:Wait()
		end
		r = rootOf(p)
		if r and isAliveP(p) then
			forceUnsit(p)
			destroyGrabOn(r)
			skyVel(r)
			if opts.onOwned then opts.onOwned(r) end
			if opts.launch then launchTarget(p, "sky") end
		end
		if floatConn then pcall(function() floatConn:Disconnect() end) end
	end

	local function kickCore(extra)
		ownershipVisit({
			frames = 55,
			pulse = true,
			launch = true,
			onOwned = extra,
		})
	end

	if ktype == "Sky Anchor" then
		ownershipVisit({
			frames = 55,
			onOwned = function(rr)
				createKickPhysical(rr, "Sky Anchor")
				skyVel(rr)
				applyVel(rr, 12000, 2.5)
			end,
		})
	elseif ktype == _Vzd({107,145,148,134,153,69,117,142,147}) then
		ownershipVisit({
			frames = 55,
			floatSelf = true,
			onOwned = function(rr)
				createKickPhysical(rr, _Vzd({120,144,158,69,102,147,136,141,148,151}))
				skyVel(rr)
				pcall(function()
					local bp = rr:FindFirstChild("KickAuraP")
					if bp and bp:IsA("BodyPosition") then
						bp.MaxForce = Vector3.new(1e9, 1e9, 1e9)
						bp.P = 1e5
						bp.D = 2000
						bp.Position = Vector3.new(math.random(-80, 80), 400 + math.random(0, 80), math.random(-80, 80))
					end
					local bg = rr:FindFirstChild("KickAuraG")
					if not bg then
						bg = Instance.new("BodyGyro")
						bg.Name = "KickAuraG"
						bg.MaxTorque = Vector3.new(1e9, 1e9, 1e9)
						bg.P = 5e4
						bg.Parent = rr
					end
					bg.CFrame = rr.CFrame
				end)
				applyVel(rr, 16000, 3)
			end,
		})
	elseif ktype == "Blobman" or ktype == "Silent" then
		ensureBlobman()
		for _ = 1, 18 do
			r = rootOf(p)
			if not r or not isAliveP(p) then break end
			pcall(function()
				snoPlayer(p, r.Position)
				local my = hrp()
				if my then r.CFrame = my.CFrame * CFrame.new(0, 4, 0) end
				destroyGrabOn(r)
				skyVel(r)
				if ktype == "Silent" then createKickPhysical(r, "Silent") end
				applyVel(r, ktype == "Silent" and 14000 or 22000, 0.08)
			end)
			RunService.Heartbeat:Wait()
		end
	elseif ktype == "GrabKick" then
		for _ = 1, 15 do
			r = rootOf(p)
			if not r or not isAliveP(p) then break end
			pcall(function()
				local my = hrp()
				if my then my.CFrame = r.CFrame * CFrame.new(0, 1, 2) end
				snoPlayer(p, r.Position)
				if FTAP.CreateGrabLine then
					local t = p.Character:FindFirstChild("Torso") or p.Character:FindFirstChild("UpperTorso") or r
					FTAP.CreateGrabLine:FireServer(t, t.CFrame)
				end
				skyVel(r)
				applyVel(r, 18000, 0.15)
			end)
			RunService.Heartbeat:Wait()
		end
	elseif ktype == "StackKick" then
		for _ = 0, 50 do
			r = rootOf(p)
			if not r or not isAliveP(p) then break end
			visitForSNO(p, 8)
			r = rootOf(p)
			if not r then break end
			snoPlayer(p, r.Position)
			if hasNetOwner(r) or (r.AssemblyLinearVelocity and r.AssemblyLinearVelocity.Magnitude > 500) then
				destroyGrabOn(r)
				task.wait()
				skyVel(r)
				applyVel(r, 22000, 0.1)
				break
			end
			task.wait()
			if r.Position.Y <= -12 then
				teleportSelf(CFrame.new(r.Position + Vector3.new(0, 5, -15)))
			else
				teleportSelf(CFrame.new(r.Position + Vector3.new(0, -10, -10)))
			end
		end
	elseif ktype == "Void" then
		voidPlayer(p, true)
	elseif ktype == "Sky" then
		kickCore(function(rr)
			createKickPhysical(rr, "Sky Anchor")
			applyVel(rr, 15000, 4)
		end)
	elseif ktype == "Ragdoll" then
		ragdoll(p, true)
	elseif ktype == "Hard" or ktype == _Vzd({123,138,145,148,136,142,153,158}) then
		kickCore(function(rr)
			applyVel(rr, math.max(S.flingPower or 8000, 8000), 0.12)
		end)
	else
		kickCore(nil)
	end

	if home then teleportSelf(home) end
	hideAfterGrab()
	if not quiet then
		notify(HUB_NAME, "Kick [" .. ktype .. "] → " .. playerLabel(p), 1.5)
	end
end

function runPlotExitAmbush(p)
	if not p or not validP(p) then
		if p then plotWatch[p.UserId] = nil end
		return
	end
	local w = plotWatch[p.UserId]
	plotWatch[p.UserId] = nil
	plotBypass = true
	local ok, err = pcall(function()
		forceGrabOnExit(p)
		if w then
			if w.kind == "fling" then
				flingPlayer(p, w.power, true, w.mapWide)
			elseif w.kind == "kill" then
				killPlayer(p, true)
			elseif w.kind == "kick" then
				kickPlayer(p, w.ktype, true)
			elseif w.kind == "bring" then
				bringPlayer(p, nil, true)
			elseif w.kind == "ragdoll" then
				ragdoll(p, true)
			end
			notify(HUB_NAME, "Left house → " .. tostring(w.kind or "grab") .. " · " .. playerLabel(p), 2)
		else
			notify(HUB_NAME, _Vzd({113,138,139,153,69,141,148,154,152,138,69,183,69,140,151,134,135,135,138,137,69,153,141,134,153,69,135,142,153,136,141,69}) .. playerLabel(p), 2)
		end
	end)
	plotBypass = false
	if not ok then warn("[VOIDZ] plot exit", err) end
end
S._runPlotExitAmbush = runPlotExitAmbush

function installPlotWatch()
	if plotWatchInstalled then return end
	plotWatchInstalled = true

	local function bindPlayer(p)
		if not p or p == LP then return end
		local function onLeftPlot()
			if plotWatch[p.UserId] or (S.toggles.plotAmbush ~= false and (S.selected == p or S.loopTarget == p)) then
				if not plotWatch[p.UserId] then
					plotWatch[p.UserId] = { kind = "grab", quiet = true }
				end
				task.defer(function()
					task.wait(0.05)
					if not isInSafePlot(p) then
						runPlotExitAmbush(p)
					end
				end)
			end
		end
		local ip = p:FindFirstChild("InPlot") or p:WaitForChild("InPlot", 10)
		if ip then
			pcall(function()
				if ip:IsA("BoolValue") then
					ip.Changed:Connect(function(v)
						if v == false then onLeftPlot() end
					end)
				else
					ip:GetPropertyChangedSignal("Value"):Connect(function()
						if ip.Value == false then onLeftPlot() end
					end)
				end
			end)
		end
	end

	for _, pl in ipairs(Players:GetPlayers()) do task.spawn(bindPlayer, pl) end
	Players.PlayerAdded:Connect(function(pl) task.spawn(bindPlayer, pl) end)

	task.spawn(function()
		local wasIn = {}
		while true do
			task.wait(0.4)
			if S.toggles.plotAmbush == false and next(plotWatch) == nil then
			else
				for _, p in ipairs(Players:GetPlayers()) do
					if p ~= LP then
						local now = isInSafePlot(p)
						local uid = p.UserId
						if wasIn[uid] and not now then
							if plotWatch[uid] or S.selected == p or S.loopTarget == p then
								if not plotWatch[uid] then
									plotWatch[uid] = { kind = "grab", quiet = true }
								end
								task.spawn(runPlotExitAmbush, p)
							end
						elseif now and S.toggles.plotAmbush ~= false and (S.selected == p or S.loopTarget == p) then
							if not plotWatch[uid] then
								plotWatch[uid] = { kind = "grab", quiet = true }
							end
						end
						wasIn[uid] = now
					end
				end
			end
		end
	end)
	print("[VOIDZ] plot ambush watch installed")
end
task.spawn(installPlotWatch)

function getBlobmanGrabKit()
	local h = hum()
	if not h or not h.SeatPart or not h.SeatPart.Parent then return nil end
	local blob = h.SeatPart.Parent
	local n = blob.Name:lower()
	if not (n:find("blob") or blob:FindFirstChild("BlobmanSeatAndOwnerScript")) then
		return nil
	end
	local leftDet = blob:FindFirstChild("LeftDetector") or blob:FindFirstChild("LeftDetector", true)
	if not leftDet then return nil end
	local leftWeld = leftDet:FindFirstChild("LeftWeld") or leftDet:FindFirstChild("LeftWeld", true)
	local scriptFolder = blob:FindFirstChild("BlobmanSeatAndOwnerScript")
		or blob:FindFirstChild(_Vzd({103,145,148,135,146,134,147,120,138,134,153,102,147,137,116,156,147,138,151,120,136,151,142,149,153}), true)
	local creatureGrab = scriptFolder and (scriptFolder:FindFirstChild("CreatureGrab")
		or scriptFolder:FindFirstChild("CreatureGrab", true))
	if not creatureGrab then
		for _, d in ipairs(blob:GetDescendants()) do
			if d.Name == "CreatureGrab" and (d:IsA("RemoteEvent") or d:IsA("RemoteFunction")) then
				creatureGrab = d
				break
			end
		end
	end
	if not creatureGrab then return nil end
	return {
		blob = blob,
		seat = h.SeatPart,
		leftDet = leftDet,
		leftWeld = leftWeld,
		creatureGrab = creatureGrab,
	}
end

function moveBlobNear(kit, targetRoot)
	if not kit or not targetRoot then return end
	local pivot = kit.blob.PrimaryPart or kit.seat
	if not pivot then return end
	pcall(function()
		local dest = targetRoot.CFrame * CFrame.new(0, 1, 7)
		if kit.blob.PrimaryPart then
			kit.blob:PivotTo(dest)
		else
			pivot.CFrame = dest
		end
		for _, part in ipairs(kit.blob:GetDescendants()) do
			if part:IsA("BasePart") then
				part.Anchored = true
				part.AssemblyLinearVelocity = Vector3.zero
				part.AssemblyAngularVelocity = Vector3.zero
			end
		end
		local me = hrp()
		if me then me.CFrame = dest * CFrame.new(0, 2, 0) end
		local h = hum()
		if h and kit.seat then
			pcall(function() kit.seat:Sit(h) end)
		end
		task.wait(0.05)
		for _, part in ipairs(kit.blob:GetDescendants()) do
			if part:IsA(_Vzd({103,134,152,138,117,134,151,153})) then
				part.Anchored = false
			end
		end
	end)
end

function fireCreatureGrab(kit, targetRoot)
	if not kit or not targetRoot then return end
	pcall(function()
		if kit.creatureGrab:IsA("RemoteEvent") then
			kit.creatureGrab:FireServer(kit.leftDet, targetRoot, kit.leftWeld)
		else
			kit.creatureGrab:InvokeServer(kit.leftDet, targetRoot, kit.leftWeld)
		end
	end)
end

function forceBlobmanMount()
	if isOnBlobman() then return getBlobmanGrabKit() end
	pcall(function() ensureBlobman(true) end)
	if isOnBlobman() then return getBlobmanGrabKit() end
	local me = hrp()
	local h = hum()
	if not me or not h then return nil end
	local folder = workspace:FindFirstChild(LP.Name .. "SpawnedInToys")
	local roots = { folder, workspace }
	for _, root in ipairs(roots) do
		if root then
			for _, d in ipairs(root:GetDescendants()) do
				if (d:IsA("Seat") or d:IsA("VehicleSeat")) then
					local par = d.Parent
					if par and (par.Name:lower():find("blob") or par:FindFirstChild("BlobmanSeatAndOwnerScript")) then
						pcall(function()
							me.CFrame = d.CFrame + Vector3.new(0, 3, 0)
							d:Sit(h)
						end)
						task.wait(0.1)
						if isOnBlobman() then return getBlobmanGrabKit() end
					end
				end
			end
		end
	end
	return getBlobmanGrabKit()
end

blobmanGrabAllOnce = function()
	local kit = forceBlobmanMount()
	if not kit then return false end
	for _, p in ipairs(Players:GetPlayers()) do
		if p ~= LP and validP(p) then
			local r = rootOf(p)
			if r then
				moveBlobNear(kit, r)
				kit = getBlobmanGrabKit() or kit
				for _ = 1, 3 do
					fireCreatureGrab(kit, r)
					task.wait()
				end
			end
		end
	end
	return true
end


function blobGrabSingle(p)
	if not p or not validP(p) then return false end
	local kit = forceBlobmanMount()
	if not kit then return false end
	local r = rootOf(p)
	if not r then return false end
	local ok = false
	for attempt = 1, 5 do
		r = rootOf(p)
		if not r then break end
		moveBlobNear(kit, r)
		kit = getBlobmanGrabKit() or kit
		if kit then
			for _ = 1, 4 do
				fireCreatureGrab(kit, r)
				task.wait()
			end
			ok = true
		end
		task.wait(0.08)
	end
	return ok
end

function blobGrabAll()
	local kit = forceBlobmanMount()
	if not kit then notify(HUB_NAME, "Blobman spawn failed", 2); return end
	notify(HUB_NAME, "Blob Grab ALL", 1.5)
	for _, p in ipairs(Players:GetPlayers()) do
		if p ~= LP and validP(p) then
			local r = rootOf(p)
			if r then
				moveBlobNear(kit, r)
				kit = getBlobmanGrabKit() or kit
				for _ = 1, 3 do
					fireCreatureGrab(kit, r)
					task.wait()
				end
			end
		end
	end
end

function startBlobGrabLoop(p)
	if not p then return end
	local id = "blobGrabLoop"
	if S.loops[id] then
		stopLoop(id)
		notify(HUB_NAME, _Vzd({103,145,148,135,69,108,151,134,135,69,113,148,148,149,69,116,107,107}), 1.2)
		S.toggles.blobGrabLoop = false
		return
	end
	S.toggles.blobGrabLoop = true
	local targetName = p.Name
	notify(HUB_NAME, _Vzd({103,145,148,135,69,108,151,134,135,69,113,148,148,149,69,116,115,69,183,69}) .. playerLabel(p), 1.5)
	local homeCF = hrp() and hrp().CFrame
	startLoop(id, 0.25, function()
		local target = Players:FindFirstChild(targetName)
		if not target or not target.Parent then return end
		local r = rootOf(target)
		if not r then return end
		blobGrabSingle(target)
		if homeCF then pcall(function() teleportSelf(homeCF) end) end
	end)
end

destroyServerLoop = function(keep)
	notify(HUB_NAME, _Vzd({105,138,152,153,151,148,158,69,120,138,151,155,138,151,69,116,115,69,121,141,142,152,69,120,141,142,153,69,116,155,138,151}), 2)
	while keep() do
		local kit = forceBlobmanMount()
		if not kit then
			task.wait(0.4)
		else
			for _, p in ipairs(Players:GetPlayers()) do
				if not keep() then break end
				if p ~= LP and validP(p) then
					local r = rootOf(p)
					if r then
						if not isOnBlobman() then
							kit = forceBlobmanMount() or kit
						end
						moveBlobNear(kit, r)
						kit = getBlobmanGrabKit() or kit
						for _ = 1, 4 do
							fireCreatureGrab(kit, r)
							task.wait()
						end
					end
				end
			end
			if not isOnBlobman() then
				forceBlobmanMount()
			end
			task.wait()
		end
	end
	notify(HUB_NAME, _Vzd({105,138,152,153,151,148,158,69,120,138,151,155,138,151,69,116,107,107}), 1.5)
end

destroyServerHybridLoop = function(keep)
	notify(HUB_NAME, "Destroy Server Hybrid ON (no blobman needed)", 3)
	while keep() do
		if FTAP.CreateGrabLine then
			for _, p in ipairs(Players:GetPlayers()) do
				if p ~= LP then
					local t = torsoOf(p)
					if t then
						for _ = 1, 8 do
							pcall(function() FTAP.CreateGrabLine:FireServer(t, t.CFrame) end)
							pcall(function() FTAP.CreateGrabLine:FireServer(t, CRAZY_LINE_CF) end)
						end
					end
				end
			end
		end
		for _, p in ipairs(allTargets()) do
			if not keep() then break end
			pcall(function()
				visitForSNO(p, 20)
				local r = rootOf(p)
				if r then
					skyVel(r)
					applyVel(r, 20000, 0.2)
					local h = p.Character and p.Character:FindFirstChildOfClass("Humanoid")
					if h then
						h.BreakJointsOnDeath = false
						h:ChangeState(Enum.HumanoidStateType.Dead)
					end
					touchToyPartToPlayer("Campfire", r)
					touchToyPartToPlayer("FoodBanana", r)
				end
			end)
			task.wait(0.03)
		end
		local me = hrp()
		if me and FTAP.SpawnToy then
			for _, toy in ipairs({ "Missile", "VoidBomb", "Firework", "BombBalloon", "Snowball" }) do
				pcall(function()
					if FTAP.BuyToy then FTAP.BuyToy:InvokeServer(toy) end
					FTAP.SpawnToy:InvokeServer(toy, me.CFrame * CFrame.new(0, 5, -8), Vector3.zero)
				end)
			end
		end
		task.wait(0.15)
	end
	notify(HUB_NAME, "Destroy Hybrid OFF", 2)
end

Late = {}
do local _z560=(2*7); if _z560<0 and _Vj() then _z560=_z560+1 end end

function _voidzLateInit()
Late = Late or {}
Late._phase = _Vzd({138,147,153,138,151,138,137})
print(_Vzd({128,123,116,110,105,127,130,69,145,134,153,138,69,142,147,142,153,69,138,147,153,138,151,138,137}))
local orbitAngles = {}
local buriedPartState = setmetatable({}, { __mode = "k" })

function clearAuraEffect(part, names)
	if not part then return end
	for _, name in ipairs(names) do
		local mover = part:FindFirstChild(name)
		if mover then pcall(function() mover:Destroy() end) end
	end
end

do local _z234=(3*4); if _z234<0 and _Vj() then _z234=_z234+1 end end

function restoreBuriedModel(model)
	local saved = buriedPartState[model]
	if saved then
		for part, state in pairs(saved) do
			if part and part.Parent then pcall(function()
				part.CanCollide = state.CanCollide
				part.CanQuery = state.CanQuery
			end) end
		end
		buriedPartState[model] = nil
	end
	local root = model and (model:FindFirstChild("HumanoidRootPart") or model:FindFirstChild("Torso"))
	clearAuraEffect(root, { "VOIDZ_BuryBV", "VOIDZ_BuryBP" })
end

function cleanupAura(id)
	for _, p in ipairs(Players:GetPlayers()) do
		local model, root = p.Character, rootOf(p)
		if id == _Vzd({152,153,148,146,149}) then
			restoreBuriedModel(model)
		elseif id == "freeze" then
			clearAuraEffect(root, { "VOIDZ_FreezeBP" })
		elseif id == "orbit" then
			clearAuraEffect(root, { "VOIDZ_OrbitBP" })
		elseif id == "fling" then
			clearAuraEffect(root, { _Vzd({107,145,142,147,140,102,154,151,134,123,138,145,148,136,142,153,158}), "VOIDZ_BV" })
		end
	end
end

function inRange(pos, range)
	local me = hrp()
	if not me then return false end
	range = tonumber(range) or S.auraRange or 50
	if range >= 500 then return true end
	return (pos - me.Position).Magnitude <= range
end

local auraHomeCF = nil
function eachAuraTarget(cfg, fnPlayers, fnObjects, serverWide)
	if type(cfg) ~= "table" then cfg = auraDefaults() end
	if cfg._id then cfg = getAura(cfg._id) end
	local power = tonumber(cfg.power) or tonumber(S.flingPower) or 2500
	if not cfg._customPower then power = tonumber(S.flingPower) or power end
	local t = cfg.target or "Players"
	local configuredRange = math.max(tonumber(cfg.range) or tonumber(S.auraRange) or 50, 1)
	local playerRange = configuredRange
	local objRange = S.toggles.auraMapWide and configuredRange or math.min(configuredRange, 80)

	if t == "Players" or t == _Vzd({117,145,134,158,138,151,152,69,134,147,137,69,116,135,143,138,136,153,152}) then
		local targets = {}
		for _, p in ipairs(Players:GetPlayers()) do
			if validP(p) then
				if isInSafePlot(p) and not plotBypass then
					if S.toggles.plotAmbush ~= false then
						plotWatch[p.UserId] = {
							kind = "fling", quiet = true, power = power, mapWide = true,
						}
					end
				else
					table.insert(targets, p)
				end
			end
		end

		if serverWide and #targets > 0 then
			local me = hrp()
			if not me then return end
			auraHomeCF = me.CFrame
			for _, p in ipairs(targets) do
				if not p or not p.Parent then continue end
				if not isAliveP(p) and not validP(p) then continue end
				local r = rootOf(p)
				if not r then continue end
				pcall(function()
					if r.Position.Y <= -12 then
						me.CFrame = CFrame.new(r.Position + Vector3.new(0, 5, -15))
					else
						me.CFrame = CFrame.new(r.Position + Vector3.new(0, -10, -10))
					end
					snoPlayer(p, r.Position)
					r = rootOf(p)
					if r and fnPlayers then fnPlayers(p, r, power, playerRange) end
				end)
			end
			pcall(function()
				if auraHomeCF and me.Parent then me.CFrame = auraHomeCF end
			end)
			auraHomeCF = nil
		else
			for _, p in ipairs(targets) do
				local r = rootOf(p)
				if r then
					local me = hrp()
					local dist = me and (r.Position - me.Position).Magnitude or 9999
					if dist <= playerRange then
						pcall(function()
							snoQuick(p, r)
							r = rootOf(p)
							if r and fnPlayers then fnPlayers(p, r, power, playerRange) end
						end)
					end
				end
			end
		end
	end
	if (t == "Objects" or t == "Players and Objects") and fnObjects then
		local me = hrp()
		local myChar = LP.Character
		if me then
			local n = 0
			local cap = S.toggles.auraMapWide and 40 or 16
			local overlap = OverlapParams.new()
			overlap.FilterType = Enum.RaycastFilterType.Exclude
			overlap.FilterDescendantsInstances = myChar and { myChar } or {}
			local function tryPart(inst)
				if n >= cap then return end
				if not inst:IsA(_Vzd({103,134,152,138,117,134,151,153})) or inst.Anchored then return end
				if myChar and inst:IsDescendantOf(myChar) then return end
				local model = inst:FindFirstAncestorOfClass("Model")
				if model and Players:GetPlayerFromCharacter(model) then return end
				local dist = (inst.Position - me.Position).Magnitude
				if dist > objRange then return end
				n += 1
				pcall(function()
					sno(inst, me.Position)
					fnObjects(inst, power, objRange)
				end)
			end
			local ok, parts = pcall(function()
				return workspace:GetPartBoundsInRadius(me.Position, objRange, overlap)
			end)
			if ok and parts then
				for _, part in ipairs(parts) do
					if n >= cap then break end
					tryPart(part)
				end
			end
		end
	end
end

function snoQuick(p, r)
	if not p or not r then return end
	local me = hrp()
	local origin = me and me.Position or r.Position
	for _, part in ipairs(p.Character:GetChildren()) do
		if part:IsA("BasePart") then
			sno(part, origin)
		end
	end
end

function applyVelBurst(part, power, up)
	if not part then return end
	power = tonumber(power) or 2500
	up = up == nil and 0.5 or up
	local me = hrp()
	local dir
	if me then
		local cf = lookAt(me.Position, part.Position)
		dir = Vector3.new(cf.LookVector.X, up, cf.LookVector.Z)
	else
		dir = Vector3.new(0, 1, 0)
	end
	if dir.Magnitude < 1e-3 then dir = Vector3.yAxis end
	dir = dir.Unit
	pcall(function()
		part.AssemblyLinearVelocity = dir * math.clamp(power, 50, 1e5)
		part.AssemblyAngularVelocity = Vector3.new(power / 60, power / 50, power / 60)
		local old = part:FindFirstChild(_Vzd({123,116,110,105,127,132,103,123}))
		if old then old:Destroy() end
		local bv = Instance.new("BodyVelocity")
		bv.Name = "VOIDZ_BV"
		bv.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
		bv.Velocity = dir * math.clamp(power, 50, 1e5)
		bv.Parent = part
		Debris:AddItem(bv, 0.25)
	end)
end

function tick_netown(cfg, serverWide)
	cfg = getAura("netown")
	if not hrp() or not FTAP.SetNetworkOwner then return end
	eachAuraTarget(cfg, function(p, r)
		snoQuick(p, r)
		if S.toggles.netownGrab and FTAP.CreateGrabLine then
			pcall(function()
				local t = p.Character:FindFirstChild("Torso") or p.Character:FindFirstChild("UpperTorso") or r
				FTAP.CreateGrabLine:FireServer(t, t.CFrame)
			end)
		end
	end, function(part)
		sno(part)
	end, serverWide)
end

function tick_fling(cfg, serverWide)
	cfg = getAura("fling")
	eachAuraTarget(cfg, function(_, r, power)
		applyVel(r, math.clamp(power, 400, 50000), 0.5)
	end, function(part, power)
		applyVel(part, math.clamp(power, 400, 50000), 0.5)
	end, serverWide)
end

function tick_kick(cfg, serverWide)
	cfg = getAura("kick")
	eachAuraTarget(cfg, function(p, r)
		forceUnsit(p)
		destroyGrabOn(r)
		skyVel(r)
		createKickPhysical(r, S.kickType)
	end, nil, serverWide)
end

function tick_death(cfg, serverWide)
	cfg = getAura("death")
	eachAuraTarget(cfg, function(p, r)
		forceUnsit(p)
		destroyGrabOn(r)
		skyVel(r)
		local h = p.Character and p.Character:FindFirstChildOfClass("Humanoid")
		if h then pcall(function()
			h.BreakJointsOnDeath = false
			h:ChangeState(Enum.HumanoidStateType.Dead)
			h.Jump, h.Sit = true, false
		end) end
	end, nil, serverWide)
end

function tick_anchor(cfg, serverWide)
	cfg = getAura("anchor")
	eachAuraTarget(cfg, function(p, r)
		pcall(function()
			r.Anchored = true
			task.delay(0.35, function() if r.Parent then r.Anchored = false end end)
		end)
	end, function(part)
		sno(part)
		pcall(function()
			part.Anchored = true
			task.delay(0.35, function() if part.Parent then part.Anchored = false end end)
		end)
	end, serverWide)
end

do local _z679=(5*4); if _z679<0 and _Vj() then _z679=_z679+1 end end

function tick_attract(cfg, serverWide)
	cfg = getAura(_Vzd({134,153,153,151,134,136,153}))
	eachAuraTarget(cfg, function(p, r, power)
		local center = auraHomeCF and auraHomeCF.Position or (hrp() and hrp().Position) or Vector3.zero
		local d = center - r.Position
		if d.Magnitude > 1 then
			pcall(function() r.AssemblyLinearVelocity = d.Unit * math.clamp(power / 15, 50, 300) end)
		end
	end, function(part, power)
		sno(part)
		local center = auraHomeCF and auraHomeCF.Position or (hrp() and hrp().Position) or Vector3.zero
		local d = center - part.Position
		if d.Magnitude > 1 then
			pcall(function() part.AssemblyLinearVelocity = d.Unit * math.clamp(power / 25, 30, 150) end)
		end
	end, serverWide)
end

function tick_sky(cfg, serverWide)
	cfg = getAura("sky")
	eachAuraTarget(cfg, function(p, r, power)
		pcall(function()
			r.AssemblyLinearVelocity = Vector3.new(0, math.clamp(power, 2000, 50000), 0)
			r.AssemblyAngularVelocity = Vector3.zero
		end)
	end, function(part, power)
		sno(part)
		pcall(function()
			part.AssemblyLinearVelocity = Vector3.new(0, math.clamp(power, 1000, 50000), 0)
		end)
	end, serverWide)
end

function tick_spin(cfg, serverWide)
	cfg = getAura("spin")
	eachAuraTarget(cfg, function(p, r, power)
		local spd = math.clamp(power / 40, 20, 200)
		pcall(function() r.AssemblyAngularVelocity = Vector3.new(0, spd, 0) end)
	end, function(part, power)
		sno(part)
		pcall(function() part.AssemblyAngularVelocity = Vector3.new(10, power / 50, 10) end)
	end, serverWide)
end

function tick_ragdoll(cfg, serverWide)
	cfg = getAura("ragdoll")
	local bananaModel, bananaPrimary, peel = nil, nil, nil
	local function ensurePeel()
		if bananaModel and bananaModel.Parent and peel and peel.Parent then return true end
		local m, pp = ensureToy("FoodBanana")
		if not m or not pp then return false end
		bananaModel, bananaPrimary = m, pp
		peel = nil
		for _, d in ipairs(m:GetDescendants()) do
			if d.Name == "BananaPeel" and d:FindFirstChildOfClass(_Vzd({121,148,154,136,141,121,151,134,147,152,146,142,153,153,138,151})) then
				peel = d; break
			end
		end
		if peel then
			peel.Size = Vector3.new(2, 2, 2)
			peel.Transparency = 1
			peel.CanCollide = false
		end
		pcall(function()
			for _, d in ipairs(m:GetDescendants()) do
				if d:IsA("BasePart") then d.CanCollide = false end
			end
			local ao = pp:FindFirstChildOfClass("AlignOrientation")
			if ao then ao.Enabled = false end
		end)
		local head = LP.Character and LP.Character:FindFirstChild("Head")
		local parkY = head and (head.Position.Y + 500) or 500
		local bp = pp:FindFirstChild("VOIDZ_AuraRagdollPark")
		if not bp then
			bp = Instance.new("BodyPosition")
			bp.Name = _Vzd({123,116,110,105,127,132,102,154,151,134,119,134,140,137,148,145,145,117,134,151,144})
			bp.MaxForce = Vector3.new(12500, 12500, 12500)
			bp.P = 12500
			bp.Parent = pp
		end
		bp.Position = Vector3.new(0, parkY, 0)
		sno(pp)
		return peel ~= nil
	end
	eachAuraTarget(cfg, function(p, r)
		if not ensurePeel() then return end
		pcall(function()
			sno(peel, r.Position)
			peel.Position = r.Position
			task.wait()
			peel.Position = bananaPrimary.Position
		end)
	end, function() end, serverWide)
	if bananaPrimary then
		pcall(function()
			if peel then peel.Position = bananaPrimary.Position end
		end)
	end
end

function tick_bring(cfg, serverWide)
	cfg = getAura("bring")
	local me = hrp()
	if not me then return end
	local homeCF = me.CFrame

	if serverWide then
		for _, p in ipairs(Players:GetPlayers()) do
			if p ~= LP and isAliveP(p) and not isInSafePlot(p) and not isWL(p) then
				local r = rootOf(p)
				if r then
					pcall(function()
						if r.Position.Y <= -12 then
							me.CFrame = CFrame.new(r.Position + Vector3.new(0, 5, -15))
						else
							me.CFrame = CFrame.new(r.Position + Vector3.new(0, -10, -10))
						end
						sno(r, r.Position)
						snoPlayer(p, r.Position)
						if FTAP.CreateGrabLine then
							local t = p.Character and (p.Character:FindFirstChild("Torso") or p.Character:FindFirstChild("UpperTorso") or r)
							if t then pcall(function() FTAP.CreateGrabLine:FireServer(t, t.CFrame) end) end
						end
						forceUnsit(p)
						for _ = 1, 8 do
							if hasNetOwner(r) then break end
							task.wait()
						end
						pcall(function()
							r.CFrame = homeCF * CFrame.new(0, 0, -5)
							createBringBody(r, homeCF * CFrame.new(0, 0, -5))
						end)
					end)
				end
			end
		end
		pcall(function() me.CFrame = homeCF end)
	else
		eachAuraTarget(cfg, function(p, r)
			local dest = homeCF * CFrame.new(0, 0, -5)
			pcall(function()
				sno(r, r.Position)
				snoPlayer(p, r.Position)
				if FTAP.CreateGrabLine then
					local t = p.Character and (p.Character:FindFirstChild("Torso") or p.Character:FindFirstChild("UpperTorso") or r)
					if t then pcall(function() FTAP.CreateGrabLine:FireServer(t, t.CFrame) end) end
				end
				r.CFrame = dest
				createBringBody(r, dest)
			end)
		end, function(part)
			sno(part)
			local dest = homeCF * CFrame.new(0, 0, -5)
			if homeCF then pcall(function() part.CFrame = dest end) end
		end, false)
	end
end

function tick_void(cfg, serverWide)
	cfg = getAura("void")
	eachAuraTarget(cfg, function(p, r, power)
		pcall(function()
			local char = p.Character
			if char then
				for _, d in ipairs(char:GetDescendants()) do
					if d:IsA("BasePart") then d.CanCollide = false end
				end
			end
			r.AssemblyLinearVelocity = Vector3.new(0, -math.clamp(power, 500, 50000), 0)
		end)
	end, function(part, power)
		sno(part)
		pcall(function()
			part.CanCollide = false
			part.AssemblyLinearVelocity = Vector3.new(0, -math.clamp(power * 0.5, 300, 25000), 0)
		end)
	end, serverWide)
end

function tick_stomp(cfg, serverWide)
	cfg = getAura("stomp")
	local power = tonumber(cfg.power) or S.flingPower or 8000
	local depth = math.clamp(power / 300, 10, 60)
	local slam = math.clamp(power * 3, 3000, 100000)

	local function buryModel(model, root)
		if not model or not root then return end
		pcall(function()
			local saved = buriedPartState[model]
			if not saved then saved = {}; buriedPartState[model] = saved end
			for _, d in ipairs(model:GetDescendants()) do
				if d:IsA("BasePart") then
					if not saved[d] then
						saved[d] = { CanCollide = d.CanCollide, CanQuery = d.CanQuery }
					end
					d.CanCollide = false
					d.CanQuery = false
				end
			end
			local hum = model:FindFirstChildOfClass("Humanoid")
			if hum then
				hum.Sit = false
				hum.PlatformStand = true
				hum:ChangeState(Enum.HumanoidStateType.Physics)
			end
			clearTargetMovers(model)
			destroyGrabOn(root)
			local pos = root.Position
			local underY = pos.Y - depth
			root.CFrame = CFrame.new(pos.X, underY, pos.Z)
			local bv = root:FindFirstChild("VOIDZ_BuryBV")
			if not bv then
				bv = Instance.new("BodyVelocity")
				bv.Name = "VOIDZ_BuryBV"
				bv.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
				bv.Parent = root
			end
			bv.Velocity = Vector3.new(0, -slam, 0)
			root.AssemblyLinearVelocity = Vector3.new(0, -slam, 0)
			local bp = root:FindFirstChild("VOIDZ_BuryBP")
			if not bp then
				bp = Instance.new("BodyPosition")
				bp.Name = "VOIDZ_BuryBP"
				bp.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
				bp.D = 2000
				bp.P = 1e5
				bp.Parent = root
			end
			bp.Position = Vector3.new(pos.X, underY - 8, pos.Z)
		end)
	end

	eachAuraTarget(cfg, function(p, r)
		buryModel(p.Character, r)
	end, nil, serverWide)
end

function tick_orbit(cfg, serverWide)
	cfg = getAura(_Vzd({148,151,135,142,153}))
	local radius = math.clamp((cfg.range or 50) * 0.35, 8, 40)
	local power = cfg.power or 2500
	local speed = math.clamp(power / 800, 1.5, 8)
	eachAuraTarget(cfg, function(p, r)
		local center = auraHomeCF and auraHomeCF.Position or (hrp() and hrp().Position) or r.Position
		local key = p.UserId
		orbitAngles[key] = (orbitAngles[key] or math.random() * math.pi * 2) + speed * 0.12
		local a = orbitAngles[key]
		local target = center + Vector3.new(math.cos(a) * radius, 6 + math.sin(a * 2) * 2, math.sin(a) * radius)
		pcall(function()
			local bp = r:FindFirstChild("VOIDZ_OrbitBP")
			if not bp then
				bp = Instance.new("BodyPosition")
				bp.Name = "VOIDZ_OrbitBP"
				bp.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
				bp.D = 800
				bp.P = 12000
				bp.Parent = r
				Debris:AddItem(bp, 0.5)
			end
			bp.Position = target
			r.AssemblyLinearVelocity = Vector3.zero
		end)
	end, function(part)
		sno(part)
		local center = auraHomeCF and auraHomeCF.Position or (hrp() and hrp().Position) or part.Position
		local a = tick() * speed
		local target = center + Vector3.new(math.cos(a) * radius, 4, math.sin(a) * radius)
		pcall(function() part.CFrame = CFrame.new(target) end)
	end, serverWide)
end

function tick_yeet(cfg, serverWide)
	cfg = getAura("yeet")
	eachAuraTarget(cfg, function(p, r, power)
		local me = hrp()
		if not me then return end
		local dir = r.Position - me.Position
		dir = Vector3.new(dir.X, 0, dir.Z)
		if dir.Magnitude < 0.1 then dir = Vector3.new(0, 0, -1) end
		dir = dir.Unit
		pcall(function()
			r.AssemblyLinearVelocity = dir * math.clamp(power, 400, 50000)
			r.AssemblyAngularVelocity = Vector3.zero
		end)
	end, function(part, power)
		sno(part)
		local me = hrp()
		local dir = me and (part.Position - me.Position).Unit or Vector3.new(0, 0, -1)
		pcall(function()
			part.AssemblyLinearVelocity = dir * math.clamp(power * 0.5, 200, 25000)
		end)
	end, serverWide)
end

do local _z668=(2*6); if _z668<0 and _Vj() then _z668=_z668+1 end end

function tick_soft(cfg, serverWide)
	cfg = getAura("soft")
	local cam = workspace.CurrentCamera
	local look = cam and cam.CFrame.LookVector or Vector3.new(0, 0, -1)
	local dir = Vector3.new(look.X, 0.15, look.Z)
	if dir.Magnitude < 1e-3 then dir = Vector3.new(0, 0.15, -1) end
	dir = dir.Unit
	eachAuraTarget(cfg, function(p, r, power)
		pcall(function()
			r.AssemblyLinearVelocity = dir * math.clamp(power * 0.08, 15, 120)
			r.AssemblyAngularVelocity = Vector3.zero
		end)
	end, function(part, power)
		sno(part)
		pcall(function()
			part.AssemblyLinearVelocity = dir * math.clamp(power * 0.06, 10, 80)
		end)
	end, serverWide)
end

function tick_chaos(cfg, serverWide)
	cfg = getAura("chaos")
	eachAuraTarget(cfg, function(p, r, power)
		snoQuick(p, r)
		local v = Vector3.new(math.random(-10, 10), math.random(2, 10), math.random(-10, 10))
		if v.Magnitude < 1 then v = Vector3.yAxis end
		pcall(function() r.AssemblyLinearVelocity = v.Unit * power end)
	end, function(part, power)
		sno(part)
		pcall(function()
			part.AssemblyLinearVelocity = Vector3.new(math.random(-1, 1), 1, math.random(-1, 1)) * (power * 0.5)
		end)
	end, serverWide)
end

function tick_freeze(cfg, serverWide)
	cfg = getAura(_Vzd({139,151,138,138,159,138}))
	eachAuraTarget(cfg, function(p, r)
		pcall(function()
			r.AssemblyLinearVelocity = Vector3.zero
			r.AssemblyAngularVelocity = Vector3.zero
			local bp = r:FindFirstChild("VOIDZ_FreezeBP") or Instance.new("BodyPosition")
			bp.Name = "VOIDZ_FreezeBP"
			bp.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
			bp.P = 5e4
			bp.D = 1e3
			bp.Position = r.Position
			bp.Parent = r
			Debris:AddItem(bp, 0.4)
		end)
	end, function(part)
		sno(part)
		pcall(function() part.AssemblyLinearVelocity = Vector3.zero end)
	end, serverWide)
end

function tick_launch(cfg, serverWide)
	cfg = getAura("launch")
	eachAuraTarget(cfg, function(p, r, power)
		pcall(function()
			local upForce = math.clamp(power, 500, 10000)
			local bv = r:FindFirstChild("VOIDZ_LaunchBV")
			if not bv then
				bv = Instance.new("BodyVelocity")
				bv.Name = "VOIDZ_LaunchBV"
				bv.MaxForce = Vector3.new(0, math.huge, 0)
				bv.P = 5000
				bv.Parent = r
			end
			bv.Velocity = Vector3.new(0, upForce, 0)
			Debris:AddItem(bv, 0.35)
			r.AssemblyLinearVelocity = Vector3.new(r.AssemblyLinearVelocity.X, upForce * 0.5, r.AssemblyLinearVelocity.Z)
		end)
	end, function(part, power)
		sno(part)
		pcall(function()
			part.AssemblyLinearVelocity = Vector3.new(0, math.clamp(power * 0.5, 200, 10000), 0)
		end)
	end, serverWide)
end

function tick_spike(cfg, serverWide)
	cfg = getAura("spike")
	eachAuraTarget(cfg, function(p, r, power)
		applyVelBurst(r, power, 2.5)
		task.delay(0.12, function()
			if r.Parent then applyVelBurst(r, power, -3) end
		end)
	end, function(part, power)
		sno(part)
		applyVelBurst(part, power, 2)
	end, serverWide)
end

function tick_repel(cfg, serverWide)
	cfg = getAura(_Vzd({151,138,149,138,145}))
	eachAuraTarget(cfg, function(p, r, power)
		local center = auraHomeCF and auraHomeCF.Position or (hrp() and hrp().Position) or Vector3.zero
		local d = r.Position - center
		if d.Magnitude > 0.5 then
			local dir = d.Unit
			applyVel(r, math.clamp(power, 400, 50000), 0.3)
			pcall(function()
				r.AssemblyLinearVelocity = dir * math.clamp(power / 12, 80, 600)
			end)
		end
	end, function(part, power)
		sno(part)
		local center = auraHomeCF and auraHomeCF.Position or (hrp() and hrp().Position) or Vector3.zero
		local d = part.Position - center
		if d.Magnitude > 0.5 then
			applyVel(part, math.clamp(power, 400, 50000), 0.3)
			pcall(function()
				part.AssemblyLinearVelocity = d.Unit * math.clamp(power / 15, 60, 400)
			end)
		end
	end, serverWide)
end

function tick_flatten(cfg, serverWide)
	cfg = getAura(_Vzd({139,145,134,153,153,138,147}))
	eachAuraTarget(cfg, function(p, r, power)
		pcall(function()
			local hv = r.AssemblyLinearVelocity
			r.AssemblyLinearVelocity = Vector3.new(hv.X * 0.3, -math.clamp(power * 0.4, 50, 600), hv.Z * 0.3)
			r.AssemblyAngularVelocity = Vector3.zero
			local bp = r:FindFirstChild("VOIDZ_FlattenBP")
			if not bp then
				bp = Instance.new("BodyPosition")
				bp.Name = "VOIDZ_FlattenBP"
				bp.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
				bp.D = 2500
				bp.P = 1e5
				bp.Parent = r
			end
			bp.Position = Vector3.new(r.Position.X, r.Position.Y - 2, r.Position.Z)
			Debris:AddItem(bp, 0.35)
		end)
	end, function(part, power)
		sno(part)
		pcall(function()
			local hv = part.AssemblyLinearVelocity
			part.AssemblyLinearVelocity = Vector3.new(hv.X * 0.3, -math.clamp(power * 0.3, 30, 400), hv.Z * 0.3)
		end)
	end, serverWide)
end

function tick_poison(cfg, serverWide)
	cfg = getAura(_Vzd({149,148,142,152,148,147}))
	eachAuraTarget(cfg, function(p)
		local head = p.Character and p.Character:FindFirstChild("Head")
		if not head then return end
		local hurts = getPoisonHurtParts()
		for _, hurt in ipairs(hurts) do pcall(function() hurt.CFrame = head.CFrame end) end
		task.wait()
		for _, hurt in ipairs(hurts) do pcall(function() hurt.Position = Vector3.new(0, -50, 0) end) end
	end, nil, serverWide)
end

function tick_burnaura(cfg, serverWide)
	cfg = getAura("burnaura")
	local model, primary, tip = getStatusToy("Campfire")
	if not tip or not tip:IsA("BasePart") then return end
	tip.Size = Vector3.new(2, 2, 2)
	tip.CanCollide = false
	local home = primary and primary.Position or Vector3.new(0, 400, 0)
	eachAuraTarget(cfg, function(_, r)
		pcall(function()
			tip.Position = r.Position
			task.wait()
			tip.Position = home
		end)
	end, nil, serverWide)
	if primary then parkStatusToy(model, primary) end
end

local tkAngles = {}
function tick_telekinesis(cfg, serverWide)
	cfg = getAura("telekinesis")
	local me = hrp()
	if not me then return end
	local shape = S.tkShape or "Tornado"
	local cam = workspace.CurrentCamera
	local mouseHit = nil
	pcall(function()
		if Mouse and Mouse.Hit then mouseHit = Mouse.Hit.Position end
	end)
	local center = mouseHit or (cam and (cam.CFrame.Position + cam.CFrame.LookVector * 40)) or me.Position
	eachAuraTarget(cfg, function(p, r, power)
		if shape == "Blackhole" then
			local d = center - r.Position
			if d.Magnitude > 1 then
				pcall(function()
					createBringBody(r, CFrame.new(center))
					r.AssemblyLinearVelocity = d.Unit * math.clamp(power / 25, 40, 250)
				end)
			end
		else
			local id = p.UserId
			tkAngles[id] = (tkAngles[id] or 0) + 0.18
			local ang = tkAngles[id]
			local rad = 8 + (p.UserId % 5)
			local pos = center + Vector3.new(math.cos(ang) * rad, 4 + math.sin(ang * 2) * 2, math.sin(ang) * rad)
			pcall(function()
				createBringBody(r, CFrame.new(pos))
				r.AssemblyLinearVelocity = Vector3.new(0, math.clamp(power / 80, 20, 80), 0)
			end)
		end
	end, function(part, power)
		sno(part)
		if shape == "Blackhole" then
			local d = center - part.Position
			if d.Magnitude > 1 then
				part.AssemblyLinearVelocity = d.Unit * 60
			end
		end
	end, serverWide)
end

function tick_blackhole(cfg, serverWide)
	S.tkShape = "Blackhole"
	tick_telekinesis(cfg, serverWide)
end

function tick_tornado(cfg, serverWide)
	S.tkShape = "Tornado"
	tick_telekinesis(cfg, serverWide)
end

local AURA_TICKS = {
	netown = function() tick_netown(nil, false) end,
	fling = function() tick_fling(nil, false) end,
	kick = function() tick_kick(nil, false) end,
	death = function() tick_death(nil, false) end,
	anchor = function() tick_anchor(nil, false) end,
	attract = function() tick_attract(nil, false) end,
	sky = function() tick_sky(nil, false) end,
	spin = function() tick_spin(nil, false) end,
	ragdoll = function() tick_ragdoll(nil, false) end,
	bring = function() tick_bring(nil, false) end,
	void = function() tick_void(nil, false) end,
	stomp = function() tick_stomp(nil, false) end,
	orbit = function() tick_orbit(nil, false) end,
	yeet = function() tick_yeet(nil, false) end,
	soft = function() tick_soft(nil, false) end,
	chaos = function() tick_chaos(nil, false) end,
	freeze = function() tick_freeze(nil, false) end,
	launch = function() tick_launch(nil, false) end,
	spike = function() tick_spike(nil, false) end,
	repel = function() tick_repel(nil, false) end,
	flatten = function() tick_flatten(nil, false) end,
	poison = function() tick_poison(nil, false) end,
	burnaura = function() tick_burnaura(nil, false) end,
	telekinesis = function() tick_telekinesis(nil, false) end,
	tornado = function() tick_tornado(nil, false) end,
	blackhole = function() tick_blackhole(nil, false) end,
}

local SERVER_TICKS = {
	netown = function() tick_netown(nil, true) end,
	fling = function() tick_fling(nil, true) end,
	kick = function() tick_kick(nil, true) end,
	death = function() tick_death(nil, true) end,
	anchor = function() tick_anchor(nil, true) end,
	attract = function() tick_attract(nil, true) end,
	sky = function() tick_sky(nil, true) end,
	spin = function() tick_spin(nil, true) end,
	ragdoll = function() tick_ragdoll(nil, true) end,
	bring = function() tick_bring(nil, true) end,
	void = function() tick_void(nil, true) end,
	stomp = function() tick_stomp(nil, true) end,
	orbit = function() tick_orbit(nil, true) end,
	yeet = function() tick_yeet(nil, true) end,
	soft = function() tick_soft(nil, true) end,
	chaos = function() tick_chaos(nil, true) end,
	freeze = function() tick_freeze(nil, true) end,
	launch = function() tick_launch(nil, true) end,
	spike = function() tick_spike(nil, true) end,
	repel = function() tick_repel(nil, true) end,
	flatten = function() tick_flatten(nil, true) end,
	poison = function() tick_poison(nil, true) end,
	burnaura = function() tick_burnaura(nil, true) end,
	telekinesis = function() tick_telekinesis(nil, true) end,
	tornado = function() tick_tornado(nil, true) end,
	blackhole = function() tick_blackhole(nil, true) end,
}

local AURA_META = {
	{ id = "netown", title = "Own Nearby", tip = _Vzd({115,138,153,156,148,151,144,69,148,156,147,69,147,138,134,151,135,158,69,149,145,134,158,138,151,152,69,77,149,151,148,157,142,146,142,153,158,78,83}) },
	{ id = "fling", title = _Vzd({107,145,142,147,140,69,115,138,134,151,135,158}), tip = "Fling nearby players (proximity)." },
	{ id = "kick", title = "Kick Nearby", tip = "Sky kick nearby players (proximity)." },
	{ id = _Vzd({137,138,134,153,141}), title = _Vzd({112,142,145,145,69,115,138,134,151,135,158}), tip = _Vzd({112,142,145,145,69,147,138,134,151,135,158,69,149,145,134,158,138,151,152,69,77,149,151,148,157,142,146,142,153,158,78,83}) },
	{ id = "poison", title = _Vzd({117,148,142,152,148,147,69,115,138,134,151,135,158}), tip = _Vzd({117,148,142,152,148,147,69,147,138,134,151,135,158,69,149,145,134,158,138,151,152,69,77,149,151,148,157,142,146,142,153,158,78,83}) },
	{ id = "burnaura", title = _Vzd({103,154,151,147,69,115,138,134,151,135,158}), tip = _Vzd({103,154,151,147,69,147,138,134,151,135,158,69,149,145,134,158,138,151,152,69,77,149,151,148,157,142,146,142,153,158,78,83}) },
	{ id = "anchor", title = "Brief Freeze Nearby", tip = "Anchor them for a moment — quick pause then release." },
	{ id = "tornado", title = _Vzd({121,148,151,147,134,137,148,69,115,138,134,151,135,158}), tip = "Spin-lift nearby players (proximity)." },
	{ id = "blackhole", title = _Vzd({117,154,145,145,69,121,148,69,104,154,151,152,148,151}), tip = _Vzd({120,154,136,144,69,147,138,134,151,135,158,69,149,145,134,158,138,151,152,69,153,148,69,136,154,151,152,148,151,69,137,142,151,138,136,153,142,148,147,69,77,149,151,148,157,142,146,142,153,158,78,83}) },
	{ id = "attract", title = _Vzd({117,154,145,145,69,115,138,134,151,135,158,69,121,148,69,114,138}), tip = _Vzd({120,154,136,144,69,147,138,134,151,135,158,69,149,145,134,158,138,151,152,69,153,148,156,134,151,137,69,158,148,154,69,77,149,151,148,157,142,146,142,153,158,78,83}) },
	{ id = "repel", title = "Push Nearby Away", tip = _Vzd({117,154,152,141,69,147,138,134,151,135,158,69,149,145,134,158,138,151,152,69,134,156,134,158,69,77,149,151,148,157,142,146,142,153,158,78,83}) },
	{ id = "sky", title = "Sky Blast", tip = "Big vertical impulse — they fly up high and fall back." },
	{ id = "ragdoll", title = "Ragdoll Nearby", tip = _Vzd({119,134,140,137,148,145,145,69,147,138,134,151,135,158,69,149,145,134,158,138,151,152,69,77,149,151,148,157,142,146,142,153,158,78,83}) },
	{ id = "bring", title = _Vzd({103,151,142,147,140,69,115,138,134,151,135,158}), tip = _Vzd({103,151,142,147,140,69,147,138,134,151,135,158,69,149,145,134,158,138,151,152,69,142,147,69,139,151,148,147,153,69,148,139,69,158,148,154,69,77,149,151,148,157,142,146,142,153,158,78,83}) },
	{ id = "void", title = "Phase Through Floor", tip = "Disable collision + drop — they phase through the ground." },
	{ id = _Vzd({152,153,148,146,149}), title = _Vzd({103,154,151,158,69,122,147,137,138,151,140,151,148,154,147,137}), tip = _Vzd({115,148,136,145,142,149,69,80,69,152,145,134,146,69,153,141,138,146,69,154,147,137,138,151,140,151,148,154,147,137,69,134,147,137,69,141,148,145,137,69,153,141,138,146,69,153,141,138,151,138,83}) },
	{ id = "orbit", title = _Vzd({116,151,135,142,153,69,115,138,134,151,135,158}), tip = _Vzd({120,149,142,147,69,147,138,134,151,135,158,69,149,145,134,158,138,151,152,69,134,151,148,154,147,137,69,158,148,154,69,77,149,151,148,157,142,146,142,153,158,78,83}) },
	{ id = "yeet", title = _Vzd({126,138,138,153,69,115,138,134,151,135,158}), tip = _Vzd({109,148,151,142,159,148,147,153,134,145,69,145,134,154,147,136,141,69,153,148,156,134,151,137,69,153,134,151,140,138,153,69,137,142,151,138,136,153,142,148,147,69,77,145,142,144,138,69,153,141,151,148,156,142,147,140,69,134,69,135,134,145,145,78,83}) },
	{ id = "soft", title = _Vzd({120,148,139,153,69,117,154,152,141}), tip = "Gentle camera-direction nudge (light poke, no spin)." },
	{ id = "launch", title = _Vzd({113,138,155,142,153,134,153,138,69,115,138,134,151,135,158}), tip = "Continuous upward force — keeps lifting them while on." },
	{ id = "spike", title = _Vzd({120,149,142,144,138,69,115,138,134,151,135,158}), tip = _Vzd({118,154,142,136,144,69,154,149,69,153,141,138,147,69,137,148,156,147,69,135,154,151,152,153,69,147,138,134,151,135,158,69,77,149,151,148,157,142,146,142,153,158,78,83}) },
	{ id = "freeze", title = _Vzd({109,148,145,137,69,115,138,134,151,135,158,69,120,153,142,145,145}), tip = _Vzd({104,148,147,153,142,147,154,148,154,152,69,103,148,137,158,117,148,152,142,153,142,148,147,69,149,142,147,69,57,69,139,151,148,159,138,147,69,142,147,69,149,145,134,136,138,69,156,141,142,145,138,69,148,147,83}) },
	{ id = "chaos", title = _Vzd({119,134,147,137,148,146,69,107,145,142,147,140,69,115,138,134,151,135,158}), tip = _Vzd({119,134,147,137,148,146,69,137,142,151,138,136,153,142,148,147,152,69,148,147,69,147,138,134,151,135,158,69,149,145,134,158,138,151,152,69,77,149,151,148,157,142,146,142,153,158,78,83}) },
	{ id = _Vzd({139,145,134,153,153,138,147}), title = _Vzd({108,151,148,154,147,137,69,117,151,138,152,152,69,115,138,134,151,135,158}), tip = _Vzd({104,148,147,153,142,147,154,148,154,152,69,137,148,156,147,156,134,151,137,69,149,151,138,152,152,154,151,138,69,57,69,149,151,138,152,152,69,142,147,153,148,69,140,151,148,154,147,137,69,156,142,153,141,148,154,153,69,135,154,151,158,142,147,140,83}) },
}

for _, m in ipairs(AURA_META) do
	local c = getAura(m.id)
	c._id = m.id
end

function setAura(id, on)
	stopLoop("aura_" .. id)
	if on and AURA_TICKS[id] then
		local interval = 0.15
		startLoop("aura_" .. id, interval, AURA_TICKS[id])
		notify(HUB_NAME, _Vzd({102,154,151,134,69}) .. id .. " ON", 1.2)
	else
		cleanupAura(id)
	end
end

function setServerFx(id, on)
	stopLoop("srv_" .. id)
	S.toggles["srv_" .. id] = on == true
	if on and SERVER_TICKS[id] then
		startLoop("srv_" .. id, 0.15, SERVER_TICKS[id])
		notify(HUB_NAME, "Server " .. id .. _Vzd({69,116,115,69,220,69,146,134,149,82,156,142,137,138}), 1.5)
	elseif not on then
		notify(HUB_NAME, _Vzd({120,138,151,155,138,151,69}) .. id .. " OFF", 1)
	end
end

local antiGrabTick
local doAntiGrabHard
local antiGrabInstalled = false
local extinguishPart

function getExtinguishPart()
	if extinguishPart and extinguishPart.Parent then return extinguishPart end
	pcall(function()
		local map = workspace:FindFirstChild("Map")
		local hole = map and map:FindFirstChild("Hole")
		local poison = hole and hole:FindFirstChild("PoisonBigHole")
		local ep = poison and poison:FindFirstChild("ExtinguishPart")
		if ep and ep:IsA(_Vzd({103,134,152,138,117,134,151,153})) then
			extinguishPart = ep
			ep.Size = Vector3.new(0.5, 0.5, 0.5)
			ep.Transparency = 1
		end
	end)
	return extinguishPart
end

function extinguishFire()
	local r = hrp()
	if not r then return end
	local fpp = r:FindFirstChild("FirePlayerPart")
	if not fpp then return end
	local canBurn = fpp:FindFirstChild("CanBurn")
	if canBurn and canBurn:IsA("BoolValue") and not canBurn.Value then return end
	local ep = getExtinguishPart()
	if not ep then
		for _, d in ipairs(char() and char():GetDescendants() or {}) do
			if d:IsA("Fire") or d:IsA("Smoke") then pcall(function() d:Destroy() end) end
		end
		return
	end
	if firetouchinterest then
		pcall(function()
			firetouchinterest(fpp, ep, 0)
			task.wait()
			firetouchinterest(fpp, ep, 1)
		end)
	else
		pcall(function()
			local old = ep.CFrame
			ep.CFrame = fpp.CFrame * CFrame.new(math.random(-1, 1), math.random(-1, 1), math.random(-1, 1))
			task.wait()
			ep.Position = Vector3.new(0, -100, 0)
			ep.CFrame = old
		end)
	end
	if canBurn then pcall(function() canBurn.Value = false end) end
end

function antiBurnTick()
	if not S.toggles.antiBurn then return end
	extinguishFire()
	local c = char()
	if not c then return end
	for _, d in ipairs(c:GetDescendants()) do
		if d:IsA("Fire") or d:IsA("Smoke") then pcall(function() d:Destroy() end) end
		local n = d.Name:lower()
		if n:find("fire") or n:find("burn") or n:find("poison") then
			if d:IsA("BoolValue") then pcall(function() d.Value = false end) end
		end
	end
end

function antiPaintTick()
	if not S.toggles.antiPaint then return end
	local c = char()
	if not c then return end
	for _, d in ipairs(c:GetDescendants()) do
		local n = d.Name:lower()
		if n:find("paint") or n:find("spray") or n:find(_Vzd({136,148,145,148,151})) then
			if d:IsA("Decal") or d:IsA("Texture") or d:IsA("ParticleEmitter") then
				pcall(function() d:Destroy() end)
			elseif d:IsA("BoolValue") or d:IsA("StringValue") or d:IsA("NumberValue") then
				pcall(function()
					if d:IsA("BoolValue") then d.Value = false end
				end)
			end
		end
	end
	local bc = c:FindFirstChildOfClass("BodyColors")
	if bc then
		pcall(function()
		end)
	end
end

function antiBananaTick()
	local c = char()
	if not c then return end
	for _, d in ipairs(c:GetDescendants()) do
		local n = d.Name:lower()
		if n:find("banana") or n:find("slip") or n:find("food") then
			pcall(function() d:Destroy() end)
		end
	end
	local me = hrp()
	if me then
		for _, d in ipairs(workspace:GetChildren()) do
			if d.Name:lower():find("banana") or d.Name == "FoodBanana" then
				for _, part in ipairs(d:GetDescendants()) do
					if part:IsA("BasePart") and (part.Position - me.Position).Magnitude < 14 then
						pcall(function() part.CanCollide = false; part.CanTouch = false end)
					end
				end
			end
		end
	end
	local h = hum()
	if h then
		pcall(function()
			h.Sit = false
			h.PlatformStand = false
		end)
	end
end

function antiVoidTick()
	pcall(function() workspace.FallenPartsDestroyHeight = -1000 end)
	local r = hrp()
	if r and r.Position.Y < -800 then
		pcall(function()
			local c = char()
			if c then c:SetPrimaryPartCFrame(CFrame.new(0, 20, 0)) end
			r.CFrame = CFrame.new(0, 20, 0)
			r.AssemblyLinearVelocity = Vector3.zero
		end)
	end
end

function antiFlingTick()
	local r = hrp()
	if not r then return end
	local h = hum()
	local rag = h and h:FindFirstChild("Ragdolled")
	if S.toggles.antiExplode and rag and rag.Value then
		if not (LP:FindFirstChild("IsHeld") and LP.IsHeld.Value) then
			r.Anchored = true
			r.AssemblyLinearVelocity = Vector3.zero
			r.Velocity = Vector3.zero
		else
			r.Anchored = false
		end
	elseif r.AssemblyLinearVelocity.Magnitude > 150 then
		r.AssemblyLinearVelocity = Vector3.zero
		r.AssemblyAngularVelocity = Vector3.zero
	end
	if rag and not rag.Value and r.Anchored and S.toggles.antiExplode then
		r.Anchored = false
	end
end

function antiStickyTick()
	if not S.toggles.antiSticky then return end
	local c = char()
	if not c then return end
	for _, d in ipairs(c:GetDescendants()) do
		if d:IsA("BasePart") and d.Massless then
			pcall(function() d.Massless = false end)
		end
		local n = d.Name:lower()
		if n:find("sticky", 1, true) then
			if d:IsA("Weld") or d:IsA(_Vzd({124,138,145,137,104,148,147,152,153,151,134,142,147,153})) or d:IsA("RigidConstraint") then
				pcall(function() d:Destroy() end)
			end
		end
	end
	for _, ch in ipairs(workspace:GetChildren()) do
		if tostring(ch.Name):lower():find("sticky") or ch.Name == "SprayCanWD" then
			for _, d in ipairs(ch:GetDescendants()) do
				if d:IsA("WeldConstraint") or d:IsA("Weld") then
					local p0, p1 = d.Part0, d.Part1
					if (p0 and p0:IsDescendantOf(c)) or (p1 and p1:IsDescendantOf(c)) then
						pcall(function() d:Destroy() end)
					end
				end
			end
		end
	end
	pcall(function()
		local r = hrp()
		if not r then return end
		local folder = workspace:FindFirstChild(LP.Name .. "SpawnedInToys")
		if not folder then return end
		for _, m in ipairs(folder:GetChildren()) do
			local rem = m:FindFirstChild("StickyRemoverPart", true)
			if rem and rem:IsA("BasePart") then
				rem.CFrame = r.CFrame
				if firetouchinterest then
					firetouchinterest(rem, r, 0)
					task.wait()
					firetouchinterest(rem, r, 1)
				end
			end
		end
	end)
end

function antiBlobmanTick()
	if not S.toggles.antiBlobman then return end
	local h = hum()
	if not h or not h.Sit then return end
	local seat = h.SeatPart
	if not seat then return end
	local par = seat.Parent
	local n = (par and tostring(par.Name) or seat.Name):lower()
	if n:find("blob") or n:find("train")
		or (par and par:FindFirstChild("BlobmanSeatAndOwnerScript")) then
		pcall(function()
			h.Sit = false
			h.PlatformStand = false
			h:ChangeState(Enum.HumanoidStateType.Jumping)
		end)
	end
end

do local _z416=(7*7); if _z416<0 and _Vj() then _z416=_z416+1 end end

function setAntiLag(on)
	S.toggles.antiLag = on == true
	pcall(function()
		local ps = LP:FindFirstChild("PlayerScripts")
		if not ps then return end
		local beam = ps:FindFirstChild("CharacterAndBeamMove")
			or ps:FindFirstChild("CharacterAndBeamMove", true)
		if beam and (beam:IsA("LocalScript") or beam:IsA("Script")) then
			beam.Disabled = on == true
			notify(HUB_NAME, _Vzd({102,147,153,142,82,113,134,140,69}) .. (on and _Vzd({116,115,69,77,135,138,134,146,69,152,136,151,142,149,153,69,148,139,139,78}) or "OFF"), 2)
		else
			notify(HUB_NAME, _Vzd({102,147,153,142,82,113,134,140,95,69,104,141,134,151,134,136,153,138,151,102,147,137,103,138,134,146,114,148,155,138,69,147,148,153,69,139,148,154,147,137}), 2)
		end
	end)
end

local setWaterWalk
(function()
local waterPartBackup = {}
local waterTerrainBackup = {}
local waterSolidConn = nil

local function isWaterishPart(part)
	if not part or not part:IsA("BasePart") then return false end
	if part.Name == "VOIDZ_WaterWalk" then return false end
	if part.Material == Enum.Material.Water then return true end
	local n = part.Name:lower()
	if n:find("water", 1, true) or n:find("ocean", 1, true) or n:find("sea", 1, true)
		or n:find("lake", 1, true) or n:find("pool", 1, true) or n:find("river", 1, true) then
		return true
	end
	local p = part.Parent
	if p then
		local pn = p.Name:lower()
		if pn == "water" or pn:find("water", 1, true) or pn:find("ocean", 1, true) then
			return true
		end
	end
	return false
end

local function solidifyWaterPart(part)
	if not isWaterishPart(part) then return end
	if waterPartBackup[part] then
		pcall(function()
			part.CanCollide = true
		end)
		return
	end
	waterPartBackup[part] = {
		CanCollide = part.CanCollide,
		CanTouch = part.CanTouch,
		CanQuery = part.CanQuery,
	}
	pcall(function()
		part.CanCollide = true
	end)
end

local function restoreWaterParts()
	for part, st in pairs(waterPartBackup) do
		if part and part.Parent then
			pcall(function()
				part.CanCollide = st.CanCollide
				part.CanTouch = st.CanTouch
				part.CanQuery = st.CanQuery
			end)
		end
	end
	waterPartBackup = {}
end

local function copyVoxelGrid(src)
	local size = src.Size
	local out = {}
	for x = 1, size.X do
		out[x] = {}
		for y = 1, size.Y do
			out[x][y] = {}
			for z = 1, size.Z do
				out[x][y][z] = src[x][y][z]
			end
		end
	end
	out.Size = size
	return out
end

local function mapWaterBounds()
	local minV = Vector3.new(-2500, -40, -2500)
	local maxV = Vector3.new(2500, 120, 2500)
	local map = workspace:FindFirstChild("Map")
	if map then
		local ok, cf, size = pcall(function()
			if map:IsA("Model") then
				return map:GetBoundingBox()
			end
			return nil
		end)
		if ok and cf and size then
			local half = size * 0.5
			minV = Vector3.new(cf.Position.X - half.X - 40, math.min(cf.Position.Y - half.Y, -40), cf.Position.Z - half.Z - 40)
			maxV = Vector3.new(cf.Position.X + half.X + 40, math.max(cf.Position.Y + half.Y, 80), cf.Position.Z + half.Z + 40)
		end
	end
	minV = Vector3.new(minV.X, math.clamp(minV.Y, -60, 0), minV.Z)
	maxV = Vector3.new(maxV.X, math.clamp(maxV.Y, 20, 150), maxV.Z)
	return minV, maxV
end

local function solidifyTerrainWater()
	waterTerrainBackup = {}
	local Terrain = workspace.Terrain
	if not Terrain then return 0 end
	local minV, maxV = mapWaterBounds()
	local res = 4
	local step = 96
	local cells = 0
	for x = minV.X, maxV.X, step do
		for z = minV.Z, maxV.Z, step do
			local rmin = Vector3.new(x, minV.Y, z)
			local rmax = Vector3.new(math.min(x + step, maxV.X), maxV.Y, math.min(z + step, maxV.Z))
			if rmax.X > rmin.X and rmax.Y > rmin.Y and rmax.Z > rmin.Z then
				local ok, region = pcall(function()
					return Region3.new(rmin, rmax):ExpandToGrid(res)
				end)
				if ok and region then
					local ok2, materials, occupancies = pcall(function()
						return Terrain:ReadVoxels(region, res)
					end)
					if ok2 and materials and occupancies then
						local size = materials.Size
						local changed = false
						local origMats = nil
						local origOccs = nil
						for ix = 1, size.X do
							for iy = 1, size.Y do
								for iz = 1, size.Z do
									if materials[ix][iy][iz] == Enum.Material.Water then
										if not changed then
											origMats = copyVoxelGrid(materials)
											origOccs = copyVoxelGrid(occupancies)
											changed = true
										end
										materials[ix][iy][iz] = Enum.Material.Ice
										if occupancies[ix][iy][iz] < 0.5 then
											occupancies[ix][iy][iz] = 1
										end
										cells = cells + 1
									end
								end
							end
						end
						if changed then
							waterTerrainBackup[#waterTerrainBackup + 1] = {
								region = region,
								materials = origMats,
								occupancies = origOccs,
							}
							pcall(function()
								Terrain:WriteVoxels(region, res, materials, occupancies)
							end)
						end
					end
				end
			end
		end
		task.wait()
	end
	return cells
end

local function restoreTerrainWater()
	local Terrain = workspace.Terrain
	if not Terrain then
		waterTerrainBackup = {}
		return
	end
	for _, chunk in ipairs(waterTerrainBackup) do
		pcall(function()
			Terrain:WriteVoxels(chunk.region, 4, chunk.materials, chunk.occupancies)
		end)
	end
	waterTerrainBackup = {}
end

local function solidifyAllWaterParts()
	local n = 0
	for _, d in ipairs(workspace:GetDescendants()) do
		if isWaterishPart(d) then
			solidifyWaterPart(d)
			n = n + 1
		end
	end
	return n
end

setWaterWalk = function(on)
	S.toggles.waterWalk = on == true
	stopLoop("waterWalk")
	if waterSolidConn then
		pcall(function() waterSolidConn:Disconnect() end)
		waterSolidConn = nil
	end

	if not on then
		restoreWaterParts()
		restoreTerrainWater()
		notify(HUB_NAME, _Vzd({124,134,153,138,151,69,156,134,145,144,69,116,107,107,69,220,69,156,134,153,138,151,69,151,138,152,153,148,151,138,137}), 1.5)
		return
	end

	for _, d in ipairs(workspace:GetChildren()) do
		if d.Name == "VOIDZ_WaterWalk" then pcall(function() d:Destroy() end) end
	end

	local partCount = solidifyAllWaterParts()
	local cellCount = 0
	pcall(function() cellCount = solidifyTerrainWater() end)

	waterSolidConn = workspace.DescendantAdded:Connect(function(d)
		if not S.toggles.waterWalk then return end
		if isWaterishPart(d) then
			task.defer(function() solidifyWaterPart(d) end)
		end
	end)

	startLoop("waterWalk", 1.0, function()
		if not S.toggles.waterWalk then return end
		for part, _ in pairs(waterPartBackup) do
			if part and part.Parent and not part.CanCollide then
				pcall(function() part.CanCollide = true end)
			end
		end
	end)

	notify(HUB_NAME, "Water solid · " .. partCount .. _Vzd({69,149,134,151,153,152,69,220,69}) .. cellCount .. _Vzd({69,153,138,151,151,134,142,147,69,136,138,145,145,152}), 2.2)
end
end)()

function grabPartsIsAttackingUs(grabModel, ourChar)
	if not grabModel or not ourChar then return false end
	for _, d in ipairs(grabModel:GetDescendants()) do
		if d:IsA("WeldConstraint") or d:IsA("Weld") then
			local p0, p1 = d.Part0, d.Part1
			if p1 and p1:IsDescendantOf(ourChar) then return true end
			if p0 and p0:IsDescendantOf(ourChar) then
				local other = p1
				if other and not other:IsDescendantOf(ourChar) and not other:IsDescendantOf(grabModel) then
					return true
				end
			end
		end
	end
	return false
end

function plotHasOwner(plot)
	if not plot then return false end
	local sign = plot:FindFirstChild("PlotSign") or plot:FindFirstChild("PlotSign", true)
	if not sign then
		local owners = plot:FindFirstChild("ThisPlotsOwners", true)
		if not owners then return false end
		for _, v in ipairs(owners:GetChildren()) do
			local val = nil
			pcall(function() val = v.Value end)
			if val ~= nil and tostring(val) ~= "" then return true end
		end
		return false
	end
	local owners = sign:FindFirstChild("ThisPlotsOwners") or sign:FindFirstChild("ThisPlotsOwners", true)
	if not owners then return false end
	for _, v in ipairs(owners:GetChildren()) do
		local val = nil
		pcall(function() val = v.Value end)
		if val ~= nil and tostring(val) ~= "" then
			return true
		end
	end
	return false
end

function getPlotInteriorCF(plot)
	if not plot then return nil end
	local area = plot:FindFirstChild("PlotArea") or plot:FindFirstChild("PlotArea", true)
	if area and area:IsA("BasePart") then
		return CFrame.new(area.Position + Vector3.new(0, 4, 0))
	end
	for _, name in ipairs({ "Spawn", "SpawnLocation", "HouseSpawn", "InteriorSpawn", "Floor", "Base" }) do
		local p = plot:FindFirstChild(name, true)
		if p and p:IsA("BasePart") then
			return p.CFrame * CFrame.new(0, 3, 0)
		end
	end
	local best, bestVol = nil, 0
	for _, d in ipairs(plot:GetDescendants()) do
		if d:IsA("BasePart") and d.Anchored and d.Size.X * d.Size.Z > bestVol and d.Size.Y < 6 then
			bestVol = d.Size.X * d.Size.Z
			best = d
		end
	end
	if best then
		return CFrame.new(best.Position + Vector3.new(0, 4, 0))
	end
	if plot:IsA("Model") then
		local ok, pivot = pcall(function() return plot:GetPivot() end)
		if ok and pivot then return pivot * CFrame.new(0, 5, 0) end
	end
	return nil
end

do local _z231=(6*5); if _z231<0 and _Vj() then _z231=_z231+1 end end

function collectHouseSpots()
	local free, owned = {}, {}
	local plots = workspace:FindFirstChild("Plots")
	if plots then
		for _, plot in ipairs(plots:GetChildren()) do
			if plot:IsA("Model") or plot:IsA("Folder") then
				local cf = getPlotInteriorCF(plot)
				if cf then
					local entry = { cf = cf, name = plot.Name, free = not plotHasOwner(plot) }
					if entry.free then
						free[#free + 1] = entry
					else
						owned[#owned + 1] = entry
					end
				end
			end
		end
	end
	if #free == 0 and #owned == 0 then
		for _, d in ipairs(workspace:GetDescendants()) do
			if d.Name == "PlotArea" and d:IsA("BasePart") then
				local plot = d.Parent
				local cf = CFrame.new(d.Position + Vector3.new(0, 4, 0))
				local entry = { cf = cf, name = plot and plot.Name or "House", free = not plotHasOwner(plot) }
				if entry.free then free[#free + 1] = entry else owned[#owned + 1] = entry end
			end
		end
	end
	return free, owned
end

function tpToRandomHouse(reason)
	if not S.toggles.antiKill then return false end
	local now = tick()
	if now - (S.lastHouseTpAt or 0) < 0.65 then return false end
	local r = hrp()
	local h = hum()
	if not r then return false end

	local free, owned = collectHouseSpots()
	local pool = (#free > 0) and free or owned
	if #pool == 0 then
		if S.lastSafeCF then
			S.lastHouseTpAt = now
			pcall(function()
				r.CFrame = S.lastSafeCF
				r.AssemblyLinearVelocity = Vector3.zero
			end)
			notify(HUB_NAME, "Anti-kill · no houses found · last safe", 1.5)
			return true
		end
		notify(HUB_NAME, "Anti-kill · no house spots", 1.5)
		return false
	end

	local pick = pool[math.random(1, #pool)]
	S.lastHouseTpAt = now
	S.lastSafeCF = pick.cf

	pcall(function()
		r.AssemblyLinearVelocity = Vector3.zero
		r.AssemblyAngularVelocity = Vector3.zero
		r.Anchored = false
		r.CFrame = pick.cf
	end)
	if h then
		pcall(function()
			h.PlatformStand = false
			h.Sit = false
			h:ChangeState(Enum.HumanoidStateType.GettingUp)
		end)
	end
	if FTAP.Struggle then
		pcall(function() FTAP.Struggle:FireServer(LP) end)
		pcall(function() FTAP.Struggle:FireServer() end)
	end
	if FTAP.DestroyGrabLine then
		pcall(function() FTAP.DestroyGrabLine:FireServer(r) end)
	end

	local dest = pick.cf
	task.spawn(function()
		for _ = 1, 8 do
			local rr = hrp()
			if rr then
				pcall(function()
					rr.CFrame = dest
					rr.AssemblyLinearVelocity = Vector3.zero
					rr.AssemblyAngularVelocity = Vector3.zero
				end)
			end
			RunService.Heartbeat:Wait()
		end
	end)

	local tag = pick.free and _Vzd({138,146,149,153,158}) or "owned"
	local why = reason and (" · " .. reason) or ""
	notify(HUB_NAME, "House TP · " .. pick.name .. " (" .. tag .. ")" .. why, 1.6)
	return true
end

function isLocalPlayerGrabbed()
	local held = LP:FindFirstChild("IsHeld")
	if held and held.Value == true then return true end
	local c = char()
	if not c then return false end
	for _, child in ipairs(workspace:GetChildren()) do
		if child.Name == "GrabParts" and grabPartsIsAttackingUs(child, c) then
			return true
		end
	end
	return false
end

function antiKillTick()
	if not S.toggles.antiKill then return end
	local h, r = hum(), hrp()
	if not h or not r then return end

	local inWater = false
	pcall(function()
		if h:GetState() == Enum.HumanoidStateType.Swimming then inWater = true end
		if r.Position.Y < -8 then inWater = true end
		local ch = char()
		if ch then
			for _, p in ipairs(ch:GetDescendants()) do
				if p:IsA("BasePart") and p.Size.Y > 0 then
					if p.Position.Y < -8 then inWater = true break end
				end
			end
		end
	end)
	if inWater then
		tpToRandomHouse(_Vzd({156,134,153,138,151}))
		return
	end

	if isLocalPlayerGrabbed() then
		tpToRandomHouse("grab")
	end

	local maxRef = S.lastSafeHP or h.MaxHealth
	if h.Health >= maxRef - 0.5 then
		S.lastSafeHP = h.Health
	elseif h.Health < maxRef - 1.25 then
		tpToRandomHouse("damage")
		pcall(function()
			h.Health = math.max(h.Health, math.min(h.MaxHealth, maxRef * 0.9))
		end)
		S.lastSafeHP = h.Health
	end
end

function startAntiKillLoop()
	S.toggles.antiKill = true
	S.lastSafeHP = hum() and hum().Health
	S.lastSafeCF = hrp() and hrp().CFrame
	stopLoop("antiKill")
	startLoop("antiKill", 0.12, antiKillTick)
	if S.conns.antiKillHealth then
		pcall(function() S.conns.antiKillHealth:Disconnect() end)
		S.conns.antiKillHealth = nil
	end
	local h = hum()
	if h then
		S.conns.antiKillHealth = h.HealthChanged:Connect(function(hp)
			if not S.toggles.antiKill then return end
			local prev = S.lastSafeHP or h.MaxHealth
			if hp < prev - 1 then
				tpToRandomHouse("damage")
				S.lastSafeHP = h.Health
			else
				S.lastSafeHP = hp
			end
		end)
	end
	if S.conns.antiKillHeld then
		pcall(function() S.conns.antiKillHeld:Disconnect() end)
		S.conns.antiKillHeld = nil
	end
	local isHeld = LP:FindFirstChild("IsHeld")
	if isHeld then
		S.conns.antiKillHeld = isHeld.Changed:Connect(function(v)
			if v == true and S.toggles.antiKill then
				tpToRandomHouse("grab")
			end
		end)
	end
end

function stopAntiKillLoop()
	S.toggles.antiKill = false
	stopLoop("antiKill")
	if S.conns.antiKillHealth then
		pcall(function() S.conns.antiKillHealth:Disconnect() end)
		S.conns.antiKillHealth = nil
	end
	if S.conns.antiKillHeld then
		pcall(function() S.conns.antiKillHeld:Disconnect() end)
		S.conns.antiKillHeld = nil
	end
end

function restoreGroundPhysics()
	local r = hrp()
	local h = hum()
	if r then
		pcall(function()
			r.Anchored = false
			r.AssemblyAngularVelocity = Vector3.zero
		end)
	end
	if h then
		pcall(function()
			h.PlatformStand = false
			h.Sit = false
			h.AutoRotate = true
			h:SetStateEnabled(Enum.HumanoidStateType.Jumping, true)
			h:SetStateEnabled(Enum.HumanoidStateType.Running, true)
			h:SetStateEnabled(Enum.HumanoidStateType.GettingUp, true)
			h:SetStateEnabled(Enum.HumanoidStateType.FallingDown, false)
			h:SetStateEnabled(Enum.HumanoidStateType.Ragdoll, false)
			h:SetStateEnabled(Enum.HumanoidStateType.Physics, false)
			local st = h:GetState()
			if st == Enum.HumanoidStateType.Physics or st == Enum.HumanoidStateType.Ragdoll
				or st == Enum.HumanoidStateType.FallingDown or st == Enum.HumanoidStateType.Flying
				or st == Enum.HumanoidStateType.Seated then
				h:ChangeState(Enum.HumanoidStateType.GettingUp)
			end
			h:ChangeState(Enum.HumanoidStateType.Running)
		end)
	end
end

function isGucciVictim(c)
	c = c or char()
	if not c then return false end
	local held = LP:FindFirstChild("IsHeld")
	if held and held.Value == true then return true end
	local head = c:FindFirstChild("Head")
	if head and head:FindFirstChild("PartOwner") then
		local po = head.PartOwner
		local val = nil
		pcall(function() val = po.Value end)
		if val ~= nil and tostring(val) ~= "" and tostring(val) ~= LP.Name then
			return true
		end
	end
	for _, n in ipairs({ "HumanoidRootPart", "Torso", "UpperTorso" }) do
		local p = c:FindFirstChild(n)
		if p then
			local po = p:FindFirstChild("PartOwner")
			if po then
				local val = nil
				pcall(function() val = po.Value end)
				if val ~= nil and tostring(val) ~= "" and tostring(val) ~= LP.Name then
					return true
				end
			end
		end
	end
	for _, child in ipairs(workspace:GetChildren()) do
		if child.Name == "GrabParts" and grabPartsIsAttackingUs(child, c) then
			return true
		end
	end
	return false
end

function gucciStripForeignConstraints(c)
	c = c or char()
	if not c then return end
	for _, d in ipairs(c:GetDescendants()) do
		if d:IsA("WeldConstraint") or d:IsA("Weld") or d:IsA("RigidConstraint")
			or d:IsA("AlignPosition") or d:IsA("AlignOrientation")
			or d:IsA("BallSocketConstraint") or d:IsA(_Vzd({109,142,147,140,138,104,148,147,152,153,151,134,142,147,153})) then
			local p0 = d.Part0 or d.Attachment0
			local p1 = d.Part1 or d.Attachment1
			local a0 = d:IsA("Constraint") and d.Attachment0
			local a1 = d:IsA("Constraint") and d.Attachment1
			local foreign = false
			if d:IsA("WeldConstraint") or d:IsA("Weld") then
				if p0 and p0:IsDescendantOf(c) and p1 and not p1:IsDescendantOf(c) then foreign = true end
				if p1 and p1:IsDescendantOf(c) and p0 and not p0:IsDescendantOf(c) then foreign = true end
			elseif a0 and a1 then
				local par0 = a0.Parent
				local par1 = a1.Parent
				if par0 and par0:IsDescendantOf(c) and par1 and not par1:IsDescendantOf(c) then foreign = true end
				if par1 and par1:IsDescendantOf(c) and par0 and not par0:IsDescendantOf(c) then foreign = true end
			end
			if foreign then pcall(function() d:Destroy() end) end
		end
		if d:IsA("BodyVelocity") or d:IsA("BodyPosition") or d:IsA("BodyAngularVelocity")
			or d:IsA("BodyForce") or d:IsA("LinearVelocity") or d:IsA("VectorForce")
			or d:IsA("AngularVelocity") then
			local n = d.Name
			if n ~= "VOIDZ_Fly" and n ~= "VOIDZ_FlyG" and n ~= _Vzd({123,116,110,105,127,132,108,154,136,136,142,103,123})
				and n ~= "TrainDriveBV" and n ~= "TrainDriveBG" and n ~= "BringBody" then
				local par = d.Parent
				if par and par:IsA("BasePart") and par:IsDescendantOf(c) then
					pcall(function() d:Destroy() end)
				end
			end
		end
		if d.Name == "PartOwner" then
			local val = nil
			pcall(function() val = d.Value end)
			if val ~= nil and tostring(val) ~= "" and tostring(val) ~= LP.Name then
				pcall(function() d:Destroy() end)
			end
		end
	end
end

function gucciDestroyAttackingGrabs(c)
	c = c or char()
	if not c then return end
	for _, child in ipairs(workspace:GetChildren()) do
		if child.Name == _Vzd({108,151,134,135,117,134,151,153,152}) and grabPartsIsAttackingUs(child, c) then
			for _, d in ipairs(child:GetDescendants()) do
				if d:IsA("WeldConstraint") or d:IsA("Weld") or d:IsA("AlignPosition")
					or d:IsA("AlignOrientation") or d:IsA("Motor6D") or d:IsA("RigidConstraint") then
					pcall(function() d:Destroy() end)
				end
			end
			pcall(function() child:Destroy() end)
		end
	end
end

function gucciReclaimSelf()
	local c = char()
	local me = hrp()
	if not c or not me then return end
	for _, n in ipairs({ "HumanoidRootPart", "Head", "Torso", "UpperTorso", "LowerTorso",
		_Vzd({113,138,139,153,69,102,151,146}), "Right Arm", _Vzd({113,138,139,153,69,113,138,140}), _Vzd({119,142,140,141,153,69,113,138,140}),
		"LeftUpperArm", "RightUpperArm", "LeftLowerArm", "RightLowerArm",
		"LeftUpperLeg", "RightUpperLeg", _Vzd({113,138,139,153,113,148,156,138,151,113,138,140}), "RightLowerLeg" }) do
		local p = c:FindFirstChild(n)
		if p and p:IsA("BasePart") then
			sno(p, me.Position)
			pcall(function()
				p.Anchored = false
				p.Massless = false
			end)
		end
	end
end

function gucciForceFreeMove()
	local h = hum()
	local r = hrp()
	local c = char()
	if not h or not r or not c then return end
	pcall(function()
		r.Anchored = false
		h.PlatformStand = false
		h.Sit = false
		h.AutoRotate = true
		h:SetStateEnabled(Enum.HumanoidStateType.Jumping, true)
		h:SetStateEnabled(Enum.HumanoidStateType.Running, true)
		h:SetStateEnabled(Enum.HumanoidStateType.GettingUp, true)
		h:SetStateEnabled(Enum.HumanoidStateType.FallingDown, false)
		h:SetStateEnabled(Enum.HumanoidStateType.Ragdoll, false)
		h:SetStateEnabled(Enum.HumanoidStateType.Physics, false)
		local st = h:GetState()
		if st == Enum.HumanoidStateType.Physics or st == Enum.HumanoidStateType.Ragdoll
			or st == Enum.HumanoidStateType.FallingDown or st == Enum.HumanoidStateType.Seated then
			h:ChangeState(Enum.HumanoidStateType.GettingUp)
			h:ChangeState(Enum.HumanoidStateType.Running)
		end
	end)

	local md = h.MoveDirection
	local spd = 16
	if S.toggles.speed then
		spd = tonumber(S.walkSpeed) or 50
	else
		spd = math.max(tonumber(h.WalkSpeed) or 16, 16)
	end
	if S.toggles.speedCFrame then
		spd = spd * (tonumber(S.speedMult) or 1.5)
	end

	local bv = r:FindFirstChild("VOIDZ_GucciBV")
	if not bv then
		bv = Instance.new("BodyVelocity")
		bv.Name = "VOIDZ_GucciBV"
		bv.MaxForce = Vector3.new(1e5, 0, 1e5)
		bv.P = 1250
		bv.Parent = r
	end

	if md.Magnitude > 0.05 then
		local dir = md.Unit
		local push = dir * spd
		pcall(function()
			r.CFrame = r.CFrame + dir * (spd * 0.055)
			local y = r.AssemblyLinearVelocity.Y
			r.AssemblyLinearVelocity = Vector3.new(push.X * 1.15, y, push.Z * 1.15)
			bv.MaxForce = Vector3.new(1e9, 0, 1e9)
			bv.Velocity = Vector3.new(push.X, 0, push.Z)
		end)
	else
		pcall(function()
			bv.Velocity = Vector3.zero
			bv.MaxForce = Vector3.new(0, 0, 0)
		end)
	end

	if UserInputService:IsKeyDown(Enum.KeyCode.Space)
		or (UserInputService.TouchEnabled and h.Jump) then
		pcall(function()
			h.Jump = true
			h:ChangeState(Enum.HumanoidStateType.Jumping)
			local v = r.AssemblyLinearVelocity
			if v.Y < 35 then
				r.AssemblyLinearVelocity = Vector3.new(v.X, 42, v.Z)
			end
		end)
	end
end

function gucciBreakGrabNow()
	local c = char()
	local r = hrp()
	local h = hum()
	if not c or not r then return end

	pcall(function()
		r.Anchored = false
		if h then
			h.PlatformStand = false
			h.Sit = false
		end
	end)

	if FTAP.Struggle then
		for _ = 1, 6 do
			pcall(function() FTAP.Struggle:FireServer(LP) end)
			pcall(function() FTAP.Struggle:FireServer() end)
		end
	end
	if FTAP.StopAllVelocity then
		pcall(function() FTAP.StopAllVelocity:FireServer() end)
	end
	if FTAP.RagdollRemote then
		pcall(function() FTAP.RagdollRemote:FireServer(r, 0) end)
	end

	if FTAP.DestroyGrabLine then
		for _, n in ipairs({ "HumanoidRootPart", "Torso", "UpperTorso", "LowerTorso", "Head",
			_Vzd({113,138,139,153,69,102,151,146}), _Vzd({119,142,140,141,153,69,102,151,146}), "Left Leg", "Right Leg",
			"LeftUpperArm", "RightUpperArm", "LeftLowerArm", _Vzd({119,142,140,141,153,113,148,156,138,151,102,151,146}) }) do
			local p = c:FindFirstChild(n)
			if p then pcall(function() FTAP.DestroyGrabLine:FireServer(p) end) end
		end
		pcall(function() FTAP.DestroyGrabLine:FireServer(r) end)
	end

	gucciDestroyAttackingGrabs(c)
	gucciStripForeignConstraints(c)
	gucciReclaimSelf()
	gucciForceFreeMove()
end

function gucciAntiTick()
	if not (S.toggles.antiGucci or S.toggles.antiGrab) then return end
	local c = char()
	local r = hrp()
	if not c or not r then return end

	if S.toggles.antiBurn or S.toggles.antiGucci then
		extinguishFire()
	end
	if S.toggles.antiSticky or S.toggles.antiGucci then
		antiStickyTick()
	end

	if not isGucciVictim(c) then
		local bv = r:FindFirstChild("VOIDZ_GucciBV")
		if bv then pcall(function() bv:Destroy() end) end
		if r.Anchored and not S.toggles.antiExplode then
			r.Anchored = false
		end
		return
	end

	if S.toggles.antiKill then
		tpToRandomHouse("grab")
	end

	gucciBreakGrabNow()
	if doAntiGrabHard then pcall(doAntiGrabHard) end
	gucciForceFreeMove()

	if S.autoCounter or S.toggles.autoCounter then
		for _, bp in ipairs({ c:FindFirstChild("Head"), c:FindFirstChild("HumanoidRootPart"), c:FindFirstChild("Torso"), c:FindFirstChild("UpperTorso") }) do
			if bp then
				local po = bp:FindFirstChild("PartOwner")
				if po then
					local val = po.Value
					local grabberName = (typeof(val) == _Vzd({110,147,152,153,134,147,136,138}) and val:IsA("Player")) and val.Name or tostring(val or "")
					if grabberName ~= "" and grabberName ~= LP.Name then
						local grabberPlr = Players:FindFirstChild(grabberName)
						if grabberPlr and validP(grabberPlr) then
							counterAttackPlayer(grabberPlr, rootOf(grabberPlr))
							break
						end
					end
				end
			end
		end
	end
end

function installAntis()
	if antiGrabInstalled then return end
	antiGrabInstalled = true

	local function bindCharacter(c)
		if not c then return end
		local r = c:WaitForChild("HumanoidRootPart", 8)
		local h = c:WaitForChild("Humanoid", 8)
		if not r or not h then return end

		task.spawn(function()
			local fpp = r:FindFirstChild(_Vzd({107,142,151,138,117,145,134,158,138,151,117,134,151,153})) or r:WaitForChild("FirePlayerPart", 5)
			if not fpp then return end
			local canBurn = fpp:FindFirstChild("CanBurn") or fpp:WaitForChild("CanBurn", 3)
			if canBurn and canBurn:IsA(_Vzd({103,148,148,145,123,134,145,154,138})) then
				canBurn.Changed:Connect(function(v)
					if v and (S.toggles.antiBurn or S.toggles.antiGucci) then
						task.spawn(function()
							while canBurn.Value and (S.toggles.antiBurn or S.toggles.antiGucci) do
								extinguishFire()
								task.wait()
							end
						end)
					end
				end)
			end
		end)

		task.spawn(function()
			local head = c:WaitForChild("Head", 8)
			local hrp2 = c:WaitForChild("HumanoidRootPart", 8)
			local torso = c:FindFirstChild("Torso") or c:FindFirstChild("UpperTorso")
			local watchParts = {}
			if head then table.insert(watchParts, head) end
			if hrp2 then table.insert(watchParts, hrp2) end
			if torso then table.insert(watchParts, torso) end
			for _, part in ipairs(watchParts) do
				part.ChildAdded:Connect(function(ch)
					if ch.Name == "PartOwner" then
						if S.autoCounter or S.toggles.autoCounter then
							local grabberVal = ch.Value
							local grabberName = nil
							if typeof(grabberVal) == "Instance" and grabberVal:IsA(_Vzd({117,145,134,158,138,151})) then
								grabberName = grabberVal.Name
							elseif grabberVal then
								grabberName = tostring(grabberVal)
							end
							if grabberName and grabberName ~= LP.Name then
								local grabberPlr = Players:FindFirstChild(grabberName)
								if grabberPlr and validP(grabberPlr) then
									task.spawn(counterAttackPlayer, grabberPlr, rootOf(grabberPlr))
								end
							end
						end
						if S.toggles.antiGucci or S.toggles.antiGrab then
							task.defer(function()
								gucciBreakGrabNow()
								gucciAntiTick()
							end)
						end
					end
				end)
			end
		end)

		task.spawn(function()
			local h2 = c:FindFirstChildOfClass("Humanoid")
			if not h2 then return end
			h2:GetPropertyChangedSignal("Sit"):Connect(function()
				if not h2.Sit then return end
				if h2.SeatPart and h2.SeatPart.Parent and h2.SeatPart.Parent.Name == "CreatureBlobman" then return end
				if S.autoCounter or S.toggles.autoCounter then
					for _, bp in ipairs({ c:FindFirstChild("Head"), c:FindFirstChild("HumanoidRootPart"), c:FindFirstChild("Torso"), c:FindFirstChild("UpperTorso") }) do
						if bp then
							local po = bp:FindFirstChild("PartOwner")
							if po then
								local val = po.Value
								local grabberName = (typeof(val) == _Vzd({110,147,152,153,134,147,136,138}) and val:IsA("Player")) and val.Name or tostring(val or "")
								if grabberName ~= "" and grabberName ~= LP.Name then
									local grabberPlr = Players:FindFirstChild(grabberName)
									if grabberPlr and validP(grabberPlr) then
										task.spawn(counterAttackPlayer, grabberPlr, rootOf(grabberPlr))
										break
									end
								end
							end
						end
					end
				end
				if S.toggles.antiGucci or S.toggles.antiGrab then
					task.defer(function()
						h2:SetStateEnabled(Enum.HumanoidStateType.Jumping, true)
						h2.Sit = false
						gucciBreakGrabNow()
						gucciAntiTick()
					end)
				end
			end)
		end)

		local rag = h:FindFirstChild("Ragdolled")
		if rag and rag:IsA("BoolValue") then
			rag.Changed:Connect(function(v)
				if v and S.toggles.antiExplode then
					task.spawn(function()
						while rag.Value and S.toggles.antiExplode do
							local held = LP:FindFirstChild("IsHeld")
							if held and held.Value and not S.toggles.antiGrab and not S.toggles.antiGucci then
								r.Anchored = false
							else
								r.Anchored = true
								r.AssemblyLinearVelocity = Vector3.zero
							end
							task.wait()
						end
						r.AssemblyLinearVelocity = Vector3.zero
						r.Anchored = false
					end)
				end
			end)
		end
	end

	if LP.Character then task.spawn(bindCharacter, LP.Character) end
	LP.CharacterAdded:Connect(function(c) task.spawn(bindCharacter, c) end)

	local gucciAcc = 0
	bind("gucciAntiHB", RunService.Heartbeat:Connect(function(dt)
		if not (S.toggles.antiGucci or S.toggles.antiGrab) then
			local rr = hrp()
			if rr then
				local bv = rr:FindFirstChild("VOIDZ_GucciBV")
				if bv then pcall(function() bv:Destroy() end) end
			end
			return
		end
		if isGucciVictim() then
			gucciForceFreeMove()
			gucciStripForeignConstraints()
			gucciDestroyAttackingGrabs()
		end
		gucciAcc += dt
		local need = S.toggles.antiGucci and 0.05 or 0.1
		if gucciAcc < need then return end
		gucciAcc = 0
		gucciAntiTick()
	end))

	bind("gucciAntiRS", RunService.RenderStepped:Connect(function()
		if not (S.toggles.antiGucci or S.toggles.antiGrab) then return end
		if not isGucciVictim() then return end
		gucciForceFreeMove()
	end))

	task.spawn(function()
		local isHeld = LP:FindFirstChild("IsHeld") or LP:WaitForChild(_Vzd({110,152,109,138,145,137}), 15)
		if not isHeld then return end
		isHeld.Changed:Connect(function(held)
			if held == true and (S.toggles.antiGrab or S.toggles.antiGucci) then
				gucciBreakGrabNow()
				if doAntiGrabHard then doAntiGrabHard() end
				gucciForceFreeMove()
				task.defer(gucciBreakGrabNow)
				task.delay(0.03, gucciBreakGrabNow)
				task.delay(0.08, gucciBreakGrabNow)
				task.delay(0.15, gucciBreakGrabNow)
				task.delay(0.3, gucciBreakGrabNow)
			elseif held == false then
				local rr = hrp()
				if rr then
					local bv = rr:FindFirstChild(_Vzd({123,116,110,105,127,132,108,154,136,136,142,103,123}))
					if bv then pcall(function() bv:Destroy() end) end
				end
				restoreGroundPhysics()
			end
		end)
	end)
end

function setCrazyLine(on)
	S.toggles.crazyLine = on == true
	stopLoop("crazyLine")
	if not on then
		notify(HUB_NAME, _Vzd({104,151,134,159,158,69,113,142,147,138,69,116,107,107}), 1)
		return
	end
	if S.toggles.invisLine then
		S.toggles.invisLine = false
		stopLoop("invisLine")
	end
	if not FTAP.CreateGrabLine then resolveFTAP() end
	notify(HUB_NAME, "Crazy Line ON (soft lag lines)", 1.5)
	local lagCF = CFrame.new(
		0.12640380859375, 0.9606337547302246, -0.5000009536743164,
		0.9985212683677673, 0, -0.05436277016997337,
		-6.4805472099749295e-9, 1, -1.1903301100346653e-7,
		0.05436277016997337, 5.9604644775390625e-8, 0.9985212683677673
	)
	startLoop("crazyLine", 0.05, function()
		if not S.toggles.crazyLine or not FTAP.CreateGrabLine then return end
		for _, pl in ipairs(Players:GetPlayers()) do
			if pl ~= LP and validP(pl) and not isWL(pl) then
				local t = pl.Character and (pl.Character:FindFirstChild("Torso") or pl.Character:FindFirstChild("UpperTorso") or rootOf(pl))
				if t then
					pcall(function() FTAP.CreateGrabLine:FireServer(t, lagCF) end)
				end
			end
		end
	end)
end

function setInvisibleLine(on)
	S.toggles.invisLine = on == true
	stopLoop("invisLine")
	if on and S.toggles.crazyLine then
		notify(HUB_NAME, _Vzd({121,154,151,147,69,104,151,134,159,158,69,113,142,147,138,69,116,107,107,69,139,148,151,69,110,147,155,142,152,142,135,145,138,69,113,142,147,138}), 2)
	end
	if on then
		startLoop("invisLine", 0.25, function()
			for _, ch in ipairs(workspace:GetChildren()) do
				if ch.Name == _Vzd({108,151,134,135,117,134,151,153,152}) then
					for _, d in ipairs(ch:GetDescendants()) do
						if d:IsA("Beam") then
							pcall(function()
								d.Enabled = false
								d.Transparency = NumberSequence.new(1)
							end)
						end
					end
				end
			end
		end)
		notify(HUB_NAME, "Invisible Line ON", 1.5)
	else
		notify(HUB_NAME, "Invisible Line OFF", 1)
	end
end

local invisState = {
	on = false,
	origY = nil,
	hrpT = nil,
	noclipConn = nil,
	hbConn = nil,
	rsConn = nil,
	camOff = 0,
	depthOff = 25,
}

function invisSetNoclip(enabled)
	if invisState.noclipConn then
		pcall(function() invisState.noclipConn:Disconnect() end)
		invisState.noclipConn = nil
	end
	if not enabled then return end
	invisState.noclipConn = RunService.Stepped:Connect(function()
		local c = char()
		if not c then return end
		for _, part in ipairs(c:GetChildren()) do
			if part:IsA("BasePart") then
				part.CanCollide = false
			end
		end
	end)
end

do local _z654=(9*10); if _z654<0 and _Vj() then _z654=_z654+1 end end

function setCharacterInvis(on, quiet)
	S.toggles.charInvis = on == true
	local r = hrp()
	local cam = workspace.CurrentCamera
	if not on then
		invisState.on = false
		invisSetNoclip(false)
		if invisState.hbConn then pcall(function() invisState.hbConn:Disconnect() end) invisState.hbConn = nil end
		if invisState.rsConn then pcall(function() invisState.rsConn:Disconnect() end) invisState.rsConn = nil end
		if r and invisState.origY then
			pcall(function()
				r.CFrame = CFrame.new(r.Position.X, invisState.origY, r.Position.Z)
				r.Transparency = invisState.hrpT or 0
			end)
		end
		invisState.origY = nil
		if not quiet then notify(HUB_NAME, "Invisibility OFF", 1.2) end
		return
	end
	if not r or not cam then
		if not quiet then notify(HUB_NAME, _Vzd({115,148,69,136,141,134,151,134,136,153,138,151,69,139,148,151,69,142,147,155,142,152}), 1.5) end
		S.toggles.charInvis = false
		return
	end
	invisState.on = true
	invisState.origY = r.Position.Y
	invisState.hrpT = r.Transparency
	r.Transparency = 1
	invisSetNoclip(true)
	local surfaceY = invisState.origY
	local camY = surfaceY + (invisState.camOff or 10)
	local underY = camY - (invisState.depthOff or 20)
	r.CFrame = CFrame.new(r.Position.X, underY, r.Position.Z)
	if invisState.hbConn then pcall(function() invisState.hbConn:Disconnect() end) end
	if invisState.rsConn then pcall(function() invisState.rsConn:Disconnect() end) end
	invisState.hbConn = RunService.Heartbeat:Connect(function()
		if not invisState.on or not S.toggles.charInvis then return end
		local rr = hrp()
		if not rr then return end
		local sy = invisState.origY or rr.Position.Y
		local cy = sy + (invisState.camOff or 10)
		local uy = cy - (invisState.depthOff or 20)
		if math.abs(rr.Position.Y - uy) > 0.15 then
			rr.CFrame = CFrame.new(rr.Position.X, uy, rr.Position.Z)
		end
		rr.Transparency = 1
	end)
	invisState.rsConn = RunService.RenderStepped:Connect(function()
		if not invisState.on or not S.toggles.charInvis then return end
		local rr = hrp()
		local ccam = workspace.CurrentCamera
		if not rr or not ccam then return end
		local sy = invisState.origY or rr.Position.Y
		local camTargetY = sy + (invisState.camOff or 10)
		local look = ccam.CFrame.LookVector
		local camPos = Vector3.new(rr.Position.X, camTargetY, rr.Position.Z)
		ccam.CFrame = CFrame.new(camPos, camPos + look)
	end)
	if not quiet then notify(HUB_NAME, _Vzd({110,147,155,142,152,142,135,142,145,142,153,158,69,116,115,69,77,135,148,137,158,69,154,147,137,138,151,69,146,134,149,78}), 1.5) end
end

function surfaceForGrab()
	if not invisState.on or not S.toggles.charInvis then return false end
	local r = hrp()
	if not r then return false end
	local surfY = invisState.origY or r.Position.Y
	r.CFrame = CFrame.new(r.Position.X, surfY + 1, r.Position.Z)
	r.Transparency = 0.7
	return true
end
function hideAfterGrab()
	if not invisState.on or not S.toggles.charInvis then return end
	local r = hrp()
	if not r then return end
	local sy = invisState.origY or r.Position.Y
	local uy = sy - (invisState.depthOff or 25)
	r.CFrame = CFrame.new(r.Position.X, uy, r.Position.Z)
	r.Transparency = 1
end

LP.CharacterAdded:Connect(function()
	if S.toggles.charInvis then
		task.delay(0.6, function()
			if S.toggles.charInvis then setCharacterInvis(true, true) end
		end)
	end
end)


function findSlotsFolder()
	local s = workspace:FindFirstChild(_Vzd({120,145,148,153,152}))
	if s then return s end
	for _, ch in ipairs(workspace:GetChildren()) do
		local n = ch.Name:lower()
		if (n == "slots" or n:find("slot", 1, true)) and (ch:IsA("Folder") or ch:IsA("Model")) then
			return ch
		end
	end
	return nil
end

function scanSlotMachines()
	local root = findSlotsFolder()
	local handles, lights = {}, {}
	if not root then return handles, lights, root end
	for _, slot in ipairs(root:GetChildren()) do
		local sh = slot:FindFirstChild("SlotHandle")
		if sh then
			local handle = sh:FindFirstChild("Handle")
			local lb = sh:FindFirstChild(_Vzd({113,142,140,141,153,103,134,145,145}))
			if handle and handle:IsA("BasePart") then
				handles[#handles + 1] = handle
			end
			if lb and lb:IsA("BasePart") then
				lights[#lights + 1] = lb
			end
		end
	end
	if #handles == 0 then
		for _, d in ipairs(root:GetDescendants()) do
			if d.Name == "Handle" and d:IsA("BasePart") then
				local par = d.Parent
				if par and par.Name == "SlotHandle" then
					handles[#handles + 1] = d
				end
			end
			if d.Name == "LightBall" and d:IsA("BasePart") then
				lights[#lights + 1] = d
			end
		end
	end
	return handles, lights, root
end

do local _z128=(4*3); if _z128<0 and _Vj() then _z128=_z128+1 end end

function collectSlotHandles(slotsFolder)
	local handles = scanSlotMachines()
	return handles
end

function slotsSpinReady(slotsFolder)
	local handles, lights = scanSlotMachines()
	if #handles == 0 then return false, 0, 0 end
	if #lights == 0 then
		return true, 0, 0
	end
	local neon = 0
	for _, lb in ipairs(lights) do
		if lb.Parent and lb.Material == Enum.Material.Neon then
			neon += 1
		end
	end
	return neon >= #lights and #lights > 0, neon, #lights
end

function snoSlotHandle(handle)
	if not handle or not handle:IsA("BasePart") then return end
	local me = hrp()
	if not me then return end
	local origin = me.Position
	pcall(function()
		if FTAP.SetNetworkOwner then
			FTAP.SetNetworkOwner:FireServer(handle, lookAt(origin, handle.Position))
		end
		sno(handle, origin)
		local sh = handle.Parent
		if sh then
			for _, d in ipairs(sh:GetDescendants()) do
				if d:IsA("BasePart") then
					sno(d, origin)
					if FTAP.SetNetworkOwner then
						pcall(function()
							FTAP.SetNetworkOwner:FireServer(d, lookAt(origin, d.Position))
						end)
					end
				end
			end
		end
	end)
end

function tpAboveHandle(handle)
	local me = hrp()
	local hum = hum()
	if not me or not handle then return end
	pcall(function()
		if hum then
			hum.Sit = false
			hum.PlatformStand = false
		end
		local pos = handle.Position + Vector3.new(0, 5, 0)
		me.CFrame = me.CFrame.Rotation + pos
		me.AssemblyLinearVelocity = Vector3.zero
		me.AssemblyAngularVelocity = Vector3.zero
	end)
end

function autoSpinCoinsOnce()
	local handles, lights, root = scanSlotMachines()
	if not root then
		return false, _Vzd({147,148,69,156,148,151,144,152,149,134,136,138,83,120,145,148,153,152})
	end
	if #handles == 0 then
		return false, "no SlotHandle.Handle"
	end
	local ready, neonN, lightN = slotsSpinReady()
	if not ready then
		return false, "waiting lights " .. tostring(neonN) .. "/" .. tostring(lightN)
	end
	local me = hrp()
	if not me then return false, "no character" end
	local saved = me.CFrame

	local current = handles[1]
	local chase = true
	local chaseThread = task.spawn(function()
		while chase and S.toggles.autoSpin do
			local h = current
			if h and h.Parent then
				tpAboveHandle(h)
				snoSlotHandle(h)
			end
			task.wait()
		end
	end)

	local spun = 0
	for _, handle in ipairs(handles) do
		if not S.toggles.autoSpin then break end
		if not handle.Parent then continue end
		current = handle
		local oldCollide = handle.CanCollide
		pcall(function() handle.CanCollide = false end)
		for _ = 1, 5 do
			if not S.toggles.autoSpin or not handle.Parent then break end
			tpAboveHandle(handle)
			snoSlotHandle(handle)
			local rr = hrp()
			if firetouchinterest and rr then
				pcall(function()
					firetouchinterest(rr, handle, 0)
					task.wait()
					firetouchinterest(rr, handle, 1)
				end)
			end
			task.wait(0.2)
		end
		pcall(function() handle.CanCollide = oldCollide end)
		spun += 1
		local stillReady = slotsSpinReady()
		if not stillReady then break end
	end

	chase = false
	pcall(function()
		if typeof(chaseThread) == "thread" then
			task.cancel(chaseThread)
		end
	end)

	local rr = hrp()
	if rr and saved then
		pcall(function()
			rr.CFrame = saved
			rr.AssemblyLinearVelocity = Vector3.zero
		end)
	end
	return true, "spun " .. spun .. "/" .. #handles
end

function setAutoSpinCoins(on)
	S.toggles.autoSpin = on == true
	stopLoop("autoSpin")
	S._autoSpinThread = nil
	if not on then
		notify(HUB_NAME, _Vzd({102,154,153,148,82,120,149,142,147,69,116,107,107}), 1)
		return
	end
	local handles, lights, root = scanSlotMachines()
	if not root then
		notify(HUB_NAME, "Auto-Spin: workspace.Slots missing", 3)
	else
		notify(HUB_NAME, "Auto-Spin ON · " .. #handles .. _Vzd({69,141,134,147,137,145,138,152,69,220,69}) .. #lights .. " lights", 2.5)
	end
	S._autoSpinThread = true
	task.spawn(function()
		local lastMsg = 0
		local lastWaitMsg = 0
		while S.toggles.autoSpin and S._autoSpinThread do
			local okCall, a, b = pcall(autoSpinCoinsOnce)
			local ok, info = false, nil
			if okCall then
				ok, info = a, b
			else
				info = tostring(a)
			end
			if ok then
				if os.clock() - lastMsg > 8 then
					notify(HUB_NAME, "Auto-Spin · " .. tostring(info), 1.5)
					lastMsg = os.clock()
				end
				for _ = 1, 50 do
					if not S.toggles.autoSpin then break end
					task.wait(0.1)
				end
			else
				if os.clock() - lastWaitMsg > 30 then
					notify(HUB_NAME, _Vzd({102,154,153,148,82,120,149,142,147,69,220,69}) .. tostring(info or "waiting"), 1.2)
					lastWaitMsg = os.clock()
				end
				task.wait(1)
			end
		end
		S._autoSpinThread = nil
	end)
end

function setFly(on)
	if S.flyBv then pcall(function() S.flyBv:Destroy() end) S.flyBv = nil end
	if S.flyBg then pcall(function() S.flyBg:Destroy() end) S.flyBg = nil end
	if S.conns.fly then pcall(function() S.conns.fly:Disconnect() end) S.conns.fly = nil end
	if not on then return end
	local r = hrp()
	if not r then return end
	local bv = Instance.new("BodyVelocity")
	bv.Name = _Vzd({123,116,110,105,127,132,107,145,158})
	bv.MaxForce = Vector3.new(9e9, 9e9, 9e9)
	bv.Velocity = Vector3.zero
	bv.Parent = r
	S.flyBv = bv
	local bg = Instance.new("BodyGyro")
	bg.Name = "VOIDZ_FlyG"
	bg.MaxTorque = Vector3.new(9e9, 9e9, 9e9)
	bg.P = 9e4
	bg.Parent = r
	S.flyBg = bg
	S.conns.fly = RunService.RenderStepped:Connect(function()
		if not S.toggles.fly then return end
		local rr = hrp()
		if not rr then return end
		if not S.flyBv or not S.flyBv.Parent then
			S.flyBv = Instance.new("BodyVelocity")
			S.flyBv.Name = "VOIDZ_Fly"
			S.flyBv.MaxForce = Vector3.new(9e9, 9e9, 9e9)
			S.flyBv.Parent = rr
		end
		if not S.flyBg or not S.flyBg.Parent then
			S.flyBg = Instance.new("BodyGyro")
			S.flyBg.Name = "VOIDZ_FlyG"
			S.flyBg.MaxTorque = Vector3.new(9e9, 9e9, 9e9)
			S.flyBg.Parent = rr
		end
		local cam = workspace.CurrentCamera.CFrame
		S.flyBg.CFrame = cam
		local v = Vector3.zero
		if UserInputService:IsKeyDown(Enum.KeyCode.W) then v += cam.LookVector end
		if UserInputService:IsKeyDown(Enum.KeyCode.S) then v -= cam.LookVector end
		if UserInputService:IsKeyDown(Enum.KeyCode.D) then v += cam.RightVector end
		if UserInputService:IsKeyDown(Enum.KeyCode.A) then v -= cam.RightVector end
		if UserInputService:IsKeyDown(Enum.KeyCode.Space) then v += Vector3.yAxis end
		if UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) then v -= Vector3.yAxis end
		S.flyBv.Velocity = v.Magnitude > 0 and v.Unit * (S.flySpeed or 80) or Vector3.zero
	end)
end

bind("moveHB", RunService.Heartbeat:Connect(function()
	local h = hum()
	local r = hrp()
	if S.toggles.speed and h and r and h.MoveDirection.Magnitude > 0 then
		local targetSpeed = S.walkSpeed or 50
		local mult = targetSpeed / 16
		r.CFrame = r.CFrame + h.MoveDirection * (0.3 * mult)
	end
	if S.toggles.jump and h then
		h.UseJumpPower = true
		h.JumpPower = S.jumpPower or 80
	end
	if S.toggles.noclip and char() then
		for _, p in ipairs(char():GetDescendants()) do
			if p:IsA(_Vzd({103,134,152,138,117,134,151,153})) then p.CanCollide = false end
		end
	end
	if S.toggles.speedCFrame and r and h and h.MoveDirection.Magnitude > 0 then
		r.CFrame = r.CFrame + h.MoveDirection * (S.speedMult or 1.5)
	end
end))

bind("infJump", UserInputService.JumpRequest:Connect(function()
	if not S.toggles.infjump then return end
	local h = hum()
	if h then h:ChangeState(Enum.HumanoidStateType.Jumping) end
end))

local KNOWN_TOYS = {
	"Airhorn", "AnvilGray", "ArmChairBlue", "ArmChairBrownGray", "ArmChairPink",
	"BallBasketball", "BallMagicLight", "BallSnowball", "BathroomShower", "BathroomSink",
	"BedBlanketBlue", "BedFramedOrange", "BedFuton", _Vzd({103,138,145,145,103,142,140}), "BellSmall",
	"BombBalloon", "BombDarkMatter", "BombMissile", "BookManyPages", "BookNormal",
	"Boombox", "BoxCrateWood", "BubbleBlower", "BucketPaint", "Campfire",
	_Vzd({104,141,142,145,137,151,138,147,152,104,141,134,142,151}), "ChildrensCouch", "ChildrensDesk", "ChildrensShelf", "ChildrensTable",
	"ClockAlarm", "ComputerLaptopOld", "CouchBlue", _Vzd({104,148,154,136,141,103,151,148,156,147,108,151,134,158}), "CouchDarkGray",
	"CouchLightBrownGray", "CouchPink", _Vzd({104,148,154,136,141,124,141,142,153,138}), _Vzd({104,148,154,136,141,117,154,151,149,145,138}),
	"CounterCorner", _Vzd({104,148,154,147,153,138,151,120,142,147,144}), "CounterStraight", _Vzd({104,151,138,134,153,154,151,138,103,145,148,135,146,134,147}), "CreatureRobot",
	"CupMugBrown", "CupMugWhite", "DiceBig", "DiceSmall", "DiscoColorBall",
	"DrawerLightBrown", "FactoryBench", "FactoryCabinet", "FactoryChair", "FactoryCouch",
	"FoodBanana", "NinjaKunai", "PalletLightBrown", "Pallet", "SprayCanWD",
	"SoccerBall", "BoxingGlove", "Firework", "Balloon", "PaintBucket",
}

do local _z770=(9*9); if _z770<0 and _Vj() then _z770=_z770+1 end end

function getOwnedToyNames()
	local owned = {}
	local function scan(container)
		if not container then return end
		for _, t in ipairs(container:GetChildren()) do
			if t:IsA("Tool") or t:IsA("Model") or t:IsA(_Vzd({107,148,145,137,138,151})) then
				owned[t.Name] = true
			end
		end
	end
	scan(LP:FindFirstChild("Backpack"))
	scan(char())
	local pg = LP:FindFirstChild("PlayerGui")
	if pg then
		for _, d in ipairs(pg:GetDescendants()) do
			if d:IsA("TextLabel") or d:IsA(_Vzd({121,138,157,153,103,154,153,153,148,147})) then
				local tx = d.Text
				if type(tx) == "string" and #tx > 1 and #tx < 40 then
					for _, toy in ipairs(KNOWN_TOYS) do
						if tx:lower() == toy:lower() or tx:lower():find(toy:lower(), 1, true) then
							owned[toy] = true
						end
					end
					local low = tx:lower()
					if not low:find("equip") and not low:find("spawn") and not low:find("buy") then
						if d.Parent and (tostring(d.Parent.Name):lower():find("toy") or tostring(d.Parent.Name):lower():find("inv") or tostring(d.Parent.Name):lower():find("item")) then
							owned[tx] = true
						end
					end
				end
			end
		end
	end
	for _, m in ipairs(workspace:GetDescendants()) do
		if m:IsA("StringValue") and m.Name == "PartOwner" and m.Value == LP.Name then
			local model = m.Parent
			if model then owned[model.Name] = true end
		end
	end
	local list = {}
	for n in pairs(owned) do list[#list+1] = n end
	table.sort(list)
	return list
end

function getMapItems()
	local map = {}
	local me = hrp()
	local origin = me and me.Position or Vector3.zero
	for _, inst in ipairs(workspace:GetDescendants()) do
		if inst:IsA("Model") and inst:FindFirstChildWhichIsA("BasePart", true) then
			if not Players:GetPlayerFromCharacter(inst) then
				local name = inst.Name
				if #name > 1 and name ~= "Map" and name ~= "Plots" and name ~= "Workspace" then
					local owner = nil
					local po = inst:FindFirstChild("PartOwner", true)
					if po and po:IsA("StringValue") then owner = po.Value end
					local part = inst:FindFirstChildWhichIsA("BasePart", true)
					if part and (part.Position - origin).Magnitude < 2000 then
						if not map[name] then map[name] = { owned = false, samples = {} } end
						if owner == LP.Name then map[name].owned = true end
						if #map[name].samples < 5 then
							map[name].samples[#map[name].samples+1] = inst
						end
					end
				end
			end
		end
	end
	return map
end

S.formOrientation = S.formOrientation or 0
S.formHeight = S.formHeight or 2
S.formGap = S.formGap or 0.09
S.formBuilding = false

function getCanSpawnToy()
	return LP:FindFirstChild("CanSpawnToy")
end

function waitForCanSpawn(timeout)
	local can = getCanSpawnToy()
	if not can then return true end
	local t0 = os.clock()
	timeout = timeout or 4
	while can.Parent and not can.Value and (os.clock() - t0) < timeout do
		task.wait(0.03)
	end
	return not can.Parent or can.Value
end

function rotFromCF(cf)
	if typeof(cf) ~= "CFrame" then return Vector3.zero end
	local _, y = cf:ToOrientation()
	return Vector3.new(0, math.deg(y), 0)
end

function resolveSpawnCF(name, opts)
	opts = opts or {}
	if opts.cf then return opts.cf end
	local cp = camPart() or hrp()
	if not cp then return nil end
	local dist = opts.dist or (tostring(name):find("Pallet") and 3 or 5)
	return cp.CFrame * CFrame.new(0, opts.y or 0, -dist)
end

do local _z655=(2*3); if _z655<0 and _Vj() then _z655=_z655+1 end end

function spawnToyNow(name, opts)
	opts = opts or {}
	name = name or S.selectedToy or _Vzd({117,134,145,145,138,153,113,142,140,141,153,103,151,148,156,147})
	if name == "Pallet" then name = "PalletLightBrown" end
	if not FTAP.SpawnToy then resolveFTAP() end
	if not FTAP.SpawnToy then
		task.wait(0.3)
		resolveFTAP()
	end
	if not FTAP.SpawnToy then
		if not opts.silent then notify(HUB_NAME, _Vzd({115,148,69,120,149,134,156,147,121,148,158,69,151,138,146,148,153,138,69,57,69,145,142,147,144,69,151,138,146,148,153,138,152}), 2) end
		return false
	end

	local cf = resolveSpawnCF(name, opts)
	if not cf then return false end
	local rot = opts.rot
	if rot == nil then rot = rotFromCF(cf) end

	if not opts.skipBuy and FTAP.BuyToy then
		pcall(function() FTAP.BuyToy:InvokeServer(name) end)
	end

	waitForCanSpawn(opts.canTimeout or 4)

	local remote = FTAP.SpawnToy
	local ok = pcall(function()
		remote:InvokeServer(name, cf, rot)
	end)
	if not ok then
		resolveFTAP()
		ok = pcall(function()
			if FTAP.SpawnToy then
				FTAP.SpawnToy:InvokeServer(name, cf, rot)
			end
		end)
	end

	local gap = opts.gap
	if gap == nil then gap = S.formGap or 0.09 end
	if gap > 0 then task.wait(gap) end
	waitForCanSpawn(opts.canTimeout or 4)
	return ok
end

local toySpawnQueue = {}
local toySpawnWorker = false

function pumpToyQueue()
	if toySpawnWorker then return end
	toySpawnWorker = true
	task.spawn(function()
		while #toySpawnQueue > 0 do
			local formWaitStart = os.clock()
			while S.formBuilding do
				task.wait(0.1)
				if os.clock() - formWaitStart > 8 then
					S.formBuilding = false
					break
				end
			end
			local job = table.remove(toySpawnQueue, 1)
			if job then
				if not FTAP.SpawnToy then pcall(resolveFTAP) end
				local ok = spawnToyNow(job.name, job.opts)
				if job.opts and job.opts.onDone then
					pcall(job.opts.onDone, ok)
				end
			end
		end
		toySpawnWorker = false
	end)
end

function spawnToy(name, opts)
	opts = opts or {}
	name = name or S.selectedToy or "PalletLightBrown"
	if name == "Pallet" then name = "PalletLightBrown" end
	if opts.sync then
		local ok = spawnToyNow(name, opts)
		if ok and not opts.silent then notify(HUB_NAME, "Spawn " .. name, 0.8) end
		return ok
	end
	if not opts.silent then
		notify(HUB_NAME, _Vzd({120,149,134,156,147,69}) .. name, 0.6)
	end
	local jobOpts = {}
	for k, v in pairs(opts) do jobOpts[k] = v end
	jobOpts.silent = true
	toySpawnQueue[#toySpawnQueue + 1] = { name = name, opts = jobOpts }
	pumpToyQueue()
	return true
end

function spawnToyBurst(name, count)
	count = math.clamp(tonumber(count) or 1, 1, 80)
	name = name or _Vzd({117,134,145,145,138,153,113,142,140,141,153,103,151,148,156,147})
	task.spawn(function()
		if FTAP.BuyToy then pcall(function() FTAP.BuyToy:InvokeServer(name) end) end
		waitForCanSpawn(3)
		local cp = camPart() or hrp()
		local base = cp and cp.CFrame or CFrame.new()
		for i = 1, count do
			local cf = base * CFrame.new(0, (i - 1) * 1.1, -3)
			spawnToyNow(name, { cf = cf, skipBuy = true, silent = true, gap = 0.07 })
		end
		notify(HUB_NAME, _Vzd({120,149,134,156,147,138,137,69,157}) .. count .. " " .. tostring(name), 1.5)
	end)
end

function destroyAllMyToys(filterName)
	if not FTAP.DestroyToy then resolveFTAP() end
	if not FTAP.DestroyToy then
		notify(HUB_NAME, _Vzd({115,148,69,105,138,152,153,151,148,158,121,148,158,69,151,138,146,148,153,138}), 2)
		return 0
	end
	local folder = workspace:FindFirstChild(LP.Name .. "SpawnedInToys")
	if not folder then return 0 end
	local n = 0
	for _, ch in ipairs(folder:GetChildren()) do
		if not filterName or ch.Name == filterName or tostring(ch.Name):lower():find(tostring(filterName):lower(), 1, true) then
			pcall(function() FTAP.DestroyToy:FireServer(ch) end)
			n += 1
		end
	end
	return n
end

do local _z537=(9*10); if _z537<0 and _Vj() then _z537=_z537+1 end end

function countMyToys(filterName)
	local folder = workspace:FindFirstChild(LP.Name .. "SpawnedInToys")
	if not folder then return 0 end
	local n = 0
	for _, ch in ipairs(folder:GetChildren()) do
		if not filterName or ch.Name == filterName then n += 1 end
	end
	return n
end

S.trainSpeed = S.trainSpeed or 120
S._trainDriveConn = nil
S._trainHornConn = nil
S._trainSnoConn = nil
S._trainSeat = nil
S._trainRoot = nil
S.trainDriving = false

local TRAIN_CAVE_POS = Vector3.new(500, 62, -307)

function stopTrainDrive(quiet)
	S.trainDriving = false
	if S._trainDriveConn then pcall(function() S._trainDriveConn:Disconnect() end); S._trainDriveConn = nil end
	if S._trainHornConn then pcall(function() S._trainHornConn:Disconnect() end); S._trainHornConn = nil end
	if S._trainSnoConn then pcall(function() S._trainSnoConn:Disconnect() end); S._trainSnoConn = nil end
	for _, part in ipairs({ S._trainSeat, S._trainRoot }) do
		if part and part.Parent then
			for _, ch in ipairs(part:GetChildren()) do
				if ch.Name == "TrainDriveBV" or ch.Name == "TrainDriveBG" or ch.Name == "TrainDriveAV" then
					pcall(function() ch:Destroy() end)
				end
			end
		end
	end
	S._trainSeat = nil
	S._trainRoot = nil
	if not quiet then notify(HUB_NAME, "Train stopped", 1) end
end

function _vB1(inst)
	if not inst then return 0 end
	local path = inst:GetFullName():lower()
	local score = 0
	for _, k in ipairs({ "train", _Vzd({145,148,136,148,146,148,153,142,155,138}), "rail", _Vzd({136,134,135,148,148,152,138}), "engine", "steam", "minecart", "cart", "trolley", "wagon", "driver" }) do
		if path:find(k, 1, true) then score = score + 3 end
	end
	if inst:IsA("VehicleSeat") then score = score + 2 end
	if inst:IsA("Seat") then score = score + 1 end
	return score
end

function _vB5(pos, maxDist)
	maxDist = maxDist or 350
	pos = pos or TRAIN_CAVE_POS
	local best, bestScore, bestD = nil, -1, maxDist
	local function consider(d)
		if not (d:IsA("VehicleSeat") or d:IsA("Seat")) then return end
		local dist = (d.Position - pos).Magnitude
		if dist > maxDist then return end
		local sc = _vB1(d)
		if dist < 120 then sc = sc + 4 end
		if dist < 60 then sc = sc + 3 end
		if sc > bestScore or (sc == bestScore and dist < bestD) then
			bestScore = sc
			bestD = dist
			best = d
		end
	end
	for _, d in ipairs(workspace:GetDescendants()) do
		consider(d)
	end
	return best
end

function findAnyTrainSeat()
	local me = hrp()
	local seat = _vB5(TRAIN_CAVE_POS, 400)
	if seat then return seat end
	if me then
		seat = _vB5(me.Position, 200)
		if seat and _vB1(seat) >= 2 then return seat end
	end
	local folder = workspace:FindFirstChild(LP.Name .. "SpawnedInToys")
	if folder then
		for _, ch in ipairs(folder:GetChildren()) do
			if _vB1(ch) >= 3 then
				for _, d in ipairs(ch:GetDescendants()) do
					if d:IsA("VehicleSeat") then return d end
				end
				for _, d in ipairs(ch:GetDescendants()) do
					if d:IsA("Seat") then return d end
				end
			end
		end
	end
	local bestVS, bestD = nil, 500
	for _, d in ipairs(workspace:GetDescendants()) do
		if d:IsA("VehicleSeat") then
			local dist = (d.Position - TRAIN_CAVE_POS).Magnitude
			if dist < bestD then
				bestD = dist
				bestVS = d
			end
		end
	end
	if bestVS and bestD < 450 then return bestVS end
	return nil
end

function _vB2(seat)
	if not seat then return nil end
	local model = seat:FindFirstAncestorOfClass(_Vzd({114,148,137,138,145}))
	if model then
		if model.PrimaryPart then return model.PrimaryPart end
		local pp = model:FindFirstChildWhichIsA("BasePart", true)
		if pp then return pp end
	end
	return seat
end

function _vB3(seat)
	if not seat then return end
	local model = seat:FindFirstAncestorOfClass("Model")
	local me = hrp()
	local origin = (me and me.Position) or seat.Position
	for _ = 1, 12 do
		sno(seat, origin)
		local root = _vB2(seat)
		if root then sno(root, origin) end
		if model then
			for _, d in ipairs(model:GetDescendants()) do
				if d:IsA("BasePart") then sno(d, origin) end
			end
		elseif seat.Parent then
			for _, d in ipairs(seat.Parent:GetDescendants()) do
				if d:IsA("BasePart") then sno(d, origin) end
			end
		end
		RunService.Heartbeat:Wait()
	end
end

do local _z307=(5*6); if _z307<0 and _Vj() then _z307=_z307+1 end end

function _vB4(seat)
	local h = hum()
	local me = hrp()
	if not h or not me or not seat then return false end
	pcall(function() me.CFrame = seat.CFrame * CFrame.new(0, 3.5, 0) end)
	task.wait(0.1)
	_vB3(seat)
	for _ = 1, 6 do
		pcall(function() seat:Sit(h) end)
		pcall(function()
			me.CFrame = seat.CFrame * CFrame.new(0, 1.2, 0)
			h.Sit = true
		end)
		local prompt = seat:FindFirstChildOfClass("ProximityPrompt")
			or seat:FindFirstChild("ProximityPrompt", true)
			or (seat.Parent and seat.Parent:FindFirstChildWhichIsA("ProximityPrompt", true))
		if prompt and fireproximityprompt then
			pcall(function() fireproximityprompt(prompt) end)
		end
		task.wait(0.12)
		if h.SeatPart == seat then return true end
	end
	return h.SeatPart == seat
end

function startTrainDrive()
	stopTrainDrive(true)
	resolveFTAP()
	local me = hrp()
	if not me then
		notify(HUB_NAME, _Vzd({115,148,69,136,141,134,151,134,136,153,138,151}), 1.5)
		return false
	end
	local prevAntiBlob = S.toggles.antiBlobman
	local prevAntiTrain = S.toggles.antiTrain
	S.toggles.antiBlobman = false
	S.toggles.antiTrain = false

	notify(HUB_NAME, "Streaming train cave…", 1.2)
	pcall(function() me.CFrame = CFrame.new(TRAIN_CAVE_POS + Vector3.new(0, 8, 0)) end)
	task.wait(0.6)

	local seat = nil
	for attempt = 1, 8 do
		seat = findAnyTrainSeat()
		if seat then break end
		pcall(function()
			me.CFrame = CFrame.new(TRAIN_CAVE_POS + Vector3.new(math.random(-20, 20), 6 + attempt, math.random(-20, 20)))
		end)
		task.wait(0.45)
	end

	if not seat then
		for _, name in ipairs({ "Train", "ToyTrain", "SteamTrain", "Locomotive", "Minecart" }) do
			spawnToyNow(name, { silent = true, gap = 0.15, dist = 14, y = 1 })
			task.wait(0.4)
			seat = findAnyTrainSeat()
			if seat then break end
		end
	end

	if not seat then
		S.toggles.antiBlobman = prevAntiBlob
		S.toggles.antiTrain = prevAntiTrain
		notify(HUB_NAME, _Vzd({115,148,69,153,151,134,142,147,69,147,138,134,151,69,136,134,155,138,69,220,69,156,134,145,144,69,136,145,148,152,138,151,69,84,69,151,138,143,148,142,147,69,146,134,149}), 2.5)
		return false
	end

	if (me.Position - seat.Position).Magnitude > 25 then
		pcall(function() me.CFrame = seat.CFrame * CFrame.new(0, 4, 0) end)
		task.wait(0.2)
	end

	_vB4(seat)
	task.wait(0.1)
	_vB3(seat)

	local root = _vB2(seat) or seat
	local drivePart = root
	local function ensureMover(className, name, props)
		local m = drivePart:FindFirstChild(name)
		if m then return m end
		m = Instance.new(className)
		m.Name = name
		for k, v in pairs(props) do
			pcall(function() m[k] = v end)
		end
		m.Parent = drivePart
		return m
	end

	local bv = ensureMover("BodyVelocity", "TrainDriveBV", {
		MaxForce = Vector3.new(1e9, 0, 1e9),
		Velocity = Vector3.zero,
		P = 1250,
	})
	local bg = ensureMover("BodyGyro", "TrainDriveBG", {
		MaxTorque = Vector3.new(4e5, 4e9, 4e5),
		P = 30000,
		D = 800,
		CFrame = drivePart.CFrame,
	})

	S._trainSeat = seat
	S._trainRoot = drivePart
	S.trainDriving = true

	local hornSound = nil
	local model = seat:FindFirstAncestorOfClass("Model")
	if model then
		hornSound = model:FindFirstChild("HornSound", true)
			or model:FindFirstChild("Horn", true)
			or model:FindFirstChildWhichIsA("Sound", true)
	end

	S._trainSnoConn = RunService.Heartbeat:Connect(function()
		if not S.trainDriving or not seat.Parent then return end
		local origin = seat.Position
		sno(seat, origin)
		if drivePart and drivePart.Parent then sno(drivePart, origin) end
		if model then
			for _, d in ipairs(model:GetDescendants()) do
				if d:IsA(_Vzd({103,134,152,138,117,134,151,153})) and (d == seat or d == drivePart or math.random() < 0.08) then
					sno(d, origin)
				end
			end
		end
	end)

	S._trainDriveConn = RunService.Heartbeat:Connect(function()
		if not S.trainDriving then return end
		if not seat or not seat.Parent or not drivePart or not drivePart.Parent then
			stopTrainDrive(true)
			return
		end
		if not bv or not bv.Parent then
			bv = ensureMover("BodyVelocity", "TrainDriveBV", {
				MaxForce = Vector3.new(1e9, 0, 1e9),
				Velocity = Vector3.zero,
			})
		end
		local cam = workspace.CurrentCamera
		local dir = Vector3.zero
		if UserInputService:IsKeyDown(Enum.KeyCode.W) then dir = dir + cam.CFrame.LookVector end
		if UserInputService:IsKeyDown(Enum.KeyCode.S) then dir = dir - cam.CFrame.LookVector end
		if UserInputService:IsKeyDown(Enum.KeyCode.A) then dir = dir - cam.CFrame.RightVector end
		if UserInputService:IsKeyDown(Enum.KeyCode.D) then dir = dir + cam.CFrame.RightVector end
		local speed = S.trainSpeed or 120
		if dir.Magnitude > 0.05 then
			dir = Vector3.new(dir.X, 0, dir.Z)
			if dir.Magnitude > 0.05 then
				dir = dir.Unit * speed
				bv.MaxForce = Vector3.new(1e9, 4000, 1e9)
				bv.Velocity = dir
				if bg and bg.Parent then
					bg.CFrame = CFrame.new(drivePart.Position, drivePart.Position + Vector3.new(dir.X, 0, dir.Z))
				end
				pcall(function()
					drivePart.AssemblyLinearVelocity = Vector3.new(dir.X, drivePart.AssemblyLinearVelocity.Y, dir.Z)
				end)
				if seat:IsA("VehicleSeat") then
					pcall(function()
						seat.Throttle = 1
						seat.ThrottleFloat = 1
						seat.Steer = 0
						seat.SteerFloat = 0
					end)
				end
			end
		else
			bv.Velocity = Vector3.zero
			if seat:IsA("VehicleSeat") then
				pcall(function()
					seat.Throttle = 0
					seat.ThrottleFloat = 0
					seat.Steer = 0
				end)
			end
		end
	end)

	S._trainHornConn = UserInputService.InputBegan:Connect(function(input, gp)
		if gp or not S.trainDriving then return end
		if input.KeyCode == Enum.KeyCode.H and hornSound then
			pcall(function() hornSound:Play() end)
		end
	end)

	notify(HUB_NAME, _Vzd({121,151,134,142,147,69,145,148,136,144,138,137,69,220,69,124,102,120,105,69,220,69,109,69,141,148,151,147}), 3)
	return true
end

S.ballType = S.ballType or "Snowball"
S.ballSize = S.ballSize or 15
S.ballCount = S.ballCount or 10
S.ballFlingPower = S.ballFlingPower or 5000
S._snowFarmOn = false
S._snowFarmConn = nil
S._snowOwnConn = nil
S._snowGrown = S._snowGrown or {}
S._snowFarmCF = CFrame.new(-410, 228.394, 510, -0.246182978, 3.22764193e-9, -0.96922338, 1.2914926e-8, 1, 4.97377278e-11, 0.96922338, -1.2505204e-8, -0.246182978)
S._snowSpawnCF = CFrame.new(-389, 228, 550, -0.3092496991157532, 0.2610282301902771, -0.9144555330276489, 0, 0.9615919589996338, 0.2744831442832947, 0.9509809017181396, 0.08488383144140244, -0.2973720133304596)
S._sandFarmCF = S._snowFarmCF

function getMyToyFolder()
	return workspace:FindFirstChild(LP.Name .. "SpawnedInToys")
end

function snowSoundOf(model)
	if not model then return nil end
	return model:FindFirstChild("SoundPart")
		or model:FindFirstChild("SoundPart", true)
end

function _vA3(part)
	if not part then return false end
	local po = part:FindFirstChild("PartOwner")
	if po and (po:IsA("StringValue") or po:IsA("ObjectValue")) then
		local v = po.Value
		if typeof(v) == "string" then return v == LP.Name end
		if typeof(v) == "Instance" then return v == LP end
	end
	local ok, owner = pcall(function() return part:GetNetworkOwner() end)
	return ok and owner == LP
end

function stopSnowFarm(quiet)
	S._snowFarmOn = false
	if S._snowFarmConn then
		pcall(function() S._snowFarmConn:Disconnect() end)
		S._snowFarmConn = nil
	end
	if S._snowOwnConn then
		pcall(function() S._snowOwnConn:Disconnect() end)
		S._snowOwnConn = nil
	end
	if not quiet then notify(HUB_NAME, _Vzd({120,147,148,156,135,134,145,145,69,139,134,151,146,69,116,107,107}), 1.2) end
end

function countGrownSnowballs()
	local n = 0
	for part, _ in pairs(S._snowGrown) do
		if part and part.Parent and part:IsDescendantOf(workspace) then
			n += 1
		else
			S._snowGrown[part] = nil
		end
	end
	return n
end

function _vA1()
	local me = hrp()
	if not me then return end
	pcall(function()
		me.CFrame = CFrame.new(-389, 232, 550)
	end)
end

function _vA2(part)
	if not part or not part:IsA("BasePart") then return false end
	local me = hrp()
	if not me then return false end
	if (me.Position - part.Position).Magnitude > 28 then
		pcall(function() me.CFrame = CFrame.new(part.Position + Vector3.new(0, -10, 0)) end)
		task.wait(0.05)
	end
	for _ = 1, 6 do
		sno(part, me.Position)
		if _vA3(part) then
			pcall(function()
				part.CanTouch = false
				part.CanCollide = false
			end)
			return true
		end
		RunService.Heartbeat:Wait()
	end
	return _vA3(part)
end

do local _z567=(5*9); if _z567<0 and _Vj() then _z567=_z567+1 end end

function _vA4(sound)
	if not sound then return nil end
	local bp = sound:FindFirstChild("FarmSnowball")
	if bp and bp:IsA("BodyPosition") then return bp end
	bp = Instance.new("BodyPosition")
	bp.Name = "FarmSnowball"
	bp.MaxForce = Vector3.new(12500, 12500, 12500)
	bp.Position = sound.Position
	bp.Parent = sound
	return bp
end

function farmSnowballLoop(model)
	local farmCF = (S.ballType == "Sandball") and S._sandFarmCF or S._snowFarmCF
	local farmPos = farmCF.Position
	while S._snowFarmOn and model and model.Parent do
		local sound = snowSoundOf(model)
		if not sound then
			task.wait(0.15)
		else
			if not _vA3(sound) then
				_vA2(sound)
			end
			if _vA3(sound) then
				local bp = _vA4(sound)
				local maxSz = S.ballSize or 15
				local grown = sound.Size.X >= maxSz and sound.Size.Y >= maxSz and sound.Size.Z >= maxSz
				if grown then
					S._snowGrown[sound] = true
					if bp then
						bp.Position = Vector3.new(math.random(-10000, 10000), 10000, math.random(-10000, 10000))
					end
				elseif bp then
					local lift = sound.Size.X / 2 - 0.65
					bp.Position = farmPos + Vector3.new(25, 0, 0) + Vector3.new(0, lift, 0)
					task.wait(0.5)
					if not S._snowFarmOn then break end
					bp.Position = farmPos + Vector3.new(-25, 0, 0) + Vector3.new(0, lift, 0)
					task.wait(0.5)
					if not S._snowFarmOn then break end
					bp.Position = farmPos + Vector3.new(0, lift, 0)
				end
			end
		end
		task.wait()
	end
end

do local _z797=(9*10); if _z797<0 and _Vj() then _z797=_z797+1 end end

function startSnowFarm()
	if S._snowFarmOn then return end
	resolveFTAP()
	if not FTAP.SpawnToy then
		notify(HUB_NAME, _Vzd({115,148,69,120,149,134,156,147,121,148,158,69,151,138,146,148,153,138}), 2)
		return
	end
	S._snowFarmOn = true
	S._snowGrown = {}
	local want = math.clamp(tonumber(S.ballCount) or 10, 1, 50)
	local maxSz = S.ballSize or 15
	notify(HUB_NAME, "Snow farm ON · roll on mountain · grow " .. tostring(maxSz), 2.5)

	_vA1()
	task.wait(0.25)

	local folder = getMyToyFolder()
	if not folder then
		folder = workspace:WaitForChild(LP.Name .. "SpawnedInToys", 4)
	end
	if folder then
		S._snowFarmConn = folder.ChildAdded:Connect(function(ch)
			if not S._snowFarmOn then return end
			if ch.Name == "BallSnowball" then
				task.spawn(function()
					task.wait(0.08)
					farmSnowballLoop(ch)
				end)
			end
		end)
		for _, ch in ipairs(folder:GetChildren()) do
			if ch.Name == "BallSnowball" then
				task.spawn(function() farmSnowballLoop(ch) end)
			end
		end
	end

	task.spawn(function()
		while S._snowFarmOn do
			local me = hrp()
			if me and (me.Position - Vector3.new(-389, 228, 550)).Magnitude > 80 then
				_vA1()
			end
			folder = getMyToyFolder()
			if folder then
				for _, ch in ipairs(folder:GetChildren()) do
					if ch.Name == "BallSnowball" then
						local sound = snowSoundOf(ch)
						if sound and not _vA3(sound) then
							_vA2(sound)
						end
					end
				end
			end
			task.wait(0.2)
		end
	end)

	task.spawn(function()
		if FTAP.BuyToy then pcall(function() FTAP.BuyToy:InvokeServer("BallSnowball") end) end
		waitForCanSpawn(4)
		while S._snowFarmOn do
			local have = countMyToys("BallSnowball")
			local grown = countGrownSnowballs()
			if grown >= want then
				stopSnowFarm(true)
				notify(HUB_NAME, "Grown " .. grown .. _Vzd({69,220,69,139,145,142,147,140,69,148,151,69,138,157,149,145,148,137,138}), 2.5)
				break
			end
			if have < want then
				local spawnCF = S._snowSpawnCF * CFrame.new(math.random(-4, 4), 1.5, math.random(-4, 4))
				spawnToyNow("BallSnowball", {
					cf = spawnCF,
					rot = Vector3.new(0, 97.69, 0),
					skipBuy = true,
					silent = true,
					gap = 0.12,
				})
			end
			folder = getMyToyFolder()
			if folder and not S._snowFarmConn then
				S._snowFarmConn = folder.ChildAdded:Connect(function(ch)
					if ch.Name == "BallSnowball" and S._snowFarmOn then
						task.spawn(function() farmSnowballLoop(ch) end)
					end
				end)
			end
			task.wait(0.12)
		end
	end)
end

function flingGrownSnowballsAt(targetPlayer)
	local r = targetPlayer and rootOf(targetPlayer)
	if not r then
		notify(HUB_NAME, "Select a target", 1.5)
		return 0
	end
	local power = S.ballFlingPower or 5000
	local n = 0
	for sound, _ in pairs(S._snowGrown) do
		if sound and sound.Parent and sound:IsDescendantOf(workspace) then
			local model = sound.Parent
			task.spawn(function()
				_vA2(sound)
				local bp = sound:FindFirstChild("FarmSnowball")
				if bp then pcall(function() bp:Destroy() end) end
				local dir = (r.Position - sound.Position)
				if dir.Magnitude < 0.2 then dir = Vector3.new(0, 0, -1) else dir = dir.Unit end
				for _ = 1, 12 do
					sno(sound, r.Position)
					pcall(function()
						sound.CanCollide = true
						sound.AssemblyLinearVelocity = dir * power + Vector3.new(0, power * 0.08, 0)
						local bv = sound:FindFirstChild("VOIDZ_SnowFling")
						if not bv then
							bv = Instance.new("BodyVelocity")
							bv.Name = "VOIDZ_SnowFling"
							bv.MaxForce = Vector3.new(1e9, 1e9, 1e9)
							bv.Parent = sound
						end
						bv.Velocity = dir * power + Vector3.new(0, power * 0.08, 0)
					end)
					RunService.Heartbeat:Wait()
				end
			end)
			S._snowGrown[sound] = nil
			n += 1
		else
			S._snowGrown[sound] = nil
		end
	end
	notify(HUB_NAME, "Flung " .. n .. _Vzd({69,152,147,148,156,135,134,145,145,152,69,134,153,69}) .. (targetPlayer and targetPlayer.Name or "?"), 1.8)
	return n
end

function explodeGrownSnowballs()
	if not FTAP.BombExplode then resolveFTAP() end
	local n = 0
	local me = hrp()
	local pos = me and me.Position or Vector3.zero
	for sound, _ in pairs(S._snowGrown) do
		if sound and sound.Parent and sound:IsDescendantOf(workspace) then
			local model = sound:FindFirstAncestorOfClass("Model") or sound.Parent
			_vA2(sound)
			if FTAP.BombExplode then
				pcall(function()
					FTAP.BombExplode:FireServer({
						Radius = 17.5,
						TimeLength = 0.1,
						Hitbox = sound,
						ExplodesByFire = true,
						MaxForcePerStudSquared = -100,
						DestroysModel = true,
						Model = model,
						ExplodesByPointy = false,
						ImpactSpeed = 100,
						PositionPart = me or sound,
					}, pos)
				end)
			end
			S._snowGrown[sound] = nil
			n += 1
		else
			S._snowGrown[sound] = nil
		end
	end
	notify(HUB_NAME, "Exploded " .. n .. _Vzd({69,152,147,148,156,135,134,145,145,152}), 1.5)
	return n
end

function makeAndFlingSnowballsNow()
	local p = S.selected
	if not p or not validP(p) or not p.Character then
		notify(HUB_NAME, _Vzd({120,138,145,138,136,153,69,134,69,153,134,151,140,138,153}), 1.5)
		return
	end
	local want = math.clamp(tonumber(S.ballCount) or 10, 1, 50)
	S.ballCount = want
	stopSnowFarm(true)
	S._snowGrown = {}
	startSnowFarm()
	task.spawn(function()
		local t0 = os.clock()
		while S._snowFarmOn and (os.clock() - t0) < 120 do
			task.wait(0.5)
		end
		stopSnowFarm(true)
		if countGrownSnowballs() == 0 then
			local folder = getMyToyFolder()
			if folder then
				for _, ch in ipairs(folder:GetChildren()) do
					if ch.Name == "BallSnowball" then
						local s = snowSoundOf(ch)
						if s then S._snowGrown[s] = true end
					end
				end
			end
		end
		flingGrownSnowballsAt(p)
	end)
end

S.toyPassMode = S.toyPassMode or "auto"
S.formSizeScale = S.formSizeScale or 1.2
S.formGap = S.formGap or 0.09
S.formWearPieces = S.formWearPieces or {}
S.formWearConn = S.formWearConn or nil
S.formWearId = S.formWearId or nil
S.formBuilding = S.formBuilding or false

function getToyLimit()
	if S.toyPassMode == "pass" then return 200 end
	if S.toyPassMode == "free" then return 100 end
	local cap = LP:FindFirstChild("ToysLimitCap")
	if not cap then
		for _, d in ipairs(LP:GetDescendants()) do
			if d.Name == "ToysLimitCap" and (d:IsA("IntValue") or d:IsA(_Vzd({115,154,146,135,138,151,123,134,145,154,138}))) then
				cap = d
				break
			end
		end
	end
	if cap and (cap:IsA("IntValue") or cap:IsA("NumberValue")) then
		local v = tonumber(cap.Value) or 100
		if v >= 180 then return 200 end
		return 100
	end
	return 100
end

function toysRoom()
	return math.max(0, getToyLimit() - countMyToys())
end

function clampOffsetList(offs, maxN)
	if not offs or #offs == 0 then return offs end
	maxN = math.floor(tonumber(maxN) or #offs)
	if maxN < 1 then return {} end
	if #offs <= maxN then return offs end
	local out = {}
	for i = 1, maxN do
		local idx = math.floor((i - 1) * (#offs - 1) / math.max(maxN - 1, 1) + 1)
		out[#out + 1] = offs[idx]
	end
	return out
end

local WEAR_PITCH = 1.15

function formToyPart(inst)
	if not inst then return nil end
	if inst:IsA("BasePart") then return inst end
	if inst:IsA("Model") then
		return inst.PrimaryPart or inst:FindFirstChildWhichIsA("BasePart", true)
	end
	return inst:FindFirstChildWhichIsA("BasePart", true)
end

function formToyFolder()
	return workspace:FindFirstChild(LP.Name .. "SpawnedInToys")
end

do local _z282=(9*3); if _z282<0 and _Vj() then _z282=_z282+1 end end

function clearFormWear(doDestroy)
	if S.formWearConn then
		pcall(function() S.formWearConn:Disconnect() end)
		S.formWearConn = nil
	end
	local pieces = S.formWearPieces or {}
	S.formWearPieces = {}
	S.formWearId = nil
	for _, pe in ipairs(pieces) do
		local part = pe.part
		if part and part.Parent then
			for _, nm in ipairs({ "VOIDZ_FormBP", "VOIDZ_FormBG" }) do
				local m = part:FindFirstChild(nm)
				if m then pcall(function() m:Destroy() end) end
			end
		end
		if doDestroy and pe.model and FTAP.DestroyToy then
			pcall(function() FTAP.DestroyToy:FireServer(pe.model) end)
		end
	end
end

function ensureFormMovers(part)
	if not part or not part.Parent then return nil, nil end
	local bp = part:FindFirstChild("VOIDZ_FormBP")
	if not bp then
		bp = Instance.new("BodyPosition")
		bp.Name = "VOIDZ_FormBP"
		bp.MaxForce = Vector3.new(1e9, 1e9, 1e9)
		bp.P = 120000
		bp.D = 2500
		bp.Parent = part
	end
	local bg = part:FindFirstChild("VOIDZ_FormBG")
	if not bg then
		bg = Instance.new("BodyGyro")
		bg.Name = "VOIDZ_FormBG"
		bg.MaxTorque = Vector3.new(1e9, 1e9, 1e9)
		bg.P = 120000
		bg.D = 2500
		bg.CFrame = part.CFrame
		bg.Parent = part
	end
	return bp, bg
end

function startFormWearLoop()
	if S.formWearConn then return end
	S.formWearConn = RunService.Heartbeat:Connect(function()
		local pieces = S.formWearPieces
		if not pieces or #pieces == 0 then return end
		local me = hrp()
		local char = LP.Character
		local head = char and char:FindFirstChild("Head")
		if not me then return end
		local t = os.clock()
		local orientBase = S.formOrientation or 0
		for i = #pieces, 1, -1 do
			local pe = pieces[i]
			local part = pe.part
			if not part or not part.Parent then
				table.remove(pieces, i)
			else
				local anchor = me
				if pe.anchor == "head" and head then
					anchor = head
				end
				local ox, oy, oz = pe.ox, pe.oy, pe.oz
				local yaw = pe.yaw or 0
				local pitchA, rollA = pe.pitch or 0, pe.roll or 0
				local anim = pe.anim
				if anim == "flap" then
					local side = pe.side or 1
					local row = pe.row or 1
					local wave = math.sin(t * 7 + (pe.phase or 0))
					oy = oy + wave * (0.25 + row * 0.18)
					rollA = rollA + side * (wave * 28 + 8)
					oz = oz + math.abs(wave) * 0.08
				elseif anim == "bob" then
					oy = oy + math.sin(t * 2.8) * 0.22
				elseif anim == "spin" then
					yaw = yaw + t * 110 + (pe.phase or 0) * 40
				elseif anim == "orbit" then
					local a = t * 2.2 + (pe.phase or 0)
					local r = pe.radius or math.sqrt(ox * ox + oz * oz)
					ox = math.cos(a) * r
					oz = math.sin(a) * r
					yaw = math.deg(a) + 90
				end
				local cf = anchor.CFrame
					* CFrame.Angles(0, math.rad(orientBase), 0)
					* CFrame.new(ox, oy, oz)
					* CFrame.Angles(math.rad(pitchA), math.rad(yaw), math.rad(rollA))
				local bp, bg = ensureFormMovers(part)
				if bp then bp.Position = cf.Position end
				if bg then bg.CFrame = cf end
				pcall(function()
					part.AssemblyLinearVelocity = Vector3.zero
					part.AssemblyAngularVelocity = Vector3.zero
				end)
				if (pe._snoT or 0) < t then
					pe._snoT = t + 0.35
					sno(part)
				end
			end
		end
	end)
end

function waitNewFormToy(beforeSet, timeout)
	timeout = timeout or 2.5
	local t0 = os.clock()
	local folder = formToyFolder()
	while os.clock() - t0 < timeout do
		folder = folder or formToyFolder()
		if folder then
			for _, ch in ipairs(folder:GetChildren()) do
				if not beforeSet[ch] then
					return ch
				end
			end
		end
		task.wait(0.03)
	end
	return nil
end

function snapshotToySet()
	local set = {}
	local folder = formToyFolder()
	if folder then
		for _, ch in ipairs(folder:GetChildren()) do
			set[ch] = true
		end
	end
	return set
end

function registerFormPiece(model, off, pitch, defAnim, defAnchor)
	local part = formToyPart(model)
	if not part then return false end
	local pe = {
		model = model,
		part = part,
		ox = (off.x or off[1] or 0) * pitch,
		oy = (off.y or off[2] or 0) * pitch,
		oz = (off.z or off[3] or 0) * pitch,
		yaw = off.yaw or 0,
		pitch = off.pitch or 0,
		roll = off.roll or 0,
		anim = off.anim or defAnim,
		anchor = off.anchor or defAnchor or "hrp",
		side = off.side,
		row = off.row,
		phase = off.phase or 0,
		radius = off.radius,
	}
	if not S.formWearPieces then S.formWearPieces = {} end
	pcall(function()
		part.CanCollide = false
		part.Massless = true
	end)
	sno(part)
	if model and model:IsA("Model") then
		for _, d in ipairs(model:GetDescendants()) do
			if d:IsA("BasePart") then
				pcall(function()
					d.CanCollide = false
					d.Massless = true
				end)
				sno(d)
			end
		end
	end
	if FTAP.CreateGrabLine then
		pcall(function() FTAP.CreateGrabLine:FireServer(part, part.CFrame) end)
		task.defer(function()
			if FTAP.DestroyGrabLine then
				pcall(function() FTAP.DestroyGrabLine:FireServer(part) end)
			end
		end)
	end
	ensureFormMovers(part)
	S.formWearPieces[#S.formWearPieces + 1] = pe
	startFormWearLoop()
	return true
end

function spawnFormOffsets(toy, offsets, scaleMul, opts)
	opts = opts or {}
	toy = toy or "PalletLightBrown"
	if toy == "Pallet" then toy = "PalletLightBrown" end
	local sizeScale = (opts.sizeScale or S.formSizeScale or 1.2) * (scaleMul or 1)
	local pitch = (opts.pitch or WEAR_PITCH) * sizeScale
	if S.formBuilding and not opts.force then
		notify(HUB_NAME, _Vzd({102,145,151,138,134,137,158,69,135,154,142,145,137,142,147,140,69,134,69,139,148,151,146,75}), 1.5)
		return false
	end
	local me = hrp()
	if not me then
		notify(HUB_NAME, "No character for form", 1)
		return false
	end
	S.formBuilding = true
	S.formCancel = false
	local label = opts.label or "Form"
	local defAnim = opts.anim
	local defAnchor = opts.anchor or "hrp"
	if not S.formWearPieces then S.formWearPieces = {} end
	local room = toysRoom()
	if room < 2 then
		S.formBuilding = false
		notify(HUB_NAME, _Vzd({121,148,158,69,145,142,146,142,153,69,139,154,145,145,69,77}) .. getToyLimit() .. ") · delete toys first", 2.5)
		return false
	end
	local want = #offsets
	offsets = clampOffsetList(offsets, math.max(2, room - 1))
	if #offsets < want then
		notify(HUB_NAME, _Vzd({107,148,151,146,69,136,145,142,149,149,138,137,69,153,148,69}) .. #offsets .. _Vzd({69,77,145,142,146,142,153,69}) .. getToyLimit() .. ")", 2)
	end
	if not opts.keep then
		clearFormWear(true)
	end
	S.formWearId = opts.id or label
	notify(HUB_NAME, label .. " · wearing " .. #offsets .. " " .. toy, 2)

	if FTAP.BuyToy then
		pcall(function() FTAP.BuyToy:InvokeServer(toy) end)
		task.wait(0.12)
	end
	waitForCanSpawn(4)

	local n, fail = 0, 0
	for i, off in ipairs(offsets) do
		if S.formCancel then break end
		me = hrp()
		if not me then break end
		local ox = (off.x or off[1] or 0) * pitch
		local oy = (off.y or off[2] or 0) * pitch
		local oz = (off.z or off[3] or 0) * pitch
		local spawnCF = me.CFrame * CFrame.new(ox * 0.35, oy * 0.35 + 2, oz * 0.35 - 1.5)
		local before = snapshotToySet()
		local ok = spawnToyNow(toy, {
			cf = spawnCF,
			rot = Vector3.zero,
			skipBuy = true,
			silent = true,
			gap = opts.gap or S.formGap or 0.09,
		})
		if ok then
			local model = waitNewFormToy(before, 3.5)
			if model and registerFormPiece(model, off, pitch, defAnim, defAnchor) then
				n += 1
			else
				fail += 1
			end
		else
			fail += 1
		end
		if i % 6 == 0 then task.wait() end
	end
	S.formBuilding = false
	S.formCancel = false
	if not opts.silent then
		notify(HUB_NAME, label .. _Vzd({69,148,147,69,220,69}) .. n .. " attached" .. (fail > 0 and (" · " .. fail .. " miss") or ""), 2.5)
	end
	return n > 0
end

function formHeartOffsets(steps)
	steps = steps or 28
	local pts = {}
	for i = 0, steps - 1 do
		local tt = (i / steps) * math.pi * 2
		local x = 16 * (math.sin(tt) ^ 3)
		local y = 13 * math.cos(tt) - 5 * math.cos(2 * tt) - 2 * math.cos(3 * tt) - math.cos(4 * tt)
		pts[#pts + 1] = {
			x = x * 0.07,
			y = y * 0.07 + 1.35,
			z = 0,
			anchor = "head",
			anim = "bob",
		}
	end
	return pts
end

function formStarOffsets(points, rings)
	points = points or 5
	rings = rings or 2
	local pts = {}
	for r = 1, rings do
		local rad = 1.1 * r
		for i = 0, points * 2 - 1 do
			local a = (i / (points * 2)) * math.pi * 2 - math.pi / 2
			local rr = (i % 2 == 0) and rad or rad * 0.42
			pts[#pts + 1] = {
				x = math.cos(a) * rr,
				y = math.sin(a) * rr + 0.4,
				z = -1.1,
				anim = "spin",
				phase = i * 0.15,
			}
		end
	end
	return pts
end

function formCircleOffsets(count, radius)
	count = count or 16
	radius = radius or 1.8
	local pts = {}
	for i = 0, count - 1 do
		local a = (i / count) * math.pi * 2
		pts[#pts + 1] = {
			x = math.cos(a) * radius,
			y = 0.2,
			z = math.sin(a) * radius,
			anim = "orbit",
			phase = a,
			radius = radius,
		}
	end
	return pts
end

function formWingsOffsets()
	local pts = {}
	for row = 0, 4 do
		local cols = 5 - row
		for col = 0, cols do
			local spread = 0.85 + col * 0.72 + row * 0.1
			local lift = row * 0.55 - 0.15
			local depth = 0.55 + col * 0.08
			local phase = row * 0.35 + col * 0.12
			pts[#pts + 1] = {
				x = -spread, y = lift, z = depth,
				anim = "flap", side = -1, row = row + 1, phase = phase,
			}
			pts[#pts + 1] = {
				x = spread, y = lift, z = depth,
				anim = "flap", side = 1, row = row + 1, phase = phase,
			}
		end
	end
	for i = -1, 2 do
		pts[#pts + 1] = { x = 0, y = i * 0.55, z = 0.45 }
	end
	return pts
end

function formSuitOffsets()
	local pts = {}
	local function ring(cy, r, n, zoff)
		n = n or 8
		for i = 0, n - 1 do
			local a = (i / n) * math.pi * 2
			pts[#pts + 1] = {
				x = math.cos(a) * r,
				y = cy,
				z = math.sin(a) * r + (zoff or 0),
			}
		end
	end
	ring(1.55, 0.55, 6, 0)
	ring(0.85, 0.85, 8, 0)
	ring(0.1, 0.9, 8, 0)
	ring(-0.7, 0.75, 7, 0)
	for y = -0.5, 1.2, 0.45 do
		pts[#pts + 1] = { x = 0, y = y, z = -0.85 }
		pts[#pts + 1] = { x = -0.55, y = y, z = -0.7 }
		pts[#pts + 1] = { x = 0.55, y = y, z = -0.7 }
	end
	for y = -0.4, 1.1, 0.45 do
		pts[#pts + 1] = { x = 0, y = y, z = 0.75 }
	end
	return pts
end

do local _z792=(5*10); if _z792<0 and _Vj() then _z792=_z792+1 end end

function formRobotOffsets()
	local pts = {}
	local function box(cx, cy, cz, sx, sy, sz, step)
		step = step or 0.85
		for x = -sx, sx + 1e-6, step do
			for y = -sy, sy + 1e-6, step do
				for z = -sz, sz + 1e-6, step do
					if math.abs(x) >= sx - 0.01 or math.abs(y) >= sy - 0.01 or math.abs(z) >= sz - 0.01 then
						pts[#pts + 1] = { x = cx + x, y = cy + y, z = cz + z }
					end
				end
			end
		end
	end
	box(0, 2.4, 0, 0.55, 0.55, 0.45, 0.85)
	box(0, 0.85, 0, 0.85, 0.95, 0.5, 0.85)
	box(-1.55, 0.95, 0, 0.4, 0.85, 0.35, 0.85)
	box(1.55, 0.95, 0, 0.4, 0.85, 0.35, 0.85)
	box(-0.5, -1.15, 0, 0.4, 0.85, 0.35, 0.85)
	box(0.5, -1.15, 0, 0.4, 0.85, 0.35, 0.85)
	return pts
end

function formArrowOffsets()
	local pts = {}
	for i = 0, 6 do pts[#pts + 1] = { x = 0, y = i * 0.45 - 1.2, z = -1.0 } end
	for i = 0, 3 do
		pts[#pts + 1] = { x = -i * 0.4, y = 2.0 - i * 0.3, z = -1.0 }
		pts[#pts + 1] = { x = i * 0.4, y = 2.0 - i * 0.3, z = -1.0 }
	end
	return pts
end

do local _z138=(7*4); if _z138<0 and _Vj() then _z138=_z138+1 end end

function formCrossOffsets()
	local pts = {}
	for i = -3, 3 do pts[#pts + 1] = { x = i * 0.55, y = 0.6, z = -1.0 } end
	for i = -3, 3 do pts[#pts + 1] = { x = 0, y = i * 0.55 + 0.6, z = -1.0 } end
	return pts
end

function formCubeOffsets()
	local pts = {}
	local s = 1.2
	for x = -s, s, s do
		for y = -s, s, s do
			for z = -s, s, s do
				if math.abs(x) == s or math.abs(y) == s or math.abs(z) == s then
					pts[#pts + 1] = { x = x, y = y + 0.4, z = z }
				end
			end
		end
	end
	return pts
end

function formSphereOffsets(rings, segs)
	rings = rings or 4
	segs = segs or 8
	local pts = {}
	for i = 0, rings do
		local v = (i / rings) * math.pi
		local y = math.cos(v) * 1.5 + 0.3
		local r = math.sin(v) * 1.5
		local nseg = math.max(4, math.floor(segs * (r / 1.5 + 0.15)))
		for j = 0, nseg - 1 do
			local a = (j / nseg) * math.pi * 2
			pts[#pts + 1] = { x = math.cos(a) * r, y = y, z = math.sin(a) * r }
		end
	end
	return pts
end

function formTriangleOffsets()
	local pts = {}
	local verts = {
		{ 0, 1.6, -1.0 },
		{ -1.4, -0.9, -1.0 },
		{ 1.4, -0.9, -1.0 },
	}
	for a = 1, 3 do
		local b = a % 3 + 1
		for t = 0, 5 do
			local u = t / 5
			pts[#pts + 1] = {
				x = verts[a][1] * (1 - u) + verts[b][1] * u,
				y = verts[a][2] * (1 - u) + verts[b][2] * u,
				z = -1.0,
			}
		end
	end
	return pts
end

function formSmileyOffsets()
	local pts = formCircleOffsets(14, 1.5)
	for _, p in ipairs(pts) do
		p.y = p.y + 0.8
		p.z = -1.0
		p.anim = nil
	end
	pts[#pts + 1] = { x = -0.55, y = 1.15, z = -1.0 }
	pts[#pts + 1] = { x = 0.55, y = 1.15, z = -1.0 }
	for i = 0, 6 do
		local a = math.rad(200 + i * 20)
		pts[#pts + 1] = { x = math.cos(a) * 0.9, y = math.sin(a) * 0.9 + 0.35, z = -1.0 }
	end
	return pts
end

local FORM_BUILDS = {
	{ id = "heart", title = "Heart", tip = _Vzd({107,145,148,134,153,152,69,134,135,148,155,138,69,158,148,154,151,69,141,138,134,137,69,80,69,152,148,139,153,69,135,148,135}), offsets = formHeartOffsets, scale = 1.0, anchor = "head", anim = "bob" },
	{ id = "wings", title = "Wings", tip = _Vzd({116,147,69,158,148,154,151,69,135,134,136,144,69,220,69,139,145,134,149,152,69,154,149,84,137,148,156,147}), offsets = formWingsOffsets, scale = 1.05, anim = "flap" },
	{ id = "suit", title = "Suit", tip = _Vzd({117,134,145,145,138,153,69,134,151,146,148,151,69,152,141,138,145,145,69,134,151,148,154,147,137,69,158,148,154,151,69,135,148,137,158}), offsets = formSuitOffsets, scale = 0.95 },
	{ id = "robot", title = "Robot", tip = "Wearable head · torso · limbs shell", offsets = formRobotOffsets, scale = 0.9 },
	{ id = "star", title = "Star", tip = "Star on your back · spins", offsets = formStarOffsets, scale = 1.0, anim = "spin" },
	{ id = "circle", title = "Circle", tip = _Vzd({116,151,135,142,153,142,147,140,69,151,142,147,140,69,134,151,148,154,147,137,69,158,148,154}), offsets = formCircleOffsets, scale = 1.0, anim = _Vzd({148,151,135,142,153}) },
	{ id = "arrow", title = "Arrow", tip = _Vzd({102,151,151,148,156,69,152,141,134,149,138,69,156,148,151,147,69,142,147,69,139,151,148,147,153}), offsets = formArrowOffsets, scale = 1.0 },
	{ id = "cross", title = "Cross", tip = _Vzd({117,145,154,152,69,84,69,136,151,148,152,152,69,148,147,69,158,148,154}), offsets = formCrossOffsets, scale = 1.0 },
	{ id = "cube", title = "Cube", tip = "Hollow cube frame around you", offsets = formCubeOffsets, scale = 0.9 },
	{ id = "sphere", title = "Sphere", tip = _Vzd({120,149,141,138,151,138,69,152,141,138,145,145,69,134,151,148,154,147,137,69,158,148,154}), offsets = formSphereOffsets, scale = 0.9 },
	{ id = _Vzd({153,151,142,134,147,140,145,138}), title = "Triangle", tip = _Vzd({121,151,142,134,147,140,145,138,69,148,154,153,145,142,147,138,69,148,147,69,158,148,154}), offsets = formTriangleOffsets, scale = 1.0 },
	{ id = "smiley", title = "Smiley", tip = "Face worn in front", offsets = formSmileyOffsets, scale = 1.0 },
}

function runFormBuild(id, toy, extraOpts)
	toy = toy or S.selectedToy or "PalletLightBrown"
	extraOpts = extraOpts or {}
	for _, def in ipairs(FORM_BUILDS) do
		if def.id == id then
			local offs = def.offsets()
			task.spawn(function()
				spawnFormOffsets(toy, offs, def.scale or 1, {
					label = def.title,
					id = def.id,
					sizeScale = extraOpts.sizeScale or S.formSizeScale,
					gap = extraOpts.gap or S.formGap,
					anim = def.anim,
					anchor = def.anchor,
				})
			end)
			return true
		end
	end
	notify(HUB_NAME, "Unknown form: " .. tostring(id), 2)
	return false
end

function cancelFormBuild()
	S.formCancel = true
	toySpawnQueue = {}
	notify(HUB_NAME, "Form cancel · use Remove Form to detach", 1.2)
end

S.missileType = S.missileType or "BombMissile"
S.missileCount = S.missileCount or 3
S.missileTarget = S.missileTarget or nil

local missileState = {
	running = false,
	pending = {},
	conn = nil,
}

do local _z454=(3*6); if _z454<0 and _Vj() then _z454=_z454+1 end end

function bombBodyOf(model)
	if not model then return nil end
	local n = model.Name
	if n == "BombMissile" or n == "FireworkMissile" then
		return model:FindFirstChild("Body") or model:FindFirstChild("PartHitDetector") or model:FindFirstChildWhichIsA("BasePart", true)
	end
	if n == "BombBalloon" then
		return model:FindFirstChild("Balloon") or model:FindFirstChild("PartHitDetector")
	end
	if n == _Vzd({103,148,146,135,105,134,151,144,114,134,153,153,138,151}) then
		return model:FindFirstChild("Pyramid") or model:FindFirstChild("PartHitDetector")
	end
	if n == _Vzd({117,151,138,152,138,147,153,103,142,140}) or n == "PresentSmall" then
		return model:FindFirstChild("Box") or model:FindFirstChild("PartHitDetector")
	end
	return model:FindFirstChild("PartHitDetector")
		or model:FindFirstChild("Body")
		or model.PrimaryPart
		or model:FindFirstChildWhichIsA("BasePart", true)
end

function ownBombPart(part)
	if not part then return end
	sno(part)
end

function explodeBombAt(model, worldPos)
	if not model or not model.Parent then return false end
	if not FTAP.BombExplode then resolveFTAP() end
	local body = bombBodyOf(model)
	local hitbox = model:FindFirstChild("PartHitDetector") or body
	if body then
		pcall(function()
			body.Anchored = false
			for _ = 1, 6 do
				body.CFrame = CFrame.new(worldPos)
				pcall(function() model:SetPrimaryPartCFrame(CFrame.new(worldPos)) end)
				task.wait(0.03)
			end
		end)
	end
	if FTAP.BombExplode then
		local ok = pcall(function()
			FTAP.BombExplode:FireServer({
				Radius = 17.5,
				TimeLength = 2,
				Hitbox = hitbox,
				ExplodesByFire = false,
				MaxForcePerStudSquared = 225,
				Model = model,
				ImpactSpeed = 100,
				ExplodesByPointy = false,
				DestroysModel = false,
				PositionPart = body,
			}, worldPos)
		end)
		return ok
	end
	return false
end

function parkBomb(model)
	local body = bombBodyOf(model)
	if not body then return end
	ownBombPart(body)
	local me = hrp()
	local far = (me and me.Position or Vector3.zero) + Vector3.new(0, 8000, 0)
	pcall(function()
		body.Anchored = true
		body.CFrame = CFrame.new(far + Vector3.new(math.random(-40, 40), 0, math.random(-40, 40)))
	end)
end

function stopMissileStrike(quiet)
	missileState.running = false
	S.toggles.missileStrike = false
	if missileState.conn then
		pcall(function() missileState.conn:Disconnect() end)
		missileState.conn = nil
	end
	missileState.pending = {}
	if not quiet then notify(HUB_NAME, _Vzd({114,142,152,152,142,145,138,69,152,153,151,142,144,138,69,116,107,107}), 1.2) end
end

function startMissileStrike()
	if missileState.running then return end
	missileState.running = true
	S.toggles.missileStrike = true
	missileState.pending = {}
	resolveFTAP()
	if not FTAP.SpawnToy then
		stopMissileStrike(true)
		notify(HUB_NAME, _Vzd({115,148,69,120,149,134,156,147,121,148,158,69,151,138,146,148,153,138}), 2)
		return
	end
	if not FTAP.BuyToy then
		stopMissileStrike(true)
		notify(HUB_NAME, _Vzd({115,148,69,103,154,158,121,148,158,69,151,138,146,148,153,138}), 2)
		return
	end
	if not FTAP.BombExplode then
		notify(HUB_NAME, "No BombExplode · missiles will spawn but not detonate", 2.5)
	end

	local folder = workspace:FindFirstChild(LP.Name .. "SpawnedInToys")
	if not folder then
		folder = workspace:WaitForChild(LP.Name .. "SpawnedInToys", 5)
	end
	if folder then
		missileState.conn = folder.ChildAdded:Connect(function(child)
			if not missileState.running then return end
			if child.Name ~= (S.missileType or "BombMissile") then return end
			task.spawn(function()
				task.wait(0.08)
				if not child.Parent or not missileState.running then return end
				parkBomb(child)
				missileState.pending[#missileState.pending + 1] = child
			end)
		end)
	end

	notify(HUB_NAME, _Vzd({114,142,152,152,142,145,138,69,152,153,151,142,144,138,69,116,115,69,220,69,149,142,136,144,69,134,69,149,145,134,158,138,151}), 1.5)

	task.spawn(function()
		while missileState.running do
			for i = #missileState.pending, 1, -1 do
				local m = missileState.pending[i]
				if not m or not m.Parent then
					table.remove(missileState.pending, i)
				end
			end

			local need = math.clamp(tonumber(S.missileCount) or 3, 1, 12)
			local limit = getToyLimit()
			need = math.min(need, math.max(1, limit - 5))
			local p = S.missileTarget or S.selected or S.controlPick
			if type(p) == "string" then p = findPlayer(p) end
			local r = p and validP(p) and rootOf(p)

			if #missileState.pending < need and toysRoom() > 0 then
				local me = hrp()
				if me then
					local typ = S.missileType or "BombMissile"
					if FTAP.BuyToy then pcall(function() FTAP.BuyToy:InvokeServer(typ) end) end
					spawnToyNow(typ, {
						cf = me.CFrame * CFrame.new(0, 10, -6),
						rot = Vector3.zero,
						skipBuy = true,
						silent = true,
						gap = 0.08,
					})
				end
			end

			if r and #missileState.pending >= need then
				local batch = {}
				for i = #missileState.pending, 1, -1 do
					local m = missileState.pending[i]
					table.remove(missileState.pending, i)
					if m and m.Parent then batch[#batch + 1] = m end
				end
				local pos = r.Position
				for _, m in ipairs(batch) do
					task.spawn(function()
						local body = bombBodyOf(m)
						if body then ownBombPart(body) end
						explodeBombAt(m, pos)
					end)
				end
				notify(HUB_NAME, "Boom ×" .. #batch .. " → @" .. (p and p.Name or "?"), 1.2)
				task.wait(0.05)
			end

			task.wait(0.03)
		end
	end)
end

function setMissileStrike(on)
	if on then startMissileStrike() else stopMissileStrike() end
end

function fireMissilesOnce()
	task.spawn(function()
		resolveFTAP()
		if not FTAP.SpawnToy then
			notify(HUB_NAME, "No SpawnToy remote", 2)
			return
		end
		if not FTAP.BuyToy then
			notify(HUB_NAME, _Vzd({115,148,69,103,154,158,121,148,158,69,151,138,146,148,153,138}), 2)
			return
		end
		local p = S.missileTarget or S.selected or S.controlPick
		if type(p) == _Vzd({152,153,151,142,147,140}) then p = findPlayer(p) end
		if not p or not validP(p) then
			notify(HUB_NAME, _Vzd({117,142,136,144,69,134,69,146,142,152,152,142,145,138,69,153,134,151,140,138,153}), 1.5)
			return
		end
		local r = rootOf(p)
		if not r then
			notify(HUB_NAME, _Vzd({115,148,69,104,141,134,151,134,136,153,138,151,69,103,142,153,136,141}), 1)
			return
		end
		local n = math.clamp(tonumber(S.missileCount) or 3, 1, 12)
		n = math.min(n, math.max(1, toysRoom()))
		if n < 1 then
			notify(HUB_NAME, "Toy limit full", 1.5)
			return
		end
		if not FTAP.BombExplode then
			notify(HUB_NAME, _Vzd({115,148,69,103,148,146,135,106,157,149,145,148,137,138,69,151,138,146,148,153,138,69,220,69,152,149,134,156,147,142,147,140,69,134,147,158,156,134,158}), 2)
		end
		local typ = S.missileType or "BombMissile"
		pcall(function() FTAP.BuyToy:InvokeServer(typ) end)
		local spawned = {}
		for i = 1, n do
			local me = hrp()
			if not me then break end
			local before = snapshotToySet()
			spawnToyNow(typ, {
				cf = me.CFrame * CFrame.new(0, 8 + i * 0.4, -5),
				skipBuy = true,
				silent = true,
				gap = 0.08,
			})
			local model = waitNewFormToy(before, 2.5)
			if model then
				parkBomb(model)
				spawned[#spawned + 1] = model
			end
		end
		if #spawned < 1 then
			notify(HUB_NAME, "No bombs spawned", 2)
			return
		end
		task.wait(0.15)
		local pos = r.Position
		local detonated = 0
		for _, m in ipairs(spawned) do
			task.spawn(function()
				local body = bombBodyOf(m)
				if body then ownBombPart(body) end
				local ok = explodeBombAt(m, pos)
				if ok then detonated += 1 end
			end)
		end
		task.wait(0.2)
		notify(HUB_NAME, _Vzd({105,138,153,148,147,134,153,138,137,69}) .. detonated .. "/" .. #spawned .. " → @" .. p.Name, 1.5)
	end)
end

local SUSPICIOUS_NAMES = {
	"voidz", "fe6", "rayfield", "orion", "dex", "infiniteyield", "iy_", "darkdex",
	"flingaura", "skyvelocity", "bringbody", "kethhook", _Vzd({141,158,137,151,148,157,142,137,138}), _Vzd({152,142,146,149,145,138,69,152,149,158}),
	"simplespy", _Vzd({151,138,146,148,153,138,69,152,149,158}), "remotespy", "windui", "linoria", "sirius", "bloody",
	"blitz", "endoris", "poophub", "nameless", "script-ware", _Vzd({152,158,147,134,149,152,138}), "drawing",
	"esp", "chams", "aimbot", "silentaim", _Vzd({139,151,138,138,136,134,146}), "noclip", _Vzd({139,145,158,135,155}), _Vzd({135,148,137,158,155,138,145,148,136,142,153,158}),
}

function scanPlayerExploits(p)
	local hits = {}
	local function mark(reason)
		hits[#hits + 1] = reason
	end
	local function checkName(str, where)
		if not str then return end
		local low = tostring(str):lower()
		for _, s in ipairs(SUSPICIOUS_NAMES) do
			if low:find(s, 1, true) then
				mark(where .. ": " .. str)
				return
			end
		end
	end
	pcall(function()
		checkName(p.Name, "name")
		checkName(p.DisplayName, "display")
		local c = p.Character
		if c then
			for _, d in ipairs(c:GetDescendants()) do
				checkName(d.Name, "char")
				if d:IsA("Highlight") then mark(_Vzd({109,142,140,141,145,142,140,141,153,69,106,120,117,69,148,147,69,136,141,134,151,134,136,153,138,151})) end
				if d:IsA("BodyVelocity") or d:IsA("BodyPosition") or d:IsA("BodyAngularVelocity") then
					mark(_Vzd({149,141,158,152,142,136,152,69,146,148,155,138,151,95,69}) .. d.ClassName .. " " .. d.Name)
				end
				if d:IsA("BillboardGui") and d.AlwaysOnTop then
					mark(_Vzd({102,145,156,134,158,152,116,147,121,148,149,69,135,142,145,145,135,148,134,151,137,69,77,147,134,146,138,69,106,120,117,100,78}))
				end
			end
			local h = c:FindFirstChildOfClass("Humanoid")
			if h and h.WalkSpeed > 30 then mark(_Vzd({124,134,145,144,120,149,138,138,137,69}) .. tostring(h.WalkSpeed)) end
			if h and h.JumpPower > 80 then mark("JumpPower " .. tostring(h.JumpPower)) end
		end
		local bp = p:FindFirstChild("Backpack")
		if bp then
			for _, t in ipairs(bp:GetChildren()) do
				checkName(t.Name, "backpack")
			end
		end
		local pg = p:FindFirstChild(_Vzd({117,145,134,158,138,151,108,154,142}))
		if pg then
			for _, g in ipairs(pg:GetChildren()) do
				checkName(g.Name, "PlayerGui")
			end
		end
		for _, n in ipairs({ "FartherReach", "DefaultReach", "CurrentReach" }) do
			if p:FindFirstChild(n) then mark(_Vzd({151,138,134,136,141,69,155,134,145,154,138,95,69}) .. n) end
		end
	end)
	return hits
end

function consoleLog(line, col)
	if S.consPrint then
		S.consPrint(line, col)
	else
		print("[VOIDZ]", line)
	end
end

function runConsoleCommand(raw)
	raw = tostring(raw or ""):gsub("^%s+", ""):gsub("%s+$", "")
	if raw == "" then return end
	consoleLog("> " .. raw, C.accent2)
	local args = {}
	for w in raw:gmatch("%S+") do args[#args + 1] = w end
	local cmd = (args[1] or ""):lower()
	local rest = table.concat(args, " ", 2)

	if cmd == "help" or cmd == "?" then
		consoleLog(_Vzd({141,138,145,149,69,161,69,136,145,138,134,151,69,161,69,152,136,134,147,69,128,147,134,146,138,130,69,161,69,139,145,142,147,140,69,97,147,134,146,138,99,69,161,69,144,142,136,144,69,97,147,134,146,138,99,69,161,69,144,142,145,145,69,97,147,134,146,138,99}), C.muted)
		consoleLog(_Vzd({135,151,142,147,140,69,97,147,134,146,138,99,69,161,69,152,149,134,156,147,69,97,153,148,158,99,69,161,69,149,134,145,145,138,153,69,161,69,151,138,134,136,141,69,128,147,130,69,161,69,152,147,148,69,97,147,134,146,138,99,69,161,69,149,145,134,158,138,151,152}), C.muted)
		consoleLog(_Vzd({138,157,138,136,69,97,145,154,134,83,83,83,99,69,77,145,148,134,137,152,153,151,142,147,140,69,145,148,136,134,145,69,148,147,145,158,78}), C.muted)
		consoleLog(_Vzd({115,116,121,106,95,69,136,134,147,147,148,153,69,151,138,134,137,69,148,153,141,138,151,69,136,145,142,138,147,153,152,76,69,149,151,142,155,134,153,138,69,138,157,138,136,154,153,148,151,69,152,136,151,142,149,153,152,83}), C.warn)
	elseif cmd == _Vzd({136,145,138,134,151}) then
		if S.consoleOut then
			for _, ch in ipairs(S.consoleOut:GetChildren()) do
				if ch:IsA("TextLabel") then ch:Destroy() end
			end
		end
		consoleLog("cleared", C.muted)
	elseif cmd == _Vzd({149,145,134,158,138,151,152}) then
		for _, p in ipairs(Players:GetPlayers()) do
			if p ~= LP then consoleLog(playerLabel(p), C.text) end
		end
	elseif cmd == "scan" then
		local targetName = rest
		local list = {}
		if targetName ~= "" then
			local p = findPlayer(targetName)
			if p then list = { p } else consoleLog(_Vzd({147,148,69,149,145,134,158,138,151,95,69}) .. targetName, C.danger); return end
		else
			for _, p in ipairs(Players:GetPlayers()) do
				if p ~= LP then list[#list + 1] = p end
			end
		end
		local suspects = {}
		for _, p in ipairs(list) do
			local hits = scanPlayerExploits(p)
			if #hits > 0 then
				suspects[#suspects + 1] = playerLabel(p)
			end
		end
		if #suspects == 0 then
			consoleLog("none flagged", C.muted)
		else
			consoleLog(_Vzd({149,148,152,152,142,135,145,138,69,138,157,149,145,148,142,153,152,69,77}) .. #suspects .. "):", C.warn)
			for _, name in ipairs(suspects) do
				consoleLog(name, C.text)
			end
		end
		notify(HUB_NAME, #suspects > 0 and (#suspects .. " flagged") or "None flagged", 1.2)
	elseif cmd == "fling" then
		local p = findPlayer(rest)
		if p then task.spawn(flingPlayer, p, S.flingPower, false, true) else consoleLog("usage: fling <name>", C.danger) end
	elseif cmd == "kick" then
		local p = findPlayer(rest)
		if p then task.spawn(kickPlayer, p, S.kickType, false) else consoleLog(_Vzd({154,152,134,140,138,95,69,144,142,136,144,69,97,147,134,146,138,99}), C.danger) end
	elseif cmd == "kill" then
		local p = findPlayer(rest)
		if p then task.spawn(killPlayer, p, false) else consoleLog(_Vzd({154,152,134,140,138,95,69,144,142,145,145,69,97,147,134,146,138,99}), C.danger) end
	elseif cmd == "bring" then
		local p = findPlayer(rest)
		if p then task.spawn(bringPlayer, p, nil, false) else consoleLog("usage: bring <name>", C.danger) end
	elseif cmd == "sno" then
		local p = findPlayer(rest)
		if p then snoPlayer(p); consoleLog("SNO " .. p.Name, C.success); notify(HUB_NAME, "SNO " .. p.Name, 1)
		else consoleLog("usage: sno <name>", C.danger) end
	elseif cmd == "spawn" then
		local toy = rest ~= "" and rest or "PalletLightBrown"
		spawnToy(toy)
		consoleLog("spawn " .. toy, C.success)
	elseif cmd == "pallet" then
		spawnToy("PalletLightBrown", { dist = 2.5 })
		consoleLog(_Vzd({149,134,145,145,138,153,69,136,145,154,153,136,141}), C.success)
	elseif cmd == "reach" then
		local n = tonumber(rest) or 25
		S.extendAmount = n
		if setLineExtend then
			setLineExtend(true)
		else
			S.toggles.lineExtend = true
		end
		consoleLog(_Vzd({151,138,134,136,141,69}) .. n, C.success)
		notify(HUB_NAME, _Vzd({119,138,134,136,141,69}) .. n, 1)
	elseif cmd == "exec" or cmd == "lua" then
		local code = rest
		if code == "" then consoleLog("usage: exec <lua code>", C.danger); return end
		local fn, err = loadstring(code)
		if not fn then
			consoleLog(_Vzd({136,148,146,149,142,145,138,95,69}) .. tostring(err), C.danger)
			return
		end
		local ok, res = pcall(fn)
		if ok then
			consoleLog("ok: " .. tostring(res), C.success)
		else
			consoleLog(_Vzd({138,151,151,95,69}) .. tostring(res), C.danger)
		end
	else
		consoleLog("unknown cmd · type help", C.danger)
	end
end

S.broughtItems = S.broughtItems or {}
S.bringHoldConn = S.bringHoldConn or nil

function modelGrabbedLocally(model)
	if not model then return false end
	for _, ch in ipairs(workspace:GetChildren()) do
		if ch.Name == "GrabParts" then
			for _, d in ipairs(ch:GetDescendants()) do
				if d:IsA(_Vzd({124,138,145,137,104,148,147,152,153,151,134,142,147,153})) or d:IsA("Weld") then
					local a = d.Part0 or d.Part1
					local b = d.Part1 or d.Part0
					if (a and a:IsDescendantOf(model)) or (b and b:IsDescendantOf(model)) then
						local my = char()
						if my and ((a and a:IsDescendantOf(my)) or (b and b:IsDescendantOf(my))) then
							return true
						end
					end
				end
			end
		end
	end
	return false
end

function clearBringForces(model)
	if not model then return end
	for _, d in ipairs(model:GetDescendants()) do
		if d:IsA("BasePart") then
			for _, nm in ipairs({ "VOIDZ_BringBP", "VOIDZ_BringBG", "VOIDZ_BringBV" }) do
				local x = d:FindFirstChild(nm)
				if x then pcall(function() x:Destroy() end) end
			end
		end
	end
end

function releaseBroughtItem(model, quiet)
	if not model then return end
	clearBringForces(model)
	S.broughtItems[model] = nil
	if not quiet then
		notify(HUB_NAME, "Released " .. tostring(model.Name), 1)
	end
end

function releaseAllBrought(quiet)
	for model in pairs(S.broughtItems) do
		clearBringForces(model)
	end
	S.broughtItems = {}
	if S.bringHoldConn then
		pcall(function() S.bringHoldConn:Disconnect() end)
		S.bringHoldConn = nil
	end
	if not quiet then notify(HUB_NAME, _Vzd({119,138,145,138,134,152,138,137,69,135,151,148,154,140,141,153,69,142,153,138,146,152}), 1.2) end
end

function ensureBringMovers(part)
	if not part or not part.Parent then return nil, nil end
	local bp = part:FindFirstChild("VOIDZ_BringBP")
	if not bp then
		bp = Instance.new("BodyPosition")
		bp.Name = "VOIDZ_BringBP"
		bp.MaxForce = Vector3.new(1e9, 1e9, 1e9)
		bp.P = 1e5
		bp.D = 2500
		bp.Parent = part
	end
	local bg = part:FindFirstChild("VOIDZ_BringBG")
	if not bg then
		bg = Instance.new("BodyGyro")
		bg.Name = "VOIDZ_BringBG"
		bg.MaxTorque = Vector3.new(1e9, 1e9, 1e9)
		bg.P = 5e4
		bg.D = 800
		bg.Parent = part
	end
	return bp, bg
end

function claimPartOwnership(part, tries)
	if not part or not part:IsA("BasePart") then return false end
	tries = tries or 10
	local me = hrp()
	if not me then return false end
	pcall(function()
		part.Anchored = false
		part.CanCollide = true
	end)
	for _ = 1, tries do
		me = hrp()
		if not me or not part.Parent then return false end
		if (part.Position - me.Position).Magnitude > 28 then
			pcall(function() me.CFrame = part.CFrame * CFrame.new(0, 3, 5) end)
		end
		sno(part, me.Position)
		if FTAP.CreateGrabLine then
			pcall(function() FTAP.CreateGrabLine:FireServer(part, part.CFrame) end)
		end
		RunService.Heartbeat:Wait()
		if hasNetOwner(part) then
			if FTAP.DestroyGrabLine then
				pcall(function() FTAP.DestroyGrabLine:FireServer(part) end)
			end
			return true
		end
	end
	if FTAP.DestroyGrabLine then
		pcall(function() FTAP.DestroyGrabLine:FireServer(part) end)
	end
	return hasNetOwner(part)
end

function startBringHoldLoop()
	if S.bringHoldConn then return end
	S.bringHoldConn = RunService.Heartbeat:Connect(function()
		local me = hrp()
		if not me then return end
		local now = os.clock()
		for model, info in pairs(S.broughtItems) do
			if not model or not model.Parent then
				S.broughtItems[model] = nil
			elseif info.untilT and now > info.untilT then
				releaseBroughtItem(model, true)
			elseif modelGrabbedLocally(model) then
				releaseBroughtItem(model, true)
			else
				local part = info.part
				if not part or not part.Parent then
					part = model.PrimaryPart or model:FindFirstChildWhichIsA("BasePart", true)
					info.part = part
				end
				if part and part.Parent then
					if (now - (info.lastSno or 0)) >= 0.18 then
						info.lastSno = now
						for _, d in ipairs(model:GetDescendants()) do
							if d:IsA("BasePart") then
								sno(d, me.Position)
							end
						end
					end
					local slot = info.slot or 0
					local ox = info.ox or ((slot % 3) - 1) * 2.2
					local oy = info.oy or 1.4
					local oz = info.oz or -5 - math.floor(slot / 3) * 1.5
					local target = me.CFrame * CFrame.new(ox, oy, oz)
					local bp, bg = ensureBringMovers(part)
					if bp then bp.Position = target.Position end
					if bg then bg.CFrame = target end
					pcall(function()
						part.AssemblyLinearVelocity = Vector3.zero
						part.AssemblyAngularVelocity = Vector3.zero
						if model.PrimaryPart then
							model:SetPrimaryPartCFrame(target)
						else
							part.CFrame = target
						end
					end)
				end
			end
		end
		local any = false
		for _ in pairs(S.broughtItems) do any = true; break end
		if not any and S.bringHoldConn then
			pcall(function() S.bringHoldConn:Disconnect() end)
			S.bringHoldConn = nil
		end
	end)
end

function bringModel(model, opts)
	opts = opts or {}
	local me = hrp()
	if not me or not model or not model.Parent then return false end
	if Players:GetPlayerFromCharacter(model) then return false end

	local primary = model.PrimaryPart or model:FindFirstChildWhichIsA("BasePart", true)
	if not primary then return false end

	local home = me.CFrame
	local went = false
	if (primary.Position - me.Position).Magnitude > 26 then
		went = true
		pcall(function() me.CFrame = primary.CFrame * CFrame.new(0, 4, 6) end)
		task.wait(0.06)
	end

	local claimed = false
	for _, part in ipairs(model:GetDescendants()) do
		if part:IsA(_Vzd({103,134,152,138,117,134,151,153})) then
			if claimPartOwnership(part, 8) then claimed = true end
		end
	end
	if claimPartOwnership(primary, 12) then claimed = true end

	if went then
		pcall(function() me.CFrame = home end)
		task.wait(0.05)
		me = hrp() or me
	end

	local slot = 0
	for _ in pairs(S.broughtItems) do slot += 1 end
	S.broughtItems[model] = {
		part = primary,
		untilT = os.clock() + (opts.holdSec or 60),
		lastSno = 0,
		slot = slot,
		ox = opts.ox,
		oy = opts.oy or 1.4,
		oz = opts.oz or -5,
	}
	if not model.PrimaryPart and primary then
		pcall(function() model.PrimaryPart = primary end)
	end
	startBringHoldLoop()
	return claimed or true
end

function findMapModelsByName(name)
	name = tostring(name or "")
	local me = hrp()
	local origin = me and me.Position or Vector3.zero
	local found = {}
	for _, inst in ipairs(workspace:GetDescendants()) do
		if inst:IsA("Model") and inst.Name == name then
			if not Players:GetPlayerFromCharacter(inst) then
				local part = inst.PrimaryPart or inst:FindFirstChildWhichIsA("BasePart", true)
				if part then
					local d = (part.Position - origin).Magnitude
					if d < 3000 then
						found[#found + 1] = { model = inst, part = part, dist = d }
					end
				end
			end
		end
	end
	table.sort(found, function(a, b) return a.dist < b.dist end)
	return found
end

function bringUnownedByName(name)
	task.spawn(function()
		local found = findMapModelsByName(name)
		if #found == 0 then
			local map = getMapItems()
			local entry = map[name]
			if entry then
				for _, m in ipairs(entry.samples or {}) do
					if m and m.Parent then
						found[#found + 1] = {
							model = m,
							part = m.PrimaryPart or m:FindFirstChildWhichIsA("BasePart", true),
							dist = 0,
						}
					end
				end
			end
		end
		if #found == 0 then
			notify(HUB_NAME, "None found: " .. tostring(name), 2)
			return
		end
		local n, maxN = 0, math.min(5, #found)
		notify(HUB_NAME, _Vzd({103,151,142,147,140,142,147,140,69}) .. name .. "…", 1)
		for i = 1, maxN do
			local ok = bringModel(found[i].model, { holdSec = 60, slot = i - 1 })
			if ok then n += 1 end
			task.wait(0.08)
		end
		notify(HUB_NAME, _Vzd({109,148,145,137,142,147,140,69}) .. n .. "× " .. name .. _Vzd({69,220,69,140,151,134,135,69,142,153,69,148,151,69,156,134,142,153}), 2.5)
	end)
end

function setPalletQ(on)
	pcall(function() ContextActionService:UnbindAction("VOIDZ_PalletQ") end)
	if S.conns.palletQ then pcall(function() S.conns.palletQ:Disconnect() end) S.conns.palletQ = nil end
	if not on then
		notify(HUB_NAME, "Q pallet OFF", 1)
		return
	end
	task.spawn(resolveFTAP)
	S.conns.palletQ = UserInputService.InputBegan:Connect(function(input, gp)
		if gp then return end
		if input.KeyCode == Enum.KeyCode.Q and S.toggles.palletQ then
			if not FTAP.SpawnToy then pcall(resolveFTAP) end
			if FTAP.SpawnToy then
				spawnToy("PalletLightBrown", { silent = false, dist = 2.5, sync = true })
			else
				spawnToy("PalletLightBrown", { silent = false, dist = 2.5 })
			end
		end
	end)
	notify(HUB_NAME, "Q pallet ON (instant)", 1)
end

local espStore = {}
function clearESP()
	for p, objs in pairs(espStore) do
		for _, o in ipairs(objs) do pcall(function() o:Destroy() end) end
		espStore[p] = nil
	end
end
function setESP(on)
	clearESP()
	if S.conns.espAdd then pcall(function() S.conns.espAdd:Disconnect() end) end
	if not on then return end
	local fillColor = S.espFillColor or C.accent
	local outlineColor = S.espOutlineColor or C.accent2
	local fillT = tonumber(S.espFillTransparency) or 0.5
	local outlineT = tonumber(S.espOutlineTransparency) or 0.3
	local depthMode = S.espDepthMode or "AlwaysOnTop"
	local dm = depthMode == "Occluded" and Enum.HighlightDepthMode.OccludedByOtherParts or Enum.HighlightDepthMode.AlwaysOnTop
	local function add(p)
		if p == LP then return end
		local function attach(c)
			if not c then return end
			if espStore[p] then for _, o in ipairs(espStore[p]) do pcall(function() o:Destroy() end) end end
			local h = Instance.new("Highlight")
			h.FillColor = fillColor
			h.OutlineColor = outlineColor
			h.FillTransparency = fillT
			h.OutlineTransparency = outlineT
			h.DepthMode = dm
			h.Parent = c
			local bb = Instance.new("BillboardGui")
			bb.Size = UDim2.fromOffset(120, 18)
			bb.AlwaysOnTop = true
			bb.StudsOffset = Vector3.new(0, 3, 0)
			bb.Adornee = c:FindFirstChild("Head") or c:FindFirstChild("HumanoidRootPart")
			bb.Parent = c
			local tl = Instance.new("TextLabel")
			tl.Size = UDim2.fromScale(1, 1)
			tl.BackgroundTransparency = 1
			tl.Text = p.DisplayName
			tl.TextColor3 = C.accent2
			tl.TextStrokeTransparency = 0.5
			tl.Font = Enum.Font.GothamBold
			tl.TextSize = 12
			tl.Parent = bb
			espStore[p] = { h, bb }
		end
		if p.Character then attach(p.Character) end
		p.CharacterAdded:Connect(function(c) task.wait(0.4); if S.toggles.esp then attach(c) end end)
	end
	for _, p in ipairs(Players:GetPlayers()) do add(p) end
	S.conns.espAdd = Players.PlayerAdded:Connect(add)
end

function setFullbright(on)
	if on then
		Lighting.Brightness = 3
		Lighting.ClockTime = 14
		Lighting.FogEnd = 1e9
		Lighting.FogStart = 0
		Lighting.GlobalShadows = false
		Lighting.OutdoorAmbient = Color3.fromRGB(200, 180, 255)
		Lighting.Ambient = Color3.fromRGB(160, 140, 220)
	else
		Lighting.Brightness = 1
		Lighting.GlobalShadows = true
		Lighting.FogEnd = 100000
	end
end

function setPurpleTint(on)
	local cc = Lighting:FindFirstChild("VOIDZ_CC")
	local bloom = Lighting:FindFirstChild("VOIDZ_Bloom")
	if not on then
		if cc then cc:Destroy() end
		if bloom then bloom:Destroy() end
		return
	end
	if not cc then cc = Instance.new(_Vzd({104,148,145,148,151,104,148,151,151,138,136,153,142,148,147,106,139,139,138,136,153})); cc.Name = "VOIDZ_CC"; cc.Parent = Lighting end
	cc.TintColor = Color3.fromRGB(200, 160, 255)
	cc.Saturation = 0.15
	cc.Contrast = 0.08
	cc.Brightness = 0.02
	if not bloom then bloom = Instance.new("BloomEffect"); bloom.Name = "VOIDZ_Bloom"; bloom.Parent = Lighting end
	bloom.Intensity = 0.4
	bloom.Size = 20
	bloom.Threshold = 0.9
end

function watchUntilDead(p, actionName, attackerFn)
	if not p then return end
	local name = p.Name
	startLoop("watch_" .. name .. actionName, 0.25, function()
		if not p.Parent then stopLoop("watch_" .. name .. actionName); return end
		if not validP(p) then
			stopLoop("watch_" .. name .. actionName)
			notify(HUB_NAME, actionName .. _Vzd({69,137,148,147,138,69,220,69}) .. name, 2)
			if actionName:lower():find("kick") or actionName:lower():find("kill") then
				notify(HUB_NAME, "Finished · " .. tostring(name), 2)
			end
			return
		end
		attackerFn(p)
	end)
end

local grabMap = {}
local heldParts = {}
local effectParts = {}
local grabWatchInstalled = false

function isValidGrabItem(part)
	if not part or not part:IsA(_Vzd({103,134,152,138,117,134,151,153})) or not part.Parent then return false end
	if part.Anchored then return false end
	local n = part.Name:lower()
	if n == "baseplate" or n == "ground" or n == "floor" or n:find("map") or n:find("wall") then
		return false
	end
	return true
end

function clearPartForces(part)
	if not part then return end
	effectParts[part] = nil
	pcall(function()
		for _, ch in ipairs(part:GetChildren()) do
			if ch:IsA("BodyVelocity") or ch:IsA("BodyForce") or ch:IsA(_Vzd({103,148,137,158,102,147,140,154,145,134,151,123,138,145,148,136,142,153,158}))
				or ch:IsA("BodyGyro") or ch:IsA("BodyPosition") then
				if ch.Name == "VOIDZ_ThrowArm" or ch.Name == "SuperStrength" then
					if ch:IsA("BodyVelocity") and ch.MaxForce.Magnitude > 1 then
						ch:Destroy()
					end
				elseif tostring(ch.Name):sub(1, 5) == "VOIDZ" or ch.Name == "ZeroGravityForce"
					or ch.Name == "FlingBV" or ch.Name == "SpinAV" or ch.Name == "GravBF"
					or ch.Name == "FreezeBP" or ch.Name == "FreezeBG" or ch.Name == _Vzd({107,148,145,145,148,156,103,117}) then
					ch:Destroy()
				end
			end
		end
	end)
end

function resolveReleaseRoot(part)
	if not part then return nil end
	local model = part:FindFirstAncestorOfClass("Model")
	if model then
		local plr = Players:GetPlayerFromCharacter(model)
		if plr then
			return rootOf(plr) or part
		end
		local hrp = model:FindFirstChild("HumanoidRootPart")
		if hrp and hrp:IsA("BasePart") then return hrp end
	end
	return part
end

function ensureThrowArm(part)
	if not part or not part:IsA("BasePart") then return nil end
	local bv = part:FindFirstChild("VOIDZ_ThrowArm")
	if bv and bv:IsA("BodyVelocity") then return bv end
	local ok, created = pcall(function()
		local b = Instance.new("BodyVelocity")
		b.Name = "VOIDZ_ThrowArm"
		b.MaxForce = Vector3.zero
		b.Velocity = Vector3.zero
		b.P = 1250
		b.Parent = part
		return b
	end)
	return ok and created or nil
end

function launchThrowArm(part, power, dir)
	if not part or not part.Parent then return end
	power = math.clamp(tonumber(power) or 2000, 200, 50000)
	dir = dir or Vector3.new(0, 0, -1)
	if dir.Magnitude < 1e-3 then dir = Vector3.new(0, 0, -1) end
	dir = dir.Unit
	local vel = dir * power + Vector3.new(0, power * 0.12, 0)
	pcall(function()
		if FTAP.SetNetworkOwner then
			local me = hrp()
			local origin = me and me.Position or (part.Position - dir * 6)
			FTAP.SetNetworkOwner:FireServer(part, lookAt(origin, part.Position))
		end
		local bv = ensureThrowArm(part)
		if not bv then
			bv = Instance.new("BodyVelocity")
			bv.Name = _Vzd({123,116,110,105,127,132,121,141,151,148,156,102,151,146})
			bv.Parent = part
		end
		bv.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
		bv.Velocity = vel
		Debris:AddItem(bv, 0.9)
		part.AssemblyLinearVelocity = vel
		part.AssemblyAngularVelocity = Vector3.new(18, 36, 12)
		local spare = part:FindFirstChild(_Vzd({107,145,142,147,140,103,123}))
		if not spare then
			spare = Instance.new("BodyVelocity")
			spare.Name = "FlingBV"
			spare.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
			spare.Velocity = vel
			spare.Parent = part
			Debris:AddItem(spare, 0.75)
		end
	end)
end

function applyReleaseEffects(part)
	if not part then return end
	local root = resolveReleaseRoot(part)
	if not root or not root.Parent then return end

	local cam = workspace.CurrentCamera
	local dir = (cam and cam.CFrame.LookVector) or Vector3.new(0, 0, -1)
	if dir.Magnitude < 1e-3 then dir = Vector3.new(0, 0, -1) end
	dir = dir.Unit

	if S._aimAtTarget then
		local target = S._aimAtTarget
		if target and target.Parent then
			local targetRoot = target:FindFirstChild("HumanoidRootPart")
				or target:FindFirstChild("Head")
				or target:FindFirstChildWhichIsA("BasePart")
			if targetRoot then
				local aimDir = (targetRoot.Position - root.Position)
				if aimDir.Magnitude > 1 then
					dir = aimDir.Unit
				end
			end
		end
		S._aimAtTarget = nil
	end

	local wantThrow = S.grabFling == true or (S.toggles and S.toggles.grabFlingOn == true)
		or S.superStrength == true or (S.toggles and S.toggles.superStr == true)
	local wantFreeze = S.grabFreeze == true or (S.toggles and S.toggles.grabFreezeOn == true)
	local wantFollow = S.grabFollow == true or (S.toggles and S.toggles.grabFollowOn == true)
	local wantGrav = S.grabGravity == true or (S.toggles and S.toggles.grabGravOn == true)
	local wantSpin = S.grabSpin == true or (S.toggles and S.toggles.grabSpinOn == true)

	if S.superStrength or (S.toggles and S.toggles.superStr) then
		local power = (tonumber(S.superStrengthPower) or 4000) * (tonumber(S.strengthMult) or 1)
		pcall(function()
			local ss = root:FindFirstChild("SuperStrength") or part:FindFirstChild("SuperStrength")
			if ss and ss:IsA("BodyVelocity") then
				ss.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
				ss.Velocity = dir * power
				Debris:AddItem(ss, 1)
			end
		end)
		launchThrowArm(root, power, dir)
		if part ~= root then launchThrowArm(part, power * 0.9, dir) end
		local model = root:FindFirstAncestorOfClass("Model")
		local plr = model and Players:GetPlayerFromCharacter(model)
		if plr then task.spawn(function() pcall(function() snoPlayer(plr, root.Position) end) end) end
		effectParts[root] = true
		notify(HUB_NAME, _Vzd({120,154,149,138,151,69,153,141,151,148,156,70}), 1)
		return
	end

	if wantThrow then
		local power = math.clamp((tonumber(S.grabFlingPower) or 80) * 40, 400, 25000)
		power = power * (tonumber(S.strengthMult) or 1)
		launchThrowArm(root, power, dir)
		if part ~= root and part.Parent then
			launchThrowArm(part, power * 0.95, dir)
		end
		local model = root:FindFirstAncestorOfClass("Model")
		local plr = model and Players:GetPlayerFromCharacter(model)
		if plr then
			task.spawn(function()
				pcall(function() snoPlayer(plr, root.Position) end)
				for _, limb in ipairs(model:GetChildren()) do
					if limb:IsA("BasePart") and limb ~= root then
						pcall(function()
							limb.AssemblyLinearVelocity = dir * power * 0.85 + Vector3.new(0, power * 0.08, 0)
						end)
					end
				end
			end)
		end
		effectParts[root] = true
		notify(HUB_NAME, "Thrown · " .. math.floor(power), 1)
	end

	if wantFreeze then
		local bp = Instance.new("BodyPosition")
		bp.Name = _Vzd({107,151,138,138,159,138,103,117})
		bp.D = 1000
		bp.P = 1e5
		bp.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
		bp.Position = root.Position
		bp.Parent = root
		Debris:AddItem(bp, 4)
		effectParts[root] = true
		return
	end

	if wantFollow then
		local bp = Instance.new("BodyPosition")
		bp.Name = _Vzd({107,148,145,145,148,156,103,117})
		bp.D = 50
		bp.P = (S.grabFollowSpeed or 50) * 20
		bp.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
		bp.Parent = root
		effectParts[root] = true
		local me = hrp()
		if me then bp.Position = me.Position - Vector3.new(0, 2, 0) end
		return
	end

	if wantGrav then
		local bf = Instance.new("BodyForce")
		bf.Name = "GravBF"
		bf.Force = Vector3.new(0, S.grabGravityForce or 5000, 0)
		bf.Parent = root
		Debris:AddItem(bf, 1.2)
		effectParts[root] = true
	end

	if wantSpin then
		local av = Instance.new("BodyAngularVelocity")
		av.Name = "SpinAV"
		av.MaxTorque = Vector3.new(math.huge, math.huge, math.huge)
		av.AngularVelocity = Vector3.new(0, S.grabSpinSpeed or 80, 0)
		av.Parent = root
		effectParts[root] = true
	end
end

function boostGrabAlign(grabModel, on)
	local drag = grabModel:FindFirstChild("DragPart", true)
		or grabModel:FindFirstChild("GrabPart", true)
	if not drag then return end
	local ap = drag:FindFirstChildOfClass("AlignPosition") or drag:FindFirstChild("AlignPosition", true)
	local ao = drag:FindFirstChildOfClass("AlignOrientation") or drag:FindFirstChild("AlignOrientation", true)
	if on then
		if ap then
			pcall(function()
				ap.Enabled = true
				ap.MaxForce = 1e51
				ap.Responsiveness = 20099
			end)
		end
		if ao then
			pcall(function()
				ao.Enabled = true
				ao.MaxTorque = 1e46
				ao.Responsiveness = 20099
			end)
		end
	end
end

local destroyPalletCage, isPalletPart, buildPalletCage, resolveGrabbedFromWeld, setPalletCage
do
local palletLocks = {}
local palletPinned = {}
local palletCageNotified = false

do local _z843=(8*8); if _z843<0 and _Vj() then _z843=_z843+1 end end

function _destroyPalletCage(key)
	if key then palletLocks[key] = nil end
end

function _isPalletPart(part)
	if not part then return false end
	local p = part
	for _ = 1, 14 do
		if not p then break end
		local n = tostring(p.Name):lower()
		if n:find(_Vzd({149,134,145,145,138,153}), 1, true) or n == "palletlightbrown" then return true end
		if p:IsA("Model") and n:find("pallet", 1, true) then return true end
		p = p.Parent
	end
	local model = part:FindFirstAncestorOfClass("Model")
	if model and model.Parent and tostring(model.Parent.Name):find("SpawnedInToys", 1, true) then
		local n = tostring(model.Name):lower()
		if n:find("pallet", 1, true) or n:find("crate", 1, true) or n:find("platform", 1, true) then
			return true
		end
		if part:IsA("BasePart") and part.Size.Y <= 2.5 and part.Size.X >= 4 and part.Size.Z >= 4 then
			return true
		end
	end
	return false
end

function resolvePalletBase(palletPart)
	if not palletPart then return nil end
	local p = palletPart
	for _ = 1, 14 do
		if not p then break end
		if p:IsA("BasePart") and tostring(p.Name):lower():find(_Vzd({149,134,145,145,138,153}), 1, true) then
			return p
		end
		p = p.Parent
	end
	local model = palletPart:FindFirstAncestorOfClass("Model") or palletPart.Parent
	local base, best = nil, -1
	if model then
		for _, d in ipairs(model:GetDescendants()) do
			if d:IsA("BasePart") then
				local n = tostring(d.Name):lower()
				local area = d.Size.X * d.Size.Z
				local score = area
				if n:find(_Vzd({149,134,145,145,138,153}), 1, true) then score = area * 10 end
				if d.Size.Y < 3 then score = score * 1.5 end
				if score > best then base, best = d, score end
			end
		end
	end
	return base or (palletPart:IsA("BasePart") and palletPart or nil)
end

function clearPalletLockForces(root)
	if not root then return end
	pcall(function()
		for _, n in ipairs({ "VOIDZ_PalletLock", _Vzd({123,116,110,105,127,132,117,134,145,145,138,153,113,148,136,144,108}), "VOIDZ_PalletBV", "VOIDZ_PalletWeld", "VOIDZ_PalletAlign" }) do
			local x = root:FindFirstChild(n)
			if x then x:Destroy() end
		end
	end)
	palletPinned[root] = nil
end

function clearAllPalletPins()
	for root in pairs(palletPinned) do
		clearPalletLockForces(root)
	end
	palletPinned = {}
end

function palletTopCFrame(base)
	local halfY = base.Size.Y * 0.5
	return base.CFrame * CFrame.new(0, halfY + 2.15, 0)
end

function rootOnPallet(root, base)
	if not root or not base then return false end
	local off = base.CFrame:PointToObjectSpace(root.Position)
	local hx = math.max(base.Size.X, base.Size.Z) * 0.5 + 6
	local hz = hx
	local hy = base.Size.Y * 0.5
	local top = palletTopCFrame(base).Position
	local flat = Vector3.new(root.Position.X - top.X, 0, root.Position.Z - top.Z).Magnitude
	local yDiff = root.Position.Y - top.Y
	if flat <= hx + 2 and yDiff > -6 and yDiff < 16 then
		return true
	end
	return math.abs(off.X) <= hx
		and math.abs(off.Z) <= hz
		and off.Y > (hy - 6)
		and off.Y < (hy + 16)
end

function pinRootToPalletCenter(root, base, plr)
	if not root or not base or not root.Parent or not base.Parent then return end
	local top = palletTopCFrame(base)
	if plr then
		pcall(function() snoPlayer(plr, base.Position) end)
	end
	pcall(function() sno(root, base.Position) end)
	if FTAP.CreateGrabLine then
		pcall(function() FTAP.CreateGrabLine:FireServer(root, root.CFrame) end)
	end
	pcall(function()
		local hum = root.Parent and root.Parent:FindFirstChildOfClass("Humanoid")
		if hum then
			hum.PlatformStand = true
			hum.Sit = false
			hum.Jump = false
		end
		root.AssemblyLinearVelocity = Vector3.zero
		root.AssemblyAngularVelocity = Vector3.zero
		local owned = hasNetOwner(root)
		if owned then
			root.CFrame = top
		end
		local bp = root:FindFirstChild("VOIDZ_PalletLock")
		if not bp then
			bp = Instance.new("BodyPosition")
			bp.Name = "VOIDZ_PalletLock"
			bp.MaxForce = Vector3.new(1e9, 1e9, 1e9)
			bp.P = 2e5
			bp.D = 3000
			bp.Parent = root
		end
		bp.Position = top.Position
		local bg = root:FindFirstChild("VOIDZ_PalletLockG")
		if not bg then
			bg = Instance.new("BodyGyro")
			bg.Name = "VOIDZ_PalletLockG"
			bg.MaxTorque = Vector3.new(1e9, 1e9, 1e9)
			bg.P = 1e5
			bg.D = 800
			bg.Parent = root
		end
		bg.CFrame = top
		local bv = root:FindFirstChild("VOIDZ_PalletBV")
		if not bv then
			bv = Instance.new("BodyVelocity")
			bv.Name = "VOIDZ_PalletBV"
			bv.MaxForce = Vector3.new(1e9, 1e9, 1e9)
			bv.Parent = root
		end
		bv.Velocity = Vector3.zero
	end)
	palletPinned[root] = true
end

do local _z489=(4*4); if _z489<0 and _Vj() then _z489=_z489+1 end end

function pinEveryoneOnPallet(base)
	if not base or not base.Parent then return end
	local still = {}

	local myR = hrp()
	if myR and rootOnPallet(myR, base) then
		local top = palletTopCFrame(base)
		pcall(function()
			myR.AssemblyLinearVelocity = Vector3.zero
			myR.AssemblyAngularVelocity = Vector3.zero
			local bp = myR:FindFirstChild("VOIDZ_PalletLock")
			if not bp then
				bp = Instance.new("BodyPosition")
				bp.Name = _Vzd({123,116,110,105,127,132,117,134,145,145,138,153,113,148,136,144})
				bp.MaxForce = Vector3.new(1e9, 1e9, 1e9)
				bp.P = 2e5
				bp.D = 3000
				bp.Parent = myR
			end
			bp.Position = top.Position
			local bv = myR:FindFirstChild("VOIDZ_PalletBV")
			if not bv then
				bv = Instance.new("BodyVelocity")
				bv.Name = _Vzd({123,116,110,105,127,132,117,134,145,145,138,153,103,123})
				bv.MaxForce = Vector3.new(1e9, 1e9, 1e9)
				bv.Parent = myR
			end
			bv.Velocity = Vector3.zero
		end)
		still[myR] = true
	end

	for _, plr in ipairs(Players:GetPlayers()) do
		if plr ~= LP and not isWL(plr) then
			local r = rootOf(plr)
			if r and rootOnPallet(r, base) then
				pinRootToPalletCenter(r, base, plr)
				still[r] = true
			end
		end
	end
	pcall(function()
		for _, m in ipairs(workspace:GetChildren()) do
			if m:IsA("Model") and not Players:GetPlayerFromCharacter(m) then
				local hum = m:FindFirstChildOfClass("Humanoid")
				local r = m:FindFirstChild("HumanoidRootPart") or m:FindFirstChild("Torso")
				if hum and r and r:IsA("BasePart") and rootOnPallet(r, base) then
					pinRootToPalletCenter(r, base, nil)
					still[r] = true
				end
			end
		end
	end)
	for root in pairs(palletPinned) do
		if not still[root] then
			local hum = root.Parent and root.Parent:FindFirstChildOfClass("Humanoid")
			if hum then pcall(function() hum.PlatformStand = false end) end
			clearPalletLockForces(root)
		end
	end
end

function _resolveGrabbedFromWeld(weld, grabPart)
	if not weld then return nil end
	local p0, p1 = weld.Part0, weld.Part1
	if grabPart then
		if p0 == grabPart then return p1 end
		if p1 == grabPart then return p0 end
		if p0 and p0:IsDescendantOf(grabPart) then return p1 end
		if p1 and p1:IsDescendantOf(grabPart) then return p0 end
	end
	return p1 or p0
end

function getHeldPalletBase()
	for grabModel, part in pairs(grabMap) do
		if grabModel and grabModel.Parent and part and part.Parent and isPalletPart(part) then
			local base = resolvePalletBase(part)
			if base then return base, grabModel, part end
		end
	end
	for _, ch in ipairs(workspace:GetChildren()) do
		if ch.Name == "GrabParts" then
			local gp = ch:FindFirstChild("GrabPart")
			local weld = gp and (gp:FindFirstChildOfClass("WeldConstraint") or gp:FindFirstChild("WeldConstraint"))
			local grabbed = resolveGrabbedFromWeld(weld, gp)
			if grabbed and isPalletPart(grabbed) then
				grabMap[ch] = grabbed
				local base = resolvePalletBase(grabbed)
				if base then return base, ch, grabbed end
			end
		end
	end
	return nil
end

function _buildPalletCage(palletPart, grabModel)
	if not palletPart or not grabModel then return end
	if palletLocks[grabModel] then return end
	local base = resolvePalletBase(palletPart)
	if not base then return end
	palletLocks[grabModel] = true
	if not palletCageNotified then
		palletCageNotified = true
		notify(HUB_NAME, _Vzd({117,134,145,145,138,153,69,145,148,136,144,69,220,69,149,138,148,149,145,138,69,152,153,142,136,144,69,153,148,69,136,138,147,153,138,151,69,156,141,142,145,138,69,158,148,154,69,141,148,145,137}), 2)
		task.delay(3, function() palletCageNotified = false end)
	end
end

function tickPalletCage()
	if not S.toggles.palletCage then
		if next(palletPinned) then clearAllPalletPins() end
		return
	end
	local base = getHeldPalletBase()
	if not base then
		if next(palletPinned) then clearAllPalletPins() end
		return
	end
	pcall(function()
		sno(base)
		for _, d in ipairs(base:GetDescendants()) do
			if d:IsA("BasePart") then sno(d) end
		end
		local model = base:FindFirstAncestorOfClass("Model")
		if model then
			for _, d in ipairs(model:GetDescendants()) do
				if d:IsA("BasePart") then sno(d) end
			end
		end
	end)
	pinEveryoneOnPallet(base)
end

function _setPalletCage(on)
	S.toggles.palletCage = on == true
	stopLoop("palletCage")
	if not on then
		for k in pairs(palletLocks) do palletLocks[k] = nil end
		clearAllPalletPins()
		notify(HUB_NAME, _Vzd({117,134,145,145,138,153,69,145,148,136,144,69,116,107,107}), 1)
		return
	end
	installGrabWatch()
	startLoop("palletCage", 0.03, tickPalletCage)
	notify(HUB_NAME, "Pallet lock ON · hold a pallet", 1.5)
end
	destroyPalletCage = _destroyPalletCage
	isPalletPart = _isPalletPart
	buildPalletCage = _buildPalletCage
	resolveGrabbedFromWeld = _resolveGrabbedFromWeld
	setPalletCage = _setPalletCage
end

function onGrabPartsAdded(child)
	if child.Name ~= "GrabParts" then return end
	task.spawn(function()
		local gp, weld, grabbed
		local ok = pcall(function()
			gp = child:WaitForChild("GrabPart", 3)
			if not gp then return end
			for _ = 1, 30 do
				weld = gp:FindFirstChildOfClass("WeldConstraint") or gp:FindFirstChild("WeldConstraint")
				if weld and (weld.Part0 or weld.Part1) then break end
				task.wait(0.05)
			end
			if not weld then
				weld = gp:WaitForChild("WeldConstraint", 2)
			end
			grabbed = resolveGrabbedFromWeld(weld, gp)
		end)
		if not ok or not grabbed then return end
		if not grabbed:IsA("BasePart") then return end
		local myChar = char()
		if myChar and grabbed:IsDescendantOf(myChar) then return end

		grabMap[child] = grabbed
		heldParts[grabbed] = true
		local model = grabbed:FindFirstAncestorOfClass("Model") or grabbed.Parent
		local targetHum = model and model:FindFirstChildOfClass("Humanoid")
		local targetPlr = model and Players:GetPlayerFromCharacter(model)
		local targetRoot = targetPlr and rootOf(targetPlr) or grabbed
		local releaseRoot = resolveReleaseRoot(grabbed)
		local collideRestore = {}
		local released = false
		local function doRelease()
			if released then return end
			released = true
			destroyPalletCage(child)
			local part = grabMap[child] or grabbed
			grabMap[child] = nil
			if part then
				heldParts[part] = nil
			end
			for d, v in pairs(collideRestore) do
				if d.Parent then pcall(function() d.CanCollide = v end) end
			end
			if part then
				pcall(function() applyReleaseEffects(part) end)
				task.defer(function()
					local r = resolveReleaseRoot(part) or part
					local arm = r and r:FindFirstChild(_Vzd({123,116,110,105,127,132,121,141,151,148,156,102,151,146}))
					if arm and arm:IsA("BodyVelocity") and arm.MaxForce.Magnitude < 1 then
						pcall(function() applyReleaseEffects(part) end)
					end
				end)
			end
		end

		if targetPlr then
			grabMap[child .. "_targetPlr"] = targetPlr
			grabMap[child .. "_targetRoot"] = targetRoot
		end

		task.spawn(function()
			while child.Parent and not released do
				if S.toggles.palletCage then
					local part = grabMap[child] or grabbed
					if (not part or not isPalletPart(part)) and child:FindFirstChild("GrabPart") then
						local gpx = child:FindFirstChild("GrabPart")
						local w = gpx and (gpx:FindFirstChildOfClass("WeldConstraint") or gpx:FindFirstChild("WeldConstraint"))
						local alt = resolveGrabbedFromWeld(w, gpx)
						if alt and isPalletPart(alt) then
							part = alt
							grabMap[child] = alt
							grabbed = alt
						end
					end
					if part and isPalletPart(part) then
						buildPalletCage(part, child)
					end
				end
				if (S.toggles.palletSilentAim or S.toggles.shurikenSilentAim) and not released then
					local part = grabMap[child] or grabbed
					local isPallet = part and isPalletPart(part)
					local isShuriken = part and part.Parent and (
						tostring(part.Name):lower():find("shuriken", 1, true)
						or tostring(part.Name):lower():find("kunai", 1, true)
						or (part:FindFirstAncestorOfClass("Model") and tostring(part:FindFirstAncestorOfClass("Model").Name):lower():find("shuriken", 1, true))
						or (part:FindFirstAncestorOfClass("Model") and tostring(part:FindFirstAncestorOfClass("Model").Name):lower():find("kunai", 1, true))
					)
					if (isPallet and S.toggles.palletSilentAim) or (isShuriken and S.toggles.shurikenSilentAim) then
						local me = hrp()
						if me then
							local best, bd = nil, 120
							for _, p in ipairs(Players:GetPlayers()) do
								if validP(p) then
									local r = rootOf(p)
									if r then
										local d = (r.Position - me.Position).Magnitude
										if d < bd then best, bd = p, d end
									end
								end
							end
							if best then
								S._aimAtTarget = best.Character
							end
						end
					end
				end
				task.wait(0.15)
			end
		end)

		local function armIfNeeded()
			local want = S.grabFling or (S.toggles and S.toggles.grabFlingOn)
				or S.superStrength or (S.toggles and S.toggles.superStr)
			if not want then return end
			if releaseRoot then ensureThrowArm(releaseRoot) end
			ensureThrowArm(grabbed)
		end
		armIfNeeded()
		task.spawn(function()
			while child.Parent and not released do
				armIfNeeded()
				task.wait(0.2)
			end
		end)

		if S.toggles.invisLine and FTAP.CreateGrabLine and not S.toggles.crazyLine then
			pcall(function() FTAP.CreateGrabLine:FireServer() end)
			task.defer(function()
				if S.toggles.invisLine and FTAP.CreateGrabLine then
					pcall(function() FTAP.CreateGrabLine:FireServer() end)
				end
			end)
		end
		if S.toggles.invisLine then
			task.spawn(function()
				while child.Parent and not released and S.toggles.invisLine do
					for _, d in ipairs(child:GetDescendants()) do
						if d:IsA("Beam") then
							pcall(function()
								d.Enabled = false
								d.Transparency = NumberSequence.new(1)
							end)
						end
					end
					task.wait(0.15)
				end
			end)
		end

		if S.superStrength or (S.toggles and S.toggles.superStr) then
			pcall(function()
				local target = releaseRoot or grabbed
				local old = target:FindFirstChild("SuperStrength")
				if old then old:Destroy() end
				local bv = Instance.new("BodyVelocity")
				bv.Name = _Vzd({120,154,149,138,151,120,153,151,138,147,140,153,141})
				bv.MaxForce = Vector3.zero
				bv.Velocity = Vector3.zero
				bv.Parent = target
			end)
		end

		if S.anchorGrab or S.toggles.anchorGrab then
			task.spawn(function()
				local bp = Instance.new("BodyPosition")
				bp.Name = "VOIDZ_AnchorLock"
				bp.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
				bp.P = 100000
				bp.D = 5000
				bp.Position = grabbed.Position
				bp.Parent = grabbed
				while child.Parent and (S.anchorGrab or S.toggles.anchorGrab) do
					pcall(function()
						sno(grabbed, grabbed.Position)
						bp.Position = grabbed.Position
						grabbed.AssemblyLinearVelocity = Vector3.zero
						grabbed.AssemblyAngularVelocity = Vector3.zero
					end)
					task.wait()
				end
				pcall(function() bp:Destroy() end)
			end)
		end

		if S.masslessGrab or S.toggles.masslessGrab then
			task.spawn(function()
				while child.Parent and (S.masslessGrab or S.toggles.masslessGrab) do
					boostGrabAlign(child, true)
					task.wait(0.2)
				end
			end)
		end

		if (S.radioactiveGrab or S.toggles.radioactiveGrab) and targetRoot then
			task.spawn(function()
				while child.Parent and (S.radioactiveGrab or S.toggles.radioactiveGrab) do
					applyMapPaint(targetRoot)
					task.wait(0.15)
				end
			end)
		end

		if (S.noclipGrab or S.toggles.noclipGrab) and model then
			task.spawn(function()
				for _, d in ipairs(model:GetDescendants()) do
					if d:IsA("BasePart") then
						collideRestore[d] = d.CanCollide
						d.CanCollide = false
					end
				end
				while child.Parent and (S.noclipGrab or S.toggles.noclipGrab) do
					for d, _ in pairs(collideRestore) do
						if d.Parent then d.CanCollide = false end
					end
					task.wait(0.1)
				end
				for d, v in pairs(collideRestore) do
					if d.Parent then pcall(function() d.CanCollide = v end) end
				end
			end)
		end

		if (S.killGrab or S.toggles.killGrab) and targetHum then
			task.spawn(function()
				while child.Parent and (S.killGrab or S.toggles.killGrab) do
					if targetPlr then snoPlayer(targetPlr, grabbed.Position) end
					pcall(function()
						targetHum.BreakJointsOnDeath = false
						targetHum:ChangeState(Enum.HumanoidStateType.Dead)
						targetHum.Jump = true
						targetHum.Sit = false
					end)
					if targetPlr then
						pcall(function()
							if hasNetOwner(grabbed) and targetHum:GetStateEnabled(Enum.HumanoidStateType.Dead) then
								if FTAP.DestroyGrabLine then
									FTAP.DestroyGrabLine:FireServer(grabbed)
								end
							end
						end)
					end
					task.wait()
				end
			end)
		end

		if (S.ragdollGrab or S.toggles.ragdollGrab) and targetPlr then
			task.spawn(function()
				ragdollInstant(targetPlr)
				while child.Parent and (S.ragdollGrab or S.toggles.ragdollGrab) do
					ragdollInstant(targetPlr)
					task.wait(0.08)
				end
			end)
		end

		if (S.poisonGrab or S.toggles.poisonGrab) and targetRoot then
			task.spawn(function()
				while child.Parent and (S.poisonGrab or S.toggles.poisonGrab) do
					if targetRoot then
						applyMapPoison(targetRoot)
					end
					task.wait(0.1)
				end
			end)
		end

		if (S.burnGrab or S.toggles.burnGrab) and grabbed then
			task.spawn(function()
				getStatusToy("Campfire")
				task.wait(0.3)
				while child.Parent and (S.burnGrab or S.toggles.burnGrab) do
					local r = targetPlr and rootOf(targetPlr) or grabbed
					if r then
						applyStatusToPlayer("fire", targetPlr)
					end
					task.wait(0.1)
				end
			end)
		end

		if S.grabZeroG then
			clearPartForces(grabbed)
			local bf = Instance.new("BodyForce")
			bf.Name = _Vzd({127,138,151,148,108,151,134,155,142,153,158,107,148,151,136,138})
			bf.Force = Vector3.new(0, S.grabZeroGForce or 50000, 0)
			bf.Parent = grabbed
		end

		if S.grabSpin and S.toggles.spinWhileHold then
			local av = Instance.new("BodyAngularVelocity")
			av.Name = "SpinAV"
			av.MaxTorque = Vector3.new(math.huge, math.huge, math.huge)
			av.AngularVelocity = Vector3.new(0, S.grabSpinSpeed or 80, 0)
			av.Parent = grabbed
		end

		pcall(function()
			child:GetPropertyChangedSignal("Parent"):Connect(function()
				if not child.Parent then doRelease() end
			end)
		end)
		child.AncestryChanged:Connect(function(_, parent)
			if parent == nil or not child:IsDescendantOf(workspace) then
				doRelease()
			end
		end)
		pcall(function()
			child.Destroying:Connect(function()
				doRelease()
			end)
		end)
		if weld then
			pcall(function()
				weld:GetPropertyChangedSignal("Part1"):Connect(function()
					if weld.Part1 == nil then doRelease() end
				end)
			end)
			pcall(function()
				weld.AncestryChanged:Connect(function(_, parent)
					if parent == nil then doRelease() end
				end)
			end)
		end
		task.spawn(function()
			while child.Parent and not released do
				task.wait(0.05)
			end
			doRelease()
		end)
	end)
end

function installGrabWatch()
	if grabWatchInstalled then return end
	grabWatchInstalled = true
	workspace.ChildAdded:Connect(onGrabPartsAdded)
	workspace.ChildRemoved:Connect(function(ch)
		if ch.Name == "GrabParts" and grabMap[ch] then
			local part = grabMap[ch]
			grabMap[ch] = nil
			if part then
				heldParts[part] = nil
				task.defer(function()
					pcall(function() applyReleaseEffects(part) end)
				end)
			end
		end
	end)
	for _, ch in ipairs(workspace:GetChildren()) do
		if ch.Name == "GrabParts" then onGrabPartsAdded(ch) end
	end
	bind("grabFollowHB", RunService.Heartbeat:Connect(function()
		if not S.grabFollow then return end
		local me = hrp()
		if not me then return end
		local foot = me.Position - Vector3.new(0, 2.5, 0)
		for part, _ in pairs(effectParts) do
			if part and part.Parent then
				local bp = part:FindFirstChild(_Vzd({107,148,145,145,148,156,103,117}))
				if bp and bp:IsA("BodyPosition") then
					bp.Position = foot
					bp.P = (S.grabFollowSpeed or 50) * 20
				end
			else
				effectParts[part] = nil
			end
		end
	end))
	print("[VOIDZ] grab-release watch installed")
end

function counterAttackPlayer(plr, part)
	if not plr or not validP(plr) then return end
	local mode = S.counterMode or "Repulsion"
	local force = (tonumber(S.revengeForce) or 12000) * (tonumber(S.strengthMult) or 1)
	local r = rootOf(plr) or part
	if not r then return end
	local me = hrp()
	if not me then return end

	sno(r, r.Position)
	snoPlayer(plr, r.Position)

	pcall(function()
		if mode == "Freeze" then
			local hum = plr.Character and plr.Character:FindFirstChildOfClass("Humanoid")
			if hum then
				hum.WalkSpeed = 0
				hum.JumpPower = 0
				hum.Sit = false
			end
			createBringBody(r, r.CFrame)
			r.AssemblyLinearVelocity = Vector3.zero
		elseif mode == "Death" then
			skyVel(r)
			destroyGrabOn(r)
			local hum = plr.Character and plr.Character:FindFirstChildOfClass("Humanoid")
			if hum then
				hum.BreakJointsOnDeath = false
				hum:ChangeState(Enum.HumanoidStateType.Dead)
				hum.Jump = true
				hum.Sit = true
			end
		elseif mode == "Kick" then
			skyVel(r)
			destroyGrabOn(r)
			applyVel(r, force, 0.1)
		else
			local look = lookAt(me.Position, r.Position)
			local vel = Vector3.new(look.LookVector.X, 0.5, look.LookVector.Z) * math.clamp(force / 100, 80, 300)
			local bv = Instance.new("BodyVelocity")
			bv.Name = _Vzd({123,116,110,105,127,132,104,148,154,147,153,138,151})
			bv.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
			bv.Velocity = vel
			bv.Parent = r
			Debris:AddItem(bv, 0.3)
			r.AssemblyLinearVelocity = vel
		end
		if FTAP.DestroyGrabLine then
			pcall(function() FTAP.DestroyGrabLine:FireServer(r) end)
		end
		destroyGrabOn(r)
	end)
end

function revengeFromGrabParts(grabModel)
	if not (S.revengeGrab or S.toggles.revengeGrab or S.autoCounter or S.toggles.autoCounter) then
		return
	end
	local c = char()
	if not c or not grabModel then return end
	local attackers = {}
	for _, d in ipairs(grabModel:GetDescendants()) do
		if d:IsA("WeldConstraint") or d:IsA("Weld") then
			for _, side in ipairs({ d.Part0, d.Part1 }) do
				if side and side:IsA("BasePart") and not side:IsDescendantOf(c) then
					local m = side:FindFirstAncestorOfClass("Model")
					local plr = m and Players:GetPlayerFromCharacter(m)
					if plr and plr ~= LP and validP(plr) then
						attackers[plr] = side
					end
				end
			end
		end
	end
	for plr, part in pairs(attackers) do
		task.spawn(counterAttackPlayer, plr, part)
	end
end

doAntiGrabHard = function()
	local c = char()
	if not c then return end
	local r = hrp()
	local h = hum()

	if FTAP.Struggle then
		for _ = 1, 4 do
			pcall(function() FTAP.Struggle:FireServer(LP) end)
			pcall(function() FTAP.Struggle:FireServer() end)
		end
	end
	if FTAP.StopAllVelocity then pcall(function() FTAP.StopAllVelocity:FireServer() end) end
	if r and FTAP.RagdollRemote then
		pcall(function() FTAP.RagdollRemote:FireServer(r, 0) end)
	end
	if r and FTAP.DestroyGrabLine then
		pcall(function() FTAP.DestroyGrabLine:FireServer(r) end)
		for _, part in ipairs(c:GetDescendants()) do
			if part:IsA(_Vzd({103,134,152,138,117,134,151,153})) then
				pcall(function() FTAP.DestroyGrabLine:FireServer(part) end)
			end
		end
	end

	for _, child in ipairs(workspace:GetChildren()) do
		if child.Name == "GrabParts" and grabPartsIsAttackingUs(child, c) then
			if revengeFromGrabParts then pcall(revengeFromGrabParts, child) end
			for _, d in ipairs(child:GetDescendants()) do
				if d:IsA(_Vzd({124,138,145,137,104,148,147,152,153,151,134,142,147,153})) or d:IsA("Weld") or d:IsA("AlignPosition") or d:IsA(_Vzd({102,145,142,140,147,116,151,142,138,147,153,134,153,142,148,147})) then
					pcall(function() d:Destroy() end)
				end
			end
			pcall(function() child:Destroy() end)
		end
	end

	gucciStripForeignConstraints(c)
	gucciReclaimSelf()
	if h then
		pcall(function()
			h.PlatformStand = false
			h.Sit = false
			h.AutoRotate = true
			h:SetStateEnabled(Enum.HumanoidStateType.Jumping, true)
			h:SetStateEnabled(Enum.HumanoidStateType.Running, true)
			h:SetStateEnabled(Enum.HumanoidStateType.FallingDown, false)
			h:SetStateEnabled(Enum.HumanoidStateType.Ragdoll, false)
			h:SetStateEnabled(Enum.HumanoidStateType.Physics, false)
			local st = h:GetState()
			if st == Enum.HumanoidStateType.Physics or st == Enum.HumanoidStateType.Ragdoll
				or st == Enum.HumanoidStateType.FallingDown or st == Enum.HumanoidStateType.Seated then
				h:ChangeState(Enum.HumanoidStateType.Running)
			end
		end)
	end

	if r then
		pcall(function() r.Anchored = false end)
		for _, d in ipairs(r:GetChildren()) do
			if (d:IsA("BodyVelocity") or d:IsA("BodyAngularVelocity") or d:IsA("BodyForce"))
				and d.Name ~= _Vzd({123,116,110,105,127,132,107,145,158}) and d.Name ~= "VOIDZ_FlyG"
				and d.Name ~= "VOIDZ_GucciBV" and d.Name ~= "BringBody" then
				pcall(function() d:Destroy() end)
			end
		end
	end
	gucciForceFreeMove()
end

antiGrabTick = function()
	if S.toggles.antiGucci or S.toggles.antiGrab then
		gucciAntiTick()
	end
end

bind("antiGrabChild", workspace.ChildAdded:Connect(function(child)
	if not (S.toggles.antiGrab or S.toggles.antiGucci) then return end
	if child.Name ~= "GrabParts" then return end
	local function burst()
		if not (S.toggles.antiGrab or S.toggles.antiGucci) then return end
		local c = char()
		if c and grabPartsIsAttackingUs(child, c) then
			gucciBreakGrabNow()
			if doAntiGrabHard then doAntiGrabHard() end
		end
	end
	burst()
	task.defer(burst)
	task.delay(0.03, burst)
	task.delay(0.08, burst)
	task.delay(0.15, burst)
	child.DescendantAdded:Connect(function()
		if S.toggles.antiGrab or S.toggles.antiGucci then burst() end
	end)
end))

function isLocalVictimGrabbed()
	local held = LP:FindFirstChild("IsHeld")
	if held and held.Value == true then return true end
	local c = char()
	if not c then return false end
	if grabPartsIsAttackingUs then
		for _, ch in ipairs(workspace:GetChildren()) do
			if ch.Name == "GrabParts" and grabPartsIsAttackingUs(ch, c) then
				return true
			end
		end
	end
	for _, d in ipairs(c:GetDescendants()) do
		if d:IsA("WeldConstraint") or d:IsA("Weld") then
			local p0, p1 = d.Part0, d.Part1
			local other = nil
			if p0 and p0:IsDescendantOf(c) and p1 and not p1:IsDescendantOf(c) then other = p1 end
			if p1 and p1:IsDescendantOf(c) and p0 and not p0:IsDescendantOf(c) then other = p0 end
			if other then
				local gp = nil
				local cur = other
				for _ = 1, 10 do
					if not cur then break end
					if cur.Name == "GrabParts" then gp = cur break end
					cur = cur.Parent
				end
				if gp then return true end
			end
		end
	end
	return false
end

function freeFromGrabInstant()
	resolveFTAP()
	local c = char()
	local r = hrp()
	local h = hum()
	if not c or not r then return end

	for _ = 1, 6 do
		if FTAP.Struggle then
			pcall(function() FTAP.Struggle:FireServer(LP) end)
			pcall(function() FTAP.Struggle:FireServer() end)
		end
	end
	if FTAP.StopAllVelocity then
		pcall(function() FTAP.StopAllVelocity:FireServer() end)
	end
	if FTAP.RagdollRemote then
		pcall(function() FTAP.RagdollRemote:FireServer(r, 0) end)
	end

	if FTAP.DestroyGrabLine then
		pcall(function() FTAP.DestroyGrabLine:FireServer(r) end)
		for _, part in ipairs(c:GetDescendants()) do
			if part:IsA("BasePart") then
				pcall(function() FTAP.DestroyGrabLine:FireServer(part) end)
			end
		end
	end

	for _, child in ipairs(workspace:GetChildren()) do
		if child.Name == "GrabParts" then
			local attacking = grabPartsIsAttackingUs and grabPartsIsAttackingUs(child, c)
			if attacking then
				for _, d in ipairs(child:GetDescendants()) do
					if d:IsA(_Vzd({124,138,145,137,104,148,147,152,153,151,134,142,147,153})) or d:IsA("Weld") or d:IsA("Motor6D") then
						pcall(function() d:Destroy() end)
					end
				end
				pcall(function() child:Destroy() end)
			end
		end
	end

	pcall(function()
		r.Anchored = false
		for _, part in ipairs(c:GetDescendants()) do
			if part:IsA(_Vzd({103,134,152,138,117,134,151,153})) then
				for _, ch in ipairs(part:GetChildren()) do
					if ch:IsA("BodyVelocity") or ch:IsA("BodyPosition") or ch:IsA("BodyForce")
						or ch:IsA("BodyAngularVelocity") or ch:IsA("AlignPosition") or ch:IsA("AlignOrientation")
						or ch:IsA("LinearVelocity") or ch:IsA("VectorForce") then
						local n = ch.Name
						if n ~= "VOIDZ_Fly" and n ~= "VOIDZ_FlyG" then
							pcall(function() ch:Destroy() end)
						end
					end
					if ch:IsA("WeldConstraint") or ch:IsA("Weld") then
						local o = ch.Part0
						local o2 = ch.Part1
						local foreign = (o and not o:IsDescendantOf(c)) or (o2 and not o2:IsDescendantOf(c))
						if foreign then pcall(function() ch:Destroy() end) end
					end
				end
			end
		end
	end)

	restoreGroundPhysics()

	task.spawn(function()
		local t0 = tick()
		while tick() - t0 < 0.45 do
			if FTAP.Struggle then
				pcall(function() FTAP.Struggle:FireServer(LP) end)
				pcall(function() FTAP.Struggle:FireServer() end)
			end
			local rr = hrp()
			if rr then
				pcall(function()
					rr.Anchored = false
					local v = rr.AssemblyLinearVelocity
					if v.Y > 5 then
						rr.AssemblyLinearVelocity = Vector3.new(v.X, 5, v.Z)
					end
				end)
			end
			if FTAP.DestroyGrabLine and rr then
				pcall(function() FTAP.DestroyGrabLine:FireServer(rr) end)
			end
			if not isLocalVictimGrabbed() then break end
			RunService.Heartbeat:Wait()
		end
		restoreGroundPhysics()
	end)

	if doAntiGrabHard then pcall(doAntiGrabHard) end
	task.defer(restoreGroundPhysics)
	task.delay(0.1, restoreGroundPhysics)
	task.delay(0.35, restoreGroundPhysics)
end

function installInstantEscape()
	if S.conns.escapeJump then pcall(function() S.conns.escapeJump:Disconnect() end) S.conns.escapeJump = nil end
	if S.conns.escapeInput then pcall(function() S.conns.escapeInput:Disconnect() end) S.conns.escapeInput = nil end
	pcall(function() ContextActionService:UnbindAction("VOIDZ_InstantEscape") end)

	S.escapeSpace = S.escapeSpace ~= false
	S.toggles.escapeSpace = S.escapeSpace

	local lastEscape = 0
	local function tryEscape()
		if S.escapeSpace == false and S.toggles.escapeSpace ~= true then return end
		if tick() - lastEscape < 0.12 then return end
		if not isLocalVictimGrabbed() then return end
		lastEscape = tick()
		freeFromGrabInstant()
		notify(HUB_NAME, _Vzd({106,152,136,134,149,138,70}), 0.8)
	end

	S.conns.escapeJump = UserInputService.JumpRequest:Connect(function()
		tryEscape()
	end)
	S.conns.escapeInput = UserInputService.InputBegan:Connect(function(input, _gp)
		if input.KeyCode == Enum.KeyCode.Space
			or input.KeyCode == Enum.KeyCode.ButtonA
			or input.KeyCode == Enum.KeyCode.ButtonX then
			tryEscape()
		end
	end)
	pcall(function()
		ContextActionService:BindActionAtPriority(
			_Vzd({123,116,110,105,127,132,110,147,152,153,134,147,153,106,152,136,134,149,138}),
			function(_, state)
				if state == Enum.UserInputState.Begin then
					tryEscape()
				end
				return Enum.ContextActionResult.Pass
			end,
			false,
			Enum.ContextActionPriority.High.Value + 100,
			Enum.KeyCode.Space,
			Enum.KeyCode.ButtonA
		)
	end)

	task.spawn(function()
		local isHeld = LP:FindFirstChild("IsHeld") or LP:WaitForChild("IsHeld", 20)
		if not isHeld then return end
		if S.conns.escapeHeld then pcall(function() S.conns.escapeHeld:Disconnect() end) end
		S.conns.escapeHeld = isHeld.Changed:Connect(function(v)
			if v == true and (S.escapeSpace ~= false) then
				notify(HUB_NAME, "Grabbed · Space to escape", 1.5)
			end
		end)
	end)
end

local reachGamepassState = {}
local grabSenvCache = nil
local pcDistance = 0
S.extendAmount = S.extendAmount or 25
S.scrollStep = S.scrollStep or 2

function getGrabbingScript()
	local c = LP.Character
	if c then
		local gs = c:FindFirstChild("GrabbingScript") or c:FindFirstChild("GrabbingScript", true)
		if gs then return gs end
	end
	if c then
		local ok, gs = pcall(function() return c:WaitForChild(_Vzd({108,151,134,135,135,142,147,140,120,136,151,142,149,153}), 2) end)
		if ok and gs then return gs end
	end
	local ps = LP:FindFirstChild("PlayerScripts")
	if ps then
		for _, n in ipairs({ "GrabbingScript", "CharacterAndBeamMove", "CharacterAndBeam", "BeamMove" }) do
			local s = ps:FindFirstChild(n, true)
			if s then return s end
		end
	end
	return nil
end

do local _z958=(4*4); if _z958<0 and _Vj() then _z958=_z958+1 end end

function refreshGrabSenv(force)
	if not getsenv then return nil end
	if grabSenvCache and not force then
		local scr = getGrabbingScript()
		if scr then
			local ok, env = pcall(getsenv, scr)
			if ok and type(env) == "table" then
				grabSenvCache = env
				return env
			end
		end
		return grabSenvCache
	end
	local scr = getGrabbingScript()
	if not scr then
		grabSenvCache = nil
		return nil
	end
	local ok, env = pcall(getsenv, scr)
	if ok and type(env) == _Vzd({153,134,135,145,138}) then
		grabSenvCache = env
		return env
	end
	return nil
end

function forceGrabDistance(amount)
	amount = math.clamp(tonumber(amount) or S.extendAmount or 25, 3, 120)
	S.extendAmount = amount
	local env = refreshGrabSenv(true)
	if not env then return false end
	pcall(function()
		env.distance = amount
		if type(env.maxDistance) == "number" then env.maxDistance = math.max(amount, env.maxDistance) end
		if type(env.MaxDistance) == "number" then env.MaxDistance = math.max(amount, env.MaxDistance) end
		if type(env.grabDistance) == "number" then env.grabDistance = amount end
		if type(env.lineDistance) == "number" then env.lineDistance = amount end
		if type(env.minDistance) == _Vzd({147,154,146,135,138,151}) then env.minDistance = math.min(env.minDistance, 3) end
		for k, v in pairs(env) do
			if type(k) == "string" and type(v) == "number" then
				local lk = k:lower()
				if lk == "distance" or lk == "grabdistance" or lk == "linedistance"
					or lk == "maxdistance" or lk == "reach" or lk == "range" then
					env[k] = amount
				end
			end
		end
	end)
	return true
end

function enableFurtherReachGamepass()
	pcall(function()
		local old = LP:FindFirstChild("FartherReach")
		if old and not (old:IsA("BoolValue") or old:IsA("NumberValue") or old:IsA("IntValue")) then
			old:Destroy()
			old = nil
		end
		if not old then
			local bv = Instance.new("BoolValue")
			bv.Name = "FartherReach"
			bv.Value = true
			bv.Parent = LP
		elseif old:IsA("BoolValue") then
			old.Value = true
		else
			old.Value = math.max(tonumber(old.Value) or 0, S.extendAmount or 25)
		end
		for _, name in ipairs({ "DefaultReach", "CurrentReach" }) do
			local nv = LP:FindFirstChild(name)
			if not nv then
				nv = Instance.new("NumberValue")
				nv.Name = name
				nv.Parent = LP
			end
			if nv:IsA("NumberValue") or nv:IsA("IntValue") then
				nv.Value = math.clamp(S.extendAmount or 25, 3, 120)
			end
		end
		local ps = LP:FindFirstChild("PlayerScripts")
		if ps then
			local beam = ps:FindFirstChild("CharacterAndBeamMove") or ps:FindFirstChild("CharacterAndBeamMove", true)
			if beam and beam.Disabled and not S.toggles.antiLag then
				beam.Disabled = false
			end
		end
	end)
end

function disableFurtherReachGamepass()
	pcall(function()
		local fr = LP:FindFirstChild("FartherReach")
		if fr and fr:IsA(_Vzd({103,148,148,145,123,134,145,154,138})) then fr:Destroy() end
		reachGamepassState = {}
		grabSenvCache = nil
		pcDistance = 0
	end)
end

function setupDragExtend(grabModel)
	if not grabModel or not grabModel.Parent then return end
	if grabModel:GetAttribute("VOIDZ_ReachSetup") then return end
	local drag = grabModel:FindFirstChild("DragPart")
	if not drag or not drag:IsA("BasePart") then return end
	grabModel:SetAttribute("VOIDZ_ReachSetup", true)

	pcall(function() drag.AlignPosition.Enabled = false end)
	pcall(function() drag.AlignOrientation.Enabled = false end)

	local bp = Instance.new("BodyPosition")
	bp.Name = "VOIDZ_ScrollDrag"
	bp.MaxForce = Vector3.new(1e5, 1e5, 1e5)
	bp.D = 200
	bp.P = 10000
	bp.Position = drag.Position
	bp.Parent = drag

	pcDistance = math.clamp(S.extendAmount or 25, 11, 120)
end

function tickDragExtend(grabModel)
	if not grabModel or not grabModel.Parent then return end
	if not S.toggles.lineExtend then return end
	setupDragExtend(grabModel)
	local drag = grabModel:FindFirstChild("DragPart")
	local bp = drag and drag:FindFirstChild(_Vzd({123,116,110,105,127,132,120,136,151,148,145,145,105,151,134,140}))
	local cam = workspace.CurrentCamera
	if not cam or not bp then return end
	local pos = cam.CFrame.Position + cam.CFrame.LookVector * pcDistance
	pcall(function()
		bp.Position = pos
	end)
end

function installFurtherGrabHook()
	if S.conns.furtherGrabParts then return end
	S.conns.furtherGrabParts = workspace.ChildAdded:Connect(function(ch)
		if not S.toggles.lineExtend then return end
		if ch.Name ~= "GrabParts" then return end
		if not ch:IsA("Model") then return end
		task.spawn(function()
			local grabPart = ch:WaitForChild("GrabPart", 5)
			local dragPart = ch:WaitForChild("DragPart", 5)
			if not grabPart or not dragPart then return end
			setupDragExtend(ch)
			while ch.Parent and S.toggles.lineExtend do
				tickDragExtend(ch)
				task.wait()
			end
			if not workspace:FindFirstChild("GrabParts") then
				pcDistance = 0
			end
		end)
	end)
	for _, ch in ipairs(workspace:GetChildren()) do
		if ch.Name == "GrabParts" and ch:IsA("Model") then
			task.spawn(function()
				setupDragExtend(ch)
				while ch.Parent and S.toggles.lineExtend do
					tickDragExtend(ch)
					task.wait()
				end
			end)
		end
	end
end

function installScrollDistanceWheel()
	if S.conns.scrollDistWheel then return end
	S.conns.scrollDistWheel = UserInputService.InputChanged:Connect(function(input)
		if not S.toggles.lineExtend then return end
		local z = 0
		if input.UserInputType == Enum.UserInputType.MouseWheel then
			z = input.Position.Z
		elseif input.UserInputType == Enum.UserInputType.MouseWheelForward then
			z = 1
		elseif input.UserInputType == Enum.UserInputType.MouseWheelBackward then
			z = -1
		else
			return
		end
		if z == 0 and input.Delta then z = input.Delta.Y end
		local holding = false
		for _, ch in ipairs(workspace:GetChildren()) do
			if ch.Name == "GrabParts" then holding = true break end
		end
		if not holding then return end
		local step = tonumber(S.scrollStep) or 2
		if z > 0 then
			pcDistance = pcDistance + step
		elseif z < 0 then
			pcDistance = pcDistance - step
		end
		pcDistance = math.clamp(pcDistance, 11, 120)
		notify(HUB_NAME, _Vzd({120,136,151,148,145,145,69,137,142,152,153,134,147,136,138,95,69}) .. math.floor(pcDistance), 0.5)
	end)
end

function applyLineExtendDistance(amount)
	amount = math.clamp(tonumber(amount) or S.extendAmount or 25, 11, 120)
	S.extendAmount = amount
	if pcDistance < amount then pcDistance = amount end
	enableFurtherReachGamepass()
	local ok = forceGrabDistance(amount)
	if FTAP.ExtendGrabLine then
		pcall(function()
			if FTAP.ExtendGrabLine:IsA("RemoteEvent") then
				FTAP.ExtendGrabLine:FireServer(amount)
			elseif FTAP.ExtendGrabLine:IsA("RemoteFunction") then
				FTAP.ExtendGrabLine:InvokeServer(amount)
			end
		end)
	end
	installFurtherGrabHook()
	installScrollDistanceWheel()
	return ok
end

function setLineExtend(on)
	stopLoop("lineExtend")
	S.toggles.lineExtend = on == true
	if not on then
		disableFurtherReachGamepass()
		if S.conns.furtherGrabParts then
			pcall(function() S.conns.furtherGrabParts:Disconnect() end)
			S.conns.furtherGrabParts = nil
		end
		if S.conns.scrollDistWheel then
			pcall(function() S.conns.scrollDistWheel:Disconnect() end)
			S.conns.scrollDistWheel = nil
		end
	pcall(function()
		for _, ch in ipairs(workspace:GetChildren()) do
			if ch.Name == "GrabParts" then
				ch:SetAttribute("VOIDZ_ReachSetup", nil)
				local drag = ch:FindFirstChild("DragPart")
				if drag then
					local bp = drag:FindFirstChild("VOIDZ_ScrollDrag")
					if bp then bp:Destroy() end
				end
				local ap = drag and (drag:FindFirstChildOfClass("AlignPosition") or drag:FindFirstChild("AlignPosition", true))
				if ap then
					ap.Enabled = true
					ap.MaxForce = 60000
				end
				local ao = drag and (drag:FindFirstChildOfClass("AlignOrientation") or drag:FindFirstChild(_Vzd({102,145,142,140,147,116,151,142,138,147,153,134,153,142,148,147}), true))
				if ao then ao.Enabled = true end
			end
		end
	end)
		pcDistance = 0
		notify(HUB_NAME, "Scroll distance OFF", 1.2)
		return
	end

	local amt = math.clamp(S.extendAmount or 25, 11, 120)
	S.extendAmount = amt
	pcDistance = amt
	local ok = applyLineExtendDistance(amt)
	startLoop("lineExtend", 0.08, function()
		if not S.toggles.lineExtend then return end
		forceGrabDistance(math.max(S.extendAmount or 25, pcDistance > 0 and pcDistance or 25))
	end)
	if S.conns.reachRespawn then pcall(function() S.conns.reachRespawn:Disconnect() end) end
	S.conns.reachRespawn = LP.CharacterAdded:Connect(function(c)
		if not S.toggles.lineExtend then return end
		grabSenvCache = nil
		reachGamepassState.bounced = false
		task.wait(0.6)
		pcall(function() c:WaitForChild("GrabbingScript", 8) end)
		applyLineExtendDistance(S.extendAmount or 25)
	end)

	local msg = ok
		and ("Scroll distance ON · " .. tostring(amt) .. _Vzd({69,77,156,141,138,138,145,69,156,141,142,145,138,69,141,148,145,137,142,147,140,78}))
		or _Vzd({120,136,151,148,145,145,69,137,142,152,153,134,147,136,138,69,116,115,69,220,69,140,151,134,135,69,152,148,146,138,148,147,138,69,148,147,136,138,69,153,148,69,145,148,136,144,69,108,151,134,135,135,142,147,140,120,136,151,142,149,153})
	notify(HUB_NAME, msg, 2.5)
	if not getsenv then
		notify(HUB_NAME, _Vzd({115,148,69,140,138,153,152,138,147,155,69,57,69,141,148,145,137,82,138,157,153,138,147,137,69,152,153,142,145,145,69,156,148,151,144,152,69,155,142,134,69,105,151,134,140,117,134,151,153}), 2.5)
	end
end

local setSilentAim, setAntiKick, installAntiKickOnLoad, _startFovCircle, _stopFovCircle
(function()
local silentHooked = false
local silentTarget = nil
local silentFov = S.silentFov or 150
local silentFovCircle = true
local silentCircleObj = nil
local silentCircleBG = nil
local silentAimBusy = false
local SILENT_HITBOXES = {"Head", "HumanoidRootPart", "Torso", "UpperTorso"}

local function nearestSilentTarget()
	local me = hrp()
	if not me then return nil end
	local cam = workspace.CurrentCamera
	local screenCenter = Vector2.new(cam.ViewportSize.X / 2, cam.ViewportSize.Y / 2)
	local best, bd = nil, silentFov
	for _, p in ipairs(Players:GetPlayers()) do
		if validP(p) and p ~= LP then
			local r = rootOf(p)
			if r then
				local sp, onScreen = cam:WorldToScreenPoint(r.Position)
				if onScreen then
					local d = (Vector2.new(sp.X, sp.Y) - screenCenter).Magnitude
					if d < bd then best, bd = p, d end
				end
			end
		end
	end
	return best
end

local function pickHitbox(target)
	local char = target and target.Character
	if not char then return nil end
	for _, name in ipairs(SILENT_HITBOXES) do
		local part = char:FindFirstChild(name)
		if part then return part end
	end
	return nil
end

local function startFovCircle()
	if silentCircleObj then return end
	local ok1, c1 = pcall(function()
		local c = Drawing.new("Circle")
		c.Thickness = 2
		c.Filled = false
		c.ZIndex = 2
		c.Transparency = 1
		return c
	end)
	local ok2, c2 = pcall(function()
		local c = Drawing.new("Circle")
		c.Thickness = 4
		c.Filled = false
		c.ZIndex = 1
		c.Transparency = 1
		c.Color = Color3.new(0, 0, 0)
		return c
	end)
	if ok1 then silentCircleObj = c1 end
	if ok2 then silentCircleBG = c2 end

	task.spawn(function()
		while silentFovCircle and S.toggles.silentAim do
			local cam = workspace.CurrentCamera
			if cam then
				local center = Vector2.new(cam.ViewportSize.X / 2, cam.ViewportSize.Y / 2)
				if silentCircleObj then
					silentCircleObj.Radius = silentFov
					silentCircleObj.Position = center
					silentCircleObj.Color = Color3.fromRGB(255, 255, 255)
					silentCircleObj.Visible = true
				end
				if silentCircleBG then
					silentCircleBG.Radius = silentFov
					silentCircleBG.Position = center
					silentCircleBG.Visible = true
				end
			end
			task.wait()
		end
		if silentCircleObj then pcall(function() silentCircleObj:Remove() end) silentCircleObj = nil end
		if silentCircleBG then pcall(function() silentCircleBG:Remove() end) silentCircleBG = nil end
	end)
end

local function stopFovCircle()
	silentFovCircle = false
	if silentCircleObj then pcall(function() silentCircleObj:Remove() end) silentCircleObj = nil end
	if silentCircleBG then pcall(function() silentCircleBG:Remove() end) silentCircleBG = nil end
end

setSilentAim = function(on)
	S.toggles.silentAim = on
	if on then
		task.spawn(function()
			while S.toggles.silentAim do
				silentTarget = nearestSilentTarget()
				task.wait(1 / 30)
			end
		end)
		if silentFovCircle then startFovCircle() end
	end
	if not on then
		stopFovCircle()
		silentTarget = nil
	end
	if on and not silentHooked and hookmetamethod and getnamecallmethod then
		silentHooked = true
		local old
		old = hookmetamethod(game, "__namecall", function(self, ...)
			local method = getnamecallmethod()
			local args = { ... }
			if self == workspace and not silentAimBusy and method == "Raycast"
				and S.toggles.silentAim and silentTarget then
				local target = silentTarget
				if target and target.Character then
					local hitPart = pickHitbox(target)
					local me = hrp()
					if me and hitPart then
						local inPlot = false
						pcall(function() inPlot = target.InPlot.Value end)
						if not inPlot then
							local origin = args[1]
							if typeof(origin) == "Vector3" then
								args[2] = (hitPart.Position - origin).Unit * 1000
								local rp = RaycastParams.new()
								rp.FilterDescendantsInstances = { target.Character }
								rp.FilterType = Enum.RaycastFilterType.Include
								args[3] = rp
								return old(self, table.unpack(args))
							end
						end
					end
				end
			end
			return old(self, ...)
		end)
	end
	if on then notify(HUB_NAME, "Silent aim ON", 1.5) end
end

local LogService = game:GetService(_Vzd({113,148,140,120,138,151,155,142,136,138}))
local AK = (getgenv and type(getgenv) == "function" and getgenv().VOIDZ_ANTIKICK) or {}
if getgenv then getgenv().VOIDZ_ANTIKICK = AK end
AK.enabled = false
AK.rejoining = false
AK.lastAt = 0
AK.readyAt = math.huge
AK.weInitiatedTeleport = false
AK.scanBound = false
AK.gen = (AK.gen or 0) + 1
AK.seen = AK.seen or {}

local GRACE_SEC = 12

local function antiKickReady()
	return AK.enabled == true and os.clock() >= (AK.readyAt or math.huge)
end

local function isRealKickSignal(text, source)
	source = tostring(source or "")
	if source == "Player:Kick" then return true end

	text = tostring(text or ""):gsub("%s+", " "):gsub("^%s+", ""):gsub("%s+$", "")
	if text == "" then return false end
	local low = text:lower()

	if low:find("[voidz]", 1, true) or low:find(_Vzd({155,148,142,137,159,69,220}), 1, true) then return false end
	if low:find("anti-kick checked", 1, true) then return false end
	if low:find("anti-kick", 1, true) and (low:find("grace", 1, true) or low:find("active", 1, true) or low:find("off", 1, true)) then
		return false
	end
	if low:find("saved your butt", 1, true) then return false end

	if source == "hub" then return false end
	if #low < 16 then return false end
	if low:find("selected", 1, true) or low:find(_Vzd({153,148,140,140,145,138}), 1, true) then return false end
	if low:find(_Vzd({145,148,148,149,69,144,142,136,144}), 1, true) or low:find("kick type", 1, true) then return false end
	if low:find("kick all", 1, true) or low:find(_Vzd({144,142,136,144,69,153,134,151,140,138,153}), 1, true) then return false end
	if low:find("aura", 1, true) and low:find("kick", 1, true) then return false end
	if low:find("blobman", 1, true) or low:find("stackkick", 1, true) or low:find("grabkick", 1, true) then return false end

	if low:find(_Vzd({141,134,152,69,135,138,138,147,69,144,142,136,144,138,137}), 1, true) and not low:find("you have been kicked", 1, true) then
		return false
	end
	if low:find(_Vzd({156,134,152,69,144,142,136,144,138,137}), 1, true) and not low:find("you were kicked", 1, true) then
		return false
	end
	if low:find(_Vzd({144,142,136,144,138,137,69,149,145,134,158,138,151}), 1, true) or low:find("kicking", 1, true) then return false end

	local phrases = {
		"you were kicked",
		_Vzd({158,148,154,69,141,134,155,138,69,135,138,138,147,69,144,142,136,144,138,137}),
		"you got kicked",
		"kicked from this experience",
		_Vzd({144,142,136,144,138,137,69,139,151,148,146,69,153,141,138,69,138,157,149,138,151,142,138,147,136,138}),
		_Vzd({144,142,136,144,138,137,69,139,151,148,146,69,153,141,138,69,140,134,146,138}),
		"kicked from this game",
		_Vzd({151,138,146,148,155,138,137,69,139,151,148,146,69,153,141,142,152,69,138,157,149,138,151,142,138,147,136,138}),
		"you have been removed from",
		_Vzd({158,148,154,69,156,138,151,138,69,151,138,146,148,155,138,137,69,139,151,148,146}),
		_Vzd({137,142,152,136,148,147,147,138,136,153,138,137,69,139,151,148,146,69,153,141,138,69,140,134,146,138}),
		_Vzd({137,142,152,136,148,147,147,138,136,153,138,137,69,139,151,148,146,69,138,157,149,138,151,142,138,147,136,138}),
		_Vzd({145,148,152,153,69,136,148,147,147,138,136,153,142,148,147,69,153,148,69,153,141,138,69,140,134,146,138}),
		"lost connection to the server",
		_Vzd({136,148,147,147,138,136,153,142,148,147,69,145,148,152,153}),
		_Vzd({149,145,138,134,152,138,69,136,141,138,136,144,69,158,148,154,151,69,142,147,153,138,151,147,138,153,69,136,148,147,147,138,136,153,142,148,147}),
		_Vzd({152,134,146,138,69,134,136,136,148,154,147,153,69,145,134,154,147,136,141,138,137}),
		"another device has joined",
		_Vzd({136,145,142,138,147,153,69,156,134,152,69,144,142,136,144,138,137}),
		_Vzd({158,148,154,69,141,134,155,138,69,135,138,138,147,69,135,134,147,147,138,137}),
		"banned from this experience",
		_Vzd({134,136,136,148,154,147,153,69,141,134,152,69,135,138,138,147,69,135,134,147,147,138,137}),
		"error code: 267",
		"error code: 277",
		"error code: 279",
		_Vzd({138,151,151,148,151,69,136,148,137,138,95,69,87,93,85}),
		"error code: 256",
		_Vzd({138,151,151,148,151,69,136,148,137,138,95,69,87,91,93}),
		"error code: 773",
		"reconnect to the experience",
		"leave and rejoin",
		_Vzd({153,151,158,69,151,138,143,148,142,147,142,147,140}),
	}
	for _, p in ipairs(phrases) do
		if low:find(p, 1, true) then return true end
	end

	return false
end

local function doVoidzRejoin(reason)
	if not antiKickReady() then
		print("[VOIDZ] anti-kick ignored (off/grace):", tostring(reason):sub(1, 80))
		return
	end
	if AK.rejoining then return end
	local now = os.clock()
	if now - (AK.lastAt or 0) < 5 then return end
	AK.lastAt = now
	AK.rejoining = true
	AK.weInitiatedTeleport = true

	local fancy = "✦ VOIDZ · anti-kick checked… rejoining ✦"
	pcall(function() voidzChat(fancy) end)
	pcall(function()
		notify(HUB_NAME, "Anti-kick · leaving before AC · rejoining…", 3)
	end)
	pcall(function()
		StarterGui:SetCore(_Vzd({104,141,134,153,114,134,144,138,120,158,152,153,138,146,114,138,152,152,134,140,138}), {
			Text = fancy,
			Color = Color3.fromRGB(180, 120, 255),
			Font = Enum.Font.GothamBold,
			TextSize = 16,
		})
	end)

	task.spawn(function()
		local placeId = game.PlaceId
		local jobId = game.JobId
		pcall(function()
			queue_teleport("print('[VOIDZ] anti-kick rejoin')")
		end)
		local tries = {
			function()
				if jobId and #jobId > 0 then
					TeleportService:TeleportToPlaceInstance(placeId, jobId, LP)
				else
					error(_Vzd({147,148,69,143,148,135}))
				end
			end,
			function()
				TeleportService:Teleport(placeId, LP)
			end,
		}
		for i, fn in ipairs(tries) do
			local ok = pcall(fn)
			print("[VOIDZ] rejoin try", i, ok, tostring(reason or ""):sub(1, 60))
			if ok then break end
			task.wait(0.15)
		end
		task.delay(0.35, function()
			pcall(function()
				LP:Kick("VOIDZ anti-kick · rejoining before AC")
			end)
		end)
		task.delay(10, function()
			AK.rejoining = false
			AK.weInitiatedTeleport = false
		end)
	end)
end

local function onKickSignal(text, source)
	if not antiKickReady() then return end
	if not isRealKickSignal(text, source) then return end
	local key = (source or "?") .. "|" .. tostring(text):lower():sub(1, 120)
	local t = os.clock()
	if AK.seen[key] and (t - AK.seen[key]) < 6 then return end
	AK.seen[key] = t
	print(_Vzd({128,123,116,110,105,127,130,69,144,142,136,144,69,152,142,140,147,134,145,69,139,151,148,146}), source, "→", tostring(text):sub(1, 100))
	doVoidzRejoin(text)
end

local function installNamecallKickHook()
	if not hookmetamethod or not getnamecallmethod then return false end
	if getgenv and type(getgenv) == "function" and getgenv().VOIDZ_AK_HOOKED then return true end
	local ok = pcall(function()
		local old
		old = hookmetamethod(game, "__namecall", function(self, ...)
			local method = getnamecallmethod()
			local m = tostring(method or "")
			if (m == "Kick" or m == "kick") and self == LP then
				local args = { ... }
				local msg = tostring(args[1] or "")
				local low = msg:lower()
				if low:find("voidz", 1, true) or low:find(_Vzd({152,134,155,138,137,69,158,148,154,151,69,135,154,153,153}), 1, true) then
					return old(self, ...)
				end
				if antiKickReady() then
					print("[VOIDZ] Player:Kick intercepted:", msg)
					task.defer(function()
						onKickSignal(msg ~= "" and msg or "you were kicked", "Player:Kick")
					end)
					return
				end
				return old(self, ...)
			end
			return old(self, ...)
		end)
		if getgenv and type(getgenv) == "function" then getgenv().VOIDZ_AK_HOOKED = true end
	end)
	return ok
end

local function scanPromptGuiText(gui)
	if not gui then return end
	for _, d in ipairs(gui:GetDescendants()) do
		if d:IsA("TextLabel") or d:IsA(_Vzd({121,138,157,153,103,154,153,153,148,147})) or d:IsA("TextBox") then
			local t = d.Text
			if t and #t >= 16 then
				onKickSignal(t, "RobloxPromptGui")
			end
		end
	end
end

local function bindKickScanners()
	if AK.scanBound then return end
	AK.scanBound = true

	pcall(function()
		LogService.MessageOut:Connect(function(message, _messageType)
			if not antiKickReady() then return end
			onKickSignal(message, "console")
		end)
	end)

	pcall(function()
		GuiService.ErrorMessageChanged:Connect(function()
			if not antiKickReady() then return end
			local msg = ""
			pcall(function()
				msg = tostring(GuiService:GetErrorMessage() or "")
			end)
			if msg ~= "" then
				onKickSignal(msg, "GuiService")
			end
		end)
	end)

	local watched = setmetatable({}, { __mode = "k" })
	local function watchPrompt(gui)
		if not gui or watched[gui] then return end
		if gui.Name ~= "RobloxPromptGui" then return end
		watched[gui] = true
		gui.DescendantAdded:Connect(function(d)
			if not antiKickReady() then return end
			if d:IsA("TextLabel") or d:IsA("TextButton") or d:IsA("TextBox") then
				task.defer(function()
					onKickSignal(d.Text, "RobloxPromptGui")
					task.delay(0.15, function()
						if d.Parent then onKickSignal(d.Text, "RobloxPromptGui") end
					end)
				end)
			end
		end)
		for _, d in ipairs(gui:GetDescendants()) do
			if d:IsA("TextLabel") or d:IsA(_Vzd({121,138,157,153,103,154,153,153,148,147})) then
				pcall(function()
					d:GetPropertyChangedSignal("Text"):Connect(function()
						if not antiKickReady() then return end
						onKickSignal(d.Text, "RobloxPromptGui")
					end)
				end)
			end
		end
	end

	pcall(function()
		watchPrompt(CoreGui:FindFirstChild("RobloxPromptGui"))
		CoreGui.ChildAdded:Connect(function(ch)
			if ch.Name == "RobloxPromptGui" then
				task.wait(0.05)
				watchPrompt(ch)
			end
		end)
	end)

	task.spawn(function()
		while true do
			task.wait(0.45)
			if not AK.enabled then
			elseif antiKickReady() then
				pcall(function()
					local msg = tostring(GuiService:GetErrorMessage() or "")
					if msg ~= "" then onKickSignal(msg, "GuiService.poll") end
				end)
				pcall(function()
					scanPromptGuiText(CoreGui:FindFirstChild("RobloxPromptGui"))
				end)
			end
		end
	end)

	pcall(function()
		TeleportService.TeleportInitFailed:Connect(function(player, _result, errMsg)
			if player ~= LP and player ~= nil then return end
			if not AK.weInitiatedTeleport then return end
			if not antiKickReady() then return end
			task.delay(1, function()
				AK.rejoining = false
				doVoidzRejoin(_Vzd({121,138,145,138,149,148,151,153,110,147,142,153,107,134,142,145,138,137,69}) .. tostring(errMsg))
			end)
		end)
	end)

	installNamecallKickHook()
end

setAntiKick = function(on, quiet)
	AK.enabled = on == true
	AK.rejoining = false
	S.toggles.antiKick = AK.enabled
	S.toggles.autoRejoin = AK.enabled
	if not AK.enabled then
		AK.readyAt = math.huge
		print("[VOIDZ] anti-kick OFF")
		if not quiet then notify(HUB_NAME, "Anti-kick OFF", 2) end
		return
	end
	AK.gen += 1
	local gen = AK.gen
	AK.readyAt = os.clock() + GRACE_SEC
	bindKickScanners()
	print(_Vzd({128,123,116,110,105,127,130,69,134,147,153,142,82,144,142,136,144,69,116,115,69,220,69,152,136,134,147,152,69,136,148,147,152,148,145,138,69,80,69,119,148,135,145,148,157,69,144,142,136,144,69,122,110,69,220,69}) .. GRACE_SEC .. "s grace")
	if not quiet then
		notify(HUB_NAME, _Vzd({102,147,153,142,82,144,142,136,144,69,116,115,69,220,69}) .. GRACE_SEC .. "s grace, then scanning", 3)
	end
	task.delay(GRACE_SEC, function()
		if AK.enabled and AK.gen == gen then
			if not quiet then notify(HUB_NAME, "Anti-kick scanning (console + kick UI)", 2) end
			print(_Vzd({128,123,116,110,105,127,130,69,134,147,153,142,82,144,142,136,144,69,134,136,153,142,155,138,69,57,69,136,148,147,152,148,145,138,69,80,69,119,148,135,145,148,157,117,151,148,146,149,153,108,154,142,69,80,69,117,145,134,158,138,151,95,112,142,136,144}))
		end
	end)
end

installAntiKickOnLoad = function()
	AK.enabled = false
	AK.rejoining = false
	S.toggles.antiKick = false
	S.toggles.autoRejoin = false
	print(_Vzd({128,123,116,110,105,127,130,69,134,147,153,142,82,144,142,136,144,69,142,147,139,151,134,152,153,151,154,136,153,154,151,138,69,151,138,134,137,158,69,77,147,148,153,69,138,147,134,135,145,138,137,78}))
end

_startFovCircle = startFovCircle
_stopFovCircle = stopFovCircle

end)()

local function unload()
	pcall(function()
		local ak = getgenv and type(getgenv) == "function" and getgenv().VOIDZ_ANTIKICK
		if ak then
			ak.enabled = false
			ak.readyAt = math.huge
			ak.rejoining = false
			ak.weInitiatedTeleport = false
		end
	end)
	for k in pairs(S.loops) do S.loops[k] = false end
	for _, c in pairs(S.conns) do pcall(function() c:Disconnect() end) end
	pcall(function()
		S.hubOpen = false
		S.toggles.unlockMouse = false
		if S.mouseForceConn then
			S.mouseForceConn:Disconnect()
			S.mouseForceConn = nil
		end
	end)
	setFly(false); clearESP(); setPurpleTint(false); setFullbright(false)
	pcall(function() setCharacterInvis(false, true) end)
	pcall(function() setCrazyLine(false) end)
	pcall(function() setAutoSpinCoins(false) end)
	pcall(function() stopControl(true) end)
	pcall(function() clearFormWear(false) end)
	pcall(function() stopMissileStrike(true) end)
	pcall(function() releaseAllBrought(true) end)
	pcall(function() setPalletCage(false) end)
	pcall(function() ContextActionService:UnbindAction(_Vzd({123,116,110,105,127,132,117,134,145,145,138,153,118})) end)
	pcall(function() ContextActionService:UnbindAction(_Vzd({123,116,110,105,127,132,121,134,135,121,148,158})) end)
	pcall(function() ContextActionService:UnbindAction(_Vzd({123,116,110,105,127,132,110,147,152,153,134,147,153,106,152,136,134,149,138})) end)
	pcall(function() ContextActionService:UnbindAction("VOIDZ_ControlK") end)
	if S.gui then pcall(function() S.gui:Destroy() end) end
	S.gui = nil
	S.root = nil
	task.spawn(function()
		for _ = 1, 120 do
			pcall(function()
				UserInputService.MouseBehavior = Enum.MouseBehavior.LockCenter
				UserInputService.MouseIconEnabled = false
			end)
			RunService.RenderStepped:Wait()
		end
	end)
	if getgenv and type(getgenv) == "function" then getgenv().VOIDZ_LOADED = nil; getgenv().VOIDZ_UNLOAD = nil end
	print("[VOIDZ] unloaded")
end
if getgenv and type(getgenv) == "function" then getgenv().VOIDZ_UNLOAD = unload end

function _voidzInitUI()
Late._phase = "ui_start"
local function showTip(text)
	if not S.tipFrame then return end
	S.tipLabel.Text = text or ""
	S.tipFrame.Visible = text ~= nil and text ~= ""
end

local function isMobileMode()
	return S.device == "Mobile" or S.toggles.mobileUI == true
end

local function makeScroll(parent)
	local mob = isMobileMode()
	local sc = Instance.new("ScrollingFrame")
	sc.Size = UDim2.fromScale(1, 1)
	sc.BackgroundTransparency = 1
	sc.BorderSizePixel = 0
	sc.ScrollBarThickness = mob and 5 or 3
	sc.ScrollBarImageColor3 = C.accent
	sc.ScrollBarImageTransparency = 0.35
	sc.AutomaticCanvasSize = Enum.AutomaticSize.Y
	sc.CanvasSize = UDim2.new()
	sc.ScrollingDirection = Enum.ScrollingDirection.Y
	sc.Parent = parent
	local lay = Instance.new("UIListLayout")
	lay.Padding = UDim.new(0, mob and 7 or 6)
	lay.SortOrder = Enum.SortOrder.LayoutOrder
	lay.Parent = sc
	pad(sc, mob and 10 or 10, mob and 10 or 10, mob and 16 or 14, mob and 10 or 10)
	return sc
end

S.featureIndex = S.featureIndex or {}
S._buildingTab = nil

local function indexFeature(kind, title, tip, extra)
	local tab = S._buildingTab
	if not tab or title == nil or title == "" then return end
	if tab == "home" and kind == "section" then return end
	local titleS = tostring(title)
	local tipS = tostring(tip or "")
	local extraS = tostring(extra or "")
	local blob = (titleS .. " " .. tipS .. " " .. extraS .. " " .. tab .. " " .. kind):lower()
	S.featureIndex[#S.featureIndex + 1] = {
		tab = tab,
		kind = kind or "item",
		title = titleS,
		tip = tipS,
		search = blob,
	}
end

local function tabLabelOf(id)
	for _, def in ipairs(TAB_DEFS) do
		if def.id == id then return def.label end
	end
	return tostring(id or "?")
end

local function editDistance(a, b)
	a, b = tostring(a or ""), tostring(b or "")
	local la, lb = #a, #b
	if la == 0 then return lb end
	if lb == 0 then return la end
	if math.abs(la - lb) > 3 and math.max(la, lb) > 5 then return 99 end
	local prev = {}
	local cur = {}
	for j = 0, lb do prev[j] = j end
	for i = 1, la do
		cur[0] = i
		local ca = a:sub(i, i)
		for j = 1, lb do
			local cost = (ca == b:sub(j, j)) and 0 or 1
			local del = prev[j] + 1
			local ins = cur[j - 1] + 1
			local sub = prev[j - 1] + cost
			cur[j] = math.min(del, ins, sub)
		end
		prev, cur = cur, prev
	end
	return prev[lb]
end

local function fuzzyScore(query, entry)
	query = tostring(query or ""):lower():gsub("%s+", " "):gsub("^%s+", ""):gsub("%s+$", "")
	if query == "" then return 0 end
	local title = tostring(entry.title or ""):lower()
	local blob = tostring(entry.search or title)
	local tab = tostring(entry.tab or ""):lower()
	local tlab = tabLabelOf(entry.tab):lower()

	if title == query or blob == query then return 300 end
	if title:find(query, 1, true) then return 220 end
	if tlab == query or tab == query then return 200 end
	if blob:find(query, 1, true) then return 160 end
	if tlab:find(query, 1, true) or tab:find(query, 1, true) then return 140 end

	local score = 0
	local words = {}
	for w in query:gmatch("%S+") do
		if #w >= 2 then words[#words + 1] = w end
	end
	if #words == 0 then return 0 end
	local hits = 0
	for _, w in ipairs(words) do
		local best = 0
		if title:find(w, 1, true) then best = 40
		elseif blob:find(w, 1, true) then best = 28
		elseif tlab:find(w, 1, true) then best = 24
		else
			local j = 1
			for i = 1, #blob do
				if blob:sub(i, i) == w:sub(j, j) then
					j += 1
					if j > #w then best = math.max(best, 12); break end
				end
			end
			if best < 12 and #w >= 3 then
				for tok in (title .. " " .. blob):gmatch("%w+") do
					if #tok >= 3 then
						local d = editDistance(w, tok)
						local maxd = (#w <= 4) and 1 or 2
						if d <= maxd then
							best = math.max(best, 18 - d * 4)
						end
					end
				end
			end
		end
		if best > 0 then hits += 1; score += best end
	end
	if hits == 0 then return 0 end
	if #words >= 2 and hits < math.ceil(#words * 0.45) then
		return math.floor(score * 0.35)
	end
	return score + hits * 3
end

local function searchFeatures(query, limit)
	limit = limit or 14
	local scored = {}
	for _, e in ipairs(S.featureIndex or {}) do
		local s = fuzzyScore(query, e)
		if s >= 8 then
			scored[#scored + 1] = { s = s, e = e }
		end
	end
	table.sort(scored, function(a, b)
		if a.s == b.s then return a.e.title < b.e.title end
		return a.s > b.s
	end)
	local out, seen = {}, {}
	for _, row in ipairs(scored) do
		local key = row.e.tab .. "|" .. row.e.title
		if not seen[key] then
			seen[key] = true
			out[#out + 1] = row
			if #out >= limit then break end
		end
	end
	return out
end

local function section(parent, text, order)
	indexFeature("section", text, _Vzd({152,138,136,153,142,148,147,69,141,138,134,137,138,151}), text)
	local mob = isMobileMode()
	local wrap = Instance.new(_Vzd({107,151,134,146,138}))
	wrap.LayoutOrder = order or 0
	wrap.Size = UDim2.new(1, -4, 0, mob and 22 or 20)
	wrap.BackgroundTransparency = 1
	wrap.Parent = parent
	local bar = Instance.new("Frame")
	bar.Size = UDim2.fromOffset(3, mob and 12 or 10)
	bar.Position = UDim2.fromOffset(2, mob and 5 or 5)
	bar.BackgroundColor3 = C.accent
	bar.BorderSizePixel = 0
	bar.Parent = wrap
	corner(bar, 2)
	local l = Instance.new("TextLabel")
	l.BackgroundTransparency = 1
	l.Size = UDim2.new(1, -14, 1, 0)
	l.Position = UDim2.fromOffset(12, 0)
	l.Font = Enum.Font.GothamBold
	l.TextSize = mob and 12 or 11
	l.TextColor3 = C.muted
	l.TextXAlignment = Enum.TextXAlignment.Left
	l.Text = tostring(text or ""):upper()
	l.Parent = wrap
	return wrap
end

local function makeButton(parent, opts)
	opts = opts or {}
	indexFeature("button", opts.title, opts.tip or opts.desc, opts.id)
	local mob = isMobileMode()
	local h = opts.h or (mob and 46 or 34)
	local wrap = Instance.new("Frame")
	wrap.LayoutOrder = opts.order or 0
	wrap.Size = UDim2.new(1, -6, 0, h)
	wrap.BackgroundTransparency = 1
	wrap.Parent = parent
	local b = Instance.new("TextButton")
	b.Size = UDim2.new(1, mob and -36 or -28, 1, 0)
	b.BackgroundColor3 = opts.danger and C.danger or C.card
	b.BorderSizePixel = 0
	b.Font = Enum.Font.GothamBold
	b.TextSize = mob and 14 or 12
	b.TextColor3 = opts.danger and C.dangerText or C.text
	b.Text = opts.title or "Run"
	b.AutoButtonColor = false
	b.Parent = wrap
	corner(b, mob and 10 or 8)
	stroke(b, opts.danger and (C.dangerStroke or C.danger) or C.strokeSoft, 1.1, 0.4)
	if opts.tag then
		local tagColors = {
			PREMIUM = { bg = Color3.fromRGB(180, 120, 255), text = Color3.fromRGB(255, 255, 255) },
			OP = { bg = Color3.fromRGB(255, 80, 80), text = Color3.fromRGB(255, 255, 255) },
			NEW = { bg = Color3.fromRGB(60, 200, 120), text = Color3.fromRGB(255, 255, 255) },
			BETA = { bg = Color3.fromRGB(255, 180, 40), text = Color3.fromRGB(30, 20, 10) },
			HOT = { bg = Color3.fromRGB(255, 100, 50), text = Color3.fromRGB(255, 255, 255) },
		}
		local tc = tagColors[opts.tag] or { bg = C.accent, text = C.text }
		local bubble = Instance.new("TextLabel")
		bubble.Size = UDim2.fromOffset(0, 0)
		bubble.AutomaticSize = Enum.AutomaticSize.X
		bubble.BackgroundColor3 = tc.bg
		bubble.Font = Enum.Font.GothamBold
		bubble.TextSize = 8
		bubble.TextColor3 = tc.text
		bubble.Text = " " .. opts.tag:upper() .. " "
		bubble.Parent = wrap
		bubble.ZIndex = 12
		corner(bubble, 6)
		stroke(bubble, tc.bg, 1.5, 0)
		bubble.Position = UDim2.new(1, -10, 0.5, -8)
	end
	if opts.tip then
		b.MouseEnter:Connect(function() showTip(opts.tip) end)
		b.MouseLeave:Connect(function() showTip("") end)
	end
	b.MouseEnter:Connect(function()
		tween(b, { BackgroundColor3 = opts.danger and Color3.fromRGB(70, 28, 50) or C.card2 }, 0.1)
	end)
	b.MouseLeave:Connect(function()
		tween(b, { BackgroundColor3 = opts.danger and C.danger or C.card }, 0.1)
	end)
	b.MouseButton1Click:Connect(function()
		if opts.callback then
			local ok, err = pcall(opts.callback)
			if not ok then
				warn(_Vzd({128,123,116,110,105,127,130}), err)
				notify(HUB_NAME, _Vzd({106,151,151,95,69}) .. tostring(err):sub(1, 50), 3)
			end
		end
	end)
	local gear = Instance.new("TextButton")
	local gs = mob and 32 or 24
	gear.Size = UDim2.fromOffset(gs, gs)
	gear.Position = UDim2.new(1, -gs, 0.5, -gs / 2)
	gear.BackgroundColor3 = C.card2
	gear.Text = "⚙"
	gear.TextSize = mob and 14 or 11
	gear.TextColor3 = C.accent2
	gear.Font = Enum.Font.GothamBold
	gear.Parent = wrap
	corner(gear, 6)
	stroke(gear, C.stroke, 1.4)
	gear.MouseButton1Click:Connect(function()
		openOptionPanel({
			title = opts.title or "Action",
			tip = opts.tip or opts.desc or _Vzd({119,154,147,69,153,141,142,152,69,134,136,153,142,148,147,69,156,142,153,141,69,153,141,138,69,135,154,153,153,148,147,83}),
			settings = opts.settings,
		})
	end)
	return b
end

local function makeToggle(parent, opts)
	opts = opts or {}
	indexFeature("toggle", opts.title, opts.tip or opts.desc, opts.id)
	local id = opts.id
	local mob = isMobileMode()
	local rowH = opts.desc and (mob and 56 or 44) or (mob and 48 or 36)
	local row = Instance.new("Frame")
	row.LayoutOrder = opts.order or 0
	row.Size = UDim2.new(1, -6, 0, rowH)
	row.BackgroundColor3 = C.card
	row.BorderSizePixel = 0
	row.Parent = parent
	corner(row, 9)
	stroke(row, C.strokeSoft, 1, 0.45)

	local title = Instance.new("TextLabel")
	title.BackgroundTransparency = 1
	title.Size = UDim2.new(1, mob and -110 or -90, 0, mob and 16 or 14)
	title.Position = UDim2.fromOffset(12, opts.desc and 6 or (mob and 15 or 11))
	title.Font = Enum.Font.GothamMedium
	title.TextSize = mob and 13 or 12
	title.TextColor3 = C.text
	title.TextXAlignment = Enum.TextXAlignment.Left
	title.Text = opts.title or "Toggle"
	title.Parent = row
	if opts.tag then
		local tagColors = {
			PREMIUM = { bg = Color3.fromRGB(180, 120, 255), text = Color3.fromRGB(255, 255, 255) },
			OP = { bg = Color3.fromRGB(255, 80, 80), text = Color3.fromRGB(255, 255, 255) },
			NEW = { bg = Color3.fromRGB(60, 200, 120), text = Color3.fromRGB(255, 255, 255) },
			BETA = { bg = Color3.fromRGB(255, 180, 40), text = Color3.fromRGB(30, 20, 10) },
			HOT = { bg = Color3.fromRGB(255, 100, 50), text = Color3.fromRGB(255, 255, 255) },
		}
		local tc = tagColors[opts.tag] or { bg = C.accent, text = C.text }
		local bubble = Instance.new(_Vzd({121,138,157,153,113,134,135,138,145}))
		bubble.Size = UDim2.fromOffset(0, 0)
		bubble.AutomaticSize = Enum.AutomaticSize.X
		bubble.BackgroundColor3 = tc.bg
		bubble.Font = Enum.Font.GothamBold
		bubble.TextSize = 8
		bubble.TextColor3 = tc.text
		bubble.Text = " " .. opts.tag:upper() .. " "
		bubble.Parent = row
		bubble.ZIndex = 12
		corner(bubble, 6)
		stroke(bubble, tc.bg, 1.5, 0)
		bubble.Position = UDim2.new(0, 12 + title.TextBounds.X + 8, 0, opts.desc and 7 or (mob and 16 or 12))
	end
	if opts.desc then
		local d = Instance.new("TextLabel")
		d.BackgroundTransparency = 1
		d.Size = UDim2.new(1, mob and -110 or -90, 0, mob and 14 or 12)
		d.Position = UDim2.fromOffset(12, mob and 26 or 22)
		d.Font = Enum.Font.Gotham
		d.TextSize = mob and 10 or 10
		d.TextColor3 = C.muted
		d.TextXAlignment = Enum.TextXAlignment.Left
		d.Text = opts.desc
		d.Parent = row
	end
	if opts.tip then
		row.MouseEnter:Connect(function() showTip(opts.tip) end)
		row.MouseLeave:Connect(function() showTip("") end)
	end

	addGearButton(row, {
		title = opts.title or id,
		tip = opts.tip or opts.desc or _Vzd({121,148,140,140,145,138,69,153,141,142,152,69,139,138,134,153,154,151,138,69,148,147,84,148,139,139,83}),
		settings = opts.settings,
	})

	local pillW, pillH = mob and 48 or 38, mob and 24 or 18
	local knobS = mob and 18 or 14
	local pill = Instance.new("TextButton")
	pill.Size = UDim2.fromOffset(pillW, pillH)
	pill.Position = UDim2.new(1, -(pillW + 12), 0.5, -pillH / 2)
	pill.BackgroundColor3 = C.card2
	pill.Text = ""
	pill.AutoButtonColor = false
	pill.Parent = row
	corner(pill, pillH / 2)
	stroke(pill, C.strokeSoft, 1, 0.5)
	local knob = Instance.new("Frame")
	knob.Size = UDim2.fromOffset(knobS, knobS)
	knob.Position = UDim2.fromOffset(3, (pillH - knobS) / 2)
	knob.BackgroundColor3 = C.muted
	knob.BorderSizePixel = 0
	knob.Parent = pill
	corner(knob, knobS / 2)

	local knobOff = UDim2.fromOffset(3, (pillH - knobS) / 2)
	local knobOn = UDim2.fromOffset(pillW - knobS - 3, (pillH - knobS) / 2)
	local function render()
		local on = S.toggles[id] == true
		if on then
			tween(pill, { BackgroundColor3 = C.accentDim }, 0.12)
			tween(knob, { Position = knobOn, BackgroundColor3 = C.accent2 }, 0.12)
		else
			tween(pill, { BackgroundColor3 = C.card2 }, 0.12)
			tween(knob, { Position = knobOff, BackgroundColor3 = C.muted }, 0.12)
		end
	end
	if id then S._toggleRenderers[id] = render end
	render()
	pill.MouseButton1Click:Connect(function()
		S.toggles[id] = not S.toggles[id]
		render()
		if opts.callback then
			local ok, err = pcall(opts.callback, S.toggles[id] == true)
			if not ok then
				warn("[VOIDZ]", err)
				notify(HUB_NAME, _Vzd({106,151,151,95,69}) .. tostring(err):sub(1, 40), 2)
			end
		else
			notify(HUB_NAME, (opts.title or id) .. " " .. (S.toggles[id] and "ON" or "OFF"), 1)
		end
	end)
	return row
end

local function makeSlider(parent, opts)
	opts = opts or {}
	indexFeature("slider", opts.title, opts.tip or opts.desc, opts.stateKey or opts.id)
	local mob = isMobileMode()
	local min, max = opts.min or 0, opts.max or 100
	local value = opts.default or min
	if opts.stateKey then S[opts.stateKey] = value end
	local row = Instance.new("Frame")
	row.LayoutOrder = opts.order or 0
	row.Size = UDim2.new(1, -6, 0, mob and 60 or 48)
	row.BackgroundColor3 = C.card
	row.BorderSizePixel = 0
	row.Parent = parent
	corner(row, 8)
	stroke(row, C.strokeSoft, 1)
	local label = Instance.new("TextLabel")
	label.BackgroundTransparency = 1
	label.Size = UDim2.new(0.65, 0, 0, mob and 16 or 14)
	label.Position = UDim2.fromOffset(10, 6)
	label.Font = Enum.Font.GothamMedium
	label.TextSize = mob and 13 or 11
	label.TextColor3 = C.text
	label.TextXAlignment = Enum.TextXAlignment.Left
	label.Text = opts.title or "Slider"
	label.Parent = row
	local val = Instance.new("TextLabel")
	val.BackgroundTransparency = 1
	val.Size = UDim2.new(0.3, -8, 0, mob and 16 or 14)
	val.Position = UDim2.new(0.68, 0, 0, 6)
	val.Font = Enum.Font.Code
	val.TextSize = mob and 13 or 11
	val.TextColor3 = C.accent2
	val.TextXAlignment = Enum.TextXAlignment.Right
	val.Text = tostring(value)
	val.Parent = row
	local track = Instance.new("Frame")
	track.Size = UDim2.new(1, -20, 0, mob and 14 or 6)
	track.Position = UDim2.fromOffset(10, mob and 36 or 30)
	track.BackgroundColor3 = Color3.fromRGB(30, 20, 48)
	track.BorderSizePixel = 0
	track.Parent = row
	corner(track, mob and 7 or 3)
	local fill = Instance.new("Frame")
	fill.Size = UDim2.new((value - min) / math.max(max - min, 1), 0, 1, 0)
	fill.BackgroundColor3 = C.accent
	fill.BorderSizePixel = 0
	fill.Parent = track
	corner(fill, 3)
	local dragging = false
	local function setX(x)
		local rel = math.clamp((x - track.AbsolutePosition.X) / math.max(track.AbsoluteSize.X, 1), 0, 1)
		value = math.floor(min + (max - min) * rel + 0.5)
		if opts.step then value = math.floor(value / opts.step + 0.5) * opts.step end
		if opts.stateKey then S[opts.stateKey] = value end
		if opts.onValue then opts.onValue(value) end
		fill.Size = UDim2.new((value - min) / math.max(max - min, 1), 0, 1, 0)
		val.Text = tostring(value)
		if opts.callback then pcall(opts.callback, value) end
	end
	track.InputBegan:Connect(function(i)
		if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch then
			dragging = true; setX(i.Position.X)
		end
	end)
	UserInputService.InputChanged:Connect(function(i)
		if dragging and (i.UserInputType == Enum.UserInputType.MouseMovement or i.UserInputType == Enum.UserInputType.Touch) then
			setX(i.Position.X)
		end
	end)
	UserInputService.InputEnded:Connect(function(i)
		if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch then dragging = false end
	end)
	return row
end

local function makeInput(parent, opts)
	opts = opts or {}
	local row = Instance.new("Frame")
	row.LayoutOrder = opts.order or 0
	row.Size = UDim2.new(1, -6, 0, 34)
	row.BackgroundColor3 = C.card
	row.BorderSizePixel = 0
	row.Parent = parent
	corner(row, 8)
	stroke(row, C.strokeSoft, 1)
	local box = Instance.new(_Vzd({121,138,157,153,103,148,157}))
	box.Size = UDim2.new(1, -14, 1, -8)
	box.Position = UDim2.fromOffset(7, 4)
	box.BackgroundTransparency = 1
	box.Font = Enum.Font.Code
	box.TextSize = 12
	box.TextColor3 = C.text
	box.PlaceholderColor3 = C.muted
	box.PlaceholderText = opts.placeholder or "..."
	box.Text = opts.default or ""
	box.ClearTextOnFocus = false
	box.Parent = row
	if opts.id then S[opts.id] = box end
	if opts.tip then
		row.MouseEnter:Connect(function() showTip(opts.tip) end)
		row.MouseLeave:Connect(function() showTip("") end)
	end
	return row, box
end

local function makeDropdown(parent, opts)
	opts = opts or {}
	indexFeature("dropdown", opts.title, opts.tip, table.concat(opts.options or {}, " "))
	local options = opts.options or { "—" }
	local selected = opts.default or options[1]
	local row = Instance.new("Frame")
	row.LayoutOrder = opts.order or 0
	row.Size = UDim2.new(1, -6, 0, 34)
	row.BackgroundColor3 = C.card
	row.BorderSizePixel = 0
	row.Parent = parent
	corner(row, 8)
	stroke(row, C.strokeSoft, 1)
	local lbl = Instance.new(_Vzd({121,138,157,153,113,134,135,138,145}))
	lbl.BackgroundTransparency = 1
	lbl.Size = UDim2.new(0.4, 0, 1, 0)
	lbl.Position = UDim2.fromOffset(10, 0)
	lbl.Font = Enum.Font.Gotham
	lbl.TextSize = 11
	lbl.TextColor3 = C.muted
	lbl.TextXAlignment = Enum.TextXAlignment.Left
	lbl.Text = opts.title or "Select"
	lbl.Parent = row
	local btn = Instance.new("TextButton")
	btn.Size = UDim2.new(0.55, -12, 0, 24)
	btn.Position = UDim2.new(0.42, 0, 0.5, -12)
	btn.BackgroundColor3 = C.bg
	btn.BorderSizePixel = 0
	btn.Font = Enum.Font.GothamMedium
	btn.TextSize = 11
	btn.TextColor3 = C.text
	btn.Text = tostring(selected)
	btn.AutoButtonColor = false
	btn.Parent = row
	corner(btn, 6)
	stroke(btn, C.strokeSoft, 1)
	local open = false
	local listFrame = Instance.new("Frame")
	listFrame.Visible = false
	listFrame.Size = UDim2.new(1, -6, 0, 0)
	listFrame.BackgroundColor3 = C.bg2
	listFrame.BorderSizePixel = 0
	listFrame.ZIndex = 50
	listFrame.Parent = parent
	listFrame.LayoutOrder = (opts.order or 0) + 0.5
	corner(listFrame, 8)
	stroke(listFrame, C.accent, 1)
	local listLay = Instance.new("UIListLayout")
	listLay.Parent = listFrame
	local searchBox = nil
	local searchH = 24
	if #options > 4 then
		searchBox = Instance.new("TextBox")
		searchBox.Size = UDim2.new(1, -8, 0, searchH)
		searchBox.BackgroundColor3 = C.bg
		searchBox.BorderSizePixel = 0
		searchBox.Font = Enum.Font.Gotham
		searchBox.TextSize = 11
		searchBox.TextColor3 = C.text
		searchBox.PlaceholderColor3 = C.muted
		searchBox.PlaceholderText = "Search..."
		searchBox.Text = ""
		searchBox.ClearTextOnFocus = false
		searchBox.TextXAlignment = Enum.TextXAlignment.Left
		searchBox.ZIndex = 52
		searchBox.Parent = listFrame
		corner(searchBox, 6)
		stroke(searchBox, C.strokeSoft, 1)
		pad(searchBox, 0, 4, 0, 4)
	end
	local function rebuild(optsList)
		options = optsList or options
		for _, ch in ipairs(listFrame:GetChildren()) do
			if ch:IsA("TextButton") then ch:Destroy() end
		end
		local filter = searchBox and searchBox.Text:lower() or ""
		for _, opt in ipairs(options) do
			if filter == "" or opt:lower():find(filter, 1, true) then
				local ob = Instance.new("TextButton")
				ob.Size = UDim2.new(1, 0, 0, 24)
				ob.BackgroundColor3 = C.card
				ob.BorderSizePixel = 0
				ob.Font = Enum.Font.Gotham
				ob.TextSize = 11
				ob.TextColor3 = C.text
				ob.Text = opt
				ob.ZIndex = 51
				ob.Parent = listFrame
				ob.MouseButton1Click:Connect(function()
					selected = opt
					btn.Text = opt
					open = false
					listFrame.Visible = false
					listFrame.Size = UDim2.new(1, -6, 0, 0)
					if searchBox then searchBox.Text = "" end
					if opts.callback then pcall(opts.callback, opt) end
				end)
			end
		end
	end
	rebuild(options)
	if searchBox then
		searchBox:GetPropertyChangedSignal("Text"):Connect(function()
			rebuild(options)
			local vis = 0
			local f = searchBox.Text:lower()
			for _, opt in ipairs(options) do
				if f == "" or opt:lower():find(f, 1, true) then vis += 1 end
			end
			listFrame.Size = UDim2.new(1, -6, 0, searchH + 4 + math.min(140, vis * 24) + 4)
		end)
	end
	btn.MouseButton1Click:Connect(function()
		open = not open
		listFrame.Visible = open
		if open then
			local vis = #options
			if searchBox and searchBox.Text ~= "" then
				vis = 0
				local f = searchBox.Text:lower()
				for _, opt in ipairs(options) do
					if opt:lower():find(f, 1, true) then vis += 1 end
				end
			end
			local extra = searchBox and (searchH + 4) or 0
			listFrame.Size = UDim2.new(1, -6, 0, extra + math.min(140, vis * 24) + 4)
		else
			listFrame.Size = UDim2.new(1, -6, 0, 0)
			if searchBox then searchBox.Text = "" end
		end
	end)
	local api = {
		setOptions = function(list)
			rebuild(list)
			if not table.find(list, selected) and list[1] then
				selected = list[1]
				btn.Text = selected
			end
		end,
		get = function() return selected end,
		set = function(v) selected = v; btn.Text = tostring(v) end,
	}
	if opts.register then opts.register(api) end
	return row, api
end

local function makePlayerSearchList(sc, opts, orderFn)
	opts = opts or {}
	local clickFn = opts.clickFn or function(p) S.selected = p end
	local height = opts.height or 160
	local nn = orderFn or n

	local searchInput = nil
	do
		local row = Instance.new("Frame")
		row.LayoutOrder = nn()
		row.Size = UDim2.new(1, 0, 0, 32)
		row.BackgroundTransparency = 1
		row.Parent = sc
		local box = Instance.new("TextBox")
		box.Size = UDim2.new(1, -4, 1, 0)
		box.Position = UDim2.new(0, 2, 0, 0)
		box.BackgroundColor3 = C.card
		box.BorderSizePixel = 0
		box.Font = Enum.Font.Gotham
		box.TextSize = 11
		box.PlaceholderText = _Vzd({120,138,134,151,136,141,69,137,142,152,149,145,134,158,69,148,151,69,101,154,152,138,151,147,134,146,138,83,83,83})
		box.PlaceholderColor3 = C.muted
		box.TextColor3 = C.text
		box.TextXAlignment = Enum.TextXAlignment.Left
		box.ClearTextOnFocus = false
		box.Text = ""
		box.Parent = row
		corner(box, 8)
		stroke(box, C.strokeSoft, 1)
		pad(box, 6, 6, 6, 6)
		searchInput = box
	end

	local multiBar = Instance.new("Frame")
	multiBar.LayoutOrder = nn()
	multiBar.Size = UDim2.new(1, -6, 0, 24)
	multiBar.BackgroundColor3 = C.card
	multiBar.BorderSizePixel = 0
	multiBar.Visible = false
	multiBar.Parent = sc
	corner(multiBar, 6)
	stroke(multiBar, C.strokeSoft, 1)
	pad(multiBar, 6, 6, 6, 6)
	local multiLabel = Instance.new("TextLabel")
	multiLabel.BackgroundTransparency = 1
	multiLabel.Size = UDim2.fromScale(1, 1)
	multiLabel.Font = Enum.Font.GothamMedium
	multiLabel.TextSize = 11
	multiLabel.TextColor3 = C.accent2
	multiLabel.TextXAlignment = Enum.TextXAlignment.Left
	multiLabel.Text = ""
	multiLabel.Parent = multiBar
	local multiClearBtn = Instance.new("TextButton")
	multiClearBtn.Size = UDim2.fromOffset(50, 20)
	multiClearBtn.Position = UDim2.new(1, -54, 0.5, -10)
	multiClearBtn.BackgroundColor3 = C.danger
	multiClearBtn.Text = "Clear"
	multiClearBtn.Font = Enum.Font.GothamBold
	multiClearBtn.TextSize = 9
	multiClearBtn.TextColor3 = C.dangerText
	multiClearBtn.ZIndex = 10
	multiClearBtn.Parent = multiBar
	corner(multiClearBtn, 4)
	multiClearBtn.MouseButton1Click:Connect(function()
		S.loopTargets = {}
		S.loopNames = {}
		S.loopTarget = nil
		S.loopName = nil
		refresh()
	end)

	local listBox = Instance.new("Frame")
	listBox.LayoutOrder = nn()
	listBox.Size = UDim2.new(1, -6, 0, height)
	listBox.BackgroundColor3 = C.bg
	listBox.BorderSizePixel = 0
	listBox.Parent = sc
	corner(listBox, 8)
	stroke(listBox, C.strokeSoft, 1)
	local listSc = Instance.new("ScrollingFrame")
	listSc.Size = UDim2.fromScale(1, 1)
	listSc.BackgroundTransparency = 1
	listSc.ScrollBarThickness = 3
	listSc.ScrollBarImageColor3 = C.accent
	listSc.AutomaticCanvasSize = Enum.AutomaticSize.Y
	listSc.CanvasSize = UDim2.new()
	listSc.Parent = listBox
	local listLay = Instance.new("UIListLayout")
	listLay.Padding = UDim.new(0, 3)
	listLay.Parent = listSc
	pad(listSc, 4, 4, 4, 4)

	local function updateMultiBar()
		local count = 0
		for _ in pairs(S.loopTargets) do count = count + 1 end
		if count > 0 then
			multiBar.Visible = true
			multiLabel.Text = "  " .. count .. " player" .. (count > 1 and "s" or "") .. _Vzd({69,152,138,145,138,136,153,138,137,69,139,148,151,69,145,148,148,149,152})
		else
			multiBar.Visible = false
		end
	end

	local function refresh()
		for _, ch in ipairs(listSc:GetChildren()) do
			if ch:IsA("TextButton") then ch:Destroy() end
		end
		local q = searchInput and searchInput.Text or ""
		for _, lab in ipairs(playerLabels(q)) do
			local p = findPlayerFromLabel(lab)
			local isSel = (S.selected == p)
			local isLoop = S.loopTargets[p]
			local b = Instance.new("TextButton")
			b.Size = UDim2.new(1, -4, 0, 28)
			if isLoop then
				b.BackgroundColor3 = C.accentDim
			elseif isSel then
				b.BackgroundColor3 = C.accentSoft
			else
				b.BackgroundColor3 = C.card
			end
			b.BorderSizePixel = 0
			b.Font = Enum.Font.Gotham
			b.TextSize = 11
			b.TextColor3 = C.text
			b.TextXAlignment = Enum.TextXAlignment.Left
			local prefix = isLoop and "  ★ " or (isSel and "  ● " or "  ")
			b.Text = prefix .. lab
			b.AutoButtonColor = false
			b.Parent = listSc
			corner(b, 6)
			if isLoop then stroke(b, C.accent, 1.5) end
			b.MouseButton1Click:Connect(function()
				S.selected = p
				pcall(function() clickFn(p, lab) end)
				refresh()
				updateMultiBar()
			end)
		end
		updateMultiBar()
	end

	if searchInput then
		searchInput:GetPropertyChangedSignal("Text"):Connect(function()
			refresh()
		end)
	end
	task.defer(refresh)
	return {
		refresh = refresh,
		updateMultiBar = updateMultiBar,
		list = listSc,
	}
end

local function makeAuraBlock(parent, order, meta)
	local id = meta.id
	local holder = Instance.new("Frame")
	holder.LayoutOrder = order
	holder.Size = UDim2.new(1, -6, 0, 34)
	holder.BackgroundColor3 = C.card
	holder.BorderSizePixel = 0
	holder.AutomaticSize = Enum.AutomaticSize.Y
	holder.Parent = parent
	corner(holder, 8)
	stroke(holder, C.strokeSoft, 1)
	local lay = Instance.new("UIListLayout")
	lay.Padding = UDim.new(0, 4)
	lay.Parent = holder
	pad(holder, 4, 4, 6, 4)

	local head = Instance.new(_Vzd({107,151,134,146,138}))
	head.Size = UDim2.new(1, 0, 0, 30)
	head.BackgroundTransparency = 1
	head.Parent = holder
	local title = Instance.new("TextLabel")
	title.BackgroundTransparency = 1
	title.Size = UDim2.new(1, -90, 1, 0)
	title.Position = UDim2.fromOffset(6, 0)
	title.Font = Enum.Font.GothamMedium
	title.TextSize = 12
	title.TextColor3 = C.text
	title.TextXAlignment = Enum.TextXAlignment.Left
	title.Text = meta.title
	title.Parent = head
	head.MouseEnter:Connect(function() showTip(meta.tip) end)
	head.MouseLeave:Connect(function() showTip("") end)

	local gear = Instance.new(_Vzd({121,138,157,153,103,154,153,153,148,147}))
	gear.Size = UDim2.fromOffset(28, 22)
	gear.Position = UDim2.new(1, -78, 0.5, -11)
	gear.BackgroundColor3 = C.bg
	gear.Text = "⚙"
	gear.TextColor3 = C.accent2
	gear.Font = Enum.Font.GothamBold
	gear.TextSize = 12
	gear.AutoButtonColor = false
	gear.Parent = head
	corner(gear, 6)

	local pill = Instance.new("TextButton")
	pill.Size = UDim2.fromOffset(40, 18)
	pill.Position = UDim2.new(1, -44, 0.5, -9)
	pill.BackgroundColor3 = Color3.fromRGB(40, 28, 58)
	pill.Text = ""
	pill.AutoButtonColor = false
	pill.Parent = head
	corner(pill, 9)
	local knob = Instance.new("Frame")
	knob.Size = UDim2.fromOffset(14, 14)
	knob.Position = UDim2.fromOffset(2, 2)
	knob.BackgroundColor3 = C.muted
	knob.BorderSizePixel = 0
	knob.Parent = pill
	corner(knob, 7)

	local settings = Instance.new("Frame")
	settings.Name = "Settings"
	settings.Size = UDim2.new(1, 0, 0, 0)
	settings.BackgroundColor3 = C.bg
	settings.BorderSizePixel = 0
	settings.Visible = false
	settings.ClipsDescendants = true
	settings.Parent = holder
	corner(settings, 6)
	local sLay = Instance.new("UIListLayout")
	sLay.Padding = UDim.new(0, 4)
	sLay.Parent = settings
	pad(settings, 6, 6, 6, 6)

	local cfg = getAura(id)
	local tLabel = Instance.new("TextLabel")
	tLabel.Size = UDim2.new(1, 0, 0, 14)
	tLabel.BackgroundTransparency = 1
	tLabel.Font = Enum.Font.Gotham
	tLabel.TextSize = 10
	tLabel.TextColor3 = C.muted
	tLabel.TextXAlignment = Enum.TextXAlignment.Left
	tLabel.Text = "Target"
	tLabel.Parent = settings

	local targets = { "Players", "Objects", "Players and Objects" }
	local tBtn = Instance.new(_Vzd({121,138,157,153,103,154,153,153,148,147}))
	tBtn.Size = UDim2.new(1, 0, 0, 24)
	tBtn.BackgroundColor3 = C.card
	tBtn.BorderSizePixel = 0
	tBtn.Font = Enum.Font.GothamMedium
	tBtn.TextSize = 11
	tBtn.TextColor3 = C.text
	tBtn.Text = cfg.target or "Players"
	tBtn.AutoButtonColor = false
	tBtn.Parent = settings
	corner(tBtn, 6)
	local ti = 1
	for i, t in ipairs(targets) do if t == cfg.target then ti = i end end
	tBtn.MouseButton1Click:Connect(function()
		ti = ti % #targets + 1
		cfg.target = targets[ti]
		tBtn.Text = cfg.target
	end)

	local rLabel = Instance.new("TextLabel")
	rLabel.Size = UDim2.new(1, 0, 0, 14)
	rLabel.BackgroundTransparency = 1
	rLabel.Font = Enum.Font.Gotham
	rLabel.TextSize = 10
	rLabel.TextColor3 = C.muted
	rLabel.TextXAlignment = Enum.TextXAlignment.Left
	rLabel.Text = _Vzd({119,134,147,140,138,95,69}) .. tostring(cfg.range or 50)
	rLabel.Parent = settings
	local rTrack = Instance.new("TextButton")
	rTrack.Size = UDim2.new(1, 0, 0, 10)
	rTrack.BackgroundColor3 = Color3.fromRGB(30, 20, 48)
	rTrack.Text = ""
	rTrack.AutoButtonColor = false
	rTrack.Parent = settings
	corner(rTrack, 4)
	local rFill = Instance.new("Frame")
	rFill.Size = UDim2.new(((cfg.range or 50) - 10) / 140, 0, 1, 0)
	rFill.BackgroundColor3 = C.accent
	rFill.BorderSizePixel = 0
	rFill.Parent = rTrack
	corner(rFill, 4)
	rTrack.MouseButton1Click:Connect(function()
		local presets = { 25, 50, 75, 100, 200, 99999 }
		local cur = cfg.range or 50
		local nextV = presets[1]
		for i, v in ipairs(presets) do
			if v == cur then nextV = presets[i % #presets + 1]; break end
			if cur < v then nextV = v; break end
		end
		cfg.range = nextV
		cfg._customRange = true
		rLabel.Text = _Vzd({119,134,147,140,138,95,69}) .. (nextV >= 9999 and "MAP" or tostring(nextV))
		rFill.Size = UDim2.new(math.clamp((math.min(nextV, 500) - 10) / 500, 0, 1), 0, 1, 0)
	end)
	local mapBtn = Instance.new("TextButton")
	mapBtn.Size = UDim2.new(1, 0, 0, 22)
	mapBtn.BackgroundColor3 = C.card
	mapBtn.BorderSizePixel = 0
	mapBtn.Font = Enum.Font.GothamBold
	mapBtn.TextSize = 10
	mapBtn.TextColor3 = C.accent2
	mapBtn.Text = "Set Range = WHOLE MAP"
	mapBtn.AutoButtonColor = false
	mapBtn.Parent = settings
	corner(mapBtn, 6)
	mapBtn.MouseButton1Click:Connect(function()
		cfg.range = 99999
		cfg._customRange = true
		rLabel.Text = "Range: MAP"
		rFill.Size = UDim2.new(1, 0, 1, 0)
	end)

	local pLabel = Instance.new("TextLabel")
	pLabel.Size = UDim2.new(1, 0, 0, 14)
	pLabel.BackgroundTransparency = 1
	pLabel.Font = Enum.Font.Gotham
	pLabel.TextSize = 10
	pLabel.TextColor3 = C.muted
	pLabel.TextXAlignment = Enum.TextXAlignment.Left
	pLabel.Text = _Vzd({117,148,156,138,151,95,69}) .. tostring(cfg.power or 2500)
	pLabel.Parent = settings
	local pTrack = Instance.new("TextButton")
	pTrack.Size = UDim2.new(1, 0, 0, 10)
	pTrack.BackgroundColor3 = Color3.fromRGB(30, 20, 48)
	pTrack.Text = ""
	pTrack.AutoButtonColor = false
	pTrack.Parent = settings
	corner(pTrack, 4)
	local pFill = Instance.new("Frame")
	pFill.Size = UDim2.new(((cfg.power or 2500) - 400) / 20000, 0, 1, 0)
	pFill.BackgroundColor3 = C.accent2
	pFill.BorderSizePixel = 0
	pFill.Parent = pTrack
	corner(pFill, 4)
	pTrack.MouseButton1Click:Connect(function()
		local presets = { 800, 1500, 2500, 5000, 8000, 12000, 18000 }
		local cur = cfg.power or 2500
		local nextV = presets[1]
		for i, v in ipairs(presets) do
			if v == cur then nextV = presets[i % #presets + 1]; break end
			if cur < v then nextV = v; break end
		end
		cfg.power = nextV
		cfg._customPower = true
		pLabel.Text = "Power: " .. tostring(nextV)
		pFill.Size = UDim2.new((nextV - 400) / 20000, 0, 1, 0)
	end)

	if id == "netown" then
		local grabT = Instance.new("TextButton")
		grabT.Size = UDim2.new(1, 0, 0, 24)
		grabT.BackgroundColor3 = C.card
		grabT.BorderSizePixel = 0
		grabT.Font = Enum.Font.Gotham
		grabT.TextSize = 11
		grabT.TextColor3 = C.text
		grabT.Text = _Vzd({107,148,151,136,138,69,108,151,134,135,69,113,142,147,138,152,95,69,116,107,107})
		grabT.AutoButtonColor = false
		grabT.Parent = settings
		corner(grabT, 6)
		grabT.MouseButton1Click:Connect(function()
			S.toggles.netownGrab = not S.toggles.netownGrab
			grabT.Text = "Force Grab Lines: " .. (S.toggles.netownGrab and "ON" or "OFF")
		end)
	end

	local function render()
		local on = S.toggles["aura_" .. id] == true
		if on then
			tween(pill, { BackgroundColor3 = C.accentDim }, 0.12)
			tween(knob, { Position = UDim2.fromOffset(24, 2), BackgroundColor3 = C.accent2 }, 0.12)
		else
			tween(pill, { BackgroundColor3 = Color3.fromRGB(40, 28, 58) }, 0.12)
			tween(knob, { Position = UDim2.fromOffset(2, 2), BackgroundColor3 = C.muted }, 0.12)
		end
	end
	render()
	pill.MouseButton1Click:Connect(function()
		S.toggles["aura_" .. id] = not S.toggles["aura_" .. id]
		render()
		setAura(id, S.toggles[_Vzd({134,154,151,134,132}) .. id] == true)
		if S.toggles["aura_" .. id] then notify(HUB_NAME, meta.title .. " ON", 1.2) end
	end)
	gear.MouseButton1Click:Connect(function()
		local open = not settings.Visible
		settings.Visible = open
		settings.Size = open and UDim2.new(1, 0, 0, 160) or UDim2.new(1, 0, 0, 0)
	end)
end

local TAB_DEFS = {
	{ id = "home", icon = "01", label = "Home" },
	{ id = _Vzd({136,148,146,135,134,153}), icon = "02", label = "Combat" },
	{ id = "player", icon = "03", label = "Player" },
	{ id = "grab", icon = "04", label = "Grab" },
	{ id = "auras", icon = "05", label = "Auras" },
	{ id = _Vzd({152,138,151,155,138,151}), icon = "06", label = "Server" },
	{ id = "loop", icon = "07", label = "Loops" },
	{ id = "anti", icon = "08", label = "Protect" },
	{ id = "move", icon = "09", label = "Movement" },
	{ id = "visuals", icon = "10", label = "Visuals" },
	{ id = "toys", icon = "11", label = "Toys" },
	{ id = "explosions", icon = "12", label = "Explosions" },
	{ id = "world", icon = "13", label = "World" },
	{ id = "auto", icon = "14", label = "Auto" },
	{ id = "console", icon = "15", label = "Misc" },
	{ id = "trans", icon = "16", label = "Trans" },
	{ id = "sounds", icon = "17", label = "Sounds" },
	{ id = "fun", icon = "18", label = "Fun" },
	{ id = _Vzd({152,138,153,153,142,147,140,152}), icon = "19", label = "Config" },
}

local _TAB_BUILDERS = {}
_TAB_BUILDERS["home"] = function(sc, n)
		section(sc, "WELCOME", n())
		local hero = Instance.new(_Vzd({107,151,134,146,138}))
		hero.LayoutOrder = n()
		hero.Size = UDim2.new(1, -6, 0, 100)
		hero.BackgroundColor3 = C.card
		hero.BorderSizePixel = 0
		hero.Parent = sc
		corner(hero, 12)
		stroke(hero, C.accent, 1.4)
		grad(hero, Color3.fromRGB(70, 30, 120), C.card, 25)
		local ht = Instance.new("TextLabel")
		ht.BackgroundTransparency = 1
		ht.Size = UDim2.new(1, -16, 0, 26)
		ht.Position = UDim2.fromOffset(12, 12)
		ht.Font = Enum.Font.GothamBlack
		ht.TextSize = 18
		ht.TextColor3 = C.accent2
		ht.TextXAlignment = Enum.TextXAlignment.Left
		ht.Text = "VOIDZ HUB"
		ht.Parent = hero
		local hs = Instance.new("TextLabel")
		hs.BackgroundTransparency = 1
		hs.Size = UDim2.new(1, -16, 0, 50)
		hs.Position = UDim2.fromOffset(12, 42)
		hs.Font = Enum.Font.Gotham
		hs.TextSize = 11
		hs.TextColor3 = C.muted
		hs.TextXAlignment = Enum.TextXAlignment.Left
		hs.TextYAlignment = Enum.TextYAlignment.Top
		hs.TextWrapped = true
		hs.Text = "Search above for anything · or use the tabs.\nCombat · Players · Grab · Auras · Protect · Toys"
		hs.Parent = hero

		section(sc, "TABS", n())
		local guide = Instance.new("TextLabel")
		guide.LayoutOrder = n()
		guide.Size = UDim2.new(1, -6, 0, 150)
		guide.BackgroundColor3 = C.card
		guide.BorderSizePixel = 0
		guide.Font = Enum.Font.Gotham
		guide.TextSize = 11
		guide.TextColor3 = C.text
		guide.TextXAlignment = Enum.TextXAlignment.Left
		guide.TextYAlignment = Enum.TextYAlignment.Top
		guide.TextWrapped = true
		guide.Text = " Combat — kick / fling / kill a DUMBASS NIGGA\n Players — pick a HOE + actions\n Control — look + = to drive their bitch ass\n Grab — hold / release + scroll distance\n Auras — near-you effects (HELL YEAH)\n Server — whole map shit\n Loops — keep doing it NO CAP NIGGA\n Protect — anti-grab / anti-status BULLSHIT\n Movement · Visuals · Toys · Explosions · World · Auto\n Misc — console / forms · Config — keys"
		guide.Parent = sc
		corner(guide, 8)
		pad(guide, 8, 8, 8, 8)
		stroke(guide, C.strokeSoft, 1)

		section(sc, "STATUS", n())
		makeButton(sc, { order = n(), title = "Link Game Remotes", tip = "Refresh remotes if features stop working", callback = function()
			local ok = resolveFTAP()
			notify(HUB_NAME, ok and _Vzd({119,138,146,148,153,138,152,69,145,142,147,144,138,137}) or _Vzd({120,153,142,145,145,69,145,148,134,137,142,147,140,69,151,138,146,148,153,138,152,75}), 2)
		end })
		local st = Instance.new("TextLabel")
		st.LayoutOrder = n()
		st.Size = UDim2.new(1, -6, 0, 54)
		st.BackgroundColor3 = C.card
		st.BorderSizePixel = 0
		st.Font = Enum.Font.Code
		st.TextSize = 11
		st.TextColor3 = C.muted
		st.TextXAlignment = Enum.TextXAlignment.Left
		st.TextYAlignment = Enum.TextYAlignment.Top
		st.TextWrapped = true
		st.Text = " Build: " .. BUILD .. "\n Place: " .. tostring(game.PlaceId) .. "\n Key: VOIDZHUB"
		st.Parent = sc
		corner(st, 8)
		pad(st, 8, 8, 8, 8)
		S.homeStatus = st
end
_TAB_BUILDERS["combat"] = function(sc, n)
		section(sc, "HIT ONE PERSON", n())
		makeDropdown(sc, {
			order = n(),
			title = _Vzd({109,148,156,69,121,148,69,112,142,136,144}),
			options = KICK_TYPES,
			default = S.kickType or _Vzd({120,144,158,69,102,147,136,141,148,151}),
			callback = function(v) S.kickType = v end,
			tip = "Sky Anchor / Float Pin ownership kicks",
		})
		if not S.kickType then S.kickType = _Vzd({120,144,158,69,102,147,136,141,148,151}) end
		makePlayerSearchList(sc, {
			clickFn = function(p) S.selected = p; toggleLoopTarget(p) end,
		}, n)
		local function runOnTarget(label, fn)
			local p = combatTarget()
			if not p then
				notify(HUB_NAME, "No target — pick Who", 1.5)
				return
			end
			notify(HUB_NAME, label .. " → " .. playerLabel(p), 1.2)
			task.spawn(function()
				local ok, err = pcall(fn, p)
				if not ok then
					warn("[VOIDZ] combat", err)
					notify(HUB_NAME, "Err: " .. tostring(err):sub(1, 40), 2)
				end
			end)
		end
		section(sc, _Vzd({109,116,122,120,106,69,84,69,117,113,116,121}), n())
		if S.toggles.plotAmbush == nil then S.toggles.plotAmbush = true end
		if S.toggles.plotPullTry == nil then S.toggles.plotPullTry = true end
		makeToggle(sc, {
			order = n(), id = _Vzd({149,145,148,153,102,146,135,154,152,141}), title = "Ambush On Plot Exit",
			tip = "If they are in a house: alert you, wait, then auto-grab + attack when they walk out",
			desc = "Default ON · kills, flings, loops, auras",
			callback = function(on)
				S.toggles.plotAmbush = on
				notify(HUB_NAME, _Vzd({117,145,148,153,69,134,146,135,154,152,141,69}) .. (on and "ON" or "OFF"), 1.5)
			end,
		})
		makeToggle(sc, {
			order = n(), id = "plotPullTry", title = "Try Pull From House",
			tip = "Best-effort CreateGrabLine / extend while still in plot (often fails — exit ambush is reliable)",
			desc = _Vzd({105,138,139,134,154,145,153,69,116,115,69,220,69,107,121,102,117,69,154,152,154,134,145,145,158,69,135,145,148,136,144,152,69,139,154,145,145,69,148,156,147,138,151,152,141,142,149,69,142,147,152,142,137,138,69,149,145,148,153,152}),
			callback = function(on)
				S.toggles.plotPullTry = on
				notify(HUB_NAME, _Vzd({109,148,154,152,138,69,149,154,145,145,69,153,151,158,69}) .. (on and "ON" or "OFF"), 1.5)
			end,
		})
		makeButton(sc, {
			order = n(), title = _Vzd({108,151,134,135,69,120,138,145,138,136,153,138,137,69,116,147,69,106,157,142,153}),
			tip = _Vzd({118,154,138,154,138,69,152,138,145,138,136,153,138,137,69,220,69,134,154,153,148,82,140,151,134,135,69,153,141,138,69,139,151,134,146,138,69,153,141,138,158,69,145,138,134,155,138,69,153,141,138,142,151,69,141,148,154,152,138}),
			callback = function()
				local p = combatTarget()
				if not p then notify(HUB_NAME, "Select a player", 1.5); return end
				if isInSafePlot(p) then
					plotWatch[p.UserId] = { kind = "grab", quiet = false }
					notify(HUB_NAME, playerLabel(p) .. " in house · will grab on exit", 2)
					if S.toggles.plotPullTry then task.spawn(tryPullFromPlot, p) end
				else
					task.spawn(function() forceGrabOnExit(p) end)
					notify(HUB_NAME, "Grabbed " .. playerLabel(p) .. " (not in house)", 1.5)
				end
			end,
		})
		makeButton(sc, {
			order = n(), title = _Vzd({103,145,148,135,146,134,147,69,106,157,153,151,134,136,153,69,107,151,148,146,69,117,145,148,153}),
			danger = true,
			tip = "Spawns blobman → mounts → CreatureGrab target in their plot (bypasses house protection)",
			callback = function()
				local p = combatTarget()
				if not p then notify(HUB_NAME, "Select a player", 1.5); return end
				notify(HUB_NAME, "Blobman extract → " .. playerLabel(p), 1.2)
				task.spawn(function() blobGrabSingle(p) end)
			end,
		})
		makeButton(sc, {
			order = n(), title = "Blobman Extract All From Plots",
			danger = true,
			tip = "Spawns blobman → CreatureGrab every player in plots",
			callback = function()
				notify(HUB_NAME, "Blobman extract ALL from plots", 1.5)
				task.spawn(function()
					for _, p in ipairs(Players:GetPlayers()) do
						if p ~= LP and validP(p) and isInSafePlot(p) then
							blobGrabSingle(p)
							task.wait(0.3)
						end
					end
				end)
			end,
		})
		section(sc, _Vzd({102,104,121,110,116,115,120,69,77,152,138,145,138,136,153,138,137,69,149,145,134,158,138,151,78}), n())
		makeButton(sc, {
			order = n(), title = _Vzd({121,117,69,121,148,69,121,141,138,146}), tip = _Vzd({121,138,145,138,149,148,151,153,69,153,148,69,153,141,138,69,152,138,145,138,136,153,138,137,69,149,145,134,158,138,151}),
			callback = function()
				runOnTarget("TP", function(p)
					local r = rootOf(p)
					if r then teleportSelf(CFrame.new(r.Position + Vector3.new(0, 0, -5))) end
				end)
			end,
		})
		makeButton(sc, {
			order = n(), title = "Throw Them", danger = true, tip = _Vzd({107,145,142,147,140,69,152,138,145,138,136,153,138,137,69,77,146,134,149,82,156,142,137,138,69,155,142,152,142,153,69,120,115,116,78}),
			callback = function()
				runOnTarget(_Vzd({121,141,151,148,156}), function(p) flingPlayer(p, S.flingPower, false, true) end)
			end,
		})
		makeButton(sc, {
			order = n(), title = _Vzd({112,142,136,144,69,121,141,138,146}), danger = true, tip = "Kick selected with kick type",
			callback = function()
				runOnTarget("Kick", function(p) kickPlayer(p, S.kickType or "Hard", false) end)
			end,
		})
		makeButton(sc, {
			order = n(), title = "Kill Them", danger = true, tip = "Kill selected",
			callback = function()
				runOnTarget("Kill", function(p) killPlayer(p, false) end)
			end,
		})
		makeButton(sc, {
			order = n(), title = _Vzd({103,151,142,147,140,69,121,141,138,146,69,109,138,151,138}), tip = _Vzd({117,154,145,145,69,152,138,145,138,136,153,138,137,69,153,148,69,158,148,154}),
			callback = function()
				runOnTarget("Bring", function(p) bringPlayer(p, nil, false) end)
			end,
		})
		makeButton(sc, {
			order = n(), title = "Ragdoll Them", tip = "Ragdoll selected",
			callback = function()
				runOnTarget("Ragdoll", function(p) ragdoll(p, true) end)
			end,
		})
		makeButton(sc, {
			order = n(), title = _Vzd({123,148,142,137,69,121,141,138,146}), danger = true, tip = _Vzd({120,145,134,146,69,152,138,145,138,136,153,138,137,69,142,147,153,148,69,155,148,142,137}),
			callback = function()
				runOnTarget("Void", function(p) voidPlayer(p, false) end)
			end,
		})
		makeButton(sc, { order = n(), title = _Vzd({103,154,151,147,69,121,141,138,146}), danger = true, tip = "Apply fire via status toy", callback = function()
			runOnTarget("Burn", function(p) applyStatusToPlayer("fire", p) end)
		end })
		makeButton(sc, { order = n(), title = "Poison Them", danger = true, tip = _Vzd({102,149,149,145,158,69,149,148,142,152,148,147,69,155,142,134,69,141,154,151,153,69,149,134,151,153,152}), callback = function()
			runOnTarget(_Vzd({117,148,142,152,148,147}), function(p) local r = rootOf(p); if r then applyMapPoison(r) end end)
		end })
		makeButton(sc, { order = n(), title = _Vzd({107,151,138,138,159,138,69,121,141,138,146}), tip = _Vzd({120,138,153,69,124,134,145,144,120,149,138,138,137,69,80,69,111,154,146,149,117,148,156,138,151,69,153,148,69,85}), callback = function()
			runOnTarget("Freeze", function(p)
				local h = p.Character and p.Character:FindFirstChildOfClass(_Vzd({109,154,146,134,147,148,142,137}))
				if h then h.WalkSpeed = 0; h.JumpPower = 0; h.JumpHeight = 0 end
			end)
		end })
		makeButton(sc, { order = n(), title = _Vzd({122,147,139,151,138,138,159,138,69,121,141,138,146}), tip = _Vzd({119,138,152,153,148,151,138,69,124,134,145,144,120,149,138,138,137,69,86,91,69,80,69,111,154,146,149,117,148,156,138,151,69,90,85}), callback = function()
			runOnTarget("Unfreeze", function(p)
				local h = p.Character and p.Character:FindFirstChildOfClass("Humanoid")
				if h then h.WalkSpeed = 16; h.JumpPower = 50; h.JumpHeight = 7.2 end
			end)
		end })
		makeButton(sc, { order = n(), title = _Vzd({114,134,152,152,145,138,152,152,69,108,151,134,135}), tip = _Vzd({114,134,144,138,69,140,151,134,135,135,138,137,69,149,134,151,153,69,146,134,152,152,145,138,152,152,69,139,148,151,69,138,134,152,142,138,151,69,139,145,142,147,140,142,147,140}), callback = function()
			runOnTarget("Massless", function(p)
				local r = rootOf(p)
				if r then pcall(function() r.Massless = true end) end
			end)
		end })

		section(sc, "BLOB MAIN GRAB", n())
		local blobNote = Instance.new(_Vzd({121,138,157,153,113,134,135,138,145}))
		blobNote.LayoutOrder = n()
		blobNote.Size = UDim2.new(1, -6, 0, 32)
		blobNote.BackgroundColor3 = C.card
		blobNote.BorderSizePixel = 0
		blobNote.Font = Enum.Font.Gotham
		blobNote.TextSize = 9
		blobNote.TextColor3 = C.muted
		blobNote.TextXAlignment = Enum.TextXAlignment.Left
		blobNote.TextWrapped = true
		blobNote.Text = "Spawns blobman + CreatureGrab. Works inside plots — bypasses house protection."
		blobNote.Parent = sc
		corner(blobNote, 8)
		pad(blobNote, 6, 6, 6, 6)
		makeButton(sc, { order = n(), title = _Vzd({103,145,148,135,69,108,151,134,135,69,120,138,145,138,136,153,138,137}), danger = true,
			tip = "Spawn blobman → TP to target → CreatureGrab (works in plots)",
			callback = function()
				local p = combatTarget()
				if not p then notify(HUB_NAME, _Vzd({120,138,145,138,136,153,69,134,69,149,145,134,158,138,151}), 1.5); return end
				notify(HUB_NAME, "Blob Grab → " .. playerLabel(p), 1.2)
				task.spawn(function() blobGrabSingle(p) end)
			end,
		})
		makeButton(sc, { order = n(), title = "Blob Grab All", danger = true,
			tip = "Spawn blobman → TP to every player → CreatureGrab all",
			callback = function()
				task.spawn(blobGrabAll)
			end,
		})
		makeButton(sc, { order = n(), title = _Vzd({103,145,148,135,69,108,151,134,135,69,113,148,148,149}), danger = true,
			tip = "Loop blob grab selected until toggled off · persists through rejoin",
			callback = function()
				local p = combatTarget()
				if not p then notify(HUB_NAME, _Vzd({120,138,145,138,136,153,69,134,69,149,145,134,158,138,151}), 1.5); return end
				startBlobGrabLoop(p)
			end,
		})


		section(sc, "AIM", n())
		makeToggle(sc, {
			order = n(),
			id = "silentAim",
			title = _Vzd({120,142,145,138,147,153,69,102,142,146}),
			tip = _Vzd({119,134,158,136,134,152,153,152,69,151,138,137,142,151,138,136,153,69,153,148,69,147,138,134,151,138,152,153,69,149,145,134,158,138,151,69,77,152,136,151,138,138,147,82,136,138,147,153,138,151,69,107,116,123,78}),
			callback = function(on)
				setSilentAim(on)
			end,
		})
		makeToggle(sc, {
			order = n(),
			id = "fovCircle",
			title = "FOV Circle",
			tip = _Vzd({120,141,148,156,69,107,116,123,69,136,142,151,136,145,138,69,148,147,69,152,136,151,138,138,147,69,136,138,147,153,138,151}),
			default = true,
			callback = function(on)
				silentFovCircle = on
				if on and S.toggles.silentAim then _startFovCircle() end
				if not on then _stopFovCircle() end
			end,
		})
		makeSlider(sc, {
			order = n(),
			title = "FOV Range",
			min = 20,
			max = 500,
			default = S.silentFov or 150,
			stateKey = "silentFov",
			callback = function(v) silentFov = v; S.silentFov = v end,
		})
end
_TAB_BUILDERS[_Vzd({134,154,151,134,152})] = function(sc, n)
		section(sc, "MAP-WIDE AURAS", n())
		local auraNote = Instance.new("TextLabel")
		auraNote.LayoutOrder = n()
		auraNote.Size = UDim2.new(1, -6, 0, 40)
		auraNote.BackgroundColor3 = C.card
		auraNote.BorderSizePixel = 0
		auraNote.Font = Enum.Font.Gotham
		auraNote.TextSize = 10
		auraNote.TextColor3 = C.muted
		auraNote.TextXAlignment = Enum.TextXAlignment.Left
		auraNote.TextWrapped = true
		auraNote.Text = "Each aura uses its own target, range, and power settings.\nObject scanning is local by default; enable Extended Range for the selected object distance."
		auraNote.Parent = sc
		corner(auraNote, 8)
		pad(auraNote, 6, 6, 6, 6)
		if S.toggles.auraMapWide == nil then S.toggles.auraMapWide = false end
		makeToggle(sc, {
			order = n(), id = "auraMapWide", title = _Vzd({106,157,153,138,147,137,138,137,69,119,134,147,140,138,69,77,116,135,143,138,136,153,152,78}),
			tip = _Vzd({116,115,69,98,69,156,142,137,138,151,69,151,134,147,140,138,69,139,148,151,69,148,135,143,138,136,153,69,134,154,151,134,152,83,69,117,145,134,158,138,151,69,134,154,151,134,152,69,134,145,156,134,158,152,69,120,115,116,69,151,134,147,140,138,83}),
			desc = "SNO range ~30 studs for players always",
			callback = function(on)
				S.toggles.auraMapWide = on
				notify(HUB_NAME, "Aura range " .. (on and "extended" or "nearby only"), 1.5)
			end,
		})
		makeSlider(sc, {
			order = n(),
			title = _Vzd({116,135,143,138,136,153,69,105,142,152,153,134,147,136,138}),
			min = 10,
			max = 2000,
			default = S.auraRange or 50,
			stateKey = _Vzd({134,154,151,134,119,134,147,140,138}),
			callback = function(v)
				S.auraRange = v
				for _, cfg in pairs(S.auraCfg) do
					if not cfg._customRange then cfg.range = v end
				end
			end,
		})
		makeSlider(sc, {
			order = n(),
			title = _Vzd({102,154,151,134,69,117,148,156,138,151,69,84,69,107,145,142,147,140,69,120,153,151,138,147,140,153,141}),
			min = 400,
			max = 20000,
			default = 8000,
			step = 100,
			stateKey = "flingPower",
			callback = function(v)
				S.flingPower = v
				for _, cfg in pairs(S.auraCfg) do
					if not cfg._customPower then cfg.power = v end
				end
			end,
		})
		makeDropdown(sc, {
			order = n(), title = _Vzd({121,138,145,138,144,142,147,138,152,142,152,69,120,141,134,149,138}),
			options = { _Vzd({121,148,151,147,134,137,148}), "Blackhole" },
			default = S.tkShape or "Tornado",
			callback = function(v)
				S.tkShape = v
				notify(HUB_NAME, _Vzd({121,112,69,152,141,134,149,138,69,183,69}) .. v, 1.2)
			end,
		})
		section(sc, _Vzd({102,122,119,102,120,69,77,146,134,149,82,156,142,137,138,69,220,69,190,69,136,154,152,153,148,146,142,159,138,78}), n())
		for _, meta in ipairs(AURA_META) do
			makeAuraBlock(sc, n(), meta)
		end
end
_TAB_BUILDERS["server"] = function(sc, n)
		section(sc, "MAP-WIDE ACTIONS", n())
		local srvNote = Instance.new("TextLabel")
		srvNote.LayoutOrder = n()
		srvNote.Size = UDim2.new(1, -6, 0, 52)
		srvNote.BackgroundColor3 = C.card
		srvNote.BorderSizePixel = 0
		srvNote.Font = Enum.Font.Gotham
		srvNote.TextSize = 10
		srvNote.TextColor3 = C.muted
		srvNote.TextXAlignment = Enum.TextXAlignment.Left
		srvNote.TextYAlignment = Enum.TextYAlignment.Top
		srvNote.TextWrapped = true
		srvNote.Text = " Every toggle visits each player (any distance) then applies the effect.\n Same engine as auras — house campers get ambushed on exit.\n ⚠ Some features can kick YOU · start with lower intensity."
		srvNote.Parent = sc
		corner(srvNote, 8)
		pad(srvNote, 6, 6, 6, 6)

		section(sc, _Vzd({113,102,108,69,84,69,105,106,120,121,119,116,126,69,120,106,119,123,106,119}), n())
		local lagNote = Instance.new("TextLabel")
		lagNote.LayoutOrder = n()
		lagNote.Size = UDim2.new(1, -6, 0, 52)
		lagNote.BackgroundColor3 = C.danger
		lagNote.BorderSizePixel = 0
		lagNote.Font = Enum.Font.Gotham
		lagNote.TextSize = 10
		lagNote.TextColor3 = C.dangerText
		lagNote.TextXAlignment = Enum.TextXAlignment.Left
		lagNote.TextYAlignment = Enum.TextYAlignment.Top
		lagNote.TextWrapped = true
		lagNote.Text = " ⚠ Lag can kick YOU or others — start intensity ~50-100.\n Lag = spam CreateGrabLine/SetNetworkOwner on everyone.\n Wreck = auto-spawn Blobman, ride it, grab every player."
		lagNote.Parent = sc
		corner(lagNote, 8)
		pad(lagNote, 6, 6, 6, 6)

		makeSlider(sc, {
			order = n(), title = _Vzd({113,134,140,69,110,147,153,138,147,152,142,153,158}), min = 1, max = 500, default = 150, step = 1,
			stateKey = "lagIntensity",
			tip = "Higher = more remote spam per wave (can kick you)",
		})
		makeToggle(sc, {
			order = n(), id = "lagServer", title = _Vzd({113,134,140,69,120,138,151,155,138,151}),
			tip = "Spam CreateGrabLine + SetNetworkOwner on whole server",
			callback = function(on)
				if on then setMassToggle("lagSrv", true, lagServerLoop) else stopMass("lagSrv") end
			end,
		})
		makeToggle(sc, {
			order = n(), id = "destroyServer", title = _Vzd({124,151,138,136,144,69,120,138,151,155,138,151,69,77,103,145,148,135,146,134,147,78}),
			tip = "Spawn Blobman, ride it, grab every player on the server",
			callback = function(on)
				if on then setMassToggle(_Vzd({137,138,152,153,151,148,158,120,151,155}), true, destroyServerLoop) else stopMass("destroySrv") end
			end,
		})
		makeButton(sc, {
			order = n(), title = _Vzd({120,153,148,149,69,113,134,140,69,84,69,124,151,138,136,144}), danger = true,
			tip = "Kill all lag and wreck loops instantly",
			callback = function()
				for _, name in ipairs({ _Vzd({145,134,140,120,151,155}), "softLag", "hardLag", "destroySrv", "destroyHyb", "blobSrv" }) do
					stopMass(name)
				end
				S.toggles.lagServer = false
				S.toggles.destroyServer = false
				notify(HUB_NAME, "Stopped", 1.5)
			end,
		})

		section(sc, "KILL / THROW / KICK", n())
		local killNote = Instance.new("TextLabel")
		killNote.LayoutOrder = n()
		killNote.Size = UDim2.new(1, -6, 0, 36)
		killNote.BackgroundColor3 = C.card
		killNote.BorderSizePixel = 0
		killNote.Font = Enum.Font.Gotham
		killNote.TextSize = 10
		killNote.TextColor3 = C.muted
		killNote.TextXAlignment = Enum.TextXAlignment.Left
		killNote.TextYAlignment = Enum.TextYAlignment.Top
		killNote.TextWrapped = true
		killNote.Text = " Loop toggles: repeats every cycle · camera locks at home while active.\n Kill = Dead state · Throw = fling · Kick = skyVel + destroy."
		killNote.Parent = sc
		corner(killNote, 8)
		pad(killNote, 6, 6, 6, 6)
		makeSlider(sc, {
			order = n(), title = _Vzd({104,158,136,145,138,69,105,138,145,134,158,69,77,152,138,136,78}), min = 0.1, max = 5, default = 0.2, step = 0.1,
			stateKey = "massCycleDelay",
			tip = _Vzd({120,138,136,148,147,137,152,69,135,138,153,156,138,138,147,69,138,134,136,141,69,139,154,145,145,69,149,134,152,152,69,134,136,151,148,152,152,69,134,145,145,69,149,145,134,158,138,151,152}),
		})
		makeToggle(sc, {
			order = n(), id = "mass_kill", title = _Vzd({113,148,148,149,69,112,142,145,145,69,102,145,145}), danger = true,
			tip = "Loop: visit each player → SNO → Humanoid:ChangeState(Dead). Camera locks home.",
			callback = function(on)
				if on then setMassToggle("kill", true, massKillLoop) else stopMass("kill") end
			end,
		})
		makeToggle(sc, {
			order = n(), id = "mass_fling", title = "Loop Throw All", danger = true,
			tip = "Loop: visit each player → applyFling (BodyVelocity). Camera locks home.",
			callback = function(on)
				if on then setMassToggle("fling", true, massFlingLoop) else stopMass("fling") end
			end,
		})
		makeToggle(sc, {
			order = n(), id = "mass_kick", title = _Vzd({113,148,148,149,69,112,142,136,144,69,102,145,145}), danger = true,
			tip = _Vzd({113,148,148,149,95,69,155,142,152,142,153,69,138,134,136,141,69,149,145,134,158,138,151,69,183,69,120,115,116,69,183,69,152,144,158,123,138,145,69,80,69,137,138,152,153,151,148,158,108,151,134,135,113,142,147,138,83,69,104,134,146,138,151,134,69,145,148,136,144,152,69,141,148,146,138,83}),
			callback = function(on)
				if on then setMassToggle("kick", true, massKickLoop) else stopMass("kick") end
			end,
		})

		section(sc, "BRING / RAGDOLL / BURN", n())
		local bringNote = Instance.new("TextLabel")
		bringNote.LayoutOrder = n()
		bringNote.Size = UDim2.new(1, -6, 0, 36)
		bringNote.BackgroundColor3 = C.card
		bringNote.BorderSizePixel = 0
		bringNote.Font = Enum.Font.Gotham
		bringNote.TextSize = 10
		bringNote.TextColor3 = C.muted
		bringNote.TextXAlignment = Enum.TextXAlignment.Left
		bringNote.TextYAlignment = Enum.TextYAlignment.Top
		bringNote.TextWrapped = true
		bringNote.Text = " Loop toggles: repeats every cycle · camera locks at home while active.\n Bring = pull to you · Ragdoll = BananaPeel · Burn = Campfire."
		bringNote.Parent = sc
		corner(bringNote, 8)
		pad(bringNote, 6, 6, 6, 6)
		makeToggle(sc, {
			order = n(), id = _Vzd({146,134,152,152,132,135,151,142,147,140}), title = "Loop Bring All",
			tip = _Vzd({113,148,148,149,95,69,155,142,152,142,153,69,138,134,136,141,69,149,145,134,158,138,151,69,183,69,120,115,116,69,183,69,149,154,145,145,69,153,148,69,158,148,154,151,69,149,148,152,142,153,142,148,147,83,69,104,134,146,138,151,134,69,145,148,136,144,152,69,141,148,146,138,83}),
			callback = function(on)
				if on then setMassToggle("bring", true, massBringLoop) else stopMass("bring") end
			end,
		})
		makeToggle(sc, {
			order = n(), id = "mass_ragdoll", title = "Loop Ragdoll All", danger = true,
			tip = _Vzd({113,148,148,149,95,69,152,149,134,156,147,152,69,107,148,148,137,103,134,147,134,147,134,69,183,69,153,148,154,136,141,138,152,69,103,134,147,134,147,134,117,138,138,145,69,153,148,69,138,134,136,141,69,149,145,134,158,138,151,83,69,104,134,146,138,151,134,69,145,148,136,144,152,69,141,148,146,138,83}),
			callback = function(on)
				if on then setMassToggle("ragdoll", true, massRagdollLoop) else stopMass("ragdoll") end
			end,
		})
		makeToggle(sc, {
			order = n(), id = "mass_fire", title = _Vzd({113,148,148,149,69,103,154,151,147,69,102,145,145}), danger = true,
			tip = "Loop: spawns Campfire → touches FirePlayerPart to each player. Camera locks home.",
			callback = function(on)
				if on then setMassToggle("fire", true, massFireLoop) else stopMass("fire") end
			end,
		})

		section(sc, "LOOP VOMIT (MAP-WIDE)", n())
		local vomitNote = Instance.new("TextLabel")
		vomitNote.LayoutOrder = n()
		vomitNote.Size = UDim2.new(1, -6, 0, 36)
		vomitNote.BackgroundColor3 = C.card
		vomitNote.BorderSizePixel = 0
		vomitNote.Font = Enum.Font.Gotham
		vomitNote.TextSize = 10
		vomitNote.TextColor3 = C.muted
		vomitNote.TextXAlignment = Enum.TextXAlignment.Left
		vomitNote.TextYAlignment = Enum.TextYAlignment.Top
		vomitNote.TextWrapped = true
		vomitNote.Text = " Spawns FoodBanana on each player → holds it → uses it (triggers eat + vomit).\n Loops so they keep eating and puking. Rate adjustable."
		vomitNote.Parent = sc
		corner(vomitNote, 8)
		pad(vomitNote, 6, 6, 6, 6)
		makeSlider(sc, {
			order = n(), title = "Vomit Rate (sec)", min = 0.5, max = 5, default = 2, step = 0.5,
			stateKey = "vomitRate",
			tip = "Seconds between each vomit cycle",
		})
		makeToggle(sc, {
			order = n(), id = _Vzd({146,134,152,152,132,155,148,146,142,153}), title = "Loop Vomit Everyone",
			tip = _Vzd({120,149,134,156,147,69,107,148,148,137,103,134,147,134,147,134,69,183,69,141,148,145,137,69,156,142,153,141,69,153,134,151,140,138,153,69,183,69,154,152,138,69,77,153,151,142,140,140,138,151,152,69,138,134,153,69,80,69,155,148,146,142,153,78}),
			callback = function(on)
				if on then
					setMassToggle("vomit", true, function(keep)
						local home = hrp() and hrp().CFrame
						local overview = home and CFrame.lookAt(home.Position + Vector3.new(-15, 22, 8), home.Position) or CFrame.new(0, 50, 0)
						if home then freezeCam(overview) end
						notify(HUB_NAME, _Vzd({123,148,146,142,153,69,113,148,148,149,69,116,115}), 2)
						local bananaModel, bananaPrimary = nil, nil
						while keep() do
							for _, p in ipairs(allTargets()) do
								if not keep() then break end
								if validP(p) and p.Character then
									local r = rootOf(p)
									if r then
										pcall(function()
											if not bananaModel or not bananaModel.Parent then
												bananaModel, bananaPrimary = ensureToy("FoodBanana")
											end
											if not bananaModel or not bananaPrimary then return end
											local peel = nil
											for _, d in ipairs(bananaModel:GetDescendants()) do
												if d.Name == "BananaPeel" and d:FindFirstChildOfClass("TouchTransmitter") then
													peel = d
													break
												end
											end
											local holdPart = bananaModel:FindFirstChild("HoldPart", true)
											local holdRF = holdPart and holdPart:FindFirstChild("HoldItemRemoteFunction")
											local rigid = holdPart and holdPart:FindFirstChild("RigidConstraint")
											local ediblePart = bananaModel:FindFirstChild("EdiblePart", true)
											if peel then
												peel.Size = Vector3.new(2, 2, 2)
												peel.Transparency = 1
												peel.CanCollide = false
											end
											local ao = bananaPrimary:FindFirstChildOfClass("AlignOrientation")
											if ao then ao.Enabled = false end
											local head = LP.Character and LP.Character:FindFirstChild("Head")
											local parkY = head and (head.Position.Y + 500) or 500
											local bp = bananaPrimary:FindFirstChild("VOIDZ_VomitPark")
											if not bp then
												bp = Instance.new("BodyPosition")
												bp.Name = "VOIDZ_VomitPark"
												bp.MaxForce = Vector3.new(12500, 12500, 12500)
												bp.P = 12500
												bp.Parent = bananaPrimary
											end
											bp.Position = Vector3.new(0, parkY, 0)
											sno(bananaPrimary)
											for _, d in ipairs(bananaModel:GetDescendants()) do
												if d:IsA("BasePart") then d.CanCollide = false end
											end
											local alreadyHeld = rigid and rigid:FindFirstChild("Attachment1")
											if not alreadyHeld and holdRF then
												pcall(function() holdRF:InvokeServer(bananaModel, p.Character) end)
												task.wait(0.2)
											end
											if peel and r then
												sno(peel, r.Position)
												peel.Position = r.Position
												task.wait()
												peel.Position = bananaPrimary.Position
											end
											local eating = holdPart and holdPart:FindFirstChild("EatingSound")
											local he = ReplicatedStorage:FindFirstChild("HoldEvents")
											local useEvt = he and he:FindFirstChild("Use")
											if useEvt and (not eating or not eating.IsPlaying) then
												pcall(function() useEvt:FireServer(bananaModel) end)
											end
										end)
										task.wait(0.15)
									end
								end
							end
							local rate = tonumber(S.vomitRate) or 2
							task.wait(rate)
						end
						unfreezeCam()
						notify(HUB_NAME, _Vzd({123,148,146,142,153,69,113,148,148,149,69,116,107,107}), 1.5)
					end)
				else
					stopMass(_Vzd({155,148,146,142,153}))
				end
			end,
		})
		makeButton(sc, {
			order = n(), title = _Vzd({120,153,148,149,69,102,145,145,69,120,138,151,155,138,151}), danger = true,
			tip = _Vzd({112,142,145,145,69,138,155,138,151,158,69,152,138,151,155,138,151,82,156,142,137,138,69,145,148,148,149,69,134,153,69,148,147,136,138}),
			callback = function()
				for _, name in ipairs({ "lagSrv", _Vzd({152,148,139,153,113,134,140}), "hardLag", "destroySrv", "destroyHyb", "blobSrv", "kill", _Vzd({139,145,142,147,140}), "kick", "bring", "ragdoll", "fire", "banana", "paint", "vomit" }) do
					stopMass(name)
				end
				S.toggles.lagServer = false
				S.toggles.destroyServer = false
				S.toggles.mass_kill = false
				S.toggles.mass_fling = false
				S.toggles.mass_kick = false
				S.toggles.mass_bring = false
				S.toggles.mass_ragdoll = false
				S.toggles.mass_fire = false
				S.toggles.mass_vomit = false
				notify(HUB_NAME, _Vzd({102,145,145,69,152,138,151,155,138,151,69,145,148,148,149,152,69,152,153,148,149,149,138,137}), 1.5)
			end,
		})
end
_TAB_BUILDERS["grab"] = function(sc, n)
		section(sc, _Vzd({120,104,119,116,113,113,69,105,110,120,121,102,115,104,106}), n())
		makeToggle(sc, {
			order = n(),
			id = "lineExtend",
			title = _Vzd({120,136,151,148,145,145,69,105,142,152,153,134,147,136,138}),
			tip = "How far you can grab + hold. Scroll wheel while holding to stretch.",
			desc = _Vzd({120,138,149,134,151,134,153,138,69,139,151,148,146,69,114,134,152,152,145,138,152,152,69,108,151,134,135,69,135,138,145,148,156}),
			callback = function(on)
				setLineExtend(on)
			end,
		})
		makeSlider(sc, {
			order = n(),
			title = "Scroll Distance",
			min = 11,
			max = 120,
			default = S.extendAmount or 25,
			stateKey = "extendAmount",
			callback = function(v)
				S.extendAmount = v
				if pcDistance > 0 and pcDistance < v then pcDistance = v end
				if S.toggles.lineExtend then
					forceGrabDistance(v)
					applyLineExtendDistance(v)
				end
			end,
		})
		makeSlider(sc, {
			order = n(),
			title = _Vzd({124,141,138,138,145,69,120,153,138,149}),
			min = 1,
			max = 10,
			default = S.scrollStep or 2,
			callback = function(v) S.scrollStep = v end,
		})
		section(sc, _Vzd({108,119,102,103,69,113,110,115,106}), n())
		makeToggle(sc, {
			order = n(), id = _Vzd({142,147,155,142,152,113,142,147,138}), title = _Vzd({110,147,155,142,152,142,135,145,138,69,113,142,147,138}),
			tip = "Empty CreateGrabLine on grab to hide the line. Off if Crazy Line is on.",
			callback = function(on)
				setInvisibleLine(on)
				if on then installGrabWatch() end
			end,
		})
		makeToggle(sc, {
			order = n(), id = _Vzd({136,151,134,159,158,113,142,147,138}), title = "Crazy Line (Soft Lag)",
			tip = "Spam CreateGrabLine on every player torso (soft lag). Disables Invisible Line.",
			callback = function(on)
				setCrazyLine(on)
			end,
		})
		section(sc, _Vzd({124,109,106,115,69,126,116,122,69,113,106,121,69,108,116}), n())
		local info = Instance.new("TextLabel")
		info.LayoutOrder = n()
		info.Size = UDim2.new(1, -6, 0, 40)
		info.BackgroundColor3 = C.card
		info.BorderSizePixel = 0
		info.Font = Enum.Font.Gotham
		info.TextSize = 10
		info.TextColor3 = C.muted
		info.TextXAlignment = Enum.TextXAlignment.Left
		info.TextYAlignment = Enum.TextYAlignment.Top
		info.TextWrapped = true
		info.Text = " Turn these on, grab something, then release.\n Effects apply when you let go."
		info.Parent = sc
		corner(info, 8)
		pad(info, 6, 6, 6, 6)
		installGrabWatch()

		makeToggle(sc, {
			order = n(), id = _Vzd({140,151,134,135,107,145,142,147,140,116,147}), title = _Vzd({121,141,151,148,156,69,124,141,138,147,69,113,138,153,69,108,148}),
			tip = _Vzd({117,151,138,82,134,151,146,152,69,103,148,137,158,123,138,145,148,136,142,153,158,69,156,141,142,145,138,69,158,148,154,69,141,148,145,137,69,220,69,139,142,151,138,152,69,148,147,69,151,138,145,138,134,152,138,69,134,145,148,147,140,69,136,134,146,138,151,134}),
			desc = "Grab → release to yeet · works on players + objects",
			callback = function(on)
				S.grabFling = on
				S.toggles.grabFlingOn = on
				installGrabWatch()
				notify(HUB_NAME, _Vzd({121,141,151,148,156,69,124,141,138,147,69,113,138,153,69,108,148,69}) .. (on and "ON" or "OFF"), 1)
			end,
		})
		makeSlider(sc, {
			order = n(), title = "Throw Strength", min = 0, max = 500, default = 80, stateKey = "grabFlingPower",
		})
		makeToggle(sc, {
			order = n(), id = "grabSpinOn", title = _Vzd({120,149,142,147,69,124,141,138,147,69,113,138,153,69,108,148}),
			tip = "Spin what you release",
			callback = function(on) S.grabSpin = on; if on then installGrabWatch() end end,
		})
		makeToggle(sc, {
			order = n(), id = "spinWhileHold", title = "Spin While Holding",
			tip = "Spin object while you hold it",
			callback = function(on) if on then installGrabWatch() end end,
		})
		makeSlider(sc, {
			order = n(), title = "Spin Speed", min = 1, max = 500, default = 80, stateKey = _Vzd({140,151,134,135,120,149,142,147,120,149,138,138,137}),
		})
		makeToggle(sc, {
			order = n(), id = "grabGravOn", title = _Vzd({113,134,154,147,136,141,69,122,149,69,124,141,138,147,69,113,138,153,69,108,148}),
			tip = _Vzd({120,138,147,137,69,142,153,69,154,149,156,134,151,137,69,148,147,69,151,138,145,138,134,152,138}),
			callback = function(on) S.grabGravity = on; if on then installGrabWatch() end end,
		})
		makeSlider(sc, {
			order = n(), title = _Vzd({108,151,134,155,142,153,158,69,107,148,151,136,138}), min = 0, max = 20000, default = 5000, step = 100, stateKey = "grabGravityForce",
		})
		makeToggle(sc, {
			order = n(), id = "grabZeroGOn", title = "Zero-G While Holding",
			tip = _Vzd({107,145,148,134,153,69,156,141,134,153,69,158,148,154,69,141,148,145,137,69,77,103,148,137,158,107,148,151,136,138,69,154,149,78}),
			callback = function(on) S.grabZeroG = on; if on then installGrabWatch() end end,
		})
		makeSlider(sc, {
			order = n(), title = "Zero-G Force", min = 0, max = 100000, default = 50000, step = 1000, stateKey = "grabZeroGForce",
		})
		makeToggle(sc, {
			order = n(), id = "grabFreezeOn", title = _Vzd({107,151,138,138,159,138,69,148,147,69,119,138,145,138,134,152,138}),
			tip = _Vzd({113,148,136,144,69,151,138,145,138,134,152,138,137,69,149,134,151,153,152,84,149,145,134,158,138,151,152,69,142,147,69,149,145,134,136,138,69,77,103,148,137,158,117,148,152,142,153,142,148,147,78}),
			callback = function(on) S.grabFreeze = on; if on then installGrabWatch() end end,
		})
		makeToggle(sc, {
			order = n(), id = "grabFollowOn", title = "Item Follow Feet",
			tip = _Vzd({119,138,145,138,134,152,138,137,69,142,153,138,146,152,69,139,148,145,145,148,156,69,154,147,137,138,151,69,158,148,154,151,69,139,138,138,153}),
			callback = function(on) S.grabFollow = on; if on then installGrabWatch() end end,
		})
		makeSlider(sc, {
			order = n(), title = _Vzd({107,148,145,145,148,156,69,120,149,138,138,137}), min = 0, max = 100, default = 50, stateKey = "grabFollowSpeed",
		})
		makeButton(sc, {
			order = n(), title = "Clear All Grab Forces", danger = true,
			callback = function()
				for part, _ in pairs(effectParts) do clearPartForces(part) end
				effectParts = {}
				notify(HUB_NAME, "Cleared forces", 1.5)
			end,
		})

		section(sc, "WHILE YOU HOLD", n())
		makeToggle(sc, {
			order = n(), id = "superStr", title = _Vzd({120,154,149,138,151,69,121,141,151,148,156,69,116,147,69,119,138,145,138,134,152,138}),
			tip = "Launch grabbed object on release along camera",
			callback = function(on)
				S.superStrength = on
				S.toggles.superStr = on
				if on then installGrabWatch() end
			end,
		})
		makeSlider(sc, {
			order = n(), title = _Vzd({120,154,149,138,151,69,121,141,151,148,156,69,120,153,151,138,147,140,153,141}), min = 400, max = 20000, default = 4000, step = 100,
			stateKey = "superStrengthPower",
		})
		makeToggle(sc, {
			order = n(), id = "masslessGrab", title = "Massless Grab",
			tip = "Massless Grab: max AlignPosition / AlignOrientation force while holding (not scroll distance)",
			desc = _Vzd({109,148,145,137,69,139,138,138,145,152,69,140,145,154,138,137,69,220,69,137,148,138,152,69,147,148,153,69,136,141,134,147,140,138,69,141,148,156,69,139,134,151,69,158,148,154,69,136,134,147,69,140,151,134,135}),
			callback = function(on)
				S.masslessGrab = on
				S.toggles.masslessGrab = on
				if on then
					installGrabWatch()
					for _, ch in ipairs(workspace:GetChildren()) do
						if ch.Name == "GrabParts" then onGrabPartsAdded(ch) end
					end
				end
			end,
		})
		makeToggle(sc, {
			order = n(), id = "noclipGrab", title = "Hold Through Walls",
			tip = "Held model CanCollide false while you hold",
			callback = function(on) S.noclipGrab = on; S.toggles.noclipGrab = on; if on then installGrabWatch() end end,
		})
		makeToggle(sc, {
			order = n(), id = "killGrab", title = _Vzd({112,142,145,145,69,124,141,148,69,126,148,154,69,109,148,145,137}),
			tip = _Vzd({105,138,134,153,141,69,108,151,134,135,95,69,139,148,151,136,138,69,105,138,134,137,69,152,153,134,153,138,69,148,147,69,141,138,145,137,69,149,145,134,158,138,151}),
			callback = function(on) S.killGrab = on; S.toggles.killGrab = on; if on then installGrabWatch() end end,
		})
		makeToggle(sc, {
			order = n(), id = "ragdollGrab", title = "Ragdoll Grab",
			tip = _Vzd({110,147,152,153,134,147,153,69,151,134,140,137,148,145,145,69,156,141,142,145,138,69,141,148,145,137,142,147,140,69,134,69,149,145,134,158,138,151}),
			callback = function(on) S.ragdollGrab = on; S.toggles.ragdollGrab = on; if on then installGrabWatch() end end,
		})
		makeToggle(sc, {
			order = n(), id = "poisonGrab", title = "Poison Grab",
			tip = _Vzd({117,148,142,152,148,147,109,154,151,153,117,134,151,153,69,148,147,69,141,138,134,137,69,156,141,142,145,138,69,141,148,145,137,142,147,140,69,77,146,134,149,69,149,148,142,152,148,147,78}),
			callback = function(on) S.poisonGrab = on; S.toggles.poisonGrab = on; if on then installGrabWatch() end end,
		})
		makeToggle(sc, {
			order = n(), id = "burnGrab", title = _Vzd({103,154,151,147,69,108,151,134,135}),
			tip = "Campfire fire touch while holding",
			callback = function(on) S.burnGrab = on; S.toggles.burnGrab = on; if on then installGrabWatch() end end,
		})
		makeToggle(sc, {
			order = n(), id = "anchorGrab", title = _Vzd({107,151,138,138,159,138,69,124,141,134,153,69,126,148,154,69,109,148,145,137}),
			tip = "keep held part Anchored while you hold",
			callback = function(on) S.anchorGrab = on; S.toggles.anchorGrab = on; if on then installGrabWatch() end end,
		})
		makeToggle(sc, {
			order = n(), id = "radioactiveGrab", title = "Radioactive Grab",
			tip = "UFO PaintPlayerPart - paints target while holding (map-wide)",
			callback = function(on) S.radioactiveGrab = on; S.toggles.radioactiveGrab = on; if on then installGrabWatch() end end,
		})
		makeToggle(sc, {
			order = n(), id = _Vzd({154,147,136,148,145,145,142,152,142,148,147,108,151,134,135}), title = _Vzd({115,148,69,104,148,145,145,142,152,142,148,147,69,109,148,145,137}),
			tip = _Vzd({147,134,146,138,69,139,148,151,69,115,148,136,145,142,149,69,108,151,134,135}),
			callback = function(on)
				S.noclipGrab = on
				S.toggles.noclipGrab = on
				S.toggles.uncollisionGrab = on
				if on then installGrabWatch() end
			end,
		})
		makeSlider(sc, {
			order = n(), title = "Strength Multiplier", min = 1, max = 10, default = 1, step = 0.5,
			stateKey = _Vzd({152,153,151,138,147,140,153,141,114,154,145,153}),
			tip = _Vzd({152,153,151,138,147,140,153,141,69,146,154,145,153,142,149,145,142,138,151,69,139,148,151,69,139,145,142,147,140,69,84,69,152,154,149,138,151,69,152,153,151,138,147,140,153,141,69,84,69,151,138,155,138,147,140,138}),
		})
		section(sc, _Vzd({120,110,113,106,115,121,69,102,110,114,69,77,108,119,102,103,78}), n())
		makeToggle(sc, {
			order = n(), id = "palletSilentAim", title = "Pallet Silent Aim",
			tip = "Aim pallet throws at nearest player instead of camera direction",
			callback = function(on) S.toggles.palletSilentAim = on end,
		})
		makeToggle(sc, {
			order = n(), id = "shurikenSilentAim", title = "Shuriken Silent Aim",
			tip = _Vzd({102,142,146,69,152,141,154,151,142,144,138,147,84,144,154,147,134,142,69,153,141,151,148,156,152,69,134,153,69,147,138,134,151,138,152,153,69,149,145,134,158,138,151,69,142,147,152,153,138,134,137,69,148,139,69,136,134,146,138,151,134,69,137,142,151,138,136,153,142,148,147}),
			callback = function(on) S.toggles.shurikenSilentAim = on end,
		})
		section(sc, _Vzd({115,106,102,119,103,126,69,120,121,122,107,107}), n())
		makeToggle(sc, {
			order = n(), id = _Vzd({139,145,142,147,140,116,135,143,138,136,153,152}), title = "Throw Nearby Objects",
			tip = "SNO + fling non-player parts in aura range",
			callback = function(on)
				if on then setMassToggle("flingObj", true, massFlingObjectsLoop) else stopMass("flingObj") end
			end,
		})
		makeButton(sc, {
			order = n(), title = _Vzd({107,145,148,134,153,69,115,138,134,151,135,158,69,116,135,143,138,136,153,152,69,77,88,85,152,78}),
			tip = "BodyForce up on nearby objects for 30 seconds",
			callback = function() zeroGNearbyObjects(30) end,
		})
		makeButton(sc, {
			order = n(), title = _Vzd({103,134,145,145,148,148,147,69,116,147,69,120,138,145,138,136,153,138,137}),
			tip = "BombBalloon over selected player's head",
			callback = function() balloonTroll(S.selected) end,
		})
		makeButton(sc, {
			order = n(), title = _Vzd({103,134,145,145,148,148,147,69,116,147,69,106,155,138,151,158,148,147,138}),
			tip = _Vzd({121,141,151,148,156,69,135,134,145,145,148,148,147,152,69,148,155,138,151,69,138,155,138,151,158,69,149,145,134,158,138,151}),
			callback = function() balloonTroll(nil) end,
		})
		makeToggle(sc, { order = n(), id = "autoGrabNearest", title = "Auto-Grab Closest", tip = _Vzd({104,151,138,134,153,138,108,151,134,135,113,142,147,138,69,80,69,120,115,116,69,147,138,134,151,138,152,153}), callback = function(on)
			stopLoop("autoGrab")
			if on then startLoop("autoGrab", 0.25, function()
				if not FTAP.CreateGrabLine then return end
				local me = hrp(); if not me then return end
				local best, bd = nil, 50
				for _, p in ipairs(Players:GetPlayers()) do
					if validP(p) then
						local d = (rootOf(p).Position - me.Position).Magnitude
						if d < bd then best, bd = p, d end
					end
				end
				if best then
					local t = best.Character:FindFirstChild("Torso") or best.Character:FindFirstChild("UpperTorso") or rootOf(best)
					pcall(function() FTAP.CreateGrabLine:FireServer(t, t.CFrame) end)
					snoPlayer(best)
				end
			end) end
		end })
end
_TAB_BUILDERS["anti"] = function(sc, n)
		section(sc, _Vzd({117,119,116,121,106,104,121,69,114,106}), n())
		S.toggles.antiKick = (getgenv and type(getgenv) == "function" and getgenv().VOIDZ_ANTIKICK and getgenv().VOIDZ_ANTIKICK.enabled) == true
		makeToggle(sc, {
			order = n(), id = "antiKick", title = _Vzd({119,138,143,148,142,147,69,110,139,69,112,142,136,144,138,137}),
			tip = "Detect kick early → self-kick + rejoin BEFORE game AC finishes",
			desc = "Console + kick UI + Player:Kick · preemptive rejoin",
			callback = function(on)
				setAntiKick(on)
			end,
		})
		makeToggle(sc, {
			order = n(), id = "antiGucci", title = _Vzd({108,154,136,136,142,69,102,147,153,142,69,77,108,151,134,135,69,116,147,145,158,78}),
			tip = "Hard anti-grab: IsHeld + PartOwner + GrabParts · Struggle spam · DestroyGrabLine. Does NOT unsit Blobman/train.",
			desc = "ON → 40ms break loop · instant on grab · recommended",
			callback = function(on)
				S.toggles.antiGucci = on
				S.toggles.antiGrab = on
				S.antiWanted = S.antiWanted or {}
				S.antiWanted.antiGucci = on
				S.antiWanted.antiGrab = on
				installAntis()
				stopLoop("antiGrab")
				if on then
					startLoop(_Vzd({134,147,153,142,108,151,134,135}), 0.05, antiGrabTick)
					gucciBreakGrabNow()
					if doAntiGrabHard then doAntiGrabHard() end
					gucciAntiTick()
					notify(HUB_NAME, _Vzd({108,154,136,136,142,69,102,147,153,142,69,116,115,69,220,69,140,151,134,135,69,135,151,138,134,144,69,148,147,145,158,69,77,147,148,69,135,145,148,135,69,154,147,152,142,153,78}), 1.8)
				else
					local r = hrp()
					if r then r.Anchored = false end
					notify(HUB_NAME, "Gucci Anti OFF", 1.2)
				end
			end,
		})
		makeButton(sc, {
			order = n(),
			title = "Test Gucci Break Now",
			tip = _Vzd({107,148,151,136,138,69,148,147,138,69,139,154,145,145,69,134,147,153,142,82,140,151,134,135,69,135,154,151,152,153,69,77,120,153,151,154,140,140,145,138,69,80,69,105,138,152,153,151,148,158,108,151,134,135,113,142,147,138,78}),
			callback = function()
				installAntis()
				gucciBreakGrabNow()
				if doAntiGrabHard then doAntiGrabHard() end
				gucciAntiTick()
				notify(HUB_NAME, _Vzd({108,154,136,136,142,69,135,151,138,134,144,69,139,142,151,138,137}), 1.2)
			end,
		})
		makeToggle(sc, {
			order = n(), id = "antiTrain", title = "Anti Train / Blobman Seat",
			tip = _Vzd({107,148,151,136,138,69,154,147,152,142,153,69,142,139,69,152,148,146,138,148,147,138,69,152,153,142,136,144,152,69,158,148,154,69,148,147,69,134,69,153,151,134,142,147,69,148,151,69,135,145,148,135,69,152,138,134,153}),
			callback = function(on)
				S.toggles.antiBlobman = on
				stopLoop("antiBlob")
				if on then startLoop("antiBlob", 0.15, antiBlobmanTick) end
			end,
		})
		makeToggle(sc, {
			order = n(), id = "antiGrab", title = _Vzd({120,153,148,149,69,103,138,142,147,140,69,108,151,134,135,135,138,137}),
			tip = _Vzd({120,153,151,154,140,140,145,138,69,80,69,137,138,152,153,151,148,158,69,108,151,134,135,117,134,151,153,152,69,80,69,110,152,109,138,145,137,69,135,151,138,134,144}),
			callback = function(on)
				S.antiWanted = S.antiWanted or {}
				S.antiWanted.antiGrab = on
				S.toggles.antiGrab = on
				stopLoop("antiGrab")
				installAntis()
				notify(HUB_NAME, _Vzd({102,147,153,142,82,140,151,134,135,69}) .. (on and "ON" or "OFF"), 1.5)
				if on then
					if FTAP.Struggle then pcall(function() FTAP.Struggle:FireServer(LP) end) end
					startLoop("antiGrab", 0.1, antiGrabTick)
					doAntiGrabHard()
				else
					local r = hrp()
					if r then r.Anchored = false end
				end
			end,
		})
		makeToggle(sc, {
			order = n(), id = "autoCounter", title = _Vzd({102,154,153,148,69,102,153,153,134,136,144,138,151}),
			tip = "When someone grabs you or you're low HP: instantly attack them (mode below)",
			callback = function(on)
				S.autoCounter = on
				S.toggles.autoCounter = on
				S.revengeGrab = on
				S.toggles.revengeGrab = on
				S.antiWanted = S.antiWanted or {}
				if on then
					installAntis()
					stopLoop(_Vzd({134,154,153,148,107,145,142,147,140}))
					startLoop(_Vzd({134,154,153,148,107,145,142,147,140}), 0.08, function()
						if not S.autoCounter then return end
						if not isLocalVictimGrabbed() then return end
						local c = char()
						if not c then return end
						for _, bp in ipairs({ c:FindFirstChild("Head"), c:FindFirstChild("HumanoidRootPart"), c:FindFirstChild("Torso"), c:FindFirstChild("UpperTorso") }) do
							if bp then
								local po = bp:FindFirstChild("PartOwner")
								if po then
									local val = po.Value
									local grabberName = (typeof(val) == "Instance" and val:IsA("Player")) and val.Name or tostring(val or "")
									if grabberName ~= "" and grabberName ~= LP.Name then
										local grabberPlr = Players:FindFirstChild(grabberName)
										if grabberPlr and validP(grabberPlr) then
											counterAttackPlayer(grabberPlr, rootOf(grabberPlr))
											return
										end
									end
								end
							end
						end
						for _, child in ipairs(workspace:GetChildren()) do
							if child.Name == "GrabParts" and grabPartsIsAttackingUs(child, c) then
								for _, d in ipairs(child:GetDescendants()) do
									if d:IsA("WeldConstraint") or d:IsA("Weld") then
										for _, side in ipairs({ d.Part0, d.Part1 }) do
											if side and side:IsA(_Vzd({103,134,152,138,117,134,151,153})) and not side:IsDescendantOf(c) then
												local m = side:FindFirstAncestorOfClass("Model")
												local plr = m and Players:GetPlayerFromCharacter(m)
												if plr and plr ~= LP and validP(plr) then
													counterAttackPlayer(plr, rootOf(plr))
													return
												end
											end
										end
									end
								end
							end
						end
					end)
					notify(HUB_NAME, _Vzd({102,154,153,148,69,102,153,153,134,136,144,138,151,69,116,115,69,220,69}) .. (S.counterMode or "Repulsion"), 2)
				else
					stopLoop("autoFling")
					S.antiWanted.antiGrab = false
				end
			end,
		})
		makeDropdown(sc, {
			order = n(), title = _Vzd({107,145,142,147,140,69,114,148,137,138}),
			options = { "Repulsion", "Freeze", "Death", "Kick" },
			default = S.counterMode or "Repulsion",
			callback = function(v)
				S.counterMode = v
				notify(HUB_NAME, "Fling → " .. v, 1.2)
			end,
		})
		makeSlider(sc, {
			order = n(), title = _Vzd({102,153,153,134,136,144,69,107,148,151,136,138}), min = 2000, max = 30000, default = 12000, step = 500,
			stateKey = "revengeForce",
			tip = "Force multiplier for auto attacker",
		})
		makeToggle(sc, { order = n(), id = "antiFling", title = _Vzd({102,147,153,142,82,107,145,142,147,140}), tip = _Vzd({127,138,151,148,69,138,157,153,151,138,146,138,69,155,138,145,148,136,142,153,158}), callback = function(on)
			stopLoop("antiFling")
			if on then startLoop("antiFling", 0.12, antiFlingTick) end
		end })
		makeToggle(sc, {
			order = n(), id = "antiBurn", title = "Anti-Burn / Fire",
			tip = "Extinguish fire as soon as it applies",
			callback = function(on)
				S.toggles.antiBurn = on
				stopLoop("antiBurn")
				installAntis()
				if on then startLoop("antiBurn", 0.15, antiBurnTick) end
			end,
		})
		makeToggle(sc, {
			order = n(), id = "antiPaint", title = "Anti-Paint",
			tip = _Vzd({120,153,151,142,149,69,149,134,142,147,153,84,152,149,151,134,158,69,138,139,139,138,136,153,152}),
			callback = function(on)
				S.toggles.antiPaint = on
				stopLoop("antiPaint")
				if on then startLoop(_Vzd({134,147,153,142,117,134,142,147,153}), 0.15, antiPaintTick) end
			end,
		})
		makeToggle(sc, { order = n(), id = _Vzd({134,147,153,142,103,134,147,134,147,134}), title = "Anti-Banana / Slip", tip = "Remove banana/slip + unsit", callback = function(on)
			stopLoop(_Vzd({134,147,153,142,103,134,147,134,147,134}))
			if on then startLoop("antiBanana", 0.15, antiBananaTick) end
		end })
		makeToggle(sc, { order = n(), id = "antiVoid", title = "Anti-Void", tip = _Vzd({119,138,152,136,154,138,69,142,139,69,158,148,154,69,139,134,145,145,69,153,148,148,69,145,148,156}), callback = function(on)
			stopLoop("antiVoid")
			if on then
				pcall(function() workspace.FallenPartsDestroyHeight = -50000 end)
				startLoop("antiVoid", 0.15, antiVoidTick)
			else
				pcall(function() workspace.FallenPartsDestroyHeight = -500 end)
			end
		end })
		makeToggle(sc, {
			order = n(), id = "antiExplode", title = "Anti-Explosion",
			tip = "While ragdolled: anchor + zero velocity ( Anti-Explosion)",
			callback = function(on)
				S.toggles.antiExplode = on
				stopLoop("antiExplode")
				installAntis()
				if on then startLoop("antiExplode", 0.15, antiFlingTick) end
			end,
		})
		makeToggle(sc, {
			order = n(), id = "antiSticky", title = "Anti-Sticky",
			tip = "Massless=false + break StickyWelds + sticky remover touch",
			callback = function(on)
				S.toggles.antiSticky = on
				stopLoop("antiSticky")
				if on then startLoop("antiSticky", 0.15, antiStickyTick) end
			end,
		})
		makeToggle(sc, {
			order = n(), id = "antiBlobman", title = "Anti Blobman / Train",
			tip = "Force unsit blob/train seats near you",
			callback = function(on)
				S.toggles.antiBlobman = on
				stopLoop("antiBlob")
				if on then startLoop(_Vzd({134,147,153,142,103,145,148,135}), 0.15, antiBlobmanTick) end
			end,
		})
		makeToggle(sc, {
			order = n(), id = "antiLag", title = _Vzd({102,147,153,142,82,113,134,140,69,77,69,135,138,134,146,69,148,139,139,78}),
			tip = "Disables CharacterAndBeamMove LocalScript (can help FPS/lag)",
			callback = function(on) setAntiLag(on) end,
		})
		makeToggle(sc, { order = n(), id = "antiSit", title = _Vzd({102,147,153,142,82,120,142,153,69,84,69,120,138,134,153,69,121,151,134,149}), tip = _Vzd({107,148,151,136,138,69,154,147,152,142,153}), callback = function(on)
			stopLoop(_Vzd({134,147,153,142,120,142,153}))
			if on then startLoop("antiSit", 0.1, function() local h=hum(); if h then h.Sit=false end end) end
		end })
		makeToggle(sc, { order = n(), id = "antiRagdoll", title = "Anti-Ragdoll", tip = "Disable ragdoll states", callback = function(on)
			stopLoop(_Vzd({134,147,153,142,119,134,140}))
			if on then startLoop("antiRag", 0.1, function()
				local h = hum(); if not h then return end
				h:SetStateEnabled(Enum.HumanoidStateType.Ragdoll, false)
				h:SetStateEnabled(Enum.HumanoidStateType.FallingDown, false)
				h.PlatformStand = false
			end) end
		end })
		makeToggle(sc, { order = n(), id = "god", title = _Vzd({104,145,142,138,147,153,69,108,148,137,69,109,138,134,145}), tip = _Vzd({112,138,138,149,69,141,138,134,145,153,141,69,146,134,157}), callback = function(on)
			stopLoop("god")
			if on then startLoop("god", 0.15, function() local h=hum(); if h then h.Health=h.MaxHealth end end) end
		end })
		section(sc, _Vzd({109,116,122,120,106,69,103,126,117,102,120,120}), n())
		if S.toggles.plotBypass == nil then S.toggles.plotBypass = false end
		makeToggle(sc, {
			order = n(), id = "plotBypass", title = _Vzd({103,158,149,134,152,152,69,109,148,154,152,138,69,117,151,148,153,138,136,153,142,148,147}),
			tip = _Vzd({102,136,153,142,148,147,152,69,156,148,151,144,69,148,147,69,149,145,134,158,138,151,152,69,138,155,138,147,69,142,147,152,142,137,138,69,141,148,154,152,138,152}),
			callback = function(on)
				plotBypass = on
				S.toggles.plotBypass = on
				notify(HUB_NAME, _Vzd({109,148,154,152,138,69,135,158,149,134,152,152,69}) .. (on and "ON" or "OFF"), 1.2)
			end,
		})
end
_TAB_BUILDERS["player"] = function(sc, n)
		section(sc, "CHARACTER MODS", n())
		makeToggle(sc, {
			order = n(), id = "infjump", title = "Infinite Jump",
			tip = "JumpRequest → force jump every time (hold space to fly)",
			callback = function(on)
				S.toggles.infjump = on
				if S.conns.infJump then pcall(function() S.conns.infJump:Disconnect() end) S.conns.infJump = nil end
				if on then
					S.conns.infJump = UserInputService.JumpRequest:Connect(function()
						if not S.toggles.infjump then return end
						local h = hum()
						if h then pcall(function() h:ChangeState(Enum.HumanoidStateType.Jumping) h.Jump = true end) end
					end)
				end
			end,
		})
		makeToggle(sc, {
			order = n(), id = "godMode", title = "God Mode",
			tip = _Vzd({112,138,138,149,152,69,141,138,134,145,153,141,69,134,153,69,146,134,157}),
			callback = function(on)
				stopLoop("god")
				if on then startLoop("god", 0.12, function()
					local h = hum(); if h then h.Health = h.MaxHealth end
				end) end
			end,
		})
		makeToggle(sc, {
			order = n(), id = _Vzd({134,154,153,148,109,138,134,145}), title = "Auto Heal",
			tip = _Vzd({108,151,134,137,154,134,145,145,158,69,141,138,134,145,152,69,156,141,138,147,69,135,138,145,148,156,69,90,85,74,69,141,138,134,145,153,141}),
			callback = function(on)
				S.toggles.autoHeal = on
				stopLoop("autoHeal")
				if on then startLoop(_Vzd({134,154,153,148,109,138,134,145}), 0.25, function()
					local h = hum()
					if h and h.Health < h.MaxHealth * 0.5 then
						h.Health = math.min(h.Health + h.MaxHealth * 0.08, h.MaxHealth)
					end
				end) end
			end,
		})
		makeToggle(sc, {
			order = n(), id = "noclip", title = "Noclip",
			tip = _Vzd({104,134,147,104,148,145,145,142,137,138,69,139,134,145,152,138,69,148,147,69,134,145,145,69,135,148,137,158,69,149,134,151,153,152}),
			callback = function(on)
				S.toggles.noclip = on
				stopLoop("noclip")
				if on then startLoop("noclip", 1 / 30, function()
					local c = char()
					if c then
						for _, p in ipairs(c:GetDescendants()) do
							if p:IsA("BasePart") then p.CanCollide = false end
						end
					end
				end) end
			end,
		})
		makeToggle(sc, {
			order = n(), id = "bigHead", title = "Big Head",
			tip = _Vzd({120,136,134,145,138,69,141,138,134,137,69,153,148,69,87,83,90,157,69,152,142,159,138}),
			callback = function(on)
				local h = char() and char():FindFirstChild("Head")
				if h then
					local s = on and 2.5 or 1
					h.Size = Vector3.new(2 * s, 1 * s, 1 * s)
				end
			end,
		})
		makeToggle(sc, {
			order = n(), id = "tinyHead", title = _Vzd({121,142,147,158,69,109,138,134,137}),
			tip = "Scale head to 0.3x size",
			callback = function(on)
				local h = char() and char():FindFirstChild("Head")
				if h then
					local s = on and 0.3 or 1
					h.Size = Vector3.new(2 * s, 1 * s, 1 * s)
				end
			end,
		})
		makeToggle(sc, {
			order = n(), id = "bigTorso", title = "Big Torso",
			tip = "Scale torso to 2x size",
			callback = function(on)
				local c = char()
				if c then
					for _, name in ipairs({"Torso", "UpperTorso", "LowerTorso"}) do
						local p = c:FindFirstChild(name)
						if p then
							local s = on and 2 or 1
							p.Size = Vector3.new(2 * s, 2 * s, 1 * s)
						end
					end
				end
			end,
		})
		makeToggle(sc, {
			order = n(), id = "playerSpin", title = _Vzd({120,149,142,147,69,120,138,145,139}),
			tip = _Vzd({120,149,142,147,69,158,148,154,151,69,136,141,134,151,134,136,153,138,151,69,139,134,152,153}),
			callback = function(on)
				S.toggles.playerSpin = on
				stopLoop("playerSpin")
				if on then
					startLoop("playerSpin", 1 / 60, function()
						local r = hrp()
						if r then r.AssemblyAngularVelocity = Vector3.new(0, 40, 0) end
					end)
				else
					local r = hrp()
					if r then r.AssemblyAngularVelocity = Vector3.zero end
				end
			end,
		})
		makeToggle(sc, {
			order = n(), id = "playerFloat", title = "Float / Hover",
			tip = _Vzd({103,148,137,158,117,148,152,142,153,142,148,147,69,141,148,155,138,151,69,134,135,148,155,138,69,140,151,148,154,147,137}),
			callback = function(on)
				local r = hrp()
				if not r then return end
				local bp = r:FindFirstChild("VOIDZ_FloatBP")
				if on then
					if not bp then
						bp = Instance.new("BodyPosition")
						bp.Name = "VOIDZ_FloatBP"
						bp.MaxForce = Vector3.new(1e9, 1e9, 1e9)
						bp.P = 8000
						bp.D = 1500
						bp.Parent = r
					end
					bp.Position = r.Position + Vector3.new(0, 5, 0)
				else
					if bp then bp:Destroy() end
				end
			end,
		})
		makeToggle(sc, {
			order = n(), id = "antiDrown", title = _Vzd({102,147,153,142,82,105,151,148,156,147}),
			tip = _Vzd({105,138,153,138,136,153,69,156,134,153,138,151,69,134,147,137,69,121,117,69,153,148,69,147,138,134,151,138,152,153,69,141,148,154,152,138,84,145,134,147,137}),
			callback = function(on)
				S.toggles.antiDrown = on
				stopLoop(_Vzd({134,147,153,142,105,151,148,156,147}))
				if on then startLoop("antiDrown", 0.12, function()
					local h = hum(); if not h then return end
					local r = hrp(); if not r then return end
					local inWater = false
					pcall(function()
						if h:GetState() == Enum.HumanoidStateType.Swimming then inWater = true end
						if r.Position.Y < -8 then inWater = true end
						local ch = char()
						if ch then
							for _, p in ipairs(ch:GetDescendants()) do
								if p:IsA("BasePart") and p.Size.Y > 0 then
									if p.Position.Y < -8 then inWater = true break end
								end
							end
						end
					end)
					if inWater then
						tpToRandomHouse("drown")
					end
				end) end
			end,
		})
		section(sc, "MOVEMENT POWERS", n())
		makeToggle(sc, {
			order = n(), id = "highJump", title = "Super Jump",
			tip = _Vzd({111,154,146,149,117,148,156,138,151,69,148,155,138,151,151,142,137,138,69,77,152,153,134,136,144,152,69,156,142,153,141,69,142,147,139,69,143,154,146,149,78}),
			callback = function(on)
				S.toggles.highJump = on
				stopLoop("highJump")
				if on then startLoop("highJump", 0.1, function()
					local h = hum(); if h then h.JumpPower = S.superJumpPower or 200 end
				end)
				else
					local h = hum(); if h then h.JumpPower = 50 end
				end
			end,
		})
		makeSlider(sc, { order = n(), title = _Vzd({111,154,146,149,69,109,138,142,140,141,153}), min = 50, max = 500, default = 200, stateKey = "superJumpPower" })
		makeToggle(sc, {
			order = n(), id = "superSpeed", title = "Super Speed",
			tip = _Vzd({124,134,145,144,120,149,138,138,137,69,148,155,138,151,151,142,137,138,69,77,152,153,134,136,144,152,69,156,142,153,141,69,142,147,139,69,143,154,146,149,78}),
			callback = function(on)
				S.toggles.superSpeed = on
				stopLoop("superSpeed")
				if on then startLoop("superSpeed", 0.1, function()
					local h = hum(); if h then h.WalkSpeed = S.superSpeedPower or 100 end
				end)
				else
					local h = hum(); if h then h.WalkSpeed = 16 end
				end
			end,
		})
		makeSlider(sc, { order = n(), title = "Speed", min = 16, max = 300, default = 100, stateKey = "superSpeedPower" })
		makeButton(sc, {
			order = n(), title = "Reset Player",
			tip = "Restore everything to default",
			callback = function()
				S.toggles.infjump = false
				S.toggles.autoHeal = false
				S.toggles.bigHead = false
				S.toggles.tinyHead = false
				S.toggles.bigTorso = false
				S.toggles.playerSpin = false
				S.toggles.playerFloat = false
				S.toggles.antiDrown = false
				S.toggles.highJump = false
				S.toggles.superSpeed = false
				S.toggles.noclip = false
				if S.conns.infJump then pcall(function() S.conns.infJump:Disconnect() end) S.conns.infJump = nil end
				for _, id in ipairs({"god","autoHeal","playerSpin","antiDrown","highJump","superSpeed","noclip"}) do stopLoop(id) end
				local h = hum()
				if h then
					h.WalkSpeed = 16
					h.JumpPower = 50
				end
				local c = char()
				if c then
					local head = c:FindFirstChild("Head")
					if head then head.Size = Vector3.new(2, 1, 1) end
					for _, name in ipairs({"Torso", "UpperTorso", "LowerTorso"}) do
						local p = c:FindFirstChild(name)
						if p then p.Size = Vector3.new(2, 2, 1) end
					end
				end
				local r = hrp()
				if r then
					r.AssemblyAngularVelocity = Vector3.zero
					local bp = r:FindFirstChild("VOIDZ_FloatBP")
					if bp then bp:Destroy() end
				end
				notify(HUB_NAME, "Player reset", 1.2)
			end,
		})
end
_TAB_BUILDERS["loop"] = function(sc, n)
		section(sc, _Vzd({117,110,104,112,69,124,109,116,69,220,69,113,116,116,117,69,121,102,119,108,106,121}), n())
		makeInput(sc, { order = n(), id = "playerSearch", placeholder = "Search display or @username..." })
		local listBox = Instance.new("Frame")
		listBox.LayoutOrder = n()
		listBox.Size = UDim2.new(1, -6, 0, 160)
		listBox.BackgroundColor3 = C.bg
		listBox.BorderSizePixel = 0
		listBox.Parent = sc
		corner(listBox, 8)
		stroke(listBox, C.strokeSoft, 1)
		local listSc = Instance.new("ScrollingFrame")
		listSc.Size = UDim2.fromScale(1, 1)
		listSc.BackgroundTransparency = 1
		listSc.ScrollBarThickness = 3
		listSc.ScrollBarImageColor3 = C.accent
		listSc.AutomaticCanvasSize = Enum.AutomaticSize.Y
		listSc.CanvasSize = UDim2.new()
		listSc.Parent = listBox
		local listLay = Instance.new(_Vzd({122,110,113,142,152,153,113,134,158,148,154,153}))
		listLay.Padding = UDim.new(0, 3)
		listLay.Parent = listSc
		pad(listSc, 4, 4, 4, 4)
		S.playerListFrame = listSc

		local function refreshPlayerList()
			if not S.playerListFrame then return end
			for _, ch in ipairs(S.playerListFrame:GetChildren()) do
				if ch:IsA("TextButton") then ch:Destroy() end
			end
			local q = S.playerSearch and S.playerSearch.Text or ""
			local selCount = 0
			for _ in pairs(S.loopTargets) do selCount += 1 end
			for _, lab in ipairs(playerLabels(q)) do
				local p = findPlayerFromLabel(lab)
				local isSelected = (S.selected == p)
				local isLoop = S.loopTargets[p] or (S.loopTarget == p)
				local b = Instance.new("TextButton")
				b.Size = UDim2.new(1, -4, 0, 28)
				b.BackgroundColor3 = isSelected and C.accentDim or C.card
				b.BorderSizePixel = 0
				b.Font = Enum.Font.Gotham
				b.TextSize = 11
				b.TextColor3 = C.text
				b.TextXAlignment = Enum.TextXAlignment.Left
				b.Text = " " .. lab
					.. (isLoop and "  ★" or "")
					.. (isSelected and "  ●" or "")
				b.AutoButtonColor = false
				b.Parent = S.playerListFrame
				corner(b, 6)
				if isLoop then
					stroke(b, C.accent, 1)
				end
				b.MouseButton1Click:Connect(function()
					S.selected = p
					toggleLoopTarget(p)
					S.loopTarget = p
					S.loopName = p and p.Name or nil
					refreshPlayerList()
					local total = 0
					for _ in pairs(S.loopTargets) do total += 1 end
					if total > 1 then
						notify(HUB_NAME, total .. _Vzd({69,145,148,148,149,69,153,134,151,140,138,153,152}), 1.2)
					else
						notify(HUB_NAME, _Vzd({113,148,148,149,69,153,134,151,140,138,153,69,183,69}) .. lab, 1.2)
					end
				end)
			end
		end
		refreshPlayerList()
		if S.playerSearch then
			S.playerSearch:GetPropertyChangedSignal("Text"):Connect(refreshPlayerList)
		end
		S.playerDropdowns.playersRefresh = refreshPlayerList
		S._loopSearchRefresh = refreshPlayerList

		section(sc, "DO TO THEM", n())
		makeDropdown(sc, {
			order = n(), title = _Vzd({112,142,136,144,69,121,158,149,138}), options = KICK_TYPES, default = S.kickType or _Vzd({120,144,158,69,102,147,136,141,148,151}),
			callback = function(v) S.kickType = v; notify(HUB_NAME, "Kick type → " .. v, 1) end,
		})
		makeButton(sc, { order = n(), title = "Fling Selected", danger = true, tip = _Vzd({120,115,116,69,80,69,155,138,145,148,136,142,153,158,69,139,145,142,147,140}), callback = function()
			local targets = getLoopTargets()
			if #targets == 0 then notify(HUB_NAME, _Vzd({117,142,136,144,69,134,69,149,145,134,158,138,151,69,139,142,151,152,153}), 1.2) return end
			for _, p in ipairs(targets) do
				task.spawn(function()
					local ok, err = pcall(flingPlayer, p, S.flingPower, false, true)
					if not ok then notify(HUB_NAME, "Fling err: " .. tostring(err):sub(1, 40), 2) end
				end)
			end
		end })
		makeButton(sc, { order = n(), title = "Kick Selected", danger = true, tip = "Uses kick type above", callback = function()
			local targets = getLoopTargets()
			if #targets == 0 then notify(HUB_NAME, "Pick a player first", 1.2) return end
			for _, p in ipairs(targets) do
				task.spawn(function()
					local ok, err = pcall(kickPlayer, p, S.kickType, false)
					if not ok then notify(HUB_NAME, _Vzd({112,142,136,144,69,138,151,151,95,69}) .. tostring(err):sub(1, 40), 2) end
				end)
			end
		end })
		makeButton(sc, { order = n(), title = _Vzd({112,142,145,145,69,120,138,145,138,136,153,138,137}), danger = true, tip = "Sky + death state", callback = function()
			local targets = getLoopTargets()
			if #targets == 0 then notify(HUB_NAME, _Vzd({117,142,136,144,69,134,69,149,145,134,158,138,151,69,139,142,151,152,153}), 1.2) return end
			for _, p in ipairs(targets) do
				task.spawn(function()
					local ok, err = pcall(killPlayer, p, false)
					if not ok then notify(HUB_NAME, _Vzd({112,142,145,145,69,138,151,151,95,69}) .. tostring(err):sub(1, 40), 2) end
				end)
			end
		end })
		makeButton(sc, { order = n(), title = "Bring Selected", tip = _Vzd({121,117,69,140,151,134,135,69,149,154,145,145,69,153,148,69,158,148,154}), callback = function()
			local targets = getLoopTargets()
			if #targets == 0 then notify(HUB_NAME, "Pick a player first", 1.2) return end
			for _, p in ipairs(targets) do
				task.spawn(function()
					local ok, err = pcall(bringPlayer, p, nil, false)
					if not ok then notify(HUB_NAME, _Vzd({103,151,142,147,140,69,138,151,151,95,69}) .. tostring(err):sub(1, 40), 2) end
				end)
			end
		end })
		makeButton(sc, { order = n(), title = "Teleport To Selected", callback = function()
			local me, r = hrp(), S.selected and rootOf(S.selected)
			if me and r then
				me.CFrame = r.CFrame + Vector3.new(0, 3, 0)
				notify(HUB_NAME, _Vzd({121,117,69,153,148,69}) .. playerLabel(S.selected), 1)
			else
				notify(HUB_NAME, _Vzd({115,148,69,153,134,151,140,138,153}), 1)
			end
		end })
		makeButton(sc, { order = n(), title = "Spectate", callback = function()
			local cam = workspace.CurrentCamera
			local t = S.selected and S.selected.Character
			if cam and t then
				cam.CameraSubject = t:FindFirstChildOfClass("Humanoid") or t
				notify(HUB_NAME, "Spectating", 1)
			end
		end })
		makeButton(sc, { order = n(), title = "Unspectate", callback = function()
			local cam, h = workspace.CurrentCamera, hum()
			if cam and h then cam.CameraSubject = h; notify(HUB_NAME, "Unspectate", 1) end
		end })
		makeToggle(sc, { order = n(), id = _Vzd({156,145,107,151,142,138,147,137,152}), title = _Vzd({124,141,142,153,138,145,142,152,153,69,107,151,142,138,147,137,152}), tip = _Vzd({120,144,142,149,69,139,151,142,138,147,137,152,69,142,147,69,134,154,151,134,152,84,146,134,152,152}), callback = function(on)
			notify(HUB_NAME, _Vzd({124,113,69,139,151,142,138,147,137,152,69}) .. (on and "ON" or "OFF"), 1)
		end })
		makeButton(sc, { order = n(), title = "Whitelist Selected", callback = function()
			if S.selected then S.whitelist[S.selected.Name] = true; notify(HUB_NAME, "WL " .. S.selected.Name, 1); if S._wlRefresh then pcall(S._wlRefresh) end end
		end })
		makeButton(sc, { order = n(), title = _Vzd({122,147,156,141,142,153,138,145,142,152,153,69,120,138,145,138,136,153,138,137}), callback = function()
			if S.selected then S.whitelist[S.selected.Name] = nil; notify(HUB_NAME, "Un-WL", 1); if S._wlRefresh then pcall(S._wlRefresh) end end
		end })
		makeToggle(sc, { order = n(), id = "stalk", title = _Vzd({120,153,134,145,144,69,121,138,145,138,149,148,151,153}), tip = "Loop TP behind selected", callback = function(on)
			stopLoop(_Vzd({152,153,134,145,144}))
			notify(HUB_NAME, _Vzd({120,153,134,145,144,69}) .. (on and "ON" or "OFF"), 1)
			if on then startLoop("stalk", 0.2, function()
				local me, r = hrp(), S.selected and rootOf(S.selected)
				if me and r then me.CFrame = r.CFrame * CFrame.new(0, 0, 4) end
			end) end
		end })

		section(sc, _Vzd({113,116,116,117,69,102,104,121,110,116,115,120}), n())
		local loops = {
			{ id = "loopFling", title = _Vzd({112,138,138,149,69,121,141,151,148,156,142,147,140}), tip = _Vzd({102,147,147,148,158,142,147,140,69,136,148,147,152,153,134,147,153,69,139,145,142,147,140,69,220,69,146,134,149,82,156,142,137,138}), waitRespawn = true, fn = function(p)
				local r = rootOf(p); if not r then return end
				clearTargetMovers(p.Character)
				applyVel(r, S.flingPower or 600, 0.3)
			end },
			{ id = "loopKick", title = "Keep Kicking", tip = "Kick · map-wide", waitRespawn = true, fn = function(p) kickPlayer(p, S.kickType, true) end },
			{ id = "loopKill", title = _Vzd({112,138,138,149,69,112,142,145,145,142,147,140}), tip = "Instant kill · map-wide", waitRespawn = true, fn = function(p)
				local r = rootOf(p); if not r then return end
				local h = p.Character and p.Character:FindFirstChildOfClass("Humanoid")
				pcall(function()
					if h then
						h.BreakJointsOnDeath = false
						h:ChangeState(Enum.HumanoidStateType.Dead)
						h.Jump = true
						h.Sit = false
					end
					destroyGrabOn(r)
					skyVel(r)
				end)
			end },
			{ id = "loopRagdoll", title = _Vzd({112,138,138,149,69,119,134,140,137,148,145,145,142,147,140}), tip = _Vzd({120,149,134,146,69,151,134,140,137,148,145,145,69,220,69,146,134,149,82,156,142,137,138}), waitRespawn = true, fn = function(p) ragdoll(p, true) end },
			{ id = _Vzd({145,148,148,149,103,151,142,147,140}), title = "Keep Bringing", tip = _Vzd({103,151,142,147,140,69,153,148,69,158,148,154,69,220,69,146,134,149,82,156,142,137,138}), fn = function(p) bringPlayer(p, nil, true) end },
			{ id = "loopTp", title = _Vzd({113,148,148,149,69,121,138,145,138,149,148,151,153,69,121,148}), tip = "Stay on them", fn = function(p) local me,r=hrp(),rootOf(p); if me and r then me.CFrame=r.CFrame+Vector3.new(0,3,0) end end },
			{ id = "loopSky", title = "Loop Sky Launch", tip = "Sky launch · map-wide", waitRespawn = true, fn = function(p) kickPlayer(p, "Sky", true) end },
			{ id = "loopVoid", title = "Loop Void", tip = "Void slam · map-wide", waitRespawn = true, fn = function(p) voidPlayer(p, true) end },
			{ id = "loopSpin", title = "Loop Spin", tip = _Vzd({120,149,142,147,69,153,141,138,146,69,220,69,146,134,149,82,156,142,137,138}), waitRespawn = true, fn = function(p) local r=rootOf(p); if r then snoPlayer(p); r.AssemblyAngularVelocity=Vector3.new(0,120,0) end end },
			{ id = "loopSNO", title = "Loop Network Own", tip = _Vzd({120,115,116,69,152,149,134,146,69,220,69,146,134,149,82,156,142,137,138}), fn = function(p) snoPlayer(p) end },
			{ id = "loopGrab", title = _Vzd({113,148,148,149,69,108,151,134,135,69,113,142,147,138}), tip = "CreateGrabLine spam · map-wide", fn = function(p) if FTAP.CreateGrabLine then local t=rootOf(p); pcall(function() FTAP.CreateGrabLine:FireServer(t,t.CFrame) end) end end },
			{ id = "loopHardFling", title = _Vzd({113,148,148,149,69,109,134,151,137,69,107,145,142,147,140}), tip = _Vzd({114,134,157,69,139,145,142,147,140,69,220,69,146,134,149,82,156,142,137,138}), waitRespawn = true, fn = function(p)
				local r = rootOf(p); if not r then return end
				clearTargetMovers(p.Character)
				applyVel(r, 20000, 0.1)
			end },
			{ id = "loopBlobKick", title = "Loop Blobman Kick", tip = _Vzd({103,145,148,135,69,144,142,136,144,69,220,69,146,134,149,82,156,142,137,138}), waitRespawn = true, fn = function(p) kickPlayer(p, "Blobman", true) end },
			{ id = "loopGrabKick", title = "Loop Grab Kick", tip = _Vzd({108,151,134,135,69,144,142,136,144,69,220,69,146,134,149,82,156,142,137,138}), waitRespawn = true, fn = function(p) kickPlayer(p, "GrabKick", true) end },
			{ id = "loopStackKick", title = "Loop Stack Kick", tip = "Stack kick · map-wide", waitRespawn = true, fn = function(p) kickPlayer(p, "StackKick", true) end },
			{ id = _Vzd({145,148,148,149,120,142,145,138,147,153,112,142,136,144}), title = _Vzd({113,148,148,149,69,120,142,145,138,147,153,69,112,142,136,144}), tip = "Silent kick · map-wide", waitRespawn = true, fn = function(p) kickPlayer(p, "Silent", true) end },
			{ id = "loopFire", title = "Loop Fire", tip = _Vzd({103,154,151,147,69,153,141,138,146,69,220,69,146,134,149,82,156,142,137,138}), waitRespawn = true, fn = function(p) firePlayerBlitz(p) end },
			{ id = "loopPoison", title = _Vzd({113,148,148,149,69,117,148,142,152,148,147}), tip = _Vzd({117,148,142,152,148,147,69,220,69,146,134,149,82,156,142,137,138}), fn = function(p) applyStatusToPlayer(_Vzd({149,148,142,152,148,147}), p) end },
			{ id = "loopBanana", title = _Vzd({113,148,148,149,69,103,134,147,134,147,134}), tip = _Vzd({120,145,142,149,69,220,69,146,134,149,82,156,142,137,138}), fn = function(p) applyStatusToPlayer("banana", p) end },
			{ id = _Vzd({145,148,148,149,117,134,142,147,153}), title = "Loop Paint", tip = "Paint · map-wide", fn = function(p) applyStatusToPlayer("paint", p) end },
			{ id = _Vzd({145,148,148,149,103,151,142,147,140,107,145,142,147,140}), title = _Vzd({113,148,148,149,69,103,151,142,147,140,80,107,145,142,147,140}), tip = _Vzd({103,151,142,147,140,69,153,141,138,147,69,139,145,142,147,140,69,220,69,146,134,149,82,156,142,137,138}), waitRespawn = true, fn = function(p)
				bringPlayer(p, nil, true)
				local r = rootOf(p); if not r then return end
				clearTargetMovers(p.Character)
				applyVel(r, S.flingPower or 600, 0.3)
			end },
			{ id = "loopLongBring", title = _Vzd({113,148,148,149,69,113,148,147,140,69,119,138,134,136,141,69,103,151,142,147,140}), tip = _Vzd({114,134,157,69,151,138,134,136,141,69,80,69,135,151,142,147,140}), fn = function(p)
				if S.toggles.lineExtend then applyLineExtendDistance(S.extendAmount or 80) end
				bringPlayer(p, nil, true)
			end },
			{ id = "loopSpamSNO", title = "Loop Spam SNO Parts", tip = _Vzd({116,156,147,69,138,155,138,151,158,69,149,134,151,153,69,220,69,146,134,149,82,156,142,137,138}), fn = function(p) for _,part in ipairs(p.Character:GetDescendants()) do if part:IsA("BasePart") then sno(part) end end end },
			{ id = _Vzd({145,148,148,149,105,138,152,153,151,148,158,108,151,134,135}), title = "Loop Destroy Their Grab", tip = _Vzd({105,138,152,153,151,148,158,108,151,134,135,113,142,147,138,69,220,69,146,134,149,82,156,142,137,138}), fn = function(p) local r=rootOf(p); if r then destroyGrabOn(r) end end },
		}
		S.loopWait = S.loopWait or {}
		for _, L in ipairs(loops) do
			makeToggle(sc, {
				order = n(),
				id = L.id,
				title = L.title,
				tip = L.tip or L.title,
				callback = function(on)
					stopLoop(L.id)
					if not on then
						for k, w in pairs(S.loopWait) do
							if k:sub(1, #L.id + 1) == L.id .. "_" or k == L.id then
								if w and w.home then
									pcall(function() teleportSelf(w.home) end)
									break
								end
							end
						end
						for k in pairs(S.loopWait) do
							if k:sub(1, #L.id + 1) == L.id .. "_" or k == L.id then
								S.loopWait[k] = nil
							end
						end
						notify(HUB_NAME, L.title .. " OFF", 1.2)
						return
					end
					notify(HUB_NAME, L.title .. " ON · map-wide", 1.2)
					local homeCF = hrp() and hrp().CFrame
					S.loopWait[L.id] = S.loopWait[L.id] or {}
					S.loopWait[L.id].home = homeCF
					local interval = L.waitRespawn and 0.2 or 0.18
				startLoop(L.id, interval, function()
					local targets = getLoopTargets()
					if #targets == 0 then
						if S.loopName then
							local found = Players:FindFirstChild(S.loopName)
							if found and found.Parent then
								S.loopTarget = found
								S.loopTargets[found] = true
								targets = { found }
								if S._loopSearchRefresh then pcall(S._loopSearchRefresh) end
								notify(HUB_NAME, playerLabel(found) .. " re-acquired!", 1.5)
							end
						end
						if #targets == 0 then return end
					end
					for _, p in ipairs(targets) do
					if not p or not p.Parent then continue end
					local wkey = L.id .. "_" .. (p.Name or "")
					local w = S.loopWait[wkey]
					if not w then w = { home = homeCF }; S.loopWait[wkey] = w end
					if not w.home then w.home = homeCF end

					if not plotBypass and isInSafePlot(p) then
						if not w._houseWarned or (os.clock() - w._houseWarned) > 5 then
							w._houseWarned = os.clock()
							notify(HUB_NAME, playerLabel(p) .. _Vzd({69,142,152,69,142,147,69,134,69,141,148,154,152,138,69,57,69,156,134,142,153,142,147,140}), 2)
						end
						continue
					end

					if L.waitRespawn then
						if w.waiting then
							if isAliveP(p) and p.Character and p.Character ~= w.deadChar then
								w.waiting = false
								w.deadChar = nil
								if w.home then pcall(function() teleportSelf(w.home) end) end
								task.wait(0.25)
							else
								continue
							end
						end
						if not isAliveP(p) and not validP(p) then
							S.loopWait[wkey] = { waiting = true, deadChar = p.Character, home = w.home }
							continue
						end
					else
						if not isAliveP(p) and not validP(p) then continue end
					end

					visitForSNO(p, 15)

					local charBefore = p.Character
					pcall(L.fn, p)

					if w.home then pcall(function() teleportSelf(w.home) end) end

					if L.waitRespawn then
						task.defer(function()
							task.wait(0.3)
							local ww = S.loopWait[wkey]
							if ww and S.loops[L.id] and p.Parent and (not isAliveP(p) or p.Character ~= charBefore) then
								if not isAliveP(p) then
									S.loopWait[wkey] = { waiting = true, deadChar = charBefore or p.Character, home = ww.home }
								end
							end
						end)
					end
					end
				end)
				end,
			})
		end
end
_TAB_BUILDERS["move"] = function(sc, n)
		section(sc, "MY MOVEMENT", n())
		makeToggle(sc, { order = n(), id = "speed", title = _Vzd({124,134,145,144,120,149,138,138,137,69,116,155,138,151,151,142,137,138}), tip = "Re-applies every frame (FTAP resets speed)", callback = function() end })
		makeSlider(sc, { order = n(), title = "WalkSpeed", min = 16, max = 300, default = 50, stateKey = "walkSpeed" })
		makeToggle(sc, { order = n(), id = "speedCFrame", title = "CFrame Speed Boost", tip = "Extra CFrame push like mult", callback = function() end })
		makeSlider(sc, { order = n(), title = "CFrame Mult", min = 1, max = 8, default = 2, stateKey = "speedMult" })
		makeToggle(sc, { order = n(), id = "fly", title = "Fly", tip = "BodyVelocity + BodyGyro fly", desc = _Vzd({124,102,120,105,69,220,69,120,149,134,136,138,69,220,69,120,141,142,139,153}), callback = setFly })
		makeSlider(sc, { order = n(), title = "Fly Speed", min = 20, max = 400, default = 80, stateKey = "flySpeed" })
		makeToggle(sc, { order = n(), id = "noclip", title = "Noclip", tip = _Vzd({104,134,147,104,148,145,145,142,137,138,69,139,134,145,152,138,69,138,155,138,151,158,69,139,151,134,146,138}), callback = function() end })
		makeToggle(sc, {
			order = n(), id = _Vzd({142,147,139,143,154,146,149}), title = _Vzd({110,147,139,142,147,142,153,138,69,111,154,146,149,69,77,84,78}),
			tip = "JumpRequest → force Jump while ON",
			callback = function(on)
				S.toggles.infjump = on
				if S.conns.infJump then pcall(function() S.conns.infJump:Disconnect() end) S.conns.infJump = nil end
				if on then
					S.conns.infJump = UserInputService.JumpRequest:Connect(function()
						if not S.toggles.infjump then return end
						local h = hum()
						if h then pcall(function() h:ChangeState(Enum.HumanoidStateType.Jumping) h.Jump = true end) end
					end)
				end
			end,
		})
		makeToggle(sc, {
			order = n(), id = "waterWalk", title = _Vzd({124,134,153,138,151,69,124,134,145,144}),
			tip = _Vzd({114,134,144,138,152,69,153,141,138,69,156,141,148,145,138,69,156,134,153,138,151,69,146,134,149,69,152,148,145,142,137,69,152,148,69,158,148,154,69,156,134,145,144,69,148,147,69,142,153,69,77,147,148,69,139,145,148,134,153,69,149,145,134,153,139,148,151,146,78}),
			desc = _Vzd({120,148,145,142,137,142,139,142,138,152,69,156,134,153,138,151,69,149,134,151,153,152,69,80,69,153,138,151,151,134,142,147,69,220,69,151,138,152,153,148,151,138,152,69,156,141,138,147,69,148,139,139}),
			callback = function(on) setWaterWalk(on) end,
		})
		makeToggle(sc, { order = n(), id = "jump", title = "JumpPower Override", callback = function() end })
		makeSlider(sc, { order = n(), title = "Jump Power", min = 50, max = 500, default = 80, stateKey = "jumpPower" })
		makeButton(sc, { order = n(), title = _Vzd({119,138,152,138,153,69,114,148,155,138,146,138,147,153}), callback = function()
			S.toggles.speed=false; S.toggles.fly=false; S.toggles.noclip=false; S.toggles.infjump=false; S.toggles.jump=false; S.toggles.speedCFrame=false
			setFly(false)
			local h = hum(); if h then h.WalkSpeed=16; h.JumpPower=50 end
		end })
		section(sc, _Vzd({114,102,117,69,121,106,113,106,117,116,119,121}), n())
		local MAP_POSITIONS = {
			{ name = "Green House", pos = Vector3.new(-352, 99, 354) },
			{ name = "Green Safe-House", pos = Vector3.new(-584, -6, 93) },
			{ name = "Chinese Safe-House", pos = Vector3.new(579, 124, -94) },
			{ name = "Farm House", pos = Vector3.new(-234, 83, -324) },
			{ name = "Spawn", pos = Vector3.new(4, -7, -3) },
			{ name = "Blue Safe-House", pos = Vector3.new(538, 96, -372) },
			{ name = _Vzd({120,138,136,151,138,153,69,103,142,140,69,104,134,155,138}), pos = Vector3.new(17, -7, 539) },
			{ name = _Vzd({120,138,136,151,138,153,69,121,151,134,142,147,69,104,134,155,138}), pos = Vector3.new(500, 62, -307) },
			{ name = "Mine Cave", pos = Vector3.new(-254, -7, 518) },
			{ name = _Vzd({124,142,153,136,141,69,120,134,139,138,82,109,148,154,152,138}), pos = Vector3.new(296, -4, 494) },
			{ name = _Vzd({119,138,137,69,120,134,139,138,82,109,148,154,152,138}), pos = Vector3.new(-516, -6, -162) },
		}
		local mapNames = {}
		for _, mp in ipairs(MAP_POSITIONS) do mapNames[#mapNames + 1] = mp.name end
		S.selectedMap = S.selectedMap or mapNames[1]
		makeDropdown(sc, {
			order = n(), title = _Vzd({114,134,149,69,113,148,136,134,153,142,148,147}), options = mapNames, default = S.selectedMap,
			tip = "Pick a map location to teleport to",
			callback = function(v) S.selectedMap = v end,
		})
		makeButton(sc, {
			order = n(), title = _Vzd({121,138,145,138,149,148,151,153,69,153,148,69,114,134,149}), tip = _Vzd({121,138,145,138,149,148,151,153,69,153,148,69,153,141,138,69,152,138,145,138,136,153,138,137,69,146,134,149,69,145,148,136,134,153,142,148,147}),
			callback = function()
				local target
				for _, mp in ipairs(MAP_POSITIONS) do
					if mp.name == S.selectedMap then target = mp; break end
				end
				if target then
					local me = hrp()
					if me then me.CFrame = CFrame.new(target.pos + Vector3.new(0, 5, 0)); notify(HUB_NAME, "Teleported to " .. target.name, 1.5) end
				end
			end,
		})
		makeButton(sc, {
			order = n(), title = _Vzd({121,138,145,138,149,148,151,153,69,153,148,69,120,138,145,138,136,153,138,137,69,117,145,134,158,138,151}), tip = _Vzd({121,138,145,138,149,148,151,153,69,153,148,69,153,141,138,69,149,145,134,158,138,151,69,158,148,154,69,152,138,145,138,136,153,138,137,69,142,147,69,134,147,158,69,152,138,134,151,136,141,69,145,142,152,153}),
			callback = function()
				local p = S.selected
				if not p or not validP(p) then notify(HUB_NAME, _Vzd({115,148,69,153,134,151,140,138,153,69,57,69,149,142,136,144,69,134,69,149,145,134,158,138,151,69,139,142,151,152,153}), 1.5); return end
				local r = rootOf(p)
				if r then
					local me = hrp()
					if me then me.CFrame = r.CFrame * CFrame.new(0, 0, 5); notify(HUB_NAME, "Teleported to " .. playerLabel(p), 1.5) end
				end
			end,
		})
		makeToggle(sc, {
			order = n(), id = "loopTP", title = _Vzd({113,148,148,149,69,121,138,145,138,149,148,151,153,69,153,148,69,120,138,145,138,136,153,138,137}),
			tip = _Vzd({112,138,138,149,152,69,153,138,145,138,149,148,151,153,142,147,140,69,153,148,69,152,138,145,138,136,153,138,137,69,149,145,134,158,138,151,69,138,155,138,151,158,69,139,151,134,146,138}),
			callback = function(on)
				S.toggles.loopTP = on
				if on then
					startLoop("loopTP", 0.05, function()
						if not S.toggles.loopTP then return end
						local p = S.selected
						if p and validP(p) then
							local r = rootOf(p)
							if r then
								local me = hrp()
								if me then me.CFrame = r.CFrame * CFrame.new(0, 0, 5) end
							end
						end
					end)
				else
					stopLoop("loopTP")
				end
			end,
		})
end
_TAB_BUILDERS["toys"] = function(sc, n)
		section(sc, _Vzd({121,116,126,69,113,110,114,110,121}), n())
		local limNote = Instance.new("TextLabel")
		limNote.LayoutOrder = n()
		limNote.Size = UDim2.new(1, -6, 0, 36)
		limNote.BackgroundColor3 = C.card
		limNote.BorderSizePixel = 0
		limNote.Font = Enum.Font.Gotham
		limNote.TextSize = 11
		limNote.TextColor3 = C.muted
		limNote.TextXAlignment = Enum.TextXAlignment.Left
		limNote.TextWrapped = true
		limNote.Text = _Vzd({69,69,107,151,138,138,69,98,69,86,85,85,69,153,148,158,152,69,220,69,108,134,146,138,149,134,152,152,69,98,69,87,85,85,69,220,69,139,148,151,146,152,69,152,153,148,149,69,135,138,139,148,151,138,69,153,141,138,69,136,134,149})
		limNote.Parent = sc
		corner(limNote, 8)
		pad(limNote, 6, 6, 6, 6)
		makeDropdown(sc, {
			order = n(),
			title = "Account type",
			options = { "Auto-detect", _Vzd({115,148,69,140,134,146,138,149,134,152,152,69,77,86,85,85,78}), "Gamepass (200)" },
			default = (S.toyPassMode == "pass" and "Gamepass (200)")
				or (S.toyPassMode == "free" and "No gamepass (100)")
				or _Vzd({102,154,153,148,82,137,138,153,138,136,153}),
			callback = function(v)
				if v:find("Gamepass", 1, true) then S.toyPassMode = "pass"
				elseif v:find(_Vzd({115,148,69,140,134,146,138,149,134,152,152}), 1, true) then S.toyPassMode = "free"
				else S.toyPassMode = "auto" end
				notify(HUB_NAME, _Vzd({121,148,158,69,145,142,146,142,153,69,220,69}) .. getToyLimit(), 1.2)
			end,
		})
		makeButton(sc, {
			order = n(),
			title = "Show limit / count",
			callback = function()
				notify(HUB_NAME, "Toys " .. countMyToys() .. " / " .. getToyLimit() .. _Vzd({69,220,69,151,148,148,146,69}) .. toysRoom(), 2)
			end,
		})
		section(sc, "SPAWN KEYBINDS", n())
		makeToggle(sc, { order = n(), id = "palletQ", title = _Vzd({118,69,98,69,120,149,134,156,147,69,117,134,145,145,138,153}), tip = _Vzd({117,134,145,145,138,153,113,142,140,141,153,103,151,148,156,147,69,155,142,134,69,114,138,147,154,121,148,158,152}), desc = "Toggle on/off", callback = setPalletQ })
		makeToggle(sc, { order = n(), id = "tabSpawn", title = "TAB = Spawn Selected Toy", tip = _Vzd({120,149,134,156,147,69,152,138,145,138,136,153,138,137,69,153,148,158,69,148,147,69,121,102,103}), callback = function(on)
			pcall(function() ContextActionService:UnbindAction("VOIDZ_TabToy") end)
			if not on then return end
			ContextActionService:BindAction("VOIDZ_TabToy", function(_, state)
				if state == Enum.UserInputState.Begin then spawnToy(S.selectedToy or "PalletLightBrown") end
			end, false, Enum.KeyCode.Tab)
		end })
		section(sc, "PALLET", n())
		makeToggle(sc, {
			order = n(),
			id = "palletCage",
			title = _Vzd({120,153,142,136,144,69,121,148,69,117,134,145,145,138,153,69,104,138,147,153,138,151}),
			tip = "Hold a pallet: SNO + pin people on it to the top center (FE ownership)",
			desc = "They must be near you (~30 studs) for SNO · releases when you drop the pallet",
			callback = function(on)
				setPalletCage(on)
			end,
		})
		section(sc, "QUICK SPAWN", n())
		for _, toy in ipairs({
			"PalletLightBrown", "CreatureBlobman", "BombMissile", "Campfire", "NinjaKunai",
			"NinjaShuriken", _Vzd({107,148,148,137,103,134,147,134,147,134}), "DiceSmall", "SprayCanWD", "BallSnowball",
			"YouDecoy", "GlassBoxGray", _Vzd({107,148,148,137,103,151,138,134,137}), "InstrumentDrumSnare",
		}) do
			makeButton(sc, { order = n(), title = "Spawn " .. toy, tip = _Vzd({103,154,158,80,120,149,134,156,147,69}) .. toy .. _Vzd({69,77,150,154,138,154,138,137,78}), callback = function()
				S.selectedToy = toy
				spawnToy(toy)
			end })
		end
		section(sc, "FORM BUILDS", n())
		local formInfo = Instance.new("TextLabel")
		formInfo.LayoutOrder = n()
		formInfo.Size = UDim2.new(1, -6, 0, 44)
		formInfo.BackgroundColor3 = C.card
		formInfo.BorderSizePixel = 0
		formInfo.Font = Enum.Font.Gotham
		formInfo.TextSize = 10
		formInfo.TextColor3 = C.muted
		formInfo.TextXAlignment = Enum.TextXAlignment.Left
		formInfo.TextYAlignment = Enum.TextYAlignment.Center
		formInfo.TextWrapped = true
		formInfo.Text = " Forms ATTACH to you (SNO + BodyPosition)\n Heart = above head · Wings flap · Suit = body shell · Remove Form to clear"
		formInfo.Parent = sc
		corner(formInfo, 8)
		makeSlider(sc, {
			order = n(), title = "Form Size Scale", min = 0.5, max = 3, default = S.formSizeScale or 1.2, step = 0.1,
			callback = function(v) S.formSizeScale = v end,
		})
		makeSlider(sc, {
			order = n(), title = _Vzd({107,148,151,146,69,105,142,152,153,134,147,136,138}), min = 4, max = 40, default = S.formDistance or 12, step = 1,
			callback = function(v) S.formDistance = v end,
		})
		makeSlider(sc, {
			order = n(), title = _Vzd({107,148,151,146,69,109,138,142,140,141,153}), min = -5, max = 30, default = S.formHeight or 2, step = 1,
			callback = function(v) S.formHeight = v end,
		})
		makeSlider(sc, {
			order = n(), title = _Vzd({107,148,151,146,69,116,151,142,138,147,153,134,153,142,148,147,69,77,126,213,78}), min = 0, max = 360, default = S.formOrientation or 0, step = 5,
			callback = function(v) S.formOrientation = v end,
		})
		makeSlider(sc, {
			order = n(), title = "Spawn Gap (sec)", min = 0.04, max = 0.35, default = S.formGap or 0.09, step = 0.01,
			callback = function(v) S.formGap = v end,
		})
		for _, def in ipairs(FORM_BUILDS) do
			makeButton(sc, {
				order = n(),
				title = _Vzd({103,154,142,145,137,69}) .. def.title,
				tip = def.tip or ("Form · " .. def.title),
				callback = function()
					runFormBuild(def.id, S.selectedToy or _Vzd({117,134,145,145,138,153,113,142,140,141,153,103,151,148,156,147}))
				end,
			})
		end
		makeButton(sc, {
			order = n(),
			title = "Build Heart (Dice / sparkle)",
			tip = _Vzd({120,134,146,138,69,141,138,134,151,153,69,154,152,142,147,140,69,105,142,136,138,120,146,134,145,145}),
			callback = function() runFormBuild(_Vzd({141,138,134,151,153}), "DiceSmall") end,
		})
		makeButton(sc, {
			order = n(),
			title = "Cancel Form Build",
			danger = true,
			tip = "Stop mid-build + clear spawn queue",
			callback = cancelFormBuild,
		})
		makeButton(sc, {
			order = n(),
			title = _Vzd({119,138,146,148,155,138,69,107,148,151,146,69,77,137,138,153,134,136,141,78}),
			danger = true,
			tip = _Vzd({120,153,148,149,69,156,138,134,151,69,145,148,148,149,69,80,69,105,138,152,153,151,148,158,121,148,158,69,139,148,151,146,69,149,142,138,136,138,152}),
			callback = function()
				clearFormWear(true)
				notify(HUB_NAME, "Form removed", 1.2)
			end,
		})
		section(sc, _Vzd({103,122,110,113,105,69,84,69,107,122,115}), n())
		makeButton(sc, { order = n(), title = "Spawn Pallet Stack (5)", tip = "5 pallets stacked (serial)", callback = function()
			spawnToyBurst("PalletLightBrown", 5)
		end })
		makeButton(sc, { order = n(), title = _Vzd({120,149,134,156,147,69,117,134,145,145,138,153,69,120,153,134,136,144,69,77,86,90,78}), tip = _Vzd({103,142,140,69,152,153,134,136,144}), callback = function()
			spawnToyBurst("PalletLightBrown", 15)
		end })
		makeButton(sc, { order = n(), title = "Blobman Army (3)", danger = true, callback = function()
			spawnToyBurst("CreatureBlobman", 3)
		end })
		makeButton(sc, { order = n(), title = _Vzd({120,147,148,156,135,134,145,145,69,120,153,134,136,144,69,77,86,85,78}), tip = "BallSnowball", callback = function()
			spawnToyBurst("BallSnowball", 10)
		end })
		makeToggle(sc, { order = n(), id = _Vzd({134,154,153,148,117,134,145,145,138,153}), title = _Vzd({102,154,153,148,69,117,134,145,145,138,153,69,117,134,153,141}), tip = "Queued pallets while walking", callback = function(on)
			stopLoop("autoPallet")
			notify(HUB_NAME, _Vzd({102,154,153,148,69,149,134,145,145,138,153,69}) .. (on and "ON" or "OFF"), 1)
			if on then startLoop("autoPallet", 0.2, function() spawnToy("PalletLightBrown", { silent = true, dist = 2.5 }) end) end
		end })
		section(sc, "TOY MANAGEMENT", n())
		makeButton(sc, { order = n(), title = _Vzd({105,138,152,153,151,148,158,69,102,145,145,69,114,158,69,121,148,158,152}), danger = true, tip = _Vzd({105,138,152,153,151,148,158,121,148,158,69,148,147,69,120,149,134,156,147,138,137,110,147,121,148,158,152,69,139,148,145,137,138,151}), callback = function()
			local n = destroyAllMyToys()
			notify(HUB_NAME, "Destroyed " .. n .. " toys", 2)
		end })
		makeButton(sc, { order = n(), title = "Destroy All My Pallets", danger = true, callback = function()
			local n = destroyAllMyToys(_Vzd({117,134,145,145,138,153}))
			notify(HUB_NAME, "Destroyed " .. n .. _Vzd({69,149,134,145,145,138,153,152}), 2)
		end })
		makeButton(sc, { order = n(), title = _Vzd({104,148,154,147,153,69,114,158,69,121,148,158,152}), tip = _Vzd({120,149,134,156,147,138,137,110,147,121,148,158,152,69,136,141,142,145,137,151,138,147}), callback = function()
			notify(HUB_NAME, "Toys: " .. countMyToys() .. " · Pallets: " .. countMyToys("PalletLightBrown"), 2)
		end })
		section(sc, _Vzd({116,124,115,106,105,69,110,115,123,106,115,121,116,119,126}), n())
		makeButton(sc, { order = n(), title = _Vzd({119,138,139,151,138,152,141,69,116,156,147,138,137,69,80,69,114,134,149,69,120,136,134,147}), tip = _Vzd({120,136,134,147,69,135,134,136,144,149,134,136,144,84,122,110,84,146,134,149,69,148,156,147,138,151,152,141,142,149}), callback = function()
			local owned = getOwnedToyNames()
			local map = getMapItems()
			local unowned = {}
			for name, data in pairs(map) do
				if not data.owned then unowned[#unowned+1] = name end
			end
			table.sort(unowned)
			notify(HUB_NAME, "Owned "..#owned.._Vzd({69,220,69,122,147,148,156,147,138,137,69,146,134,149,69})..#unowned, 3)
			if S.ownedList then
				for _, ch in ipairs(S.ownedList:GetChildren()) do if ch:IsA(_Vzd({121,138,157,153,103,154,153,153,148,147})) then ch:Destroy() end end
				for _, name in ipairs(owned) do
					local b = Instance.new("TextButton")
					b.Size = UDim2.new(1, -4, 0, 24)
					b.BackgroundColor3 = C.card
					b.BorderSizePixel = 0
					b.Font = Enum.Font.Gotham
					b.TextSize = 11
					b.TextColor3 = C.text
					b.Text = " " .. name
					b.Parent = S.ownedList
					corner(b, 5)
					b.MouseButton1Click:Connect(function() S.selectedToy = name; spawnToy(name) end)
				end
			end
			if S.unownedList then
				for _, ch in ipairs(S.unownedList:GetChildren()) do if ch:IsA("TextButton") then ch:Destroy() end end
				for _, name in ipairs(unowned) do
					local b = Instance.new("TextButton")
					b.Size = UDim2.new(1, -4, 0, 24)
					b.BackgroundColor3 = C.card
					b.BorderSizePixel = 0
					b.Font = Enum.Font.Gotham
					b.TextSize = 11
					b.TextColor3 = C.warn
					b.Text = " " .. name
					b.Parent = S.unownedList
					corner(b, 5)
					b.MouseButton1Click:Connect(function() bringUnownedByName(name) end)
				end
			end
		end })
		local ownedBox = Instance.new(_Vzd({107,151,134,146,138}))
		ownedBox.LayoutOrder = n()
		ownedBox.Size = UDim2.new(1, -6, 0, 120)
		ownedBox.BackgroundColor3 = C.bg
		ownedBox.BorderSizePixel = 0
		ownedBox.Parent = sc
		corner(ownedBox, 8)
		stroke(ownedBox, C.strokeSoft, 1)
		local ownedSc = Instance.new("ScrollingFrame")
		ownedSc.Size = UDim2.fromScale(1, 1)
		ownedSc.BackgroundTransparency = 1
		ownedSc.ScrollBarThickness = 3
		ownedSc.ScrollBarImageColor3 = C.accent
		ownedSc.AutomaticCanvasSize = Enum.AutomaticSize.Y
		ownedSc.CanvasSize = UDim2.new()
		ownedSc.Parent = ownedBox
		local ol = Instance.new(_Vzd({122,110,113,142,152,153,113,134,158,148,154,153})); ol.Padding = UDim.new(0, 3); ol.Parent = ownedSc
		pad(ownedSc, 4, 4, 4, 4)
		S.ownedList = ownedSc

		section(sc, _Vzd({122,115,116,124,115,106,105,69,114,102,117,69,110,121,106,114,120}), n())
		local unInfo = Instance.new("TextLabel")
		unInfo.LayoutOrder = n()
		unInfo.Size = UDim2.new(1, -6, 0, 36)
		unInfo.BackgroundColor3 = C.card
		unInfo.BorderSizePixel = 0
		unInfo.Font = Enum.Font.Gotham
		unInfo.TextSize = 10
		unInfo.TextColor3 = C.muted
		unInfo.TextXAlignment = Enum.TextXAlignment.Left
		unInfo.TextWrapped = true
		unInfo.Text = _Vzd({69,69,104,145,142,136,144,69,134,69,147,134,146,138,69,183,69,151,138,134,145,69,120,115,116,69,135,151,142,147,140,69,220,69,141,138,145,137,69,142,147,69,139,151,148,147,153,69,148,139,69,158,148,154,69,154,147,153,142,145,69,158,148,154,69,140,151,134,135,69,142,153})
		unInfo.Parent = sc
		corner(unInfo, 8)
		pad(unInfo, 6, 6, 6, 6)
		makeButton(sc, {
			order = n(),
			title = _Vzd({119,138,145,138,134,152,138,69,135,151,148,154,140,141,153,69,142,153,138,146,152}),
			danger = true,
			tip = _Vzd({120,153,148,149,69,141,148,145,137,142,147,140,69,142,153,138,146,152,69,77,144,138,138,149,152,69,148,156,147,138,151,152,141,142,149,69,142,139,69,158,148,154,69,134,145,151,138,134,137,158,69,140,151,134,135,135,138,137,78}),
			callback = function() releaseAllBrought() end,
		})
		local unBox = Instance.new("Frame")
		unBox.LayoutOrder = n()
		unBox.Size = UDim2.new(1, -6, 0, 140)
		unBox.BackgroundColor3 = C.bg
		unBox.BorderSizePixel = 0
		unBox.Parent = sc
		corner(unBox, 8)
		stroke(unBox, C.danger, 1)
		local unSc = Instance.new("ScrollingFrame")
		unSc.Size = UDim2.fromScale(1, 1)
		unSc.BackgroundTransparency = 1
		unSc.ScrollBarThickness = 3
		unSc.ScrollBarImageColor3 = C.danger
		unSc.AutomaticCanvasSize = Enum.AutomaticSize.Y
		unSc.CanvasSize = UDim2.new()
		unSc.Parent = unBox
		local ul = Instance.new("UIListLayout"); ul.Padding = UDim.new(0, 3); ul.Parent = unSc
		pad(unSc, 4, 4, 4, 4)
		S.unownedList = unSc
end
_TAB_BUILDERS["explosions"] = function(sc, n)
		section(sc, "MISSILE STRIKE", n())
		local exNote = Instance.new("TextLabel")
		exNote.LayoutOrder = n()
		exNote.Size = UDim2.new(1, -6, 0, 48)
		exNote.BackgroundColor3 = C.card
		exNote.BorderSizePixel = 0
		exNote.Font = Enum.Font.Gotham
		exNote.TextSize = 11
		exNote.TextColor3 = C.muted
		exNote.TextXAlignment = Enum.TextXAlignment.Left
		exNote.TextWrapped = true
		exNote.Text = "  Spawn missiles → own them → teleport onto the player → explode\n  Respects your toy limit (100 free / 200 pass)"
		exNote.Parent = sc
		corner(exNote, 8)
		pad(exNote, 6, 6, 6, 6)

		makeDropdown(sc, {
			order = n(),
			title = _Vzd({114,142,152,152,142,145,138,69,153,158,149,138}),
			options = { "BombMissile", "FireworkMissile", "BombBalloon", _Vzd({103,148,146,135,105,134,151,144,114,134,153,153,138,151}) },
			default = S.missileType or "BombMissile",
			callback = function(v) S.missileType = v end,
		})
		makeDropdown(sc, {
			order = n(),
			title = _Vzd({102,136,136,148,154,147,153,69,153,158,149,138}),
			options = { "Auto-detect", "No gamepass (100)", _Vzd({108,134,146,138,149,134,152,152,69,77,87,85,85,78}) },
			default = (S.toyPassMode == "pass" and "Gamepass (200)")
				or (S.toyPassMode == "free" and _Vzd({115,148,69,140,134,146,138,149,134,152,152,69,77,86,85,85,78}))
				or "Auto-detect",
			callback = function(v)
				if v:find(_Vzd({108,134,146,138,149,134,152,152}), 1, true) then S.toyPassMode = "pass"
				elseif v:find("No gamepass", 1, true) then S.toyPassMode = "free"
				else S.toyPassMode = "auto" end
			end,
		})
		S.playerDropdowns = S.playerDropdowns or {}
		makePlayerSearchList(sc, {
			clickFn = function(p) S.missileTarget = p; S.selected = p end,
		}, n)
		makeSlider(sc, {
			order = n(),
			title = _Vzd({114,142,152,152,142,145,138,152,69,149,138,151,69,135,154,151,152,153}),
			min = 1,
			max = 12,
			default = S.missileCount or 3,
			callback = function(v) S.missileCount = v end,
		})
		makeToggle(sc, {
			order = n(),
			id = "missileStrike",
			title = _Vzd({102,154,153,148,69,152,153,151,142,144,138,69,153,134,151,140,138,153}),
			tip = "Keeps spawning + exploding on the selected player",
			danger = true,
			callback = function(on)
				setMissileStrike(on)
			end,
		})
		makeButton(sc, {
			order = n(),
			title = _Vzd({107,142,151,138,69,148,147,136,138,69,77,135,154,151,152,153,78}),
			danger = true,
			tip = "Spawn N missiles and explode them on the target now",
			callback = fireMissilesOnce,
		})
		makeButton(sc, {
			order = n(),
			title = "Stop strike",
			danger = true,
			callback = function() stopMissileStrike() end,
		})
		makeButton(sc, {
			order = n(),
			title = _Vzd({105,138,145,138,153,138,69,146,158,69,146,142,152,152,142,145,138,152}),
			danger = true,
			callback = function()
				local n = 0
				for _, name in ipairs({ "BombMissile", "FireworkMissile", "BombBalloon", "BombDarkMatter" }) do
					n += destroyAllMyToys(name)
				end
				notify(HUB_NAME, _Vzd({104,145,138,134,151,138,137,69}) .. n, 1.2)
			end,
		})
end
_TAB_BUILDERS["world"] = function(sc, n)
		section(sc, "WORLD / OBJECTS", n())
		makeToggle(sc, { order = n(), id = "aura_netown", title = "Network Ownership Aura", tip = "OP continuous SNO", callback = function(on) setAura("netown", on) end })
		makeToggle(sc, { order = n(), id = "aura_fling", title = "Object/Player Fling Aura", tip = _Vzd({122,152,138,69,190,69,142,147,69,102,154,151,134,152,69,139,148,151,69,153,134,151,140,138,153,69,146,148,137,138}), callback = function(on) setAura("fling", on) end })
		makeButton(sc, { order = n(), title = _Vzd({107,145,142,147,140,69,115,138,134,151,135,158,69,116,147,136,138}), danger = true, callback = function()
			local cfg = getAura("fling")
			eachAuraTarget(cfg, function(p,r) flingPlayer(p, cfg.power, true) end, function(part) sno(part); applyVel(part, cfg.power, 0.5) end)
			notify(HUB_NAME, "Pulse fling", 1)
		end })
		makeToggle(sc, { order = n(), id = "unanchorAura", title = "Unanchor Aura", tip = _Vzd({122,147,134,147,136,141,148,151,69,80,69,120,115,116,69,147,138,134,151,135,158}), callback = function(on)
			stopLoop("unanchor")
			if on then startLoop("unanchor", 0.25, function()
				local me = hrp(); if not me then return end
				local n = 0
				for _, p in ipairs(workspace:GetDescendants()) do
					if p:IsA("BasePart") and p.Anchored and (p.Position-me.Position).Magnitude < (S.auraRange or 50) then
						if sno(p) then p.Anchored = false; n+=1 end
						if n > 20 then break end
					end
				end
			end) end
		end })
		makeButton(sc, { order = n(), title = _Vzd({104,145,138,134,151,69,115,138,134,151,135,158,69,103,148,137,158,114,148,155,138,151,152}), callback = function()
			local me = hrp(); if not me then return end
			for _, p in ipairs(workspace:GetDescendants()) do
				if (p:IsA("BodyVelocity") or p:IsA("BodyPosition")) and p.Parent and p.Parent:IsA("BasePart") then
					if (p.Parent.Position - me.Position).Magnitude < 80 then pcall(function() p:Destroy() end) end
				end
			end
		end })
		makeToggle(sc, { order = n(), id = "deleteTouch", title = _Vzd({105,138,145,138,153,138,69,121,148,154,136,141,138,137,69,117,134,151,153,152}), tip = "Destroy parts you touch", callback = function(on)
			if S.conns.delTouch then pcall(function() S.conns.delTouch:Disconnect() end) end
			if not on then return end
			local r = hrp(); if not r then return end
			S.conns.delTouch = r.Touched:Connect(function(hit)
				if hit:IsA("BasePart") and not hit:IsDescendantOf(char()) then
					if sno(hit) then pcall(function() hit:Destroy() end) end
				end
			end)
		end })
		makeButton(sc, { order = n(), title = _Vzd({103,151,142,147,140,69,102,145,145,69,115,138,134,151,135,158,69,116,135,143,138,136,153,152}), callback = function()
			local me = hrp(); if not me then return end
			local n = 0
			for _, p in ipairs(workspace:GetDescendants()) do
				if p:IsA("BasePart") and not p.Anchored and (p.Position-me.Position).Magnitude < 80 then
					if not LP.Character or not p:IsDescendantOf(LP.Character) then
						local m = p:FindFirstAncestorOfClass("Model")
						if not (m and Players:GetPlayerFromCharacter(m)) then
							sno(p); p.CFrame = me.CFrame * CFrame.new(0, 2, -6); n+=1
							if n > 30 then break end
						end
					end
				end
			end
			notify(HUB_NAME, "Brought "..n.." parts", 2)
		end })
end
_TAB_BUILDERS["visuals"] = function(sc, n)
		section(sc, "STEALTH", n())
		makeToggle(sc, {
			order = n(), id = "charInvis", title = "Character Invisibility",
			tip = "Body under map · camera stays on surface. Harder to grab/see.",
			callback = function(on)
				setCharacterInvis(on)
			end,
		})
		section(sc, "WHAT I SEE", n())
		makeToggle(sc, { order = n(), id = "esp", title = "Player ESP + Names", tip = "Highlight + billboard", callback = setESP })
		makeSlider(sc, { order = n(), title = _Vzd({106,120,117,69,107,142,145,145,69,121,151,134,147,152,149,134,151,138,147,136,158}), min = 0, max = 1, default = 0.5, step = 0.1,
			stateKey = "espFillTransparency", tip = _Vzd({109,148,156,69,152,138,138,82,153,141,151,148,154,140,141,69,153,141,138,69,141,142,140,141,145,142,140,141,153,69,139,142,145,145,69,142,152}), callback = function(v) S.espFillTransparency = v; if S.toggles.esp then setESP(true) end end })
		makeSlider(sc, { order = n(), title = _Vzd({106,120,117,69,116,154,153,145,142,147,138,69,121,151,134,147,152,149,134,151,138,147,136,158}), min = 0, max = 1, default = 0.3, step = 0.1,
			stateKey = "espOutlineTransparency", tip = _Vzd({109,148,156,69,152,138,138,82,153,141,151,148,154,140,141,69,153,141,138,69,148,154,153,145,142,147,138,69,142,152}), callback = function(v) S.espOutlineTransparency = v; if S.toggles.esp then setESP(true) end end })
		makeDropdown(sc, { order = n(), title = "ESP Depth Mode", options = { _Vzd({102,145,156,134,158,152,116,147,121,148,149}), "Occluded" }, default = "AlwaysOnTop",
			tip = "AlwaysOnTop = see through walls · Occluded = hidden by walls", callback = function(v) S.espDepthMode = v; if S.toggles.esp then setESP(true) end end })
		makeToggle(sc, { order = n(), id = _Vzd({139,154,145,145,135,151,142,140,141,153}), title = "Fullbright", tip = _Vzd({114,134,157,69,135,151,142,140,141,153,147,138,152,152,69,84,69,147,148,69,139,148,140}), callback = setFullbright })
		makeToggle(sc, { order = n(), id = "noFog", title = _Vzd({115,148,69,107,148,140}), callback = function(on) if on then Lighting.FogEnd=1e9 else Lighting.FogEnd=100000 end end })
		makeToggle(sc, { order = n(), id = "night", title = "Night Mode", callback = function(on) Lighting.ClockTime = on and 0 or 14 end })
		makeToggle(sc, { order = n(), id = "day", title = "Day Mode", callback = function(on) if on then Lighting.ClockTime = 14 end end })
		makeSlider(sc, { order = n(), title = "FOV", min = 50, max = 120, default = 70, callback = function(v)
			local cam = workspace.CurrentCamera; if cam then cam.FieldOfView = v end
		end })
		section(sc, "CAMERA", n())
		S.thirdPersonDist = S.thirdPersonDist or 12
		makeToggle(sc, {
			order = n(),
			id = "thirdPerson",
			title = "3rd Person Mode",
			tip = "Force Classic camera zoomed out (blocks first-person lock)",
			desc = "Scroll zoom still works within range",
			callback = function(on)
				stopLoop("thirdPerson")
				S.toggles.thirdPerson = on
				if on then
					local dist = tonumber(S.thirdPersonDist) or 12
					pcall(function()
						LP.CameraMode = Enum.CameraMode.Classic
						LP.CameraMinZoomDistance = dist
						LP.CameraMaxZoomDistance = math.max(LP.CameraMaxZoomDistance, math.max(dist + 20, 128))
						local cam = workspace.CurrentCamera
						local h = char() and char():FindFirstChildOfClass("Humanoid")
						if cam and h then
							cam.CameraType = Enum.CameraType.Custom
							cam.CameraSubject = h
						end
					end)
					startLoop(_Vzd({153,141,142,151,137,117,138,151,152,148,147}), 0.12, function()
						if not S.toggles.thirdPerson then return end
						local d = tonumber(S.thirdPersonDist) or 12
						pcall(function()
							LP.CameraMode = Enum.CameraMode.Classic
							if LP.CameraMinZoomDistance < d * 0.85 then
								LP.CameraMinZoomDistance = d
							end
							if LP.CameraMaxZoomDistance < d then
								LP.CameraMaxZoomDistance = math.max(d + 20, 128)
							end
							local cam = workspace.CurrentCamera
							if cam and cam.CameraType ~= Enum.CameraType.Custom and cam.CameraType ~= Enum.CameraType.Follow then
								cam.CameraType = Enum.CameraType.Custom
							end
							local h = char() and char():FindFirstChildOfClass("Humanoid")
							if cam and h and cam.CameraSubject ~= h then
								if not (controlState and controlState.running) then
									cam.CameraSubject = h
								end
							end
						end)
					end)
					notify(HUB_NAME, "3rd person ON · dist " .. tostring(dist), 1.2)
				else
					pcall(function()
						LP.CameraMode = Enum.CameraMode.Custom
						LP.CameraMinZoomDistance = 0.5
						LP.CameraMaxZoomDistance = 128
						local cam = workspace.CurrentCamera
						local h = char() and char():FindFirstChildOfClass("Humanoid")
						if cam then
							cam.CameraType = Enum.CameraType.Custom
							if h and not (controlState and controlState.running) then
								cam.CameraSubject = h
							end
						end
					end)
					notify(HUB_NAME, "3rd person OFF", 1)
				end
			end,
		})
		makeSlider(sc, {
			order = n(),
			title = _Vzd({88,151,137,69,117,138,151,152,148,147,69,105,142,152,153,134,147,136,138}),
			min = 4,
			max = 40,
			default = S.thirdPersonDist or 12,
			callback = function(v)
				S.thirdPersonDist = v
				if S.toggles.thirdPerson then
					pcall(function()
						LP.CameraMode = Enum.CameraMode.Classic
						LP.CameraMinZoomDistance = v
						LP.CameraMaxZoomDistance = math.max(LP.CameraMaxZoomDistance, v + 20)
					end)
				end
			end,
		})
		makeButton(sc, { order = n(), title = "Reset Lighting", callback = function()
			setFullbright(false); Lighting.ClockTime=14; Lighting.FogEnd=100000
			if S.hubOpen then setPurpleTint(true) else setPurpleTint(false) end
		end })
end
_TAB_BUILDERS["auto"] = function(sc, n)
		section(sc, "AUTO JOBS", n())
		makeToggle(sc, { order = n(), id = "antiafk", title = "Anti-AFK", callback = function(on)
			if S.conns.afk then pcall(function() S.conns.afk:Disconnect() end) end
			if on then S.conns.afk = LP.Idled:Connect(function()
				pcall(function() VirtualUser:CaptureController(); VirtualUser:ClickButton2(Vector2.new()) end)
			end) end
		end })
		makeToggle(sc, { order = n(), id = "autoFlingNearest", title = "Auto Fling Nearest", tip = _Vzd({118,154,142,138,153,69,145,148,148,149,69,154,147,153,142,145,69,153,141,138,158,69,137,142,138}), callback = function(on)
			stopLoop("autoFlingN")
			if on then startLoop(_Vzd({134,154,153,148,107,145,142,147,140,115}), 0.35, function()
				local me = hrp(); if not me then return end
				local best, bd = nil, S.auraRange or 50
				for _, p in ipairs(Players:GetPlayers()) do
					if validP(p) then
						local d = (rootOf(p).Position - me.Position).Magnitude
						if d < bd then best, bd = p, d end
					end
				end
				if best then flingPlayer(best, S.flingPower, true) end
			end) end
		end })
		makeToggle(sc, { order = n(), id = "autoKickNearest", title = _Vzd({102,154,153,148,69,112,142,136,144,69,115,138,134,151,138,152,153}), callback = function(on)
			stopLoop("autoKickN")
			if on then startLoop(_Vzd({134,154,153,148,112,142,136,144,115}), 0.4, function()
				local me = hrp(); if not me then return end
				for _, p in ipairs(Players:GetPlayers()) do
					if validP(p) and (rootOf(p).Position-me.Position).Magnitude < (S.auraRange or 50) then
						kickPlayer(p, S.kickType, true)
					end
				end
			end) end
		end })
		makeToggle(sc, { order = n(), id = "autoSNO", title = "Auto Network Own Aura", tip = "Alias of netown aura", callback = function(on)
			S.toggles.aura_netown = on; setAura("netown", on)
		end })
		makeToggle(sc, { order = n(), id = "autoRespawnPad", title = _Vzd({102,154,153,148,69,120,149,134,156,147,69,117,134,145,145,138,153,69,148,147,69,119,138,152,149,134,156,147}), callback = function(on)
			if S.conns.respawnPal then pcall(function() S.conns.respawnPal:Disconnect() end) end
			if on then S.conns.respawnPal = LP.CharacterAdded:Connect(function()
				task.wait(1); spawnToy("PalletLightBrown")
			end) end
		end })
		S.toggles.autoRejoin = (getgenv and type(getgenv) == "function" and getgenv().VOIDZ_ANTIKICK and getgenv().VOIDZ_ANTIKICK.enabled) == true
		makeToggle(sc, {
			order = n(), id = "autoRejoin", title = "Auto Rejoin if Kicked",
			tip = _Vzd({120,134,146,138,69,134,152,69,102,147,153,142,69,183,69,102,147,153,142,82,112,142,136,144,69,77,136,148,147,152,148,145,138,69,80,69,119,148,135,145,148,157,69,144,142,136,144,69,122,110,69,152,136,134,147,78}),
			callback = function(on) setAntiKick(on) end,
		})
		makeToggle(sc, { order = n(), id = "autoClaim", title = _Vzd({102,154,153,148,69,104,145,134,142,146,69,117,145,148,153}), tip = "Click plot signs / claim detectors nearby", callback = function(on)
			stopLoop("autoClaim")
			if on then startLoop("autoClaim", 0.8, function()
				local me = hrp(); if not me then return end
				for _, d in ipairs(workspace:GetDescendants()) do
					if d:IsA("ClickDetector") and d.Parent and d.Parent:IsA("BasePart") then
						local n = (d.Parent.Name .. " " .. (d.Parent.Parent and d.Parent.Parent.Name or "")):lower()
						if (d.Parent.Position - me.Position).Magnitude < 40 then
							if n:find("plot") or n:find("claim") or n:find("house") or n:find("sign")
								or (d.Parent.Position - me.Position).Magnitude < 18 then
								pcall(function() fireclickdetector(d) end)
							end
						end
					end
				end
			end) end
		end })
		makeToggle(sc, {
			order = n(), id = "autoSpin", title = _Vzd({102,154,153,148,82,120,149,142,147,69,104,148,142,147,152}),
			tip = _Vzd({124,141,138,147,69,134,145,145,69,152,145,148,153,69,145,142,140,141,153,152,69,134,151,138,69,115,138,148,147,95,69,121,117,69,148,147,69,138,134,136,141,69,156,141,138,138,145,69,109,134,147,137,145,138,69,80,69,120,115,116,69,77,163,86,152,69,138,134,136,141,78}),
			desc = "workspace.Slots · saves/returns position · ~5s between rounds",
			callback = function(on)
				setAutoSpinCoins(on)
			end,
		})
		makeButton(sc, {
			order = n(),
			title = _Vzd({120,149,142,147,69,104,148,142,147,152,69,116,147,136,138,69,115,148,156}),
			tip = _Vzd({116,147,138,69,139,154,145,145,69,149,134,152,152,69,147,148,156,69,77,142,140,147,148,151,138,152,69,115,138,148,147,69,156,134,142,153,78}),
			callback = function()
				task.spawn(function()
					local handles = scanSlotMachines()
					if #handles == 0 then
						notify(HUB_NAME, _Vzd({115,148,69,120,145,148,153,109,134,147,137,145,138,83,109,134,147,137,145,138,69,139,148,154,147,137}), 2)
						return
					end
					notify(HUB_NAME, _Vzd({120,149,142,147,147,142,147,140,69}) .. #handles .. "…", 1.5)
					local was = S.toggles.autoSpin
					S.toggles.autoSpin = true
					local me = hrp()
					if not me then S.toggles.autoSpin = was; return end
					local saved = me.CFrame
					local current = handles[1]
					local chase = true
					task.spawn(function()
						while chase and S.toggles.autoSpin do
							if current and current.Parent then
								tpAboveHandle(current)
								snoSlotHandle(current)
							end
							task.wait()
						end
					end)
					for _, handle in ipairs(handles) do
						if not handle.Parent then continue end
						current = handle
						local old = handle.CanCollide
						pcall(function() handle.CanCollide = false end)
						for _ = 1, 5 do
							tpAboveHandle(handle)
							snoSlotHandle(handle)
							task.wait(0.2)
						end
						pcall(function() handle.CanCollide = old end)
					end
					chase = false
					S.toggles.autoSpin = was
					local rr = hrp()
					if rr then pcall(function() rr.CFrame = saved end) end
					notify(HUB_NAME, "Spin once done", 1.5)
				end)
			end,
		})
		makeToggle(sc, {
			order = n(), id = "autoTimeReset", title = _Vzd({102,154,153,148,69,121,142,146,138,82,119,138,152,138,153}),
			tip = _Vzd({104,145,142,136,144,69,153,142,146,138,82,151,138,152,138,153,69,84,69,136,145,148,136,144,69,122,110,69,147,138,134,151,135,158,69,153,148,69,144,138,138,149,69,149,145,148,153,69,153,142,146,138}),
			callback = function(on)
				stopLoop("autoTime")
				if on then startLoop(_Vzd({134,154,153,148,121,142,146,138}), 2, function()
					local me = hrp(); if not me then return end
					for _, d in ipairs(workspace:GetDescendants()) do
						if d:IsA("ClickDetector") and d.Parent and d.Parent:IsA("BasePart") then
							local n = tostring(d.Parent.Name):lower()
							if (n:find("time") or n:find(_Vzd({151,138,152,138,153})) or n:find("clock") or n:find(_Vzd({149,151,138,152,138,151,155,138})))
								and (d.Parent.Position - me.Position).Magnitude < 50 then
								pcall(function() fireclickdetector(d) end)
							end
						end
					end
					for _, d in ipairs(workspace:GetDescendants()) do
						if d:IsA("ProximityPrompt") then
							local n = (d.ActionText .. " " .. d.ObjectText):lower()
							if n:find("time") or n:find(_Vzd({151,138,152,138,153})) then
								pcall(function() fireproximityprompt(d) end)
							end
						end
					end
				end) end
			end,
		})
		makeToggle(sc, {
			order = n(), id = "missileStrike", title = "Missile Strike (target)",
			tip = _Vzd({120,134,146,138,69,134,152,69,106,157,149,145,148,152,142,148,147,152,69,153,134,135,69,220,69,154,152,138,152,69,152,138,145,138,136,153,138,137,69,84,69,145,148,148,149,69,153,134,151,140,138,153}),
			danger = true,
			callback = function(on)
				if on then
					S.missileTarget = S.loopTarget or S.selected or S.missileTarget
					setMissileStrike(true)
				else
					stopMissileStrike()
				end
			end,
		})
		makeToggle(sc, {
			order = n(), id = "blobDestroyServer", title = _Vzd({105,138,152,153,151,148,158,69,120,138,151,155,138,151,69,77,103,145,148,135,146,134,147,78}),
			tip = "Same as Server tab · sit Blobman · CreatureGrab all",
			callback = function(on)
				if on then setMassToggle("destroySrv", true, destroyServerLoop) else stopMass("destroySrv") end
			end,
		})
		makeToggle(sc, {
			order = n(), id = "autoLagServer", title = "Lag Server",
			tip = _Vzd({120,134,146,138,69,134,152,69,120,138,151,155,138,151,69,153,134,135,69,220,69,104,151,138,134,153,138,108,151,134,135,113,142,147,138,69,142,147,153,138,147,152,142,153,158,69,152,149,134,146}),
			callback = function(on)
				if on then setMassToggle("lagSrv", true, lagServerLoop) else stopMass("lagSrv") end
			end,
		})
		makeToggle(sc, {
			order = n(), id = "autoDestroyHybrid", title = _Vzd({105,138,152,153,151,148,158,69,109,158,135,151,142,137,69,77,147,148,69,103,145,148,135,146,134,147,78}),
			tip = _Vzd({113,134,140,69,80,69,144,142,145,145,84,139,145,142,147,140,84,153,148,158,152,69,156,141,148,145,138,69,152,138,151,155,138,151}),
			callback = function(on)
				if on then setMassToggle("destroyHyb", true, destroyServerHybridLoop) else stopMass(_Vzd({137,138,152,153,151,148,158,109,158,135})) end
			end,
		})
end
_TAB_BUILDERS["console"] = function(sc, n)
		section(sc, "SURVIVAL", n())
		makeToggle(sc, {
			order = n(), id = "antiKill", title = _Vzd({102,147,153,142,82,112,142,145,145,69,77,124,134,153,138,151,69,84,69,102,136,142,137,78}),
			tip = "TP to safe house the instant you touch water or acid",
			callback = function(on)
				S.toggles.antiKill = on
				if on then
					startLoop("antiKillWater", 0.08, function()
						local r = hrp()
						if not r then return end
						local h = hum()
						if not h then return end
						local inWater = false
						pcall(function()
							if h:GetState() == Enum.HumanoidStateType.Swimming then inWater = true end
							if r.Position.Y < -8 then inWater = true end
							local ch = char()
							if ch then
								for _, p in ipairs(ch:GetDescendants()) do
									if p:IsA("BasePart") and p.Size.Y > 0 then
										if p.Position.Y < -8 then inWater = true break end
									end
								end
							end
						end)
						if inWater then
							local free, owned = collectHouseSpots()
							local pool = #free > 0 and free or owned
							if #pool > 0 then
								local pick = pool[math.random(1, #pool)]
								pcall(function()
									r.AssemblyLinearVelocity = Vector3.zero
									r.AssemblyAngularVelocity = Vector3.zero
									r.CFrame = pick.cf
								end)
								notify(HUB_NAME, _Vzd({102,147,153,142,82,144,142,145,145,69,220,69}) .. pick.name, 1.5)
							end
						end
					end)
					notify(HUB_NAME, _Vzd({102,147,153,142,82,144,142,145,145,69,116,115}), 1.5)
				else
					stopLoop(_Vzd({134,147,153,142,112,142,145,145,124,134,153,138,151}))
				end
			end,
		})
		makeButton(sc, {
			order = n(), title = _Vzd({121,117,69,121,148,69,120,134,139,138,69,117,145,134,136,138,69,115,148,156}),
			tip = "Instantly teleport to a random house",
			callback = function()
				local free, owned = collectHouseSpots()
				local pool = #free > 0 and free or owned
				if #pool > 0 then
					local pick = pool[math.random(1, #pool)]
					local r = hrp()
					if r then
						pcall(function()
							r.AssemblyLinearVelocity = Vector3.zero
							r.CFrame = pick.cf
						end)
						notify(HUB_NAME, "Safe TP · " .. pick.name, 1.5)
					end
				else
					notify(HUB_NAME, _Vzd({115,148,69,141,148,154,152,138,152,69,139,148,154,147,137}), 2)
				end
			end,
		})
		makeToggle(sc, {
			order = n(), id = "invincible", title = "Invincible (Lock In House)",
			tip = "Force yourself inside a house. Can't walk out or be forced out. Toggle OFF to leave.",
			callback = function(on)
				S.toggles.invincible = on
				if on then
					local free, owned = collectHouseSpots()
					local pool = #free > 0 and free or owned
					if #pool == 0 then
						notify(HUB_NAME, _Vzd({115,148,69,141,148,154,152,138,152,69,153,148,69,145,148,136,144,69,142,147,153,148}), 2)
						S.toggles.invincible = false
						return
					end
					local pick = pool[math.random(1, #pool)]
					S._invincibleCF = pick.cf
					local r = hrp()
					if r then
						pcall(function()
							r.AssemblyLinearVelocity = Vector3.zero
							r.CFrame = pick.cf
						end)
					end
					startLoop(_Vzd({142,147,155,142,147,136,142,135,145,138}), 0.05, function()
						if not S.toggles.invincible then return end
						local r = hrp()
						local h = hum()
						if not r or not S._invincibleCF then return end
						pcall(function()
							r.CFrame = S._invincibleCF
							r.AssemblyLinearVelocity = Vector3.zero
							r.AssemblyAngularVelocity = Vector3.zero
						end)
						if h then
							pcall(function()
								h.WalkSpeed = 0
								h.PlatformStand = true
							end)
						end
						if FTAP.Struggle then
							pcall(function() FTAP.Struggle:FireServer(LP) end)
						end
					end)
					notify(HUB_NAME, _Vzd({110,147,155,142,147,136,142,135,145,138,69,116,115,69,220,69,145,148,136,144,138,137,69,142,147,69}) .. pick.name, 2)
				else
					stopLoop("invincible")
					local h = hum()
					if h then
						pcall(function()
							h.WalkSpeed = 16
							h.PlatformStand = false
						end)
					end
					notify(HUB_NAME, _Vzd({110,147,155,142,147,136,142,135,145,138,69,116,107,107}), 1.5)
				end
			end,
		})
		makeToggle(sc, {
			order = n(), id = "spamTP", title = _Vzd({120,149,134,146,69,121,117,69,77,102,147,153,142,82,112,142,145,145,78}),
			tip = "Teleport around the map randomly at light speed. Can't be targeted or locked on.",
			callback = function(on)
				S.toggles.spamTP = on
				if on then
					local tpSpots = {
						CFrame.new(-352, 99, 354),
						CFrame.new(-584, -6, 93),
						CFrame.new(579, 124, -94),
						CFrame.new(-234, 83, -324),
						CFrame.new(4, -7, -3),
						CFrame.new(538, 96, -372),
						CFrame.new(17, -7, 539),
						CFrame.new(500, 62, -307),
						CFrame.new(-254, -7, 518),
						CFrame.new(296, -4, 494),
						CFrame.new(-516, -6, -162),
					}
					startLoop("spamTP", 0.06, function()
						if not S.toggles.spamTP then return end
						local r = hrp()
						if not r then return end
						local spot = tpSpots[math.random(1, #tpSpots)]
						spot = spot * CFrame.new(math.random(-8, 8), math.random(0, 4), math.random(-8, 8))
						pcall(function()
							r.AssemblyLinearVelocity = Vector3.zero
							r.AssemblyAngularVelocity = Vector3.zero
							r.CFrame = spot
						end)
					end)
					notify(HUB_NAME, "Spam TP ON · light speed", 1.5)
				else
					stopLoop(_Vzd({152,149,134,146,121,117}))
					notify(HUB_NAME, _Vzd({120,149,134,146,69,121,117,69,116,107,107}), 1)
				end
			end,
		})

		section(sc, "ANTI-KICK", n())
		makeToggle(sc, {
			order = n(), id = _Vzd({134,147,153,142,112,142,136,144,114,142,152,136}), title = "Anti-Kick (Rejoin)",
			tip = _Vzd({110,139,69,144,142,136,144,138,137,95,69,142,147,152,153,134,147,153,145,158,69,151,138,143,148,142,147,69,153,141,138,69,152,134,146,138,69,152,138,151,155,138,151}),
			callback = function(on)
				AK.enabled = on
				S.toggles.antiKick = on
				if on then
					AK.readyAt = os.clock() + 12
					notify(HUB_NAME, "Anti-kick ON · 12s grace", 2)
				else
					notify(HUB_NAME, _Vzd({102,147,153,142,82,144,142,136,144,69,116,107,107}), 1)
				end
			end,
		})
		makeToggle(sc, {
			order = n(), id = "antiAFK", title = _Vzd({102,147,153,142,82,102,107,112}),
			tip = _Vzd({117,151,138,155,138,147,153,152,69,142,137,145,138,69,144,142,136,144,69,135,158,69,152,142,146,154,145,134,153,142,147,140,69,142,147,149,154,153}),
			callback = function(on)
				S.toggles.antiAFK = on
				if on then
					S._antiAFKConn = LP.Idled:Connect(function()
						pcall(function()
							VirtualUser:Button2Down(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
							task.wait(1)
							VirtualUser:Button2Up(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
						end)
					end)
					notify(HUB_NAME, "Anti-AFK ON", 1.5)
				else
					if S._antiAFKConn then pcall(function() S._antiAFKConn:Disconnect() end) S._antiAFKConn = nil end
				end
			end,
		})
		makeToggle(sc, {
			order = n(), id = _Vzd({134,147,153,142,113,134,140}), title = "Anti-Lag",
			tip = "Disable CharacterAndBeamMove local script to reduce lag",
			callback = function(on)
				S.toggles.antiLag = on
				pcall(function()
					local script = LP.PlayerScripts:FindFirstChild("CharacterAndBeamMove")
					if script then script.Disabled = on end
				end)
			end,
		})

		section(sc, "MOVEMENT", n())
		makeToggle(sc, {
			order = n(), id = "noclip", title = "Noclip",
			tip = "CanCollide false every frame — walk through walls",
			callback = function() end,
		})
		makeToggle(sc, {
			order = n(), id = "speed", title = _Vzd({124,134,145,144,120,149,138,138,137,69,116,155,138,151,151,142,137,138}),
			tip = _Vzd({119,138,82,134,149,149,145,142,138,152,69,138,155,138,151,158,69,139,151,134,146,138,69,77,107,121,102,117,69,151,138,152,138,153,152,69,152,149,138,138,137,78}),
			callback = function() end,
		})
		makeSlider(sc, { order = n(), title = _Vzd({124,134,145,144,120,149,138,138,137}), min = 16, max = 300, default = 50, stateKey = "walkSpeed" })
		makeToggle(sc, {
			order = n(), id = "speedCFrame", title = _Vzd({104,107,151,134,146,138,69,120,149,138,138,137,69,103,148,148,152,153}),
			tip = _Vzd({106,157,153,151,134,69,104,107,151,134,146,138,69,149,154,152,141,69,57,69,139,134,152,153,138,151,69,153,141,134,147,69,156,134,145,144,69,152,149,138,138,137}),
			callback = function() end,
		})
		makeSlider(sc, { order = n(), title = "CFrame Mult", min = 1, max = 8, default = 2, stateKey = "speedMult" })
		makeToggle(sc, {
			order = n(), id = "infjump", title = _Vzd({110,147,139,142,147,142,153,138,69,111,154,146,149}),
			tip = _Vzd({111,154,146,149,119,138,150,154,138,152,153,69,183,69,139,148,151,136,138,69,111,154,146,149,69,156,141,142,145,138,69,116,115}),
			callback = function(on)
				S.toggles.infjump = on
				if S.conns.infJump then pcall(function() S.conns.infJump:Disconnect() end) S.conns.infJump = nil end
				if on then
					S.conns.infJump = UserInputService.JumpRequest:Connect(function()
						if not S.toggles.infjump then return end
						local h = hum()
						if h then pcall(function() h:ChangeState(Enum.HumanoidStateType.Jumping) h.Jump = true end) end
					end)
				end
			end,
		})
		makeToggle(sc, {
			order = n(), id = "jump", title = _Vzd({111,154,146,149,117,148,156,138,151,69,116,155,138,151,151,142,137,138}),
			callback = function() end,
		})
		makeSlider(sc, { order = n(), title = _Vzd({111,154,146,149,69,117,148,156,138,151}), min = 50, max = 500, default = 80, stateKey = "jumpPower" })
		makeButton(sc, {
			order = n(), title = "Reset Movement", danger = true,
			callback = function()
				S.toggles.speed = false; S.toggles.fly = false; S.toggles.noclip = false
				S.toggles.infjump = false; S.toggles.jump = false; S.toggles.speedCFrame = false
				setFly(false)
				local h = hum(); if h then h.WalkSpeed = 16; h.JumpPower = 50 end
			end,
		})

		section(sc, "SERVER", n())
		makeButton(sc, { order = n(), title = "Rejoin", callback = function()
			pcall(function() TeleportService:TeleportToPlaceInstance(game.PlaceId, game.JobId, LP) end)
		end })
		makeButton(sc, { order = n(), title = "Copy JobId", callback = function()
			if setclipboard then setclipboard(game.JobId) end; notify(HUB_NAME, "Copied", 1)
		end })
		makeButton(sc, { order = n(), title = _Vzd({119,138,152,138,153,69,136,141,134,151,134,136,153,138,151}), callback = function() local h = hum(); if h then h.Health = 0 end end })
		makeButton(sc, { order = n(), title = "Kill all loops", danger = true, callback = function()
			for k in pairs(S.loops) do S.loops[k] = false end
			for k in pairs(S.toggles) do
				if tostring(k):find("aura") or tostring(k):find("loop") or tostring(k):find("auto") then
					S.toggles[k] = false
				end
			end
			cancelFormBuild()
			clearFormWear(true)
			stopControl(true)
			notify(HUB_NAME, _Vzd({113,148,148,149,152,69,152,153,148,149,149,138,137}), 1.2)
		end })

		section(sc, "COMMAND CONSOLE", n())
		local outBox = Instance.new("ScrollingFrame")
		outBox.LayoutOrder = n()
		outBox.Size = UDim2.new(1, -6, 0, 150)
		outBox.BackgroundColor3 = Color3.fromRGB(6, 4, 12)
		outBox.BorderSizePixel = 0
		outBox.ScrollBarThickness = 3
		outBox.ScrollBarImageColor3 = C.accent
		outBox.AutomaticCanvasSize = Enum.AutomaticSize.Y
		outBox.CanvasSize = UDim2.new()
		outBox.Parent = sc
		corner(outBox, 8)
		stroke(outBox, C.stroke, 1)
		local outLay = Instance.new("UIListLayout")
		outLay.Padding = UDim.new(0, 2)
		outLay.Parent = outBox
		pad(outBox, 6, 6, 6, 6)
		S.consoleOut = outBox

		local function consPrint(line, col)
			if not S.consoleOut then return end
			local l = Instance.new("TextLabel")
			l.Size = UDim2.new(1, -4, 0, 0)
			l.AutomaticSize = Enum.AutomaticSize.Y
			l.BackgroundTransparency = 1
			l.Font = Enum.Font.Code
			l.TextSize = 11
			l.TextColor3 = col or C.text
			l.TextXAlignment = Enum.TextXAlignment.Left
			l.TextYAlignment = Enum.TextYAlignment.Top
			l.TextWrapped = true
			l.Text = tostring(line)
			l.Parent = S.consoleOut
			local kids = {}
			for _, ch in ipairs(S.consoleOut:GetChildren()) do
				if ch:IsA("TextLabel") then kids[#kids + 1] = ch end
			end
			while #kids > 80 do
				kids[1]:Destroy()
				table.remove(kids, 1)
			end
		end
		S.consPrint = consPrint
		consPrint(_Vzd({123,116,110,105,127,69,136,148,147,152,148,145,138,69,220,69,153,158,149,138,69,141,138,145,149}), C.accent2)
		consPrint(_Vzd({120,136,134,147,69,183,69,145,142,152,153,152,69,148,147,145,158,69,149,145,134,158,138,151,69,147,134,146,138,152,69,153,141,134,153,69,145,148,148,144,69,139,145,134,140,140,138,137,83}), C.muted)

		makeInput(sc, { order = n(), id = _Vzd({136,148,147,152,148,145,138,110,147,149,154,153}), placeholder = "cmd · help | fling name | scan" })
		makeButton(sc, {
			order = n(), title = "Run Command",
			callback = function()
				local box = S.consoleInput
				local line = box and box.Text or ""
				if line == "" then return end
				if box then box.Text = "" end
				runConsoleCommand(line)
			end,
		})
		makeButton(sc, {
			order = n(), title = _Vzd({120,136,134,147,69,117,145,134,158,138,151,152,69,77,138,157,149,145,148,142,153,69,152,142,140,147,152,78}),
			callback = function() runConsoleCommand("scan") end,
		})
		makeButton(sc, {
			order = n(), title = "Clear Console",
			callback = function()
				if S.consoleOut then
					for _, ch in ipairs(S.consoleOut:GetChildren()) do
						if ch:IsA("TextLabel") then ch:Destroy() end
					end
				end
				consPrint("cleared", C.muted)
			end,
		})
		task.defer(function()
			if S.consoleInput then
				S.consoleInput.FocusLost:Connect(function(enter)
					if enter and S.consoleInput.Text ~= "" then
						local line = S.consoleInput.Text
						S.consoleInput.Text = ""
						runConsoleCommand(line)
					end
				end)
			end
		end)

		section(sc, "TOOLS", n())
		makeButton(sc, { order = n(), title = _Vzd({105,138,145,138,153,138,69,146,158,69,153,148,158,152}), danger = true, callback = function()
			notify(HUB_NAME, "Cleared " .. destroyAllMyToys(), 1.2)
		end })
end
_TAB_BUILDERS["control"] = function(sc, n)
		section(sc, "CONTROL", n())
		local ctrlNote = Instance.new("TextLabel")
		ctrlNote.LayoutOrder = n()
		ctrlNote.Size = UDim2.new(1, -6, 0, 36)
		ctrlNote.BackgroundColor3 = C.card
		ctrlNote.BorderSizePixel = 0
		ctrlNote.Font = Enum.Font.Gotham
		ctrlNote.TextSize = 11
		ctrlNote.TextColor3 = C.muted
		ctrlNote.TextXAlignment = Enum.TextXAlignment.Left
		ctrlNote.TextWrapped = true
		ctrlNote.Text = _Vzd({69,113,148,148,144,69,134,153,69,153,141,138,146,69,80,69,98,69,220,69,124,102,120,105,69,137,151,142,155,138,152,69,220,69,98,69,134,140,134,142,147,69,153,148,69,137,151,148,149})
		ctrlNote.Parent = sc
		corner(ctrlNote, 8)
		pad(ctrlNote, 8, 8, 8, 8)

		S.playerDropdowns = S.playerDropdowns or {}
		S._ctrlSearchRefresh = makePlayerSearchList(sc, {
			clickFn = function(p) S.controlPick = p; S.selected = p end,
		}, n)

		makeButton(sc, {
			order = n(),
			title = "Refresh",
			callback = function()
				if S._ctrlSearchRefresh then S._ctrlSearchRefresh() end
				local nPl = #playerLabels()
				notify(HUB_NAME, nPl .. _Vzd({69,149,145,134,158,138,151}) .. (nPl == 1 and "" or "s"), 1)
			end,
		})
		makeButton(sc, {
			order = n(),
			title = _Vzd({104,148,147,153,151,148,145,69,152,138,145,138,136,153,138,137}),
			callback = function() controlSelectedPlayer() end,
		})
		if S.toggles.controlBindC == nil then S.toggles.controlBindC = false end
		makeToggle(sc, {
			order = n(),
			id = "controlBindC",
			title = "= · look control",
			tip = "Ray from head along camera. On by default.",
			callback = function(on)
				installControlKeyC(on)
			end,
		})
		makeButton(sc, {
			order = n(),
			title = "Control look target",
			callback = function() controlBindLook() end,
		})
		makeButton(sc, {
			order = n(),
			title = "Control nearest",
			callback = function()
				local p = nearestControlPlayer(1e9)
				if not p or not p.Character then
					notify(HUB_NAME, "Nobody", 1)
					return
				end
				S.selected = p
				S.controlPick = p
				if S._ctrlSearchRefresh then pcall(S._ctrlSearchRefresh) end
				startControl(p.Character)
			end,
		})
		makeButton(sc, {
			order = n(),
			title = _Vzd({104,148,147,153,151,148,145,69,115,117,104}),
			tip = _Vzd({103,145,148,135,146,134,147,69,84,69,137,138,136,148,158,69,84,69,151,148,135,145,148,157,142,134,147}),
			callback = function() controlLookNPC() end,
		})
		makeButton(sc, {
			order = n(),
			title = "Stop",
			danger = true,
			callback = function() stopControl() end,
		})
end
_TAB_BUILDERS[_Vzd({153,151,134,147,152})] = function(sc, n)
		section(sc, _Vzd({104,109,102,121,69,121,119,102,115,120,113,102,121,116,119}), n())
		local TRAN_LANGS = {
			English = "en", Spanish = "es", French = "fr", German = "de",
			Portuguese = "pt", Japanese = "ja", Korean = "ko", Chinese = _Vzd({159,141,82,104,115}),
			Russian = "ru", Arabic = "ar", Italian = "it", Hindi = "hi",
		}
		local function detectLang(text)
			for _, c in utf8.codes(text) do
				if c > 0x2FFF then
					if c >= 0x4E00 and c <= 0x9FFF then return "zh" end
					if c >= 0x3040 and c <= 0x30FF then return "ja" end
					if c >= 0xAC00 and c <= 0xD7AF then return "ko" end
					return "unk"
				end
			end
			if text:find("[\192-\255]") then return "detect" end
			return "en"
		end
		local function translateHttp(text, from, to)
			local ok, res = pcall(function()
				local url = "https://api.mymemory.translated.net/get?q=" .. game.HttpService:UrlEncode(text) .. "&langpair=" .. from .. "|" .. to
				return game:HttpGet(url)
			end)
			if not ok or not res then return nil end
			local ok2, data = pcall(game.HttpService.JSONDecode, game.HttpService, res)
			if ok2 and data and data.responseData and data.responseData.translatedText then
				return data.responseData.translatedText
			end
			return nil
		end
		local function langCode(langName)
			return TRAN_LANGS[langName] or "en"
		end
		local function isSameLang(a, b)
			if a == b then return true end
			if a == _Vzd({137,138,153,138,136,153}) and b ~= "en" then return false end
			return false
		end
		makeToggle(sc, {
			order = n(), id = "autoTranslate", title = "Auto Translate Chat",
			tip = _Vzd({105,138,153,138,136,153,152,69,147,148,147,82,106,147,140,145,142,152,141,69,146,138,152,152,134,140,138,152,69,134,147,137,69,152,141,148,156,152,69,106,147,140,145,142,152,141,69,153,151,134,147,152,145,134,153,142,148,147}),
			callback = function(on)
				S.toggles.autoTranslate = on
				notify(HUB_NAME, _Vzd({102,154,153,148,82,153,151,134,147,152,145,134,153,138,69}) .. (on and "ON" or "OFF"), 1.5)
			end,
		})
		makeDropdown(sc, {
			order = n(), title = _Vzd({121,151,134,147,152,145,134,153,138,69,121,148}),
			options = { "English", "Spanish", "French", "German", "Portuguese", "Japanese", "Korean", "Chinese", "Russian", "Arabic", _Vzd({110,153,134,145,142,134,147}), "Hindi" },
			default = S.transLang or "English",
			callback = function(v) S.transLang = v end,
		})
		section(sc, "CHAT LOGS", n())
		local chatLogHost = Instance.new("Frame")
		chatLogHost.LayoutOrder = n()
		chatLogHost.Size = UDim2.new(1, -6, 0, 200)
		chatLogHost.BackgroundColor3 = C.bg
		chatLogHost.BorderSizePixel = 0
		chatLogHost.ClipsDescendants = true
		chatLogHost.Parent = sc
		corner(chatLogHost, 8)
		stroke(chatLogHost, C.strokeSoft, 1)
		local chatLogSc = Instance.new("ScrollingFrame")
		chatLogSc.Size = UDim2.fromScale(1, 1)
		chatLogSc.BackgroundTransparency = 1
		chatLogSc.ScrollBarThickness = 3
		chatLogSc.ScrollBarImageColor3 = C.accent
		chatLogSc.AutomaticCanvasSize = Enum.AutomaticSize.Y
		chatLogSc.CanvasSize = UDim2.new()
		chatLogSc.Parent = chatLogHost
		local chatLogLay = Instance.new("UIListLayout")
		chatLogLay.Padding = UDim.new(0, 3)
		chatLogLay.Parent = chatLogSc
		pad(chatLogSc, 4, 4, 4, 4)
		S.chatLogFrame = chatLogSc
		local function addChatLog(player, message, translation)
			if not S.chatLogFrame then return end
			local row = Instance.new("TextLabel")
			row.Size = UDim2.new(1, -4, 0, translation and 32 or 20)
			row.BackgroundColor3 = C.card
			row.BackgroundTransparency = 0.5
			row.BorderSizePixel = 0
			row.Font = Enum.Font.Gotham
			row.TextSize = 10
			row.TextColor3 = C.text
			row.TextXAlignment = Enum.TextXAlignment.Left
			row.TextWrapped = true
			local txt = " [" .. tostring(player or "?") .. "] " .. tostring(message or "")
			if translation then
				txt = txt .. "\n  > " .. tostring(translation)
				row.TextColor3 = C.accent
			end
			row.Text = txt
			row.ZIndex = 2
			row.Parent = S.chatLogFrame
			corner(row, 4)
		end
		local function transConnect(plr)
			if plr == LP then return end
			plr.Chatted:Connect(function(msg)
				addChatLog(plr.Name, msg)
				if not S.toggles.autoTranslate then return end
				task.spawn(function()
					local srcLang = detectLang(msg)
					if srcLang == "en" then return end
					local targetCode = langCode(S.transLang or "English")
					if isSameLang(srcLang, targetCode) then return end
					local from = (srcLang == "detect") and "auto" or srcLang
					local translated = translateHttp(msg, from, targetCode)
					if translated and translated ~= msg then
						addChatLog(plr.Name .. " [" .. (S.transLang or "EN") .. "]", translated)
						notify(HUB_NAME, plr.Name .. ": " .. translated:sub(1, 80), 3)
					end
				end)
			end)
		end
		for _, plr in ipairs(Players:GetPlayers()) do transConnect(plr) end
		Players.PlayerAdded:Connect(function(plr) transConnect(plr) end)
		makeButton(sc, {
			order = n(), title = _Vzd({104,145,138,134,151,69,104,141,134,153,69,113,148,140}),
			callback = function()
				if S.chatLogFrame then
					for _, ch in ipairs(S.chatLogFrame:GetChildren()) do
						if ch:IsA("TextLabel") then ch:Destroy() end
					end
				end
				notify(HUB_NAME, "Chat log cleared", 1)
			end,
		})
end
_TAB_BUILDERS["sounds"] = function(sc, n)
		section(sc, "SPAM SOUNDS", n())
		local sndNote = Instance.new("TextLabel")
		sndNote.LayoutOrder = n()
		sndNote.Size = UDim2.new(1, -6, 0, 48)
		sndNote.BackgroundColor3 = C.card
		sndNote.BorderSizePixel = 0
		sndNote.Font = Enum.Font.Gotham
		sndNote.TextSize = 11
		sndNote.TextColor3 = C.muted
		sndNote.TextWrapped = true
		sndNote.TextXAlignment = Enum.TextXAlignment.Left
		sndNote.Text = "Pick a voice line, hit Play to send it in chat (server hears it + plays sound). Spam toggle loops it."
		sndNote.Parent = sc
		corner(sndNote, 8)
		pad(sndNote, 8, 8, 8, 8)

		local SOUND_TRIGGERS = {
			{ label = _Vzd({109,138,145,145,148}),     word = "Hello" },
			{ label = "Hi",        word = "Hi" },
			{ label = "Hey",       word = "Hey" },
			{ label = "Oi",        word = "Oi" },
			{ label = "Yo",        word = "Yo" },
			{ label = "Heyo",      word = "Heyo" },
			{ label = "Ayo",       word = "Ayo" },
			{ label = "Mommy",     word = "Mommy" },
			{ label = "Daddy",     word = "Daddy" },
			{ label = "Baby",      word = "Baby" },
			{ label = "UwU",       word = "UwU" },
			{ label = "OwO",       word = "OwO" },
			{ label = ":)",        word = ":)" },
			{ label = ":D",        word = ":D" },
			{ label = "Hooray",    word = "Hooray" },
			{ label = "Yay",       word = "Yay" },
			{ label = "Weee",      word = "Weee" },
			{ label = "Fun",       word = "Fun" },
			{ label = "Mountain",  word = _Vzd({114,148,154,147,153,134,142,147}) },
			{ label = "Yodel",     word = "Yodel" },
			{ label = "Yodeling",  word = "Yodeling" },
			{ label = "Sing",      word = "Sing" },
			{ label = "Oof",       word = "Oof" },
			{ label = "Ouch",      word = "Ouch" },
			{ label = "Dead",      word = "Dead" },
			{ label = "Ded",       word = "Ded" },
			{ label = "Kill",      word = "Kill" },
			{ label = "Ow",        word = "Ow" },
			{ label = "Oops",      word = "Oops" },
			{ label = "Oop",       word = "Oop" },
			{ label = "Bruh",      word = "Bruh" },
			{ label = "Lol",       word = "Lol" },
			{ label = "Noob",      word = "Noob" },
		}

		local triggerLabels = {}
		for _, t in ipairs(SOUND_TRIGGERS) do
			table.insert(triggerLabels, t.label)
		end

		S.selectedSound = S.selectedSound or SOUND_TRIGGERS[1].word

		local function getSelectedWord()
			for _, t in ipairs(SOUND_TRIGGERS) do
				if t.label == S.selectedSound then return t.word end
			end
			return SOUND_TRIGGERS[1].word
		end

		local _, sndDrop = makeDropdown(sc, {
			order = n(),
			title = _Vzd({123,148,142,136,138,69,113,142,147,138}),
			options = triggerLabels,
			default = S.selectedSound or triggerLabels[1],
			callback = function(lab)
				for _, t in ipairs(SOUND_TRIGGERS) do
					if t.label == lab then
						S.selectedSound = t.label
						break
					end
				end
			end,
		})

		makeButton(sc, {
			order = n(),
			title = "Play Sound",
			callback = function()
				local word = getSelectedWord()
				voidzChat(word)
				notify(HUB_NAME, _Vzd({117,145,134,158,138,137,95,69}) .. word, 1)
			end,
		})

		makeToggle(sc, {
			order = n(),
			id = "spamSounds",
			title = "Spam Sound Loop",
			tip = "Keeps sending the trigger word in chat",
			callback = function(on)
				S.toggles.spamSounds = on
				if on then
					task.spawn(function()
						while S.toggles.spamSounds do
							local word = getSelectedWord()
							voidzChatSpam(word)
							local spd = (S.sliderVal and S.sliderVal.spamSoundSpeed) or 1.5
							task.wait(spd)
						end
					end)
				end
			end,
		})

		makeSlider(sc, {
			order = n(),
			id = "spamSoundSpeed",
			title = _Vzd({120,149,134,146,69,120,149,138,138,137,69,77,152,138,136,78}),
			min = 0.5,
			max = 5,
			default = S.sliderVal and S.sliderVal.spamSoundSpeed or 1.5,
			callback = function(v)
				S.sliderVal = S.sliderVal or {}
				S.sliderVal.spamSoundSpeed = v
			end,
		})

		section(sc, _Vzd({118,122,110,104,112,69,117,113,102,126}), n())
		local quickSounds = { "Mommy", "Daddy", "Oof", "Kill", "Yay", "UwU", "Hello", "Ayo", "Bruh", "Lol", "Noob" }
		for _, name in ipairs(quickSounds) do
			makeButton(sc, {
				order = n(),
				title = name,
				callback = function()
					for _, t in ipairs(SOUND_TRIGGERS) do
						if t.label == name then
							voidzChat(t.word)
							notify(HUB_NAME, _Vzd({117,145,134,158,138,137,95,69}) .. name, 0.8)
							break
						end
					end
				end,
			})
		end
end
_TAB_BUILDERS["fun"] = function(sc, n)
		section(sc, "CONTROL PLAYER", n())
		local ctrlNote = Instance.new("TextLabel")
		ctrlNote.LayoutOrder = n()
		ctrlNote.Size = UDim2.new(1, -6, 0, 36)
		ctrlNote.BackgroundColor3 = C.card
		ctrlNote.BorderSizePixel = 0
		ctrlNote.Font = Enum.Font.Gotham
		ctrlNote.TextSize = 11
		ctrlNote.TextColor3 = C.muted
		ctrlNote.TextXAlignment = Enum.TextXAlignment.Left
		ctrlNote.TextWrapped = true
		ctrlNote.Text = _Vzd({69,113,148,148,144,69,134,153,69,153,141,138,146,69,80,69,98,69,144,138,158,69,220,69,124,102,120,105,69,137,151,142,155,138,152,69,153,141,138,146,69,220,69,98,69,134,140,134,142,147,69,153,148,69,137,151,148,149})
		ctrlNote.Parent = sc
		corner(ctrlNote, 8)
		pad(ctrlNote, 8, 8, 8, 8)

		S.playerDropdowns = S.playerDropdowns or {}
		S._funControlSearchRefresh = makePlayerSearchList(sc, {
			clickFn = function(p) S.controlPick = p; S.selected = p end,
		}, n)

		makeButton(sc, {
			order = n(),
			title = _Vzd({119,138,139,151,138,152,141,69,117,145,134,158,138,151,152}),
			callback = function()
				if S._funControlSearchRefresh then S._funControlSearchRefresh() end
				local nPl = #playerLabels()
				notify(HUB_NAME, nPl .. _Vzd({69,149,145,134,158,138,151}) .. (nPl == 1 and "" or "s"), 1)
			end,
		})
		makeButton(sc, {
			order = n(),
			title = _Vzd({104,148,147,153,151,148,145,69,120,138,145,138,136,153,138,137}),
			callback = function() controlSelectedPlayer() end,
		})
		if S.toggles.controlBindC == nil then S.toggles.controlBindC = false end
		makeToggle(sc, {
			order = n(),
			id = "controlBindC",
			title = _Vzd({98,69,112,138,158,69,220,69,113,148,148,144,69,104,148,147,153,151,148,145}),
			tip = "Ray from head along camera. On by default.",
			callback = function(on)
				installControlKeyC(on)
			end,
		})
		makeButton(sc, {
			order = n(),
			title = _Vzd({104,148,147,153,151,148,145,69,113,148,148,144,69,121,134,151,140,138,153}),
			callback = function() controlBindLook() end,
		})
		makeButton(sc, {
			order = n(),
			title = _Vzd({104,148,147,153,151,148,145,69,115,138,134,151,138,152,153}),
			callback = function()
				local p = nearestControlPlayer(1e9)
				if not p or not p.Character then
					notify(HUB_NAME, "Nobody", 1)
					return
				end
				S.selected = p
				S.controlPick = p
				if S._funControlSearchRefresh then pcall(S._funControlSearchRefresh) end
				startControl(p.Character)
			end,
		})
		makeButton(sc, {
			order = n(),
			title = "Control NPC",
			tip = _Vzd({103,145,148,135,146,134,147,69,84,69,137,138,136,148,158,69,84,69,151,148,135,145,148,157,142,134,147}),
			callback = function() controlLookNPC() end,
		})
		makeButton(sc, {
			order = n(),
			title = _Vzd({120,153,148,149,69,104,148,147,153,151,148,145}),
			danger = true,
			callback = function() stopControl() end,
		})

		section(sc, "HOLD · EAT / INSTRUMENTS", n())
		local holdNote = Instance.new("TextLabel")
		holdNote.LayoutOrder = n()
		holdNote.Size = UDim2.new(1, -6, 0, 36)
		holdNote.BackgroundColor3 = C.card
		holdNote.BorderSizePixel = 0
		holdNote.Font = Enum.Font.Gotham
		holdNote.TextSize = 10
		holdNote.TextColor3 = C.muted
		holdNote.TextXAlignment = Enum.TextXAlignment.Left
		holdNote.TextYAlignment = Enum.TextYAlignment.Top
		holdNote.TextWrapped = true
		holdNote.Text = " Auto-equip and use food (eat all) or instruments (play all).\n Spawn → WaitForChild(HoldPart) → Hold → Use.\n SprayCan is touch-based (use Paint section below)."
		holdNote.Parent = sc
		corner(holdNote, 8)
		pad(holdNote, 6, 6, 6, 6)
		local HOLD_ITEMS = {
			_Vzd({107,148,148,137,103,134,147,134,147,134}), "FoodBread",
			"InstrumentDrumSnare", "InstrumentGuitar", "InstrumentPiano",
		}
		makeDropdown(sc, {
			order = n(),
			title = "Item to Hold",
			options = HOLD_ITEMS,
			default = S.holdItem or HOLD_ITEMS[1],
			callback = function(v) S.holdItem = v end,
		})

		local function doHoldAndUse(itemName)
			local me = hrp()
			if not me then notify(HUB_NAME, "No character", 1.5) return false end
			local char = LP.Character
			if not char then return false end

			local myFolder = workspace:FindFirstChild(LP.Name .. "SpawnedInToys")
			local model = nil
			if myFolder then
				model = myFolder:FindFirstChild(itemName)
			end

			if not model then
				pcall(function()
					if FTAP.SpawnToy then
						FTAP.SpawnToy:InvokeServer(itemName, me.CFrame * CFrame.new(0, 3, -3), Vector3.zero)
					end
				end)
				task.wait(0.3)
				pcall(function()
					if FTAP.BuyToy then FTAP.BuyToy:InvokeServer(itemName) end
				end)
				for _ = 1, 30 do
					if myFolder then model = myFolder:FindFirstChild(itemName) end
					if not model then model = workspace:FindFirstChild(itemName, true) end
					if model then break end
					task.wait(0.1)
				end
			end

			if not model then notify(HUB_NAME, _Vzd({107,134,142,145,138,137,69,153,148,69,152,149,134,156,147,69}) .. itemName, 1.5) return false end

			local holdPart = model:FindFirstChild("HoldPart")
			if not holdPart then
				holdPart = model:WaitForChild("HoldPart", 3)
			end
			if not holdPart then notify(HUB_NAME, "No HoldPart on " .. itemName, 1.5) return false end

			local holdRF = holdPart:FindFirstChild("HoldItemRemoteFunction")
			if not holdRF then
				holdRF = holdPart:WaitForChild(_Vzd({109,148,145,137,110,153,138,146,119,138,146,148,153,138,107,154,147,136,153,142,148,147}), 3)
			end
			local rigid = holdPart:FindFirstChild("RigidConstraint")

			local isHeld = false
			if rigid and rigid:FindFirstChild("Attachment1") then
				local att = rigid.Attachment1
				if att and att:IsDescendantOf(char) then
					isHeld = true
				end
			end

			if not isHeld and holdRF then
				pcall(function()
					holdRF:InvokeServer(model, char)
				end)
				for _ = 1, 20 do
					if rigid and rigid:FindFirstChild("Attachment1") then
						local att2 = rigid.Attachment1
						if att2 and att2:IsDescendantOf(char) then
							isHeld = true
							break
						end
					end
					task.wait(0.1)
				end
			end

			if not isHeld then notify(HUB_NAME, _Vzd({107,134,142,145,138,137,69,153,148,69,141,148,145,137,69}) .. itemName, 1.5) return false end

			local eatingSound = holdPart:FindFirstChild("EatingSound")
			local canUse = true
			if eatingSound and eatingSound.IsPlaying then
				canUse = false
			end

			if canUse then
				local he = ReplicatedStorage:FindFirstChild("HoldEvents")
				local useEvt = he and he:FindFirstChild("Use")
				if useEvt then
					pcall(function() useEvt:FireServer(model) end)
					task.wait(0.5)
				end
			end

			return true
		end

		makeButton(sc, {
			order = n(),
			title = _Vzd({109,148,145,137,69,80,69,122,152,138,69,110,153,138,146}),
			tip = "Spawn → Hold → Use the selected item (full state check)",
			callback = function()
				local item = S.holdItem or "FoodBanana"
				local ok = doHoldAndUse(item)
				if ok then notify(HUB_NAME, "Used " .. item, 1) end
			end,
		})
		makeButton(sc, {
			order = n(),
			title = "Eat All Food",
			tip = _Vzd({120,149,134,156,147,152,69,107,148,148,137,103,134,147,134,147,134,69,80,69,107,148,148,137,103,151,138,134,137,81,69,141,148,145,137,152,69,138,134,136,141,81,69,138,134,153,152,69,153,141,138,146}),
			callback = function()
				local foods = { "FoodBanana", "FoodBread" }
				for _, food in ipairs(foods) do
					local ok = doHoldAndUse(food)
					if ok then task.wait(1) end
				end
				notify(HUB_NAME, "Ate all food", 1)
			end,
		})
		makeButton(sc, {
			order = n(),
			title = _Vzd({122,152,138,69,102,145,145,69,110,147,152,153,151,154,146,138,147,153,152}),
			tip = _Vzd({120,149,134,156,147,152,69,138,134,136,141,69,142,147,152,153,151,154,146,138,147,153,81,69,141,148,145,137,152,69,142,153,81,69,149,145,134,158,152,69,142,153}),
			callback = function()
				local insts = { "InstrumentDrumSnare", "InstrumentGuitar", "InstrumentPiano" }
				for _, inst in ipairs(insts) do
					local ok = doHoldAndUse(inst)
					if ok then task.wait(1) end
				end
				notify(HUB_NAME, _Vzd({117,145,134,158,138,137,69,134,145,145,69,142,147,152,153,151,154,146,138,147,153,152}), 1)
			end,
		})

		section(sc, "SPRAY PAINT", n())
		local paintNote = Instance.new("TextLabel")
		paintNote.LayoutOrder = n()
		paintNote.Size = UDim2.new(1, -6, 0, 36)
		paintNote.BackgroundColor3 = C.card
		paintNote.BorderSizePixel = 0
		paintNote.Font = Enum.Font.Gotham
		paintNote.TextSize = 10
		paintNote.TextColor3 = C.muted
		paintNote.TextXAlignment = Enum.TextXAlignment.Left
		paintNote.TextYAlignment = Enum.TextYAlignment.Top
		paintNote.TextWrapped = true
		paintNote.Text = " SprayCanWD is touch-based — uses firetouchinterest, not HoldPart.\n Spawn can → touch target with StickyRemoverPart → delete."
		paintNote.Parent = sc
		corner(paintNote, 8)
		pad(paintNote, 6, 6, 6, 6)
		makeButton(sc, {
			order = n(),
			title = _Vzd({120,149,151,134,158,69,117,134,142,147,153,69,121,134,151,140,138,153}),
			tip = _Vzd({120,149,134,156,147,69,120,149,151,134,158,104,134,147,124,105,81,69,139,142,151,138,153,148,154,136,141,142,147,153,138,151,138,152,153,69,148,147,69,153,134,151,140,138,153}),
			callback = function()
				local p = S.selected
				if not p or not validP(p) or not p.Character then
					notify(HUB_NAME, "Pick a player first", 1.2) return
				end
				local me = hrp()
				if not me then return end
				local r = rootOf(p)
				if not r then return end
				pcall(function() if FTAP.BuyToy then FTAP.BuyToy:InvokeServer("SprayCanWD") end end)
				task.wait(0.3)
				pcall(function()
					if FTAP.SpawnToy then
						FTAP.SpawnToy:InvokeServer("SprayCanWD", me.CFrame * CFrame.new(0, 3, -3), Vector3.zero)
					end
				end)
				task.wait(0.5)
				pcall(function()
					local myFolder = workspace:FindFirstChild(LP.Name .. "SpawnedInToys")
					local can = myFolder and myFolder:FindFirstChild("SprayCanWD")
					if not can then can = workspace:FindFirstChild("SprayCanWD", true) end
					if can then
						local sticky = can:FindFirstChild("StickyRemoverPart")
						if sticky then
							if firetouchinterest then
								firetouchinterest(sticky, r, 0)
								task.wait(0.1)
								firetouchinterest(sticky, r, 1)
							else
								sticky.CFrame = r.CFrame
								task.wait(0.2)
							end
						end
					end
				end)
				notify(HUB_NAME, _Vzd({120,149,151,134,158,69,149,134,142,147,153,69,139,142,151,138,137}), 1)
			end,
		})
		makeToggle(sc, {
			order = n(), id = "loopPaint", title = "Loop Spray Paint",
			tip = _Vzd({104,148,147,153,142,147,154,148,154,152,145,158,69,152,149,134,156,147,69,80,69,152,149,151,134,158,69,148,147,69,152,138,145,138,136,153,138,137,69,153,134,151,140,138,153}),
			callback = function(on)
				S.toggles.loopPaint = on
				if on then
					task.spawn(function()
						notify(HUB_NAME, _Vzd({113,148,148,149,69,149,134,142,147,153,69,116,115}), 1.5)
						while S.toggles.loopPaint do
							local p = S.selected
							if p and validP(p) and p.Character then
								local me = hrp()
								local r = rootOf(p)
								if me and r then
									pcall(function() if FTAP.BuyToy then FTAP.BuyToy:InvokeServer("SprayCanWD") end end)
									task.wait(0.2)
									pcall(function()
										if FTAP.SpawnToy then
											FTAP.SpawnToy:InvokeServer("SprayCanWD", me.CFrame * CFrame.new(0, 3, -3), Vector3.zero)
										end
									end)
									task.wait(0.5)
									pcall(function()
										local myFolder = workspace:FindFirstChild(LP.Name .. "SpawnedInToys")
										local can = myFolder and myFolder:FindFirstChild("SprayCanWD")
										if not can then can = workspace:FindFirstChild("SprayCanWD", true) end
										if can then
											local sticky = can:FindFirstChild("StickyRemoverPart")
											if sticky and firetouchinterest then
												firetouchinterest(sticky, r, 0)
												task.wait(0.1)
												firetouchinterest(sticky, r, 1)
											elseif sticky then
												sticky.CFrame = r.CFrame
											end
										end
									end)
								end
							end
							task.wait(1.5)
						end
						notify(HUB_NAME, "Loop paint OFF", 1)
					end)
				end
			end,
		})

		section(sc, "AUTO BREAK PLOT", n())
		local breakNote = Instance.new("TextLabel")
		breakNote.LayoutOrder = n()
		breakNote.Size = UDim2.new(1, -6, 0, 36)
		breakNote.BackgroundColor3 = C.card
		breakNote.BorderSizePixel = 0
		breakNote.Font = Enum.Font.Gotham
		breakNote.TextSize = 10
		breakNote.TextColor3 = C.muted
		breakNote.TextXAlignment = Enum.TextXAlignment.Left
		breakNote.TextYAlignment = Enum.TextYAlignment.Top
		breakNote.TextWrapped = true
		breakNote.Text = " Spawns missiles/bombs on the target's plot area and detonates them.\n Loops to keep breaking until you stop it."
		breakNote.Parent = sc
		corner(breakNote, 8)
		pad(breakNote, 6, 6, 6, 6)
		makeSlider(sc, {
			order = n(), title = _Vzd({103,151,138,134,144,69,119,134,153,138,69,77,152,138,136,78}), min = 0.3, max = 3, default = 0.8, step = 0.1,
			stateKey = "breakRate",
			tip = "Seconds between each bomb drop",
		})
		makeToggle(sc, {
			order = n(), id = _Vzd({134,154,153,148,103,151,138,134,144,117,145,148,153}), title = "Auto Break Plot",
			tip = _Vzd({105,151,148,149,69,146,142,152,152,142,145,138,152,84,135,148,146,135,152,69,148,147,69,152,138,145,138,136,153,138,137,69,149,145,134,158,138,151,76,152,69,149,145,148,153,69,134,151,138,134,69,220,69,145,148,148,149,152}),
			callback = function(on)
				S.toggles.autoBreakPlot = on
				if on then
					task.spawn(function()
						notify(HUB_NAME, _Vzd({103,151,138,134,144,69,117,145,148,153,69,116,115}), 1.5)
						while S.toggles.autoBreakPlot do
							local p = S.selected
							if p and validP(p) and p.Character then
								local r = rootOf(p)
								if r then
									pcall(function()
										if FTAP.BuyToy then FTAP.BuyToy:InvokeServer("BombMissile") end
										if FTAP.SpawnToy then
											for i = 1, 3 do
												local offset = CFrame.new(math.random(-8, 8), 5, math.random(-8, 8))
												FTAP.SpawnToy:InvokeServer("BombMissile", r.CFrame * offset, Vector3.zero)
											end
										end
									end)
									task.wait(0.2)
									pcall(function()
										local be = ReplicatedStorage:FindFirstChild(_Vzd({103,148,146,135,106,155,138,147,153,152}))
										if be and be:FindFirstChild("BombExplode") then
											for _, obj in ipairs(workspace:GetDescendants()) do
												if obj.Name == "BombMissile" or obj.Name == "Missile" then
													if (obj:GetPivot().Position - r.Position).Magnitude < 30 then
														be.BombExplode:FireServer(obj)
													end
												end
											end
										end
									end)
								end
							end
							local rate = tonumber(S.breakRate) or 0.8
							task.wait(rate)
						end
						notify(HUB_NAME, _Vzd({103,151,138,134,144,69,117,145,148,153,69,116,107,107}), 1)
					end)
				end
			end,
		})

		section(sc, "SPARKLERS", n())
		local sparkNote = Instance.new("TextLabel")
		sparkNote.LayoutOrder = n()
		sparkNote.Size = UDim2.new(1, -6, 0, 52)
		sparkNote.BackgroundColor3 = C.card
		sparkNote.BorderSizePixel = 0
		sparkNote.Font = Enum.Font.Gotham
		sparkNote.TextSize = 10
		sparkNote.TextColor3 = C.muted
		sparkNote.TextXAlignment = Enum.TextXAlignment.Left
		sparkNote.TextYAlignment = Enum.TextYAlignment.Top
		sparkNote.TextWrapped = true
		sparkNote.Text = " Spawn server-sided toys around a player (visible to everyone).\n Pick target, toy type, shape pattern, amount.\n Click 'Create' to spawn the burst."
		sparkNote.Parent = sc
		corner(sparkNote, 8)
		pad(sparkNote, 6, 6, 6, 6)

		local function sparkPlayerOptions()
			local opts = playerLabels()
			if #opts == 0 then opts = { _Vzd({147,148,135,148,137,158,69,148,147,145,142,147,138}) } end
			return opts
		end
		makeDropdown(sc, {
			order = n(),
			title = _Vzd({120,149,134,151,144,145,138,151,69,121,134,151,140,138,153}),
			options = sparkPlayerOptions(),
			default = (S.sparkTarget and playerLabel(S.sparkTarget)) or sparkPlayerOptions()[1],
			callback = function(lab)
				local p = findPlayerFromLabel(lab)
				if p then S.sparkTarget = p end
			end,
		})

		local SPARK_SHAPES = { "Sphere", "Ring", "Spiral", "Cone", _Vzd({104,158,145,142,147,137,138,151}), "Plane" }
		S.sparkShape = S.sparkShape or "Sphere"
		makeDropdown(sc, {
			order = n(),
			title = "Shape / Pattern",
			options = SPARK_SHAPES,
			default = S.sparkShape,
			callback = function(v) S.sparkShape = v end,
		})

		local SPARK_TOYS = { "Firework", "Balloon", "Snowball", "BombBalloon", "CandyCorn", "WaterBomb", _Vzd({117,154,146,149,144,142,147}), "Present" }
		S.sparkToyName = S.sparkToyName or _Vzd({107,142,151,138,156,148,151,144})
		makeDropdown(sc, {
			order = n(),
			title = "Toy to Spawn",
			options = SPARK_TOYS,
			default = S.sparkToyName,
			tip = "Which toy to spawn at each sparkle position",
			callback = function(v) S.sparkToyName = v end,
		})

		makeSlider(sc, {
			order = n(), title = _Vzd({117,134,151,153,142,136,145,138,69,102,146,148,154,147,153}), min = 5, max = 100, default = S.sparkAmount or 30, step = 5,
			tip = _Vzd({115,154,146,135,138,151,69,148,139,69,153,148,158,152,69,153,148,69,152,149,134,156,147,69,142,147,69,153,141,138,69,135,154,151,152,153}),
			callback = function(v) S.sparkAmount = v end,
		})
		makeSlider(sc, {
			order = n(), title = "Height", min = -5, max = 15, default = S.sparkHeight or 3, step = 1,
			tip = _Vzd({109,148,156,69,141,142,140,141,69,134,135,148,155,138,69,153,141,138,69,153,134,151,140,138,153,69,153,141,138,69,153,148,158,152,69,134,149,149,138,134,151}),
			callback = function(v) S.sparkHeight = v end,
		})

		local function calcSparkPositions(shape, count, radius)
			local positions = {}
			local rot = math.rad(S.sparkRot or 0)
			if shape == "Sphere" then
				for i = 1, count do
					local phi = math.acos(2 * math.random() - 1)
					local theta = 2 * math.pi * math.random()
					positions[#positions+1] = Vector3.new(
						radius * math.sin(phi) * math.cos(theta),
						radius * math.sin(phi) * math.sin(theta),
						radius * math.cos(phi)
					)
				end
			elseif shape == "Ring" then
				for i = 1, count do
					local angle = (i / count) * 2 * math.pi + rot
					positions[#positions+1] = Vector3.new(
						radius * math.cos(angle), 0, radius * math.sin(angle)
					)
				end
			elseif shape == "Spiral" then
				for i = 1, count do
					local t = i / count
					local angle = t * 4 * math.pi + rot
					local r = radius * t
					positions[#positions+1] = Vector3.new(
						r * math.cos(angle), t * 2 - 1, r * math.sin(angle)
					)
				end
			elseif shape == "Cone" then
				for i = 1, count do
					local t = i / count
					local angle = t * 2 * math.pi + rot
					local r = radius * t
					positions[#positions+1] = Vector3.new(
						r * math.cos(angle), -t * 3, r * math.sin(angle)
					)
				end
			elseif shape == "Cylinder" then
				for i = 1, count do
					local angle = (i / count) * 2 * math.pi + rot
					local y = (math.random() - 0.5) * 4
					positions[#positions+1] = Vector3.new(
						radius * math.cos(angle), y, radius * math.sin(angle)
					)
				end
			else
				for i = 1, count do
					positions[#positions+1] = Vector3.new(
						(math.random() - 0.5) * radius * 2,
						0,
						(math.random() - 0.5) * radius * 2
					)
				end
			end
			return positions
		end

		makeButton(sc, {
			order = n(),
			title = _Vzd({104,151,138,134,153,138,69,120,149,134,151,144,145,138,151,69,103,154,151,152,153}),
			tip = _Vzd({120,149,134,156,147,69,134,136,153,154,134,145,69,152,149,134,151,144,145,138,151,69,153,148,158,152,69,134,151,148,154,147,137,69,153,134,151,140,138,153,69,77,152,138,151,155,138,151,82,152,142,137,138,137,78}),
			callback = function()
				local p = S.sparkTarget
				if not p or not validP(p) or not p.Character then
					notify(HUB_NAME, "Pick a player first", 1.2)
					return
				end
				local r = rootOf(p)
				if not r then return end
				local amount = math.min(S.sparkAmount or 30, 12)
				local height = S.sparkHeight or 3
				local radius = 4
				local positions = calcSparkPositions(S.sparkShape or "Sphere", amount, radius)

				task.spawn(function()
					local toyName = S.sparkToyName or "Firework"
					for i, pos in ipairs(positions) do
						if not S.toggles.sparklerLoop and i > 1 then break end
						local me = hrp()
						local cf = CFrame.new(r.Position + Vector3.new(pos.X, pos.Y + height, pos.Z))
						if me then cf = me.CFrame * CFrame.new(pos.X, pos.Y + height, pos.Z) end
						pcall(function()
							if FTAP.BuyToy then FTAP.BuyToy:InvokeServer(toyName) end
						end)
						pcall(function()
							if FTAP.SpawnToy then
								FTAP.SpawnToy:InvokeServer(toyName, cf, Vector3.zero)
							end
						end)
						task.wait(0.15)
						local myFolder = workspace:FindFirstChild(LP.Name .. "SpawnedInToys")
						if myFolder then
							for _, model in ipairs(myFolder:GetChildren()) do
								if model.Name == toyName then
									local pp = model.PrimaryPart or model:FindFirstChildWhichIsA("BasePart", true)
									if pp and (pp.Position - cf.Position).Magnitude < 20 then
										sno(pp, cf.Position)
										pcall(function()
											pp.Anchored = true
											pp.CanCollide = false
										end)
										Debris:AddItem(model, 5)
										break
									end
								end
							end
						end
						task.wait(0.08)
					end
				end)
				notify(HUB_NAME, "Sparkler burst (" .. (S.sparkShape or "Sphere") .. " x " .. amount .. _Vzd({78,69,83,69,152,138,151,155,138,151}), 1.2)
			end,
		})
		makeToggle(sc, {
			order = n(), id = "sparklerLoop", title = _Vzd({120,149,134,151,144,145,138,151,69,113,148,148,149}),
			tip = "Continuously spawn sparkler toys around target",
			callback = function(on)
				S.toggles.sparklerLoop = on
				if on then
					task.spawn(function()
						while S.toggles.sparklerLoop do
							local p = S.sparkTarget
							if p and validP(p) and p.Character then
								local r = rootOf(p)
								if r then
									local amount = math.min(S.sparkAmount or 30, 8)
									local height = S.sparkHeight or 3
									local toyName = S.sparkToyName or "Firework"
									local positions = calcSparkPositions(S.sparkShape or _Vzd({120,149,141,138,151,138}), amount, 4)
									for _, pos in ipairs(positions) do
										if not S.toggles.sparklerLoop then break end
										local me = hrp()
										local cf = me and (me.CFrame * CFrame.new(pos.X, pos.Y + height, pos.Z))
											or CFrame.new(r.Position + Vector3.new(pos.X, pos.Y + height, pos.Z))
										pcall(function()
											if FTAP.BuyToy then FTAP.BuyToy:InvokeServer(toyName) end
										end)
										pcall(function()
											if FTAP.SpawnToy then FTAP.SpawnToy:InvokeServer(toyName, cf, Vector3.zero) end
										end)
										task.wait(0.12)
										local myFolder = workspace:FindFirstChild(LP.Name .. "SpawnedInToys")
										if myFolder then
											for _, model in ipairs(myFolder:GetChildren()) do
												if model.Name == toyName then
													local pp = model.PrimaryPart or model:FindFirstChildWhichIsA("BasePart", true)
													if pp and (pp.Position - cf.Position).Magnitude < 25 then
														sno(pp, cf.Position)
														pcall(function() pp.Anchored = true; pp.CanCollide = false end)
														Debris:AddItem(model, 4)
														break
													end
												end
											end
										end
										task.wait(0.06)
									end
								end
							end
							task.wait(0.8)
						end
					end)
				end
			end,
		})

		section(sc, "WINGS", n())
		local wingNote = Instance.new("TextLabel")
		wingNote.LayoutOrder = n()
		wingNote.Size = UDim2.new(1, -6, 0, 52)
		wingNote.BackgroundColor3 = C.card
		wingNote.BorderSizePixel = 0
		wingNote.Font = Enum.Font.Gotham
		wingNote.TextSize = 10
		wingNote.TextColor3 = C.muted
		wingNote.TextXAlignment = Enum.TextXAlignment.Left
		wingNote.TextYAlignment = Enum.TextYAlignment.Top
		wingNote.TextWrapped = true
		wingNote.Text = " Spawn server-sided wings made from pallets (visible to everyone).\n Uses the form system · flap animation built in.\n Click 'Spawn Wings' to create · 'Remove Wings' to clean up."
		wingNote.Parent = sc
		corner(wingNote, 8)
		pad(wingNote, 6, 6, 6, 6)

		makeButton(sc, {
			order = n(),
			title = _Vzd({120,149,134,156,147,69,124,142,147,140,152}),
			tip = "Spawn server-sided wings from pallets (visible to all)",
			callback = function()
				if S.formBuilding then notify(HUB_NAME, _Vzd({102,145,151,138,134,137,158,69,135,154,142,145,137,142,147,140,69,139,148,151,146,83,83,83}), 1.5) return end
				clearFormWear(true)
				local offsets = formWingsOffsets()
				spawnFormOffsets("PalletLightBrown", offsets, nil, {
					label = "Wings",
					keep = true,
					silent = true,
				})
				notify(HUB_NAME, "Wings spawned (server-sided pallets)", 1.5)
			end,
		})
		makeButton(sc, {
			order = n(),
			title = _Vzd({119,138,146,148,155,138,69,124,142,147,140,152}),
			danger = true,
			tip = "Destroy your wing pallets",
			callback = function()
				clearFormWear(true)
				S.formWearPieces = {}
				notify(HUB_NAME, _Vzd({124,142,147,140,152,69,151,138,146,148,155,138,137}), 1)
			end,
		})

		section(sc, "FORCE ANIMATIONS", n())
		local animNote = Instance.new("TextLabel")
		animNote.LayoutOrder = n()
		animNote.Size = UDim2.new(1, -6, 0, 36)
		animNote.BackgroundColor3 = C.card
		animNote.BorderSizePixel = 0
		animNote.Font = Enum.Font.Gotham
		animNote.TextSize = 11
		animNote.TextColor3 = C.muted
		animNote.TextWrapped = true
		animNote.TextXAlignment = Enum.TextXAlignment.Left
		animNote.Text = " Force animations on a selected player. Pick animation + target, hit Play."
		animNote.Parent = sc
		corner(animNote, 8)
		pad(animNote, 8, 8, 8, 8)

		local ANIMS = {
			{ label = "Typing",        id = "Typing" },
			{ label = "Flail",         id = "Flail" },
			{ label = "Wave",          asset = "rbxassetid://180436334" },
			{ label = "Laugh",         asset = "rbxassetid://180436148" },
			{ label = "Cheer",         asset = "rbxassetid://180436060" },
			{ label = "Dance",         asset = "rbxassetid://180435792" },
			{ label = "Dance2",        asset = "rbxassetid://180435792" },
			{ label = "Dance3",        asset = "rbxassetid://180435792" },
			{ label = "Gesture",       asset = "rbxassetid://180435571" },
			{ label = "Point",         asset = "rbxassetid://180435571" },
			{ label = "Rank",          asset = "rbxassetid://180435571" },
			{ label = "Salute",        asset = "rbxassetid://180435571" },
			{ label = "Sit",           asset = "rbxassetid://2506281703" },
			{ label = "Stun",          asset = "rbxassetid://180435571" },
			{ label = "Fall",          asset = "rbxassetid://180436148" },
			{ label = "GetUp",         asset = "rbxassetid://180436148" },
		}

		local animLabels = {}
		for _, a in ipairs(ANIMS) do
			table.insert(animLabels, a.label)
		end

		S.selectedAnim = S.selectedAnim or animLabels[1]

		makeDropdown(sc, {
			order = n(),
			title = "Animation",
			options = animLabels,
			default = S.selectedAnim or animLabels[1],
			callback = function(lab) S.selectedAnim = lab end,
		})

		makePlayerSearchList(sc, {
			clickFn = function(p) S.animTarget = p end,
		}, n)

		local function getAnimAsset()
			for _, a in ipairs(ANIMS) do
				if a.label == S.selectedAnim then
					if a.id then
						local ok, anim = pcall(function()
							local rf = game:GetService("ReplicatedFirst")
							for _, v in ipairs(rf:GetDescendants()) do
								if v:IsA("Animation") and v.Name == a.id then return v end
							end
							return nil
						end)
						if ok and anim then return anim.AnimationId end
					end
					if a.asset then return a.asset end
				end
			end
			return "rbxassetid://180436334"
		end

		makeButton(sc, {
			order = n(),
			title = _Vzd({117,145,134,158,69,102,147,142,146,134,153,142,148,147}),
			callback = function()
				local p = S.animTarget
				if not p or not validP(p) or not p.Character then
					notify(HUB_NAME, _Vzd({117,142,136,144,69,102,69,117,145,134,158,138,151,69,107,142,151,152,153}), 1.2)
					return
				end
				local hum = p.Character:FindFirstChildOfClass("Humanoid")
				local animator = hum and hum:FindFirstChildOfClass("Animator")
				if not animator then
					notify(HUB_NAME, "No Animator Found", 1.2)
					return
				end
				local assetId = getAnimAsset()
				local ok, anim = pcall(function() return Instance.new("Animation") end)
				if not ok or not anim then return end
				anim.AnimationId = assetId
				local ok2, track = pcall(function() return animator:LoadAnimation(anim) end)
				if ok2 and track then
					track:Play()
					notify(HUB_NAME, _Vzd({117,145,134,158,142,147,140,69}) .. (S.selectedAnim or "anim") .. " on " .. p.Name, 1)
				else
					notify(HUB_NAME, _Vzd({107,134,142,145,138,137,69,121,148,69,113,148,134,137,69,102,147,142,146,134,153,142,148,147}), 1.2)
				end
			end,
		})
		makeButton(sc, {
			order = n(),
			title = _Vzd({120,153,148,149,69,102,147,142,146,134,153,142,148,147}),
			callback = function()
				local p = S.animTarget
				if not p or not validP(p) or not p.Character then return end
				local hum = p.Character:FindFirstChildOfClass("Humanoid")
				local animator = hum and hum:FindFirstChildOfClass("Animator")
				if animator then
					for _, track in ipairs(animator:GetPlayingAnimationTracks()) do
						track:Stop()
					end
				end
				notify(HUB_NAME, "Animations Stopped", 1)
			end,
		})

		section(sc, _Vzd({121,119,116,113,113,69,121,116,116,113,120}), n())
		makeToggle(sc, {
			order = n(),
			id = "spinTarget",
			title = _Vzd({120,149,142,147,69,121,134,151,140,138,153}),
			tip = _Vzd({114,134,144,138,152,69,152,138,145,138,136,153,138,137,69,149,145,134,158,138,151,69,152,149,142,147,69,142,147,69,136,142,151,136,145,138,152}),
			callback = function(on)
				S.toggles.spinTarget = on
				if on then
					task.spawn(function()
						while S.toggles.spinTarget do
							local p = S.selected or S.animTarget
							if p and validP(p) and p.Character then
								local r = p.Character:FindFirstChild("HumanoidRootPart")
								if r then
									r.CFrame = r.CFrame * CFrame.Angles(0, math.rad(10), 0)
								end
							end
							task.wait()
						end
					end)
				end
			end,
		})
		makeToggle(sc, {
			order = n(),
			id = "spamJump",
			title = "Spam Jump Target",
			tip = _Vzd({114,134,144,138,152,69,152,138,145,138,136,153,138,137,69,149,145,134,158,138,151,69,143,154,146,149,69,148,155,138,151,69,134,147,137,69,148,155,138,151}),
			callback = function(on)
				S.toggles.spamJump = on
				if on then
					task.spawn(function()
						while S.toggles.spamJump do
							local p = S.selected or S.animTarget
							if p and validP(p) and p.Character then
								local hum = p.Character:FindFirstChildOfClass(_Vzd({109,154,146,134,147,148,142,137}))
								if hum then
									pcall(function() hum:ChangeState(Enum.HumanoidStateType.Jumping) end)
								end
							end
							task.wait(0.3)
						end
					end)
				end
			end,
		})
		makeToggle(sc, {
			order = n(),
			id = "shakyCam",
			title = _Vzd({120,141,134,144,158,69,104,134,146,138,151,134,69,121,134,151,140,138,153}),
			tip = "Jitter the camera on the selected player",
			callback = function(on)
				S.toggles.shakyCam = on
				if on then
					task.spawn(function()
						while S.toggles.shakyCam do
							local p = S.selected or S.animTarget
							if p and validP(p) and p.Character then
								local r = p.Character:FindFirstChild("HumanoidRootPart")
								if r then
									r.CFrame = r.CFrame * CFrame.Angles(
										math.rad(math.random(-3, 3)),
										math.rad(math.random(-3, 3)),
										math.rad(math.random(-2, 2))
									)
								end
							end
							task.wait()
						end
					end)
				end
			end,
		})

		section(sc, "LIMBS", n())
		local limbNote = Instance.new("TextLabel")
		limbNote.LayoutOrder = n()
		limbNote.Size = UDim2.new(1, -6, 0, 36)
		limbNote.BackgroundColor3 = C.card
		limbNote.BorderSizePixel = 0
		limbNote.Font = Enum.Font.Gotham
		limbNote.TextSize = 10
		limbNote.TextColor3 = C.muted
		limbNote.TextXAlignment = Enum.TextXAlignment.Left
		limbNote.TextYAlignment = Enum.TextYAlignment.Top
		limbNote.TextWrapped = true
		limbNote.Text = " Break Motor6D joints to rip limbs off. [U] removes YOUR limbs.\n Steal = detach from them + attach to YOU."
		limbNote.Parent = sc
		corner(limbNote, 8)
		pad(limbNote, 6, 6, 6, 6)

		local LIMB_JOINTS = { "Right Shoulder", _Vzd({113,138,139,153,69,120,141,148,154,145,137,138,151}), "Right Hip", "Left Hip", "Neck", "RootJoint" }
		local LIMB_PARTS = { _Vzd({119,142,140,141,153,69,102,151,146}), _Vzd({113,138,139,153,69,102,151,146}), "Right Leg", _Vzd({113,138,139,153,69,113,138,140}), "Head", "Torso" }

		local function breakLimbs(character, flingPower)
			if not character then return end
			flingPower = flingPower or 2000
			local r = character:FindFirstChild("HumanoidRootPart")
			for _, d in ipairs(character:GetDescendants()) do
				if d:IsA("Motor6D") then
					pcall(function() d:Destroy() end)
				end
			end
			for _, partName in ipairs(LIMB_PARTS) do
				local part = character:FindFirstChild(partName)
				if part and part:IsA("BasePart") then
					pcall(function()
						local dir = (part.Position - (r and r.Position or part.Position))
						if dir.Magnitude < 0.1 then dir = Vector3.new(math.random(-1,1), 1, math.random(-1,1)).Unit end
						part.AssemblyLinearVelocity = dir.Unit * flingPower
						part.AssemblyAngularVelocity = Vector3.new(math.random(-20,20), math.random(-20,20), math.random(-20,20))
					end)
				end
			end
		end

		local stolenParts = {}

		local function findJointForLimb(char, limbPart)
			for _, d in ipairs(char:GetDescendants()) do
				if d:IsA("Motor6D") and d.Part1 == limbPart then
					return d
				end
			end
			return nil
		end

		local function stealSingleLimb(targetPlr, limbName)
			local char = targetPlr and targetPlr.Character
			if not char then return false end
			local myChar = LP.Character
			if not myChar then return false end
			local myRoot = myChar:FindFirstChild("HumanoidRootPart")
			if not myRoot then return false end

			local limb = char:FindFirstChild(limbName)
			if not limb or not limb:IsA("BasePart") then return false end

			local joint = findJointForLimb(char, limb)
			if joint then pcall(function() joint:Destroy() end) end

			sno(limb)

			pcall(function() FTAP.CreateGrabLine:FireServer(limb, limb.CFrame) end)
			task.wait(0.05)
			pcall(function() FTAP.CreateGrabLine:FireServer(limb, myRoot.CFrame * CFrame.new(0, 2, -5)) end)

			createBringBody(limb, myRoot.CFrame * CFrame.new(0, 2, -5))

			task.wait(0.1)
			local weld = Instance.new("WeldConstraint")
			weld.Name = _Vzd({123,116,110,105,127,132,120,153,148,145,138,147,113,142,146,135})
			weld.Part0 = myRoot
			weld.Part1 = limb
			weld.Parent = limb

			stolenParts[#stolenParts + 1] = { part = limb, char = char, limbName = limbName }
			return true
		end

		local STEAL_LIMBS = {
			{ label = _Vzd({113,138,139,153,69,102,151,146}),  part = _Vzd({113,138,139,153,69,102,151,146}) },
			{ label = _Vzd({119,142,140,141,153,69,102,151,146}), part = _Vzd({119,142,140,141,153,69,102,151,146}) },
			{ label = _Vzd({113,138,139,153,69,113,138,140}),  part = _Vzd({113,138,139,153,69,113,138,140}) },
			{ label = "Right Leg", part = _Vzd({119,142,140,141,153,69,113,138,140}) },
			{ label = "Head",      part = "Head" },
		}

		local function returnStolenLimbs()
			local n = 0
			for i = #stolenParts, 1, -1 do
				local info = stolenParts[i]
				local part = info.part
				if part and part.Parent then
					for _, d in ipairs(part:GetDescendants()) do
						if d:IsA("WeldConstraint") and d.Name == "VOIDZ_StolenLimb" then
							pcall(function() d:Destroy() end)
						end
					end
					local bp = part:FindFirstChild("BringBody")
					if bp then pcall(function() bp:Destroy() end) end
					pcall(function()
						part.AssemblyLinearVelocity = Vector3.new(math.random(-50,50), 100, math.random(-50,50))
					end)
					n += 1
				end
				table.remove(stolenParts, i)
			end
			return n
		end

		makeButton(sc, {
			order = n(),
			title = _Vzd({119,138,146,148,155,138,69,114,158,69,113,142,146,135,152,69,128,122,130}),
			tip = _Vzd({103,151,138,134,144,69,143,148,142,147,153,152,69,148,147,69,126,116,122,119,69,136,141,134,151,134,136,153,138,151,69,80,69,139,145,142,147,140,69,145,142,146,135,152,69,134,156,134,158}),
			danger = true,
			callback = function()
				local char = LP.Character
				if not char then notify(HUB_NAME, _Vzd({115,148,69,136,141,134,151,134,136,153,138,151}), 1) return end
				breakLimbs(char, 1500)
				notify(HUB_NAME, "Limbs ripped off", 1)
			end,
		})
		makeButton(sc, {
			order = n(),
			title = _Vzd({119,142,149,69,113,142,146,135,152,69,116,139,139,69,121,134,151,140,138,153}),
			tip = _Vzd({120,115,116,69,80,69,135,151,138,134,144,69,143,148,142,147,153,152,69,80,69,139,145,142,147,140,69,145,142,146,135,152,69,148,147,69,152,138,145,138,136,153,138,137,69,149,145,134,158,138,151}),
			callback = function()
				local p = S.selected
				if not p or not validP(p) or not p.Character then
					notify(HUB_NAME, "Pick a player first", 1.2) return
				end
				visitForSNO(p, 10)
				pcall(function() breakLimbs(p.Character, 2000) end)
				notify(HUB_NAME, _Vzd({113,142,146,135,152,69,151,142,149,149,138,137,69,148,139,139,69}) .. playerLabel(p), 1)
			end,
		})

		section(sc, "STEAL BODY PARTS", n())
		local stealNote = Instance.new(_Vzd({121,138,157,153,113,134,135,138,145}))
		stealNote.LayoutOrder = n()
		stealNote.Size = UDim2.new(1, -6, 0, 36)
		stealNote.BackgroundColor3 = C.card
		stealNote.BorderSizePixel = 0
		stealNote.Font = Enum.Font.Gotham
		stealNote.TextSize = 10
		stealNote.TextColor3 = C.muted
		stealNote.TextXAlignment = Enum.TextXAlignment.Left
		stealNote.TextYAlignment = Enum.TextYAlignment.Top
		stealNote.TextWrapped = true
		stealNote.Text = " Detach a limb from target + weld it to YOUR body.\n They lose the part, you gain it. Return when done."
		stealNote.Parent = sc
		corner(stealNote, 8)
		pad(stealNote, 6, 6, 6, 6)

		for _, entry in ipairs(STEAL_LIMBS) do
			makeButton(sc, {
				order = n(),
				title = "Steal " .. entry.label,
				tip = "Detach " .. entry.label .. _Vzd({69,139,151,148,146,69,153,134,151,140,138,153,69,80,69,134,153,153,134,136,141,69,153,148,69,158,148,154}),
				callback = function()
					local p = S.selected
					if not p or not validP(p) or not p.Character then
						notify(HUB_NAME, "Pick a player first", 1.2) return
					end
					local myChar = LP.Character
					if not myChar or not myChar:FindFirstChild("HumanoidRootPart") then
						notify(HUB_NAME, _Vzd({126,148,154,69,147,138,138,137,69,134,69,136,141,134,151,134,136,153,138,151}), 1) return
					end
					visitForSNO(p, 10)
					task.wait(0.08)
					local ok = stealSingleLimb(p, entry.part)
					if ok then
						notify(HUB_NAME, "Stole " .. entry.label .. " from " .. playerLabel(p), 1.2)
					else
						notify(HUB_NAME, _Vzd({107,134,142,145,138,137,69,153,148,69,152,153,138,134,145,69}) .. entry.label, 1.5)
					end
				end,
			})
		end
		makeButton(sc, {
			order = n(),
			title = "Steal ALL Limbs",
			tip = _Vzd({105,138,153,134,136,141,69,138,155,138,151,158,69,145,142,146,135,69,139,151,148,146,69,153,134,151,140,138,153,69,80,69,134,153,153,134,136,141,69,134,145,145,69,153,148,69,158,148,154}),
			danger = true,
			callback = function()
				local p = S.selected
				if not p or not validP(p) or not p.Character then
					notify(HUB_NAME, _Vzd({117,142,136,144,69,134,69,149,145,134,158,138,151,69,139,142,151,152,153}), 1.2) return
				end
				local myChar = LP.Character
				if not myChar or not myChar:FindFirstChild("HumanoidRootPart") then
					notify(HUB_NAME, "You need a character", 1) return
				end
				visitForSNO(p, 10)
				task.wait(0.08)
				local stolen = 0
				for _, entry in ipairs(STEAL_LIMBS) do
					if stealSingleLimb(p, entry.part) then
						stolen += 1
						task.wait(0.12)
					end
				end
				notify(HUB_NAME, _Vzd({120,153,148,145,138,69}) .. stolen .. "/" .. #STEAL_LIMBS .. _Vzd({69,145,142,146,135,152,69,139,151,148,146,69}) .. playerLabel(p), 1.5)
			end,
		})
		makeButton(sc, {
			order = n(),
			title = "Return Stolen Limbs",
			tip = "Remove all stolen parts from your body + fling away",
			danger = true,
			callback = function()
				local n = returnStolenLimbs()
				notify(HUB_NAME, "Returned " .. n .. " stolen limb" .. (n == 1 and "" or "s"), 1.2)
			end,
		})
		makeToggle(sc, {
			order = n(),
			id = "keepStolenAttached",
			title = "Keep Stolen Attached",
			tip = _Vzd({113,148,148,149,95,69,151,138,82,156,138,145,137,69,152,153,148,145,138,147,69,145,142,146,135,152,69,153,148,69,158,148,154,151,69,135,148,137,158,69,156,141,142,145,138,69,146,148,155,142,147,140}),
			callback = function(on)
				S.toggles.keepStolenAttached = on
				if on then
					startLoop("keepStolen", 0.15, function()
						local myRoot = hrp()
						if not myRoot then return end
						for _, info in ipairs(stolenParts) do
							local part = info.part
							if part and part.Parent then
								local hasWeld = false
								for _, d in ipairs(part:GetDescendants()) do
									if d:IsA("WeldConstraint") and d.Name == "VOIDZ_StolenLimb" then
										if d.Part0 and d.Part0.Parent and d.Part1 and d.Part1.Parent then
											hasWeld = true
										else
											pcall(function() d:Destroy() end)
										end
									end
								end
								if not hasWeld then
									sno(part)
									createBringBody(part, myRoot.CFrame * CFrame.new(0, 2, -5))
									local w = Instance.new("WeldConstraint")
									w.Name = "VOIDZ_StolenLimb"
									w.Part0 = myRoot
									w.Part1 = part
									w.Parent = part
								end
							end
						end
					end)
					notify(HUB_NAME, "Stolen limbs follow you", 1)
				else
					stopLoop("keepStolen")
					notify(HUB_NAME, "Stolen limbs stay in place", 1)
				end
			end,
		})
		makeToggle(sc, {
			order = n(),
			id = "limbAura",
			title = _Vzd({113,142,146,135,69,120,153,138,134,145,69,102,154,151,134}),
			tip = _Vzd({114,134,149,82,156,142,137,138,95,69,153,138,145,138,149,148,151,153,69,153,148,69,138,134,136,141,69,149,145,134,158,138,151,69,134,147,137,69,151,142,149,69,153,141,138,142,151,69,145,142,146,135,152,69,148,139,139}),
			callback = function(on)
				S.toggles.limbAura = on
				if on then
					startLoop("limbAura", 0.5, function()
						local me = hrp()
						if not me then return end
						local homeCF = me.CFrame
						for _, p in ipairs(Players:GetPlayers()) do
							if p ~= LP and isAliveP(p) and not isInSafePlot(p) and not isWL(p) then
								local r = rootOf(p)
								if r then
									pcall(function()
										if r.Position.Y <= -12 then
											me.CFrame = CFrame.new(r.Position + Vector3.new(0, 5, -15))
										else
											me.CFrame = CFrame.new(r.Position + Vector3.new(0, -10, -10))
										end
										snoPlayer(p, r.Position)
										task.wait()
										breakLimbs(p.Character, 2000)
									end)
								end
							end
						end
						pcall(function() me.CFrame = homeCF end)
					end)
					notify(HUB_NAME, _Vzd({113,142,146,135,69,120,153,138,134,145,69,102,154,151,134,69,116,115}), 1.5)
				else
					stopLoop(_Vzd({145,142,146,135,102,154,151,134}))
					notify(HUB_NAME, _Vzd({113,142,146,135,69,120,153,138,134,145,69,102,154,151,134,69,116,107,107}), 1)
				end
			end,
		})

		section(sc, "QUICK SERVER ACTIONS", n())
		makeButton(sc, {
			order = n(),
			title = "Lag Server (Soft)",
			tip = _Vzd({116,147,138,82,152,141,148,153,69,152,149,134,146,69,104,151,138,134,153,138,108,151,134,135,113,142,147,138,69,148,147,69,138,155,138,151,158,148,147,138}),
			callback = function()
				for _, p in ipairs(Players:GetPlayers()) do
					if p ~= LP and validP(p) and p.Character then
						local r = rootOf(p)
						if r and FTAP.CreateGrabLine then
							pcall(function() FTAP.CreateGrabLine:FireServer(r, r.CFrame) end)
						end
					end
				end
				notify(HUB_NAME, _Vzd({120,148,139,153,69,145,134,140,69,139,142,151,138,137}), 1)
			end,
		})
		makeButton(sc, {
			order = n(),
			title = "Destroy All Lines",
			callback = function()
				for _, p in ipairs(Players:GetPlayers()) do
					if p ~= LP and validP(p) and p.Character then
						local r = rootOf(p)
						if r and FTAP.DestroyGrabLine then
							pcall(function() FTAP.DestroyGrabLine:FireServer(r) end)
						end
					end
				end
				notify(HUB_NAME, _Vzd({102,145,145,69,145,142,147,138,152,69,137,138,152,153,151,148,158,138,137}), 1)
			end,
		})
		makeButton(sc, {
			order = n(),
			title = "Ragdoll Everyone",
			callback = function()
				for _, p in ipairs(Players:GetPlayers()) do
					if p ~= LP and validP(p) and p.Character then
						local r = rootOf(p)
						if r and FTAP.RagdollRemote then
							pcall(function() FTAP.RagdollRemote:FireServer(r, 0) end)
						end
					end
				end
				notify(HUB_NAME, _Vzd({106,155,138,151,158,148,147,138,69,151,134,140,137,148,145,145,138,137}), 1)
			end,
		})
		makeButton(sc, {
			order = n(),
			title = _Vzd({119,142,149,69,113,142,146,135,152,69,116,139,139,69,106,155,138,151,158,148,147,138}),
			tip = "SNO + break all Motor6D joints + fling limbs on every player",
			danger = true,
			callback = function()
				local me = hrp()
				if not me then return end
				local homeCF = me.CFrame
				for _, p in ipairs(Players:GetPlayers()) do
					if p ~= LP and isAliveP(p) and not isInSafePlot(p) and not isWL(p) then
						local r = rootOf(p)
						if r then
							pcall(function()
								if r.Position.Y <= -12 then
									me.CFrame = CFrame.new(r.Position + Vector3.new(0, 5, -15))
								else
									me.CFrame = CFrame.new(r.Position + Vector3.new(0, -10, -10))
								end
								snoPlayer(p, r.Position)
								task.wait()
								for _, d in ipairs(p.Character:GetDescendants()) do
									if d:IsA("Motor6D") then pcall(function() d:Destroy() end) end
								end
								for _, partName in ipairs({"Right Arm","Left Arm",_Vzd({119,142,140,141,153,69,113,138,140}),_Vzd({113,138,139,153,69,113,138,140}),"Head"}) do
									local part = p.Character:FindFirstChild(partName)
									if part and part:IsA("BasePart") then
										pcall(function()
											local dir = (part.Position - r.Position)
											if dir.Magnitude < 0.1 then dir = Vector3.new(math.random(-1,1),1,math.random(-1,1)).Unit end
											part.AssemblyLinearVelocity = dir.Unit * 2000
										end)
									end
								end
							end)
						end
					end
				end
				pcall(function() me.CFrame = homeCF end)
				notify(HUB_NAME, "Everyone's limbs ripped off", 1)
			end,
		})

section(sc, "TRAIN CONTROL", n())
local trainNote = Instance.new(_Vzd({121,138,157,153,113,134,135,138,145}))
trainNote.LayoutOrder = n()
trainNote.Size = UDim2.new(1, -6, 0, 48)
trainNote.BackgroundColor3 = C.card
trainNote.BorderSizePixel = 0
trainNote.Font = Enum.Font.Gotham
trainNote.TextSize = 10
trainNote.TextColor3 = C.muted
trainNote.TextXAlignment = Enum.TextXAlignment.Left
trainNote.TextYAlignment = Enum.TextYAlignment.Top
trainNote.TextWrapped = true
trainNote.Text = " Finds map train (Secret Train Cave) · SNO + sit · WASD drive · H horn · Turn OFF Anti Train seat if it kicks you out"
trainNote.Parent = sc
corner(trainNote, 8)
pad(trainNote, 6, 6, 6, 6)

S.trainSpeed = S.trainSpeed or 120
makeSlider(sc, {
	order = n(),
	title = "Train Speed",
	min = 20,
	max = 300,
	default = 120,
	step = 5,
	stateKey = "trainSpeed",
	tip = _Vzd({103,148,137,158,123,138,145,148,136,142,153,158,69,152,149,138,138,137,69,156,141,142,145,138,69,137,151,142,155,142,147,140}),
})

makeButton(sc, {
	order = n(),
	title = "Drive Train",
	tip = _Vzd({121,117,84,139,142,147,137,69,153,151,134,142,147,69,152,138,134,153,81,69,148,156,147,69,142,153,81,69,152,142,153,81,69,124,102,120,105,69,137,151,142,155,138}),
	callback = function()
		task.spawn(startTrainDrive)
	end,
})

makeButton(sc, {
	order = n(),
	title = "TP Secret Train Cave",
	tip = _Vzd({121,138,145,138,149,148,151,153,69,153,148,69,153,141,138,69,146,134,149,69,153,151,134,142,147,69,134,151,138,134,69,153,141,138,147,69,154,152,138,69,105,151,142,155,138,69,121,151,134,142,147}),
	callback = function()
		local me = hrp()
		if not me then notify(HUB_NAME, _Vzd({115,148,69,136,141,134,151,134,136,153,138,151}), 1.5); return end
		pcall(function() me.CFrame = CFrame.new(TRAIN_CAVE_POS + Vector3.new(0, 6, 0)) end)
		notify(HUB_NAME, "Train cave · press Drive Train", 1.5)
	end,
})

makeButton(sc, {
	order = n(),
	title = _Vzd({120,153,148,149,69,121,151,134,142,147}),
	danger = true,
	callback = function()
		stopTrainDrive(false)
	end,
})

section(sc, _Vzd({102,122,121,116,69,120,115,116,124,103,102,113,113,69,114,102,112,106,119}), n())
local ballNote = Instance.new("TextLabel")
ballNote.LayoutOrder = n()
ballNote.Size = UDim2.new(1, -6, 0, 48)
ballNote.BackgroundColor3 = C.card
ballNote.BorderSizePixel = 0
ballNote.Font = Enum.Font.Gotham
ballNote.TextSize = 10
ballNote.TextColor3 = C.muted
ballNote.TextXAlignment = Enum.TextXAlignment.Left
ballNote.TextYAlignment = Enum.TextYAlignment.Top
ballNote.TextWrapped = true
ballNote.Text = " Parks you on snow mountain · serial BallSnowball · SNO + roll L/R on snow to grow (server size) · then fling/explode"
ballNote.Parent = sc
corner(ballNote, 8)
pad(ballNote, 6, 6, 6, 6)

S.ballType = S.ballType or "Snowball"
S.ballSize = S.ballSize or 15
S.ballCount = S.ballCount or 10
S.ballFlingPower = S.ballFlingPower or 5000

makeDropdown(sc, {
	order = n(),
	title = "Ball Type",
	options = { "Snowball", "Sandball" },
	default = S.ballType,
	callback = function(v) S.ballType = v end,
})

makeSlider(sc, {
	order = n(),
	title = _Vzd({108,151,148,156,69,120,142,159,138,69,77,152,153,154,137,152,78}),
	min = 4,
	max = 25,
	default = 15,
	step = 1,
	stateKey = "ballSize",
	tip = "Server grows while rolling on snow · stop when Size >= this",
})

makeSlider(sc, {
	order = n(),
	title = _Vzd({103,134,145,145,69,104,148,154,147,153}),
	min = 1,
	max = 50,
	default = 10,
	step = 1,
	stateKey = "ballCount",
	tip = _Vzd({109,148,156,69,146,134,147,158,69,103,134,145,145,120,147,148,156,135,134,145,145,69,153,148,69,139,134,151,146}),
})

makeSlider(sc, {
	order = n(),
	title = "Fling Power",
	min = 500,
	max = 50000,
	default = 5000,
	step = 500,
	stateKey = "ballFlingPower",
	tip = _Vzd({123,138,145,148,136,142,153,158,69,134,149,149,145,142,138,137,69,153,148,69,138,134,136,141,69,140,151,148,156,147,69,135,134,145,145}),
})

makeButton(sc, {
	order = n(),
	title = _Vzd({120,153,134,151,153,69,107,134,151,146,69,120,147,148,156,135,134,145,145,152}),
	tip = "Serial spawn BallSnowball + roll-grow until count reached",
	callback = function()
		task.spawn(startSnowFarm)
	end,
})

makeButton(sc, {
	order = n(),
	title = "Stop Farm",
	callback = function()
		stopSnowFarm(false)
	end,
})

makeButton(sc, {
	order = n(),
	title = _Vzd({114,134,144,138,69,75,69,107,145,142,147,140,69,134,153,69,121,134,151,140,138,153}),
	danger = true,
	tip = _Vzd({107,134,151,146,69,153,141,138,147,69,139,145,142,147,140,69,140,151,148,156,147,69,135,134,145,145,152,69,134,153,69,152,138,145,138,136,153,138,137,69,149,145,134,158,138,151}),
	callback = function()
		task.spawn(makeAndFlingSnowballsNow)
	end,
})

makeButton(sc, {
	order = n(),
	title = _Vzd({107,145,142,147,140,69,108,151,148,156,147,69,134,153,69,121,134,151,140,138,153}),
	danger = true,
	tip = "Fling already-grown snowballs at selected player",
	callback = function()
		local p = S.selected
		if not p or not validP(p) then notify(HUB_NAME, "Select a target", 1.5); return end
		task.spawn(function() flingGrownSnowballsAt(p) end)
	end,
})

makeButton(sc, {
	order = n(),
	title = _Vzd({106,157,149,145,148,137,138,69,108,151,148,156,147,69,120,147,148,156,135,134,145,145,152}),
	danger = true,
	tip = _Vzd({103,148,146,135,106,157,149,145,148,137,138,69,134,145,145,69,140,151,148,156,147,69,152,147,148,156,135,134,145,145,152}),
	callback = function()
		task.spawn(explodeGrownSnowballs)
	end,
})

end
_TAB_BUILDERS["settings"] = function(sc, n)
		section(sc, _Vzd({121,109,106,114,106,120}), n())
		makeDropdown(sc, {
			order = n(), title = _Vzd({104,148,145,148,151,69,121,141,138,146,138}),
			options = { "Purple", "Red", "White", "Black", "Green", "Blue" },
			default = S.theme or "Purple",
			callback = function(v)
				applyTheme(v)
			end,
		})
		section(sc, "DEVICE", n())
		makeDropdown(sc, {
			order = n(), title = "Device",
			tip = "PC gets scroll wheel · Mobile gets on-screen buttons",
			options = { "PC", "Mobile" },
			default = S.device or "PC",
			callback = function(v)
				S.device = v
				S.toggles.mobileUI = (v == "Mobile")
				notify(HUB_NAME, _Vzd({105,138,155,142,136,138,69,183,69}) .. v, 1)
			end,
		})
		section(sc, "UI", n())
		makeSlider(sc, {
			order = n(), title = "Hub Scale", min = 60, max = 120, default = 100,
			tip = "UI size percentage (100 = default)",
			callback = function(v)
				S.hubScale = v
				if S.root then
					local scale = v / 100
					S.root.Size = UDim2.fromOffset(math.floor(520 * scale), math.floor(340 * scale))
				end
			end,
		})
		makeToggle(sc, {
			order = n(), id = _Vzd({154,147,145,148,136,144,114,148,154,152,138}), title = _Vzd({122,147,145,148,136,144,69,114,148,154,152,138}),
			tip = _Vzd({113,138,153,152,69,158,148,154,69,136,145,142,136,144,69,153,141,138,69,140,134,146,138,69,156,141,142,145,138,69,153,141,138,69,141,154,135,69,142,152,69,148,149,138,147,69,77,117,104,69,148,147,145,158,78}),
			callback = function(on)
				S.toggles.unlockMouse = on == true
				notify(HUB_NAME, _Vzd({122,147,145,148,136,144,69,114,148,154,152,138,69}) .. (on and "ON" or "OFF"), 1)
			end,
		})
		section(sc, _Vzd({124,109,110,121,106,113,110,120,121}), n())
		makeToggle(sc, {
			order = n(), id = "wlFriends", title = _Vzd({124,141,142,153,138,145,142,152,153,69,107,151,142,138,147,137,152}),
			tip = _Vzd({120,144,142,149,69,139,151,142,138,147,137,152,69,142,147,69,134,154,151,134,152,69,84,69,146,134,152,152,69,145,148,148,149,152}),
			callback = function(on) S.toggles.wlFriends = on end,
		})
		makeButton(sc, {
			order = n(), title = "Add Selected Player",
			tip = "Add current player dropdown selection to whitelist",
			callback = function()
				if S.selected then
					S.whitelist[S.selected.Name] = true
					notify(HUB_NAME, _Vzd({124,141,142,153,138,145,142,152,153,138,137,69}) .. S.selected.Name, 1)
					if S._wlRefresh then pcall(S._wlRefresh) end
				else
					notify(HUB_NAME, _Vzd({115,148,69,149,145,134,158,138,151,69,152,138,145,138,136,153,138,137}), 1)
				end
			end,
		})
		makeButton(sc, {
			order = n(), title = "Remove Selected Player",
			callback = function()
				if S.selected then
					S.whitelist[S.selected.Name] = nil
					notify(HUB_NAME, _Vzd({119,138,146,148,155,138,137,69}) .. S.selected.Name, 1)
					if S._wlRefresh then pcall(S._wlRefresh) end
				else
					notify(HUB_NAME, "No player selected", 1)
				end
			end,
		})
		makeButton(sc, {
			order = n(), title = _Vzd({104,145,138,134,151,69,124,141,142,153,138,145,142,152,153}),
			callback = function()
				S.whitelist = {}
				notify(HUB_NAME, _Vzd({124,141,142,153,138,145,142,152,153,69,136,145,138,134,151,138,137}), 1)
				if S._wlRefresh then pcall(S._wlRefresh) end
			end,
		})
		local wlLabel = Instance.new("TextLabel")
		wlLabel.LayoutOrder = n()
		wlLabel.Size = UDim2.new(1, -6, 0, 14)
		wlLabel.BackgroundTransparency = 1
		wlLabel.Font = Enum.Font.Gotham
		wlLabel.TextSize = 10
		wlLabel.TextColor3 = C.muted
		wlLabel.TextXAlignment = Enum.TextXAlignment.Left
		wlLabel.Text = "Whitelisted Players"
		wlLabel.Parent = sc
		local wlBox = Instance.new("Frame")
		wlBox.LayoutOrder = n()
		wlBox.Size = UDim2.new(1, -6, 0, 100)
		wlBox.BackgroundColor3 = C.bg
		wlBox.BorderSizePixel = 0
		wlBox.Parent = sc
		corner(wlBox, 8)
		stroke(wlBox, C.strokeSoft, 1)
		local wlSc = Instance.new("ScrollingFrame")
		wlSc.Size = UDim2.fromScale(1, 1)
		wlSc.BackgroundTransparency = 1
		wlSc.ScrollBarThickness = 3
		wlSc.ScrollBarImageColor3 = C.accent
		wlSc.AutomaticCanvasSize = Enum.AutomaticSize.Y
		wlSc.CanvasSize = UDim2.new()
		wlSc.Parent = wlBox
		local wlLay = Instance.new("UIListLayout")
		wlLay.Padding = UDim.new(0, 3)
		wlLay.Parent = wlSc
		pad(wlSc, 4, 4, 4, 4)
		local function refreshWL()
			for _, ch in ipairs(wlSc:GetChildren()) do
				if ch:IsA(_Vzd({107,151,134,146,138})) then ch:Destroy() end
			end
			local hasAny = false
			for name in pairs(S.whitelist) do
				hasAny = true
				local row = Instance.new("Frame")
				row.Size = UDim2.new(1, -4, 0, 24)
				row.BackgroundColor3 = C.card
				row.BorderSizePixel = 0
				row.Parent = wlSc
				corner(row, 6)
				local lbl = Instance.new("TextLabel")
				lbl.Size = UDim2.new(1, -36, 1, 0)
				lbl.Position = UDim2.fromOffset(6, 0)
				lbl.BackgroundTransparency = 1
				lbl.Font = Enum.Font.Gotham
				lbl.TextSize = 11
				lbl.TextColor3 = C.text
				lbl.TextXAlignment = Enum.TextXAlignment.Left
				lbl.Text = name
				lbl.Parent = row
				local rm = Instance.new("TextButton")
				rm.Size = UDim2.fromOffset(24, 18)
				rm.Position = UDim2.new(1, -28, 0.5, -9)
				rm.BackgroundColor3 = Color3.fromRGB(180, 50, 50)
				rm.Text = "X"
				rm.TextColor3 = C.text
				rm.Font = Enum.Font.GothamBold
				rm.TextSize = 10
				rm.AutoButtonColor = false
				rm.Parent = row
				corner(rm, 4)
				rm.MouseButton1Click:Connect(function()
					S.whitelist[name] = nil
					refreshWL()
					notify(HUB_NAME, "Removed " .. name, 1)
				end)
			end
			if not hasAny then
				local empty = Instance.new("TextLabel")
				empty.Size = UDim2.new(1, 0, 0, 24)
				empty.BackgroundTransparency = 1
				empty.Font = Enum.Font.Gotham
				empty.TextSize = 11
				empty.TextColor3 = C.muted
				empty.Text = "No players whitelisted"
				empty.Parent = wlSc
			end
		end
		S._wlRefresh = refreshWL
		refreshWL()
		section(sc, "DANGER ZONE", n())
		makeButton(sc, {
			order = n(), title = _Vzd({122,147,145,148,134,137,69,120,136,151,142,149,153}), danger = true,
			tip = "Completely unload everything — UI, loops, connections, all of it",
			callback = function()
				notify(HUB_NAME, "Unloading…", 2)
				task.delay(0.5, function()
					pcall(function() unload() end)
				end)
			end,
		})
		section(sc, _Vzd({112,106,126,103,110,115,105,69,121,116,108,108,113,106,120}), n())
		makeToggle(sc, {
			order = n(), id = _Vzd({144,135,132,153,148,140,140,145,138,122,110}), title = _Vzd({121,148,140,140,145,138,69,109,154,135,69,128,119,142,140,141,153,120,141,142,139,153,130}),
			tip = _Vzd({119,142,140,141,153,120,141,142,139,153,69,153,148,69,148,149,138,147,84,136,145,148,152,138,69,141,154,135}),
			callback = function(on) S.toggles.kb_toggleUI = on end,
		})
		makeToggle(sc, {
			order = n(), id = "kb_fly", title = "Fly [V]",
			callback = function(on) S.toggles.kb_fly = on end,
		})
		makeToggle(sc, {
			order = n(), id = _Vzd({144,135,132,147,148,136,145,142,149}), title = _Vzd({115,148,136,145,142,149,69,128,115,130}),
			callback = function(on) S.toggles.kb_noclip = on end,
		})
		makeToggle(sc, {
			order = n(), id = "kb_reach", title = "Scroll Distance [R]",
			callback = function(on) S.toggles.kb_reach = on end,
		})
		makeToggle(sc, {
			order = n(), id = _Vzd({144,135,132,149,134,145,145,138,153}), title = _Vzd({117,134,145,145,138,153,69,124,142,147,140,152,69,128,118,130}),
			callback = function(on) S.toggles.kb_pallet = on end,
		})
		makeToggle(sc, {
			order = n(), id = "kb_flingAura", title = "Fling Aura [F]",
			callback = function(on) S.toggles.kb_flingAura = on end,
		})
		makeToggle(sc, {
			order = n(), id = _Vzd({144,135,132,147,138,153,148,156,147}), title = _Vzd({115,138,153,69,116,156,147,138,151,69,102,154,151,134,69,128,108,130}),
			callback = function(on) S.toggles.kb_netown = on end,
		})
		makeToggle(sc, {
			order = n(), id = "kb_antiGrab", title = _Vzd({102,147,153,142,82,108,151,134,135,69,128,109,130}),
			callback = function(on) S.toggles.kb_antiGrab = on end,
		})
		makeToggle(sc, {
			order = n(), id = "kb_flingNear", title = _Vzd({107,145,142,147,140,69,115,138,134,151,69,128,121,130}),
			callback = function(on) S.toggles.kb_flingNear = on end,
		})
		makeToggle(sc, {
			order = n(), id = "kb_stomp", title = _Vzd({120,153,148,146,149,69,102,154,151,134,69,128,126,130}),
			callback = function(on) S.toggles.kb_stomp = on end,
		})
		makeToggle(sc, {
			order = n(), id = _Vzd({144,135,132,148,151,135,142,153}), title = _Vzd({116,151,135,142,153,69,102,154,151,134,69,128,116,130}),
			callback = function(on) S.toggles.kb_orbit = on end,
		})
		makeToggle(sc, {
			order = n(), id = "kb_serverFling", title = _Vzd({120,138,151,155,138,151,69,107,145,142,147,140,69,128,111,130}),
			callback = function(on) S.toggles.kb_serverFling = on end,
		})
		section(sc, _Vzd({108,113,116,103,102,113,69,117,116,124,106,119,120}), n())
		makeSlider(sc, {
			order = n(), title = _Vzd({107,145,142,147,140,69,117,148,156,138,151}), min = 400, max = 20000, default = S.flingPower or 8000, step = 100,
			stateKey = "flingPower",
		})
		makeSlider(sc, {
			order = n(), title = "Strength Multiplier", min = 0.1, max = 10, default = S.strengthMult or 1, step = 0.1,
			callback = function(v) S.strengthMult = v end,
		})
		makeSlider(sc, {
			order = n(), title = _Vzd({102,154,151,134,69,119,134,147,140,138}), min = 10, max = 200, default = S.auraRange or 50,
			stateKey = "auraRange",
		})
		makeSlider(sc, {
			order = n(), title = "Lag Intensity", min = 1, max = 500, default = S.lagIntensity or 150,
			tip = "CreateGrabLine spam rate (lag server loops)",
			stateKey = "lagIntensity",
		})
		section(sc, "EXPORT / IMPORT", n())
		makeButton(sc, {
			order = n(), title = _Vzd({106,157,149,148,151,153,69,104,148,147,139,142,140}),
			tip = _Vzd({104,148,149,158,69,136,154,151,151,138,147,153,69,152,138,153,153,142,147,140,152,69,153,148,69,136,145,142,149,135,148,134,151,137,69,134,152,69,111,120,116,115}),
			callback = function()
				local ok, json = pcall(function()
					return game.HttpService:JSONEncode({
						theme = S.theme,
						device = S.device,
						flingPower = S.flingPower,
						walkSpeed = S.walkSpeed,
						flySpeed = S.flySpeed,
						jumpPower = S.jumpPower,
						auraRange = S.auraRange,
						strengthMult = S.strengthMult,
						lagIntensity = S.lagIntensity,
						extendAmount = S.extendAmount,
						silentFov = S.silentFov,
						hubScale = S.hubScale,
					})
				end)
				if ok and json then
					if setclipboard then setclipboard(json) end
					notify(HUB_NAME, _Vzd({104,148,147,139,142,140,69,136,148,149,142,138,137,69,153,148,69,136,145,142,149,135,148,134,151,137}), 2)
				else
					notify(HUB_NAME, _Vzd({106,157,149,148,151,153,69,139,134,142,145,138,137}), 2)
				end
			end,
		})
		makeInput(sc, {
			order = n(), id = "importBox", placeholder = _Vzd({117,134,152,153,138,69,136,148,147,139,142,140,69,111,120,116,115,69,141,138,151,138,83,83,83}),
		})
		makeButton(sc, {
			order = n(), title = _Vzd({110,146,149,148,151,153,69,104,148,147,139,142,140}),
			callback = function()
				local box = S.importBox
				local txt = box and box.Text
				if not txt or txt == "" then
					notify(HUB_NAME, "Paste JSON first", 1)
					return
				end
				local ok, data = pcall(function()
					return game.HttpService:JSONDecode(txt)
				end)
				if ok and type(data) == "table" then
					for k, v in pairs(data) do
						if k == "theme" and type(v) == "string" then
							S.theme = v; applyTheme(v)
						elseif k == "device" and type(v) == _Vzd({152,153,151,142,147,140}) then
							S.device = v
						elseif type(v) == "number" then
							S[k] = v
						end
					end
					notify(HUB_NAME, _Vzd({104,148,147,139,142,140,69,142,146,149,148,151,153,138,137,69,57,69,151,138,148,149,138,147,69,141,154,135,69,153,148,69,134,149,149,145,158}), 2)
				else
					notify(HUB_NAME, _Vzd({110,147,155,134,145,142,137,69,111,120,116,115}), 2)
				end
			end,
		})
		section(sc, "AUTO MODE", n())
		makeToggle(sc, {
			order = n(), id = "autoMode", title = "Auto Mode (BETA)",
			tip = _Vzd({102,154,153,148,146,134,153,142,136,134,145,145,158,69,138,147,134,135,145,138,152,69,153,141,138,69,135,138,152,153,69,148,149,153,142,148,147,152,69,139,148,151,69,156,141,134,153,138,155,138,151,69,152,142,153,154,134,153,142,148,147,69,158,148,154,76,151,138,69,142,147}),
			callback = function(on)
				S.toggles.autoMode = on
				if on then
					if not S._autoModeConn then
						S._autoModeConn = {}
						table.insert(S._autoModeConn, RunService.Heartbeat:Connect(function()
							if not S.toggles.autoMode then return end
							local ch = LP.Character
							local h = ch and ch:FindFirstChildOfClass("Humanoid")
							local hr = hrp()
							if not h or not hr then return end
							local r = hr
							local po = r and r:FindFirstChild("PartOwner")
							if not po then
								for _, desc in ipairs(r and r:GetDescendants() or {}) do
									if desc.Name == "PartOwner" then po = desc; break end
								end
							end
							if po then
								S.toggles.escapeSpace = true
								if not S.conns.escapeJump then installInstantEscape() end
								if S.autoCounter or S.toggles.autoCounter then
									local grabber = (po:IsA("ObjectValue") and po.Value) or nil
									if grabber and grabber:IsA("Player") and grabber ~= LP then
										task.spawn(function() counterAttackPlayer(grabber) end)
									end
								end
							end
							if h.Health < h.MaxHealth * 0.3 and h.Health > 0 then
								if not S.toggles.antiKill then
									S.antiWanted = S.antiWanted or {}
									S.antiWanted.antiKill = true
									pcall(function() startAntiKillLoop() end)
								end
							end
						end))
						table.insert(S._autoModeConn, RunService.Heartbeat:Connect(function()
							if not S.toggles.autoMode then return end
							local me = hrp()
							if not me then return end
							local closest, dist = nil, 50
							for _, p in ipairs(allTargets()) do
								if validP(p) then
									local r = rootOf(p)
									if r then
										local d = (r.Position - me.Position).Magnitude
										if d < dist then closest = p; dist = d end
									end
								end
							end
							if closest then
								flingPlayer(closest, S.flingPower or 200, true)
							end
						end))
					end
				else
					if S._autoModeConn then
						for _, c in ipairs(S._autoModeConn) do pcall(function() c:Disconnect() end) end
						S._autoModeConn = nil
					end
				end
			end,
		})
		section(sc, "RESET", n())
		makeButton(sc, {
			order = n(), title = "Reset All Settings",
			danger = true,
			callback = function()
				S.flingPower = 8000; S.auraRange = 50; S.walkSpeed = 50
				S.flySpeed = 80; S.jumpPower = 80; S.strengthMult = 1
				S.lagIntensity = 150; S.extendAmount = 25; S.silentFov = 150
				S.hubScale = 100; S.device = "PC"; S.theme = "Purple"
				applyTheme("Purple")
				notify(HUB_NAME, "All settings reset to defaults", 2)
			end,
		})
end

local function buildTab(id, sc)
	S._buildingTab = id
	local o = 0
	local function n() o += 1; return o end
	local fn = _TAB_BUILDERS[id]
	if fn then fn(sc, n) end
end

local function switchTab(id)
	for tid, panel in pairs(S.panels) do
		panel.Visible = tid == id
		if tid == id then
			local sc = panel:FindFirstChildWhichIsA("ScrollingFrame", true)
			if sc then sc.CanvasPosition = Vector2.zero end
		end
	end
	for tid, btn in pairs(S.tabs) do
		local lab = S.tabLabels and S.tabLabels[tid]
		local badge = S.tabBadges and S.tabBadges[tid]
		local ts = S.tabStrokes and S.tabStrokes[tid]
		local bg = S.tabBadgeGlows and S.tabBadgeGlows[tid]
		if tid == id then
			btn:SetAttribute("activeTab", true)
			btn.BackgroundColor3 = C.accentDim
			btn.BackgroundTransparency = 0.05
			if lab then lab.TextColor3 = C.text end
			if badge then badge.BackgroundColor3 = C.accent end
			if ts then tween(ts, { Color = C.accent, Transparency = 0.15 }, 0.2) end
			if bg then tween(bg, { Color = C.accent, Transparency = 0.1, Thickness = 1.5 }, 0.2) end
		else
			btn:SetAttribute("activeTab", nil)
			btn.BackgroundColor3 = C.bg
			btn.BackgroundTransparency = 0.35
			if lab then lab.TextColor3 = C.muted end
			if badge then badge.BackgroundColor3 = C.accentDim end
			if ts then tween(ts, { Color = C.strokeSoft, Transparency = 0.6 }, 0.2) end
			if bg then tween(bg, { Color = C.accent, Transparency = 0.5, Thickness = 0.8 }, 0.2) end
		end
	end
end

S.savedMouseBehavior = S.savedMouseBehavior or Enum.MouseBehavior.LockCenter
S.hubOpen = true
S.hubAnimating = false
S.weUnlockedMouse = false

local function stopMouseForce()
	if S.mouseForceConn then
		pcall(function() S.mouseForceConn:Disconnect() end)
		S.mouseForceConn = nil
	end
end

local function setMouseUnlocked(unlocked)
	if isMobileMode() then
		stopMouseForce()
		pcall(function()
			UserInputService.MouseBehavior = Enum.MouseBehavior.Default
			UserInputService.MouseIconEnabled = true
		end)
		return
	end
	stopMouseForce()
	pcall(function()
		if unlocked then
			if not S.weUnlockedMouse then
				local cur = UserInputService.MouseBehavior
				if cur == Enum.MouseBehavior.LockCenter or cur == Enum.MouseBehavior.LockCurrentPosition then
					S.savedMouseBehavior = cur
				else
					S.savedMouseBehavior = Enum.MouseBehavior.LockCenter
				end
				S.weUnlockedMouse = true
			end
			UserInputService.MouseBehavior = Enum.MouseBehavior.Default
			UserInputService.MouseIconEnabled = true
			S.mouseForceConn = RunService.RenderStepped:Connect(function()
				if not S.hubOpen then return end
				if S.toggles.unlockMouse == false then return end
				if not S.root or not S.root.Parent then return end
				UserInputService.MouseBehavior = Enum.MouseBehavior.Default
				UserInputService.MouseIconEnabled = true
			end)
		else
			S.weUnlockedMouse = false
			local target = Enum.MouseBehavior.LockCenter
			if S.savedMouseBehavior == Enum.MouseBehavior.LockCurrentPosition then
				target = Enum.MouseBehavior.LockCurrentPosition
			end
			UserInputService.MouseBehavior = target
			UserInputService.MouseIconEnabled = false
			local untilT = os.clock() + 1.5
			S.mouseForceConn = RunService.RenderStepped:Connect(function()
				if S.hubOpen and S.toggles.unlockMouse ~= false and S.root and S.root.Parent then
					stopMouseForce()
					return
				end
				UserInputService.MouseBehavior = target
				UserInputService.MouseIconEnabled = false
				if os.clock() >= untilT then
					stopMouseForce()
				end
			end)
		end
	end)
end

local function hubOpenSize()
	return UDim2.fromOffset(S.mainW or 660, S.mainH or 450)
end

local function setHubOpen(open)
	if not S.root or S.hubAnimating then return end
	S.hubOpen = open == true
	local root = S.root
	S.hubAnimating = true
	if S.hubOpen then
		root.Visible = true
		root.Size = UDim2.fromOffset(40, 40)
		root.BackgroundTransparency = 0.5
		tween(root, { Size = hubOpenSize(), BackgroundTransparency = 0 }, 0.4, Enum.EasingStyle.Quint)
		pcall(setPurpleTint, true)
		if S.toggles.unlockMouse ~= false then
			setMouseUnlocked(true)
		end
		if S.syncMobileChrome then S.syncMobileChrome() end
		task.delay(0.42, function() S.hubAnimating = false end)
	else
		S.hubOpen = false
		pcall(setPurpleTint, false)
		setMouseUnlocked(false)
		tween(root, { Size = UDim2.fromOffset(40, 40), BackgroundTransparency = 0.6 }, 0.28, Enum.EasingStyle.Quad)
		if S.syncMobileChrome then S.syncMobileChrome() end
		task.delay(0.28, function()
			if S.root then S.root.Visible = false end
			S.hubAnimating = false
			if S.syncMobileChrome then S.syncMobileChrome() end
			if not S.hubOpen then
				setMouseUnlocked(false)
				pcall(setPurpleTint, false)
			end
		end)
	end
end

local function toggleHub()
	setHubOpen(not S.hubOpen)
end

local function keyNameToEnum(name)
	name = tostring(name or "")
	local ok, k = pcall(function() return Enum.KeyCode[name] end)
	if ok and k then return k end
	return nil
end

local function installKeybindHandler()
	bind("keybinds", UserInputService.InputBegan:Connect(function(input, gp)
		if gp then return end
		if input.UserInputType ~= Enum.UserInputType.Keyboard then return end
		local code = input.KeyCode
		if code == Enum.KeyCode.RightShift then
			if S.toggles.kb_toggleUI ~= false then toggleHub() end
			return
		end
		local function pressed(name)
			local e = keyNameToEnum(name)
			return e and code == e
		end
		if S.toggles.kb_flingAura and pressed(S.keybinds and S.keybinds.aura_fling or "F") then
			S.toggles.aura_fling = not S.toggles.aura_fling
			setAura(_Vzd({139,145,142,147,140}), S.toggles.aura_fling == true)
			notify(HUB_NAME, _Vzd({107,145,142,147,140,69,134,154,151,134,69}) .. (S.toggles.aura_fling and "ON" or "OFF"), 1)
		elseif S.toggles.kb_netown and pressed(S.keybinds and S.keybinds.aura_netown or "G") then
			S.toggles.aura_netown = not S.toggles.aura_netown
			setAura("netown", S.toggles.aura_netown == true)
			notify(HUB_NAME, "Net own " .. (S.toggles.aura_netown and "ON" or "OFF"), 1)
		elseif S.toggles.kb_antiGrab and pressed(S.keybinds and S.keybinds.antiGrab or "H") then
			S.toggles.antiGrab = not S.toggles.antiGrab
			stopLoop("antiGrab")
			if S.toggles.antiGrab then startLoop(_Vzd({134,147,153,142,108,151,134,135}), 0.1, antiGrabTick) end
			notify(HUB_NAME, _Vzd({102,147,153,142,82,140,151,134,135,69}) .. (S.toggles.antiGrab and "ON" or "OFF"), 1)
		elseif S.toggles.kb_fly and pressed(S.keybinds and S.keybinds.fly or "V") then
			S.toggles.fly = not S.toggles.fly
			setFly(S.toggles.fly == true)
		elseif S.toggles.kb_noclip and pressed(S.keybinds and S.keybinds.noclip or "N") then
			S.toggles.noclip = not S.toggles.noclip
		elseif S.toggles.kb_reach and pressed(S.keybinds and S.keybinds.lineExtend or "R") then
			S.toggles.lineExtend = not S.toggles.lineExtend
			setLineExtend(S.toggles.lineExtend == true)
		elseif S.toggles.kb_pallet and pressed(S.keybinds and S.keybinds.pallet or "Q") then
			if S.toggles.palletQ or S.toggles.kb_pallet then
				if not FTAP.SpawnToy then pcall(resolveFTAP) end
				if FTAP.SpawnToy then
					spawnToy(_Vzd({117,134,145,145,138,153,113,142,140,141,153,103,151,148,156,147}), { sync = true })
				else
					spawnToy("PalletLightBrown")
				end
			end
		elseif S.toggles.kb_flingNear and pressed(S.keybinds and S.keybinds.flingNear or "T") then
			local me = hrp()
			if me then
				local best, bd = nil, 1e9
				for _, p in ipairs(Players:GetPlayers()) do
					if validP(p) then
						local d = (rootOf(p).Position - me.Position).Magnitude
						if d < bd then best, bd = p, d end
					end
				end
				if best then flingPlayer(best, S.flingPower, false, true) end
			end
		elseif S.toggles.kb_stomp and pressed(S.keybinds and S.keybinds.aura_stomp or "Y") then
			S.toggles.aura_stomp = not S.toggles.aura_stomp
			setAura("stomp", S.toggles.aura_stomp == true)
		elseif S.toggles.kb_orbit and pressed(S.keybinds and S.keybinds.aura_orbit or "O") then
			S.toggles.aura_orbit = not S.toggles.aura_orbit
			setAura("orbit", S.toggles.aura_orbit == true)
		elseif pressed("U") then
			local char = LP.Character
			if char then
				local LIMB_PARTS = { "Right Arm", "Left Arm", "Right Leg", "Left Leg", "Head" }
				local r = char:FindFirstChild("HumanoidRootPart")
				for _, d in ipairs(char:GetDescendants()) do
					if d:IsA("Motor6D") then pcall(function() d:Destroy() end) end
				end
				for _, partName in ipairs(LIMB_PARTS) do
					local part = char:FindFirstChild(partName)
					if part and part:IsA("BasePart") then
						pcall(function()
							local dir = (part.Position - (r and r.Position or part.Position))
							if dir.Magnitude < 0.1 then dir = Vector3.new(math.random(-1,1), 1, math.random(-1,1)).Unit end
							part.AssemblyLinearVelocity = dir.Unit * 1500
						end)
					end
				end
				notify(HUB_NAME, _Vzd({113,142,146,135,152,69,151,142,149,149,138,137,69,148,139,139}), 1)
			end
		elseif S.toggles.kb_serverFling and pressed(S.keybinds and S.keybinds.srv_fling or "J") then
			S.toggles.srv_fling = not S.toggles.srv_fling
			setServerFx("fling", S.toggles.srv_fling == true)
		end
	end))
end

local function nearestPlayerForMobile()
	local me = hrp()
	if not me then return nil end
	local best, bd = nil, 1e9
	for _, p in ipairs(Players:GetPlayers()) do
		if validP(p) then
			local r = rootOf(p)
			if r then
				local d = (r.Position - me.Position).Magnitude
				if d < bd then best, bd = p, d end
			end
		end
	end
	return best
end

local function buildMobileHud(sg)
	if not isMobileMode() or not sg then return end
	S.mobileHudBtns = {}

	local menu = Instance.new(_Vzd({121,138,157,153,103,154,153,153,148,147}))
	menu.Name = "MobileMenu"
	menu.AnchorPoint = Vector2.new(0, 0)
	menu.Position = UDim2.new(0, 14, 0, 52)
	menu.Size = UDim2.fromOffset(72, 36)
	menu.BackgroundColor3 = C.bg2
	menu.BackgroundTransparency = 0.08
	menu.BorderSizePixel = 0
	menu.Font = Enum.Font.GothamBold
	menu.TextSize = 13
	menu.TextColor3 = C.text
	menu.Text = "MENU"
	menu.AutoButtonColor = false
	menu.ZIndex = 200
	menu.Parent = sg
	corner(menu, 10)
	stroke(menu, C.accent, 1.25, 0.25)
	S.mobileMenuBtn = menu
	menu.MouseButton1Click:Connect(function()
		toggleHub()
	end)

	local actionPad = Instance.new("Frame")
	actionPad.Name = "MobilePad"
	actionPad.AnchorPoint = Vector2.new(1, 0.5)
	actionPad.Position = UDim2.new(1, -12, 0.55, 0)
	actionPad.Size = UDim2.fromOffset(76, 0)
	actionPad.AutomaticSize = Enum.AutomaticSize.Y
	actionPad.BackgroundColor3 = C.bg2
	actionPad.BackgroundTransparency = 0.12
	actionPad.BorderSizePixel = 0
	actionPad.ZIndex = 190
	actionPad.Parent = sg
	corner(actionPad, 12)
	stroke(actionPad, C.strokeSoft, 1.1, 0.3)
	S.mobilePad = actionPad
	local padLay = Instance.new("UIListLayout")
	padLay.Padding = UDim.new(0, 5)
	padLay.HorizontalAlignment = Enum.HorizontalAlignment.Center
	padLay.SortOrder = Enum.SortOrder.LayoutOrder
	padLay.Parent = actionPad
	pad(actionPad, 7, 6, 7, 6)

	local function styleBtn(b, on)
		if on then
			b.BackgroundColor3 = C.accentDim
			local s = b:FindFirstChildOfClass("UIStroke")
			if s then s.Color = C.accent; s.Transparency = 0.15 end
		else
			b.BackgroundColor3 = C.card
			local s = b:FindFirstChildOfClass("UIStroke")
			if s then s.Color = C.strokeSoft; s.Transparency = 0.4 end
		end
	end

	local function addPadBtn(order, label, opts)
		opts = opts or {}
		local b = Instance.new("TextButton")
		b.LayoutOrder = order
		b.Size = UDim2.fromOffset(64, 34)
		b.BackgroundColor3 = opts.danger and C.danger or C.card
		b.BorderSizePixel = 0
		b.Font = Enum.Font.GothamBold
		b.TextSize = 10
		b.TextColor3 = opts.danger and C.dangerText or C.text
		b.Text = label
		b.AutoButtonColor = false
		b.ZIndex = 191
		b.Parent = actionPad
		corner(b, 8)
		stroke(b, opts.danger and C.dangerStroke or C.strokeSoft, 1, 0.4)
		if opts.toggleKey then
			S.mobileHudBtns[opts.toggleKey] = b
			styleBtn(b, S.toggles[opts.toggleKey] == true)
		end
		b.MouseButton1Click:Connect(function()
			pcall(function()
				if opts.onPress then opts.onPress(b) end
			end)
			if opts.toggleKey then styleBtn(b, S.toggles[opts.toggleKey] == true) end
		end)
		return b
	end

	addPadBtn(1, "PALLET", { onPress = function() spawnToy(S.selectedToy or "PalletLightBrown") end })
	addPadBtn(2, "FLY", {
		toggleKey = "fly",
		onPress = function()
			S.toggles.fly = not S.toggles.fly
			setFly(S.toggles.fly == true)
		end,
	})
	addPadBtn(3, "NOCLIP", {
		toggleKey = "noclip",
		onPress = function() S.toggles.noclip = not S.toggles.noclip end,
	})
	addPadBtn(4, "ANTI", {
		toggleKey = "antiGrab",
		onPress = function()
			S.toggles.antiGrab = not S.toggles.antiGrab
			S.antiWanted = S.antiWanted or {}
			S.antiWanted.antiGrab = S.toggles.antiGrab
			stopLoop(_Vzd({134,147,153,142,108,151,134,135}))
			if S.toggles.antiGrab then startLoop("antiGrab", 0.1, antiGrabTick) end
		end,
	})
	addPadBtn(5, _Vzd({107,113,110,115,108}), {
		toggleKey = "aura_fling",
		onPress = function()
			S.toggles.aura_fling = not S.toggles.aura_fling
			setAura("fling", S.toggles.aura_fling == true)
		end,
	})
	addPadBtn(6, _Vzd({121,109,119,116,124}), {
		onPress = function()
			local p = S.selected or nearestPlayerForMobile()
			if p then flingPlayer(p, S.flingPower, false, true)
			else notify(HUB_NAME, "No target", 1) end
		end,
	})
	addPadBtn(7, "KILL", {
		danger = true,
		onPress = function()
			local p = S.selected or nearestPlayerForMobile()
			if p then killPlayer(p, true)
			else notify(HUB_NAME, _Vzd({115,148,69,153,134,151,140,138,153}), 1) end
		end,
	})

	local bot = Instance.new(_Vzd({107,151,134,146,138}))
	bot.Name = _Vzd({114,148,135,142,145,138,103,148,153,153,148,146})
	bot.AnchorPoint = Vector2.new(0.5, 1)
	bot.Position = UDim2.new(0.5, 0, 1, -18)
	bot.Size = UDim2.fromOffset(0, 44)
	bot.AutomaticSize = Enum.AutomaticSize.X
	bot.BackgroundColor3 = C.bg2
	bot.BackgroundTransparency = 0.1
	bot.BorderSizePixel = 0
	bot.ZIndex = 190
	bot.Parent = sg
	corner(bot, 12)
	stroke(bot, C.strokeSoft, 1.1, 0.3)
	S.mobileBot = bot
	local botLay = Instance.new("UIListLayout")
	botLay.FillDirection = Enum.FillDirection.Horizontal
	botLay.Padding = UDim.new(0, 6)
	botLay.HorizontalAlignment = Enum.HorizontalAlignment.Center
	botLay.VerticalAlignment = Enum.VerticalAlignment.Center
	botLay.SortOrder = Enum.SortOrder.LayoutOrder
	botLay.Parent = bot
	pad(bot, 5, 8, 5, 8)

	local function addBot(order, text, danger, fn)
		local b = Instance.new("TextButton")
		b.LayoutOrder = order
		b.Size = UDim2.fromOffset(70, 32)
		b.BackgroundColor3 = danger and C.danger or C.card
		b.BorderSizePixel = 0
		b.Font = Enum.Font.GothamBold
		b.TextSize = 11
		b.TextColor3 = danger and C.dangerText or C.text
		b.Text = text
		b.AutoButtonColor = false
		b.ZIndex = 191
		b.Parent = bot
		corner(b, 8)
		stroke(b, danger and C.dangerStroke or C.strokeSoft, 1, 0.35)
		b.MouseButton1Click:Connect(function() pcall(fn) end)
	end
	addBot(1, "BRING", false, function()
		local p = S.selected or nearestPlayerForMobile()
		if p then bringPlayer(p) else notify(HUB_NAME, "No target", 1) end
	end)
	addBot(2, "ESCAPE", false, function()
		if freeFromGrabInstant then freeFromGrabInstant()
		elseif doAntiGrabHard then doAntiGrabHard() end
	end)
	addBot(3, "HOUSE", false, function()
		if S.toggles.antiKill then stopAntiKillLoop() else startAntiKillLoop() end
	end)
	addBot(4, "BLOB", true, function()
		task.spawn(function() pcall(blobmanGrabAllOnce) end)
	end)

	local function syncMobileChrome()
		local hubVis = S.hubOpen and S.root and S.root.Visible
		if actionPad then actionPad.Visible = not hubVis end
		if bot then bot.Visible = not hubVis end
		if menu then menu.Text = hubVis and "HIDE" or "MENU" end
	end
	S.syncMobileChrome = syncMobileChrome
	syncMobileChrome()
end

function buildMain()
	resolveFTAP()
	S.toggles.unlockMouse = false
	S.toggles.freeCamMass = false
	S.toggles.kb_toggleUI = true
	S.antiWanted = S.antiWanted or {}
	if S.device ~= "Mobile" and UserInputService.TouchEnabled and not UserInputService.KeyboardEnabled then
		S.device = "Mobile"
		S.toggles.mobileUI = true
	end
	local mobile = isMobileMode()

	local parent = getUiParent()
	local old = parent:FindFirstChild(_Vzd({123,116,110,105,127,132,109,122,103})); if old then old:Destroy() end
	local sg = Instance.new("ScreenGui")
	sg.Name = "VOIDZ_HUB"
	sg.ResetOnSpawn = false
	sg.IgnoreGuiInset = true
	sg.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	sg.DisplayOrder = 100000
	sg.Parent = parent
	S.gui = sg

	local cam = workspace.CurrentCamera
	local vw = (cam and cam.ViewportSize.X) or 800
	local vh = (cam and cam.ViewportSize.Y) or 600
	if mobile then
		S.mainW = math.clamp(math.floor(vw * 0.92), 300, 720)
		S.mainH = math.clamp(math.floor(vh * 0.72), 340, 620)
	else
		S.mainW, S.mainH = 680, 460
	end

	local toast = Instance.new("Frame")
	toast.AnchorPoint = Vector2.new(1, 0)
	toast.Position = UDim2.new(1, -16, 0, mobile and 96 or 18)
	toast.Size = UDim2.fromOffset(mobile and 260 or 240, 50)
	toast.BackgroundColor3 = C.bg2
	toast.BackgroundTransparency = 0.05
	toast.Visible = false
	toast.BorderSizePixel = 0
	toast.Parent = sg
	corner(toast, 12)
	stroke(toast, C.accent, 1.1, 0.35)
	local tt = Instance.new("TextLabel")
	tt.BackgroundTransparency = 1
	tt.Size = UDim2.new(1, -16, 0, 16)
	tt.Position = UDim2.fromOffset(12, 7)
	tt.Font = Enum.Font.GothamBold
	tt.TextSize = 12
	tt.TextColor3 = C.accent2
	tt.TextXAlignment = Enum.TextXAlignment.Left
	tt.Text = HUB_NAME
	tt.Parent = toast
	local tb = Instance.new("TextLabel")
	tb.BackgroundTransparency = 1
	tb.Size = UDim2.new(1, -16, 0, 18)
	tb.Position = UDim2.fromOffset(12, 24)
	tb.Font = Enum.Font.Gotham
	tb.TextSize = 11
	tb.TextColor3 = C.text
	tb.TextXAlignment = Enum.TextXAlignment.Left
	tb.Text = ""
	tb.Parent = toast
	S.notify = { Frame = toast, Title = tt, Body = tb }

	local tip = Instance.new("Frame")
	tip.AnchorPoint = Vector2.new(0, 1)
	tip.Position = UDim2.new(0, 14, 1, mobile and -68 or -14)
	tip.Size = UDim2.fromOffset(mobile and math.min(vw - 28, 300) or 300, 44)
	tip.BackgroundColor3 = C.tip
	tip.BackgroundTransparency = 0.05
	tip.Visible = false
	tip.BorderSizePixel = 0
	tip.Parent = sg
	corner(tip, 10)
	stroke(tip, C.strokeSoft, 1, 0.4)
	local tipL = Instance.new("TextLabel")
	tipL.BackgroundTransparency = 1
	tipL.Size = UDim2.new(1, -16, 1, -10)
	tipL.Position = UDim2.fromOffset(10, 5)
	tipL.Font = Enum.Font.Gotham
	tipL.TextSize = 11
	tipL.TextColor3 = C.text
	tipL.TextWrapped = true
	tipL.TextXAlignment = Enum.TextXAlignment.Left
	tipL.TextYAlignment = Enum.TextYAlignment.Top
	tipL.Text = ""
	tipL.Parent = tip
	S.tipFrame = tip
	S.tipLabel = tipL

	local root = Instance.new("Frame")
	root.Name = "Root"
	root.AnchorPoint = Vector2.new(0.5, 0.5)
	root.Position = UDim2.fromScale(0.5, mobile and 0.46 or 0.5)
	root.Size = UDim2.fromOffset(0, 0)
	root.BackgroundColor3 = C.bg
	root.BorderSizePixel = 0
	root.ClipsDescendants = true
	root.Parent = sg
	S.root = root
	corner(root, 16)
	local rootStroke = stroke(root, C.accent, 1.35, 0.2)
	grad(root, C.bg2, C.bg, 125)
	tween(root, { Size = hubOpenSize() }, 0.4, Enum.EasingStyle.Quint)
	task.spawn(function()
		local glow = rootStroke
		while root.Parent do
			if S.hubOpen then
				tween(glow, { Transparency = 0.05 }, 1.5, Enum.EasingStyle.Sine)
				task.wait(1.5)
				tween(glow, { Transparency = 0.3 }, 1.5, Enum.EasingStyle.Sine)
				task.wait(1.5)
			else
				task.wait(0.5)
			end
		end
	end)

	local headerH = mobile and 48 or 44
	local header = Instance.new("Frame")
	header.Size = UDim2.new(1, 0, 0, headerH)
	header.BackgroundColor3 = C.bg2
	header.BackgroundTransparency = 0.15
	header.BorderSizePixel = 0
	header.ZIndex = 5
	header.Parent = root
	local top = Instance.new("Frame")
	top.Size = UDim2.new(1, 0, 0, 3)
	top.BackgroundColor3 = Color3.new(1, 1, 1)
	top.BorderSizePixel = 0
	top.ZIndex = 6
	top.Parent = header
	local topGrad = Instance.new(_Vzd({122,110,108,151,134,137,142,138,147,153}))
	topGrad.Color = ColorSequence.new({
		ColorSequenceKeypoint.new(0, C.accent),
		ColorSequenceKeypoint.new(0.3, C.accent2 or C.accent),
		ColorSequenceKeypoint.new(0.6, C.success or C.accent),
		ColorSequenceKeypoint.new(1, C.accent),
	})
	topGrad.Rotation = 0
	topGrad.Parent = top
	task.spawn(function()
		local rot = 0
		while top.Parent do
			rot = (rot + 1.2) % 360
			topGrad.Rotation = rot
			task.wait(0.03)
		end
	end)
	local glowLine = Instance.new("Frame")
	glowLine.Size = UDim2.new(1, 0, 0, 8)
	glowLine.Position = UDim2.new(0, 0, 0, 3)
	glowLine.BackgroundTransparency = 0.7
	glowLine.BackgroundColor3 = C.accent
	glowLine.BorderSizePixel = 0
	glowLine.ZIndex = 6
	glowLine.Parent = header
	corner(glowLine, 0)
	local glowGrad = Instance.new("UIGradient")
	glowGrad.Color = ColorSequence.new({
		ColorSequenceKeypoint.new(0, Color3.new(0, 0, 0)),
		ColorSequenceKeypoint.new(0.3, C.accent),
		ColorSequenceKeypoint.new(0.5, Color3.new(1, 1, 1)),
		ColorSequenceKeypoint.new(0.7, C.accent),
		ColorSequenceKeypoint.new(1, Color3.new(0, 0, 0)),
	})
	glowGrad.Transparency = NumberSequence.new({
		NumberSequenceKeypoint.new(0, 1),
		NumberSequenceKeypoint.new(0.3, 0.5),
		NumberSequenceKeypoint.new(0.5, 0.3),
		NumberSequenceKeypoint.new(0.7, 0.5),
		NumberSequenceKeypoint.new(1, 1),
	})
	glowGrad.Parent = glowLine
	task.spawn(function()
		local gRot = 0
		while glowLine.Parent do
			gRot = (gRot + 0.8) % 360
			glowGrad.Rotation = gRot
			task.wait(0.03)
		end
	end)

	local logo = Instance.new(_Vzd({121,138,157,153,113,134,135,138,145}))
	logo.BackgroundTransparency = 1
	logo.Size = UDim2.new(0, mobile and 120 or 100, 1, 0)
	logo.Position = UDim2.fromOffset(14, 0)
	logo.Font = Enum.Font.GothamBlack
	logo.TextSize = mobile and 17 or 16
	logo.TextColor3 = Color3.new(1, 1, 1)
	logo.TextXAlignment = Enum.TextXAlignment.Left
	logo.Text = "VOIDZ"
	logo.ZIndex = 7
	logo.Parent = header
	local logoGrad = Instance.new(_Vzd({122,110,108,151,134,137,142,138,147,153}))
	logoGrad.Color = ColorSequence.new({
		ColorSequenceKeypoint.new(0, C.accent2 or C.accent),
		ColorSequenceKeypoint.new(0.5, Color3.new(1, 1, 1)),
		ColorSequenceKeypoint.new(1, C.accent),
	})
	logoGrad.Rotation = 30
	logoGrad.Parent = logo

	local status = Instance.new(_Vzd({121,138,157,153,113,134,135,138,145}))
	status.BackgroundTransparency = 1
	status.Size = UDim2.new(0, 72, 0, 20)
	status.Position = UDim2.new(1, mobile and -118 or -112, 0.5, -10)
	status.Font = Enum.Font.GothamMedium
	status.TextSize = 10
	status.TextColor3 = C.muted
	status.TextXAlignment = Enum.TextXAlignment.Center
	status.Text = FTAP.ok and "FTAP" or "…"
	status.ZIndex = 7
	status.Parent = header
	local statusBg = Instance.new("Frame")
	statusBg.Size = UDim2.fromOffset(72, 22)
	statusBg.Position = UDim2.new(1, mobile and -118 or -112, 0.5, -11)
	statusBg.BackgroundColor3 = C.card
	statusBg.BackgroundTransparency = 0.25
	statusBg.BorderSizePixel = 0
	statusBg.ZIndex = 6
	statusBg.Parent = header
	corner(statusBg, 7)
	stroke(statusBg, C.strokeSoft, 1, 0.5)
	status.Parent = header
	S.status = status

	local close = Instance.new("TextButton")
	local closeS = mobile and 32 or 28
	close.Size = UDim2.fromOffset(closeS, closeS)
	close.Position = UDim2.new(1, -(closeS + 10), 0.5, -closeS / 2)
	close.BackgroundColor3 = C.card
	close.Text = "×"
	close.TextColor3 = C.muted
	close.Font = Enum.Font.GothamBold
	close.TextSize = mobile and 16 or 15
	close.ZIndex = 8
	close.AutoButtonColor = false
	close.Parent = header
	corner(close, 8)
	local closeStroke = stroke(close, C.strokeSoft, 1, 0.45)
	close.MouseButton1Click:Connect(function() setHubOpen(false) end)
	close.MouseEnter:Connect(function()
		tween(close, { BackgroundColor3 = C.danger, BackgroundTransparency = 0 }, 0.15)
		tween(closeStroke, { Color = C.dangerText or C.danger, Transparency = 0 }, 0.15)
		tween(close, { TextColor3 = Color3.new(1, 1, 1) }, 0.15)
	end)
	close.MouseLeave:Connect(function()
		tween(close, { BackgroundColor3 = C.card, BackgroundTransparency = 0 }, 0.2)
		tween(closeStroke, { Color = C.strokeSoft, Transparency = 0.45 }, 0.2)
		tween(close, { TextColor3 = C.muted }, 0.2)
	end)

	local dragging, dragStart, startPos
	header.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			dragging = true; dragStart = input.Position; startPos = root.Position
			input.Changed:Connect(function() if input.UserInputState == Enum.UserInputState.End then dragging = false end end)
		end
	end)
	UserInputService.InputChanged:Connect(function(input)
		if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
			local d = input.Position - dragStart
			root.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + d.X, startPos.Y.Scale, startPos.Y.Offset + d.Y)
		end
	end)

	local sideW = mobile and 100 or 112
	local gap = 8
	local contentTop = headerH + gap
	local side = Instance.new("ScrollingFrame")
	side.Size = UDim2.new(0, sideW, 1, -(contentTop + gap))
	side.Position = UDim2.fromOffset(gap, contentTop)
	side.BackgroundColor3 = C.bg2
	side.BackgroundTransparency = 0.2
	side.BorderSizePixel = 0
	side.ScrollBarThickness = 2
	side.ScrollBarImageColor3 = C.accent
	side.ScrollBarImageTransparency = 0.4
	side.AutomaticCanvasSize = Enum.AutomaticSize.Y
	side.CanvasSize = UDim2.new()
	side.ZIndex = 4
	side.Parent = root
	corner(side, 12)
	local sideStroke = stroke(side, C.strokeSoft, 1.2, 0.4)
	task.spawn(function()
		while side.Parent do
			if S.hubOpen then
				tween(sideStroke, { Color = C.accent, Transparency = 0.2 }, 2, Enum.EasingStyle.Sine)
				task.wait(2)
				tween(sideStroke, { Color = C.strokeSoft, Transparency = 0.5 }, 2, Enum.EasingStyle.Sine)
				task.wait(2)
			else
				task.wait(0.5)
			end
		end
	end)
	local sideLay = Instance.new("UIListLayout")
	sideLay.Padding = UDim.new(0, 4)
	sideLay.SortOrder = Enum.SortOrder.LayoutOrder
	sideLay.Parent = side
	pad(side, 6, 6, 6, 6)

	local content = Instance.new("Frame")
	content.Size = UDim2.new(1, -(sideW + gap * 3), 1, -(contentTop + gap))
	content.Position = UDim2.fromOffset(sideW + gap * 2, contentTop)
	content.BackgroundColor3 = C.bg2
	content.BackgroundTransparency = 0.25
	content.BorderSizePixel = 0
	content.ClipsDescendants = true
	content.ZIndex = 4
	content.Parent = root
	corner(content, 12)
	stroke(content, C.strokeSoft, 1, 0.5)
	local contentGrad = Instance.new("UIGradient")
	contentGrad.Color = ColorSequence.new({
		ColorSequenceKeypoint.new(0, C.bg2),
		ColorSequenceKeypoint.new(1, C.bg),
	})
	contentGrad.Rotation = 160
	contentGrad.Transparency = NumberSequence.new({
		NumberSequenceKeypoint.new(0, 0.25),
		NumberSequenceKeypoint.new(1, 0.35),
	})
	contentGrad.Parent = content

	for i, def in ipairs(TAB_DEFS) do
		local btn = Instance.new("TextButton")
		btn.LayoutOrder = i
		btn.Size = UDim2.new(1, 0, 0, mobile and 38 or 30)
		btn.BackgroundColor3 = C.bg
		btn.BackgroundTransparency = 0.35
		btn.BorderSizePixel = 0
		btn.Text = ""
		btn.AutoButtonColor = false
		btn.ZIndex = 5
		btn.Parent = side
		corner(btn, 8)
		local btnStroke = stroke(btn, C.strokeSoft, 0.8, 0.6)
		btn.MouseEnter:Connect(function()
			tween(btn, { BackgroundTransparency = 0.15 }, 0.15)
			tween(btnStroke, { Color = C.accent, Transparency = 0.3 }, 0.15)
		end)
		btn.MouseLeave:Connect(function()
			if S.tabs[def.id] ~= btn or not btn:GetAttribute("activeTab") then
				tween(btn, { BackgroundTransparency = 0.35 }, 0.15)
				tween(btnStroke, { Color = C.strokeSoft, Transparency = 0.6 }, 0.15)
			end
		end)
		local badge = Instance.new("Frame")
		local bs = mobile and 22 or 20
		badge.Size = UDim2.fromOffset(bs, bs)
		badge.Position = UDim2.fromOffset(5, (mobile and 38 or 30) / 2 - bs / 2)
		badge.BackgroundColor3 = C.accentDim
		badge.BackgroundTransparency = 0.15
		badge.BorderSizePixel = 0
		badge.ZIndex = 6
		badge.Parent = btn
		corner(badge, 6)
		local badgeGlow = stroke(badge, C.accent, 0.8, 0.5)
		local badgeTx = Instance.new("TextLabel")
		badgeTx.BackgroundTransparency = 1
		badgeTx.Size = UDim2.fromScale(1, 1)
		badgeTx.Font = Enum.Font.GothamBold
		badgeTx.TextSize = mobile and 10 or 9
		badgeTx.TextColor3 = C.text
		badgeTx.Text = def.icon
		badgeTx.ZIndex = 7
		badgeTx.Parent = badge
		local lab = Instance.new("TextLabel")
		lab.BackgroundTransparency = 1
		lab.Size = UDim2.new(1, -(bs + 12), 1, 0)
		lab.Position = UDim2.fromOffset(bs + 10, 0)
		lab.Font = Enum.Font.GothamMedium
		lab.TextSize = mobile and 11 or 10
		lab.TextColor3 = C.muted
		lab.TextXAlignment = Enum.TextXAlignment.Left
		lab.Text = def.label
		lab.TextTruncate = Enum.TextTruncate.AtEnd
		lab.ZIndex = 6
		lab.Parent = btn
		btn:SetAttribute("TabId", def.id)
		S.tabs[def.id] = btn
		S.tabLabels = S.tabLabels or {}
		S.tabLabels[def.id] = lab
		S.tabBadges = S.tabBadges or {}
		S.tabBadges[def.id] = badge
		S.tabStrokes = S.tabStrokes or {}
		S.tabStrokes[def.id] = btnStroke
		S.tabBadgeGlows = S.tabBadgeGlows or {}
		S.tabBadgeGlows[def.id] = badgeGlow

		local panel = Instance.new("Frame")
		panel.Name = def.id
		panel.Size = UDim2.fromScale(1, 1)
		panel.BackgroundTransparency = 1
		panel.Visible = false
		panel.ZIndex = 5
		panel.Parent = content
		S.panels[def.id] = panel
		local sc = makeScroll(panel)
		local ok, err = pcall(buildTab, def.id, sc)
		if not ok then warn(_Vzd({128,123,116,110,105,127,130,69,153,134,135,69})..def.id, err) end
		btn.MouseButton1Click:Connect(function() switchTab(def.id) end)
	end


	S._buildingTab = nil

	switchTab("home")
	setPurpleTint(true)
	S.toggles.kb_toggleUI = true
	installKeybindHandler()
	installControlKeyC(true, true)
	S.escapeSpace = false
	S.toggles.escapeSpace = false
	if mobile then
		buildMobileHud(sg)
	end

	S.hubOpen = true

	LP.CharacterAdded:Connect(function()
		task.wait(0.8)
		local w = S.antiWanted or {}
		if w.antiGrab == true and S.toggles.antiGrab then
			stopLoop(_Vzd({134,147,153,142,108,151,134,135}))
			startLoop("antiGrab", 0.1, antiGrabTick)
			notify(HUB_NAME, "Anti-grab re-armed", 1.5)
		elseif w.antiGrab ~= true then
			S.toggles.antiGrab = false
			stopLoop(_Vzd({134,147,153,142,108,151,134,135}))
		end
		if w.antiKill or S.toggles.antiKill then
			startAntiKillLoop()
			notify(HUB_NAME, "Anti-kill re-armed · house TP", 1.5)
		end
		for _, key in ipairs({ _Vzd({134,147,153,142,103,154,151,147}), _Vzd({134,147,153,142,103,134,147,134,147,134}), "antiVoid", "antiFling", "antiExplode", "antiSit", "antiRagdoll", "god" }) do
			if w[key] or S.toggles[key] then
				S.toggles[key] = true
			end
		end
		local fp = workspace:FindFirstChild("VOIDZ_FreezePart")
		if fp then
			unfreezeCam()
			local anyCam = MASS.bring or MASS.kick or MASS.kill or MASS.fling or MASS.ragdoll or MASS.fire or MASS.vomit
			if anyCam then
				local me = hrp()
				if me then freezeCam(me.CFrame + Vector3.new(0, 10, 0)) end
			end
		end
	end)

	task.spawn(function()
		while S.gui and S.gui.Parent do
			task.wait(20)
			pcall(resolveFTAP)
			if S.playerListFrame then pcall(S._loopSearchRefresh) end
			if S._ctrlSearchRefresh then pcall(S._ctrlSearchRefresh) end
			if S._funControlSearchRefresh then pcall(S._funControlSearchRefresh) end
			if S.toggles.lineExtend then pcall(applyLineExtendDistance, S.extendAmount or 40) end
			if S.status then S.status.Text = FTAP.ok and "FTAP:ON" or _Vzd({107,121,102,117,95,75}) end
			if S.homeStatus then
				S.homeStatus.Text = _Vzd({69,103,154,142,145,137,95,69}) .. BUILD
					.. "\n Place: " .. tostring(game.PlaceId)
					.. "\n FTAP: " .. (FTAP.ok and "linked" or "scanning")
					.. _Vzd({69,220,69,149,145,134,158,138,151,152,95,69}) .. tostring(#labels)
			end
		end
	end)

	task.spawn(function()
		while S.gui and S.gui.Parent do
			if not FTAP.ok then resolveFTAP() end
			task.wait(3)
		end
	end)

	notify(HUB_NAME, _Vzd({116,147,145,142,147,138,69,115,142,140,140,134,69,220,69}) .. (FTAP.ok and "FTAP Linked Hell Yeah" or "Scan Remotes You Dumbass…"), 3)
	print(_Vzd({128,123,116,110,105,127,69,109,122,103,130}), BUILD, "FTAP", FTAP.ok)
end

local function buildKey()
	local parent = getUiParent()
	local old = parent:FindFirstChild("VOIDZ_KEY"); if old then old:Destroy() end
	local sg = Instance.new("ScreenGui")
	sg.Name = "VOIDZ_KEY"
	sg.ResetOnSpawn = false
	sg.IgnoreGuiInset = true
	sg.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	sg.DisplayOrder = 2147483647
	pcall(function() if protect_gui_fn then protect_gui_fn(sg) end end)
	sg.Parent = parent
	S.gui = sg

	local dim = Instance.new("Frame")
	dim.Size = UDim2.fromScale(1, 1)
	dim.BackgroundColor3 = C.black
	dim.BackgroundTransparency = 1
	dim.Parent = sg
	tween(dim, { BackgroundTransparency = 0.4 }, 0.35)

	local card = Instance.new("Frame")
	card.AnchorPoint = Vector2.new(0.5, 0.5)
	card.Position = UDim2.fromScale(0.5, 0.5)
	card.Size = UDim2.fromOffset(0, 0)
	card.BackgroundColor3 = C.bg2
	card.BorderSizePixel = 0
	card.Parent = sg
	corner(card, 16); stroke(card, C.accent, 1.8)
	grad(card, Color3.fromRGB(45, 18, 80), C.bg, 120)
	tween(card, { Size = UDim2.fromOffset(380, 280) }, 0.45, Enum.EasingStyle.Back)

	local top = Instance.new("Frame")
	top.Size = UDim2.new(1, 0, 0, 3)
	top.BackgroundColor3 = C.accent
	top.BorderSizePixel = 0
	top.Parent = card

	local skull = Instance.new("TextLabel")
	skull.BackgroundTransparency = 1
	skull.Size = UDim2.new(1, 0, 0, 36)
	skull.Position = UDim2.fromOffset(0, 22)
	skull.Font = Enum.Font.GothamBlack
	skull.TextSize = 24
	skull.TextColor3 = C.accent2
	skull.Text = _Vzd({123,116,110,105,127})
	skull.Parent = card

	local title = Instance.new("TextLabel")
	title.BackgroundTransparency = 1
	title.Size = UDim2.new(1, -40, 0, 22)
	title.Position = UDim2.fromOffset(20, 68)
	title.Font = Enum.Font.GothamBold
	title.TextSize = 18
	title.TextColor3 = C.text
	title.Text = _Vzd({123,116,110,105,127,69,109,122,103,69,115,110,108,108,102})
	title.Parent = card

	local sub = Instance.new("TextLabel")
	sub.BackgroundTransparency = 1
	sub.Size = UDim2.new(1, -40, 0, 16)
	sub.Position = UDim2.fromOffset(20, 96)
	sub.Font = Enum.Font.Gotham
	sub.TextSize = 12
	sub.TextColor3 = C.muted
	sub.Text = _Vzd({107,121,102,117,69,116,117,69,120,122,110,121,106,69,220,69,106,115,121,106,119,69,121,109,106,69,105,102,114,115,69,112,106,126,69,115,110,108,108,102})
	sub.Parent = card

	local box = Instance.new("TextBox")
	box.Size = UDim2.new(1, -56, 0, 38)
	box.Position = UDim2.fromOffset(28, 132)
	box.BackgroundColor3 = C.bg
	box.BorderSizePixel = 0
	box.Font = Enum.Font.Code
	box.TextSize = 15
	box.TextColor3 = C.text
	box.PlaceholderText = "KEY"
	box.PlaceholderColor3 = C.muted
	box.Text = ""
	box.Parent = card
	corner(box, 10); stroke(box, C.strokeSoft, 1)

	local status = Instance.new("TextLabel")
	status.BackgroundTransparency = 1
	status.Size = UDim2.new(1, -40, 0, 14)
	status.Position = UDim2.fromOffset(20, 180)
	status.Font = Enum.Font.Gotham
	status.TextSize = 11
	status.TextColor3 = C.muted
	status.Text = "Key: VOIDZHUB"
	status.Parent = card

	local unlock = Instance.new("TextButton")
	unlock.Size = UDim2.new(1, -56, 0, 40)
	unlock.Position = UDim2.fromOffset(28, 208)
	unlock.BackgroundColor3 = C.accentDim
	unlock.BorderSizePixel = 0
	unlock.Font = Enum.Font.GothamBold
	unlock.TextSize = 14
	unlock.TextColor3 = C.text
	unlock.Text = "UNLOCK →"
	unlock.AutoButtonColor = false
	unlock.Parent = card
	corner(unlock, 10); stroke(unlock, C.accent, 1.2)

	local function showDeviceSplash(device, onDone)
		showVoidzSplash(device, onDone)
	end

	local function pickDeviceThenMain()
		local dim = Instance.new("Frame")
		dim.Size = UDim2.fromScale(1, 1)
		dim.BackgroundColor3 = C.black
		dim.BackgroundTransparency = 0.35
		dim.Parent = sg
		local pick = Instance.new(_Vzd({107,151,134,146,138}))
		pick.AnchorPoint = Vector2.new(0.5, 0.5)
		pick.Position = UDim2.fromScale(0.5, 0.5)
		pick.Size = UDim2.fromOffset(340, 200)
		pick.BackgroundColor3 = C.bg2
		pick.BorderSizePixel = 0
		pick.Parent = dim
		corner(pick, 14)
		stroke(pick, C.accent, 2)
		local pt = Instance.new("TextLabel")
		pt.BackgroundTransparency = 1
		pt.Size = UDim2.new(1, -20, 0, 28)
		pt.Position = UDim2.fromOffset(10, 16)
		pt.Font = Enum.Font.GothamBold
		pt.TextSize = 16
		pt.TextColor3 = C.accent2
		pt.Text = "Choose device"
		pt.Parent = pick
		local ps = Instance.new("TextLabel")
		ps.BackgroundTransparency = 1
		ps.Size = UDim2.new(1, -20, 0, 36)
		ps.Position = UDim2.fromOffset(10, 48)
		ps.Font = Enum.Font.Gotham
		ps.TextSize = 11
		ps.TextColor3 = C.muted
		ps.TextWrapped = true
		ps.Text = "PC = keyboard binds · Mobile = larger buttons / touch\nThen a themed splash loads your hub."
		ps.Parent = pick
		local function go(dev)
			S.device = dev
			S.toggles.mobileUI = (dev == "Mobile")
			pcall(function() sg:Destroy() end)
			showDeviceSplash(dev, function()
				buildMain()
				if installInstantEscape then installInstantEscape() end
			end)
		end
		local pc = Instance.new("TextButton")
		pc.Size = UDim2.new(0.42, 0, 0, 40)
		pc.Position = UDim2.new(0.06, 0, 1, -58)
		pc.BackgroundColor3 = C.accentDim
		pc.Text = "PC"
		pc.TextColor3 = C.text
		pc.Font = Enum.Font.GothamBold
		pc.TextSize = 14
		pc.Parent = pick
		corner(pc, 10)
		stroke(pc, C.accent, 1.5)
		local mob = Instance.new("TextButton")
		mob.Size = UDim2.new(0.42, 0, 0, 40)
		mob.Position = UDim2.new(0.52, 0, 1, -58)
		mob.BackgroundColor3 = C.card
		mob.Text = "Mobile"
		mob.TextColor3 = C.text
		mob.Font = Enum.Font.GothamBold
		mob.TextSize = 14
		mob.Parent = pick
		corner(mob, 10)
		stroke(mob, C.stroke, 1.5)
		pc.MouseButton1Click:Connect(function() go("PC") end)
		mob.MouseButton1Click:Connect(function() go("Mobile") end)
	end

	local function try()
		local key = (box.Text or ""):gsub("^%s+", ""):gsub("%s+$", "")
		if key == ACCESS_KEY then
			status.TextColor3 = C.success
			status.Text = _Vzd({102,136,136,138,152,152,69,140,151,134,147,153,138,137})
			task.wait(0.15)
			box.Visible = false
			unlock.Visible = false
			status.Visible = false
			sub.Text = "Almost ready"
			pickDeviceThenMain()
		else
			status.TextColor3 = C.danger
			status.Text = _Vzd({110,147,155,134,145,142,137,69,144,138,158})
			box.Text = ""
		end
	end
	unlock.MouseButton1Click:Connect(function() task.spawn(try) end)
	box.FocusLost:Connect(function(e) if e then task.spawn(try) end end)
end

	local function openHub(device)
		S.device = device or S.device or "PC"
		S.toggles.mobileUI = (S.device == "Mobile")
		buildMain()
		pcall(function()
			if installInstantEscape then installInstantEscape() end
		end)
	end
	Late.buildKey = buildKey
	Late.buildMain = buildMain
	_G.buildMain = buildMain
	Late.openHub = openHub
	Late._phase = "exported"
	pcall(function()
		local g = getgenv and getgenv()
		if g then
			g.VOIDZ_API = {
				openHub = openHub,
				buildMain = buildMain,
				buildKey = buildKey,
			}
			g.VOIDZ_OPEN_HUB = openHub
		end
	end)
	print("[VOIDZ] UI core exported (openHub ready)")
	Late._phase = _Vzd({154,142,132,138,157,149,148,151,153,138,137})
end

	pcall(function()
		local g = getgenv and getgenv()
		if g then g._voidzInitUI = _voidzInitUI end
	end)

	print(_Vzd({128,123,116,110,105,127,130,69,132,155,148,142,137,159,110,147,142,153,122,110,69,152,153,134,151,153,142,147,140,75}))
	Late._phase = "ui_calling"
	local _uiOk, _uiErr = pcall(_voidzInitUI)
	if not _uiOk then
		warn(_Vzd({128,123,116,110,105,127,130,69,132,155,148,142,137,159,110,147,142,153,122,110,69,106,119,119,116,119,95}), _uiErr)
		error("[VOIDZ] _voidzInitUI failed: " .. tostring(_uiErr))
	end
	if not Late.openHub then
		local g = getgenv and getgenv()
		if g and type(g._voidzInitUI) == "function" then
			pcall(g._voidzInitUI)
		end
	end
	if not Late.openHub and not (getgenv and getgenv().VOIDZ_OPEN_HUB) then
		error(_Vzd({128,123,116,110,105,127,130,69,132,155,148,142,137,159,110,147,142,153,122,110,69,139,142,147,142,152,141,138,137,69,135,154,153,69,148,149,138,147,109,154,135,69,152,153,142,145,145,69,147,142,145}))
	end
	print(_Vzd({128,123,116,110,105,127,130,69,132,155,148,142,137,159,110,147,142,153,122,110,69,148,144,69,220,69,148,149,138,147,109,154,135,69,152,138,153}))
	Late._phase = "ui_ok"

	Late.installAntiKickOnLoad = installAntiKickOnLoad
	Late.installGrabWatch = installGrabWatch
	Late.installAntis = installAntis
	Late.unload = unload
	Late._initDone = true
	if getgenv and type(getgenv) == "function" then
		getgenv().VOIDZ_UNLOAD = unload
		getgenv().VOIDZ_LATE = Late
		if Late.openHub then getgenv().VOIDZ_OPEN_HUB = Late.openHub end
	end

	if type(Late.openHub) ~= "function" then
		warn(_Vzd({128,123,116,110,105,127,130,69,148,149,138,147,109,154,135,69,146,142,152,152,142,147,140,69,134,153,69,145,134,153,138,82,142,147,142,153,69,153,134,142,145,69,57,69,142,147,152,153,134,145,145,142,147,140,69,138,146,138,151,140,138,147,136,158,69,148,149,138,147,138,151}))
		Late.openHub = function(device)
			S.device = device or S.device or "PC"
			S.toggles.mobileUI = (S.device == "Mobile")
			local bm = rawget(_G, "buildMain") or (getgenv and getgenv().buildMain)
			if type(bm) ~= "function" and type(buildMain) == "function" then bm = buildMain end
			if type(bm) ~= "function" then
				error(_Vzd({135,154,142,145,137,114,134,142,147,69,147,148,153,69,134,155,134,142,145,134,135,145,138,69,57,69,122,110,69,142,147,142,153,69,147,138,155,138,151,69,136,148,146,149,145,138,153,138,137}))
			end
			bm()
			pcall(function()
				if installInstantEscape then installInstantEscape() end
			end)
		end
		pcall(function()
			if getgenv then getgenv().VOIDZ_OPEN_HUB = Late.openHub end
		end)
	end
	print(_Vzd({128,123,116,110,105,127,130,69,145,134,153,138,69,142,147,142,153,69,153,134,142,145,69,137,148,147,138,69,220,69,148,149,138,147,109,154,135,98}), type(Late.openHub))
end

local function emergencyKeyUI(errMsg)
	pcall(function()
		local parent = getUiParent()
		local old = parent:FindFirstChild("VOIDZ_KEY")
		if old then old:Destroy() end
		local sg = Instance.new("ScreenGui")
		sg.Name = "VOIDZ_KEY"
		sg.ResetOnSpawn = false
		sg.IgnoreGuiInset = true
		sg.DisplayOrder = 2147483647
		pcall(function() if protect_gui_fn then protect_gui_fn(sg) end end)
		sg.Parent = parent
		local f = Instance.new("Frame")
		f.AnchorPoint = Vector2.new(0.5, 0.5)
		f.Position = UDim2.fromScale(0.5, 0.5)
		f.Size = UDim2.fromOffset(360, 160)
		f.BackgroundColor3 = Color3.fromRGB(12, 8, 20)
		f.BorderSizePixel = 0
		f.Parent = sg
		local c = Instance.new(_Vzd({122,110,104,148,151,147,138,151}))
		c.CornerRadius = UDim.new(0, 12)
		c.Parent = f
		local t = Instance.new("TextLabel")
		t.BackgroundTransparency = 1
		t.Size = UDim2.new(1, -20, 0, 40)
		t.Position = UDim2.fromOffset(10, 12)
		t.Font = Enum.Font.GothamBold
		t.TextSize = 16
		t.TextColor3 = Color3.fromRGB(195, 120, 255)
		t.Text = "VOIDZ HUB · recovery"
		t.Parent = f
		local b = Instance.new("TextLabel")
		b.BackgroundTransparency = 1
		b.Size = UDim2.new(1, -20, 0, 80)
		b.Position = UDim2.fromOffset(10, 56)
		b.Font = Enum.Font.Gotham
		b.TextSize = 12
		b.TextColor3 = Color3.fromRGB(245, 240, 255)
		b.TextWrapped = true
		b.TextXAlignment = Enum.TextXAlignment.Left
		b.TextYAlignment = Enum.TextYAlignment.Top
		b.Text = "Main UI failed to open.\n" .. tostring(errMsg or "unknown"):sub(1, 160) .. "\nF9 for full error."
		b.Parent = f
		warn(_Vzd({128,123,116,110,105,127,130,69,138,146,138,151,140,138,147,136,158,69,122,110,95}), errMsg)
	end)
end

print(_Vzd({128,123,116,110,105,127,69,109,122,103,130,69,145,148,134,137,142,147,140}), BUILD)

local function showImmediateKeyUI()
	local parent = getUiParent()
	local old = parent:FindFirstChild("VOIDZ_KEY")
	if old then pcall(function() old:Destroy() end) end
	local sg = Instance.new("ScreenGui")
	sg.Name = "VOIDZ_KEY"
	sg.ResetOnSpawn = false
	sg.IgnoreGuiInset = true
	sg.DisplayOrder = 2147483647
	sg.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	pcall(function() if protect_gui_fn then protect_gui_fn(sg) end end)
	sg.Parent = parent

	local dim = Instance.new(_Vzd({107,151,134,146,138}))
	dim.Size = UDim2.fromScale(1, 1)
	dim.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	dim.BackgroundTransparency = 0.45
	dim.BorderSizePixel = 0
	dim.Parent = sg

	local card = Instance.new("Frame")
	card.AnchorPoint = Vector2.new(0.5, 0.5)
	card.Position = UDim2.fromScale(0.5, 0.5)
	card.Size = UDim2.fromOffset(380, 260)
	card.BackgroundColor3 = Color3.fromRGB(12, 8, 20)
	card.BorderSizePixel = 0
	card.Parent = sg
	local cc = Instance.new("UICorner")
	cc.CornerRadius = UDim.new(0, 16)
	cc.Parent = card
	local st = Instance.new("UIStroke")
	st.Color = Color3.fromRGB(155, 70, 255)
	st.Thickness = 1.8
	st.Parent = card

	local title = Instance.new(_Vzd({121,138,157,153,113,134,135,138,145}))
	title.BackgroundTransparency = 1
	title.Size = UDim2.new(1, -24, 0, 28)
	title.Position = UDim2.fromOffset(12, 16)
	title.Font = Enum.Font.GothamBlack
	title.TextSize = 20
	title.TextColor3 = Color3.fromRGB(245, 240, 255)
	title.TextXAlignment = Enum.TextXAlignment.Left
	title.Text = "VOIDZ HUB"
	title.Parent = card

	local sub = Instance.new("TextLabel")
	sub.BackgroundTransparency = 1
	sub.Size = UDim2.new(1, -24, 0, 20)
	sub.Position = UDim2.fromOffset(12, 48)
	sub.Font = Enum.Font.Gotham
	sub.TextSize = 12
	sub.TextColor3 = Color3.fromRGB(145, 125, 175)
	sub.TextXAlignment = Enum.TextXAlignment.Left
	sub.Text = _Vzd({106,147,153,138,151,69,144,138,158,69,220,69,123,116,110,105,127,109,122,103})
	sub.Parent = card

	local box = Instance.new("TextBox")
	box.Size = UDim2.new(1, -24, 0, 40)
	box.Position = UDim2.fromOffset(12, 90)
	box.BackgroundColor3 = Color3.fromRGB(18, 12, 30)
	box.BorderSizePixel = 0
	box.Font = Enum.Font.Gotham
	box.TextSize = 14
	box.TextColor3 = Color3.fromRGB(245, 240, 255)
	box.PlaceholderText = "Access key"
	box.Text = ""
	box.ClearTextOnFocus = false
	box.Parent = card
	local bc = Instance.new("UICorner")
	bc.CornerRadius = UDim.new(0, 10)
	bc.Parent = box

	local status = Instance.new("TextLabel")
	status.BackgroundTransparency = 1
	status.Size = UDim2.new(1, -24, 0, 18)
	status.Position = UDim2.fromOffset(12, 138)
	status.Font = Enum.Font.Gotham
	status.TextSize = 12
	status.TextColor3 = Color3.fromRGB(145, 125, 175)
	status.TextXAlignment = Enum.TextXAlignment.Left
	status.Text = _Vzd({113,148,134,137,142,147,140,69,152,158,152,153,138,146,152,75})
	status.Parent = card

	local unlock = Instance.new("TextButton")
	unlock.Size = UDim2.new(1, -24, 0, 42)
	unlock.Position = UDim2.fromOffset(12, 170)
	unlock.BackgroundColor3 = Color3.fromRGB(90, 40, 165)
	unlock.BorderSizePixel = 0
	unlock.Font = Enum.Font.GothamBold
	unlock.TextSize = 14
	unlock.TextColor3 = Color3.fromRGB(245, 240, 255)
	unlock.Text = "Unlock"
	unlock.AutoButtonColor = true
	unlock.Parent = card
	local uc = Instance.new("UICorner")
	uc.CornerRadius = UDim.new(0, 10)
	uc.Parent = unlock

	local function tryUnlock()
		local key = (box.Text or ""):gsub("^%s+", ""):gsub("%s+$", "")
		if key ~= ACCESS_KEY then
			status.TextColor3 = Color3.fromRGB(255, 140, 170)
			status.Text = _Vzd({110,147,155,134,145,142,137,69,144,138,158})
			return
		end
		status.TextColor3 = Color3.fromRGB(110, 255, 175)
		status.Text = "Access granted · loading hub…"
		task.spawn(function()
			local function env()
				local g = (getgenv and type(getgenv) == "function" and getgenv()) or nil
				return g or _G
			end

			local function pickFn(...)
				local e = env()
				for i = 1, select("#", ...) do
					local name = select(i, ...)
					local fn = nil
					if type(e) == "table" then fn = e[name] end
					if type(fn) ~= "function" and type(_G) == "table" then fn = _G[name] end
					if type(fn) ~= "function" then
						local ok, v = pcall(function() return rawget(e, name) end)
						if ok then fn = v end
					end
					if type(fn) == "function" then return fn end
				end
				return nil
			end

			local function getOpenFn()
				local e = env()
				if type(e.VOIDZ_OPEN_HUB) == _Vzd({139,154,147,136,153,142,148,147}) then return e.VOIDZ_OPEN_HUB end
				if type(e.VOIDZ_API) == "table" and type(e.VOIDZ_API.openHub) == _Vzd({139,154,147,136,153,142,148,147}) then
					return e.VOIDZ_API.openHub
				end
				if type(e.VOIDZ_API) == "table" and type(e.VOIDZ_API.buildMain) == "function" then
					local bm = e.VOIDZ_API.buildMain
					return function(device)
						S.device = device or S.device or "PC"
						S.toggles.mobileUI = (S.device == "Mobile")
						bm()
					end
				end
				if type(Late) == "table" and type(Late.openHub) == "function" then return Late.openHub end
				if type(Late) == "table" and type(Late.buildMain) == _Vzd({139,154,147,136,153,142,148,147}) then
					local bm = Late.buildMain
					return function(device)
						S.device = device or S.device or "PC"
						S.toggles.mobileUI = (S.device == "Mobile")
						bm()
					end
				end
				local bm = pickFn("buildMain")
				if bm then
					return function(device)
						S.device = device or S.device or "PC"
						S.toggles.mobileUI = (S.device == "Mobile")
						bm()
					end
				end
				return nil
			end

			local function ensureCore()
				status.Text = "Loading hub core…"
				local ok, err = pcall(_voidzLateInit)
				if not ok then
					return nil, _Vzd({145,134,153,138,69,142,147,142,153,95,69}) .. tostring(err):sub(1, 120)
				end

				local uiInit = pickFn("_voidzInitUI")
				if type(uiInit) == _Vzd({139,154,147,136,153,142,148,147}) then
					status.Text = "Building UI core…"
					local ok2, err2 = pcall(uiInit)
					if not ok2 then
						return nil, _Vzd({154,142,69,142,147,142,153,95,69}) .. tostring(err2):sub(1, 120)
					end
				end

				local openFn = getOpenFn()
				if openFn then
					Late._initDone = true
					return openFn, nil
				end

				local bm = pickFn("buildMain")
				if bm then
					Late._initDone = true
					return function(device)
						S.device = device or S.device or "PC"
						S.toggles.mobileUI = (S.device == "Mobile")
						bm()
					end, nil
				end

				return nil, _Vzd({147,148,69,148,149,138,147,109,154,135,84,135,154,142,145,137,114,134,142,147,69,77,154,142,110,147,142,153,98}) .. tostring(type(uiInit)) .. ")"
			end

			local openFn, err = ensureCore()
			if not openFn then
				status.TextColor3 = Color3.fromRGB(255, 140, 170)
				status.Text = "Core fail: " .. tostring(err or "?"):gsub("%s+", " "):sub(1, 70)
				warn(_Vzd({128,123,116,110,105,127,130,69,138,147,152,154,151,138,104,148,151,138,69,139,134,142,145,138,137,95}), err)
				return
			end

			status.TextColor3 = Color3.fromRGB(110, 255, 175)
			status.Text = _Vzd({102,136,136,138,152,152,69,140,151,134,147,153,138,137,69,220,69,152,149,145,134,152,141,75})
			pcall(function() sg:Destroy() end)
			local opened = false
			local function openMain()
				if opened then return end
				opened = true
				local ok2, err2 = pcall(function()
					openFn(S.device or "PC")
				end)
				if not ok2 then
					warn(_Vzd({128,123,116,110,105,127,130,69,148,149,138,147,109,154,135,69,139,134,142,145,138,137,95}), err2)
					pcall(emergencyKeyUI, err2)
				else
					print("[VOIDZ HUB] main hub open")
				end
			end
			local okSplash, splashErr = pcall(function()
				showVoidzSplash(S.device or "PC", openMain)
			end)
			if not okSplash then
				warn("[VOIDZ] splash failed:", splashErr)
				openMain()
			end
		end)
	end

	unlock.MouseButton1Click:Connect(function() task.spawn(tryUnlock) end)
	box.FocusLost:Connect(function(enter)
		if enter then task.spawn(tryUnlock) end
	end)

	S.gui = sg
	print("[VOIDZ HUB] key UI forced open")
	return sg
end

local uiOk, uiErr = pcall(showImmediateKeyUI)
if not uiOk then
	warn("[VOIDZ] immediate UI failed:", uiErr)
	pcall(emergencyKeyUI, uiErr)
end

task.spawn(function()
	if Late._initDone then return end
	Late._initStarted = true
	local ok, err = pcall(_voidzLateInit)
	if not ok then
		warn("[VOIDZ] late init failed:", err)
		Late._initStarted = false
		Late._initErr = tostring(err)
		return
	end
	local g = getgenv and getgenv()
	local ready = (Late.openHub ~= nil) or (g and g.VOIDZ_OPEN_HUB ~= nil)
	if not ready then
		warn("[VOIDZ] late init returned but openHub missing")
		Late._initErr = "openHub missing"
		Late._initStarted = false
		return
	end
	Late._initDone = true
	print("[VOIDZ HUB] late init ok · openHub ready")
	pcall(resolveFTAP)
	pcall(function() if Late.installAntiKickOnLoad then Late.installAntiKickOnLoad() end end)
	pcall(function() if Late.installGrabWatch then Late.installGrabWatch() end end)
	pcall(function() if Late.installAntis then Late.installAntis() end end)
end)

-- VOIDZ HUB · v1.2.18 · 2026-07-28
-- hi im voidz
