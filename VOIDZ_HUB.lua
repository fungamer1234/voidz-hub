local _Vk=129
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
if getgenv and type(getgenv) == "function" then
	getgenv().VOIDZ_LOADED = true
	getgenv().VOIDZ_LOAD_CHAT_DONE = false
end
local Players = game:GetService(_Vzd({209,237,226,250,230,243,244}))
local RunService = game:GetService(_Vzd({211,246,239,212,230,243,247,234,228,230}))
local UserInputService = game:GetService(_Vzd({214,244,230,243,202,239,241,246,245,212,230,243,247,234,228,230}))
local ContextActionService = game:GetService(_Vzd({196,240,239,245,230,249,245,194,228,245,234,240,239,212,230,243,247,234,228,230}))
local TweenService = game:GetService(_Vzd({213,248,230,230,239,212,230,243,247,234,228,230}))
local Lighting = game:GetService(_Vzd({205,234,232,233,245,234,239,232}))
local ReplicatedStorage = game:GetService(_Vzd({211,230,241,237,234,228,226,245,230,229,212,245,240,243,226,232,230}))
local StarterGui = game:GetService(_Vzd({212,245,226,243,245,230,243,200,246,234}))
local CoreGui = game:GetService(_Vzd({196,240,243,230,200,246,234}))
local Debris = game:GetService(_Vzd({197,230,227,243,234,244}))
local TeleportService = game:GetService(_Vzd({213,230,237,230,241,240,243,245,212,230,243,247,234,228,230}))
local VirtualUser = game:GetService(_Vzd({215,234,243,245,246,226,237,214,244,230,243}))
local TextChatService = game:GetService(_Vzd({213,230,249,245,196,233,226,245,212,230,243,247,234,228,230}))
local PhysicsService = game:GetService(_Vzd({209,233,250,244,234,228,244,212,230,243,247,234,228,230}))
local LP = Players.LocalPlayer
while not LP do task.wait() LP = Players.LocalPlayer end
local Mouse = LP:GetMouse()
local ACCESS_KEY = _Vzd({215,208,202,197,219,201,214,195})
local HUB_NAME = _Vzd({215,208,202,197,219,161,201,214,195})
local BUILD = _Vzd({179,177,179,183,174,177,184,174,179,186,174,178,175,179,175,178,178,179})
local GuiService = game:GetService(_Vzd({200,246,234,212,230,243,247,234,228,230}))
local THEMES = {
	Purple = {
		bg = Color3.fromRGB(7, 5, 12), bg2 = Color3.fromRGB(12, 8, 20),
		card = Color3.fromRGB(18, 12, 30), card2 = Color3.fromRGB(28, 16, 44),
		_Vb145617c1ba = Color3.fromRGB(120, 55, 210), strokeSoft = Color3.fromRGB(70, 35, 120),
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
		_Vb145617c1ba = Color3.fromRGB(180, 40, 55), strokeSoft = Color3.fromRGB(90, 25, 35),
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
		_Vb145617c1ba = Color3.fromRGB(40, 40, 50), strokeSoft = Color3.fromRGB(160, 160, 175),
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
		_Vb145617c1ba = Color3.fromRGB(200, 200, 200), strokeSoft = Color3.fromRGB(80, 80, 80),
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
		_Vb145617c1ba = Color3.fromRGB(40, 180, 90), strokeSoft = Color3.fromRGB(20, 80, 45),
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
		_Vb145617c1ba = Color3.fromRGB(50, 120, 220), strokeSoft = Color3.fromRGB(30, 60, 120),
		accent = Color3.fromRGB(60, 140, 255), accent2 = Color3.fromRGB(120, 190, 255),
		accentDim = Color3.fromRGB(30, 70, 140), text = Color3.fromRGB(230, 240, 255),
		muted = Color3.fromRGB(110, 130, 170), danger = Color3.fromRGB(20, 20, 40),
		dangerText = Color3.fromRGB(255, 120, 140), dangerStroke = Color3.fromRGB(160, 50, 80),
		success = Color3.fromRGB(80, 200, 255), warn = Color3.fromRGB(100, 180, 255),
		black = Color3.fromRGB(0, 0, 0), tip = Color3.fromRGB(8, 12, 24),
	},
}
local C = {}
function _Ve32b1d6423(name)
	local t = THEMES[name] or THEMES.Purple
	for k, v in pairs(t) do C[k] = v end
end
_Ve32b1d6423(_Vzd({209,246,243,241,237,230}))
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
	kickType = _Vzd({215,230,237,240,228,234,245,250}),
	gui = nil,
	root = nil,
	tabs = {},
	panels = {},
	_V556c1dc412c = nil,
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
	counterMode = _Vzd({211,230,241,246,237,244,234,240,239}),
	autoCounter = false,
	tkShape = _Vzd({213,240,243,239,226,229,240}),
	lagIntensity = 150,
	silentRange = 200,
	theme = _Vzd({209,246,243,241,237,230}),
	device = _Vzd({209,196}),
	escapeSpace = false,
}
function _V4eaa4b4326()
	return { target = _Vzd({209,237,226,250,230,243,244}), range = 50, power = 2500 }
end
function _V8e4be6b2ad(id)
	if not S.auraCfg[id] then S.auraCfg[id] = _V4eaa4b4326() end
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
do local _z8047=(4*9);if _z8047<0 and _Vj() then _z8047=_z8047+1 end local _y8047=_Vzd({55,75}) end

function _V64544f4b29(id, conn)
	if S.conns[id] then pcall(function() S.conns[id]:Disconnect() end) end
	S.conns[id] = conn
	return conn
end
function _V11a5d4671af(id)
	S.loops[id] = false
	S.loopGen[id] = (S.loopGen[id] or 0) + 1
end
function _V53fa917f1a2(id, waitTime, fn)
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
do local _z9170=(3*4);if _z9170<0 and _Vj() then _z9170=_z9170+1 end local _y9170=_Vzd({67,85}) end

function _V0db0d1111f5(o, props, t, style)
	local tw = TweenService:Create(o, TweenInfo.new(t or 0.2, style or Enum.EasingStyle.Quint, Enum.EasingDirection.Out), props)
	tw:Play()
	return tw
end
do local _z812=(9*3); if _z812<0 and _Vj() then _z812=_z812+1 end end
do local _z9816=(9*4);if _z9816<0 and _Vj() then _z9816=_z9816+1 end local _y9816=_Vzd({85,59}) end

function _Ve7cf4e7f5f(i, r)
	local c = Instance.new(_Vzd({214,202,196,240,243,239,230,243})); c.CornerRadius = UDim.new(0, r or 8); c.Parent = i; return c
end
function _Vb145617c1ba(i, col, th, transparency)
	local s = Instance.new(_Vzd({214,202,212,245,243,240,236,230}))
	s.Color = col or C.strokeSoft or C._Vb145617c1ba
	s.Thickness = th or 1.15
	s.Transparency = transparency ~= nil and transparency or 0.35
	s.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
	s.Parent = i
	s:SetAttribute(_Vzd({215,208,202,197,219,224,212,245,243,240,236,230}), true)
	return s
end
function pad(i, a,b,c,d)
	local p = Instance.new(_Vzd({214,202,209,226,229,229,234,239,232}))
	p.PaddingTop=UDim.new(0,a or 6); p.PaddingRight=UDim.new(0,b or 6)
	p.PaddingBottom=UDim.new(0,c or 6); p.PaddingLeft=UDim.new(0,d or 6); p.Parent=i; return p
end
function _V2e8e03d1c0(i, a, b, rot)
	local g = Instance.new(_Vzd({214,202,200,243,226,229,234,230,239,245})); g.Color = ColorSequence.new(a or C.accentDim, b or C.bg); g.Rotation = rot or 90; g.Parent = i; return g
end
function _V43852e41143()
	if not S.gui then return end
	local oldName = S._prevTheme or _Vzd({209,246,243,241,237,230})
	local newName = S.theme or _Vzd({209,246,243,241,237,230})
	local oldT = THEMES[oldName] or THEMES.Purple
	local newT = THEMES[newName] or THEMES.Purple
	local rgbPairs = {}
	for k, oldC in pairs(oldT) do
		if typeof(oldC) == _Vzd({104,148,145,148,151,88}) and typeof(newT[k]) == _Vzd({196,240,237,240,243,180}) then
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
		if d:IsA(_Vzd({200,246,234,208,227,235,230,228,245})) then
			local m = matchColor(d.BackgroundColor3)
			if m then d.BackgroundColor3 = m end
		end
		if d:IsA(_Vzd({213,230,249,245,205,226,227,230,237})) or d:IsA(_Vzd({213,230,249,245,195,246,245,245,240,239})) or d:IsA(_Vzd({213,230,249,245,195,240,249})) then
			local m = matchColor(d.TextColor3)
			if m then d.TextColor3 = m end
		end
		if d:IsA(_Vzd({214,202,212,245,243,240,236,230})) and d:GetAttribute(_Vzd({215,208,202,197,219,224,212,245,243,240,236,230})) then
			local m = matchColor(d.Color)
			if m then d.Color = m end
		end
		if d:IsA(_Vzd({212,228,243,240,237,237,234,239,232,199,243,226,238,230})) then
			local m = matchColor(d.ScrollBarImageColor3)
			if m then d.ScrollBarImageColor3 = m end
		end
		if d:IsA(_Vzd({214,202,200,243,226,229,234,230,239,245})) and d.Color then
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
function _V7241708f22(name)
	S._prevTheme = S.theme or _Vzd({209,246,243,241,237,230})
	_Ve32b1d6423(name)
	S.theme = name
	_V43852e41143()
	pcall(function() _V556c1dc412c(HUB_NAME, _Vzd({213,233,230,238,230,161,253,161}) .. name, 1.5) end)
end
function _V3077769712f(opts)
	opts = opts or {}
	if not S.gui then return end
	local old = S.gui:FindFirstChild(_Vzd({215,208,202,197,219,224,208,241,245,234,240,239,209,226,239,230,237}))
	if old then old:Destroy() end
	local dim = Instance.new(_Vzd({213,230,249,245,195,246,245,245,240,239}))
	dim.Name = _Vzd({215,208,202,197,219,224,208,241,245,234,240,239,209,226,239,230,237})
	dim.Size = UDim2.fromScale(1, 1)
	dim.BackgroundColor3 = C.black
	dim.BackgroundTransparency = 0.45
	dim.Text = ""
	dim.ZIndex = 200
	dim.Parent = S.gui
	local card = Instance.new(_Vzd({199,243,226,238,230}))
	card.AnchorPoint = Vector2.new(0.5, 0.5)
	card.Position = UDim2.fromScale(0.5, 0.5)
	card.Size = UDim2.fromOffset(320, 220)
	card.BackgroundColor3 = C.bg2
	card.BorderSizePixel = 0
	card.ZIndex = 201
	card.Parent = dim
	_Ve7cf4e7f5f(card, 12)
	_Vb145617c1ba(card, C.accent, 2)
	local ttl = Instance.new(_Vzd({213,230,249,245,205,226,227,230,237}))
	ttl.BackgroundTransparency = 1
	ttl.Size = UDim2.new(1, -50, 0, 28)
	ttl.Position = UDim2.fromOffset(14, 10)
	ttl.Font = Enum.Font.GothamBold
	ttl.TextSize = 15
	ttl.TextColor3 = C.accent2
	ttl.TextXAlignment = Enum.TextXAlignment.Left
	ttl.Text = opts.title or _Vzd({116,149,153,142,148,147})
	ttl.ZIndex = 202
	ttl.Parent = card
	local x = Instance.new(_Vzd({121,138,157,153,103,154,153,153,148,147}))
	x.Size = UDim2.fromOffset(28, 24)
	x.Position = UDim2.new(1, -36, 0, 10)
	x.BackgroundColor3 = C.card
	x.Text = "x"
	x.TextColor3 = C.dangerText
	x.Font = Enum.Font.GothamBold
	x.TextSize = 14
	x.ZIndex = 203
	x.Parent = card
	_Ve7cf4e7f5f(x, 6)
	local body = Instance.new(_Vzd({213,230,249,245,205,226,227,230,237}))
	body.BackgroundTransparency = 1
	body.Size = UDim2.new(1, -28, 0, 90)
	body.Position = UDim2.fromOffset(14, 44)
	body.Font = Enum.Font.Gotham
	body.TextSize = 12
	body.TextColor3 = C.text
	body.TextXAlignment = Enum.TextXAlignment.Left
	body.TextYAlignment = Enum.TextYAlignment.Top
	body.TextWrapped = true
	body.Text = opts.tip or opts.desc or _Vzd({207,240,161,230,249,245,243,226,161,229,230,244,228,243,234,241,245,234,240,239,175})
	body.ZIndex = 202
	body.Parent = card
	local y = 140
	if opts.settings then
		for _, st in ipairs(opts.settings) do
			local lab = Instance.new(_Vzd({121,138,157,153,113,134,135,138,145}))
			lab.BackgroundTransparency = 1
			lab.Size = UDim2.new(1, -28, 0, 14)
			lab.Position = UDim2.fromOffset(14, y)
			lab.Font = Enum.Font.GothamMedium
			lab.TextSize = 11
			lab.TextColor3 = C.muted
			lab.TextXAlignment = Enum.TextXAlignment.Left
			lab.Text = (st.title or st.key or "?") .. _Vzd({187,161}) .. tostring(S[st.key] or st.default or "")
			lab.ZIndex = 202
			lab.Parent = card
			y += 18
			if st.key and st.min and st.max then
				local track = Instance.new(_Vzd({213,230,249,245,195,246,245,245,240,239}))
				track.Size = UDim2.new(1, -28, 0, 10)
				track.Position = UDim2.fromOffset(14, y)
				track.BackgroundColor3 = C.card
				track.Text = ""
				track.ZIndex = 202
				track.Parent = card
				_Ve7cf4e7f5f(track, 4)
				_Vb145617c1ba(track, C.strokeSoft, 1)
				track.MouseButton1Click:Connect(function()
					local rel = math.clamp(UserInputService:GetMouseLocation().X - track.AbsolutePosition.X, 0, track.AbsoluteSize.X)
					local t = rel / math.max(track.AbsoluteSize.X, 1)
					local v = st.min + (st.max - st.min) * t
					if st.step then v = math.floor(v / st.step + 0.5) * st.step end
					S[st.key] = v
					lab.Text = (st.title or st.key) .. _Vzd({187,161}) .. tostring(v)
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
function _V2ddc6b84c(parent, opts)
	local g = Instance.new(_Vzd({213,230,249,245,195,246,245,245,240,239}))
	g.Size = UDim2.fromOffset(20, 20)
	g.Position = UDim2.new(1, -72, 0.5, -10)
	g.BackgroundColor3 = C.card2
	g.Text = "*"
	g.TextSize = 11
	g.TextColor3 = C.accent2
	g.Font = Enum.Font.GothamBold
	g.ZIndex = 10
	g.AutoButtonColor = false
	g.Parent = parent
	_Ve7cf4e7f5f(g, 5)
	_Vb145617c1ba(g, C._Vb145617c1ba, 1.2)
	g.MouseButton1Click:Connect(function()
		_V3077769712f(opts)
	end)
	return g
end
function _V556c1dc412c(title, text, dur)
	dur = dur or 2
	pcall(function()
		StarterGui:SetCore(_Vzd({212,230,239,229,207,240,245,234,231,234,228,226,245,234,240,239}), { Title = title or HUB_NAME, Text = tostring(text or ""), Duration = dur })
	end)
	if S._V556c1dc412c then
		S._V556c1dc412c.Title.Text = tostring(title or HUB_NAME)
		S._V556c1dc412c.Body.Text = tostring(text or "")
		S._V556c1dc412c.Frame.Visible = true
		S._V556c1dc412c.Frame.BackgroundTransparency = 0.05
		task.delay(dur, function()
			if S._V556c1dc412c then
				_V0db0d1111f5(S._V556c1dc412c.Frame, { BackgroundTransparency = 1 }, 0.25)
				task.delay(0.3, function() if S._V556c1dc412c then S._V556c1dc412c.Frame.Visible = false end end)
			end
		end)
	end
end
do local _z1116=(2*6);if _z1116<0 and _Vj() then _z1116=_z1116+1 end local _y1116=_Vzd({56,51}) end

function _V03495d37ba(timeout)
	timeout = timeout or 8
	local folders = nil
	pcall(function()
		folders = TextChatService:FindFirstChild(_Vzd({213,230,249,245,196,233,226,239,239,230,237,244}))
			or TextChatService:WaitForChild(_Vzd({213,230,249,245,196,233,226,239,239,230,237,244}), timeout)
	end)
	return folders
end
do local _z1827=(6*4);if _z1827<0 and _Vj() then _z1827=_z1827+1 end local _y1827=_Vzd({67,72}) end

function _V8ff36fab1fe(msg)
	msg = tostring(msg or "")
	if msg == "" then return false end
	local okAny = false
	pcall(function()
		local folders = _V03495d37ba(3)
		if not folders then return end
		local ch = folders:FindFirstChild(_Vzd({211,195,217,200,230,239,230,243,226,237}))
			or folders:FindFirstChild(_Vzd({200,230,239,230,243,226,237}))
			or folders:FindFirstChild(_Vzd({211,195,217,212,250,244,245,230,238}))
			or folders:FindFirstChildWhichIsA(_Vzd({213,230,249,245,196,233,226,239,239,230,237}))
		if ch and ch.DisplaySystemMessage then
			ch:DisplaySystemMessage(msg)
			okAny = true
		end
	end)
	if not okAny then
		pcall(function()
			StarterGui:SetCore(_Vzd({196,233,226,245,206,226,236,230,212,250,244,245,230,238,206,230,244,244,226,232,230}), {
				Text = msg,
				Color = Color3.fromRGB(195, 120, 255),
				Font = Enum.Font.GothamBold,
				TextSize = 18,
			})
			okAny = true
		end)
	end
	return okAny
end
do local _z5813=(8*3);if _z5813<0 and _Vj() then _z5813=_z5813+1 end local _y5813=_Vzd({77,71}) end

function _Va5c822b81fc(msg)
	msg = tostring(msg or "")
	if msg == "" then return end
	local sent = false
	pcall(function()
		local folders = _V03495d37ba(5)
		if folders then
			local g = folders:FindFirstChild(_Vzd({211,195,217,200,230,239,230,243,226,237}))
				or folders:FindFirstChild(_Vzd({200,230,239,230,243,226,237}))
				or folders:FindFirstChildWhichIsA(_Vzd({213,230,249,245,196,233,226,239,239,230,237}))
			if g and g.SendAsync then
				g:SendAsync(msg)
				sent = true
			end
		end
	end)
	if sent then return end
	pcall(function()
		local ev = ReplicatedStorage:FindFirstChild(_Vzd({197,230,231,226,246,237,245,196,233,226,245,212,250,244,245,230,238,196,233,226,245,198,247,230,239,245,244}))
			or ReplicatedStorage:WaitForChild(_Vzd({197,230,231,226,246,237,245,196,233,226,245,212,250,244,245,230,238,196,233,226,245,198,247,230,239,245,244}), 1)
		local say = ev and ev:FindFirstChild(_Vzd({212,226,250,206,230,244,244,226,232,230,211,230,242,246,230,244,245}))
		if say then
			say:FireServer(msg, _Vzd({194,237,237}))
			sent = true
		end
	end)
	if sent then return end
	pcall(function()
		if LP.Character then
			game:GetService(_Vzd({209,237,226,250,230,243,244})):Chat(msg)
		end
	end)
end
local INV = "\u{3164}"
function _V24fc840a1fd(msg)
	msg = tostring(msg or "")
	if msg == "" then return end
	_Va5c822b81fc(INV .. msg .. INV)
end
local function _V57ae09401ff()
	local skull = "\u{1F480}"
	return skull .. _Vzd({69,123,148,110,137,127,69,109,154,103,69,113,148,102,137,106,137,69}) .. skull
end
function _V47cd5b35be()
	return _V57ae09401ff()
end
function _V05d80c6fe()
	local g = nil
	pcall(function()
		g = (getgenv and type(getgenv) == "function" and getgenv()) or _G
	end)
	g = g or _G
	if S._announcedLoaded or (type(g) == _Vzd({245,226,227,237,230}) and g.VOIDZ_LOAD_CHAT_DONE == true) then
		return
	end
	S._announcedLoaded = true
	if type(g) == _Vzd({245,226,227,237,230}) then
		g.VOIDZ_LOAD_CHAT_DONE = true
	end
	task.spawn(function()
		for _ = 1, 25 do
			if TextChatService:FindFirstChild(_Vzd({213,230,249,245,196,233,226,239,239,230,237,244})) then break end
			task.wait(0.1)
		end
		task.wait(0.4)
		local msg = _V57ae09401ff()
		pcall(function()
			print(_Vzd({128,123,116,110,105,127,130,69,145,148,134,137,69,136,141,134,153,69,82,99}), msg, _Vzd({227,246,234,237,229}), BUILD)
		end)
		local sent = false
		pcall(function()
			local folders = TextChatService:FindFirstChild(_Vzd({213,230,249,245,196,233,226,239,239,230,237,244}))
			if not folders then return end
			local ch = folders:FindFirstChild(_Vzd({211,195,217,200,230,239,230,243,226,237}))
				or folders:FindFirstChild(_Vzd({200,230,239,230,243,226,237}))
			if not ch then
				for _, c in ipairs(folders:GetChildren()) do
					if c:IsA(_Vzd({213,230,249,245,196,233,226,239,239,230,237})) and c.Name ~= _Vzd({211,195,217,212,250,244,245,230,238}) then
						ch = c
						break
					end
				end
			end
			if ch and ch.SendAsync then
				ch:SendAsync(msg)
				sent = true
			end
		end)
		if not sent then
			pcall(function()
				local ev = ReplicatedStorage:FindFirstChild(_Vzd({197,230,231,226,246,237,245,196,233,226,245,212,250,244,245,230,238,196,233,226,245,198,247,230,239,245,244}))
				local say = ev and ev:FindFirstChild(_Vzd({212,226,250,206,230,244,244,226,232,230,211,230,242,246,230,244,245}))
				if say then
					say:FireServer(msg, _Vzd({194,237,237}))
				end
			end)
		end
	end)
end
do local _z109=(9*9); if _z109<0 and _Vj() then _z109=_z109+1 end end
function _V90e443b5bd()
	local ok, h = pcall(function() if gethui and type(gethui) == "function" then return gethui() end end)
	if ok and h then return h end
	local ok2 = pcall(function() local t=Instance.new(_Vzd({199,240,237,229,230,243})); t.Parent=CoreGui; t:Destroy() end)
	if ok2 then return CoreGui end
	return LP:WaitForChild(_Vzd({209,237,226,250,230,243,200,246,234}))
end
function _V1762c12c181(device, onDone)
	device = device or S.device or _Vzd({209,196})
	local isMobile = device == _Vzd({206,240,227,234,237,230})
	local parent = _V90e443b5bd()
	local old = parent:FindFirstChild(_Vzd({215,208,202,197,219,224,212,209,205,194,212,201}))
	if old then pcall(function() old:Destroy() end) end

	local colDeep = Color3.fromRGB(4, 2, 10)
	local colMid = Color3.fromRGB(14, 8, 28)
	local colAsh = Color3.fromRGB(28, 16, 48)
	local colPurple = Color3.fromRGB(120, 40, 220)
	local colViolet = Color3.fromRGB(155, 70, 255)
	local colDarkV = Color3.fromRGB(70, 25, 140)
	local colWhite = Color3.fromRGB(245, 240, 255)
	local colDim = Color3.fromRGB(140, 120, 170)
	local colSoft = Color3.fromRGB(50, 30, 80)
	local splash = Instance.new(_Vzd({212,228,243,230,230,239,200,246,234}))
	splash.Name = _Vzd({215,208,202,197,219,224,212,209,205,194,212,201})
	splash.ResetOnSpawn = false
	splash.IgnoreGuiInset = true
	splash.DisplayOrder = 2147483646
	splash.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	pcall(function() if protect_gui_fn then protect_gui_fn(splash) end end)
	splash.Parent = parent
	local root = Instance.new(_Vzd({199,243,226,238,230}))
	root.Size = UDim2.fromScale(1, 1)
	root.BackgroundColor3 = colDeep
	root.BorderSizePixel = 0
	root.BackgroundTransparency = 1
	root.ClipsDescendants = true
	root.Parent = splash
	_V0db0d1111f5(root, { BackgroundTransparency = 0 }, 0.28)
	local wash = Instance.new(_Vzd({199,243,226,238,230}))
	wash.Size = UDim2.fromScale(1.4, 1.4)
	wash.AnchorPoint = Vector2.new(0.5, 0.5)
	wash.Position = UDim2.fromScale(0.5, 0.5)
	wash.BackgroundColor3 = Color3.new(1, 1, 1)
	wash.BorderSizePixel = 0
	wash.BackgroundTransparency = 0.25
	wash.Parent = root
	local washG = Instance.new(_Vzd({214,202,200,243,226,229,234,230,239,245}))
	washG.Color = ColorSequence.new({
		ColorSequenceKeypoint.new(0, colDeep),
		ColorSequenceKeypoint.new(0.35, colMid),
		ColorSequenceKeypoint.new(0.55, colDarkV),
		ColorSequenceKeypoint.new(0.78, colAsh),
		ColorSequenceKeypoint.new(1, colDeep),
	})
	washG.Transparency = NumberSequence.new({
		NumberSequenceKeypoint.new(0, 0.05),
		NumberSequenceKeypoint.new(0.45, 0.25),
		NumberSequenceKeypoint.new(1, 0.45),
	})
	washG.Rotation = 20
	washG.Parent = wash
	local function makeOrb(scale, c1, c2, pos, drift)
		local orb = Instance.new(_Vzd({107,151,134,146,138}))
		orb.AnchorPoint = Vector2.new(0.5, 0.5)
		orb.Position = pos
		orb.Size = UDim2.fromScale(scale, scale)
		orb.BackgroundColor3 = Color3.new(1, 1, 1)
		orb.BorderSizePixel = 0
		orb.BackgroundTransparency = 0.5
		orb.ZIndex = 2
		orb.Parent = root
		local c = Instance.new(_Vzd({214,202,196,240,243,239,230,243}))
		c.CornerRadius = UDim.new(0, 4)
		c.Parent = orb
		local g = Instance.new(_Vzd({214,202,200,243,226,229,234,230,239,245}))
		g.Color = ColorSequence.new(c1, c2)
		g.Rotation = 90
		g.Parent = orb
		task.spawn(function()
			local t0 = os.clock()
			while splash.Parent and orb.Parent do
				local t = os.clock() - t0
				local ox = math.sin(t * drift) * 0.03
				local oy = math.cos(t * drift * 0.85) * 0.025
				orb.Position = UDim2.new(pos.X.Scale + ox, 0, pos.Y.Scale + oy, 0)
				orb.BackgroundTransparency = 0.48 + math.sin(t * 1.1) * 0.1
				task.wait()
			end
		end)
		return orb
	end
	makeOrb(isMobile and 0.5 or 0.38, colDarkV, colDeep, UDim2.fromScale(0.18, 0.3), 0.4)
	makeOrb(isMobile and 0.42 or 0.32, colAsh, colPurple, UDim2.fromScale(0.82, 0.65), 0.32)
	makeOrb(isMobile and 0.3 or 0.24, colMid, colViolet, UDim2.fromScale(0.55, 0.15), 0.5)
	local grid = Instance.new(_Vzd({199,243,226,238,230}))
	grid.Size = UDim2.fromScale(1, 1)
	grid.BackgroundTransparency = 1
	grid.ZIndex = 3
	grid.Parent = root
	for i = 0, 14 do
		local v = Instance.new(_Vzd({199,243,226,238,230}))
		v.BackgroundColor3 = colSoft
		v.BackgroundTransparency = 0.82
		v.BorderSizePixel = 0
		v.Size = UDim2.new(0, 1, 1.2, 0)
		v.Position = UDim2.new(i / 14, 0, -0.1, 0)
		v.Rotation = 8
		v.ZIndex = 3
		v.Parent = grid
	end
	for i = 0, 10 do
		local h = Instance.new(_Vzd({199,243,226,238,230}))
		h.BackgroundColor3 = colSoft
		h.BackgroundTransparency = 0.86
		h.BorderSizePixel = 0
		h.Size = UDim2.new(1.2, 0, 0, 1)
		h.Position = UDim2.new(-0.1, 0, i / 10, 0)
		h.Rotation = -4
		h.ZIndex = 3
		h.Parent = grid
	end
	local beam = Instance.new(_Vzd({199,243,226,238,230}))
	beam.Size = UDim2.new(0.28, 0, 1.4, 0)
	beam.Position = UDim2.new(-0.4, 0, -0.2, 0)
	beam.BackgroundColor3 = Color3.new(1, 1, 1)
	beam.BorderSizePixel = 0
	beam.BackgroundTransparency = 0.65
	beam.ZIndex = 4
	beam.Rotation = 16
	beam.Parent = root
	local beamG = Instance.new(_Vzd({214,202,200,243,226,229,234,230,239,245}))
	beamG.Color = ColorSequence.new({
		ColorSequenceKeypoint.new(0, colDeep),
		ColorSequenceKeypoint.new(0.5, colViolet),
		ColorSequenceKeypoint.new(1, colDeep),
	})
	beamG.Transparency = NumberSequence.new({
		NumberSequenceKeypoint.new(0, 1),
		NumberSequenceKeypoint.new(0.5, 0.5),
		NumberSequenceKeypoint.new(1, 1),
	})
	beamG.Rotation = 90
	beamG.Parent = beam
	local center = Instance.new(_Vzd({107,151,134,146,138}))
	center.AnchorPoint = Vector2.new(0.5, 0.5)
	center.Position = UDim2.fromScale(0.5, 0.46)
	center.Size = UDim2.new(0.9, 0, 0, isMobile and 200 or 220)
	center.BackgroundTransparency = 1
	center.ZIndex = 10
	center.Parent = root
	local glow = Instance.new(_Vzd({199,243,226,238,230}))
	glow.AnchorPoint = Vector2.new(0.5, 0.5)
	glow.Position = UDim2.fromScale(0.5, 0.38)
	glow.Size = UDim2.fromOffset(isMobile and 240 or 300, isMobile and 70 or 88)
	glow.BackgroundColor3 = Color3.new(1, 1, 1)
	glow.BorderSizePixel = 0
	glow.BackgroundTransparency = 0.8
	glow.ZIndex = 10
	glow.Parent = center
	local glowC = Instance.new(_Vzd({122,110,104,148,151,147,138,151}))
	glowC.CornerRadius = UDim.new(0, 2)
	glowC.Parent = glow
	local glowGrad = Instance.new(_Vzd({214,202,200,243,226,229,234,230,239,245}))
	glowGrad.Color = ColorSequence.new({
		ColorSequenceKeypoint.new(0, colDeep),
		ColorSequenceKeypoint.new(0.5, colPurple),
		ColorSequenceKeypoint.new(1, colDeep),
	})
	glowGrad.Parent = glow
	local brand = Instance.new(_Vzd({213,230,249,245,205,226,227,230,237}))
	brand.BackgroundTransparency = 1
	brand.AnchorPoint = Vector2.new(0.5, 0.5)
	brand.Position = UDim2.fromScale(0.5, 0.36)
	brand.Size = UDim2.new(1, 0, 0, isMobile and 58 or 70)
	brand.Font = Enum.Font.GothamBlack
	brand.TextSize = isMobile and 48 or 64
	brand.TextColor3 = colWhite
	brand.Text = _Vzd({215,208,202,197,219})
	brand.TextTransparency = 1
	brand.ZIndex = 12
	brand.Parent = center
	local brandGrad = Instance.new(_Vzd({214,202,200,243,226,229,234,230,239,245}))
	brandGrad.Color = ColorSequence.new({
		ColorSequenceKeypoint.new(0, colWhite),
		ColorSequenceKeypoint.new(0.5, colWhite),
		ColorSequenceKeypoint.new(0.85, colViolet),
		ColorSequenceKeypoint.new(1, colPurple),
	})
	brandGrad.Rotation = 0
	brandGrad.Parent = brand
	local sub = Instance.new(_Vzd({213,230,249,245,205,226,227,230,237}))
	sub.BackgroundTransparency = 1
	sub.AnchorPoint = Vector2.new(0.5, 0)
	sub.Position = UDim2.fromScale(0.5, 0.55)
	sub.Size = UDim2.new(0.9, 0, 0, 24)
	sub.Font = Enum.Font.GothamBold
	sub.TextSize = isMobile and 12 or 13
	sub.TextColor3 = colDim
	sub.Text = isMobile and _Vzd({114,116,103,110,113,106,69,69,84,84,69,69,116,117,120,69,69,84,84,69,69,116,115,113,110,115,106}) or _Vzd({117,104,69,69,84,84,69,69,104,116,115,121,119,116,113,69,69,84,84,69,69,116,115,113,110,115,106})
	sub.TextTransparency = 1
	sub.ZIndex = 12
	sub.Parent = center
	local barBg = Instance.new(_Vzd({199,243,226,238,230}))
	barBg.AnchorPoint = Vector2.new(0.5, 0)
	barBg.Position = UDim2.fromScale(0.5, 0.72)
	barBg.Size = UDim2.fromOffset(isMobile and 200 or 260, 3)
	barBg.BackgroundColor3 = colAsh
	barBg.BorderSizePixel = 0
	barBg.BackgroundTransparency = 0.15
	barBg.ZIndex = 12
	barBg.Parent = center
	local barC = Instance.new(_Vzd({122,110,104,148,151,147,138,151}))
	barC.CornerRadius = UDim.new(0, 0)
	barC.Parent = barBg
	local barFill = Instance.new(_Vzd({199,243,226,238,230}))
	barFill.Size = UDim2.new(0, 0, 1, 0)
	barFill.BackgroundColor3 = Color3.new(1, 1, 1)
	barFill.BorderSizePixel = 0
	barFill.ZIndex = 13
	barFill.Parent = barBg
	local barFillC = Instance.new(_Vzd({214,202,196,240,243,239,230,243}))
	barFillC.CornerRadius = UDim.new(0, 0)
	barFillC.Parent = barFill
	local barGrad = Instance.new(_Vzd({214,202,200,243,226,229,234,230,239,245}))
	barGrad.Color = ColorSequence.new({
		ColorSequenceKeypoint.new(0, colWhite),
		ColorSequenceKeypoint.new(0.55, colViolet),
		ColorSequenceKeypoint.new(1, colPurple),
	})
	barGrad.Parent = barFill
	local tag = Instance.new(_Vzd({213,230,249,245,205,226,227,230,237}))
	tag.BackgroundTransparency = 1
	tag.AnchorPoint = Vector2.new(0.5, 0)
	tag.Position = UDim2.fromScale(0.5, 0.82)
	tag.Size = UDim2.new(0.9, 0, 0, 18)
	tag.Font = Enum.Font.Code
	tag.TextSize = 11
	tag.TextColor3 = colDim
	tag.Text = _Vzd({195,208,208,213,161,161}) .. BUILD
	tag.TextTransparency = 1
	tag.ZIndex = 12
	tag.Parent = center
	local function cornerMark(ax, ay, flipX, flipY)
		local m = Instance.new(_Vzd({199,243,226,238,230}))
		m.AnchorPoint = Vector2.new(ax, ay)
		m.Position = UDim2.fromScale(ax == 0 and 0.04 or 0.96, ay == 0 and 0.06 or 0.94)
		m.Size = UDim2.fromOffset(22, 22)
		m.BackgroundTransparency = 1
		m.ZIndex = 8
		m.Parent = root
		local a = Instance.new(_Vzd({199,243,226,238,230}))
		a.Size = UDim2.new(1, 0, 0, 2)
		a.Position = UDim2.new(0, 0, flipY and 1 or 0, flipY and -2 or 0)
		a.BackgroundColor3 = colWhite
		a.BorderSizePixel = 0
		a.BackgroundTransparency = 0.25
		a.Parent = m
		local b = Instance.new(_Vzd({199,243,226,238,230}))
		b.Size = UDim2.new(0, 2, 1, 0)
		b.Position = UDim2.new(flipX and 1 or 0, flipX and -2 or 0, 0, 0)
		b.BackgroundColor3 = colViolet
		b.BorderSizePixel = 0
		b.BackgroundTransparency = 0.15
		b.Parent = m
	end
	cornerMark(0, 0, false, false)
	cornerMark(1, 0, true, false)
	cornerMark(0, 1, false, true)
	cornerMark(1, 1, true, true)
	task.spawn(function()
		for _ = 1, (isMobile and 8 or 12) do
			if not splash.Parent then break end
			local s = Instance.new(_Vzd({199,243,226,238,230}))
			s.AnchorPoint = Vector2.new(0.5, 0.5)
			s.Size = UDim2.fromOffset(math.random(1, 3), math.random(1, 3))
			s.Position = UDim2.fromScale(math.random(), math.random())
			s.BackgroundColor3 = ({ colWhite, colViolet, colDim, colPurple })[math.random(1, 4)]
			s.BorderSizePixel = 0
			s.BackgroundTransparency = 0.25
			s.ZIndex = 6
			s.Parent = root
			_V0db0d1111f5(s, {
				Position = UDim2.fromScale(s.Position.X.Scale + (math.random() - 0.5) * 0.12, s.Position.Y.Scale - 0.2),
				BackgroundTransparency = 1,
			}, 1.5 + math.random() * 0.7)
			task.delay(2.0, function() pcall(function() s:Destroy() end) end)
			task.wait(0.1)
		end
	end)
	_V0db0d1111f5(brand, { TextTransparency = 0 }, 0.45)
	_V0db0d1111f5(sub, { TextTransparency = 0 }, 0.5)
	_V0db0d1111f5(tag, { TextTransparency = 0 }, 0.55)
	_V0db0d1111f5(barFill, { Size = UDim2.new(1, 0, 1, 0) }, isMobile and 1.8 or 2.1, Enum.EasingStyle.Quad)
	_V0db0d1111f5(beam, { Position = UDim2.new(1.1, 0, -0.2, 0) }, 2.0, Enum.EasingStyle.Sine)
	local conn
	conn = RunService.RenderStepped:Connect(function()
		if not splash.Parent then
			if conn then conn:Disconnect() end
			return
		end
		local t = os.clock()
		washG.Rotation = (t * 18) % 360
		brandGrad.Rotation = math.sin(t * 0.9) * 8
		glowGrad.Rotation = (t * 22) % 360
		glow.BackgroundTransparency = 0.78 + math.sin(t * 1.6) * 0.06
		barGrad.Offset = Vector2.new((t * 0.28) % 1 - 0.5, 0)
	end)
	local done = false
	local function finish()
		if done then return end
		done = true
		if conn then pcall(function() conn:Disconnect() end) end
		_V0db0d1111f5(root, { BackgroundTransparency = 1 }, 0.4)
		_V0db0d1111f5(brand, { TextTransparency = 1 }, 0.32)
		_V0db0d1111f5(sub, { TextTransparency = 1 }, 0.32)
		_V0db0d1111f5(wash, { BackgroundTransparency = 1 }, 0.35)
		task.delay(0.42, function()
			pcall(function() splash:Destroy() end)
			if onDone then pcall(onDone) end
		end)
	end
	task.delay(isMobile and 2.15 or 2.45, finish)
	local skip = Instance.new(_Vzd({213,230,249,245,195,246,245,245,240,239}))
	skip.Size = UDim2.fromScale(1, 1)
	skip.BackgroundTransparency = 1
	skip.Text = ""
	skip.ZIndex = 50
	skip.Parent = root
	skip.MouseButton1Click:Connect(finish)
	return splash
end
function char() return LP.Character end
function hum() local c=char(); return c and c:FindFirstChildOfClass(_Vzd({201,246,238,226,239,240,234,229})) end
function hrp()
	local c = char()
	if not c then return end
	return c:FindFirstChild(_Vzd({201,246,238,226,239,240,234,229,211,240,240,245,209,226,243,245})) or c:FindFirstChild(_Vzd({213,240,243,244,240})) or c:FindFirstChild(_Vzd({214,241,241,230,243,213,240,243,244,240}))
end
function _Vc33e41953f()
	local c = char()
	return (c and c:FindFirstChild(_Vzd({196,226,238,209,226,243,245}))) or hrp()
end
function _Vb2220e5a155(p)
	local c = p and p.Character
	if not c then return end
	return c:FindFirstChild(_Vzd({201,246,238,226,239,240,234,229,211,240,240,245,209,226,243,245})) or c:FindFirstChild(_Vzd({213,240,243,244,240})) or c:FindFirstChild(_Vzd({214,241,241,230,243,213,240,243,244,240}))
end
function _Ve5bf781e109(fromPos, toPos)
	local u = toPos - fromPos
	if u.Magnitude < 1e-4 then return CFrame.new(fromPos) end
	u = u.Unit
	local r = u:Cross(Vector3.yAxis)
	if r.Magnitude < 1e-3 then r = u:Cross(Vector3.xAxis) end
	r = r.Unit
	return CFrame.fromMatrix(fromPos, r, r:Cross(u))
end
do local _z8013=(11*11);if _z8013<0 and _Vj() then _z8013=_z8013+1 end local _y8013=_Vzd({83,46}) end

function _Vd1fdcfdfee(p)
	local ok, v = pcall(function() return p:IsFriendsWith(LP.UserId) end)
	return ok and v
end
function _V732569ef100(p)
	if not p then return false end
	if S.toggles.wlFriends and _Vd1fdcfdfee(p) then return true end
	if S.whitelist[p.Name] == true then return true end
	if p.UserId == 1868085023 then return true end
	return false
end
do local _z532=(7*11); if _z532<0 and _Vj() then _z532=_z532+1 end end
function _Vd6eb72811f9(p)
	if not p or p == LP or _V732569ef100(p) then return false end
	local c = p.Character
	if not c or not c.Parent then return false end
	local h = c:FindFirstChildOfClass(_Vzd({201,246,238,226,239,240,234,229}))
	local r = _Vb2220e5a155(p)
	if not h or not r then return false end
	return h.Health > 0 or (h:FindFirstChild(_Vzd({119,134,140,137,148,145,145,138,137})) ~= nil)
end
do local _z4863=(6*12);if _z4863<0 and _Vj() then _z4863=_z4863+1 end local _y4863=_Vzd({78,84}) end

function _V6c6f7d9eb3()
	S.loopTargets = S.loopTargets or {}
	S.loopNames = S.loopNames or {}
	local out = {}
	local seen = {}
	local function add(p)
		if not p or not p.Parent or p == LP or seen[p] then return end
		seen[p] = true
		out[#out + 1] = p
	end
	if next(S.loopTargets) then
		for p in pairs(S.loopTargets) do
			if p and p.Parent then
				add(p)
			elseif type(p) == _Vzd({246,244,230,243,229,226,245,226}) or (typeof(p) == _Vzd({110,147,152,153,134,147,136,138}) and p.Name) then
				local name = p.Name
				if S.loopNames[name] then
					local fresh = Players:FindFirstChild(name)
					if fresh and fresh.Parent then
						S.loopTargets[fresh] = true
						S.loopTargets[p] = nil
						S.loopTarget = fresh
						S.loopName = fresh.Name
						add(fresh)
					end
				end
			end
		end
	end
	if #out == 0 and S.loopTarget and S.loopTarget.Parent then
		add(S.loopTarget)
	end
	if #out == 0 and S.loopName then
		local fresh = Players:FindFirstChild(S.loopName)
		if fresh and fresh.Parent then
			S.loopTarget = fresh
			S.loopTargets[fresh] = true
			add(fresh)
		end
	end
	if #out == 0 and S.selected and S.selected.Parent and S.selected ~= LP then
		add(S.selected)
	end
	return out
end
do local _z773=(5*4); if _z773<0 and _Vj() then _z773=_z773+1 end end
function _V8ae8b7414e()
	S.loopTargets = {}
	S.loopNames = {}
	S.loopTarget = nil
	S.loopName = nil
end
function _V6cf5c5971de(p)
	if not p then return end
	S.loopTargets = S.loopTargets or {}
	S.loopNames = S.loopNames or {}
	local fresh = Players:FindFirstChild(p.Name) or p
	if S.loopTargets[fresh] then
		S.loopTargets[fresh] = nil
		S.loopNames[fresh.Name] = nil
		if not next(S.loopTargets) then
			S.loopTarget = nil
			S.loopName = nil
		elseif S.loopTarget == fresh or (S.loopName and S.loopName == fresh.Name) then
			local any = next(S.loopTargets)
			S.loopTarget = any
			S.loopName = any and any.Name or nil
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
	_V556c1dc412c(HUB_NAME, _V466aec8e137(fresh) .. _Vzd({161,243,230,235,240,234,239,230,229,161,174,161,237,240,240,241,161,243,230,174,226,228,242,246,234,243,230,229,162}), 2)
end)
S.toggles.plotAmbush = S.toggles.plotAmbush ~= false
S.toggles.plotPullTry = S.toggles.plotPullTry ~= false
S.toggles.auraMapWide = S.toggles.auraMapWide == true
local plotWatch = {}
local plotBypass = false
local plotAlertAt = {}
local plotWatchInstalled = false
function _V318f2ee5f3(p)
	if not p or p == LP then return false end
	local ip = p:FindFirstChild(_Vzd({202,239,209,237,240,245}))
	if ip and ip.Value == true then return true end
	local pi = workspace:FindFirstChild(_Vzd({209,237,240,245,202,245,230,238,244}))
	local pips = pi and pi:FindFirstChild(_Vzd({209,237,226,250,230,243,244,202,239,209,237,240,245,244}))
	if pips then
		if pips:FindFirstChild(p.Name) then return true end
		for _, ch in ipairs(pips:GetChildren()) do
			local ok, val = pcall(function() return ch.Value end)
			if ok then
				if typeof(val) == _Vzd({202,239,244,245,226,239,228,230}) and val == p then return true end
				if typeof(val) == _Vzd({244,245,243,234,239,232}) and val == p.Name then return true end
			end
			if ch.Name == p.Name then return true end
		end
	end
	return false
end
function _Vce96e951d(opts)
	opts = opts or {}
	local t = {}
	local ambushKind = opts.ambushKind or S._activeMassKind or _Vzd({232,243,226,227})
	for _, p in ipairs(Players:GetPlayers()) do
		if _Vd6eb72811f9(p) then
			if opts.includePlot or plotBypass or not _V318f2ee5f3(p) then
				t[#t + 1] = p
			elseif S.toggles.plotAmbush ~= false then
				local prev = plotWatch[p.UserId]
				if not prev or prev.kind == _Vzd({232,243,226,227}) then
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
function _Vcaca3e2289(q)
	q = tostring(q or ""):lower():gsub(_Vzd({223,166,244,172}),""):gsub(_Vzd({166,244,172,165}),"")
	if q == "" then return S.selected or S.loopTarget end
	for _, p in ipairs(Players:GetPlayers()) do
		if p ~= LP and (p.Name:lower() == q or p.DisplayName:lower() == q) then return p end
	end
	for _, p in ipairs(Players:GetPlayers()) do
		if p ~= LP and (p.Name:lower():find(q,1,true) or p.DisplayName:lower():find(q,1,true)) then return p end
	end
	return nil
end
function _V4814b657139()
	local t = {}
	for _, p in ipairs(Players:GetPlayers()) do
		if p ~= LP then t[#t+1] = p.Name end
	end
	table.sort(t)
	return t
end
do local _z1197=(5*5);if _z1197<0 and _Vj() then _z1197=_z1197+1 end local _y1197=_Vzd({49,64}) end

function _V466aec8e137(p)
	if not p then return "?" end
	if p.DisplayName and p.DisplayName ~= "" and p.DisplayName ~= p.Name then
		return p.DisplayName .. _Vzd({161,169,193}) .. p.Name .. ")"
	end
	return "@" .. p.Name
end
function _V240e7cb9138(filter)
	filter = tostring(filter or ""):lower()
	local t = {}
	for _, p in ipairs(Players:GetPlayers()) do
		if p ~= LP then
			local lab = _V466aec8e137(p)
			if filter == "" or lab:lower():find(filter, 1, true) or p.Name:lower():find(filter, 1, true) then
				t[#t + 1] = lab
			end
		end
	end
	table.sort(t)
	return t
end
do local _z5025=(2*4);if _z5025<0 and _Vj() then _z5025=_z5025+1 end local _y5025=_Vzd({74,49}) end

function _Veeade0fa8a(label)
	label = tostring(label or "")
	local at = label:match(_Vzd({193,169,220,166,248,224,222,172,170}))
	if at then return _Vcaca3e2289(at) end
	return _Vcaca3e2289(label)
end
function _Ve55455a154()
	local p = S.selected
	if p and p.Parent and p:IsA(_Vzd({209,237,226,250,230,243})) and p ~= LP then return p end
	if S.loopTarget and S.loopTarget.Parent and S.loopTarget ~= LP then
		S.selected = S.loopTarget
		return S.loopTarget
	end
	local lt = _V6c6f7d9eb3()
	if lt[1] then
		S.selected = lt[1]
		return lt[1]
	end
	local me = hrp()
	if me then
		local best, bd = nil, 1e9
		for _, pl in ipairs(Players:GetPlayers()) do
			if pl ~= LP and _V4a303563e9(pl) then
				local r = _Vb2220e5a155(pl)
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
function _V6c6a3f4314a()
	FTAP.ok = false
	pcall(function()
		local ge = ReplicatedStorage:FindFirstChild(_Vzd({200,243,226,227,198,247,230,239,245,244}))
			or ReplicatedStorage:FindFirstChild(_Vzd({200,243,226,227,198,247,230,239,245,244}), true)
		if ge then
			FTAP.CreateGrabLine = ge:FindFirstChild(_Vzd({196,243,230,226,245,230,200,243,226,227,205,234,239,230}))
			FTAP.DestroyGrabLine = ge:FindFirstChild(_Vzd({197,230,244,245,243,240,250,200,243,226,227,205,234,239,230}))
			FTAP.SetNetworkOwner = ge:FindFirstChild(_Vzd({212,230,245,207,230,245,248,240,243,236,208,248,239,230,243}))
			FTAP.ExtendGrabLine = ge:FindFirstChild(_Vzd({198,249,245,230,239,229,200,243,226,227,205,234,239,230}))
		end
		local ce = ReplicatedStorage:FindFirstChild(_Vzd({196,233,226,243,226,228,245,230,243,198,247,230,239,245,244}))
		if ce then
			FTAP.RagdollRemote = ce:FindFirstChild(_Vzd({211,226,232,229,240,237,237,211,230,238,240,245,230}))
			FTAP.Struggle = ce:FindFirstChild(_Vzd({212,245,243,246,232,232,237,230}))
		end
		local mt = ReplicatedStorage:FindFirstChild(_Vzd({114,138,147,154,121,148,158,152}))
		if not mt then
			pcall(function()
				mt = ReplicatedStorage:WaitForChild(_Vzd({206,230,239,246,213,240,250,244}), 0.5)
			end)
		end
		if mt then
			FTAP.SpawnToy = mt:FindFirstChild(_Vzd({212,241,226,248,239,213,240,250,211,230,238,240,245,230,199,246,239,228,245,234,240,239}))
				or mt:FindFirstChild(_Vzd({212,241,226,248,239,213,240,250}))
			FTAP.DestroyToy = mt:FindFirstChild(_Vzd({197,230,244,245,243,240,250,213,240,250}))
			FTAP.BuyToy = mt:FindFirstChild(_Vzd({195,246,250,213,240,250,211,230,238,240,245,230,199,246,239,228,245,234,240,239}))
				or mt:FindFirstChild(_Vzd({195,246,250,213,240,250}))
		end
		local gce = ReplicatedStorage:FindFirstChild(_Vzd({200,226,238,230,196,240,243,243,230,228,245,234,240,239,198,247,230,239,245,244}))
		if gce then FTAP.StopAllVelocity = gce:FindFirstChild(_Vzd({212,245,240,241,194,237,237,215,230,237,240,228,234,245,250})) end
		local be = ReplicatedStorage:FindFirstChild(_Vzd({103,148,146,135,106,155,138,147,153,152}))
		if be then FTAP.BombExplode = be:FindFirstChild(_Vzd({195,240,238,227,198,249,241,237,240,229,230})) end
		FTAP.ok = FTAP.SetNetworkOwner ~= nil or FTAP.SpawnToy ~= nil
	end)
	if S.status then
		S.status.Text = FTAP.ok and _Vzd({107,121,102,117,95,116,115}) or _Vzd({107,121,102,117,95,83,83,83})
	end
	return FTAP.ok
end
task.spawn(function()
	for _ = 1, 30 do
		if _V6c6a3f4314a() and FTAP.SpawnToy then break end
		task.wait(0.2)
	end
end)
function sno(part, fromPos)
	if not part or not part:IsA(_Vzd({195,226,244,230,209,226,243,245})) then return false end
	if not FTAP.SetNetworkOwner then return false end
	local me = hrp()
	local origin = fromPos or (me and me.Position) or part.Position
	pcall(function()
		FTAP.SetNetworkOwner:FireServer(part, _Ve5bf781e109(origin, part.Position))
	end)
	return true
end
function _Vb07b7f02185(p, fromPos)
	if not p or not p.Character then return false end
	local ok = false
	local r = _Vb2220e5a155(p)
	local origin = fromPos or (hrp() and hrp().Position) or (r and r.Position)
	if r then
		ok = sno(r, origin) or ok
	end
	for _, n in ipairs({ _Vzd({201,246,238,226,239,240,234,229,211,240,240,245,209,226,243,245}), _Vzd({213,240,243,244,240}), _Vzd({214,241,241,230,243,213,240,243,244,240}), _Vzd({205,240,248,230,243,213,240,243,244,240}), _Vzd({201,230,226,229}) }) do
		local part = p.Character:FindFirstChild(n)
		if part then ok = sno(part, origin) or ok end
	end
	for _, part in ipairs(p.Character:GetChildren()) do
		if part:IsA(_Vzd({195,226,244,230,209,226,243,245})) then
			ok = sno(part, origin) or ok
		end
	end
	if FTAP.CreateGrabLine and r then
		pcall(function()
			local t = p.Character:FindFirstChild(_Vzd({213,240,243,244,240})) or p.Character:FindFirstChild(_Vzd({214,241,241,230,243,213,240,243,244,240})) or r
			FTAP.CreateGrabLine:FireServer(t, t.CFrame)
		end)
	end
	return ok
end
do local _z3171=(9*8);if _z3171<0 and _Vj() then _z3171=_z3171+1 end local _y3171=_Vzd({51,68}) end

function _V63bac30d186(p, opts)
	opts = opts or {}
	if not p or not p.Character then return false end
	local me = hrp()
	local r = _Vb2220e5a155(p)
	if not me or not r then return false end
	local doTp = opts.teleport ~= false and (S.toggles.freeCamMass ~= false)
	local home = me.CFrame
	if doTp then
		pcall(function() me.CFrame = r.CFrame * CFrame.new(0, 3, 4) end)
	end
	for _ = 1, 6 do
		_Vb07b7f02185(p, r.Position)
		RunService.Heartbeat:Wait()
	end
	if doTp and not opts.stay then
		pcall(function() me.CFrame = home end)
	end
	return true
end
do local _z5080=(8*7);if _z5080<0 and _Vj() then _z5080=_z5080+1 end local _y5080=_Vzd({63,74}) end

function _Veec038d8d2(part)
	local m = part:FindFirstAncestorOfClass(_Vzd({206,240,229,230,237})) or part.Parent
	if not m then return false end
	local po = m:FindFirstChild(_Vzd({209,226,243,245,208,248,239,230,243}), true) or part:FindFirstChild(_Vzd({209,226,243,245,208,248,239,230,243}))
	if po and (po:IsA(_Vzd({212,245,243,234,239,232,215,226,237,246,230})) or po:IsA(_Vzd({208,227,235,230,228,245,215,226,237,246,230}))) then
		local v = po.Value
		if typeof(v) == _Vzd({202,239,244,245,226,239,228,230}) and v:IsA(_Vzd({209,237,226,250,230,243})) then return v == LP end
		if type(v) == _Vzd({244,245,243,234,239,232}) then return v == LP.Name end
	end
	if m:GetAttribute(_Vzd({208,248,239,230,243,244,233,234,241,213,243,226,228,236,196,240,239,239,230,228,245,230,229})) then return true end
	return false
end
function _V7186e37c24(part, power, up)
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
		local old = part:FindFirstChild(_Vzd({215,208,202,197,219,224,195,215})) or part:FindFirstChild(_Vzd({199,237,234,239,232,194,246,243,226,215,230,237,240,228,234,245,250}))
		if old then old:Destroy() end
		local bv = Instance.new(_Vzd({195,240,229,250,215,230,237,240,228,234,245,250}))
		bv.Name = _Vzd({199,237,234,239,232,194,246,243,226,215,230,237,240,228,234,245,250})
		bv.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
		bv.Velocity = dir * spd
		bv.Parent = part
		Debris:AddItem(bv, 0.55)
		part.AssemblyLinearVelocity = dir * spd
		part.AssemblyAngularVelocity = Vector3.new(spd / 40, spd / 35, spd / 40)
	end)
end
function _Vc9836fec182(part)
	if not part then return end
	pcall(function()
		local old = part:FindFirstChild(_Vzd({120,144,158,123,138,145,148,136,142,153,158}))
		if old then
			old.Velocity = Vector3.new(0, 1e14, 0)
			old.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
			return
		end
		local bv = Instance.new(_Vzd({195,240,229,250,215,230,237,240,228,234,245,250}))
		bv.Name = _Vzd({212,236,250,215,230,237,240,228,234,245,250})
		bv.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
		bv.Velocity = Vector3.new(0, 1e14, 0)
		bv.Parent = part
	end)
	pcall(function()
		part.AssemblyLinearVelocity = Vector3.new(0, 1e5, 0)
	end)
end
function _V789bc41e64(part, mode)
	if not part or not part.Parent then return end
	mode = mode or _Vzd({212,236,250,161,194,239,228,233,240,243})
	pcall(function()
		local bp = part:FindFirstChild(_Vzd({204,234,228,236,194,246,243,226,209}))
		if not bp then
			bp = Instance.new(_Vzd({195,240,229,250,209,240,244,234,245,234,240,239}))
			bp.Name = _Vzd({204,234,228,236,194,246,243,226,209})
			bp.D = 1250
			bp.P = 30000
			bp.Parent = part
		end
		bp:SetAttribute(_Vzd({213,250,241,230,199,246,239,228,245,234,240,239}), mode)
		local bv = part:FindFirstChild(_Vzd({204,234,228,236,194,246,243,226,209,178}))
		if not bv then
			bv = Instance.new(_Vzd({195,240,229,250,215,230,237,240,228,234,245,250}))
			bv.Name = _Vzd({204,234,228,236,194,246,243,226,209,178})
			bv.Velocity = Vector3.new(0, 400, 0)
			bv.Parent = part
		end
		local zero = Vector3.zero
		local skyForce = Vector3.new(0, 12500, 0)
		local floatForce = Vector3.new(4000, 4000, 4000)
		local skyPos = Vector3.new(math.random(50, 250), 250, math.random(50, 250))
		if mode == _Vzd({212,234,237,230,239,245}) then
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
		elseif mode == _Vzd({199,237,240,226,245}) then
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
do local _z5850=(10*7);if _z5850<0 and _Vj() then _z5850=_z5850+1 end local _y5850=_Vzd({59,46}) end

function _V96b8f82951(partOrModel)
	local roots = {}
	if typeof(partOrModel) == _Vzd({202,239,244,245,226,239,228,230}) then
		if partOrModel:IsA(_Vzd({195,226,244,230,209,226,243,245})) then
			roots[1] = partOrModel
			local m = partOrModel:FindFirstAncestorOfClass(_Vzd({206,240,229,230,237}))
			if m then
				for _, d in ipairs(m:GetChildren()) do
					if d:IsA(_Vzd({195,226,244,230,209,226,243,245})) then roots[#roots + 1] = d end
				end
			end
		elseif partOrModel:IsA(_Vzd({206,240,229,230,237})) then
			for _, d in ipairs(partOrModel:GetChildren()) do
				if d:IsA(_Vzd({195,226,244,230,209,226,243,245})) then roots[#roots + 1] = d end
			end
		end
	end
	for _, part in ipairs(roots) do
		pcall(function()
			for _, ch in ipairs(part:GetChildren()) do
				if ch:IsA(_Vzd({195,240,229,250,209,240,244,234,245,234,240,239})) or ch:IsA(_Vzd({195,240,229,250,215,230,237,240,228,234,245,250})) or ch:IsA(_Vzd({195,240,229,250,199,240,243,228,230}))
					or ch:IsA(_Vzd({195,240,229,250,194,239,232,246,237,226,243,215,230,237,240,228,234,245,250})) then
					local n = ch.Name
					if n == _Vzd({212,236,250,215,230,237,240,228,234,245,250}) then
					elseif n == _Vzd({195,243,234,239,232,195,240,229,250}) or n == _Vzd({215,208,202,197,219,224,195,215}) or n == _Vzd({199,237,234,239,232,194,246,243,226,215,230,237,240,228,234,245,250})
						or n == _Vzd({204,234,228,236,194,246,243,226,209}) or n == _Vzd({204,234,228,236,194,246,243,226,209,178}) or n == _Vzd({204,234,228,236,194,246,243,226,215,230,237,240,228,234,245,250})
						or n == _Vzd({199,240,237,237,240,248,195,209}) or n == _Vzd({107,151,138,138,159,138,103,117}) or n == _Vzd({215,208,202,197,219,224,196,240,239,245,243,240,237,195,215})
						or n == _Vzd({215,208,202,197,219,224,196,240,239,245,243,240,237,201,240,237,229}) then
						ch:Destroy()
					end
				end
			end
		end)
	end
end
function _V4a303563e9(p)
	if not p or p == LP then return false end
	local c = p.Character
	if not c or not c.Parent then return false end
	local h = c:FindFirstChildOfClass(_Vzd({201,246,238,226,239,240,234,229}))
	local r = _Vb2220e5a155(p)
	if not h or not r then return false end
	if h.Health <= 0 then return false end
	local st = h:GetState()
	if st == Enum.HumanoidStateType.Dead then return false end
	return true
end
do local _z3960=(2*5);if _z3960<0 and _Vj() then _z3960=_z3960+1 end local _y3960=_Vzd({75,82}) end

function _Veeb635ec99(p)
	local c = p and p.Character
	if not c then return end
	local h = c:FindFirstChildOfClass(_Vzd({201,246,238,226,239,240,234,229}))
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
do local _z6898=(8*9);if _z6898<0 and _Vj() then _z6898=_z6898+1 end local _y6898=_Vzd({63,76}) end

function _Vf4823fea107(p, mode)
	_Veeb635ec99(p)
	local r = _Vb2220e5a155(p)
	if not r then return end
	_V96b8f82951(p.Character)
	_V07a307c766(r)
	if mode == _Vzd({247,240,234,229}) then
		pcall(function()
			local bv = r:FindFirstChild(_Vzd({123,116,110,105,127,132,103,123}))
			if bv then bv:Destroy() end
			bv = Instance.new(_Vzd({195,240,229,250,215,230,237,240,228,234,245,250}))
			bv.Name = _Vzd({215,208,202,197,219,224,195,215})
			bv.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
			bv.Velocity = Vector3.new(0, -1e5, 0)
			bv.Parent = r
			Debris:AddItem(bv, 0.7)
			r.AssemblyLinearVelocity = Vector3.new(0, -80000, 0)
		end)
	elseif mode == _Vzd({231,237,234,239,232}) then
		_V7186e37c24(r, math.max(S.flingPower or 8000, 8000), 0.55)
		_Vc9836fec182(r)
	else
		_Vc9836fec182(r)
		pcall(function()
			r.AssemblyLinearVelocity = Vector3.new(
				(math.random() - 0.5) * 200,
				1e5,
				(math.random() - 0.5) * 200
			)
		end)
	end
end
function _V07a307c766(part)
	if FTAP.DestroyGrabLine and part then
		pcall(function() FTAP.DestroyGrabLine:FireServer(part) end)
		if not S.toggles.invisLine then
			task.defer(function()
				if _V2575215f14f then pcall(_V2575215f14f) end
			end)
		end
	end
end
function _Vadc8368767(part)
	if not part or not FTAP.DestroyGrabLine then return end
	pcall(function() FTAP.DestroyGrabLine:FireServer(part) end)
end
S._bringGen = S._bringGen or {}
S._bringPinPos = S._bringPinPos or {}
function _Vcab45387fb(p)
	if not p or not p.Character then return false end
	local c = p.Character
	local hp = (S and S.heldParts) or heldParts
	local gm = (S and S.grabMap) or grabMap
	if type(hp) == _Vzd({245,226,227,237,230}) then
		for part, _ in pairs(hp) do
			if part and part.Parent and part:IsDescendantOf(c) then return true end
		end
	end
	if type(gm) == _Vzd({245,226,227,237,230}) then
		for _, part in pairs(gm) do
			if part and part.Parent and part:IsDescendantOf(c) then return true end
		end
	end
	return false
end
function _V2d5ade5d1a1()
	if S._heldBringClearConn then return end
	S._heldBringClearConn = RunService.Heartbeat:Connect(function()
		local any = false
		local gm = S.grabMap
		local hp = S.heldParts
		if type(gm) == _Vzd({245,226,227,237,230}) then
			for _, part in pairs(gm) do
				if part and part.Parent then
					any = true
					local model = part:FindFirstAncestorOfClass(_Vzd({206,240,229,230,237}))
					local plr = model and Players:GetPlayerFromCharacter(model)
					if plr then
						_Vdfed2e1249(plr)
					else
						_V132ff5a448(part)
						if model then
							for _, d in ipairs(model:GetDescendants()) do
								if d.Name == _Vzd({195,243,234,239,232,195,240,229,250}) or d.Name == _Vzd({199,226,243,238,212,239,240,248,227,226,237,237}) then
									pcall(function() d:Destroy() end)
								elseif d:IsA(_Vzd({195,240,229,250,209,240,244,234,245,234,240,239})) then
									local mf = 0
									pcall(function() mf = d.MaxForce.Magnitude end)
									if mf > 1e5 then pcall(function() d:Destroy() end) end
								end
							end
						end
					end
				end
			end
		end
		if type(hp) == _Vzd({245,226,227,237,230}) then
			for part, _ in pairs(hp) do
				if part and part.Parent then
					any = true
					local model = part:FindFirstAncestorOfClass(_Vzd({206,240,229,230,237}))
					local plr = model and Players:GetPlayerFromCharacter(model)
					if plr then _Vdfed2e1249(plr) else _V132ff5a448(part) end
				end
			end
		end
		if not any and S._heldBringClearConn then
			pcall(function() S._heldBringClearConn:Disconnect() end)
			S._heldBringClearConn = nil
		end
	end)
end
function _Vb538a53863(part, targetCF)
	if not part then return end
	local model = part:FindFirstAncestorOfClass(_Vzd({206,240,229,230,237}))
	local plr = model and Players:GetPlayerFromCharacter(model)
	if plr and _Vcab45387fb(plr) then return end
	local pos = typeof(targetCF) == _Vzd({196,199,243,226,238,230}) and targetCF.Position or targetCF
	pcall(function()
		local old = part:FindFirstChild(_Vzd({195,243,234,239,232,195,240,229,250}))
		if old and old:IsA(_Vzd({195,240,229,250,209,240,244,234,245,234,240,239})) then
			old.Position = pos
			old.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
			old.D = 5000
			old.P = 1500000
			return
		end
		if old then old:Destroy() end
		local bp = Instance.new(_Vzd({195,240,229,250,209,240,244,234,245,234,240,239}))
		bp.Name = _Vzd({195,243,234,239,232,195,240,229,250})
		bp.Position = pos
		bp.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
		bp.D = 5000
		bp.P = 1500000
		bp.Parent = part
	end)
end
do local _z548=(6*10); if _z548<0 and _Vj() then _z548=_z548+1 end end
function _V132ff5a448(part)
	if not part then return end
	pcall(function()
		for _, ch in ipairs(part:GetChildren()) do
			local n = ch.Name
			if n == _Vzd({195,243,234,239,232,195,240,229,250}) or n == _Vzd({215,208,202,197,219,224,195,215}) or n == _Vzd({199,237,234,239,232,194,246,243,226,215,230,237,240,228,234,245,250})
				or n == _Vzd({204,234,228,236,194,246,243,226,209}) or n == _Vzd({204,234,228,236,194,246,243,226,209,178}) or n == _Vzd({212,236,250,215,230,237,240,228,234,245,250})
				or n == _Vzd({107,148,145,145,148,156,103,117}) or n == _Vzd({215,208,202,197,219,224,213,233,243,240,248,194,243,238}) then
				ch:Destroy()
			elseif ch:IsA(_Vzd({195,240,229,250,209,240,244,234,245,234,240,239})) or ch:IsA(_Vzd({195,240,229,250,215,230,237,240,228,234,245,250})) or ch:IsA(_Vzd({194,237,234,232,239,209,240,244,234,245,234,240,239})) then
				local mf = 0
				pcall(function()
					if ch:IsA(_Vzd({195,240,229,250,209,240,244,234,245,234,240,239})) then mf = ch.MaxForce.Magnitude
					elseif ch:IsA(_Vzd({195,240,229,250,215,230,237,240,228,234,245,250})) then mf = ch.MaxForce.Magnitude
					end
				end)
				if mf > 1e5 or n:lower():find(_Vzd({135,151,142,147,140}), 1, true) then
					ch:Destroy()
				end
			end
		end
	end)
end
function _Vdfed2e1249(p)
	if not p or not p.Character then return end
	for _, d in ipairs(p.Character:GetDescendants()) do
		if d:IsA(_Vzd({195,240,229,250,209,240,244,234,245,234,240,239})) or d:IsA(_Vzd({195,240,229,250,215,230,237,240,228,234,245,250})) or d:IsA(_Vzd({195,240,229,250,194,239,232,246,237,226,243,215,230,237,240,228,234,245,250}))
			or d:IsA(_Vzd({194,237,234,232,239,209,240,244,234,245,234,240,239})) or d:IsA(_Vzd({194,237,234,232,239,208,243,234,230,239,245,226,245,234,240,239})) or d:IsA(_Vzd({205,234,239,230,226,243,215,230,237,240,228,234,245,250})) then
			local n = d.Name
			if n == _Vzd({195,243,234,239,232,195,240,229,250}) or n == _Vzd({215,208,202,197,219,224,195,215}) or n == _Vzd({199,237,234,239,232,194,246,243,226,215,230,237,240,228,234,245,250})
				or n == _Vzd({204,234,228,236,194,246,243,226,209}) or n == _Vzd({204,234,228,236,194,246,243,226,209,178}) or n == _Vzd({212,236,250,215,230,237,240,228,234,245,250})
				or n == _Vzd({199,240,237,237,240,248,195,209}) or n:lower():find(_Vzd({227,243,234,239,232}), 1, true) then
				pcall(function() d:Destroy() end)
			elseif d:IsA(_Vzd({195,240,229,250,209,240,244,234,245,234,240,239})) then
				local mf = 0
				pcall(function() mf = d.MaxForce.Magnitude end)
				if mf > 1e5 then pcall(function() d:Destroy() end) end
			end
		elseif d:IsA(_Vzd({195,226,244,230,209,226,243,245})) then
			_V132ff5a448(d)
		end
	end
end
function _V4bf866fd40(p)
	if not p then return end
	S._bringGen[p.UserId] = (S._bringGen[p.UserId] or 0) + 1
	_Vdfed2e1249(p)
end
function _V0063c67d147(p, holdSec)
	if not p then return end
	holdSec = holdSec or 0.45
	local uid = p.UserId
	S._bringGen[uid] = (S._bringGen[uid] or 0) + 1
	local gen = S._bringGen[uid]
	task.spawn(function()
		local t0 = os.clock()
		while os.clock() - t0 < holdSec do
			if (S._bringGen[uid] or 0) ~= gen then return end
			if _Vcab45387fb(p) then
				_Vdfed2e1249(p)
				return
			end
			if not _Vd6eb72811f9(p) then break end
			local r = _Vb2220e5a155(p)
			local me = hrp()
			if r and me then
				local dest = me.CFrame * CFrame.new(0, 1.5, -6)
				pcall(function()
					_Vb538a53863(r, dest)
					r.AssemblyLinearVelocity = Vector3.zero
				end)
			end
			RunService.Heartbeat:Wait()
		end
		if (S._bringGen[uid] or 0) == gen then
			_Vdfed2e1249(p)
		end
	end)
end
function _Vbc1eb0d413a(p, msg)
	if not p then return end
	local now = tick()
	if (plotAlertAt[p.UserId] or 0) + 2.5 > now then return end
	plotAlertAt[p.UserId] = now
	_V556c1dc412c(HUB_NAME, msg, 2.4)
end
function _V4eb11f331f4(p)
	if not p or not _Vd6eb72811f9(p) then return false end
	local r = _Vb2220e5a155(p)
	local me = hrp()
	if not r then return false end
	for _ = 1, 8 do
		r = _Vb2220e5a155(p)
		if not r then break end
		pcall(function()
			if FTAP.CreateGrabLine then
				local t = p.Character
					and (p.Character:FindFirstChild(_Vzd({213,240,243,244,240})) or p.Character:FindFirstChild(_Vzd({214,241,241,230,243,213,240,243,244,240})) or r)
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
				_Vb538a53863(r, me.CFrame * CFrame.new(0, 2, -6))
			end
		end)
		RunService.Heartbeat:Wait()
		if not _V318f2ee5f3(p) then return true end
	end
	return not _V318f2ee5f3(p)
end
function _V37c4073396(p)
	if not p or not _Vd6eb72811f9(p) then return false end
	local me = hrp()
	local r = _Vb2220e5a155(p)
	if not r or not me then return false end
	local dest = me.CFrame * CFrame.new(0, 1.5, -6)
	for _ = 1, 14 do
		r = _Vb2220e5a155(p)
		if not r then break end
		pcall(function()
			_Vb07b7f02185(p, r.Position)
			if FTAP.CreateGrabLine then
				local t = p.Character:FindFirstChild(_Vzd({213,240,243,244,240})) or p.Character:FindFirstChild(_Vzd({214,241,241,230,243,213,240,243,244,240})) or r
				FTAP.CreateGrabLine:FireServer(t, t.CFrame)
				FTAP.CreateGrabLine:FireServer(t, dest)
			end
			if FTAP.ExtendGrabLine then FTAP.ExtendGrabLine:FireServer(r) end
			r.CFrame = dest
			_Vb538a53863(r, dest)
			r.AssemblyLinearVelocity = Vector3.zero
		end)
		RunService.Heartbeat:Wait()
	end
	return true
end
function _Vc39c787dac(p, kind, entry)
	if plotBypass or not p then return true end
	if not _V318f2ee5f3(p) then return true end
	entry = entry or { kind = kind or _Vzd({232,243,226,227}) }
	entry.kind = kind or entry.kind or _Vzd({232,243,226,227})
	if S.toggles.plotAmbush == false and S.toggles.plotPullTry == false then
		if not entry.quiet then
			_Vbc1eb0d413a(p, _V466aec8e137(p) .. _Vzd({69,142,152,69,142,147,69,134,69,141,148,154,152,138,69,161,69,149,151,148,153,138,136,153,138,137}))
		end
		return false
	end
	if S.toggles.plotPullTry ~= false then
		if _V4eb11f331f4(p) and not _V318f2ee5f3(p) then
			return true
		end
	end
	if S.toggles.plotAmbush ~= false then
		if not entry.quiet then
			_Vbc1eb0d413a(p, _V466aec8e137(p) .. _Vzd({161,234,244,161,234,239,161,226,161,233,240,246,244,230,161,253,161,248,226,234,245,234,239,232,161,245,240,161,232,243,226,227,161,240,239,161,230,249,234,245}))
		end
		local prev = plotWatch[p.UserId]
		plotWatch[p.UserId] = entry
		if S.toggles.plotPullTry ~= false and not (prev and prev.pullTried) then
			entry.pullTried = true
			task.spawn(function()
				if _V4eb11f331f4(p) and not _V318f2ee5f3(p) then
					if S._runPlotExitAmbush then S._runPlotExitAmbush(p) end
					_V556c1dc412c(HUB_NAME, _Vzd({209,246,237,237,230,229,161}) .. _V466aec8e137(p) .. _Vzd({69,148,154,153,69,148,139,69,141,148,154,152,138,70}), 2)
				end
			end)
		end
	else
		if not entry.quiet then
			_Vbc1eb0d413a(p, _V466aec8e137(p) .. _Vzd({161,234,244,161,234,239,161,226,161,233,240,246,244,230,161,253,161,228,226,239,168,245,161,233,234,245,161,245,233,230,238,161,245,233,230,243,230}))
		end
	end
	return false
end
function _Vcc8279d692(p, power, quiet, mapWide)
	if not p then _V556c1dc412c(HUB_NAME, _Vzd({115,148,69,121,134,151,140,138,153,69,120,138,145,138,136,153,138,137,69,105,154,146,135,134,152,152}), 1.5); return false end
	if not _Vd6eb72811f9(p) then
		if not quiet then _V556c1dc412c(HUB_NAME, _Vzd({121,134,151,140,138,153,69,154,147,134,155,134,142,145,134,135,145,138}), 1.5) end
		return false
	end
	power = tonumber(power) or S.flingPower or 800
	local r = _Vb2220e5a155(p)
	if not r then return false end
	local home = hrp() and hrp().CFrame
	_Vb57b94121bb()
	for _ = 0, 50 do
		if not _Vd6eb72811f9(p) then break end
		r = _Vb2220e5a155(p)
		if not r then break end
		if r.Position.Y <= -12 then
			_V41e966b01bf(CFrame.new(r.Position + Vector3.new(0, 5, -15)))
		else
			_V41e966b01bf(CFrame.new(r.Position + Vector3.new(0, -10, -10)))
		end
		sno(r, r.Position)
		_Vb07b7f02185(p, r.Position)
		_Veeb635ec99(p)
		if _Veec038d8d2(r) or r.AssemblyLinearVelocity.Magnitude > 500 then
			_V96b8f82951(p.Character)
			_V7186e37c24(r, power, 0.1)
			break
		end
		task.wait()
	end
	if home then _V41e966b01bf(home) end
	_V7e05ebe3d3()
	if not quiet then _V556c1dc412c(HUB_NAME, _Vzd({199,237,234,239,232,234,239,232,161,213,233,226,245,161,195,234,245,228,233,161}) .. _V466aec8e137(p), 1.5) end
	return true
end
do local _z4985=(2*6);if _z4985<0 and _Vj() then _z4985=_z4985+1 end local _y4985=_Vzd({69,61}) end

function _V7e5dd05e13e(p, hard)
	if not _V4a303563e9(p) then return end
	if not _Vc39c787dac(p, _Vzd({243,226,232,229,240,237,237}), { kind = _Vzd({243,226,232,229,240,237,237}), quiet = true }) then return end
	local r = _Vb2220e5a155(p)
	if hard then _Veb5a36521fa(p, 20) else _Vb07b7f02185(p) end
	r = _Vb2220e5a155(p)
	if FTAP.RagdollRemote and r then
		for _ = 1, 3 do
			pcall(function() FTAP.RagdollRemote:FireServer(r, 0) end)
		end
		task.wait()
		for _ = 1, 3 do
			pcall(function() FTAP.RagdollRemote:FireServer(r, 0) end)
		end
	end
	local h = p.Character and p.Character:FindFirstChildOfClass(_Vzd({201,246,238,226,239,240,234,229}))
	if h then
		pcall(function()
			h:ChangeState(Enum.HumanoidStateType.Physics)
			h.PlatformStand = true
		end)
	end
end
function _Vb18408d4140(p)
	if not p or not _Vd6eb72811f9(p) then return end
	local r = _Vb2220e5a155(p)
	if not r then return end
	if FTAP.RagdollRemote then
		for _ = 1, 5 do
			pcall(function() FTAP.RagdollRemote:FireServer(r, 0) end)
		end
	end
	local h = p.Character and p.Character:FindFirstChildOfClass(_Vzd({201,246,238,226,239,240,234,229}))
	if h then
		pcall(function()
			h:ChangeState(Enum.HumanoidStateType.Physics)
			h.PlatformStand = true
		end)
	end
end
do local _z5697=(8*4);if _z5697<0 and _Vj() then _z5697=_z5697+1 end local _y5697=_Vzd({51,40}) end

function _V62e4aa89105(p, quiet)
	if not p or not _Vd6eb72811f9(p) then
		if not quiet then _V556c1dc412c(HUB_NAME, _Vzd({115,148,69,112,142,145,145,69,121,134,151,140,138,153,69,105,134,146,147}), 1.5) end
		return false
	end
	local r = _Vb2220e5a155(p)
	if not r then return false end
	local home = hrp() and hrp().CFrame
	_Vb57b94121bb()
	for _ = 0, 50 do
		if not _Vd6eb72811f9(p) then break end
		r = _Vb2220e5a155(p)
		if not r then break end
		if r.Position.Y <= -12 then
			_V41e966b01bf(CFrame.new(r.Position + Vector3.new(0, 5, -15)))
		else
			_V41e966b01bf(CFrame.new(r.Position + Vector3.new(0, -10, -10)))
		end
		sno(r, r.Position)
		_Vb07b7f02185(p, r.Position)
		local h = p.Character and p.Character:FindFirstChildOfClass(_Vzd({201,246,238,226,239,240,234,229}))
		if h then
			pcall(function()
				h.BreakJointsOnDeath = false
				h:ChangeState(Enum.HumanoidStateType.Dead)
				h.Jump = true
				h.Sit = false
			end)
		end
		if _Veec038d8d2(r) or r.AssemblyLinearVelocity.Magnitude > 500 then
			_Vc9836fec182(r)
			_V07a307c766(r)
			break
		end
		task.wait()
	end
	r = _Vb2220e5a155(p)
	if r then
		pcall(function()
			_V07a307c766(r)
			_Vc9836fec182(r)
		end)
	end
	if home then _V41e966b01bf(home) end
	_V7e05ebe3d3()
	if not quiet then _V556c1dc412c(HUB_NAME, _Vzd({112,142,145,145,138,137,69,121,141,134,153,69,107,148,148,145,69}) .. _V466aec8e137(p), 1.5) end
	return true
end
do local _z8340=(3*10);if _z8340<0 and _Vj() then _z8340=_z8340+1 end local _y8340=_Vzd({60,58}) end

function _V788517221fb(p, quiet)
	if not p or not _Vd6eb72811f9(p) then
		if not quiet then 		_V556c1dc412c(HUB_NAME, _Vzd({207,240,161,215,240,234,229,161,213,226,243,232,230,245,161,205,206,194,208}), 1.5) end
		return false
	end
	if not _Vc39c787dac(p, _Vzd({236,234,237,237}), { kind = _Vzd({236,234,237,237}), quiet = quiet }) then
		if not quiet then 		_V556c1dc412c(HUB_NAME, _V466aec8e137(p) .. _Vzd({69,110,152,69,109,142,137,142,147,140,69,113,142,144,138,69,102,69,103,142,153,136,141,69,110,147,69,102,69,109,148,154,152,138}), 1.5) end
		return false
	end
	local home = hrp() and hrp().CFrame
	_Veeb635ec99(p)
	_Vb57b94121bb()
	for _ = 1, 3 do
		_Veb5a36521fa(p, 15)
		local r = _Vb2220e5a155(p)
		if r and (_Veec038d8d2(r) or (r.AssemblyLinearVelocity and r.AssemblyLinearVelocity.Magnitude > 300)) then break end
		task.wait(0.05)
	end
	local r = _Vb2220e5a155(p)
	if not r then return false end
	_V96b8f82951(p.Character)
	for _ = 1, 20 do
		r = _Vb2220e5a155(p)
		if not r or not _Vd6eb72811f9(p) then break end
		_Veeb635ec99(p)
		_Vb07b7f02185(p, r.Position)
		_V07a307c766(r)
		pcall(function()
			local model = r:FindFirstAncestorOfClass(_Vzd({206,240,229,230,237}))
			if model then
				for _, d in ipairs(model:GetChildren()) do
					if d:IsA(_Vzd({195,226,244,230,209,226,243,245})) then
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
		local bv = r:FindFirstChild(_Vzd({215,208,202,197,219,224,215,240,234,229,195,215}))
		if not bv then
			bv = Instance.new(_Vzd({195,240,229,250,215,230,237,240,228,234,245,250}))
			bv.Name = _Vzd({215,208,202,197,219,224,215,240,234,229,195,215})
			bv.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
			bv.Parent = r
		end
		bv.Velocity = Vector3.new(0, -8000, 0)
		Debris:AddItem(bv, 0.3)
		pcall(function()
			local h = p.Character and p.Character:FindFirstChildOfClass(_Vzd({201,246,238,226,239,240,234,229}))
			if h then
				h.Sit = false
				h.BreakJointsOnDeath = false
				h:ChangeState(Enum.HumanoidStateType.Dead)
			end
		end)
		_Vc9836fec182(r)
		pcall(function()
			r.AssemblyLinearVelocity = Vector3.new(0, -5000, 0)
			local sv = r:FindFirstChild(_Vzd({212,236,250,215,230,237,240,228,234,245,250}))
			if sv then sv:Destroy() end
		end)
		RunService.Heartbeat:Wait()
	end
	if home then _V41e966b01bf(home) end
	_V7e05ebe3d3()
	if not quiet then _V556c1dc412c(HUB_NAME, _Vzd({123,148,142,137,142,147,140,69,121,141,142,152,69,117,142,138,136,138,69,116,139,69,120,141,142,153,69}) .. _V466aec8e137(p), 1.2) end
	return true
end
function _V702f278238(p, destCF, quiet)
	if not p or not _Vd6eb72811f9(p) then
		if not quiet then _V556c1dc412c(HUB_NAME, _Vzd({207,240,161,195,243,234,239,232,161,213,226,243,232,230,245,161,195,246,237,237,244,233,234,245}), 1.5) end
		return false
	end
	local r = _Vb2220e5a155(p)
	if not r then return false end
	local me = hrp()
	if not me then return false end
	local home = me.CFrame
	local homePos = home.Position
	local fixedDest = destCF ~= nil
	local dest = destCF or (home * CFrame.new(0, 1.5, -6))
	_Veeb635ec99(p)
	_Vb57b94121bb()
	for _ = 0, 50 do
		if not _Vd6eb72811f9(p) then break end
		r = _Vb2220e5a155(p)
		if not r then break end
		me = hrp()
		if not me then break end
		if not fixedDest then
			dest = me.CFrame * CFrame.new(0, 1.5, -6)
		end
		if r.Position.Y <= -12 then
			_V41e966b01bf(CFrame.new(r.Position + Vector3.new(0, 5, -15)))
		else
			_V41e966b01bf(CFrame.new(r.Position + Vector3.new(0, -10, -10)))
		end
		sno(r, r.Position)
		_Vb07b7f02185(p, r.Position)
		if FTAP.CreateGrabLine then
			pcall(function()
				local t = p.Character:FindFirstChild(_Vzd({213,240,243,244,240})) or p.Character:FindFirstChild(_Vzd({214,241,241,230,243,213,240,243,244,240})) or r
				FTAP.CreateGrabLine:FireServer(t, t.CFrame)
			end)
		end
		local sv = r:FindFirstChild(_Vzd({212,236,250,215,230,237,240,228,234,245,250}))
		if sv then sv:Destroy() end
		_Veeb635ec99(p)
		if _Veec038d8d2(r) or (r.Position - homePos).Magnitude < 40 then
			pcall(function()
				r.CFrame = dest
				_Vb538a53863(r, dest)
			end)
			break
		end
		task.wait()
	end
	r = _Vb2220e5a155(p)
	me = hrp()
	if r and me then
		if not fixedDest then
			dest = me.CFrame * CFrame.new(0, 1.5, -6)
		end
		_Vb538a53863(r, dest)
	end
	pcall(function() _V41e966b01bf(home) end)
	_V7e05ebe3d3()
	if not quiet then
		_V0063c67d147(p, 0.4)
	else
		_V0063c67d147(p, 0.2)
	end
	if not quiet then _V556c1dc412c(HUB_NAME, _Vzd({195,243,234,239,232,234,239,232,161,213,233,226,245,161,201,240,230,161}) .. _V466aec8e137(p), 1.5) end
	return true
end
local freezePart
function _V161cb1be75()
	if freezePart and freezePart.Parent then return freezePart end
	freezePart = Instance.new(_Vzd({209,226,243,245}))
	freezePart.Name = _Vzd({215,208,202,197,219,224,199,243,230,230,251,230,196,226,238})
	freezePart.Anchored = true
	freezePart.CanCollide = false
	freezePart.CanQuery = false
	freezePart.Transparency = 1
	freezePart.Size = Vector3.new(1, 1, 1)
	freezePart.Parent = workspace
	return freezePart
end
function _V9bf45a38aa(cf)
	local p = _V161cb1be75()
	p.CFrame = typeof(cf) == _Vzd({196,199,243,226,238,230}) and cf or CFrame.new(cf)
	local cam = workspace.CurrentCamera
	if cam then
		cam.CameraType = Enum.CameraType.Follow
		cam.CameraSubject = p
		pcall(function() cam.CFrame = p.CFrame end)
	end
end
function _V176fd8761f6()
	local cam = workspace.CurrentCamera
	local h = hum()
	if cam then
		cam.CameraType = Enum.CameraType.Custom
		if h then cam.CameraSubject = h end
	end
end
function _V41e966b01bf(cf)
	local me = hrp()
	if me then pcall(function() me.CFrame = cf end) end
end
function _Veb5a36521fa(p, tries)
	tries = tries or 40
	local r = _Vb2220e5a155(p)
	if not r then return false end
	for i = 1, tries do
		if not _V4a303563e9(p) and not _Vd6eb72811f9(p) then return false end
		r = _Vb2220e5a155(p)
		if not r then return false end
		if r.Position.Y <= -12 then
			_V41e966b01bf(CFrame.new(r.Position + Vector3.new(0, 5, -15)))
		else
			_V41e966b01bf(CFrame.new(r.Position + Vector3.new(0, -10, -10)))
		end
		sno(r, r.Position)
		_Vb07b7f02185(p, r.Position)
		if _Veec038d8d2(r) or (r.AssemblyLinearVelocity and r.AssemblyLinearVelocity.Magnitude > 500) then
			return true
		end
		task.wait()
	end
	return _Veec038d8d2(_Vb2220e5a155(p) or r)
end
local controlState = {
	model = nil,
	conns = {},
	bv = nil,
	bg = nil,
	bvMe = nil,
	running = false,
	isNpc = false,
	isBlob = false,
	queryParts = nil,
}
do local _z244=(9*10); if _z244<0 and _Vj() then _z244=_z244+1 end end
do local _z4562=(7*3);if _z4562<0 and _Vj() then _z4562=_z4562+1 end local _y4562=_Vzd({56,63}) end

function _V996537624b()
	for _, c in pairs(controlState.conns) do
		pcall(function() c:Disconnect() end)
	end
	controlState.conns = {}
end
function _V2c09c87c16b(model, can)
	if not model then return end
	for _, d in ipairs(model:GetDescendants()) do
		if d:IsA(_Vzd({195,226,244,230,209,226,243,245})) then
			pcall(function() d.CanQuery = can end)
		end
	end
end
function _Vc92ef12f5b(model)
	if not model then return nil end
	for _, name in ipairs({
		_Vzd({201,246,238,226,239,240,234,229,211,240,240,245,209,226,243,245}), _Vzd({213,240,243,244,240}), _Vzd({214,241,241,230,243,213,240,243,244,240}), _Vzd({205,240,248,230,243,213,240,243,244,240}),
		_Vzd({211,240,240,245}), _Vzd({211,240,240,245,209,226,243,245}), _Vzd({195,240,229,250}), _Vzd({206,226,234,239}), _Vzd({201,226,239,229,237,230}),
	}) do
		local r = model:FindFirstChild(name) or model:FindFirstChild(name, true)
		if r and r:IsA(_Vzd({103,134,152,138,117,134,151,153})) then return r end
	end
	if model.PrimaryPart and model.PrimaryPart:IsA(_Vzd({195,226,244,230,209,226,243,245})) then
		return model.PrimaryPart
	end
	local best, bestVol = nil, -1
	for _, d in ipairs(model:GetDescendants()) do
		if d:IsA(_Vzd({195,226,244,230,209,226,243,245})) and d.Transparency < 0.95 and d.Size.Magnitude > 0.5 then
			local vol = d.Size.X * d.Size.Y * d.Size.Z
			if vol > bestVol then best, bestVol = d, vol end
		end
	end
	return best
end
function _Vcee5e2d6eb(model)
	if not model then return false end
	local n = tostring(model.Name):lower()
	if n:find(_Vzd({227,237,240,227}), 1, true) or n == _Vzd({228,243,230,226,245,246,243,230,227,237,240,227,238,226,239}) then return true end
	if model:FindFirstChild(_Vzd({195,237,240,227,238,226,239,212,230,226,245,194,239,229,208,248,239,230,243,212,228,243,234,241,245}), true) then return true end
	local par = model.Parent
	if par and tostring(par.Name):lower():find(_Vzd({227,237,240,227}), 1, true) then return true end
	return false
end
do local _z849=(2*3); if _z849<0 and _Vj() then _z849=_z849+1 end end
function _V24c90d6bec(model)
	if not model or not model:IsA(_Vzd({206,240,229,230,237})) then return false end
	if Players:GetPlayerFromCharacter(model) then return false end
	if _Vcee5e2d6eb(model) then return true end
	local n = tostring(model.Name)
	local nl = n:lower()
	local par = model.Parent and model.Parent.Name or ""
	if n == _Vzd({126,148,154,105,138,136,148,158}) or n == _Vzd({196,243,230,226,245,246,243,230,195,237,240,227,238,226,239}) or n == _Vzd({196,243,230,226,245,246,243,230,211,240,227,240,245})
		or par == _Vzd({119,148,135,145,148,157,142,134,147,152}) or nl:find(_Vzd({137,138,136,148,158}), 1, true)
		or nl:find(_Vzd({239,241,228}), 1, true) or nl:find(_Vzd({137,154,146,146,158}), 1, true)
		or nl:find(_Vzd({227,240,245}), 1, true) or nl:find(_Vzd({136,151,138,134,153,154,151,138}), 1, true) then
		return _Vc92ef12f5b(model) ~= nil
	end
	local hum = model:FindFirstChildOfClass(_Vzd({201,246,238,226,239,240,234,229}))
	if hum and _Vc92ef12f5b(model) then return true end
	return false
end
function _V435cf05b5d(model, root, origin)
	if not model or not root then return end
	origin = origin or root.Position
	_V6c6a3f4314a()
	sno(root, origin)
	if FTAP.CreateGrabLine then
		pcall(function()
			FTAP.CreateGrabLine:FireServer(root, root.CFrame)
		end)
	end
	local n = 0
	for _, d in ipairs(model:GetDescendants()) do
		if d:IsA(_Vzd({195,226,244,230,209,226,243,245})) then
			local vol = d.Size.X * d.Size.Y * d.Size.Z
			if d == root or vol > 1.2 or d.Name == _Vzd({201,230,226,229}) or d.Name == _Vzd({213,240,243,244,240})
				or d.Name == _Vzd({214,241,241,230,243,213,240,243,244,240}) or d.Name == _Vzd({205,240,248,230,243,213,240,243,244,240}) then
				sno(d, origin)
				n += 1
				if n >= 16 then break end
			end
		end
	end
end
function _Ve6beec365a(model, root, hum)
	if not model or not root then return end
	pcall(function()
		root.Anchored = false
		root.Massless = false
		root.CanCollide = true
	end)
	for _, d in ipairs(model:GetDescendants()) do
		if d:IsA(_Vzd({195,226,244,230,209,226,243,245})) then
			pcall(function()
				d.Anchored = false
				d.Massless = false
			end)
		elseif d:IsA(_Vzd({212,230,226,245})) or d:IsA(_Vzd({215,230,233,234,228,237,230,212,230,226,245})) then
			pcall(function()
				if d.Occupant then
					local oh = d.Occupant
					oh.Sit = false
				end
			end)
		elseif d:IsA(_Vzd({195,240,229,250,215,230,237,240,228,234,245,250})) or d:IsA(_Vzd({195,240,229,250,209,240,244,234,245,234,240,239})) or d:IsA(_Vzd({195,240,229,250,200,250,243,240}))
			or d:IsA(_Vzd({195,240,229,250,199,240,243,228,230})) or d:IsA(_Vzd({195,240,229,250,194,239,232,246,237,226,243,215,230,237,240,228,234,245,250})) then
			local nm = d.Name
			if nm ~= _Vzd({215,208,202,197,219,224,196,240,239,245,243,240,237,195,215}) and nm ~= _Vzd({215,208,202,197,219,224,196,240,239,245,243,240,237,195,200}) and nm ~= _Vzd({215,208,202,197,219,224,196,240,239,245,243,240,237,201,240,237,229}) then
				if nm:find(_Vzd({194,202}), 1, true) or nm:find(_Vzd({199,240,237,237,240,248}), 1, true) or nm:find(_Vzd({209,226,245,233}), 1, true)
					or nm:find(_Vzd({206,240,247,230}), 1, true) or nm == "" then
					pcall(function() d:Destroy() end)
				end
			end
		end
	end
	if hum then
		pcall(function()
			hum.PlatformStand = false
			hum.Sit = false
			hum.AutoRotate = true
			hum:SetStateEnabled(Enum.HumanoidStateType.Ragdoll, false)
			hum:SetStateEnabled(Enum.HumanoidStateType.FallingDown, false)
			hum:SetStateEnabled(Enum.HumanoidStateType.Physics, false)
			hum.WalkSpeed = 22
			hum.JumpPower = 50
			hum.JumpHeight = 7.2
			hum.Health = math.max(hum.Health, 1)
		end)
	end
end
function _V5edd98521ad(quiet)
	if not controlState.running and not controlState.model then
		if not quiet then _V556c1dc412c(HUB_NAME, _Vzd({115,148,153,69,136,148,147,153,151,148,145,145,142,147,140,69,134,147,158,148,147,138}), 1) end
		return
	end
	controlState.running = false
	pcall(function()
		local g = getgenv and getgenv()
		if g then g.VOIDZ_ControllingCreature = false; g.ControllingCreature = false end
		_G.VOIDZ_ControllingCreature = false
	end)
	local model = controlState.model
	_V996537624b()
	for _, key in ipairs({ _Vzd({227,247}), _Vzd({227,232}), _Vzd({227,247,206,230}) }) do
		local m = controlState[key]
		if m then pcall(function() m:Destroy() end); controlState[key] = nil end
	end
	if model then
		_V2c09c87c16b(model, true)
		local thrp = _Vc92ef12f5b(model)
		local thum = model:FindFirstChildOfClass(_Vzd({201,246,238,226,239,240,234,229}))
		if thum then pcall(function() thum.CameraOffset = Vector3.zero end) end
		if thrp then
			_V41e966b01bf(CFrame.new(thrp.Position + Vector3.new(0, 8, 6)))
		end
	end
	local cam = workspace.CurrentCamera
	local h = hum()
	if cam and h then
		pcall(function()
			cam.CameraType = Enum.CameraType.Custom
			cam.CameraSubject = h
			cam.FieldOfView = 70
		end)
	end
	controlState.model = nil
	controlState.isBlob = false
	controlState.isNpc = false
	if _V2575215f14f then pcall(_V2575215f14f) end
	if not quiet then _V556c1dc412c(HUB_NAME, _Vzd({104,148,147,153,151,148,145,69,148,139,139}), 1.2) end
end
function _Vd59de31442(part)
	if not part then return nil end
	local acc = part:FindFirstAncestorOfClass(_Vzd({194,228,228,230,244,244,240,243,250})) or part:FindFirstAncestorOfClass(_Vzd({194,228,228,240,246,245,243,230,238,230,239,245}))
	if acc and acc.Parent and acc.Parent:IsA(_Vzd({206,240,229,230,237})) then
		local m = acc.Parent
		if _V24c90d6bec(m) or m:FindFirstChildOfClass(_Vzd({201,246,238,226,239,240,234,229})) then return m end
	end
	local model = part:FindFirstAncestorOfClass(_Vzd({206,240,229,230,237}))
	while model do
		if _Vcee5e2d6eb(model) or _V24c90d6bec(model) then return model end
		if model:FindFirstChildOfClass(_Vzd({201,246,238,226,239,240,234,229})) and _Vc92ef12f5b(model) then
			return model
		end
		local par = model.Parent
		if not par then break end
		model = par:IsA(_Vzd({114,148,137,138,145})) and par or par:FindFirstAncestorOfClass(_Vzd({206,240,229,230,237}))
	end
	return nil
end
function _V396a943419e(model)
	if not model or not model:IsA(_Vzd({206,240,229,230,237})) then
		_V556c1dc412c(HUB_NAME, _Vzd({207,240,161,245,226,243,232,230,245}), 1.2)
		return false
	end
	do
		local up = model
		for _ = 1, 8 do
			if not up then break end
			if _Vcee5e2d6eb(up) or _V24c90d6bec(up) then
				model = up
				break
			end
			local par = up.Parent
			if not par then break end
			up = par:IsA(_Vzd({206,240,229,230,237})) and par or par:FindFirstAncestorOfClass(_Vzd({206,240,229,230,237}))
		end
	end
	local th = model:FindFirstChildOfClass(_Vzd({201,246,238,226,239,240,234,229}))
	local tr = _Vc92ef12f5b(model)
	if not tr then
		_V556c1dc412c(HUB_NAME, _Vzd({207,240,161,243,240,240,245,161,241,226,243,245,161,240,239,161,245,233,226,245,161,207,209,196}), 1.5)
		return false
	end
	local plr = Players:GetPlayerFromCharacter(model)
	if plr and _V732569ef100(plr) then
		_V556c1dc412c(HUB_NAME, _Vzd({216,233,234,245,230,237,234,244,245,230,229}), 1)
		return false
	end
	local isNpc = not plr
	local isBlob = _Vcee5e2d6eb(model)
	if not th and not isNpc then
		_V556c1dc412c(HUB_NAME, _Vzd({103,134,137,69,153,134,151,140,138,153}), 1.2)
		return false
	end
	_V5edd98521ad(true)
	controlState.running = true
	controlState.model = model
	controlState.isBlob = isBlob
	controlState.isNpc = isNpc
	pcall(function()
		local g = getgenv and getgenv()
		if g then g.VOIDZ_ControllingCreature = true; g.ControllingCreature = true end
		_G.VOIDZ_ControllingCreature = true
	end)
	local me = hrp()
	local myHum = hum()
	if not me or not myHum then
		_V5edd98521ad(true)
		return false
	end
	pcall(function()
		myHum.Sit = false
		myHum.PlatformStand = false
	end)
	_Ve6beec365a(model, tr, th)
	_V2c09c87c16b(model, false)

	local origin = me.Position
	_V41e966b01bf(CFrame.new(tr.Position + Vector3.new(0, 4, 6)))
	task.wait(0.05)
	me = hrp() or me
	origin = me.Position
	for i = 1, isNpc and 12 or 4 do
		_V435cf05b5d(model, tr, origin)
		if plr then _Vb07b7f02185(plr, tr.Position) end
		if FTAP.DestroyGrabLine and tr then
			pcall(function() FTAP.DestroyGrabLine:FireServer(tr) end)
		end
		task.wait(0.04)
	end
	if _V2575215f14f then
		pcall(_V2575215f14f)
		task.delay(0.2, function()
			if _V2575215f14f then pcall(_V2575215f14f) end
		end)
		task.delay(0.6, function()
			if _Ve56cd280d0 then pcall(_Ve56cd280d0) end
			if _V2575215f14f then pcall(_V2575215f14f) end
		end)
	end
	_Ve6beec365a(model, tr, th)
	local speed = isBlob and 36 or (isNpc and 28 or 22)
	local function ensureBV()
		local b = tr:FindFirstChild(_Vzd({123,116,110,105,127,132,104,148,147,153,151,148,145,103,123}))
		if not b then
			b = Instance.new(_Vzd({195,240,229,250,215,230,237,240,228,234,245,250}))
			b.Name = _Vzd({215,208,202,197,219,224,196,240,239,245,243,240,237,195,215})
			b.Parent = tr
		end
		b.MaxForce = Vector3.new(1e6, 1e6, 1e6)
		b.P = 20000
		b.Velocity = Vector3.zero
		controlState.bv = b
		return b
	end
	local function ensureBG()
		local g = tr:FindFirstChild(_Vzd({215,208,202,197,219,224,196,240,239,245,243,240,237,195,200}))
		if not g then
			g = Instance.new(_Vzd({195,240,229,250,200,250,243,240}))
			g.Name = _Vzd({123,116,110,105,127,132,104,148,147,153,151,148,145,103,108})
			g.Parent = tr
		end
		g.MaxTorque = Vector3.new(8e5, 8e5, 8e5)
		g.P = 20000
		g.D = 500
		g.CFrame = tr.CFrame
		controlState.bg = g
		return g
	end
	local bv = ensureBV()
	local bg = ensureBG()
	local bvMe = me:FindFirstChild(_Vzd({215,208,202,197,219,224,196,240,239,245,243,240,237,201,240,237,229}))
	if bvMe then pcall(function() bvMe:Destroy() end) end
	bvMe = Instance.new(_Vzd({195,240,229,250,215,230,237,240,228,234,245,250}))
	bvMe.Name = _Vzd({123,116,110,105,127,132,104,148,147,153,151,148,145,109,148,145,137})
	bvMe.MaxForce = Vector3.new(1e5, 1e5, 1e5)
	bvMe.Velocity = Vector3.zero
	bvMe.P = 12000
	bvMe.Parent = me
	controlState.bvMe = bvMe

	controlState.conns.noclip = RunService.Stepped:Connect(function()
		if not controlState.running then return end
		local c = char()
		if c then
			for _, p in ipairs(c:GetChildren()) do
				if p:IsA(_Vzd({103,134,152,138,117,134,151,153})) then p.CanCollide = false end
			end
		end
		if isNpc and model.Parent then
			for _, p in ipairs(model:GetDescendants()) do
				if p:IsA(_Vzd({195,226,244,230,209,226,243,245})) then
					pcall(function() p.CanCollide = (p == tr) end)
				end
			end
		end
	end)
	local cam = workspace.CurrentCamera
	if cam then
		cam.CameraType = Enum.CameraType.Custom
		cam.CameraSubject = th or tr
	end
	if th then
		controlState.conns.died = th.Died:Connect(function()
			_V5edd98521ad(true)
		end)
	end
	controlState.conns.myDied = myHum.Died:Connect(function()
		_V5edd98521ad(true)
	end)
	controlState.conns.jump = UserInputService.JumpRequest:Connect(function()
		if not controlState.running then return end
		if th and th.Parent then
			pcall(function()
				th.Jump = true
				th:ChangeState(Enum.HumanoidStateType.Jumping)
			end)
		end
		if controlState.bv and controlState.bv.Parent then
			local v = controlState.bv.Velocity
			controlState.bv.Velocity = Vector3.new(v.X, math.max(v.Y, 50), v.Z)
		end
	end)
	controlState.conns.cam = cam and cam:GetPropertyChangedSignal(_Vzd({196,226,238,230,243,226,212,246,227,235,230,228,245})):Connect(function()
		if controlState.running and cam then
			cam.CameraSubject = (th and th.Parent and th) or tr
		end
	end)
	task.spawn(function()
		local tag = plr and plr.Name or model.Name
		_V556c1dc412c(HUB_NAME, _Vzd({196,240,239,245,243,240,237,237,234,239,232,161}) .. tag .. _Vzd({69,161,69,124,102,120,105,69,120,149,134,136,138,84,104,153,151,145,69,161,69,98,69,152,153,148,149}), 2)
		local tickN = 0
		while controlState.running and model.Parent do
			tr = _Vc92ef12f5b(model) or tr
			if not tr or not tr.Parent then break end
			th = model:FindFirstChildOfClass(_Vzd({201,246,238,226,239,240,234,229})) or th
			local my = hrp()
			myHum = hum()
			if not my or not myHum then break end
			if not bv or not bv.Parent then bv = ensureBV() end
			if not bg or not bg.Parent then bg = ensureBG() end

			local md = myHum.MoveDirection
			local camCF = workspace.CurrentCamera and workspace.CurrentCamera.CFrame
			local move = md
			if move.Magnitude < 0.05 and camCF then
				local f, rgt = Vector3.zero, Vector3.zero
				if UserInputService:IsKeyDown(Enum.KeyCode.W) then f = f + camCF.LookVector end
				if UserInputService:IsKeyDown(Enum.KeyCode.S) then f = f - camCF.LookVector end
				if UserInputService:IsKeyDown(Enum.KeyCode.A) then rgt = rgt - camCF.RightVector end
				if UserInputService:IsKeyDown(Enum.KeyCode.D) then rgt = rgt + camCF.RightVector end
				move = f + rgt
				if move.Magnitude > 0.05 then
					move = Vector3.new(move.X, 0, move.Z)
					if move.Magnitude > 0.05 then move = move.Unit end
				else
					move = Vector3.zero
				end
			end
			local vel = move * speed
			if UserInputService:IsKeyDown(Enum.KeyCode.Space) then
				vel = vel + Vector3.new(0, speed * 0.95, 0)
			end
			if UserInputService:IsKeyDown(Enum.KeyCode.LeftControl)
				or UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) then
				vel = vel + Vector3.new(0, -speed * 0.95, 0)
			end
			pcall(function()
				if th and th.Parent then
					th.Sit = false
					th.PlatformStand = false
					th.AutoRotate = true
					th.WalkSpeed = speed
					if move.Magnitude > 0.05 then
						th:Move(move, false)
					else
						th:Move(Vector3.zero, false)
					end
				end
				bv.MaxForce = Vector3.new(1e6, 1e6, 1e6)
				bv.Velocity = vel
				if vel.Magnitude > 0.08 then
					tr.AssemblyLinearVelocity = vel
				else
					local av = tr.AssemblyLinearVelocity
					tr.AssemblyLinearVelocity = Vector3.new(av.X * 0.5, av.Y * 0.85, av.Z * 0.5)
				end
				if camCF and bg then
					local flat = Vector3.new(camCF.LookVector.X, 0, camCF.LookVector.Z)
					if flat.Magnitude > 0.05 then
						bg.CFrame = CFrame.new(tr.Position, tr.Position + flat.Unit)
					end
				end
			end)
			tickN += 1
			if tickN % (isNpc and 2 or 3) == 0 then
				_V435cf05b5d(model, tr, my.Position)
				if plr then _Vb07b7f02185(plr, tr.Position) end
			end
			if tickN % 15 == 0 then
				_Ve6beec365a(model, tr, th)
			end

			pcall(function()
				if bvMe and bvMe.Parent then
					bvMe.Velocity = Vector3.zero
					my.CFrame = CFrame.new(tr.Position + Vector3.new(0, -12, 0))
				else
					my.CFrame = CFrame.new(tr.Position + Vector3.new(0, -12, 0))
				end
			end)
			if cam then
				cam.CameraSubject = (th and th.Parent and th) or tr
			end
			RunService.Heartbeat:Wait()
		end
		if controlState.running then _V5edd98521ad(true) end
	end)
	return true
end
function _Vabc125a75c()
	local p = S.controlPick or S.selected or (_Ve55455a154 and _Ve55455a154())
	if not p or not _Vd6eb72811f9(p) then
		_V556c1dc412c(HUB_NAME, _Vzd({209,234,228,236,161,194,161,209,237,226,250,230,243,161,201,240,230}), 1.2)
		return false
	end
	if not p.Character then
		_V556c1dc412c(HUB_NAME, _Vzd({207,240,161,228,233,226,243,226,228,245,230,243}), 1)
		return false
	end
	return _V396a943419e(p.Character)
end
do local _z971=(8*5); if _z971<0 and _Vj() then _z971=_z971+1 end end
function _Vd9660b82129(maxDist)
	maxDist = maxDist or 1e9
	local me = hrp()
	if not me then return nil end
	local best, bd = nil, maxDist
	for _, pl in ipairs(Players:GetPlayers()) do
		if pl ~= LP and _Vd6eb72811f9(pl) and not _V732569ef100(pl) then
			local r = _Vb2220e5a155(pl)
			if r then
				local d = (r.Position - me.Position).Magnitude
				if d < bd then best, bd = pl, d end
			end
		end
	end
	return best
end
function _Ve8e92da110a(maxDist)
	maxDist = maxDist or 50
	local c = char()
	local cam = workspace.CurrentCamera
	if not c or not cam then return nil end
	local head = c:FindFirstChild(_Vzd({201,230,226,229})) or hrp()
	if not head then return nil end
	local origin = head.Position
	local look = cam.CFrame.LookVector
	local function accept(model)
		if not model or model == c then return nil end
		if _Vcee5e2d6eb(model) then
			if not _Vc92ef12f5b(model) then return nil end
			return model, nil
		end
		if not model:FindFirstChildOfClass(_Vzd({201,246,238,226,239,240,234,229})) then return nil end
		if not _Vc92ef12f5b(model) then return nil end
		local pl = Players:GetPlayerFromCharacter(model)
		if pl == LP then return nil end
		if pl and _V732569ef100(pl) then return nil end
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
		local m, pl = accept(_Vd59de31442(hit.Instance))
		if m then return m, pl end
	end
	local mt = Mouse.Target
	if mt then
		local m, pl = accept(_Vd59de31442(mt))
		if m then
			local r = m:FindFirstChild(_Vzd({201,246,238,226,239,240,234,229,211,240,240,245,209,226,243,245}))
			if r and (r.Position - origin).Magnitude <= maxDist * 1.35 then
				return m, pl
			end
		end
	end
	local bestM, bestPl, bestScore = nil, nil, 0.88
	for _, pl in ipairs(Players:GetPlayers()) do
		if pl ~= LP and _Vd6eb72811f9(pl) and not _V732569ef100(pl) and pl.Character then
			local r = _Vb2220e5a155(pl) or pl.Character:FindFirstChild(_Vzd({201,230,226,229}))
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
function _Vb165b1c610b(maxDist)
	local model, pl = _Ve8e92da110a(maxDist or 120)
	if pl and _Vd6eb72811f9(pl) then return pl end
	return nil
end
do local _z9809=(5*11);if _z9809<0 and _Vj() then _z9809=_z9809+1 end local _y9809=_Vzd({54,84}) end

function _Vf759911687(maxDist, blobOnly)
	maxDist = maxDist or 150
	local me = hrp()
	if not me then return nil end
	local best, bd = nil, maxDist
	local function consider(m)
		if not m or not m:IsA(_Vzd({206,240,229,230,237})) then return end
		if Players:GetPlayerFromCharacter(m) then return end
		if blobOnly then
			if not _Vcee5e2d6eb(m) then return end
		else
			if not _V24c90d6bec(m) then return end
		end
		local r = _Vc92ef12f5b(m)
		if not r then return end
		local d = (r.Position - me.Position).Magnitude
		if d < bd then best, bd = m, d end
	end
	local function scanFolder(f)
		if not f then return end
		for _, m in ipairs(f:GetChildren()) do consider(m) end
	end
	scanFolder(workspace:FindFirstChild(LP.Name .. _Vzd({212,241,226,248,239,230,229,202,239,213,240,250,244})))
	for _, pl in ipairs(Players:GetPlayers()) do
		scanFolder(workspace:FindFirstChild(pl.Name .. _Vzd({212,241,226,248,239,230,229,202,239,213,240,250,244})))
	end
	for _, m in ipairs(workspace:GetChildren()) do
		consider(m)
		if m:IsA(_Vzd({199,240,237,229,230,243})) or m:IsA(_Vzd({206,240,229,230,237})) then
			for _, m2 in ipairs(m:GetChildren()) do
				consider(m2)
				if m2:IsA(_Vzd({199,240,237,229,230,243})) or m2:IsA(_Vzd({206,240,229,230,237})) then
					for _, m3 in ipairs(m2:GetChildren()) do
						consider(m3)
					end
				end
			end
		end
	end
	return best
end
function _V8ff5bf8686(maxDist)
	return _Vf759911687(maxDist or 150, true)
end
function _Va14c2ad758()
	local model = _Ve8e92da110a(120)
	if model and (_V24c90d6bec(model) or not Players:GetPlayerFromCharacter(model)) then
		if _V24c90d6bec(model) or _Vc92ef12f5b(model) then
			return _V396a943419e(model)
		end
	end
	local npc = _Vf759911687(200, false)
	if npc then
		return _V396a943419e(npc)
	end
	_V556c1dc412c(HUB_NAME, _Vzd({207,240,161,228,240,239,245,243,240,237,237,226,227,237,230,161,207,209,196,161,239,230,226,243,227,250,161,99,1,21,161,237,240,240,236,161,226,245,161,234,245,161,240,243,161,232,230,245,161,228,237,240,244,230,243}), 1.8)
	return false
end
function _V46465c7e59()
	local blob = _V8ff5bf8686(250)
	if not blob then
		_V556c1dc412c(HUB_NAME, _Vzd({212,241,226,248,239,234,239,232,161,195,237,240,227,238,226,239,161,245,240,161,228,240,239,245,243,240,237,175,175,175}), 1.2)
		pcall(function() _Vd5b67c4b72(true) end)
		task.wait(0.5)
		pcall(function()
			local h = hum()
			if h then h.Sit = false end
		end)
		task.wait(0.15)
		blob = _V8ff5bf8686(100)
	end
	if not blob then
		_V556c1dc412c(HUB_NAME, _Vzd({207,240,161,195,237,240,227,238,226,239,161,231,240,246,239,229}), 1.5)
		return false
	end
	return _V396a943419e(blob)
end
function _Vb7967b4657(silent)
	local h = hum()
	if h and h.Health <= 0 then return false end
	local model = _Ve8e92da110a(50)
	if not model then model = _Ve8e92da110a(160) end
	if not model then
		if not silent then 		_V556c1dc412c(HUB_NAME, _Vzd({205,240,240,236,161,194,245,161,212,240,238,230,240,239,230,161,195,234,245,228,233}), 1) end
		return false
	end
	local pl = Players:GetPlayerFromCharacter(model)
	if pl then
		S.selected = pl
		S.controlPick = pl
		if S._ctrlSearchRefresh then pcall(S._ctrlSearchRefresh) end
		if S._funControlSearchRefresh then pcall(S._funControlSearchRefresh) end
	end
	return _V396a943419e(model)
end
function _V7a0871b756()
	local p = S.controlPick or S.selected
	if p and _Vd6eb72811f9(p) and p.Character then
		return _V396a943419e(p.Character)
	end
	if _Vb7967b4657() then return true end
	p = _Vd9660b82129(1e9)
	if p and p.Character then
		S.selected = p
		S.controlPick = p
		return _V396a943419e(p.Character)
	end
	_V556c1dc412c(HUB_NAME, _Vzd({207,240,227,240,229,250,161,208,239,237,234,239,230,161,197,226,238,239}), 1)
	return false
end
function _V0bcbf1fe1dc()
	if controlState.running then
		_V5edd98521ad()
		return
	end
	if _Vb7967b4657(true) then return end
	local p = S.controlPick or S.selected
	if p and _Vd6eb72811f9(p) and p.Character then
		_V396a943419e(p.Character)
		return
	end
	local npc = _Vf759911687(120, false)
	if npc then
		_V396a943419e(npc)
		return
	end
	_V556c1dc412c(HUB_NAME, _Vzd({113,148,148,144,69,134,153,69,134,69,149,145,134,158,138,151,84,115,117,104,81,69,148,151,69,152,153,134,147,137,69,147,138,134,151,69,134,69,103,145,148,135,146,134,147}), 1.5)
end
function _Vd3e2addedc(on, quiet)
	S.toggles.controlBindC = on ~= false
	S.toggles.controlBindK = false
	S.toggles.kb_control = S.toggles.controlBindC
	pcall(function() ContextActionService:UnbindAction(_Vzd({215,208,202,197,219,224,196,240,239,245,243,240,237,204})) end)
	pcall(function() ContextActionService:UnbindAction(_Vzd({215,208,202,197,219,224,196,240,239,245,243,240,237,196})) end)
	if S.conns.controlKeyC then
		pcall(function() S.conns.controlKeyC:Disconnect() end)
		S.conns.controlKeyC = nil
	end
	if S.conns.controlKeyK then
		pcall(function() S.conns.controlKeyK:Disconnect() end)
		S.conns.controlKeyK = nil
	end
	if not S.toggles.controlBindC then
		if not quiet then _V556c1dc412c(HUB_NAME, _Vzd({98,69,135,142,147,137,69,148,139,139}), 1) end
		return
	end
	pcall(function()
		ContextActionService:BindActionAtPriority(
			_Vzd({215,208,202,197,219,224,196,240,239,245,243,240,237,196}),
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
				_V0bcbf1fe1dc()
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
		_V0bcbf1fe1dc()
	end)
	if not quiet then _V556c1dc412c(HUB_NAME, _Vzd({196,240,239,245,243,240,237,161,227,234,239,229,161,240,239,161,253,161,241,243,230,244,244,161,190}), 1) end
end
function _V1eca7650dd(on, quiet)
	_Vd3e2addedc(on, quiet)
end
local MASS = {}
local massGen = 0
do local _z4194=(3*6);if _z4194<0 and _Vj() then _z4194=_z4194+1 end local _y4194=_Vzd({77,86}) end

function _V0955b02b117(name)
	return MASS[name] == true
end
function _V11c729f31bd(id)
	local fn = S._toggleRenderers and S._toggleRenderers[id]
	if fn then pcall(fn) end
end
do local _z994=(4*3); if _z994<0 and _Vj() then _z994=_z994+1 end end
function _V3e8a04041b0(name)
	MASS[name] = false
	MASS[name .. _Vzd({224,232,230,239})] = -1
	S.toggles[_Vzd({238,226,244,244,224}) .. name] = false
	_V11c729f31bd(_Vzd({238,226,244,244,224}) .. name)
	local anyCam = MASS.bring or MASS.kick or MASS.kill or MASS.fling or MASS._V7e5dd05e13e or MASS.fire or MASS.vomit
	if not anyCam then _V176fd8761f6() end
end
function _Veb072dac88(nameSub)
	nameSub = tostring(nameSub or ""):lower()
	local folder = workspace:FindFirstChild(LP.Name .. _Vzd({212,241,226,248,239,230,229,202,239,213,240,250,244}))
	local roots = { folder, workspace }
	for _, root in ipairs(roots) do
		if root then
			for _, m in ipairs(root:GetDescendants()) do
				if m:IsA(_Vzd({114,148,137,138,145})) and m.Name:lower():find(nameSub, 1, true) then
					local pp = m.PrimaryPart or m:FindFirstChildWhichIsA(_Vzd({195,226,244,230,209,226,243,245}), true)
					if pp then return m, pp end
				end
			end
		end
	end
	return nil, nil
end
function _Vb10ea75e7c(toyName)
	local m, pp = _Veb072dac88(toyName)
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
		m, pp = _Veb072dac88(toyName)
		if m and pp then
			sno(pp)
			return m, pp
		end
	end
	return _Veb072dac88(toyName)
end
function _Veed92531133(model, primary)
	if not primary or not primary:IsA(_Vzd({195,226,244,230,209,226,243,245})) then return end
	local park = Vector3.new(math.random(-40, 40), 420 + math.random(0, 40), math.random(-40, 40))
	pcall(function()
		for _, d in ipairs(model:GetDescendants()) do
			if d:IsA(_Vzd({195,226,244,230,209,226,243,245})) then
				d.CanCollide = false
				d.Massless = true
			end
		end
		primary.Anchored = false
		primary.CFrame = CFrame.new(park)
		primary.AssemblyLinearVelocity = Vector3.zero
		primary.AssemblyAngularVelocity = Vector3.zero
		local bp = primary:FindFirstChild(_Vzd({215,208,202,197,219,224,212,245,226,245,246,244,209,226,243,236}))
		if not bp then
			bp = Instance.new(_Vzd({195,240,229,250,209,240,244,234,245,234,240,239}))
			bp.Name = _Vzd({215,208,202,197,219,224,212,245,226,245,246,244,209,226,243,236})
			bp.MaxForce = Vector3.new(1e12, 1e12, 1e12)
			bp.D = 2000
			bp.P = 50000
			bp.Parent = primary
		end
		bp.Position = park
	end)
end
local statusToyCache = {}
function _V83e3d178b9(toyName)
	local cached = statusToyCache[toyName]
	if cached and cached.model and cached.model.Parent and cached.primary and cached.primary.Parent then
		return cached.model, cached.primary, cached.tip
	end
	local model, primary = _Vb10ea75e7c(toyName)
	if not model or not primary then return nil, nil, nil end
	local tip = model:FindFirstChild(_Vzd({107,142,151,138,117,145,134,158,138,151,117,134,151,153}), true)
		or model:FindFirstChild(_Vzd({209,226,234,239,245,209,237,226,250,230,243,209,226,243,245}), true)
		or model:FindFirstChild(_Vzd({198,229,234,227,237,230,209,226,243,245}), true)
		or model:FindFirstChild(_Vzd({199,240,240,229,195,226,239,226,239,226}), true)
		or model:FindFirstChild(_Vzd({212,245,234,228,236,250,209,226,243,245}), true)
		or primary
	_Veed92531133(model, primary)
	statusToyCache[toyName] = { model = model, primary = primary, tip = tip }
	return model, primary, tip
end
do local _z6683=(6*8);if _z6683<0 and _Vj() then _z6683=_z6683+1 end local _y6683=_Vzd({46,82}) end

function _V4d7cfa8f1e0(part, targetRoot, hold)
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
			local model = targetRoot:FindFirstAncestorOfClass(_Vzd({206,240,229,230,237}))
			if model then
				for _, limb in ipairs(model:GetChildren()) do
					if limb:IsA(_Vzd({195,226,244,230,209,226,243,245})) then
						pcall(function()
							firetouchinterest(part, limb, 0)
						end)
					end
				end
				task.wait(hold)
				for _, limb in ipairs(model:GetChildren()) do
					if limb:IsA(_Vzd({195,226,244,230,209,226,243,245})) then
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
function _V5c9d69a71e1(toyName, targetRoot)
	if not targetRoot then return end
	local model, primary, tip = _V83e3d178b9(toyName)
	if not model or not primary then return end
	tip = tip or primary
	pcall(function()
		if tip ~= primary then
			local home = primary.Position
			_V4d7cfa8f1e0(tip, targetRoot, 0.1)
			pcall(function() tip.CFrame = CFrame.new(home) end)
		else
			local home = primary.CFrame
			_V4d7cfa8f1e0(primary, targetRoot, 0.1)
			primary.CFrame = home
		end
		_Veed92531133(model, primary)
	end)
end
local poisonHurtCache = nil
do local _z598=(3*9); if _z598<0 and _Vj() then _z598=_z598+1 end end
function _Va5291902b8()
	if poisonHurtCache then
		local ok = true
		for _, p in ipairs(poisonHurtCache) do
			if not p or not p.Parent then ok = false break end
		end
		if ok then return poisonHurtCache end
	end
	local list = {}
	pcall(function()
		local map = workspace:FindFirstChild(_Vzd({206,226,241}))
		if not map then return end
		local paths = {
			{ _Vzd({201,240,237,230}), _Vzd({209,240,234,244,240,239,195,234,232,201,240,237,230}), _Vzd({209,240,234,244,240,239,201,246,243,245,209,226,243,245}) },
			{ _Vzd({201,240,237,230}), _Vzd({209,240,234,244,240,239,212,238,226,237,237,201,240,237,230}), _Vzd({209,240,234,244,240,239,201,246,243,245,209,226,243,245}) },
			{ _Vzd({199,226,228,245,240,243,250,202,244,237,226,239,229}), _Vzd({209,240,234,244,240,239,196,240,239,245,226,234,239,230,243}), _Vzd({117,148,142,152,148,147,109,154,151,153,117,134,151,153}) },
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
				if d.Name == _Vzd({117,148,142,152,148,147,109,154,151,153,117,134,151,153}) and d:IsA(_Vzd({103,134,152,138,117,134,151,153})) then
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
function _Vc83fb00d1f(targetRoot)
	if not targetRoot then return end
	local head = targetRoot
	local model = targetRoot:FindFirstAncestorOfClass(_Vzd({206,240,229,230,237}))
	if model then
		head = model:FindFirstChild(_Vzd({201,230,226,229})) or targetRoot
	end
	if not head then return end
	local hurts = _Va5291902b8()
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
function _Vc98281101e(targetRoot)
	if not targetRoot then return end
	local paint = nil
	pcall(function()
		local map = workspace:FindFirstChild(_Vzd({206,226,241}))
		local always = map and map:FindFirstChild(_Vzd({102,145,156,134,158,152,109,138,151,138,121,156,138,138,147,138,137,116,135,143,138,136,153,152}))
		local ufo = always and always:FindFirstChild(_Vzd({208,246,245,230,243,214,199,208}))
		if ufo then
			paint = ufo:FindFirstChild(_Vzd({209,226,234,239,245,209,237,226,250,230,243,209,226,243,245}), true)
		end
		if not paint and map then
			paint = map:FindFirstChild(_Vzd({209,226,234,239,245,209,237,226,250,230,243,209,226,243,245}), true)
		end
	end)
	if paint and paint:IsA(_Vzd({195,226,244,230,209,226,243,245})) then
		pcall(function()
			paint.Anchored = true
			paint.CanCollide = false
			paint.Transparency = 1
			paint.Size = Vector3.new(2, 2, 2)
			local wc = paint:FindFirstChildOfClass(_Vzd({216,230,237,229,196,240,239,244,245,243,226,234,239,245}))
			if wc then wc.Enabled = false end
			paint.CFrame = targetRoot.CFrame
			task.wait(0.05)
			paint.CFrame = CFrame.new(0, -50, 0)
		end)
		return true
	end
	return false
end
do local _z5031=(3*8);if _z5031<0 and _Vj() then _z5031=_z5031+1 end local _y5031=_Vzd({79,54}) end

function _V003181948f(p)
	if not p or not _Vd6eb72811f9(p) then return false end
	local r = _Vb2220e5a155(p)
	if not r then return false end
	local me = hrp()
	if not me then return false end
	local model, primary, tip = _V83e3d178b9(_Vzd({196,226,238,241,231,234,243,230}))
	if not model or not primary then return false end
	tip = model:FindFirstChild(_Vzd({199,234,243,230,209,237,226,250,230,243,209,226,243,245})) or tip
	if not tip or not tip:IsA(_Vzd({103,134,152,138,117,134,151,153})) then return false end
	sno(tip, r.Position)
	sno(tip, me.Position)
	pcall(function() tip.Size = Vector3.new(3, 3, 3) end)
	pcall(function()
		local homePos = primary.Position
		primary.CFrame = CFrame.new(me.Position + Vector3.new(0, 500, 0))
		tip.CFrame = r.CFrame
		tip.AssemblyLinearVelocity = Vector3.zero
		if firetouchinterest then
			local model2 = r:FindFirstAncestorOfClass(_Vzd({206,240,229,230,237}))
			if model2 then
				for _, limb in ipairs(model2:GetChildren()) do
					if limb:IsA(_Vzd({195,226,244,230,209,226,243,245})) then
						pcall(function() firetouchinterest(tip, limb, 0) end)
					end
				end
				task.wait(0.08)
				for _, limb in ipairs(model2:GetChildren()) do
					if limb:IsA(_Vzd({103,134,152,138,117,134,151,153})) then
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
		_Veed92531133(model, primary)
	end)
	return true
end
function _Vfb0808ef21(kind, p)
	if not p or not _Vd6eb72811f9(p) then return false end
	if _V318f2ee5f3(p) and not plotBypass then
		if S.toggles.plotAmbush ~= false then
			plotWatch[p.UserId] = { kind = _Vzd({232,243,226,227}), quiet = true }
		end
		return false
	end
	local r = _Vb2220e5a155(p)
	if not r then return false end
	local head = p.Character and (p.Character:FindFirstChild(_Vzd({201,230,226,229})) or r) or r
	if kind == _Vzd({231,234,243,230}) then
		local model, primary, tip = _V83e3d178b9(_Vzd({196,226,238,241,231,234,243,230}))
		if tip and tip:IsA(_Vzd({195,226,244,230,209,226,243,245})) then
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
				if primary then _Veed92531133(model, primary) end
			end)
		else
			_V5c9d69a71e1(_Vzd({104,134,146,149,139,142,151,138}), r)
		end
		return true
	elseif kind == _Vzd({227,226,239,226,239,226}) then
		_V5c9d69a71e1(_Vzd({199,240,240,229,195,226,239,226,239,226}), r)
		return true
	elseif kind == _Vzd({149,148,142,152,148,147}) then
		_Vc83fb00d1f(head)
		return true
	elseif kind == _Vzd({241,226,234,239,245}) then
		if not _Vc98281101e(r) then
			_V5c9d69a71e1(_Vzd({212,241,243,226,250}), r)
		end
		return true
	end
	return false
end
function _Vbada9a16173(name, on, runner)
	if not on then
		MASS[name] = false
		MASS[name .. _Vzd({224,232,230,239})] = -1
		S.toggles[_Vzd({238,226,244,244,224}) .. name] = false
		_V11c729f31bd(_Vzd({238,226,244,244,224}) .. name)
		if S._activeMassKind == name then S._activeMassKind = nil end
	if name == _Vzd({229,230,244,245,243,240,250,212,243,247}) then
		S.toggles.destroyServer = false
		S.toggles.blobDestroyServer = false
		pcall(function() _Vc6f37d5c146(true) end)
	end
		local anyCam = MASS.bring or MASS.kick or MASS.kill or MASS.fling or MASS._V7e5dd05e13e or MASS.fire or MASS.vomit
		if not anyCam then _V176fd8761f6() end
		return
	end
	massGen += 1
	local gen = massGen
	MASS[name] = true
	MASS[name .. _Vzd({224,232,230,239})] = gen
	S.toggles[_Vzd({146,134,152,152,132}) .. name] = true
	if name == _Vzd({229,230,244,245,243,240,250,212,243,247}) then
		S.toggles.destroyServer = true
		S.toggles.blobDestroyServer = true
		_V6eb75622116(true)
		_V8699b7ef19c()
	end
	_V11c729f31bd(_Vzd({238,226,244,244,224}) .. name)
	S._activeMassKind = (name == _Vzd({231,237,234,239,232}) and _Vzd({231,237,234,239,232}))
		or (name == _Vzd({236,234,237,237}) and _Vzd({236,234,237,237}))
		or (name == _Vzd({236,234,228,236}) and _Vzd({236,234,228,236}))
		or (name == _Vzd({227,243,234,239,232}) and _Vzd({227,243,234,239,232}))
		or (name == _Vzd({243,226,232,229,240,237,237}) and _Vzd({243,226,232,229,240,237,237}))
		or (name == _Vzd({231,234,243,230}) and _Vzd({231,234,243,230}))
		or (name == _Vzd({247,240,238,234,245}) and _Vzd({247,240,238,234,245}))
		or _Vzd({232,243,226,227})
	task.spawn(function()
		local ok, err = pcall(function()
			runner(function()
				return MASS[name] == true and MASS[name .. _Vzd({224,232,230,239})] == gen
			end)
		end)
		if not ok then
			warn(_Vzd({220,215,208,202,197,219,222,161,238,226,244,244}), name, err)
		end
		if MASS[name .. _Vzd({224,232,230,239})] == gen then
			MASS[name] = false
			S.toggles[_Vzd({146,134,152,152,132}) .. name] = false
			_V11c729f31bd(_Vzd({238,226,244,244,224}) .. name)
		end
		if S._activeMassKind == name or S._activeMassKind == _Vzd({139,145,142,147,140}) or S._activeMassKind == _Vzd({236,234,237,237}) then
			if not (MASS.fling or MASS.kill or MASS.kick or MASS.bring or MASS._V7e5dd05e13e or MASS.fire or MASS.vomit) then
				S._activeMassKind = nil
			end
		end
		local anyCam = MASS.bring or MASS.kick or MASS.kill or MASS.fling or MASS._V7e5dd05e13e or MASS.fire or MASS.vomit
		if not anyCam then _V176fd8761f6() end
	end)
end
function _V60122a2c119(keep)
	local me = hrp()
	if not me then _V556c1dc412c(HUB_NAME, _Vzd({207,240,161,228,233,226,243,226,228,245,230,243}), 2); return end
	local home = me.CFrame
	local homePos = home.Position
	local overview = CFrame._Ve5bf781e109(homePos + Vector3.new(-15, 22, 8), homePos)
	if workspace.CurrentCamera then workspace.CurrentCamera.CFrame = overview end
	_V9bf45a38aa(overview)
	_V556c1dc412c(HUB_NAME, _Vzd({195,243,234,239,232,161,194,237,237,161,208,207,161,253,161,237,240,240,241,234,239,232}), 2)
	while keep() do
		for _, p in ipairs(_Vce96e951d()) do
			if not keep() then break end
			if _Vd6eb72811f9(p) and p.Character then
				local r = _Vb2220e5a155(p)
				local h = p.Character:FindFirstChildOfClass(_Vzd({201,246,238,226,239,240,234,229}))
				local ragdolled = h and h:FindFirstChild(_Vzd({211,226,232,229,240,237,237,230,229}))
				if r and h then
					for _ = 0, 50 do
						if not keep() then break end
						if r.Position.Y <= -12 then
							_V41e966b01bf(CFrame.new(r.Position + Vector3.new(0, 5, -15)))
						else
							_V41e966b01bf(CFrame.new(r.Position + Vector3.new(0, -10, -10)))
						end
						sno(r, r.Position)
						_Vb07b7f02185(p, r.Position)
						if FTAP.CreateGrabLine then
							pcall(function()
								local t = p.Character and (p.Character:FindFirstChild(_Vzd({213,240,243,244,240})) or p.Character:FindFirstChild(_Vzd({214,241,241,230,243,213,240,243,244,240})) or r)
								if t then FTAP.CreateGrabLine:FireServer(t, t.CFrame) end
							end)
						end
						if _Veec038d8d2(r) then
							local isRagdolled = ragdolled and ragdolled.Value
							if not isRagdolled and (r.Position - homePos).Magnitude > 10 then
								r.CFrame = home
							end
							_Vb538a53863(r, home)
							break
						end
						task.wait()
					end
				end
			end
		end
		_V41e966b01bf(home)
		_V9bf45a38aa(overview)
		task.wait()
	end
	_V41e966b01bf(home)
	_V176fd8761f6()
	_V556c1dc412c(HUB_NAME, _Vzd({103,151,142,147,140,69,102,145,145,69,116,107,107}), 1.5)
end
do local _z642=(5*3); if _z642<0 and _Vj() then _z642=_z642+1 end end
function _V7cd25639120(keep)
	local home = hrp() and hrp().CFrame
	local overview = home and CFrame._Ve5bf781e109(home.Position + Vector3.new(-15, 22, 8), home.Position) or CFrame.new(0, 50, 0)
	if home then _V9bf45a38aa(overview) end
	_V556c1dc412c(HUB_NAME, _Vzd({204,234,228,236,161,194,237,237,161,208,207,161,253,161,237,240,240,241,234,239,232}), 2)
	while keep() do
		home = hrp() and hrp().CFrame or home
		for _, p in ipairs(_Vce96e951d()) do
			if not keep() then break end
			local r = _Vb2220e5a155(p)
			if r then
				for _ = 0, 50 do
					if not keep() then break end
					if r.Position.Y <= -12 then
						_V41e966b01bf(CFrame.new(r.Position + Vector3.new(0, 5, -15)))
					else
						_V41e966b01bf(CFrame.new(r.Position + Vector3.new(0, -10, -10)))
					end
					sno(r, r.Position)
					_Vb07b7f02185(p, r.Position)
					if _Veec038d8d2(r) or r.AssemblyLinearVelocity.Magnitude > 500 then
						_Vc9836fec182(r)
						_V07a307c766(r)
						_V7186e37c24(r, 22000, 0.1)
						break
					end
					task.wait()
				end
			end
		end
		if home then _V41e966b01bf(home) end
		task.wait(0.15)
	end
	if home then _V41e966b01bf(home) end
	_V176fd8761f6()
	_V556c1dc412c(HUB_NAME, _Vzd({204,234,228,236,161,194,237,237,161,208,199,199}), 1.5)
end
function _V07ffe7d2122(keep)
	local home = hrp() and hrp().CFrame
	local overview = home and CFrame._Ve5bf781e109(home.Position + Vector3.new(-15, 22, 8), home.Position) or CFrame.new(0, 50, 0)
	if home then _V9bf45a38aa(overview) end
	_V556c1dc412c(HUB_NAME, _Vzd({204,234,237,237,161,194,237,237,161,208,207,161,253,161,237,240,240,241,234,239,232}), 2)
	while keep() do
		home = hrp() and hrp().CFrame or home
		for _, p in ipairs(_Vce96e951d()) do
			if not keep() then break end
			local r = _Vb2220e5a155(p)
			local h = p.Character and p.Character:FindFirstChildOfClass(_Vzd({109,154,146,134,147,148,142,137}))
			if r and h then
				for _ = 0, 50 do
					if not keep() then break end
					sno(r, r.Position)
					if not keep() then break end
					if _Veec038d8d2(r) or r.AssemblyLinearVelocity.Magnitude > 500 then
						_Vc9836fec182(r)
						_V07a307c766(r)
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
						_V41e966b01bf(CFrame.new(r.Position + Vector3.new(0, 5, -15)))
					else
						_V41e966b01bf(CFrame.new(r.Position + Vector3.new(0, -10, -10)))
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
		if home then _V41e966b01bf(home) end
		task.wait(0.2)
	end
	if home then _V41e966b01bf(home) end
	_V176fd8761f6()
	_V556c1dc412c(HUB_NAME, _Vzd({204,234,237,237,161,194,237,237,161,208,199,199}), 1.5)
end
function _V62d9688b11d(keep)
	local home = hrp() and hrp().CFrame
	local overview = home and CFrame._Ve5bf781e109(home.Position + Vector3.new(-15, 22, 8), home.Position) or CFrame.new(0, 50, 0)
	if home then _V9bf45a38aa(overview) end
	_V556c1dc412c(HUB_NAME, _Vzd({107,145,142,147,140,69,102,145,145,69,116,115,69,161,69,145,148,148,149,142,147,140}), 2)
	while keep() do
		home = hrp() and hrp().CFrame or home
		for _, p in ipairs(_Vce96e951d()) do
			if not keep() then break end
			local r = _Vb2220e5a155(p)
			if r then
				for _ = 0, 50 do
					if not keep() then break end
					if r.Position.Y <= -12 then
						_V41e966b01bf(CFrame.new(r.Position + Vector3.new(0, 5, -15)))
					else
						_V41e966b01bf(CFrame.new(r.Position + Vector3.new(0, -10, -10)))
					end
					sno(r, r.Position)
					_Vb07b7f02185(p, r.Position)
					if _Veec038d8d2(r) or r.AssemblyLinearVelocity.Magnitude > 500 then
						_Vc9836fec182(r)
						_V07a307c766(r)
						local power = S.flingPower or 8000
						_V7186e37c24(r, power, 0.55)
						for _, part in ipairs(p.Character:GetChildren()) do
							if part:IsA(_Vzd({195,226,244,230,209,226,243,245})) then _V7186e37c24(part, power * 0.9, 0.4) end
						end
						break
					end
					task.wait()
				end
			end
		end
		if home then _V41e966b01bf(home) end
		task.wait(0.15)
	end
	if home then _V41e966b01bf(home) end
	_V176fd8761f6()
	_V556c1dc412c(HUB_NAME, _Vzd({199,237,234,239,232,161,194,237,237,161,208,199,199}), 1.5)
end
function _Vc1dd839f125(keep)
	local home = hrp() and hrp().CFrame
	local overview = home and CFrame._Ve5bf781e109(home.Position + Vector3.new(-15, 22, 8), home.Position) or CFrame.new(0, 50, 0)
	if home then _V9bf45a38aa(overview) end
	_V556c1dc412c(HUB_NAME, _Vzd({211,226,232,229,240,237,237,161,194,237,237,161,208,207,161,253,161,237,240,240,241,234,239,232}), 2)
	local model, primary = _Vb10ea75e7c(_Vzd({107,148,148,137,103,134,147,134,147,134}))
	if not model or not primary then
		_V556c1dc412c(HUB_NAME, _Vzd({199,226,234,237,230,229,161,245,240,161,244,241,226,248,239,161,199,240,240,229,195,226,239,226,239,226}), 2)
		return
	end
	local peel = nil
	for _, d in ipairs(model:GetDescendants()) do
		if d.Name == _Vzd({195,226,239,226,239,226,209,230,230,237}) and d:FindFirstChildOfClass(_Vzd({213,240,246,228,233,213,243,226,239,244,238,234,245,245,230,243})) then
			peel = d
			break
		end
	end
	if not peel then
		_V556c1dc412c(HUB_NAME, _Vzd({196,240,246,237,229,161,239,240,245,161,231,234,239,229,161,195,226,239,226,239,226,209,230,230,237,161,241,226,243,245}), 2)
		return
	end
	peel.Size = Vector3.new(2, 2, 2)
	peel.Transparency = 1
	peel.CanCollide = false
	pcall(function()
		for _, d in ipairs(model:GetDescendants()) do
			if d:IsA(_Vzd({195,226,244,230,209,226,243,245})) then d.CanCollide = false end
		end
		local ao = primary:FindFirstChildOfClass(_Vzd({194,237,234,232,239,208,243,234,230,239,245,226,245,234,240,239}))
		if ao then ao.Enabled = false end
	end)
	local head = LP.Character and LP.Character:FindFirstChild(_Vzd({201,230,226,229}))
	local parkY = head and (head.Position.Y + 500) or 500
	local bp = primary:FindFirstChild(_Vzd({215,208,202,197,219,224,211,226,232,229,240,237,237,209,226,243,236}))
	if not bp then
		bp = Instance.new(_Vzd({195,240,229,250,209,240,244,234,245,234,240,239}))
		bp.Name = _Vzd({215,208,202,197,219,224,211,226,232,229,240,237,237,209,226,243,236})
		bp.MaxForce = Vector3.new(12500, 12500, 12500)
		bp.P = 12500
		bp.Parent = primary
	end
	bp.Position = Vector3.new(0, parkY, 0)
	sno(primary)
	while keep() do
		for _, p in ipairs(_Vce96e951d()) do
			if not keep() then break end
			local r = _Vb2220e5a155(p)
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
	_V176fd8761f6()
	_V556c1dc412c(HUB_NAME, _Vzd({211,226,232,229,240,237,237,161,194,237,237,161,208,199,199}), 1.5)
end
function _Vbdabb06b11b(keep)
	local home = hrp() and hrp().CFrame
	local overview = home and CFrame._Ve5bf781e109(home.Position + Vector3.new(-15, 22, 8), home.Position) or CFrame.new(0, 50, 0)
	if home then _V9bf45a38aa(overview) end
	_V556c1dc412c(HUB_NAME, _Vzd({199,234,243,230,161,194,237,237,161,208,207,161,253,161,237,240,240,241,234,239,232}), 2)
	local model, primary = _Vb10ea75e7c(_Vzd({196,226,238,241,231,234,243,230}))
	if not model or not primary then
		_V556c1dc412c(HUB_NAME, _Vzd({199,226,234,237,230,229,161,245,240,161,244,241,226,248,239,161,196,226,238,241,231,234,243,230}), 2)
		return
	end
	local firePart = model:FindFirstChild(_Vzd({199,234,243,230,209,237,226,250,230,243,209,226,243,245}), true)
	if not firePart then
		_V556c1dc412c(HUB_NAME, _Vzd({104,148,154,145,137,69,147,148,153,69,139,142,147,137,69,107,142,151,138,117,145,134,158,138,151,117,134,151,153}), 2)
		return
	end
	firePart.Size = Vector3.new(2, 2, 2)
	firePart.CanCollide = false
	pcall(function()
		for _, d in ipairs(model:GetDescendants()) do
			if d:IsA(_Vzd({195,226,244,230,209,226,243,245})) then d.CanCollide = false end
		end
		local ao = primary:FindFirstChildOfClass(_Vzd({194,237,234,232,239,208,243,234,230,239,245,226,245,234,240,239}))
		if ao then ao.Enabled = false end
	end)
	local head = LP.Character and LP.Character:FindFirstChild(_Vzd({201,230,226,229}))
	local parkY = head and (head.Position.Y + 500) or 500
	local bp = primary:FindFirstChild(_Vzd({215,208,202,197,219,224,199,234,243,230,209,226,243,236}))
	if not bp then
		bp = Instance.new(_Vzd({195,240,229,250,209,240,244,234,245,234,240,239}))
		bp.Name = _Vzd({215,208,202,197,219,224,199,234,243,230,209,226,243,236})
		bp.MaxForce = Vector3.new(12500, 12500, 12500)
		bp.P = 12500
		bp.Parent = primary
	end
	bp.Position = Vector3.new(0, parkY, 0)
	sno(primary)
	while keep() do
		for _, p in ipairs(_Vce96e951d()) do
			if not keep() then break end
			local r = _Vb2220e5a155(p)
			if r and _Vd6eb72811f9(r) then
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
	_V176fd8761f6()
	_V556c1dc412c(HUB_NAME, _Vzd({199,234,243,230,161,194,237,237,161,208,199,199}), 1.5)
end
do local _z9281=(10*3);if _z9281<0 and _Vj() then _z9281=_z9281+1 end local _y9281=_Vzd({40,70}) end

function _V86fbf038118(keep)
	_V556c1dc412c(HUB_NAME, _Vzd({103,134,147,134,147,134,69,102,145,145,69,116,115,69,161,69,153,148,158,69,148,147,145,158,69,77,158,148,154,69,152,153,134,158,69,149,154,153,78}), 2)
	_V83e3d178b9(_Vzd({199,240,240,229,195,226,239,226,239,226}))
	while keep() do
		for _, p in ipairs(_Vce96e951d()) do
			if not keep() then break end
			_Veb5a36521fa(p, 10)
			_Vfb0808ef21(_Vzd({227,226,239,226,239,226}), p)
			task.wait(0.04)
		end
		task.wait(0.08)
	end
	_V556c1dc412c(HUB_NAME, _Vzd({103,134,147,134,147,134,69,102,145,145,69,116,107,107}), 1.5)
end
function _V0077b060124(keep)
	_V556c1dc412c(HUB_NAME, _Vzd({117,134,142,147,153,69,102,145,145,69,116,115,69,161,69,149,134,142,147,153,69,149,134,151,153,69,148,147,145,158,69,77,158,148,154,69,152,153,134,158,69,149,154,153,78}), 2)
	while keep() do
		for _, p in ipairs(_Vce96e951d()) do
			if not keep() then break end
			_Veb5a36521fa(p, 10)
			_Vfb0808ef21(_Vzd({241,226,234,239,245}), p)
			task.wait(0.04)
		end
		task.wait(0.08)
	end
	_V556c1dc412c(HUB_NAME, _Vzd({209,226,234,239,245,161,194,237,237,161,208,199,199}), 1.5)
end
function _V3b656d7290()
	_Vbada9a16173(_Vzd({231,237,234,239,232}), true, _V62d9688b11d)
end
function _V2f3ca0bc36()
	_Vbada9a16173(_Vzd({135,151,142,147,140}), true, _V60122a2c119)
end
do local _z9252=(4*9);if _z9252<0 and _Vj() then _z9252=_z9252+1 end local _y9252=_Vzd({82,52}) end

function _V18cb07dc103()
	_Vbada9a16173(_Vzd({236,234,228,236}), true, _V7cd25639120)
end
do local _z406=(9*8); if _z406<0 and _Vj() then _z406=_z406+1 end end
function _Vd916cac513f()
	_Vbada9a16173(_Vzd({243,226,232,229,240,237,237}), true, _Vc1dd839f125)
end
do local _z4923=(3*6);if _z4923<0 and _Vj() then _z4923=_z4923+1 end local _y4923=_Vzd({40,47}) end

function _V823f4f29123()
	local home = hrp() and hrp().CFrame
	if not home then _V556c1dc412c(HUB_NAME, _Vzd({207,240,161,228,233,226,243,226,228,245,230,243}), 2); return end
	_V556c1dc412c(HUB_NAME, _Vzd({204,234,237,237,161,194,237,237,161,253,161,240,239,230,174,244,233,240,245}), 1.5)
	for _, p in ipairs(_Vce96e951d()) do
		local r = _Vb2220e5a155(p)
		local h = p.Character and p.Character:FindFirstChildOfClass(_Vzd({201,246,238,226,239,240,234,229}))
		if r and h then
			for _ = 0, 50 do
				sno(r, r.Position)
				if _Veec038d8d2(r) or r.AssemblyLinearVelocity.Magnitude > 500 then
					_Vc9836fec182(r)
					_V07a307c766(r)
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
					_V41e966b01bf(CFrame.new(r.Position + Vector3.new(0, 5, -15)))
				else
					_V41e966b01bf(CFrame.new(r.Position + Vector3.new(0, -10, -10)))
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
	if home then _V41e966b01bf(home) end
	_V556c1dc412c(HUB_NAME, _Vzd({204,234,237,237,161,194,237,237,161,253,161,229,240,239,230}), 1.5)
end
function _V3959718f11f()
	local home = hrp() and hrp().CFrame
	if not home then _V556c1dc412c(HUB_NAME, _Vzd({207,240,161,228,233,226,243,226,228,245,230,243}), 2); return end
	_V556c1dc412c(HUB_NAME, _Vzd({213,233,243,240,248,161,194,237,237,161,253,161,240,239,230,174,244,233,240,245}), 1.5)
	for _, p in ipairs(_Vce96e951d()) do
		local r = _Vb2220e5a155(p)
		if r then
			if r.Position.Y <= -12 then
				_V41e966b01bf(CFrame.new(r.Position + Vector3.new(0, 5, -15)))
			else
				_V41e966b01bf(CFrame.new(r.Position + Vector3.new(0, -10, -10)))
			end
			sno(r, r.Position)
			if _Veec038d8d2(r) or r.AssemblyLinearVelocity.Magnitude > 500 then
				_Vc9836fec182(r)
				_V07a307c766(r)
				local power = S.flingPower or 8000
				_V7186e37c24(r, power, 0.55)
				for _, part in ipairs(p.Character:GetChildren()) do
					if part:IsA(_Vzd({195,226,244,230,209,226,243,245})) then _V7186e37c24(part, power * 0.9, 0.4) end
				end
			end
		end
	end
	if home then _V41e966b01bf(home) end
	_V556c1dc412c(HUB_NAME, _Vzd({213,233,243,240,248,161,194,237,237,161,253,161,229,240,239,230}), 1.5)
end
do local _z7033=(11*12);if _z7033<0 and _Vj() then _z7033=_z7033+1 end local _y7033=_Vzd({67,55}) end

function _Vbdc3224d121()
	local home = hrp() and hrp().CFrame
	if not home then _V556c1dc412c(HUB_NAME, _Vzd({207,240,161,228,233,226,243,226,228,245,230,243}), 2); return end
	_V556c1dc412c(HUB_NAME, _Vzd({204,234,228,236,161,194,237,237,161,253,161,240,239,230,174,244,233,240,245}), 1.5)
	for _, p in ipairs(_Vce96e951d()) do
		local r = _Vb2220e5a155(p)
		if r then
			if r.Position.Y <= -12 then
				_V41e966b01bf(CFrame.new(r.Position + Vector3.new(0, 5, -15)))
			else
				_V41e966b01bf(CFrame.new(r.Position + Vector3.new(0, -10, -10)))
			end
			sno(r, r.Position)
			if _Veec038d8d2(r) or r.AssemblyLinearVelocity.Magnitude > 500 then
				_Vc9836fec182(r)
				_V07a307c766(r)
				_V7186e37c24(r, 22000, 0.1)
			end
		end
	end
	if home then _V41e966b01bf(home) end
	_V556c1dc412c(HUB_NAME, _Vzd({204,234,228,236,161,194,237,237,161,253,161,229,240,239,230}), 1.5)
end
do local _z780=(7*7); if _z780<0 and _Vj() then _z780=_z780+1 end end
function _V78904c0a11a()
	local me = hrp()
	if not me then _V556c1dc412c(HUB_NAME, _Vzd({115,148,69,136,141,134,151,134,136,153,138,151}), 2); return end
	local home = me.CFrame
	local homePos = home.Position
	_V556c1dc412c(HUB_NAME, _Vzd({195,243,234,239,232,161,194,237,237,161,253,161,240,239,230,174,244,233,240,245}), 1.5)
	for _, p in ipairs(_Vce96e951d()) do
		local r = _Vb2220e5a155(p)
		local h = p.Character and p.Character:FindFirstChildOfClass(_Vzd({201,246,238,226,239,240,234,229}))
		local ragdolled = h and h:FindFirstChild(_Vzd({211,226,232,229,240,237,237,230,229}))
		if r and h then
			for _ = 0, 50 do
				if r.Position.Y <= -12 then
					_V41e966b01bf(CFrame.new(r.Position + Vector3.new(0, 5, -15)))
				else
					_V41e966b01bf(CFrame.new(r.Position + Vector3.new(0, -10, -10)))
				end
				sno(r, r.Position)
				_Vb07b7f02185(p, r.Position)
				if FTAP.CreateGrabLine then
					pcall(function()
						local t = p.Character and (p.Character:FindFirstChild(_Vzd({213,240,243,244,240})) or p.Character:FindFirstChild(_Vzd({214,241,241,230,243,213,240,243,244,240})) or r)
						if t then FTAP.CreateGrabLine:FireServer(t, t.CFrame) end
					end)
				end
				if _Veec038d8d2(r) then
					local isRagdolled = ragdolled and ragdolled.Value
					if not isRagdolled and (r.Position - homePos).Magnitude > 10 then
						r.CFrame = home
					end
					_Vb538a53863(r, home)
					break
				end
				task.wait()
			end
		end
	end
	if home then _V41e966b01bf(home) end
	_V556c1dc412c(HUB_NAME, _Vzd({195,243,234,239,232,161,194,237,237,161,253,161,229,240,239,230}), 1.5)
end
function _V2023d8c5126()
	local model, primary = _Vb10ea75e7c(_Vzd({199,240,240,229,195,226,239,226,239,226}))
	if not model or not primary then _V556c1dc412c(HUB_NAME, _Vzd({107,134,142,145,138,137,69,153,148,69,152,149,134,156,147,69,107,148,148,137,103,134,147,134,147,134}), 2); return end
	local peel = nil
	for _, d in ipairs(model:GetDescendants()) do
		if d.Name == _Vzd({195,226,239,226,239,226,209,230,230,237}) and d:FindFirstChildOfClass(_Vzd({213,240,246,228,233,213,243,226,239,244,238,234,245,245,230,243})) then
			peel = d; break
		end
	end
	if not peel then _V556c1dc412c(HUB_NAME, _Vzd({196,240,246,237,229,161,239,240,245,161,231,234,239,229,161,195,226,239,226,239,226,209,230,230,237}), 2); return end
	peel.Size = Vector3.new(2, 2, 2); peel.Transparency = 1; peel.CanCollide = false
	pcall(function()
		for _, d in ipairs(model:GetDescendants()) do
			if d:IsA(_Vzd({195,226,244,230,209,226,243,245})) then d.CanCollide = false end
		end
		local ao = primary:FindFirstChildOfClass(_Vzd({194,237,234,232,239,208,243,234,230,239,245,226,245,234,240,239}))
		if ao then ao.Enabled = false end
	end)
	local head = LP.Character and LP.Character:FindFirstChild(_Vzd({201,230,226,229}))
	local parkY = head and (head.Position.Y + 500) or 500
	local bp = primary:FindFirstChild(_Vzd({215,208,202,197,219,224,211,226,232,229,240,237,237,209,226,243,236}))
	if not bp then
		bp = Instance.new(_Vzd({195,240,229,250,209,240,244,234,245,234,240,239})); bp.Name = _Vzd({215,208,202,197,219,224,211,226,232,229,240,237,237,209,226,243,236})
		bp.MaxForce = Vector3.new(12500, 12500, 12500); bp.P = 12500; bp.Parent = primary
	end
	bp.Position = Vector3.new(0, parkY, 0); sno(primary)
	_V556c1dc412c(HUB_NAME, _Vzd({119,134,140,137,148,145,145,69,102,145,145,69,161,69,148,147,138,82,152,141,148,153}), 1.5)
	for _, p in ipairs(_Vce96e951d()) do
		local r = _Vb2220e5a155(p)
		if r then
			pcall(function()
				sno(peel, r.Position); peel.Position = r.Position
				task.wait(); peel.Position = primary.Position
			end)
		end
		task.wait(0.05)
	end
	pcall(function() peel.Position = primary.Position end)
	_V556c1dc412c(HUB_NAME, _Vzd({211,226,232,229,240,237,237,161,194,237,237,161,253,161,229,240,239,230}), 1.5)
end
function _V17ae139311c()
	local model, primary = _Vb10ea75e7c(_Vzd({196,226,238,241,231,234,243,230}))
	if not model or not primary then _V556c1dc412c(HUB_NAME, _Vzd({199,226,234,237,230,229,161,245,240,161,244,241,226,248,239,161,196,226,238,241,231,234,243,230}), 2); return end
	local firePart = model:FindFirstChild(_Vzd({199,234,243,230,209,237,226,250,230,243,209,226,243,245}), true)
	if not firePart then _V556c1dc412c(HUB_NAME, _Vzd({104,148,154,145,137,69,147,148,153,69,139,142,147,137,69,107,142,151,138,117,145,134,158,138,151,117,134,151,153}), 2); return end
	firePart.Size = Vector3.new(2, 2, 2); firePart.CanCollide = false
	pcall(function()
		for _, d in ipairs(model:GetDescendants()) do
			if d:IsA(_Vzd({195,226,244,230,209,226,243,245})) then d.CanCollide = false end
		end
		local ao = primary:FindFirstChildOfClass(_Vzd({194,237,234,232,239,208,243,234,230,239,245,226,245,234,240,239}))
		if ao then ao.Enabled = false end
	end)
	local head = LP.Character and LP.Character:FindFirstChild(_Vzd({201,230,226,229}))
	local parkY = head and (head.Position.Y + 500) or 500
	local bp = primary:FindFirstChild(_Vzd({215,208,202,197,219,224,199,234,243,230,209,226,243,236}))
	if not bp then
		bp = Instance.new(_Vzd({195,240,229,250,209,240,244,234,245,234,240,239})); bp.Name = _Vzd({215,208,202,197,219,224,199,234,243,230,209,226,243,236})
		bp.MaxForce = Vector3.new(12500, 12500, 12500); bp.P = 12500; bp.Parent = primary
	end
	bp.Position = Vector3.new(0, parkY, 0); sno(primary)
	_V556c1dc412c(HUB_NAME, _Vzd({195,246,243,239,161,194,237,237,161,253,161,240,239,230,174,244,233,240,245}), 1.5)
	for _, p in ipairs(_Vce96e951d()) do
		local r = _Vb2220e5a155(p)
		if r and _Vd6eb72811f9(r) then
			pcall(function()
				sno(firePart, r.Position); firePart.Position = r.Position
				task.wait(); firePart.Position = primary.Position
			end)
		end
		task.wait(0.05)
	end
	pcall(function() firePart.Position = primary.Position end)
	_V556c1dc412c(HUB_NAME, _Vzd({195,246,243,239,161,194,237,237,161,253,161,229,240,239,230}), 1.5)
end
local CRAZY_LINE_CF = CFrame.new(
	-0.12640380859375, 0.9606337547302246, -0.5000009536743164,
	0.9985212683677673, 0, -0.05436277016997337,
	-6.4805472099749295e-9, 1, -1.1903301100346653e-7,
	0.05436277016997337, 5.9604644775390625e-8, 0.9985212683677673
)
function _V4d27d6f61df(p)
	if not p or not p.Character then return nil end
	return p.Character:FindFirstChild(_Vzd({213,240,243,244,240}))
		or p.Character:FindFirstChild(_Vzd({214,241,241,230,243,213,240,243,244,240}))
		or p.Character:FindFirstChild(_Vzd({201,246,238,226,239,240,234,229,211,240,240,245,209,226,243,245}))
end
function _Ve57be27f106(keep)
	if not FTAP.CreateGrabLine and not FTAP.SetNetworkOwner then
		_V556c1dc412c(HUB_NAME, _Vzd({119,138,146,148,153,138,152,69,146,142,152,152,142,147,140,69,82,69,148,149,138,147,69,109,148,146,138,69,82,99,69,113,142,147,144,69,119,138,146,148,153,138,152}), 3)
		return
	end
	local intensity = math.clamp(tonumber(S.lagIntensity) or 150, 1, 500)
	_V556c1dc412c(HUB_NAME, _Vzd({205,226,232,161,212,230,243,247,230,243,161,208,207,161,213,233,234,244,161,212,240,238,230,161,195,246,237,237,244,233,234,245,161}) .. intensity, 2)
	while keep() do
		intensity = math.clamp(tonumber(S.lagIntensity) or 150, 1, 500)
		local waves = math.max(1, math.floor(intensity / 3))
		for _ = 1, waves do
			if not keep() then break end
			for _, p in ipairs(Players:GetPlayers()) do
				if p ~= LP and p.Character then
					local t = _V4d27d6f61df(p)
					local r = _Vb2220e5a155(p)
					if t and FTAP.CreateGrabLine then
						pcall(function() FTAP.CreateGrabLine:FireServer(t, t.CFrame) end)
						pcall(function() FTAP.CreateGrabLine:FireServer(t, CRAZY_LINE_CF) end)
					end
					if r then
						if FTAP.SetNetworkOwner then
							pcall(function()
								FTAP.SetNetworkOwner:FireServer(r, _Ve5bf781e109(r.Position + Vector3.new(0, 5, 0), r.Position))
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
	_V556c1dc412c(HUB_NAME, _Vzd({113,134,140,69,120,138,151,155,138,151,69,116,107,107,69,121,141,134,147,144,69,108,148,137}), 1.5)
end
function _V45b8055418e(keep)
	if not FTAP.CreateGrabLine then
		_V556c1dc412c(HUB_NAME, _Vzd({196,243,230,226,245,230,200,243,226,227,205,234,239,230,161,238,234,244,244,234,239,232}), 2)
		return
	end
	_V556c1dc412c(HUB_NAME, _Vzd({196,243,226,251,250,161,205,234,239,230,161,212,240,231,245,161,205,226,232,161,208,207,161,197,226,238,239,161,207,234,232,232,226}), 2)
	while keep() do
		for _, p in ipairs(Players:GetPlayers()) do
			if not keep() then break end
			if p ~= LP then
				local t = _V4d27d6f61df(p)
				if t then
					pcall(function()
						FTAP.CreateGrabLine:FireServer(t, CRAZY_LINE_CF)
					end)
				end
			end
		end
		task.wait()
	end
	_V556c1dc412c(HUB_NAME, _Vzd({212,240,231,245,161,205,226,232,161,208,199,199}), 1.5)
end
function _Vb6581536cf(keep)
	if not FTAP.CreateGrabLine then
		_V556c1dc412c(HUB_NAME, _Vzd({104,151,138,134,153,138,108,151,134,135,113,142,147,138,69,146,142,152,152,142,147,140}), 2)
		return
	end
	local intensity = math.clamp(tonumber(S.lagIntensity) or 150, 1, 400)
	_V556c1dc412c(HUB_NAME, _Vzd({109,134,151,137,69,113,134,140,69,116,115,69,121,141,142,152,69,120,148,146,138,69,119,138,134,145,69,103,154,145,145,152,141,142,153,69}) .. intensity, 3)
	while keep() do
		intensity = math.clamp(tonumber(S.lagIntensity) or 150, 1, 400)
		for _ = 1, math.max(1, math.floor(intensity / 2)) do
			if not keep() then break end
			for _, p in ipairs(Players:GetPlayers()) do
				if p ~= LP and p.Character then
					local t = _V4d27d6f61df(p)
					local r = _Vb2220e5a155(p)
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
	_V556c1dc412c(HUB_NAME, _Vzd({201,226,243,229,161,205,226,232,161,208,199,199}), 2)
end
local _V903a73872f, _V2d53f0c669, _Vd72e3cde68
function _V8134389211e(keep)
	_V556c1dc412c(HUB_NAME, _Vzd({107,145,142,147,140,69,115,138,134,151,135,158,69,116,135,143,138,136,153,152,69,116,115,69,109,138,145,145,69,126,138,134,141}), 2)
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
				if inst:IsA(_Vzd({195,226,244,230,209,226,243,245})) and not inst.Anchored then
					if myChar and inst:IsDescendantOf(myChar) then
					else
						local model = inst:FindFirstAncestorOfClass(_Vzd({206,240,229,230,237}))
						local plr = model and Players:GetPlayerFromCharacter(model)
						if not plr and (inst.Position - me.Position).Magnitude <= range then
							n += 1
							task.spawn(function()
								sno(inst, me.Position)
								_V7186e37c24(inst, power, 0.6)
							end)
						end
					end
				end
			end
		end
		task.wait(0.12)
	end
	_V556c1dc412c(HUB_NAME, _Vzd({199,237,234,239,232,161,240,227,235,230,228,245,244,161,208,199,199}), 1.5)
end
function _V94d865df20d(seconds)
	seconds = tonumber(seconds) or 30
	local me = hrp()
	if not me then return end
	local range = tonumber(S.auraRange) or 50
	local force = tonumber(S.grabZeroGForce) or 50000
	local myChar = LP.Character
	local myModel = myChar
	local applied = {}
	_V556c1dc412c(HUB_NAME, _Vzd({127,138,151,148,82,108,69,148,135,143,138,136,153,152,69}) .. seconds .. "s", 2)
	local function tryPart(inst)
		if #applied >= 50 then return end
		if not inst:IsA(_Vzd({195,226,244,230,209,226,243,245})) or inst.Anchored then return end
		if myModel and inst:IsDescendantOf(myModel) then return end
		local model = inst:FindFirstAncestorOfClass(_Vzd({206,240,229,230,237}))
		if model and Players:GetPlayerFromCharacter(model) then return end
		local ok, dist = pcall(function() return (inst.Position - me.Position).Magnitude end)
		if not ok then return end
		if dist > range + 15 then return end
		pcall(function()
			sno(inst, me.Position)
			local old = inst:FindFirstChild(_Vzd({215,208,202,197,219,224,219,230,243,240,200}))
			if old then old:Destroy() end
			local bf = Instance.new(_Vzd({195,240,229,250,199,240,243,228,230}))
			bf.Name = _Vzd({215,208,202,197,219,224,219,230,243,240,200})
			bf.Force = Vector3.new(0, force, 0)
			bf.Parent = inst
			Debris:AddItem(bf, seconds)
			applied[#applied + 1] = inst
		end)
	end
	for _, inst in ipairs(workspace:GetChildren()) do
		if #applied >= 50 then break end
		if inst:IsA(_Vzd({195,226,244,230,209,226,243,245})) then
			tryPart(inst)
		elseif inst:IsA(_Vzd({114,148,137,138,145})) or inst:IsA(_Vzd({199,240,237,229,230,243})) then
			for _, d in ipairs(inst:GetChildren()) do
				if #applied >= 50 then break end
				if d:IsA(_Vzd({195,226,244,230,209,226,243,245})) then
					tryPart(d)
				elseif d:IsA(_Vzd({206,240,229,230,237})) then
					local pp = d.PrimaryPart or d:FindFirstChildWhichIsA(_Vzd({103,134,152,138,117,134,151,153}))
					if pp then tryPart(pp) end
				end
			end
		end
	end
	_V556c1dc412c(HUB_NAME, _Vzd({127,138,151,148,82,108,69,148,147,69}) .. #applied .. _Vzd({161,240,227,235,230,228,245,244}), 2)
end
function _Vdd12b80328(targetPlayer)
	local list = {}
	if targetPlayer and _Vd6eb72811f9(targetPlayer) then
		list = { targetPlayer }
	else
		list = _Vce96e951d()
	end
	task.spawn(function()
		local okModel, okPrimary = _Vb10ea75e7c(_Vzd({195,240,238,227,195,226,237,237,240,240,239}))
		if not okModel and not okPrimary then
			_V556c1dc412c(HUB_NAME, _Vzd({195,226,237,237,240,240,239,161,231,226,234,237,230,229,161,174,161,227,246,250,161,195,240,238,227,195,226,237,237,240,240,239,161,231,234,243,244,245}), 3)
			return
		end
		for _, p in ipairs(list) do
			if _Vd6eb72811f9(p) then
				local r = _Vb2220e5a155(p)
				if r then
					local model, primary = _Vb10ea75e7c(_Vzd({195,240,238,227,195,226,237,237,240,240,239}))
					if model or primary then
						pcall(function()
							local balloon = model and (model.PrimaryPart or model:FindFirstChildWhichIsA(_Vzd({103,134,152,138,117,134,151,153}), true)) or primary
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
		_V556c1dc412c(HUB_NAME, _Vzd({195,226,237,237,240,240,239,161,245,243,240,237,237,161,253,161}) .. #list, 2)
	end)
end
local KICK_TYPES = {
	_Vzd({212,236,250,161,194,239,228,233,240,243}), _Vzd({107,145,148,134,153,69,117,142,147}),
	_Vzd({215,230,237,240,228,234,245,250}), _Vzd({201,226,243,229}), _Vzd({215,240,234,229}), _Vzd({212,236,250}), _Vzd({211,226,232,229,240,237,237}),
	_Vzd({195,237,240,227,238,226,239}), _Vzd({120,142,145,138,147,153}), _Vzd({200,243,226,227,204,234,228,236}), _Vzd({212,245,226,228,236,204,234,228,236}),
}
do local _z705=(7*11); if _z705<0 and _Vj() then _z705=_z705+1 end end
function _Vd56d00f4ea(seat)
	if not seat then return false end
	local par = seat.Parent
	local n = (par and tostring(par.Name) or seat.Name):lower()
	if n:find(_Vzd({227,237,240,227}), 1, true) then return true end
	if par and par:FindFirstChild(_Vzd({103,145,148,135,146,134,147,120,138,134,153,102,147,137,116,156,147,138,151,120,136,151,142,149,153})) then return true end
	if par and par:FindFirstChild(_Vzd({195,237,240,227,238,226,239,212,230,226,245,194,239,229,208,248,239,230,243,212,228,243,234,241,245}), true) then return true end
	return false
end
do local _z724=(7*10); if _z724<0 and _Vj() then _z724=_z724+1 end end
function _Vc5f8332afa()
	local h = hum()
	if not h or not h.Sit or not h.SeatPart then return false end
	return _Vd56d00f4ea(h.SeatPart)
end
function _Va073ccb72e()
	if S.toggles.blobGrabLoop or S.toggles.blobGrabAllLoop then return true end
	if S.toggles.blobExtractPlotsLoop or S.toggles.blobKickLoop then return true end
	if S.toggles.destroyServer or S.toggles.blobDestroyServer then return true end
	if MASS and MASS.destroySrv then return true end
	if S.loops then
		if S.loops.blobGrabLoop or S.loops.blobGrabAllLoop then return true end
		if S.loops.blobExtractPlotsLoop or S.loops.blobKickLoop then return true end
	end
	return false
end
function _V99f4e97332()
	if S.trainDriving then return false end
	if controlState and controlState.running then return false end
	return S.toggles.blobStickySeat == true
end
function _V6eb75622116(on)
	S._blobSessionActive = on == true
	if on then
		if S.toggles.blobStickySeat == nil then S.toggles.blobStickySeat = false end
		if _V99f4e97332() then
			_V8699b7ef19c()
		end
	else
		_Vc6f37d5c146(true)
	end
end
do local _z2757=(2*6);if _z2757<0 and _Vj() then _z2757=_z2757+1 end local _y2757=_Vzd({63,90}) end

function _V83a859e397()
	local h = hum()
	local me = hrp()
	local char = LP.Character
	local seat = h and h.SeatPart
	S._blobLeaveLockUntil = os.clock() + 0.6
	pcall(function()
		if h then
			h.Sit = false
			h.PlatformStand = false
			h.Jump = true
			h:ChangeState(Enum.HumanoidStateType.Jumping)
			h:ChangeState(Enum.HumanoidStateType.GettingUp)
			h:ChangeState(Enum.HumanoidStateType.Freefall)
		end
	end)
	if seat then
		pcall(function()
			if seat:IsA(_Vzd({212,230,226,245})) or seat:IsA(_Vzd({215,230,233,234,228,237,230,212,230,226,245})) then
				if seat.Occupant == h then
					pcall(function() h.Sit = false end)
				end
			end
		end)
		pcall(function()
			for _, w in ipairs(seat:GetChildren()) do
				if w:IsA(_Vzd({216,230,237,229})) or w:IsA(_Vzd({216,230,237,229,196,240,239,244,245,243,226,234,239,245})) or w:IsA(_Vzd({206,226,239,246,226,237,216,230,237,229})) then
					local p0, p1 = w.Part0, w.Part1
					if (p0 and char and p0:IsDescendantOf(char)) or (p1 and char and p1:IsDescendantOf(char)) then
						w:Destroy()
					end
				end
			end
		end)
	end
	if char then
		pcall(function()
			for _, w in ipairs(char:GetDescendants()) do
				if w:IsA(_Vzd({216,230,237,229})) or w:IsA(_Vzd({216,230,237,229,196,240,239,244,245,243,226,234,239,245})) or w:IsA(_Vzd({206,226,239,246,226,237,216,230,237,229})) then
					local p0, p1 = w.Part0, w.Part1
					if (p0 and _Vd56d00f4ea(p0)) or (p1 and _Vd56d00f4ea(p1)) then
						w:Destroy()
					end
				end
			end
		end)
	end
	if me then
		pcall(function()
			me.CFrame = me.CFrame + Vector3.new(0, 6, 10)
			me.AssemblyLinearVelocity = Vector3.new(0, 20, 0)
			me.AssemblyAngularVelocity = Vector3.zero
		end)
	end
	for _, delayT in ipairs({ 0.05, 0.12, 0.28, 0.5 }) do
		task.delay(delayT, function()
			local h2 = hum()
			local me2 = hrp()
			if not h2 then return end
			if h2.Sit and h2.SeatPart and _Vd56d00f4ea(h2.SeatPart) then
				pcall(function()
					h2.Sit = false
					h2.Jump = true
					h2:ChangeState(Enum.HumanoidStateType.Jumping)
				end)
				if me2 then
					pcall(function()
						me2.CFrame = me2.CFrame + Vector3.new(0, 4, 5)
					end)
				end
			end
		end)
	end
end
function _V987577091ab()
	S._blobStickyLoop = false
	_V11a5d4671af(_Vzd({227,237,240,227,212,245,234,228,236,250,212,230,226,245}))
	if S._blobStickyHB then
		pcall(function() S._blobStickyHB:Disconnect() end)
		S._blobStickyHB = nil
	end
end
function _Vc6f37d5c146(_Veeb635ec99)
	if _Va073ccb72e() then
		if not _V99f4e97332() then
			_V987577091ab()
		end
		return
	end
	S._blobSessionActive = false
	_V987577091ab()
	S._blobStickySeat = nil
	if _Veeb635ec99 ~= false then
		_V83a859e397()
	end
	if _V2575215f14f then
		pcall(_V2575215f14f)
		task.delay(0.25, function()
			if _Ve56cd280d0 then pcall(_Ve56cd280d0) end
			if _V2575215f14f then pcall(_V2575215f14f) end
		end)
	end
end
do local _z8907=(5*12);if _z8907<0 and _Vj() then _z8907=_z8907+1 end local _y8907=_Vzd({50,41}) end

function _Vbbb5926585()
	local h = hum()
	if h and h.SeatPart and _Vd56d00f4ea(h.SeatPart) then
		return h.SeatPart
	end
	if S._blobStickySeat and S._blobStickySeat.Parent and _Vd56d00f4ea(S._blobStickySeat) then
		return S._blobStickySeat
	end
	local seats = {}
	local function scan(root)
		if not root then return end
		for _, d in ipairs(root:GetDescendants()) do
			if (d:IsA(_Vzd({212,230,226,245})) or d:IsA(_Vzd({215,230,233,234,228,237,230,212,230,226,245}))) and _Vd56d00f4ea(d) then
				seats[#seats + 1] = d
			end
		end
	end
	scan(workspace:FindFirstChild(LP.Name .. _Vzd({212,241,226,248,239,230,229,202,239,213,240,250,244})))
	if #seats == 0 then
		for _, pl in ipairs(Players:GetPlayers()) do
			scan(workspace:FindFirstChild(pl.Name .. _Vzd({212,241,226,248,239,230,229,202,239,213,240,250,244})))
		end
	end
	local best = nil
	for _, seat in ipairs(seats) do
		if not seat.Occupant or seat.Occupant == hum() then
			best = seat
			break
		end
		best = best or seat
	end
	return best
end
do local _z647=(5*7); if _z647<0 and _Vj() then _z647=_z647+1 end end
function _V7968bbcf31()
	if S._blobLeaveLockUntil and os.clock() < S._blobLeaveLockUntil then return false end
	if not _V99f4e97332() then return false end
	local h = hum()
	local me = hrp()
	if not h or not me then return false end
	local seat = _Vbbb5926585()
	if not seat then return false end
	S._blobStickySeat = seat
	pcall(function()
		if seat.Occupant and seat.Occupant ~= h then
			seat.Occupant.Sit = false
		end
	end)
	pcall(function()
		me.CFrame = seat.CFrame * CFrame.new(0, 2.2, 0)
	end)
	pcall(function()
		h.Sit = true
		h.PlatformStand = false
		seat:Sit(h)
	end)
	return _Vc5f8332afa()
end
do local _z476=(7*4); if _z476<0 and _Vj() then _z476=_z476+1 end end
function _Vd916a05d33()
	if not _V99f4e97332() then return end
	local h = hum()
	if not h then return end
	if _Vc5f8332afa() then
		S._blobStickySeat = h.SeatPart
		pcall(function()
			h.Sit = true
			h.PlatformStand = false
		end)
		return
	end
	_V7968bbcf31()
end
function _V8699b7ef19c()
	if not _V99f4e97332() then
		_V987577091ab()
		return
	end
	if S._blobStickyLoop then return end
	S._blobStickyLoop = true
	_V53fa917f1a2(_Vzd({135,145,148,135,120,153,142,136,144,158,120,138,134,153}), 0.05, function()
		if not _V99f4e97332() then
			_Vc6f37d5c146(true)
			return
		end
		_Vd916a05d33()
	end)
	if not S._blobStickyHB then
		S._blobStickyHB = RunService.Heartbeat:Connect(function()
			if not _V99f4e97332() then
				if not _Va073ccb72e() then
					_Vc6f37d5c146(true)
				else
					_V987577091ab()
				end
				return
			end
			if S._blobLeaveLockUntil and os.clock() < S._blobLeaveLockUntil then return end
			local h = hum()
			if h and (not h.Sit or not h.SeatPart or not _Vd56d00f4ea(h.SeatPart)) then
				_V7968bbcf31()
			elseif h and _Vc5f8332afa() then
				S._blobStickySeat = h.SeatPart
			end
		end)
	end
end
function _V8247cb3a1ac(force)
	if not force and _Va073ccb72e() then return end
	_Vc6f37d5c146(force == true)
end
function _Vd5b67c4b72(quiet)
	_V6eb75622116(true)
	if _Vc5f8332afa() then
		local h = hum()
		if h and h.SeatPart then S._blobStickySeat = h.SeatPart end
		_V8699b7ef19c()
		return true
	end
	local me = hrp()
	if not me then return false end
	if not FTAP.BuyToy or not FTAP.SpawnToy then pcall(_V6c6a3f4314a) end
	pcall(function()
		if FTAP.BuyToy then FTAP.BuyToy:InvokeServer(_Vzd({196,243,230,226,245,246,243,230,195,237,240,227,238,226,239})) end
	end)
	task.wait(0.2)
	pcall(function()
		if FTAP.SpawnToy then
			FTAP.SpawnToy:InvokeServer(_Vzd({196,243,230,226,245,246,243,230,195,237,240,227,238,226,239}), me.CFrame * CFrame.new(0, 0, -5), Vector3.zero)
		end
	end)
	for _ = 1, 30 do
		task.wait(0.06)
		me = hrp() or me
		local folder = workspace:FindFirstChild(LP.Name .. _Vzd({212,241,226,248,239,230,229,202,239,213,240,250,244}))
		local seats = {}
		local function scan(root)
			if not root then return end
			for _, d in ipairs(root:GetDescendants()) do
				if (d:IsA(_Vzd({212,230,226,245})) or d:IsA(_Vzd({215,230,233,234,228,237,230,212,230,226,245}))) and _Vd56d00f4ea(d) then
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
			if _Vc5f8332afa() then
				S._blobStickySeat = seat
				_V8699b7ef19c()
				return true
			end
		end
		if _Vc5f8332afa() then
			_V8699b7ef19c()
			return true
		end
	end
	if not _Vc5f8332afa() then
		for _, d in ipairs(workspace:GetDescendants()) do
			if (d:IsA(_Vzd({212,230,226,245})) or d:IsA(_Vzd({215,230,233,234,228,237,230,212,230,226,245}))) and _Vd56d00f4ea(d) then
				pcall(function()
					me = hrp()
					if me then me.CFrame = d.CFrame + Vector3.new(0, 2, 0) end
				end)
				task.wait(0.1)
				pcall(function() local h = hum(); if h then d:Sit(h) end end)
				task.wait(0.15)
				if _Vc5f8332afa() then
					S._blobStickySeat = d
					_V8699b7ef19c()
					return true
				end
			end
		end
	end
	if not quiet then
		_V556c1dc412c(HUB_NAME, _Vzd({195,237,240,227,238,226,239,161,244,241,226,248,239,161,231,226,234,237,230,229,161,174,161,245,243,250,161,226,232,226,234,239}), 2)
	end
	local ok = _Vc5f8332afa()
	if ok then _V8699b7ef19c() end
	return ok
end
function _V971ad737104(p, ktype, quiet)
	if not p or not _V4a303563e9(p) then
		if not quiet then _V556c1dc412c(HUB_NAME, _Vzd({115,148,69,144,142,136,144,69,153,134,151,140,138,153}), 1.5) end
		return
	end
	ktype = ktype or S.kickType or _Vzd({212,236,250,161,194,239,228,233,240,243})
	if not _Vc39c787dac(p, _Vzd({236,234,228,236}), { kind = _Vzd({236,234,228,236}), ktype = ktype, quiet = quiet }) then return end
	local me, r = hrp(), _Vb2220e5a155(p)
	if not r then return end
	local home = me and me.CFrame
	_Veeb635ec99(p)
	_V96b8f82951(p.Character)
	_Vb57b94121bb()
	local function ownershipVisit(opts)
		opts = opts or {}
		local frames = opts.frames or 55
		local floatConn = nil
		if opts.floatSelf then
			floatConn = RunService.Stepped:Connect(function()
				local c = char()
				if not c then return end
				for _, part in ipairs(c:GetChildren()) do
					if part:IsA(_Vzd({195,226,244,230,209,226,243,245})) and part.CanCollide then
						part.CanCollide = false
					end
				end
			end)
		end
		for _ = 0, frames do
			if not _V4a303563e9(p) then break end
			r = _Vb2220e5a155(p)
			if not r then break end
			_Veeb635ec99(p)
			if r.Position.Y <= -12 then
				_V41e966b01bf(CFrame.new(r.Position + Vector3.new(0, 5, -15)))
			else
				_V41e966b01bf(CFrame.new(r.Position + Vector3.new(0, -10, -10)))
			end
			sno(r, r.Position)
			_Vb07b7f02185(p, r.Position)
			local vel = r.AssemblyLinearVelocity and r.AssemblyLinearVelocity.Magnitude or 0
			if _Veec038d8d2(r) or vel > 500 then
				_V07a307c766(r)
				task.wait()
				_Vc9836fec182(r)
				if opts.onOwned then opts.onOwned(r) end
				break
			end
			if opts.pulse and _ % 2 == 0 then
				_Vc9836fec182(r)
				_V07a307c766(r)
			end
			RunService.Heartbeat:Wait()
		end
		r = _Vb2220e5a155(p)
		if r and _V4a303563e9(p) then
			_Veeb635ec99(p)
			_V07a307c766(r)
			_Vc9836fec182(r)
			if opts.onOwned then opts.onOwned(r) end
			if opts.launch then _Vf4823fea107(p, _Vzd({244,236,250})) end
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
	if ktype == _Vzd({212,236,250,161,194,239,228,233,240,243}) then
		ownershipVisit({
			frames = 55,
			onOwned = function(rr)
				_V789bc41e64(rr, _Vzd({120,144,158,69,102,147,136,141,148,151}))
				_Vc9836fec182(rr)
				_V7186e37c24(rr, 12000, 2.5)
			end,
		})
	elseif ktype == _Vzd({107,145,148,134,153,69,117,142,147}) then
		ownershipVisit({
			frames = 55,
			floatSelf = true,
			onOwned = function(rr)
				_V789bc41e64(rr, _Vzd({120,144,158,69,102,147,136,141,148,151}))
				_Vc9836fec182(rr)
				pcall(function()
					local bp = rr:FindFirstChild(_Vzd({204,234,228,236,194,246,243,226,209}))
					if bp and bp:IsA(_Vzd({195,240,229,250,209,240,244,234,245,234,240,239})) then
						bp.MaxForce = Vector3.new(1e9, 1e9, 1e9)
						bp.P = 1e5
						bp.D = 2000
						bp.Position = Vector3.new(math.random(-80, 80), 400 + math.random(0, 80), math.random(-80, 80))
					end
					local bg = rr:FindFirstChild(_Vzd({204,234,228,236,194,246,243,226,200}))
					if not bg then
						bg = Instance.new(_Vzd({195,240,229,250,200,250,243,240}))
						bg.Name = _Vzd({204,234,228,236,194,246,243,226,200})
						bg.MaxTorque = Vector3.new(1e9, 1e9, 1e9)
						bg.P = 5e4
						bg.Parent = rr
					end
					bg.CFrame = rr.CFrame
				end)
				_V7186e37c24(rr, 16000, 3)
			end,
		})
	elseif ktype == _Vzd({195,237,240,227,238,226,239}) or ktype == _Vzd({212,234,237,230,239,245}) then
		_Vd5b67c4b72()
		for _ = 1, 18 do
			r = _Vb2220e5a155(p)
			if not r or not _V4a303563e9(p) then break end
			pcall(function()
				_Vb07b7f02185(p, r.Position)
				local my = hrp()
				if my then r.CFrame = my.CFrame * CFrame.new(0, 4, 0) end
				_V07a307c766(r)
				_Vc9836fec182(r)
				if ktype == _Vzd({212,234,237,230,239,245}) then _V789bc41e64(r, _Vzd({212,234,237,230,239,245})) end
				_V7186e37c24(r, ktype == _Vzd({120,142,145,138,147,153}) and 14000 or 22000, 0.08)
			end)
			RunService.Heartbeat:Wait()
		end
	elseif ktype == _Vzd({200,243,226,227,204,234,228,236}) then
		for _ = 1, 15 do
			r = _Vb2220e5a155(p)
			if not r or not _V4a303563e9(p) then break end
			pcall(function()
				local my = hrp()
				if my then my.CFrame = r.CFrame * CFrame.new(0, 1, 2) end
				_Vb07b7f02185(p, r.Position)
				if FTAP.CreateGrabLine then
					local t = p.Character:FindFirstChild(_Vzd({213,240,243,244,240})) or p.Character:FindFirstChild(_Vzd({214,241,241,230,243,213,240,243,244,240})) or r
					FTAP.CreateGrabLine:FireServer(t, t.CFrame)
				end
				_Vc9836fec182(r)
				_V7186e37c24(r, 18000, 0.15)
			end)
			RunService.Heartbeat:Wait()
		end
	elseif ktype == _Vzd({212,245,226,228,236,204,234,228,236}) then
		for _ = 0, 50 do
			r = _Vb2220e5a155(p)
			if not r or not _V4a303563e9(p) then break end
			_Veb5a36521fa(p, 8)
			r = _Vb2220e5a155(p)
			if not r then break end
			_Vb07b7f02185(p, r.Position)
			if _Veec038d8d2(r) or (r.AssemblyLinearVelocity and r.AssemblyLinearVelocity.Magnitude > 500) then
				_V07a307c766(r)
				task.wait()
				_Vc9836fec182(r)
				_V7186e37c24(r, 22000, 0.1)
				break
			end
			task.wait()
			if r.Position.Y <= -12 then
				_V41e966b01bf(CFrame.new(r.Position + Vector3.new(0, 5, -15)))
			else
				_V41e966b01bf(CFrame.new(r.Position + Vector3.new(0, -10, -10)))
			end
		end
	elseif ktype == _Vzd({215,240,234,229}) then
		_V788517221fb(p, true)
	elseif ktype == _Vzd({212,236,250}) then
		kickCore(function(rr)
			_V789bc41e64(rr, _Vzd({120,144,158,69,102,147,136,141,148,151}))
			_V7186e37c24(rr, 15000, 4)
		end)
	elseif ktype == _Vzd({119,134,140,137,148,145,145}) then
		_V7e5dd05e13e(p, true)
	elseif ktype == _Vzd({201,226,243,229}) or ktype == _Vzd({215,230,237,240,228,234,245,250}) then
		kickCore(function(rr)
			_V7186e37c24(rr, math.max(S.flingPower or 8000, 8000), 0.12)
		end)
	else
		kickCore(nil)
	end
	if home then _V41e966b01bf(home) end
	_V7e05ebe3d3()
	if not quiet then
		_V556c1dc412c(HUB_NAME, _Vzd({204,234,228,236,161,220}) .. ktype .. _Vzd({130,69,82,99,69}) .. _V466aec8e137(p), 1.5)
	end
end
function _V56beb6fb15a(p)
	if not p or not _Vd6eb72811f9(p) then
		if p then plotWatch[p.UserId] = nil end
		return
	end
	local w = plotWatch[p.UserId]
	plotWatch[p.UserId] = nil
	plotBypass = true
	local ok, err = pcall(function()
		_V37c4073396(p)
		if w then
			if w.kind == _Vzd({231,237,234,239,232}) then
				_Vcc8279d692(p, w.power, true, w.mapWide)
			elseif w.kind == _Vzd({236,234,237,237}) then
				_V62e4aa89105(p, true)
			elseif w.kind == _Vzd({236,234,228,236}) then
				_V971ad737104(p, w.ktype, true)
			elseif w.kind == _Vzd({135,151,142,147,140}) then
				_V702f278238(p, nil, true)
			elseif w.kind == _Vzd({243,226,232,229,240,237,237}) then
				_V7e5dd05e13e(p, true)
			end
			_V556c1dc412c(HUB_NAME, _Vzd({113,138,139,153,69,141,148,154,152,138,69,82,99,69}) .. tostring(w.kind or _Vzd({232,243,226,227})) .. _Vzd({161,253,161}) .. _V466aec8e137(p), 2)
		else
			_V556c1dc412c(HUB_NAME, _Vzd({113,138,139,153,69,141,148,154,152,138,69,82,99,69,140,151,134,135,135,138,137,69,153,141,134,153,69,135,142,153,136,141,69}) .. _V466aec8e137(p), 2)
		end
	end)
	plotBypass = false
	if not ok then warn(_Vzd({220,215,208,202,197,219,222,161,241,237,240,245,161,230,249,234,245}), err) end
end
S._runPlotExitAmbush = _V56beb6fb15a
do local _z832=(3*6); if _z832<0 and _Vj() then _z832=_z832+1 end end
function _Vafb25560e4()
	if plotWatchInstalled then return end
	plotWatchInstalled = true
	local function bindPlayer(p)
		if not p or p == LP then return end
		local function onLeftPlot()
			if plotWatch[p.UserId] or (S.toggles.plotAmbush ~= false and (S.selected == p or S.loopTarget == p)) then
				if not plotWatch[p.UserId] then
					plotWatch[p.UserId] = { kind = _Vzd({232,243,226,227}), quiet = true }
				end
				task.defer(function()
					task.wait(0.05)
					if not _V318f2ee5f3(p) then
						_V56beb6fb15a(p)
					end
				end)
			end
		end
		local ip = p:FindFirstChild(_Vzd({202,239,209,237,240,245})) or p:WaitForChild(_Vzd({110,147,117,145,148,153}), 10)
		if ip then
			pcall(function()
				if ip:IsA(_Vzd({195,240,240,237,215,226,237,246,230})) then
					ip.Changed:Connect(function(v)
						if v == false then onLeftPlot() end
					end)
				else
					ip:GetPropertyChangedSignal(_Vzd({215,226,237,246,230})):Connect(function()
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
						local now = _V318f2ee5f3(p)
						local uid = p.UserId
						if wasIn[uid] and not now then
							if plotWatch[uid] or S.selected == p or S.loopTarget == p then
								if not plotWatch[uid] then
									plotWatch[uid] = { kind = _Vzd({232,243,226,227}), quiet = true }
								end
								task.spawn(_V56beb6fb15a, p)
							end
						elseif now and S.toggles.plotAmbush ~= false and (S.selected == p or S.loopTarget == p) then
							if not plotWatch[uid] then
								plotWatch[uid] = { kind = _Vzd({232,243,226,227}), quiet = true }
							end
						end
						wasIn[uid] = now
					end
				end
			end
		end
	end)
	print(_Vzd({220,215,208,202,197,219,222,161,241,237,240,245,161,226,238,227,246,244,233,161,248,226,245,228,233,161,234,239,244,245,226,237,237,230,229}))
end
task.spawn(_Vafb25560e4)
do local _z3467=(7*4);if _z3467<0 and _Vj() then _z3467=_z3467+1 end local _y3467=_Vzd({85,51}) end

function _V9a965f30ae()
	local h = hum()
	if not h or not h.SeatPart or not h.SeatPart.Parent then return nil end
	local blob = h.SeatPart.Parent
	local n = blob.Name:lower()
	if not (n:find(_Vzd({227,237,240,227})) or blob:FindFirstChild(_Vzd({195,237,240,227,238,226,239,212,230,226,245,194,239,229,208,248,239,230,243,212,228,243,234,241,245}))) then
		return nil
	end
	local leftDet = blob:FindFirstChild(_Vzd({205,230,231,245,197,230,245,230,228,245,240,243})) or blob:FindFirstChild(_Vzd({205,230,231,245,197,230,245,230,228,245,240,243}), true)
	if not leftDet then
		for _, d in ipairs(blob:GetDescendants()) do
			if d:IsA(_Vzd({195,226,244,230,209,226,243,245})) and d.Name:lower():find(_Vzd({229,230,245,230,228,245,240,243}), 1, true) then
				leftDet = d
				break
			end
		end
	end
	if not leftDet then return nil end
	local leftWeld = leftDet:FindFirstChild(_Vzd({205,230,231,245,216,230,237,229})) or leftDet:FindFirstChild(_Vzd({205,230,231,245,216,230,237,229}), true)
		or leftDet:FindFirstChildWhichIsA(_Vzd({216,230,237,229}))
		or leftDet:FindFirstChildWhichIsA(_Vzd({216,230,237,229,196,240,239,244,245,243,226,234,239,245}))
		or leftDet:FindFirstChildWhichIsA(_Vzd({206,226,239,246,226,237,216,230,237,229}))
	local scriptFolder = blob:FindFirstChild(_Vzd({195,237,240,227,238,226,239,212,230,226,245,194,239,229,208,248,239,230,243,212,228,243,234,241,245}))
		or blob:FindFirstChild(_Vzd({195,237,240,227,238,226,239,212,230,226,245,194,239,229,208,248,239,230,243,212,228,243,234,241,245}), true)
	local creatureGrab = scriptFolder and (scriptFolder:FindFirstChild(_Vzd({196,243,230,226,245,246,243,230,200,243,226,227}))
		or scriptFolder:FindFirstChild(_Vzd({196,243,230,226,245,246,243,230,200,243,226,227}), true))
	if not creatureGrab then
		for _, d in ipairs(blob:GetDescendants()) do
			if d.Name == _Vzd({196,243,230,226,245,246,243,230,200,243,226,227}) and (d:IsA(_Vzd({119,138,146,148,153,138,106,155,138,147,153})) or d:IsA(_Vzd({211,230,238,240,245,230,199,246,239,228,245,234,240,239}))) then
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
do local _z3539=(5*3);if _z3539<0 and _Vj() then _z3539=_z3539+1 end local _y3539=_Vzd({82,60}) end

function _V11fc60b4141(kit)
	local fresh = _V9a965f30ae()
	if fresh then return fresh end
	if kit and kit.blob and kit.blob.Parent and kit.creatureGrab and kit.creatureGrab.Parent and kit.leftDet and kit.leftDet.Parent then
		local h = hum()
		if h and kit.seat and kit.seat.Parent then
			pcall(function()
				h.Sit = true
				kit.seat:Sit(h)
			end)
		end
		if not kit.leftWeld or not kit.leftWeld.Parent then
			kit.leftWeld = kit.leftDet:FindFirstChild(_Vzd({205,230,231,245,216,230,237,229}))
				or kit.leftDet:FindFirstChild(_Vzd({205,230,231,245,216,230,237,229}), true)
				or kit.leftDet:FindFirstChildWhichIsA(_Vzd({216,230,237,229}))
				or kit.leftDet:FindFirstChildWhichIsA(_Vzd({216,230,237,229,196,240,239,244,245,243,226,234,239,245}))
		end
		return kit
	end
	return _Vbbdb217894()
end
function _V50fc06ff128(kit, targetRoot, opts)
	opts = opts or {}
	if not kit or not targetRoot or not kit.blob then return end
	local pivot = kit.blob.PrimaryPart or kit.seat
	if not pivot then return end
	local dist = tonumber(opts.dist) or 3.0
	local hard = opts.hard ~= false
	pcall(function()
		local dest = targetRoot.CFrame * CFrame.new(0, 0.75, dist)
		if kit.blob.PrimaryPart then
			kit.blob:PivotTo(dest)
		else
			pivot.CFrame = dest
		end
		if hard then
			for _, part in ipairs(kit.blob:GetDescendants()) do
				if part:IsA(_Vzd({195,226,244,230,209,226,243,245})) then
					part.Anchored = true
					part.AssemblyLinearVelocity = Vector3.zero
					part.AssemblyAngularVelocity = Vector3.zero
				end
			end
		end
		local me = hrp()
		if me then me.CFrame = dest * CFrame.new(0, 2, 0) end
		local h = hum()
		if h and kit.seat and kit.seat.Parent then
			pcall(function()
				h.Sit = true
				h.PlatformStand = false
				kit.seat:Sit(h)
			end)
		end
		if hard then
			task.wait(0.03)
			for _, part in ipairs(kit.blob:GetDescendants()) do
				if part:IsA(_Vzd({195,226,244,230,209,226,243,245})) then
					part.Anchored = false
				end
			end
		end
	end)
end
function _V3c0a855b8c(kit, targetRoot)
	if not kit or not targetRoot or not kit.creatureGrab or not kit.leftDet then return end
	if not kit.creatureGrab.Parent or not kit.leftDet.Parent then return end
	if not kit.leftWeld or not kit.leftWeld.Parent then
		kit.leftWeld = kit.leftDet:FindFirstChild(_Vzd({205,230,231,245,216,230,237,229})) or kit.leftDet:FindFirstChild(_Vzd({205,230,231,245,216,230,237,229}), true)
			or kit.leftDet:FindFirstChildWhichIsA(_Vzd({216,230,237,229}))
			or kit.leftDet:FindFirstChildWhichIsA(_Vzd({216,230,237,229,196,240,239,244,245,243,226,234,239,245}))
			or kit.leftDet:FindFirstChildWhichIsA(_Vzd({206,226,239,246,226,237,216,230,237,229}))
	end
	local parts = { targetRoot }
	local model = targetRoot:FindFirstAncestorOfClass(_Vzd({206,240,229,230,237}))
	if model then
		for _, n in ipairs({ _Vzd({213,240,243,244,240}), _Vzd({214,241,241,230,243,213,240,243,244,240}), _Vzd({201,246,238,226,239,240,234,229,211,240,240,245,209,226,243,245}), _Vzd({201,230,226,229}), _Vzd({205,240,248,230,243,213,240,243,244,240}) }) do
			local part = model:FindFirstChild(n)
			if part and part:IsA(_Vzd({195,226,244,230,209,226,243,245})) then
				parts[#parts + 1] = part
			end
		end
	end
	local seen = {}
	pcall(function()
		for _, part in ipairs(parts) do
			if part and part.Parent and not seen[part] then
				seen[part] = true
				if kit.creatureGrab:IsA(_Vzd({211,230,238,240,245,230,198,247,230,239,245})) then
					kit.creatureGrab:FireServer(kit.leftDet, part, kit.leftWeld)
				else
					kit.creatureGrab:InvokeServer(kit.leftDet, part, kit.leftWeld)
				end
			end
		end
	end)
end
do local _z9971=(9*8);if _z9971<0 and _Vj() then _z9971=_z9971+1 end local _y9971=_Vzd({41,53}) end

function _Vd7a3dfeb8d(kit, targetRoot, n)
	n = n or 8
	for _ = 1, n do
		if not kit or not targetRoot then break end
		_V3c0a855b8c(kit, targetRoot)
		RunService.Heartbeat:Wait()
	end
end
function _Ve74a82d330(p)
	if not p or not _Vd6eb72811f9(p) then return false end
	local held = p:FindFirstChild(_Vzd({202,244,201,230,237,229}))
	if held and held.Value == true then return true end
	local r = _Vb2220e5a155(p)
	local me = hrp()
	if r and me and (r.Position - me.Position).Magnitude < 22 then
		local c = p.Character
		if c then
			for _, d in ipairs(c:GetDescendants()) do
				if d.Name == _Vzd({209,226,243,245,208,248,239,230,243}) then
					local val = nil
					pcall(function() val = d.Value end)
					if val == LP or tostring(val) == LP.Name then return true end
				end
			end
		end
	end
	return false
end
function _Vbbdb217894()
	_V6eb75622116(true)
	if _Vc5f8332afa() then return _V9a965f30ae() end
	pcall(function() _Vd5b67c4b72(true) end)
	if _Vc5f8332afa() then return _V9a965f30ae() end
	local me = hrp()
	local h = hum()
	if not me or not h then return nil end
	local folder = workspace:FindFirstChild(LP.Name .. _Vzd({212,241,226,248,239,230,229,202,239,213,240,250,244}))
	local roots = { folder, workspace }
	for _, root in ipairs(roots) do
		if root then
			for _, d in ipairs(root:GetDescendants()) do
				if (d:IsA(_Vzd({212,230,226,245})) or d:IsA(_Vzd({215,230,233,234,228,237,230,212,230,226,245}))) then
					local par = d.Parent
					if par and (par.Name:lower():find(_Vzd({227,237,240,227})) or par:FindFirstChild(_Vzd({103,145,148,135,146,134,147,120,138,134,153,102,147,137,116,156,147,138,151,120,136,151,142,149,153}))) then
						pcall(function()
							me.CFrame = d.CFrame + Vector3.new(0, 3, 0)
							d:Sit(h)
						end)
						task.wait(0.1)
						if _Vc5f8332afa() then return _V9a965f30ae() end
					end
				end
			end
		end
	end
	return _V9a965f30ae()
end
function _Vb8846e3f2c(p)
	if not p or not _Vd6eb72811f9(p) then return false end
	local kit = _Vbbdb217894()
	if not kit then return false end
	local r = _Vb2220e5a155(p)
	if not r then return false end
	pcall(function() _Veeb635ec99(p) end)
	pcall(function() _Vb07b7f02185(p, r.Position) end)
	_V50fc06ff128(kit, r, { dist = 3.0, hard = true })
	kit = _V11fc60b4141(kit)
	if not kit then return false end
	r = _Vb2220e5a155(p) or r
	_V50fc06ff128(kit, r, { dist = 2.5, hard = true })
	kit = _V11fc60b4141(kit)
	if not kit then return false end
	r = _Vb2220e5a155(p) or r
	_Vd7a3dfeb8d(kit, r, 14)
	return true
end
_V903a73872f = function()
	local kit = _Vbbdb217894()
	if not kit then return false end
	for _, p in ipairs(Players:GetPlayers()) do
		if p ~= LP and _Vd6eb72811f9(p) then
			local r = _Vb2220e5a155(p)
			if r then
				_V50fc06ff128(kit, r, { dist = 2.8, hard = true })
				kit = _V11fc60b4141(kit) or kit
				_Vd7a3dfeb8d(kit, r, 6)
			end
		end
	end
	if _V2575215f14f then pcall(_V2575215f14f) end
	return true
end
function _V50cb0bb02d(p)
	if not p or not _Vd6eb72811f9(p) then return false end
	local ok = _Vb8846e3f2c(p)
	local kit = _V9a965f30ae()
	if not kit then return ok end
	for attempt = 1, 4 do
		if not _Vd6eb72811f9(p) then break end
		local r = _Vb2220e5a155(p)
		if not r then break end
		if _Ve74a82d330(p) then
			_V50fc06ff128(kit, r, { dist = 2.5, hard = false })
			kit = _V11fc60b4141(kit) or kit
			if kit then _Vd7a3dfeb8d(kit, r, 8) end
			ok = true
			break
		end
		if not _Vc5f8332afa() then
			kit = _Vbbdb217894() or kit
		end
		_V50fc06ff128(kit, r, { dist = 2.6, hard = true })
		kit = _V11fc60b4141(kit) or kit
		if kit then
			_Vd7a3dfeb8d(kit, r, 10)
			ok = true
		end
		task.wait(0.04)
	end
	if _V2575215f14f then pcall(_V2575215f14f) end
	return ok
end
do local _z9919=(6*3);if _z9919<0 and _Vj() then _z9919=_z9919+1 end local _y9919=_Vzd({41,72}) end

function _Vbee791932b()
	local kit = _Vbbdb217894()
	if not kit then _V556c1dc412c(HUB_NAME, _Vzd({103,145,148,135,146,134,147,69,152,149,134,156,147,69,139,134,142,145,138,137}), 2); return end
	_V556c1dc412c(HUB_NAME, _Vzd({195,237,240,227,161,200,243,226,227,161,194,205,205}), 1.5)
	for _, p in ipairs(Players:GetPlayers()) do
		if p ~= LP and _Vd6eb72811f9(p) then
			local r = _Vb2220e5a155(p)
			if r then
				_V50fc06ff128(kit, r, { dist = 2.8, hard = true })
				kit = _V11fc60b4141(kit) or kit
				_Vd7a3dfeb8d(kit, r, 6)
			end
		end
	end
	if _V2575215f14f then pcall(_V2575215f14f) end
end
function _V9f76ead5169(on, p)
	local id = _Vzd({135,145,148,135,108,151,134,135,113,148,148,149})
	if not on then
		_V11a5d4671af(id)
		S.toggles.blobGrabLoop = false
		_V556c1dc412c(HUB_NAME, _Vzd({103,145,148,135,69,108,151,134,135,69,113,148,148,149,69,116,107,107}), 1.2)
		_Vc6f37d5c146(true)
		return true
	end
	if not p or not p.Parent then
		S.toggles.blobGrabLoop = false
		_V556c1dc412c(HUB_NAME, _Vzd({209,234,228,236,161,226,161,241,237,226,250,230,243,161,231,234,243,244,245}), 1.5)
		return false
	end
	_V11a5d4671af(id)
	S.toggles.blobGrabLoop = true
	_V6eb75622116(true)
	_V8699b7ef19c()
	local targetName = p.Name
	_V556c1dc412c(HUB_NAME, _Vzd({103,145,148,135,69,108,151,134,135,69,113,148,148,149,69,116,115,69,82,99,69}) .. _V466aec8e137(p), 1.5)
	task.spawn(function()
		local target = Players:FindFirstChild(targetName) or p
		if target and target.Parent then
			_Vb8846e3f2c(target)
		end
	end)
	_V53fa917f1a2(id, 0.30, function()
		if not S.toggles.blobGrabLoop then return end
		local target = Players:FindFirstChild(targetName) or S.blobTarget or S.selected
		if not target or not target.Parent then return end
		if not _Vc5f8332afa() then
			_Vbbdb217894()
		end
		local kit = _V9a965f30ae() or _Vbbdb217894()
		if not kit then return end
		local r = _Vb2220e5a155(target)
		if not r then return end
		if _Ve74a82d330(target) then
			_V50fc06ff128(kit, r, { dist = 2.4, hard = false })
			kit = _V11fc60b4141(kit) or kit
			if kit then _Vd7a3dfeb8d(kit, r, 10) end
		else
			_Vb8846e3f2c(target)
		end
	end)
	return true
end
function _V30a2c58019b(p)
	if S.toggles.blobGrabLoop or S.loops.blobGrabLoop then
		return _V9f76ead5169(false)
	end
	return _V9f76ead5169(true, p)
end
function _V4188cddd168(on)
	local id = _Vzd({135,145,148,135,108,151,134,135,102,145,145,113,148,148,149})
	if not on then
		_V11a5d4671af(id)
		S.toggles.blobGrabAllLoop = false
		_V556c1dc412c(HUB_NAME, _Vzd({103,145,148,135,69,108,151,134,135,69,102,145,145,69,113,148,148,149,69,116,107,107}), 1.2)
		_Vc6f37d5c146(true)
		return true
	end
	_V11a5d4671af(id)
	S.toggles.blobGrabAllLoop = true
	_V6eb75622116(true)
	_V8699b7ef19c()
	_V556c1dc412c(HUB_NAME, _Vzd({195,237,240,227,161,200,243,226,227,161,194,237,237,161,205,240,240,241,161,208,207}), 1.5)
	_V53fa917f1a2(id, 0.75, function()
		if not S.toggles.blobGrabAllLoop then return end
		if not _Vc5f8332afa() then _Vbbdb217894() end
		_Vbee791932b()
	end)
	return true
end
do local _z8381=(7*10);if _z8381<0 and _Vj() then _z8381=_z8381+1 end local _y8381=_Vzd({76,79}) end

function _Vbb4b69f8167(on)
	local id = _Vzd({227,237,240,227,198,249,245,243,226,228,245,209,237,240,245,244,205,240,240,241})
	if not on then
		_V11a5d4671af(id)
		S.toggles.blobExtractPlotsLoop = false
		_V556c1dc412c(HUB_NAME, _Vzd({198,249,245,243,226,228,245,161,209,237,240,245,244,161,205,240,240,241,161,208,199,199}), 1.2)
		_Vc6f37d5c146(true)
		return true
	end
	_V11a5d4671af(id)
	S.toggles.blobExtractPlotsLoop = true
	_V6eb75622116(true)
	_V8699b7ef19c()
	_V556c1dc412c(HUB_NAME, _Vzd({198,249,245,243,226,228,245,161,209,237,240,245,244,161,205,240,240,241,161,208,207}), 1.5)
	_V53fa917f1a2(id, 1.0, function()
		if not S.toggles.blobExtractPlotsLoop then return end
		for _, p in ipairs(Players:GetPlayers()) do
			if not S.toggles.blobExtractPlotsLoop then break end
			if p ~= LP and _Vd6eb72811f9(p) and _V318f2ee5f3(p) then
				_V50cb0bb02d(p)
				task.wait(0.25)
			end
		end
	end)
	return true
end
function _V36bbfc2a166(on)
	if not on then
		if controlState and controlState.running then
			_V5edd98521ad(false)
		end
		S.toggles.blobControlOn = false
		_Vc6f37d5c146(true)
		return true
	end
	S.toggles.blobControlOn = true
	task.spawn(function()
		local ok = _V46465c7e59()
		if not ok then
			S.toggles.blobControlOn = false
			if S._toggleRenderers and S._toggleRenderers.blobControlOn then
				pcall(S._toggleRenderers.blobControlOn)
			end
			return
		end
		while controlState and controlState.running and S.toggles.blobControlOn do
			task.wait(0.25)
		end
		S.toggles.blobControlOn = false
		if S._toggleRenderers and S._toggleRenderers.blobControlOn then
			pcall(S._toggleRenderers.blobControlOn)
		end
		_Vc6f37d5c146(true)
	end)
	return true
end
_V2d53f0c669 = function(keep)
	_V6eb75622116(true)
	_V556c1dc412c(HUB_NAME, _Vzd({197,230,244,245,243,240,250,161,212,230,243,247,230,243,161,208,207,161,213,233,234,244,161,212,233,234,245,161,208,247,230,243}), 2)
	while keep() do
		local kit = _Vbbdb217894()
		if not kit then
			task.wait(0.4)
		else
			for _, p in ipairs(Players:GetPlayers()) do
				if not keep() then break end
				if p ~= LP and _Vd6eb72811f9(p) then
					local r = _Vb2220e5a155(p)
					if r then
						if not _Vc5f8332afa() then
							kit = _Vbbdb217894() or kit
						end
						_V50fc06ff128(kit, r)
						kit = _V9a965f30ae() or kit
						for _ = 1, 4 do
							_V3c0a855b8c(kit, r)
							task.wait()
						end
					end
				end
			end
			if not _Vc5f8332afa() then
				_Vbbdb217894()
			end
			task.wait()
		end
	end
	_V556c1dc412c(HUB_NAME, _Vzd({105,138,152,153,151,148,158,69,120,138,151,155,138,151,69,116,107,107}), 1.5)
end
_Vd72e3cde68 = function(keep)
	_V556c1dc412c(HUB_NAME, _Vzd({197,230,244,245,243,240,250,161,212,230,243,247,230,243,161,201,250,227,243,234,229,161,208,207,161,169,239,240,161,227,237,240,227,238,226,239,161,239,230,230,229,230,229,170}), 3)
	while keep() do
		if FTAP.CreateGrabLine then
			for _, p in ipairs(Players:GetPlayers()) do
				if p ~= LP then
					local t = _V4d27d6f61df(p)
					if t then
						for _ = 1, 8 do
							pcall(function() FTAP.CreateGrabLine:FireServer(t, t.CFrame) end)
							pcall(function() FTAP.CreateGrabLine:FireServer(t, CRAZY_LINE_CF) end)
						end
					end
				end
			end
		end
		for _, p in ipairs(_Vce96e951d()) do
			if not keep() then break end
			pcall(function()
				_Veb5a36521fa(p, 20)
				local r = _Vb2220e5a155(p)
				if r then
					_Vc9836fec182(r)
					_V7186e37c24(r, 20000, 0.2)
					local h = p.Character and p.Character:FindFirstChildOfClass(_Vzd({201,246,238,226,239,240,234,229}))
					if h then
						h.BreakJointsOnDeath = false
						h:ChangeState(Enum.HumanoidStateType.Dead)
					end
					_V5c9d69a71e1(_Vzd({196,226,238,241,231,234,243,230}), r)
					_V5c9d69a71e1(_Vzd({107,148,148,137,103,134,147,134,147,134}), r)
				end
			end)
			task.wait(0.03)
		end
		local me = hrp()
		if me and FTAP.SpawnToy then
			for _, toy in ipairs({ _Vzd({206,234,244,244,234,237,230}), _Vzd({215,240,234,229,195,240,238,227}), _Vzd({199,234,243,230,248,240,243,236}), _Vzd({195,240,238,227,195,226,237,237,240,240,239}), _Vzd({212,239,240,248,227,226,237,237}) }) do
				pcall(function()
					if FTAP.BuyToy then FTAP.BuyToy:InvokeServer(toy) end
					FTAP.SpawnToy:InvokeServer(toy, me.CFrame * CFrame.new(0, 5, -8), Vector3.zero)
				end)
			end
		end
		task.wait(0.15)
	end
	_V556c1dc412c(HUB_NAME, _Vzd({197,230,244,245,243,240,250,161,201,250,227,243,234,229,161,208,199,199}), 2)
end
Late = {}
do local _z485=(8*6); if _z485<0 and _Vj() then _z485=_z485+1 end end
do local _z2657=(8*10);if _z2657<0 and _Vj() then _z2657=_z2657+1 end local _y2657=_Vzd({61,48}) end

function _Vbe6e7c8db()
Late = Late or {}
Late._phase = _Vzd({230,239,245,230,243,230,229})
print(_Vzd({220,215,208,202,197,219,222,161,237,226,245,230,161,234,239,234,245,161,230,239,245,230,243,230,229}))
local orbitAngles = {}
local buriedPartState = setmetatable({}, { __mode = "k" })
do local _z9399=(5*5);if _z9399<0 and _Vj() then _z9399=_z9399+1 end local _y9399=_Vzd({48,86}) end

function _V39f4e99947(part, names)
	if not part then return end
	for _, name in ipairs(names) do
		local mover = part:FindFirstChild(name)
		if mover then pcall(function() mover:Destroy() end) end
	end
end
function _V6ac4192214e(model)
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
	local root = model and (model:FindFirstChild(_Vzd({201,246,238,226,239,240,234,229,211,240,240,245,209,226,243,245})) or model:FindFirstChild(_Vzd({213,240,243,244,240})))
	_V39f4e99947(root, { _Vzd({215,208,202,197,219,224,195,246,243,250,195,215}), _Vzd({215,208,202,197,219,224,195,246,243,250,195,209}) })
end
function _V387ae85145(id)
	for _, p in ipairs(Players:GetPlayers()) do
		local model, root = p.Character, _Vb2220e5a155(p)
		if id == _Vzd({152,153,148,146,149}) then
			_V6ac4192214e(model)
		elseif id == _Vzd({139,151,138,138,159,138}) then
			_V39f4e99947(root, { _Vzd({215,208,202,197,219,224,199,243,230,230,251,230,195,209}) })
		elseif id == _Vzd({240,243,227,234,245}) then
			_V39f4e99947(root, { _Vzd({215,208,202,197,219,224,208,243,227,234,245,195,209}) })
		elseif id == _Vzd({139,145,142,147,140}) then
			_V39f4e99947(root, { _Vzd({199,237,234,239,232,194,246,243,226,215,230,237,240,228,234,245,250}), _Vzd({215,208,202,197,219,224,195,215}) })
		end
	end
end
function _V0dd482ead7(pos, range)
	local me = hrp()
	if not me then return false end
	range = tonumber(range) or S.auraRange or 50
	if range >= 500 then return true end
	return (pos - me.Position).Magnitude <= range
end
local auraHomeCF = nil
do local _z1923=(3*6);if _z1923<0 and _Vj() then _z1923=_z1923+1 end local _y1923=_Vzd({77,59}) end

function _Vf13a128e6d(cfg, fnPlayers, fnObjects, serverWide)
	if type(cfg) ~= _Vzd({245,226,227,237,230}) then cfg = _V4eaa4b4326() end
	if cfg._id then cfg = _V8e4be6b2ad(cfg._id) end
	local power = tonumber(cfg.power) or tonumber(S.flingPower) or 2500
	if not cfg._customPower then power = tonumber(S.flingPower) or power end
	local t = cfg.target or _Vzd({209,237,226,250,230,243,244})
	local configuredRange = math.max(tonumber(cfg.range) or tonumber(S.auraRange) or 50, 1)
	local playerRange = configuredRange
	local objRange = S.toggles.auraMapWide and configuredRange or math.min(configuredRange, 80)
	if t == _Vzd({209,237,226,250,230,243,244}) or t == _Vzd({117,145,134,158,138,151,152,69,134,147,137,69,116,135,143,138,136,153,152}) then
		local targets = {}
		for _, p in ipairs(Players:GetPlayers()) do
			if _Vd6eb72811f9(p) then
				if _V318f2ee5f3(p) and not plotBypass then
					if S.toggles.plotAmbush ~= false then
						plotWatch[p.UserId] = {
							kind = _Vzd({231,237,234,239,232}), quiet = true, power = power, mapWide = true,
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
				if not _V4a303563e9(p) and not _Vd6eb72811f9(p) then continue end
				local r = _Vb2220e5a155(p)
				if not r then continue end
				pcall(function()
					if r.Position.Y <= -12 then
						me.CFrame = CFrame.new(r.Position + Vector3.new(0, 5, -15))
					else
						me.CFrame = CFrame.new(r.Position + Vector3.new(0, -10, -10))
					end
					_Vb07b7f02185(p, r.Position)
					r = _Vb2220e5a155(p)
					if r and fnPlayers then fnPlayers(p, r, power, playerRange) end
				end)
			end
			pcall(function()
				if auraHomeCF and me.Parent then me.CFrame = auraHomeCF end
			end)
			auraHomeCF = nil
		else
			for _, p in ipairs(targets) do
				local r = _Vb2220e5a155(p)
				if r then
					local me = hrp()
					local dist = me and (r.Position - me.Position).Magnitude or 9999
					if dist <= playerRange then
						pcall(function()
							_V13dafb04187(p, r)
							r = _Vb2220e5a155(p)
							if r and fnPlayers then fnPlayers(p, r, power, playerRange) end
						end)
					end
				end
			end
		end
	end
	if (t == _Vzd({116,135,143,138,136,153,152}) or t == _Vzd({209,237,226,250,230,243,244,161,226,239,229,161,208,227,235,230,228,245,244})) and fnObjects then
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
				if not inst:IsA(_Vzd({195,226,244,230,209,226,243,245})) or inst.Anchored then return end
				if myChar and inst:IsDescendantOf(myChar) then return end
				local model = inst:FindFirstAncestorOfClass(_Vzd({206,240,229,230,237}))
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
function _V13dafb04187(p, r)
	if not p or not r then return end
	local me = hrp()
	local origin = me and me.Position or r.Position
	for _, part in ipairs(p.Character:GetChildren()) do
		if part:IsA(_Vzd({195,226,244,230,209,226,243,245})) then
			sno(part, origin)
		end
	end
end
function _V9891079225(part, power, up)
	if not part then return end
	power = tonumber(power) or 2500
	up = up == nil and 0.5 or up
	local me = hrp()
	local dir
	if me then
		local cf = _Ve5bf781e109(me.Position, part.Position)
		dir = Vector3.new(cf.LookVector.X, up, cf.LookVector.Z)
	else
		dir = Vector3.new(0, 1, 0)
	end
	if dir.Magnitude < 1e-3 then dir = Vector3.yAxis end
	dir = dir.Unit
	pcall(function()
		part.AssemblyLinearVelocity = dir * math.clamp(power, 50, 1e5)
		part.AssemblyAngularVelocity = Vector3.new(power / 60, power / 50, power / 60)
		local old = part:FindFirstChild(_Vzd({215,208,202,197,219,224,195,215}))
		if old then old:Destroy() end
		local bv = Instance.new(_Vzd({195,240,229,250,215,230,237,240,228,234,245,250}))
		bv.Name = _Vzd({215,208,202,197,219,224,195,215})
		bv.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
		bv.Velocity = dir * math.clamp(power, 50, 1e5)
		bv.Parent = part
		Debris:AddItem(bv, 0.25)
	end)
end
do local _z6860=(11*5);if _z6860<0 and _Vj() then _z6860=_z6860+1 end local _y6860=_Vzd({57,63}) end

function _V3731dd511ce(cfg, serverWide)
	cfg = _V8e4be6b2ad(_Vzd({239,230,245,240,248,239}))
	if not hrp() or not FTAP.SetNetworkOwner then return end
	_Vf13a128e6d(cfg, function(p, r)
		_V13dafb04187(p, r)
		if S.toggles.netownGrab and FTAP.CreateGrabLine then
			pcall(function()
				local t = p.Character:FindFirstChild(_Vzd({213,240,243,244,240})) or p.Character:FindFirstChild(_Vzd({214,241,241,230,243,213,240,243,244,240})) or r
				FTAP.CreateGrabLine:FireServer(t, t.CFrame)
			end)
		end
	end, function(part)
		sno(part)
	end, serverWide)
end
function _Ved7b17011ca(cfg, serverWide)
	cfg = _V8e4be6b2ad(_Vzd({139,145,142,147,140}))
	_Vf13a128e6d(cfg, function(_, r, power)
		_V7186e37c24(r, math.clamp(power, 400, 50000), 0.5)
	end, function(part, power)
		_V7186e37c24(part, math.clamp(power, 400, 50000), 0.5)
	end, serverWide)
end
function _V4a68a5281cc(cfg, serverWide)
	cfg = _V8e4be6b2ad(_Vzd({236,234,228,236}))
	_Vf13a128e6d(cfg, function(p, r)
		_Veeb635ec99(p)
		_V07a307c766(r)
		_Vc9836fec182(r)
		_V789bc41e64(r, S.kickType)
	end, nil, serverWide)
end
do local _z802=(7*8); if _z802<0 and _Vj() then _z802=_z802+1 end end
function _Ve10482741c8(cfg, serverWide)
	cfg = _V8e4be6b2ad(_Vzd({229,230,226,245,233}))
	_Vf13a128e6d(cfg, function(p, r)
		_Veeb635ec99(p)
		_V07a307c766(r)
		_Vc9836fec182(r)
		local h = p.Character and p.Character:FindFirstChildOfClass(_Vzd({201,246,238,226,239,240,234,229}))
		if h then pcall(function()
			h.BreakJointsOnDeath = false
			h:ChangeState(Enum.HumanoidStateType.Dead)
			h.Jump, h.Sit = true, false
		end) end
	end, nil, serverWide)
end
function _V87acbb341c2(cfg, serverWide)
	cfg = _V8e4be6b2ad(_Vzd({134,147,136,141,148,151}))
	_Vf13a128e6d(cfg, function(p, r)
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
do local _z1271=(10*8);if _z1271<0 and _Vj() then _z1271=_z1271+1 end local _y1271=_Vzd({80,80}) end

function _V7e3d6b1b1c3(cfg, serverWide)
	cfg = _V8e4be6b2ad(_Vzd({226,245,245,243,226,228,245}))
	_Vf13a128e6d(cfg, function(p, r, power)
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
function _V0b9ee9ed1d3(cfg, serverWide)
	cfg = _V8e4be6b2ad(_Vzd({244,236,250}))
	_Vf13a128e6d(cfg, function(p, r, power)
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
function _Ve3a2e0531d6(cfg, serverWide)
	cfg = _V8e4be6b2ad(_Vzd({244,241,234,239}))
	_Vf13a128e6d(cfg, function(p, r, power)
		local spd = math.clamp(power / 40, 20, 200)
		pcall(function() r.AssemblyAngularVelocity = Vector3.new(0, spd, 0) end)
	end, function(part, power)
		sno(part)
		pcall(function() part.AssemblyAngularVelocity = Vector3.new(10, power / 50, 10) end)
	end, serverWide)
end
function _Vf03214b51d1(cfg, serverWide)
	cfg = _V8e4be6b2ad(_Vzd({243,226,232,229,240,237,237}))
	local bananaModel, bananaPrimary, peel = nil, nil, nil
	local function ensurePeel()
		if bananaModel and bananaModel.Parent and peel and peel.Parent then return true end
		local m, pp = _Vb10ea75e7c(_Vzd({199,240,240,229,195,226,239,226,239,226}))
		if not m or not pp then return false end
		bananaModel, bananaPrimary = m, pp
		peel = nil
		for _, d in ipairs(m:GetDescendants()) do
			if d.Name == _Vzd({195,226,239,226,239,226,209,230,230,237}) and d:FindFirstChildOfClass(_Vzd({213,240,246,228,233,213,243,226,239,244,238,234,245,245,230,243})) then
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
				if d:IsA(_Vzd({195,226,244,230,209,226,243,245})) then d.CanCollide = false end
			end
			local ao = pp:FindFirstChildOfClass(_Vzd({194,237,234,232,239,208,243,234,230,239,245,226,245,234,240,239}))
			if ao then ao.Enabled = false end
		end)
		local head = LP.Character and LP.Character:FindFirstChild(_Vzd({201,230,226,229}))
		local parkY = head and (head.Position.Y + 500) or 500
		local bp = pp:FindFirstChild(_Vzd({215,208,202,197,219,224,194,246,243,226,211,226,232,229,240,237,237,209,226,243,236}))
		if not bp then
			bp = Instance.new(_Vzd({195,240,229,250,209,240,244,234,245,234,240,239}))
			bp.Name = _Vzd({215,208,202,197,219,224,194,246,243,226,211,226,232,229,240,237,237,209,226,243,236})
			bp.MaxForce = Vector3.new(12500, 12500, 12500)
			bp.P = 12500
			bp.Parent = pp
		end
		bp.Position = Vector3.new(0, parkY, 0)
		sno(pp)
		return peel ~= nil
	end
	_Vf13a128e6d(cfg, function(p, r)
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
function _V487b4e581c5(cfg, serverWide)
	cfg = _V8e4be6b2ad(_Vzd({227,243,234,239,232}))
	local me = hrp()
	if not me then return end
	local homeCF = me.CFrame
	if serverWide then
		for _, p in ipairs(Players:GetPlayers()) do
			if p ~= LP and _V4a303563e9(p) and not _V318f2ee5f3(p) and not _V732569ef100(p) then
				local r = _Vb2220e5a155(p)
				if r then
					pcall(function()
						if r.Position.Y <= -12 then
							me.CFrame = CFrame.new(r.Position + Vector3.new(0, 5, -15))
						else
							me.CFrame = CFrame.new(r.Position + Vector3.new(0, -10, -10))
						end
						sno(r, r.Position)
						_Vb07b7f02185(p, r.Position)
						if FTAP.CreateGrabLine then
							local t = p.Character and (p.Character:FindFirstChild(_Vzd({213,240,243,244,240})) or p.Character:FindFirstChild(_Vzd({214,241,241,230,243,213,240,243,244,240})) or r)
							if t then pcall(function() FTAP.CreateGrabLine:FireServer(t, t.CFrame) end) end
						end
						_Veeb635ec99(p)
						for _ = 1, 8 do
							if _Veec038d8d2(r) then break end
							task.wait()
						end
						pcall(function()
							r.CFrame = homeCF * CFrame.new(0, 0, -5)
							_Vb538a53863(r, homeCF * CFrame.new(0, 0, -5))
						end)
					end)
				end
			end
		end
		pcall(function() me.CFrame = homeCF end)
	else
		_Vf13a128e6d(cfg, function(p, r)
			local dest = homeCF * CFrame.new(0, 0, -5)
			pcall(function()
				sno(r, r.Position)
				_Vb07b7f02185(p, r.Position)
				if FTAP.CreateGrabLine then
					local t = p.Character and (p.Character:FindFirstChild(_Vzd({213,240,243,244,240})) or p.Character:FindFirstChild(_Vzd({214,241,241,230,243,213,240,243,244,240})) or r)
					if t then pcall(function() FTAP.CreateGrabLine:FireServer(t, t.CFrame) end) end
				end
				r.CFrame = dest
				_Vb538a53863(r, dest)
			end)
		end, function(part)
			sno(part)
			local dest = homeCF * CFrame.new(0, 0, -5)
			if homeCF then pcall(function() part.CFrame = dest end) end
		end, false)
	end
end
function _V312753201da(cfg, serverWide)
	cfg = _V8e4be6b2ad(_Vzd({247,240,234,229}))
	_Vf13a128e6d(cfg, function(p, r, power)
		pcall(function()
			local char = p.Character
			if char then
				for _, d in ipairs(char:GetDescendants()) do
					if d:IsA(_Vzd({103,134,152,138,117,134,151,153})) then d.CanCollide = false end
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
function _Vfcb16bf51d7(cfg, serverWide)
	cfg = _V8e4be6b2ad(_Vzd({152,153,148,146,149}))
	local power = tonumber(cfg.power) or S.flingPower or 8000
	local depth = math.clamp(power / 300, 10, 60)
	local slam = math.clamp(power * 3, 3000, 100000)
	local function buryModel(model, root)
		if not model or not root then return end
		pcall(function()
			local saved = buriedPartState[model]
			if not saved then saved = {}; buriedPartState[model] = saved end
			for _, d in ipairs(model:GetDescendants()) do
				if d:IsA(_Vzd({195,226,244,230,209,226,243,245})) then
					if not saved[d] then
						saved[d] = { CanCollide = d.CanCollide, CanQuery = d.CanQuery }
					end
					d.CanCollide = false
					d.CanQuery = false
				end
			end
			local hum = model:FindFirstChildOfClass(_Vzd({201,246,238,226,239,240,234,229}))
			if hum then
				hum.Sit = false
				hum.PlatformStand = true
				hum:ChangeState(Enum.HumanoidStateType.Physics)
			end
			_V96b8f82951(model)
			_V07a307c766(root)
			local pos = root.Position
			local underY = pos.Y - depth
			root.CFrame = CFrame.new(pos.X, underY, pos.Z)
			local bv = root:FindFirstChild(_Vzd({123,116,110,105,127,132,103,154,151,158,103,123}))
			if not bv then
				bv = Instance.new(_Vzd({195,240,229,250,215,230,237,240,228,234,245,250}))
				bv.Name = _Vzd({215,208,202,197,219,224,195,246,243,250,195,215})
				bv.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
				bv.Parent = root
			end
			bv.Velocity = Vector3.new(0, -slam, 0)
			root.AssemblyLinearVelocity = Vector3.new(0, -slam, 0)
			local bp = root:FindFirstChild(_Vzd({215,208,202,197,219,224,195,246,243,250,195,209}))
			if not bp then
				bp = Instance.new(_Vzd({195,240,229,250,209,240,244,234,245,234,240,239}))
				bp.Name = _Vzd({215,208,202,197,219,224,195,246,243,250,195,209})
				bp.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
				bp.D = 2000
				bp.P = 1e5
				bp.Parent = root
			end
			bp.Position = Vector3.new(pos.X, underY - 8, pos.Z)
		end)
	end
	_Vf13a128e6d(cfg, function(p, r)
		buryModel(p.Character, r)
	end, nil, serverWide)
end
do local _z753=(3*5); if _z753<0 and _Vj() then _z753=_z753+1 end end
do local _z9571=(3*6);if _z9571<0 and _Vj() then _z9571=_z9571+1 end local _y9571=_Vzd({65,78}) end

function _Vbfb5b64e1cf(cfg, serverWide)
	cfg = _V8e4be6b2ad(_Vzd({240,243,227,234,245}))
	local radius = math.clamp((cfg.range or 50) * 0.35, 8, 40)
	local power = cfg.power or 2500
	local speed = math.clamp(power / 800, 1.5, 8)
	_Vf13a128e6d(cfg, function(p, r)
		local center = auraHomeCF and auraHomeCF.Position or (hrp() and hrp().Position) or r.Position
		local key = p.UserId
		orbitAngles[key] = (orbitAngles[key] or math.random() * math.pi * 2) + speed * 0.12
		local a = orbitAngles[key]
		local target = center + Vector3.new(math.cos(a) * radius, 6 + math.sin(a * 2) * 2, math.sin(a) * radius)
		pcall(function()
			local bp = r:FindFirstChild(_Vzd({215,208,202,197,219,224,208,243,227,234,245,195,209}))
			if not bp then
				bp = Instance.new(_Vzd({195,240,229,250,209,240,244,234,245,234,240,239}))
				bp.Name = _Vzd({215,208,202,197,219,224,208,243,227,234,245,195,209})
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
do local _z9160=(2*11);if _z9160<0 and _Vj() then _z9160=_z9160+1 end local _y9160=_Vzd({49,45}) end

function _V7955e1401db(cfg, serverWide)
	cfg = _V8e4be6b2ad(_Vzd({250,230,230,245}))
	_Vf13a128e6d(cfg, function(p, r, power)
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
function _V05c72a6d1d4(cfg, serverWide)
	cfg = _V8e4be6b2ad(_Vzd({244,240,231,245}))
	local cam = workspace.CurrentCamera
	local look = cam and cam.CFrame.LookVector or Vector3.new(0, 0, -1)
	local dir = Vector3.new(look.X, 0.15, look.Z)
	if dir.Magnitude < 1e-3 then dir = Vector3.new(0, 0.15, -1) end
	dir = dir.Unit
	_Vf13a128e6d(cfg, function(p, r, power)
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
function _Vdf9013cb1c7(cfg, serverWide)
	cfg = _V8e4be6b2ad(_Vzd({228,233,226,240,244}))
	_Vf13a128e6d(cfg, function(p, r, power)
		_V13dafb04187(p, r)
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
function _Vc03a8f321cb(cfg, serverWide)
	cfg = _V8e4be6b2ad(_Vzd({231,243,230,230,251,230}))
	_Vf13a128e6d(cfg, function(p, r)
		pcall(function()
			r.AssemblyLinearVelocity = Vector3.zero
			r.AssemblyAngularVelocity = Vector3.zero
			local bp = r:FindFirstChild(_Vzd({215,208,202,197,219,224,199,243,230,230,251,230,195,209})) or Instance.new(_Vzd({195,240,229,250,209,240,244,234,245,234,240,239}))
			bp.Name = _Vzd({123,116,110,105,127,132,107,151,138,138,159,138,103,117})
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
function _Vded8b0f91cd(cfg, serverWide)
	cfg = _V8e4be6b2ad(_Vzd({237,226,246,239,228,233}))
	_Vf13a128e6d(cfg, function(p, r, power)
		pcall(function()
			local upForce = math.clamp(power, 500, 10000)
			local bv = r:FindFirstChild(_Vzd({215,208,202,197,219,224,205,226,246,239,228,233,195,215}))
			if not bv then
				bv = Instance.new(_Vzd({195,240,229,250,215,230,237,240,228,234,245,250}))
				bv.Name = _Vzd({215,208,202,197,219,224,205,226,246,239,228,233,195,215})
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
function _V4622b4611d5(cfg, serverWide)
	cfg = _V8e4be6b2ad(_Vzd({244,241,234,236,230}))
	_Vf13a128e6d(cfg, function(p, r, power)
		_V9891079225(r, power, 2.5)
		task.delay(0.12, function()
			if r.Parent then _V9891079225(r, power, -3) end
		end)
	end, function(part, power)
		sno(part)
		_V9891079225(part, power, 2)
	end, serverWide)
end
do local _z8627=(11*4);if _z8627<0 and _Vj() then _z8627=_z8627+1 end local _y8627=_Vzd({72,54}) end

function _Vdc8bf5891d2(cfg, serverWide)
	cfg = _V8e4be6b2ad(_Vzd({243,230,241,230,237}))
	_Vf13a128e6d(cfg, function(p, r, power)
		local center = auraHomeCF and auraHomeCF.Position or (hrp() and hrp().Position) or Vector3.zero
		local d = r.Position - center
		if d.Magnitude > 0.5 then
			local dir = d.Unit
			_V7186e37c24(r, math.clamp(power, 400, 50000), 0.3)
			pcall(function()
				r.AssemblyLinearVelocity = dir * math.clamp(power / 12, 80, 600)
			end)
		end
	end, function(part, power)
		sno(part)
		local center = auraHomeCF and auraHomeCF.Position or (hrp() and hrp().Position) or Vector3.zero
		local d = part.Position - center
		if d.Magnitude > 0.5 then
			_V7186e37c24(part, math.clamp(power, 400, 50000), 0.3)
			pcall(function()
				part.AssemblyLinearVelocity = d.Unit * math.clamp(power / 15, 60, 400)
			end)
		end
	end, serverWide)
end
do local _z4966=(6*4);if _z4966<0 and _Vj() then _z4966=_z4966+1 end local _y4966=_Vzd({42,68}) end

function _V6d5877e61c9(cfg, serverWide)
	cfg = _V8e4be6b2ad(_Vzd({231,237,226,245,245,230,239}))
	_Vf13a128e6d(cfg, function(p, r, power)
		pcall(function()
			local hv = r.AssemblyLinearVelocity
			r.AssemblyLinearVelocity = Vector3.new(hv.X * 0.3, -math.clamp(power * 0.4, 50, 600), hv.Z * 0.3)
			r.AssemblyAngularVelocity = Vector3.zero
			local bp = r:FindFirstChild(_Vzd({215,208,202,197,219,224,199,237,226,245,245,230,239,195,209}))
			if not bp then
				bp = Instance.new(_Vzd({195,240,229,250,209,240,244,234,245,234,240,239}))
				bp.Name = _Vzd({215,208,202,197,219,224,199,237,226,245,245,230,239,195,209})
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
function _Vc6909f5b1d0(cfg, serverWide)
	cfg = _V8e4be6b2ad(_Vzd({241,240,234,244,240,239}))
	_Vf13a128e6d(cfg, function(p)
		local head = p.Character and p.Character:FindFirstChild(_Vzd({201,230,226,229}))
		if not head then return end
		local hurts = _Va5291902b8()
		for _, hurt in ipairs(hurts) do pcall(function() hurt.CFrame = head.CFrame end) end
		task.wait()
		for _, hurt in ipairs(hurts) do pcall(function() hurt.Position = Vector3.new(0, -50, 0) end) end
	end, nil, serverWide)
end
do local _z5890=(9*7);if _z5890<0 and _Vj() then _z5890=_z5890+1 end local _y5890=_Vzd({43,49}) end

function _V3344dc311c6(cfg, serverWide)
	cfg = _V8e4be6b2ad(_Vzd({227,246,243,239,226,246,243,226}))
	local model, primary, tip = _V83e3d178b9(_Vzd({196,226,238,241,231,234,243,230}))
	if not tip or not tip:IsA(_Vzd({195,226,244,230,209,226,243,245})) then return end
	tip.Size = Vector3.new(2, 2, 2)
	tip.CanCollide = false
	local home = primary and primary.Position or Vector3.new(0, 400, 0)
	_Vf13a128e6d(cfg, function(_, r)
		pcall(function()
			tip.Position = r.Position
			task.wait()
			tip.Position = home
		end)
	end, nil, serverWide)
	if primary then _Veed92531133(model, primary) end
end
local tkAngles = {}
do local _z917=(5*4); if _z917<0 and _Vj() then _z917=_z917+1 end end
function _V7aae49dc1d8(cfg, serverWide)
	cfg = _V8e4be6b2ad(_Vzd({245,230,237,230,236,234,239,230,244,234,244}))
	local me = hrp()
	if not me then return end
	local shape = S.tkShape or _Vzd({213,240,243,239,226,229,240})
	local cam = workspace.CurrentCamera
	local mouseHit = nil
	pcall(function()
		if Mouse and Mouse.Hit then mouseHit = Mouse.Hit.Position end
	end)
	local center = mouseHit or (cam and (cam.CFrame.Position + cam.CFrame.LookVector * 40)) or me.Position
	_Vf13a128e6d(cfg, function(p, r, power)
		if shape == _Vzd({195,237,226,228,236,233,240,237,230}) then
			local d = center - r.Position
			if d.Magnitude > 1 then
				pcall(function()
					_Vb538a53863(r, CFrame.new(center))
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
				_Vb538a53863(r, CFrame.new(pos))
				r.AssemblyLinearVelocity = Vector3.new(0, math.clamp(power / 80, 20, 80), 0)
			end)
		end
	end, function(part, power)
		sno(part)
		if shape == _Vzd({195,237,226,228,236,233,240,237,230}) then
			local d = center - part.Position
			if d.Magnitude > 1 then
				part.AssemblyLinearVelocity = d.Unit * 60
			end
		end
	end, serverWide)
end
do local _z4802=(4*3);if _z4802<0 and _Vj() then _z4802=_z4802+1 end local _y4802=_Vzd({78,85}) end

function _Vbf85353e1c4(cfg, serverWide)
	S.tkShape = _Vzd({103,145,134,136,144,141,148,145,138})
	_V7aae49dc1d8(cfg, serverWide)
end
function _Vf7867dcb1d9(cfg, serverWide)
	S.tkShape = _Vzd({213,240,243,239,226,229,240})
	_V7aae49dc1d8(cfg, serverWide)
end
local AURA_TICKS = {
	netown = function() _V3731dd511ce(nil, false) end,
	fling = function() _Ved7b17011ca(nil, false) end,
	kick = function() _V4a68a5281cc(nil, false) end,
	death = function() _Ve10482741c8(nil, false) end,
	anchor = function() _V87acbb341c2(nil, false) end,
	attract = function() _V7e3d6b1b1c3(nil, false) end,
	sky = function() _V0b9ee9ed1d3(nil, false) end,
	spin = function() _Ve3a2e0531d6(nil, false) end,
	_V7e5dd05e13e = function() _Vf03214b51d1(nil, false) end,
	bring = function() _V487b4e581c5(nil, false) end,
	void = function() _V312753201da(nil, false) end,
	stomp = function() _Vfcb16bf51d7(nil, false) end,
	orbit = function() _Vbfb5b64e1cf(nil, false) end,
	yeet = function() _V7955e1401db(nil, false) end,
	soft = function() _V05c72a6d1d4(nil, false) end,
	chaos = function() _Vdf9013cb1c7(nil, false) end,
	freeze = function() _Vc03a8f321cb(nil, false) end,
	launch = function() _Vded8b0f91cd(nil, false) end,
	spike = function() _V4622b4611d5(nil, false) end,
	repel = function() _Vdc8bf5891d2(nil, false) end,
	flatten = function() _V6d5877e61c9(nil, false) end,
	poison = function() _Vc6909f5b1d0(nil, false) end,
	burnaura = function() _V3344dc311c6(nil, false) end,
	telekinesis = function() _V7aae49dc1d8(nil, false) end,
	tornado = function() _Vf7867dcb1d9(nil, false) end,
	blackhole = function() _Vbf85353e1c4(nil, false) end,
}
local SERVER_TICKS = {
	netown = function() _V3731dd511ce(nil, true) end,
	fling = function() _Ved7b17011ca(nil, true) end,
	kick = function() _V4a68a5281cc(nil, true) end,
	death = function() _Ve10482741c8(nil, true) end,
	anchor = function() _V87acbb341c2(nil, true) end,
	attract = function() _V7e3d6b1b1c3(nil, true) end,
	sky = function() _V0b9ee9ed1d3(nil, true) end,
	spin = function() _Ve3a2e0531d6(nil, true) end,
	_V7e5dd05e13e = function() _Vf03214b51d1(nil, true) end,
	bring = function() _V487b4e581c5(nil, true) end,
	void = function() _V312753201da(nil, true) end,
	stomp = function() _Vfcb16bf51d7(nil, true) end,
	orbit = function() _Vbfb5b64e1cf(nil, true) end,
	yeet = function() _V7955e1401db(nil, true) end,
	soft = function() _V05c72a6d1d4(nil, true) end,
	chaos = function() _Vdf9013cb1c7(nil, true) end,
	freeze = function() _Vc03a8f321cb(nil, true) end,
	launch = function() _Vded8b0f91cd(nil, true) end,
	spike = function() _V4622b4611d5(nil, true) end,
	repel = function() _Vdc8bf5891d2(nil, true) end,
	flatten = function() _V6d5877e61c9(nil, true) end,
	poison = function() _Vc6909f5b1d0(nil, true) end,
	burnaura = function() _V3344dc311c6(nil, true) end,
	telekinesis = function() _V7aae49dc1d8(nil, true) end,
	tornado = function() _Vf7867dcb1d9(nil, true) end,
	blackhole = function() _Vbf85353e1c4(nil, true) end,
}
local AURA_META = {
	{ id = _Vzd({239,230,245,240,248,239}), title = _Vzd({208,248,239,161,207,230,226,243,227,250}), tip = _Vzd({115,138,153,156,148,151,144,69,148,156,147,69,147,138,134,151,135,158,69,149,145,134,158,138,151,152,69,77,149,151,148,157,142,146,142,153,158,78,83}) },
	{ id = _Vzd({231,237,234,239,232}), title = _Vzd({199,237,234,239,232,161,207,230,226,243,227,250}), tip = _Vzd({199,237,234,239,232,161,239,230,226,243,227,250,161,241,237,226,250,230,243,244,161,169,241,243,240,249,234,238,234,245,250,170,175}) },
	{ id = _Vzd({236,234,228,236}), title = _Vzd({112,142,136,144,69,115,138,134,151,135,158}), tip = _Vzd({120,144,158,69,144,142,136,144,69,147,138,134,151,135,158,69,149,145,134,158,138,151,152,69,77,149,151,148,157,142,146,142,153,158,78,83}) },
	{ id = _Vzd({229,230,226,245,233}), title = _Vzd({204,234,237,237,161,207,230,226,243,227,250}), tip = _Vzd({204,234,237,237,161,239,230,226,243,227,250,161,241,237,226,250,230,243,244,161,169,241,243,240,249,234,238,234,245,250,170,175}) },
	{ id = _Vzd({241,240,234,244,240,239}), title = _Vzd({209,240,234,244,240,239,161,207,230,226,243,227,250}), tip = _Vzd({117,148,142,152,148,147,69,147,138,134,151,135,158,69,149,145,134,158,138,151,152,69,77,149,151,148,157,142,146,142,153,158,78,83}) },
	{ id = _Vzd({135,154,151,147,134,154,151,134}), title = _Vzd({195,246,243,239,161,207,230,226,243,227,250}), tip = _Vzd({195,246,243,239,161,239,230,226,243,227,250,161,241,237,226,250,230,243,244,161,169,241,243,240,249,234,238,234,245,250,170,175}) },
	{ id = _Vzd({226,239,228,233,240,243}), title = _Vzd({195,243,234,230,231,161,199,243,230,230,251,230,161,207,230,226,243,227,250}), tip = _Vzd({194,239,228,233,240,243,161,245,233,230,238,161,231,240,243,161,226,161,238,240,238,230,239,245,161,174,161,242,246,234,228,236,161,241,226,246,244,230,161,245,233,230,239,161,243,230,237,230,226,244,230,175}) },
	{ id = _Vzd({245,240,243,239,226,229,240}), title = _Vzd({121,148,151,147,134,137,148,69,115,138,134,151,135,158}), tip = _Vzd({120,149,142,147,82,145,142,139,153,69,147,138,134,151,135,158,69,149,145,134,158,138,151,152,69,77,149,151,148,157,142,146,142,153,158,78,83}) },
	{ id = _Vzd({227,237,226,228,236,233,240,237,230}), title = _Vzd({209,246,237,237,161,213,240,161,196,246,243,244,240,243}), tip = _Vzd({120,154,136,144,69,147,138,134,151,135,158,69,149,145,134,158,138,151,152,69,153,148,69,136,154,151,152,148,151,69,137,142,151,138,136,153,142,148,147,69,77,149,151,148,157,142,146,142,153,158,78,83}) },
	{ id = _Vzd({226,245,245,243,226,228,245}), title = _Vzd({209,246,237,237,161,207,230,226,243,227,250,161,213,240,161,206,230}), tip = _Vzd({212,246,228,236,161,239,230,226,243,227,250,161,241,237,226,250,230,243,244,161,245,240,248,226,243,229,161,250,240,246,161,169,241,243,240,249,234,238,234,245,250,170,175}) },
	{ id = _Vzd({151,138,149,138,145}), title = _Vzd({209,246,244,233,161,207,230,226,243,227,250,161,194,248,226,250}), tip = _Vzd({209,246,244,233,161,239,230,226,243,227,250,161,241,237,226,250,230,243,244,161,226,248,226,250,161,169,241,243,240,249,234,238,234,245,250,170,175}) },
	{ id = _Vzd({244,236,250}), title = _Vzd({212,236,250,161,195,237,226,244,245}), tip = _Vzd({195,234,232,161,247,230,243,245,234,228,226,237,161,234,238,241,246,237,244,230,161,174,161,245,233,230,250,161,231,237,250,161,246,241,161,233,234,232,233,161,226,239,229,161,231,226,237,237,161,227,226,228,236,175}) },
	{ id = _Vzd({243,226,232,229,240,237,237}), title = _Vzd({211,226,232,229,240,237,237,161,207,230,226,243,227,250}), tip = _Vzd({119,134,140,137,148,145,145,69,147,138,134,151,135,158,69,149,145,134,158,138,151,152,69,77,149,151,148,157,142,146,142,153,158,78,83}) },
	{ id = _Vzd({227,243,234,239,232}), title = _Vzd({195,243,234,239,232,161,207,230,226,243,227,250}), tip = _Vzd({195,243,234,239,232,161,239,230,226,243,227,250,161,241,237,226,250,230,243,244,161,234,239,161,231,243,240,239,245,161,240,231,161,250,240,246,161,169,241,243,240,249,234,238,234,245,250,170,175}) },
	{ id = _Vzd({247,240,234,229}), title = _Vzd({209,233,226,244,230,161,213,233,243,240,246,232,233,161,199,237,240,240,243}), tip = _Vzd({197,234,244,226,227,237,230,161,228,240,237,237,234,244,234,240,239,161,172,161,229,243,240,241,161,174,161,245,233,230,250,161,241,233,226,244,230,161,245,233,243,240,246,232,233,161,245,233,230,161,232,243,240,246,239,229,175}) },
	{ id = _Vzd({244,245,240,238,241}), title = _Vzd({195,246,243,250,161,214,239,229,230,243,232,243,240,246,239,229}), tip = _Vzd({115,148,136,145,142,149,69,80,69,152,145,134,146,69,153,141,138,146,69,154,147,137,138,151,140,151,148,154,147,137,69,134,147,137,69,141,148,145,137,69,153,141,138,146,69,153,141,138,151,138,83}) },
	{ id = _Vzd({240,243,227,234,245}), title = _Vzd({208,243,227,234,245,161,207,230,226,243,227,250}), tip = _Vzd({120,149,142,147,69,147,138,134,151,135,158,69,149,145,134,158,138,151,152,69,134,151,148,154,147,137,69,158,148,154,69,77,149,151,148,157,142,146,142,153,158,78,83}) },
	{ id = _Vzd({250,230,230,245}), title = _Vzd({126,138,138,153,69,115,138,134,151,135,158}), tip = _Vzd({109,148,151,142,159,148,147,153,134,145,69,145,134,154,147,136,141,69,153,148,156,134,151,137,69,153,134,151,140,138,153,69,137,142,151,138,136,153,142,148,147,69,77,145,142,144,138,69,153,141,151,148,156,142,147,140,69,134,69,135,134,145,145,78,83}) },
	{ id = _Vzd({244,240,231,245}), title = _Vzd({212,240,231,245,161,209,246,244,233}), tip = _Vzd({200,230,239,245,237,230,161,228,226,238,230,243,226,174,229,234,243,230,228,245,234,240,239,161,239,246,229,232,230,161,169,237,234,232,233,245,161,241,240,236,230,173,161,239,240,161,244,241,234,239,170,175}) },
	{ id = _Vzd({237,226,246,239,228,233}), title = _Vzd({205,230,247,234,245,226,245,230,161,207,230,226,243,227,250}), tip = _Vzd({196,240,239,245,234,239,246,240,246,244,161,246,241,248,226,243,229,161,231,240,243,228,230,161,174,161,236,230,230,241,244,161,237,234,231,245,234,239,232,161,245,233,230,238,161,248,233,234,237,230,161,240,239,175}) },
	{ id = _Vzd({244,241,234,236,230}), title = _Vzd({120,149,142,144,138,69,115,138,134,151,135,158}), tip = _Vzd({210,246,234,228,236,161,246,241,161,245,233,230,239,161,229,240,248,239,161,227,246,243,244,245,161,239,230,226,243,227,250,161,169,241,243,240,249,234,238,234,245,250,170,175}) },
	{ id = _Vzd({231,243,230,230,251,230}), title = _Vzd({201,240,237,229,161,207,230,226,243,227,250,161,212,245,234,237,237}), tip = _Vzd({196,240,239,245,234,239,246,240,246,244,161,195,240,229,250,209,240,244,234,245,234,240,239,161,241,234,239,161,174,161,231,243,240,251,230,239,161,234,239,161,241,237,226,228,230,161,248,233,234,237,230,161,240,239,175}) },
	{ id = _Vzd({228,233,226,240,244}), title = _Vzd({119,134,147,137,148,146,69,107,145,142,147,140,69,115,138,134,151,135,158}), tip = _Vzd({211,226,239,229,240,238,161,229,234,243,230,228,245,234,240,239,244,161,240,239,161,239,230,226,243,227,250,161,241,237,226,250,230,243,244,161,169,241,243,240,249,234,238,234,245,250,170,175}) },
	{ id = _Vzd({231,237,226,245,245,230,239}), title = _Vzd({200,243,240,246,239,229,161,209,243,230,244,244,161,207,230,226,243,227,250}), tip = _Vzd({196,240,239,245,234,239,246,240,246,244,161,229,240,248,239,248,226,243,229,161,241,243,230,244,244,246,243,230,161,174,161,241,243,230,244,244,161,234,239,245,240,161,232,243,240,246,239,229,161,248,234,245,233,240,246,245,161,227,246,243,250,234,239,232,175}) },
}
for _, m in ipairs(AURA_META) do
	local c = _V8e4be6b2ad(m.id)
	c._id = m.id
end
function _Ve239e5a8164(id, on)
	_V11a5d4671af(_Vzd({226,246,243,226,224}) .. id)
	if on and AURA_TICKS[id] then
		local interval = 0.15
		_V53fa917f1a2(_Vzd({226,246,243,226,224}) .. id, interval, AURA_TICKS[id])
		_V556c1dc412c(HUB_NAME, _Vzd({102,154,151,134,69}) .. id .. _Vzd({161,208,207}), 1.2)
	else
		_V387ae85145(id)
	end
end
function _V46c59b4f178(id, on)
	_V11a5d4671af(_Vzd({244,243,247,224}) .. id)
	S.toggles[_Vzd({244,243,247,224}) .. id] = on == true
	if on and SERVER_TICKS[id] then
		_V53fa917f1a2(_Vzd({244,243,247,224}) .. id, 0.15, SERVER_TICKS[id])
		_V556c1dc412c(HUB_NAME, _Vzd({212,230,243,247,230,243,161}) .. id .. _Vzd({69,116,115,69,161,69,146,134,149,82,156,142,137,138}), 1.5)
	elseif not on then
		_V556c1dc412c(HUB_NAME, _Vzd({212,230,243,247,230,243,161}) .. id .. _Vzd({161,208,199,199}), 1)
	end
end
local _V4b82310314
local _V48738c7e6b
local antiGrabInstalled = false
local extinguishPart
function _V49dbf3c9b0()
	if extinguishPart and extinguishPart.Parent then return extinguishPart end
	pcall(function()
		local map = workspace:FindFirstChild(_Vzd({206,226,241}))
		local hole = map and map:FindFirstChild(_Vzd({201,240,237,230}))
		local poison = hole and hole:FindFirstChild(_Vzd({209,240,234,244,240,239,195,234,232,201,240,237,230}))
		local ep = poison and poison:FindFirstChild(_Vzd({198,249,245,234,239,232,246,234,244,233,209,226,243,245}))
		if ep and ep:IsA(_Vzd({195,226,244,230,209,226,243,245})) then
			extinguishPart = ep
			ep.Size = Vector3.new(0.5, 0.5, 0.5)
			ep.Transparency = 1
		end
	end)
	return extinguishPart
end
do local _z204=(4*10); if _z204<0 and _Vj() then _z204=_z204+1 end end
do local _z2944=(8*7);if _z2944<0 and _Vj() then _z2944=_z2944+1 end local _y2944=_Vzd({70,86}) end

function _Va1ac91f57f()
	local r = hrp()
	if not r then return end
	local fpp = r:FindFirstChild(_Vzd({107,142,151,138,117,145,134,158,138,151,117,134,151,153}))
	if not fpp then return end
	local canBurn = fpp:FindFirstChild(_Vzd({196,226,239,195,246,243,239}))
	if canBurn and canBurn:IsA(_Vzd({195,240,240,237,215,226,237,246,230})) and not canBurn.Value then return end
	local ep = _V49dbf3c9b0()
	if not ep then
		for _, d in ipairs(char() and char():GetDescendants() or {}) do
			if d:IsA(_Vzd({199,234,243,230})) or d:IsA(_Vzd({212,238,240,236,230})) then pcall(function() d:Destroy() end) end
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
function _V5e1309b211()
	if not S.toggles.antiBurn then return end
	_Va1ac91f57f()
	local c = char()
	if not c then return end
	for _, d in ipairs(c:GetDescendants()) do
		if d:IsA(_Vzd({199,234,243,230})) or d:IsA(_Vzd({212,238,240,236,230})) then pcall(function() d:Destroy() end) end
		local n = d.Name:lower()
		if n:find(_Vzd({231,234,243,230})) or n:find(_Vzd({227,246,243,239})) or n:find(_Vzd({241,240,234,244,240,239})) then
			if d:IsA(_Vzd({195,240,240,237,215,226,237,246,230})) then pcall(function() d.Value = false end) end
		end
	end
end
function _Vda0968a218()
	if not S.toggles.antiPaint then return end
	local c = char()
	if not c then return end
	for _, d in ipairs(c:GetDescendants()) do
		local n = d.Name:lower()
		if n:find(_Vzd({241,226,234,239,245})) or n:find(_Vzd({244,241,243,226,250})) or n:find(_Vzd({228,240,237,240,243})) then
			if d:IsA(_Vzd({197,230,228,226,237})) or d:IsA(_Vzd({121,138,157,153,154,151,138})) or d:IsA(_Vzd({209,226,243,245,234,228,237,230,198,238,234,245,245,230,243})) then
				pcall(function() d:Destroy() end)
			elseif d:IsA(_Vzd({195,240,240,237,215,226,237,246,230})) or d:IsA(_Vzd({120,153,151,142,147,140,123,134,145,154,138})) or d:IsA(_Vzd({207,246,238,227,230,243,215,226,237,246,230})) then
				pcall(function()
					if d:IsA(_Vzd({195,240,240,237,215,226,237,246,230})) then d.Value = false end
				end)
			end
		end
	end
	local bc = c:FindFirstChildOfClass(_Vzd({195,240,229,250,196,240,237,240,243,244}))
	if bc then
		pcall(function()
		end)
	end
end
function _Vcc4d036bf()
	local c = char()
	if not c then return end
	for _, d in ipairs(c:GetDescendants()) do
		local n = d.Name:lower()
		if n:find(_Vzd({227,226,239,226,239,226})) or n:find(_Vzd({244,237,234,241})) or n:find(_Vzd({231,240,240,229})) then
			pcall(function() d:Destroy() end)
		end
	end
	local me = hrp()
	if me then
		for _, d in ipairs(workspace:GetChildren()) do
			if d.Name:lower():find(_Vzd({227,226,239,226,239,226})) or d.Name == _Vzd({199,240,240,229,195,226,239,226,239,226}) then
				for _, part in ipairs(d:GetDescendants()) do
					if part:IsA(_Vzd({195,226,244,230,209,226,243,245})) and (part.Position - me.Position).Magnitude < 14 then
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
function _Vbdbff1a11a()
	if S.trainDriving then return end
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
function _Vd2016f03ed(n)
	n = tostring(n or "")
	return n == _Vzd({199,237,234,239,232,194,246,243,226,215,230,237,240,228,234,245,250}) or n == _Vzd({212,236,250,215,230,237,240,228,234,245,250}) or n == _Vzd({204,234,228,236,194,246,243,226,209}) or n == _Vzd({204,234,228,236,194,246,243,226,209,178})
		or n == _Vzd({204,234,228,236,194,246,243,226,200}) or n == _Vzd({215,208,202,197,219,224,195,215}) or n == _Vzd({215,208,202,197,219,224,215,240,234,229,195,215}) or n == _Vzd({195,243,234,239,232,195,240,229,250})
		or n == _Vzd({215,208,202,197,219,224,196,240,246,239,245,230,243}) or n == _Vzd({195,240,229,250,215,230,237,240,228,234,245,250}) or n == _Vzd({103,148,137,158,107,148,151,136,138}) or n == _Vzd({195,240,229,250,194,239,232,246,237,226,243,215,230,237,240,228,234,245,250})
		or n:find(_Vzd({199,237,234,239,232}), 1, true) or n:find(_Vzd({231,237,234,239,232}), 1, true) or n:find(_Vzd({196,240,246,239,245,230,243}), 1, true)
end
do local _z7954=(9*8);if _z7954<0 and _Vj() then _z7954=_z7954+1 end local _y7954=_Vzd({54,86}) end

function _Vac4315d51b8(c)
	c = c or char()
	if not c then return end
	for _, d in ipairs(c:GetDescendants()) do
		local n = d.Name
		if _V83b71d5fc9 and _V83b71d5fc9(n) then
		elseif n == _Vzd({215,208,202,197,219,224,200,246,228,228,234,195,215}) or n == _Vzd({215,208,202,197,219,224,200,246,228,228,234,201,240,237,229}) or n == _Vzd({215,208,202,197,219,224,199,237,250}) or n == _Vzd({215,208,202,197,219,224,199,237,250,200})
			or n == _Vzd({213,243,226,234,239,197,243,234,247,230,195,215}) or n == _Vzd({213,243,226,234,239,197,243,234,247,230,195,200}) or n == _Vzd({215,208,202,197,219,224,196,240,239,245,243,240,237,195,215})
			or n == _Vzd({215,208,202,197,219,224,196,240,239,245,243,240,237,195,200}) or n == _Vzd({215,208,202,197,219,224,196,240,239,245,243,240,237,201,240,237,229}) or n == _Vzd({215,208,202,197,219,224,212,228,243,240,237,237,197,243,226,232}) then
		elseif d:IsA(_Vzd({195,240,229,250,215,230,237,240,228,234,245,250})) or d:IsA(_Vzd({103,148,137,158,107,148,151,136,138})) or d:IsA(_Vzd({195,240,229,250,194,239,232,246,237,226,243,215,230,237,240,228,234,245,250}))
			or d:IsA(_Vzd({103,148,137,158,121,141,151,154,152,153})) or d:IsA(_Vzd({205,234,239,230,226,243,215,230,237,240,228,234,245,250})) or d:IsA(_Vzd({194,239,232,246,237,226,243,215,230,237,240,228,234,245,250}))
			or d:IsA(_Vzd({123,138,136,153,148,151,107,148,151,136,138})) then
			local kill = _Vd2016f03ed(n)
			if not kill then
				pcall(function()
					if d:IsA(_Vzd({195,240,229,250,215,230,237,240,228,234,245,250})) and d.MaxForce.Magnitude > 1e6 then kill = true end
					if d:IsA(_Vzd({195,240,229,250,199,240,243,228,230})) and d.Force.Magnitude > 1e5 then kill = true end
					if d:IsA(_Vzd({205,234,239,230,226,243,215,230,237,240,228,234,245,250})) and (d.MaxForce or 0) > 1e6 then kill = true end
				end)
			end
			if kill then pcall(function() d:Destroy() end) end
		end
	end
end
do local _z1293=(11*8);if _z1293<0 and _Vj() then _z1293=_z1293+1 end local _y1293=_Vzd({50,62}) end

function _Vc017195771()
	if S._antiFlingGroupsReady then return end
	pcall(function()
		PhysicsService:RegisterCollisionGroup(_Vzd({215,208,202,197,219,224,205,240,228,226,237}))
		PhysicsService:RegisterCollisionGroup(_Vzd({123,116,110,105,127,132,116,153,141,138,151,152}))
		PhysicsService:CollisionGroupSetCollidable(_Vzd({215,208,202,197,219,224,205,240,228,226,237}), _Vzd({123,116,110,105,127,132,116,153,141,138,151,152}), false)
	end)
	S._antiFlingGroupsReady = true
end
do local _z184=(9*11); if _z184<0 and _Vj() then _z184=_z184+1 end end
do local _z8538=(2*6);if _z8538<0 and _Vj() then _z8538=_z8538+1 end local _y8538=_Vzd({77,66}) end

function _V528f147f1b()
	_Vc017195771()
	pcall(function()
		local c = char()
		if c then
			for _, p in ipairs(c:GetDescendants()) do
				if p:IsA(_Vzd({195,226,244,230,209,226,243,245})) then
					p.CollisionGroup = _Vzd({215,208,202,197,219,224,205,240,228,226,237})
				end
			end
		end
		for _, pl in ipairs(Players:GetPlayers()) do
			if pl ~= LP and pl.Character then
				for _, p in ipairs(pl.Character:GetDescendants()) do
					if p:IsA(_Vzd({103,134,152,138,117,134,151,153})) then
						p.CollisionGroup = _Vzd({215,208,202,197,219,224,208,245,233,230,243,244})
					end
				end
			end
		end
	end)
end
function _Vc4de92df13()
	if not S.toggles.antiFling then return end
	local c = char()
	local r = hrp()
	local h = hum()
	if not c or not r then return end
	local held = _V3d2da17df5 and _V3d2da17df5()
	local grabbing = S.grabMap and next(S.grabMap) ~= nil
	if not grabbing and _V31313e1ef4 then
		S._afGrabCheck = (S._afGrabCheck or 0) + 1
		if S._afGrabCheck % 10 == 0 then
			grabbing = _V31313e1ef4()
		end
	end
	if grabbing then
		if r.Anchored then r.Anchored = false end
		return
	end
	local v = r.AssemblyLinearVelocity
	local a = r.AssemblyAngularVelocity
	local hot = v.Magnitude > 38 or math.abs(v.Y) > 48 or a.Magnitude > 10
	local thr = (S.toggles.warMode and 28) or 38
	local thrY = (S.toggles.warMode and 40) or 48
	hot = v.Magnitude > thr or math.abs(v.Y) > thrY or a.Magnitude > 10

	S._afStripN = (S._afStripN or 0) + 1
	if hot or S._afStripN >= 2 then
		S._afStripN = 0
		_Vac4315d51b8(c)
		pcall(function()
			for _, d in ipairs(r:GetChildren()) do
				local n = d.Name
				if n == _Vzd({204,234,228,236,194,246,243,226,209}) or n == _Vzd({204,234,228,236,194,246,243,226,209,178}) or n == _Vzd({204,234,228,236,194,246,243,226,200}) or n == _Vzd({212,236,250,215,230,237,240,228,234,245,250})
					or n == _Vzd({199,237,234,239,232,194,246,243,226,215,230,237,240,228,234,245,250}) or n == _Vzd({215,208,202,197,219,224,195,215}) or n == _Vzd({195,243,234,239,232,195,240,229,250}) then
					d:Destroy()
				end
			end
		end)
	end
	local now = os.clock()
	if not S._afGroupAt or (now - S._afGroupAt) > 0.7 then
		S._afGroupAt = now
		_V528f147f1b()
	end
	if hot then
		pcall(function()
			r.AssemblyLinearVelocity = Vector3.zero
			r.AssemblyAngularVelocity = Vector3.zero
			if not held then
				for _, p in ipairs(c:GetChildren()) do
					if p:IsA(_Vzd({195,226,244,230,209,226,243,245})) then
						p.AssemblyLinearVelocity = Vector3.zero
						p.AssemblyAngularVelocity = Vector3.zero
					end
				end
			end
		end)
		if FTAP.StopAllVelocity then
			pcall(function() FTAP.StopAllVelocity:FireServer() end)
		end
		if h then
			pcall(function()
				h.PlatformStand = false
				h.Sit = false
			end)
		end
	elseif h and h.PlatformStand and not held then
		pcall(function() h.PlatformStand = false end)
	end
end
do local _z1426=(9*7);if _z1426<0 and _Vj() then _z1426=_z1426+1 end local _y1426=_Vzd({71,63}) end

function _Vbb41356012()
	if not S.toggles.antiExplode then return end
	local r = hrp()
	local h = hum()
	if not r or not h then return end
	local rag = h:FindFirstChild(_Vzd({211,226,232,229,240,237,237,230,229}))
	local held = _V3d2da17df5 and _V3d2da17df5()
	local grabbing = _V31313e1ef4 and _V31313e1ef4()
	local gucciOn = S.toggles.antiGucci or S.toggles.antiGrab
	if grabbing then
		if r.Anchored then r.Anchored = false end
		return
	end
	if rag and rag.Value then
		if held or gucciOn then
			r.Anchored = false
		else
			r.Anchored = true
			r.AssemblyLinearVelocity = Vector3.zero
			pcall(function() r.AssemblyAngularVelocity = Vector3.zero end)
			_Vac4315d51b8(char())
		end
	elseif r.Anchored then
		r.Anchored = false
		if not S.toggles.invisLine and _V2575215f14f then
			pcall(_V2575215f14f)
		end
	end
end
function _V90bac0fc19()
	if not S.toggles.antiSticky then return end
	local c = char()
	if not c then return end
	for _, d in ipairs(c:GetDescendants()) do
		if d:IsA(_Vzd({195,226,244,230,209,226,243,245})) and d.Massless then
			pcall(function() d.Massless = false end)
		end
		local n = d.Name:lower()
		if n:find(_Vzd({244,245,234,228,236,250}), 1, true) then
			if d:IsA(_Vzd({216,230,237,229})) or d:IsA(_Vzd({216,230,237,229,196,240,239,244,245,243,226,234,239,245})) or d:IsA(_Vzd({211,234,232,234,229,196,240,239,244,245,243,226,234,239,245})) then
				pcall(function() d:Destroy() end)
			end
		end
	end
	for _, ch in ipairs(workspace:GetChildren()) do
		if tostring(ch.Name):lower():find(_Vzd({244,245,234,228,236,250})) or ch.Name == _Vzd({212,241,243,226,250,196,226,239,216,197}) then
			for _, d in ipairs(ch:GetDescendants()) do
				if d:IsA(_Vzd({124,138,145,137,104,148,147,152,153,151,134,142,147,153})) or d:IsA(_Vzd({216,230,237,229})) then
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
		local folder = workspace:FindFirstChild(LP.Name .. _Vzd({212,241,226,248,239,230,229,202,239,213,240,250,244}))
		if not folder then return end
		for _, m in ipairs(folder:GetChildren()) do
			local rem = m:FindFirstChild(_Vzd({120,153,142,136,144,158,119,138,146,148,155,138,151,117,134,151,153}), true)
			if rem and rem:IsA(_Vzd({195,226,244,230,209,226,243,245})) then
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
function _Vffdcd3f210()
	if not S.toggles.antiBlobman then return end
	if S.trainDriving then return end
	if _V99f4e97332() or S._blobSessionActive then return end
	local h = hum()
	if not h or not h.Sit then return end
	local seat = h.SeatPart
	if not seat then return end
	local par = seat.Parent
	local n = (par and tostring(par.Name) or seat.Name):lower()
	if n:find(_Vzd({227,237,240,227})) or n:find(_Vzd({153,151,134,142,147}))
		or (par and par:FindFirstChild(_Vzd({195,237,240,227,238,226,239,212,230,226,245,194,239,229,208,248,239,230,243,212,228,243,234,241,245}))) then
		pcall(function()
			h.Sit = false
			h.PlatformStand = false
			h:ChangeState(Enum.HumanoidStateType.Jumping)
		end)
	end
end
function _Vcd32afd1162(on)
	S.toggles.antiLag = on == true
	pcall(function()
		local ps = LP:FindFirstChild(_Vzd({209,237,226,250,230,243,212,228,243,234,241,245,244}))
		if not ps then return end
		local beam = ps:FindFirstChild(_Vzd({196,233,226,243,226,228,245,230,243,194,239,229,195,230,226,238,206,240,247,230}))
			or ps:FindFirstChild(_Vzd({196,233,226,243,226,228,245,230,243,194,239,229,195,230,226,238,206,240,247,230}), true)
		if beam and (beam:IsA(_Vzd({205,240,228,226,237,212,228,243,234,241,245})) or beam:IsA(_Vzd({212,228,243,234,241,245}))) then
			beam.Disabled = on == true
			_V556c1dc412c(HUB_NAME, _Vzd({102,147,153,142,82,113,134,140,69}) .. (on and _Vzd({208,207,161,169,233,234,229,230,244,161,232,243,226,227,161,237,234,239,230,170}) or _Vzd({208,199,199,161,253,161,243,230,244,245,240,243,234,239,232,161,237,234,239,230})), 2)
		else
			_V556c1dc412c(HUB_NAME, _Vzd({194,239,245,234,174,205,226,232,187,161,196,233,226,243,226,228,245,230,243,194,239,229,195,230,226,238,206,240,247,230,161,239,240,245,161,231,240,246,239,229}), 2)
		end
	end)
	if not on and not S.toggles.invisLine then
		pcall(function()
			_V99e998c676(true)
			_V3bd70b6793()
			if _V2575215f14f then _V2575215f14f() end
		end)
	end
end
local _V962be45f17c
(function()
local waterPartBackup = {}
local waterTerrainBackup = {}
local waterSolidConn = nil
local function _Vd5c87cbd101(part)
	if not part or not part:IsA(_Vzd({195,226,244,230,209,226,243,245})) then return false end
	if part.Name == _Vzd({215,208,202,197,219,224,216,226,245,230,243,216,226,237,236}) then return false end
	if part.Material == Enum.Material.Water then return true end
	local n = part.Name:lower()
	if n:find(_Vzd({156,134,153,138,151}), 1, true) or n:find(_Vzd({148,136,138,134,147}), 1, true) or n:find(_Vzd({244,230,226}), 1, true)
		or n:find(_Vzd({237,226,236,230}), 1, true) or n:find(_Vzd({241,240,240,237}), 1, true) or n:find(_Vzd({243,234,247,230,243}), 1, true) then
		return true
	end
	local p = part.Parent
	if p then
		local pn = p.Name:lower()
		if pn == _Vzd({248,226,245,230,243}) or pn:find(_Vzd({248,226,245,230,243}), 1, true) or pn:find(_Vzd({240,228,230,226,239}), 1, true) then
			return true
		end
	end
	return false
end
local function _V9ab2a83a191(part)
	if not _Vd5c87cbd101(part) then return end
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
local function _V4abd42c7153()
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
local function _Va12c5b835e(src)
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
local function _V70da2f6a115()
	local minV = Vector3.new(-2500, -40, -2500)
	local maxV = Vector3.new(2500, 120, 2500)
	local map = workspace:FindFirstChild(_Vzd({206,226,241}))
	if map then
		local ok, cf, size = pcall(function()
			if map:IsA(_Vzd({206,240,229,230,237})) then
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
local function _V335a8a09190()
	waterTerrainBackup = {}
	local Terrain = workspace.Terrain
	if not Terrain then return 0 end
	local minV, maxV = _V70da2f6a115()
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
											origMats = _Va12c5b835e(materials)
											origOccs = _Va12c5b835e(occupancies)
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
local function _Vff14744f152()
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
local function _V3050e89018f()
	local n = 0
	for _, d in ipairs(workspace:GetDescendants()) do
		if _Vd5c87cbd101(d) then
			_V9ab2a83a191(d)
			n = n + 1
		end
	end
	return n
end
_V962be45f17c = function(on)
	S.toggles.waterWalk = on == true
	_V11a5d4671af(_Vzd({156,134,153,138,151,124,134,145,144}))
	if waterSolidConn then
		pcall(function() waterSolidConn:Disconnect() end)
		waterSolidConn = nil
	end
	if not on then
		_V4abd42c7153()
		_Vff14744f152()
		_V556c1dc412c(HUB_NAME, _Vzd({124,134,153,138,151,69,156,134,145,144,69,116,107,107,69,161,69,156,134,153,138,151,69,151,138,152,153,148,151,138,137}), 1.5)
		return
	end
	for _, d in ipairs(workspace:GetChildren()) do
		if d.Name == _Vzd({215,208,202,197,219,224,216,226,245,230,243,216,226,237,236}) then pcall(function() d:Destroy() end) end
	end
	local partCount = _V3050e89018f()
	local cellCount = 0
	pcall(function() cellCount = _V335a8a09190() end)
	waterSolidConn = workspace.DescendantAdded:Connect(function(d)
		if not S.toggles.waterWalk then return end
		if _Vd5c87cbd101(d) then
			task.defer(function() _V9ab2a83a191(d) end)
		end
	end)
	_V53fa917f1a2(_Vzd({248,226,245,230,243,216,226,237,236}), 1.0, function()
		if not S.toggles.waterWalk then return end
		for part, _ in pairs(waterPartBackup) do
			if part and part.Parent and not part.CanCollide then
				pcall(function() part.CanCollide = true end)
			end
		end
	end)
	_V556c1dc412c(HUB_NAME, _Vzd({216,226,245,230,243,161,244,240,237,234,229,161,253,161}) .. partCount .. _Vzd({69,149,134,151,153,152,69,161,69}) .. cellCount .. _Vzd({161,245,230,243,243,226,234,239,161,228,230,237,237,244}), 2.2)
end
end)()
function _V313715e1bf(grabModel, ourChar)
	if not grabModel or not ourChar then return false end
	for _, d in ipairs(grabModel:GetDescendants()) do
		if d:IsA(_Vzd({216,230,237,229,196,240,239,244,245,243,226,234,239,245})) or d:IsA(_Vzd({216,230,237,229})) then
			local p0, p1 = d.Part0, d.Part1
			if p1 and p1:IsDescendantOf(ourChar) then
				if p0 and (p0:IsDescendantOf(grabModel) or tostring(p0.Name):lower():find(_Vzd({232,243,226,227}), 1, true)) then
					return true
				end
				if p0 and not p0:IsDescendantOf(ourChar) then
					return true
				end
			end
		end
	end
	return false
end
function _V3d2da17df5()
	local held = LP:FindFirstChild(_Vzd({202,244,201,230,237,229}))
	return held ~= nil and held.Value == true
end
function _V31313e1ef4()
	if _V3d2da17df5() then return false end
	local c = char()
	if not c then return false end
	local map = S.grabMap
	if type(map) == _Vzd({245,226,227,237,230}) then
		for gp, _ in pairs(map) do
			if gp and gp.Parent then
				if not _V313715e1bf(gp, c) then
					return true
				end
			end
		end
	end
	for _, child in ipairs(workspace:GetChildren()) do
		if child.Name == _Vzd({108,151,134,135,117,134,151,153,152}) and not _V313715e1bf(child, c) then
			for _, d in ipairs(child:GetDescendants()) do
				if d:IsA(_Vzd({216,230,237,229,196,240,239,244,245,243,226,234,239,245})) or d:IsA(_Vzd({216,230,237,229})) then
					local p0, p1 = d.Part0, d.Part1
					if p1 and p1:IsDescendantOf(c) then
					elseif p0 and p0:IsDescendantOf(c) then
					else
						local target = p1 or p0
						if target and not target:IsDescendantOf(c) then

							local hasDrag = child:FindFirstChild(_Vzd({197,243,226,232,209,226,243,245}), true) ~= nil
							if hasDrag and map and map[child] then
								return true
							end
						end
					end
				end
			end
		end
	end
	return false
end
do local _z7910=(4*3);if _z7910<0 and _Vj() then _z7910=_z7910+1 end local _y7910=_Vzd({68,77}) end

function _V19583ce913b(plot)
	if not plot then return false end
	local sign = plot:FindFirstChild(_Vzd({209,237,240,245,212,234,232,239})) or plot:FindFirstChild(_Vzd({209,237,240,245,212,234,232,239}), true)
	if not sign then
		local owners = plot:FindFirstChild(_Vzd({213,233,234,244,209,237,240,245,244,208,248,239,230,243,244}), true)
		if not owners then return false end
		for _, v in ipairs(owners:GetChildren()) do
			local val = nil
			pcall(function() val = v.Value end)
			if val ~= nil and tostring(val) ~= "" then return true end
		end
		return false
	end
	local owners = sign:FindFirstChild(_Vzd({213,233,234,244,209,237,240,245,244,208,248,239,230,243,244})) or sign:FindFirstChild(_Vzd({213,233,234,244,209,237,240,245,244,208,248,239,230,243,244}), true)
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
function _V0bd3a6a3b7(plot)
	if not plot then return nil end
	local area = plot:FindFirstChild(_Vzd({209,237,240,245,194,243,230,226})) or plot:FindFirstChild(_Vzd({209,237,240,245,194,243,230,226}), true)
	if area and area:IsA(_Vzd({195,226,244,230,209,226,243,245})) then
		return CFrame.new(area.Position + Vector3.new(0, 4, 0))
	end
	for _, name in ipairs({ _Vzd({212,241,226,248,239}), _Vzd({212,241,226,248,239,205,240,228,226,245,234,240,239}), _Vzd({201,240,246,244,230,212,241,226,248,239}), _Vzd({202,239,245,230,243,234,240,243,212,241,226,248,239}), _Vzd({107,145,148,148,151}), _Vzd({195,226,244,230}) }) do
		local p = plot:FindFirstChild(name, true)
		if p and p:IsA(_Vzd({195,226,244,230,209,226,243,245})) then
			return p.CFrame * CFrame.new(0, 3, 0)
		end
	end
	local best, bestVol = nil, 0
	for _, d in ipairs(plot:GetDescendants()) do
		if d:IsA(_Vzd({195,226,244,230,209,226,243,245})) and d.Anchored and d.Size.X * d.Size.Z > bestVol and d.Size.Y < 6 then
			bestVol = d.Size.X * d.Size.Z
			best = d
		end
	end
	if best then
		return CFrame.new(best.Position + Vector3.new(0, 4, 0))
	end
	if plot:IsA(_Vzd({206,240,229,230,237})) then
		local ok, pivot = pcall(function() return plot:GetPivot() end)
		if ok and pivot then return pivot * CFrame.new(0, 5, 0) end
	end
	return nil
end
function _Vce214d5c52()
	local free, owned = {}, {}
	local plots = workspace:FindFirstChild(_Vzd({209,237,240,245,244}))
	if plots then
		for _, plot in ipairs(plots:GetChildren()) do
			if plot:IsA(_Vzd({114,148,137,138,145})) or plot:IsA(_Vzd({199,240,237,229,230,243})) then
				local cf = _V0bd3a6a3b7(plot)
				if cf then
					local entry = { cf = cf, name = plot.Name, free = not _V19583ce913b(plot) }
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
			if d.Name == _Vzd({209,237,240,245,194,243,230,226}) and d:IsA(_Vzd({195,226,244,230,209,226,243,245})) then
				local plot = d.Parent
				local cf = CFrame.new(d.Position + Vector3.new(0, 4, 0))
				local entry = { cf = cf, name = plot and plot.Name or _Vzd({201,240,246,244,230}), free = not _V19583ce913b(plot) }
				if entry.free then free[#free + 1] = entry else owned[#owned + 1] = entry end
			end
		end
	end
	return free, owned
end
function _Vfe3c531a209()
	return S.toggles.warMode == true
end
function _V8e31be5116()
	return _Vfe3c531a209() or S.toggles.antiKill == true
end
function _Vd2eaaf4dca()
	return _Vfe3c531a209() or S.toggles.antiGucci == true or S.toggles.antiGrab == true
end
function _V775485b9d1()
	local h = hum()
	local r = hrp()
	if h then
		pcall(function()
			h.PlatformStand = false
			h.Sit = false
			h.BreakJointsOnDeath = false
			h:SetStateEnabled(Enum.HumanoidStateType.Dead, false)
			if _Vfe3c531a209() then
				h.Health = h.MaxHealth
			end
		end)
	end
	if r then
		pcall(function()
			r.AssemblyLinearVelocity = Vector3.zero
			r.AssemblyAngularVelocity = Vector3.zero
			r.Anchored = false
		end)
	end
end
function _Vcbafef0f1e4(reason, quiet)
	if not _V8e31be5116() then return false end
	local now = tick()
	local cd = _Vfe3c531a209() and 0.85 or 0.55
	if now - (S.lastHouseTpAt or 0) < cd then return false end
	local r = hrp()
	local h = hum()
	if not r then return false end
	_V775485b9d1()
	local free, owned = _Vce214d5c52()
	local pool = (#free > 0) and free or owned
	if #pool == 0 then
		if S.lastSafeCF then
			S.lastHouseTpAt = now
			pcall(function()
				r.CFrame = S.lastSafeCF
				r.AssemblyLinearVelocity = Vector3.zero
				r.AssemblyAngularVelocity = Vector3.zero
			end)
			_V775485b9d1()
			if not quiet then
				_V556c1dc412c(HUB_NAME, _Vzd({194,239,245,234,174,236,234,237,237,161,253,161,239,240,161,233,240,246,244,230,244,161,231,240,246,239,229,161,253,161,237,226,244,245,161,244,226,231,230}), 1.2)
			end
			return true
		end
		if not quiet then
			_V556c1dc412c(HUB_NAME, _Vzd({194,239,245,234,174,236,234,237,237,161,253,161,239,240,161,233,240,246,244,230,161,244,241,240,245,244}), 1.2)
		end
		return false
	end
	local pick = pool[math.random(1, #pool)]
	S.lastHouseTpAt = now
	S.lastSafeCF = pick.cf

	for i = 1, 3 do
		pcall(function()
			r.AssemblyLinearVelocity = Vector3.zero
			r.AssemblyAngularVelocity = Vector3.zero
			r.Anchored = false
			r.CFrame = pick.cf * CFrame.new(
				(math.random() - 0.5) * 4,
				0.4 + 0.3 * i,
				(math.random() - 0.5) * 4
			)
		end)
		if h then
			pcall(function()
				h.PlatformStand = false
				h.Sit = false
				if _Vfe3c531a209() then h.Health = h.MaxHealth end
				h:ChangeState(Enum.HumanoidStateType.GettingUp)
			end)
		end
		if i < 3 then task.wait() end
	end
	_V775485b9d1()
	if FTAP.Struggle then
		pcall(function() FTAP.Struggle:FireServer(LP) end)
		pcall(function() FTAP.Struggle:FireServer() end)
	end
	if FTAP.DestroyGrabLine and not (_V31313e1ef4 and _V31313e1ef4()) then
		pcall(function() FTAP.DestroyGrabLine:FireServer(r) end)
	end
	local dest = pick.cf
	task.spawn(function()
		for _ = 1, 6 do
			local rr = hrp()
			if rr then
				pcall(function()
					rr.CFrame = dest * CFrame.new((math.random() - 0.5) * 2, 0.5, (math.random() - 0.5) * 2)
					rr.AssemblyLinearVelocity = Vector3.zero
					rr.AssemblyAngularVelocity = Vector3.zero
				end)
			end
			RunService.Heartbeat:Wait()
		end
	end)
	if not quiet then
		local tag = pick.free and _Vzd({230,238,241,245,250}) or _Vzd({240,248,239,230,229})
		local why = reason and (_Vzd({161,253,161}) .. reason) or ""
		_V556c1dc412c(HUB_NAME, _Vzd({201,240,246,244,230,161,213,209,161,253,161}) .. pick.name .. _Vzd({161,169}) .. tag .. ")" .. why, 1.2)
	end
	return true
end
do local _z222=(3*11); if _z222<0 and _Vj() then _z222=_z222+1 end end
function _Vd44b173bf7()
	local held = LP:FindFirstChild(_Vzd({202,244,201,230,237,229}))
	if held and held.Value == true then return true end
	local c = char()
	if not c then return false end
	for _, child in ipairs(workspace:GetChildren()) do
		if child.Name == _Vzd({200,243,226,227,209,226,243,245,244}) and _V313715e1bf(child, c) then
			return true
		end
	end
	return false
end
function _V39e4b08317()
	if not _V8e31be5116() then return end
	if S.trainDriving then
		_V775485b9d1()
		return
	end
	local h, r = hum(), hrp()
	if not h or not r then return end
	_V775485b9d1()
	local inWater = false
	pcall(function()
		if h:GetState() == Enum.HumanoidStateType.Swimming then inWater = true end
		if r.Position.Y < -5 then inWater = true end
		local ch = char()
		if ch then
			for _, p in ipairs(ch:GetDescendants()) do
				if p:IsA(_Vzd({195,226,244,230,209,226,243,245})) and p.Position.Y < -5 then
					inWater = true
					break
				end
			end
		end
	end)
	if inWater then
		_Vcbafef0f1e4(_Vzd({248,226,245,230,243}), _Vfe3c531a209())
		return
	end
	if _Vd44b173bf7() then
		_Vcbafef0f1e4(_Vzd({232,243,226,227}), _Vfe3c531a209())
		if _Vd2eaaf4dca() then
			if _V94198221c4 then pcall(_V94198221c4) end
			if _V48738c7e6b then pcall(_V48738c7e6b) end
		end
		return
	end
	local v = r.AssemblyLinearVelocity
	local flingThresh = _Vfe3c531a209() and 80 or 120
	if v.Magnitude > flingThresh or math.abs(v.Y) > (_Vfe3c531a209() and 90 or 120) then
		pcall(function()
			r.AssemblyLinearVelocity = Vector3.zero
			r.AssemblyAngularVelocity = Vector3.zero
		end)
		if _Vac4315d51b8 then _Vac4315d51b8(char()) end
		_Vcbafef0f1e4(_Vzd({231,237,234,239,232}), _Vfe3c531a209())
		return
	end

	local maxRef = S.lastSafeHP or h.MaxHealth
	local drop = _Vfe3c531a209() and 0.15 or 1.25
	if h.Health >= maxRef - 0.1 then
		S.lastSafeHP = h.Health
	elseif h.Health < maxRef - drop then
		pcall(function() h.Health = h.MaxHealth end)
		_Vcbafef0f1e4(_Vzd({229,226,238,226,232,230}), _Vfe3c531a209())
		S.lastSafeHP = h.Health
	end
end
function _V7414540719a()
	S.toggles.antiKill = true
	S.lastSafeHP = hum() and hum().Health
	S.lastSafeCF = hrp() and hrp().CFrame
	_V11a5d4671af(_Vzd({226,239,245,234,204,234,237,237}))
	_V53fa917f1a2(_Vzd({226,239,245,234,204,234,237,237}), _Vfe3c531a209() and 0.04 or 0.1, _V39e4b08317)
	if S.conns.antiKillHealth then
		pcall(function() S.conns.antiKillHealth:Disconnect() end)
		S.conns.antiKillHealth = nil
	end
	local h = hum()
	if h then
		pcall(function()
			h.BreakJointsOnDeath = false
			h:SetStateEnabled(Enum.HumanoidStateType.Dead, false)
		end)
		S.conns.antiKillHealth = h.HealthChanged:Connect(function(hp)
			if not S.toggles.antiKill then return end
			local prev = S.lastSafeHP or h.MaxHealth
			if hp < prev - 0.5 or hp < h.MaxHealth * 0.95 then
				pcall(function() h.Health = h.MaxHealth end)
				_Vcbafef0f1e4(_Vzd({229,226,238,226,232,230}))
				_V775485b9d1()
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
	local isHeld = LP:FindFirstChild(_Vzd({202,244,201,230,237,229}))
	if isHeld then
		S.conns.antiKillHeld = isHeld.Changed:Connect(function(v)
			if v == true and S.toggles.antiKill then
				_Vcbafef0f1e4(_Vzd({232,243,226,227}))
			end
		end)
	end
end
function _Va7283ef61aa()
	S.toggles.antiKill = false
	_V11a5d4671af(_Vzd({134,147,153,142,112,142,145,145}))
	if S.conns.antiKillHealth then
		pcall(function() S.conns.antiKillHealth:Disconnect() end)
		S.conns.antiKillHealth = nil
	end
	if S.conns.antiKillHeld then
		pcall(function() S.conns.antiKillHeld:Disconnect() end)
		S.conns.antiKillHeld = nil
	end
end
local WAR_LOOP_IDS = {
	_Vzd({248,226,243,209,243,240,245,230,228,245}), _Vzd({248,226,243,200,246,228,228,234}), _Vzd({248,226,243,194,239,245,234,204,234,237,237}), _Vzd({248,226,243,194,239,245,234,199,237,234,239,232}),
	_Vzd({248,226,243,194,239,245,234,198,249,241,237,240,229,230}), _Vzd({248,226,243,194,239,245,234,195,246,243,239}), _Vzd({248,226,243,194,239,245,234,212,245,234,228,236,250}), _Vzd({248,226,243,194,239,245,234,215,240,234,229}),
	_Vzd({248,226,243,201,240,246,244,230,201,240,241}),
}
function _V7e9a2f951a9()
	for _, id in ipairs(WAR_LOOP_IDS) do
		_V11a5d4671af(id)
	end
end
function _V0245fe85e6()
	if S._warKillHooks then return end
	S._warKillHooks = true
	local function bindHealth(h)
		if not h then return end
		if S.conns.warKillHealth then
			pcall(function() S.conns.warKillHealth:Disconnect() end)
			S.conns.warKillHealth = nil
		end
		pcall(function()
			h.BreakJointsOnDeath = false
			h:SetStateEnabled(Enum.HumanoidStateType.Dead, false)
		end)
		S.conns.warKillHealth = h.HealthChanged:Connect(function(hp)
			if not _Vfe3c531a209() then return end
			local prev = S.lastSafeHP or h.MaxHealth
			if hp < prev - 0.1 or hp < h.MaxHealth * 0.99 then
				pcall(function() h.Health = h.MaxHealth end)
				_Vcbafef0f1e4(_Vzd({248,226,243,174,229,238,232}), true)
				_V775485b9d1()
				S.lastSafeHP = h.Health
			else
				S.lastSafeHP = hp
			end
		end)
	end
	bindHealth(hum())
	if S.conns.warKillChar then
		pcall(function() S.conns.warKillChar:Disconnect() end)
	end
	S.conns.warKillChar = LP.CharacterAdded:Connect(function()
		task.defer(function()
			if _Vfe3c531a209() then bindHealth(hum()) end
		end)
	end)
	if S.conns.warKillHeld then
		pcall(function() S.conns.warKillHeld:Disconnect() end)
		S.conns.warKillHeld = nil
	end
	task.spawn(function()
		local isHeld = LP:FindFirstChild(_Vzd({202,244,201,230,237,229})) or LP:WaitForChild(_Vzd({202,244,201,230,237,229}), 12)
		if not isHeld or not S._warKillHooks then return end
		S.conns.warKillHeld = isHeld.Changed:Connect(function(v)
			if v == true and _Vfe3c531a209() then
				_V775485b9d1()
				_Vcbafef0f1e4(_Vzd({248,226,243,174,232,243,226,227}), true)
				task.defer(function()
					if _V94198221c4 then pcall(_V94198221c4) end
					if _V48738c7e6b then pcall(_V48738c7e6b) end
					_Vb58e7f88200()
				end)
			end
		end)
	end)
end
function _Vfa40c9d81f7()
	S._warKillHooks = false
	for _, k in ipairs({ _Vzd({248,226,243,204,234,237,237,201,230,226,237,245,233}), _Vzd({248,226,243,204,234,237,237,201,230,237,229}), _Vzd({248,226,243,204,234,237,237,196,233,226,243}) }) do
		if S.conns[k] then
			pcall(function() S.conns[k]:Disconnect() end)
			S.conns[k] = nil
		end
	end
end
function _V9f965f18207(n)
	n = n or 24
	if not FTAP.Struggle then pcall(_V6c6a3f4314a) end
	if not FTAP.Struggle then return end
	for _ = 1, n do
		pcall(function() FTAP.Struggle:FireServer(LP) end)
		pcall(function() FTAP.Struggle:FireServer() end)
	end
end
function _V719e2fa8206(n)
	n = n or 8
	if not FTAP.StopAllVelocity then pcall(_V6c6a3f4314a) end
	if not FTAP.StopAllVelocity then return end
	for _ = 1, n do
		pcall(function() FTAP.StopAllVelocity:FireServer() end)
	end
end
function _Vdb77eee5205(n)
	n = n or 6
	local r = hrp()
	if not r then return end
	if not FTAP.RagdollRemote then pcall(_V6c6a3f4314a) end
	if not FTAP.RagdollRemote then return end
	for _ = 1, n do
		pcall(function() FTAP.RagdollRemote:FireServer(r, 0) end)
	end
end
do local _z7146=(2*3);if _z7146<0 and _Vj() then _z7146=_z7146+1 end local _y7146=_Vzd({61,57}) end

function _V3d0d1885204()
	if _V31313e1ef4 and _V31313e1ef4() then
		if not S.toggles.invisLine and _V2575215f14f then
			pcall(_V2575215f14f)
		end
		return
	end
	local c = char()
	local r = hrp()
	if not c or not r then return end
	if not FTAP.DestroyGrabLine then pcall(_V6c6a3f4314a) end
	if not FTAP.DestroyGrabLine then return end
	pcall(function() FTAP.DestroyGrabLine:FireServer(r) end)
	for _, n in ipairs({ _Vzd({201,246,238,226,239,240,234,229,211,240,240,245,209,226,243,245}), _Vzd({213,240,243,244,240}), _Vzd({214,241,241,230,243,213,240,243,244,240}), _Vzd({205,240,248,230,243,213,240,243,244,240}), _Vzd({201,230,226,229}) }) do
		local p = c:FindFirstChild(n)
		if p then pcall(function() FTAP.DestroyGrabLine:FireServer(p) end) end
	end
	if not S.toggles.invisLine then
		task.defer(function()
			if _V2575215f14f then pcall(_V2575215f14f) end
		end)
	end
end
function _Vdd4daa6520a()
	local c = char()
	local me = hrp()
	if not c or not me then return end
	if not FTAP.SetNetworkOwner then pcall(_V6c6a3f4314a) end
	local origin = me.Position
	for _, n in ipairs({ _Vzd({201,246,238,226,239,240,234,229,211,240,240,245,209,226,243,245}), _Vzd({213,240,243,244,240}), _Vzd({214,241,241,230,243,213,240,243,244,240}), _Vzd({201,230,226,229}) }) do
		local p = c:FindFirstChild(n)
		if p then sno(p, origin) end
	end
end
function _V03f25963203()
	local c = char()
	if not c then return end
	for _, child in ipairs(workspace:GetChildren()) do
		if child.Name == _Vzd({200,243,226,227,209,226,243,245,244}) and _V313715e1bf and _V313715e1bf(child, c) then
			if FTAP.DestroyGrabLine then
				for _, d in ipairs(child:GetDescendants()) do
					if d:IsA(_Vzd({195,226,244,230,209,226,243,245})) then
						pcall(function() FTAP.DestroyGrabLine:FireServer(d) end)
					end
				end
			end
			for _, d in ipairs(child:GetDescendants()) do
				if d:IsA(_Vzd({216,230,237,229,196,240,239,244,245,243,226,234,239,245})) or d:IsA(_Vzd({216,230,237,229})) or d:IsA(_Vzd({194,237,234,232,239,209,240,244,234,245,234,240,239}))
					or d:IsA(_Vzd({194,237,234,232,239,208,243,234,230,239,245,226,245,234,240,239})) or d:IsA(_Vzd({211,234,232,234,229,196,240,239,244,245,243,226,234,239,245})) then
					pcall(function() d:Destroy() end)
				end
			end
			pcall(function() child:Destroy() end)
		end
	end
end
function _Vc5f10b6b208(reason)
	if not _V8e31be5116() then return end
	_V719e2fa8206(6)
	_Vdb77eee5205(4)
	_V9f965f18207(8)
	_V3d0d1885204()
	_Vdd4daa6520a()
	pcall(function() _Vcbafef0f1e4(reason or _Vzd({248,226,243,174,231,230}), true) end)
	task.defer(function()
		if not _Vfe3c531a209() and not S.toggles.antiKill then return end
		_V719e2fa8206(4)
		_V9f965f18207(10)
		_V3d0d1885204()
		_Vdd4daa6520a()
	end)
	task.delay(0.12, function()
		if not _Vfe3c531a209() and not S.toggles.antiKill then return end
		_V719e2fa8206(4)
		_V9f965f18207(8)
		_V3d0d1885204()
		_Vdd4daa6520a()
		pcall(function() _Vcbafef0f1e4(_Vzd({248,226,243,174,231,230,174,179}), true) end)
	end)
end
function _Vb58e7f88200()
	if not FTAP.Struggle and not FTAP.SetNetworkOwner then
		pcall(_V6c6a3f4314a)
	end
	local c = char()
	local r = hrp()
	if not c or not r then return end
	local underAttack = (_V3d2da17df5 and _V3d2da17df5())
		or (_Ve9516036f2 and _Ve9516036f2(c))
		or (_Vd44b173bf7 and _Vd44b173bf7())
	local flung = r.AssemblyLinearVelocity.Magnitude > 90
		or math.abs(r.AssemblyLinearVelocity.Y) > 110

	if not underAttack and not flung then
		_V775485b9d1()
		return
	end
	S._warLastThreatAt = os.clock()
	_V719e2fa8206(underAttack and 4 or 2)
	pcall(function()
		if r then sno(r, r.Position) end
	end)
	_V775485b9d1()
	_V9f965f18207(underAttack and 8 or 4)
	_Vdb77eee5205(underAttack and 3 or 1)
	_V3d0d1885204()
	_V03f25963203()
	if _V0736e096c7 then pcall(_V0736e096c7, c) end
	if _V94198221c4 then pcall(_V94198221c4) end
	if _Vac4315d51b8 then _Vac4315d51b8(c) end
	if underAttack then
		_Vc5f10b6b208(_Vzd({248,226,243,174,232,243,226,227}))
	end
	pcall(function()
		r.AssemblyLinearVelocity = Vector3.zero
		r.AssemblyAngularVelocity = Vector3.zero
		r.Anchored = false
	end)
end
function _V6ddbd74d1a8()
	S._warGen = (S._warGen or 0) + 1
	local warGen = S._warGen
	S.toggles.warMode = true
	pcall(_V6c6a3f4314a)
	pcall(_V5e386855db)
	if not _Vfe3c531a209() or S._warGen ~= warGen then return end
	S.lastSafeHP = (hum() and hum().Health) or S.lastSafeHP
	S.lastSafeCF = (hrp() and hrp().CFrame) or S.lastSafeCF
	S._warLastThreatAt = 0

	_V7e9a2f951a9()

	_V53fa917f1a2(_Vzd({248,226,243,209,243,240,245,230,228,245}), 0.14, function()
		if not _Vfe3c531a209() then return end
		_Vb58e7f88200()
	end)
	_V53fa917f1a2(_Vzd({248,226,243,200,246,228,228,234}), 0.12, function()
		if not _Vfe3c531a209() then return end
		if _V0612b68dc1 then _V0612b68dc1() end
	end)
	_V53fa917f1a2(_Vzd({248,226,243,194,239,245,234,204,234,237,237}), 0.12, function()
		if not _Vfe3c531a209() then return end
		if S.trainDriving then return end
		_V39e4b08317()
	end)
	_V53fa917f1a2(_Vzd({248,226,243,201,240,246,244,230,201,240,241}), 2.2, function()
		if not _Vfe3c531a209() then return end
		if S.trainDriving then return end
		local last = S._warLastThreatAt or 0
		if os.clock() - last > 3.5 then
			_V775485b9d1()
			return
		end
		_V775485b9d1()
		_Vcbafef0f1e4(_Vzd({248,226,243,174,233,240,241}), true)
	end)
	_V53fa917f1a2(_Vzd({248,226,243,194,239,245,234,199,237,234,239,232}), 0.1, function()
		if not _Vfe3c531a209() then return end
		local prev = S.toggles.antiFling
		S.toggles.antiFling = true
		_Vc4de92df13()
		S.toggles.antiFling = prev
	end)
	pcall(function()
		if _V528f147f1b then _V528f147f1b() end
	end)
	_V53fa917f1a2(_Vzd({248,226,243,194,239,245,234,198,249,241,237,240,229,230}), 0.15, function()
		if not _Vfe3c531a209() then return end
		if _Vbb41356012 then _Vbb41356012() end
	end)
	_V53fa917f1a2(_Vzd({248,226,243,194,239,245,234,195,246,243,239}), 0.2, function()
		if not _Vfe3c531a209() then return end
		if _V5e1309b211 then _V5e1309b211() end
	end)
	_V53fa917f1a2(_Vzd({248,226,243,194,239,245,234,212,245,234,228,236,250}), 0.25, function()
		if not _Vfe3c531a209() then return end
		if _V90bac0fc19 then _V90bac0fc19() end
	end)
	_V53fa917f1a2(_Vzd({248,226,243,194,239,245,234,215,240,234,229}), 0.2, function()
		if not _Vfe3c531a209() then return end
		if _Vbdbff1a11a then _Vbdbff1a11a() end
	end)
	_V0245fe85e6()

	task.spawn(function()
		if S._warGen ~= warGen or not _Vfe3c531a209() then return end
		_Vb58e7f88200()
		_V775485b9d1()
	end)
	if S._warGen ~= warGen then
		_V7e9a2f951a9()
		return
	end
	S.toggles.warMode = true
	if _V11c729f31bd then pcall(_V11c729f31bd, _Vzd({248,226,243,206,240,229,230})) end
	if S._toggleRenderers and S._toggleRenderers.warMode then
		pcall(S._toggleRenderers.warMode)
	end
	_V556c1dc412c(HUB_NAME, _Vzd({216,194,211,161,206,208,197,198,161,208,207,161,253,161,237,234,232,233,245,161,199,198,161,241,243,240,245,230,228,245,161,169,237,230,244,244,161,237,226,232,170,161,253,161,176,246,239,248,226,243,174,238,240,229,230}), 2.4)
end
function _Vd931bf231b7()
	S._warGen = (S._warGen or 0) + 1
	S.toggles.warMode = false
	_V7e9a2f951a9()
	_Vfa40c9d81f7()
	if not _Vd2eaaf4dca() then
		local r = hrp()
		if r then
			pcall(function()
				r.Anchored = false
				local bv = r:FindFirstChild(_Vzd({215,208,202,197,219,224,200,246,228,228,234,195,215}))
				if bv then bv:Destroy() end
			end)
		end
		S._gucciThrowGuardUntil = 0
	end
	if _V11c729f31bd then pcall(_V11c729f31bd, _Vzd({248,226,243,206,240,229,230})) end
	if S._toggleRenderers and S._toggleRenderers.warMode then
		pcall(S._toggleRenderers.warMode)
	end
	_V556c1dc412c(HUB_NAME, _Vzd({216,194,211,161,206,208,197,198,161,208,199,199,161,253,161,227,226,228,236,161,245,240,161,250,240,246,243,161,244,230,245,245,234,239,232,244}), 1.4)
end
function _V8be83f23e7()
	if S._warChatInstalled then return end
	S._warChatInstalled = true
	local function handle(msg)
		if type(msg) ~= _Vzd({244,245,243,234,239,232}) then return end
		local m = msg:lower():gsub(_Vzd({223,166,244,172}), ""):gsub(_Vzd({166,244,172,165}), "")
		if m:sub(1, 1) == "/" then m = m:sub(2) end
		if m == _Vzd({246,239,248,226,243,174,238,240,229,230}) or m == _Vzd({246,239,248,226,243,238,240,229,230}) or m == _Vzd({246,239,248,226,243}) or m == _Vzd({248,226,243,174,240,231,231}) or m == _Vzd({248,226,243,240,231,231}) then
			if _Vfe3c531a209() then _Vd931bf231b7() else _V556c1dc412c(HUB_NAME, _Vzd({216,194,211,161,226,237,243,230,226,229,250,161,208,199,199}), 1) end
		elseif m == _Vzd({248,226,243,174,238,240,229,230}) or m == _Vzd({248,226,243,238,240,229,230}) or m == _Vzd({247,240,234,229,251,174,248,226,243}) or m == _Vzd({248,226,243}) then
			if _Vfe3c531a209() then _V556c1dc412c(HUB_NAME, _Vzd({216,194,211,161,226,237,243,230,226,229,250,161,208,207,161,253,161,176,246,239,248,226,243,174,238,240,229,230}), 1.2) else _V6ddbd74d1a8() end
		elseif m == _Vzd({248,226,243,174,227,246,243,244,245}) or m == _Vzd({248,226,243,227,246,243,244,245}) then
			if not _Vfe3c531a209() then _V6ddbd74d1a8() end
			_Vb58e7f88200()
			_Vc5f10b6b208(_Vzd({228,233,226,245,174,227,246,243,244,245}))
			_V556c1dc412c(HUB_NAME, _Vzd({216,194,211,161,195,214,211,212,213,161,169,233,240,246,244,230,161,233,240,241,170}), 1.1)
		end
	end
	pcall(function()
		LP.Chatted:Connect(handle)
	end)
	pcall(function()
		local tcs = TextChatService
		if tcs and tcs.MessageReceived then
			tcs.MessageReceived:Connect(function(msg)
				local ok, text = pcall(function() return msg.Text end)
				local ok2, src = pcall(function() return msg.TextSource end)
				if ok2 and src and src.UserId and src.UserId ~= LP.UserId then return end
				if ok then handle(text) end
			end)
		end
	end)
end
task.defer(function()
	pcall(_V8be83f23e7)
end)
function _V88e400fe151()
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
function _Ve9516036f2(c)
	c = c or char()
	if not c then return false end
	if _V31313e1ef4() then return false end

	if _V3d2da17df5() then return true end

	for _, child in ipairs(workspace:GetChildren()) do
		if child.Name == _Vzd({200,243,226,227,209,226,243,245,244}) and _V313715e1bf(child, c) then
			return true
		end
	end
	return false
end
function _Ve56cd280d0(force)
	if S.toggles.invisLine then return end
	local now = os.clock()
	if not force and S._lastBeamHardRestart and (now - S._lastBeamHardRestart) < 8 then
		return
	end
	S._lastBeamHardRestart = now
	pcall(function()
		local roots = {}
		local ps = LP:FindFirstChild(_Vzd({209,237,226,250,230,243,212,228,243,234,241,245,244}))
		if ps then roots[#roots + 1] = ps end
		local c = char and char() or LP.Character
		if c then roots[#roots + 1] = c end
		for _, root in ipairs(roots) do
			for _, name in ipairs({ _Vzd({196,233,226,243,226,228,245,230,243,194,239,229,195,230,226,238,206,240,247,230}), _Vzd({196,233,226,243,226,228,245,230,243,194,239,229,195,230,226,238}), _Vzd({195,230,226,238,206,240,247,230}) }) do
				local scr = root:FindFirstChild(name) or root:FindFirstChild(name, true)
				if scr and (scr:IsA(_Vzd({205,240,228,226,237,212,228,243,234,241,245})) or scr:IsA(_Vzd({120,136,151,142,149,153}))) then
					scr.Disabled = true
					task.delay(0.05, function()
						if scr.Parent and not S.toggles.invisLine then
							scr.Disabled = false
						end
					end)
				end
			end
			local gs = root:FindFirstChild(_Vzd({200,243,226,227,227,234,239,232,212,228,243,234,241,245})) or root:FindFirstChild(_Vzd({200,243,226,227,227,234,239,232,212,228,243,234,241,245}), true)
			if gs and (gs:IsA(_Vzd({205,240,228,226,237,212,228,243,234,241,245})) or gs:IsA(_Vzd({212,228,243,234,241,245}))) then
				gs.Disabled = false
			end
		end
	end)
end
function _V676cef1e98(d)
	if not d then return false end
	if d:IsA(_Vzd({195,230,226,238})) then
		pcall(function()
			d.Enabled = true
			d.Transparency = NumberSequence.new(0)
			if (d.Width0 or 0) < 0.05 then d.Width0 = 0.22 end
			if (d.Width1 or 0) < 0.05 then d.Width1 = 0.22 end
			if d.Brightness ~= nil then d.Brightness = math.max(d.Brightness or 0, 1) end
			if d.LightEmission ~= nil then d.LightEmission = math.max(d.LightEmission or 0, 0.25) end
			if d.LightInfluence ~= nil then d.LightInfluence = 0 end
		end)
		return true
	elseif d:IsA(_Vzd({213,243,226,234,237})) then
		pcall(function()
			d.Enabled = true
			d.Transparency = NumberSequence.new(0)
		end)
		return true
	elseif d:IsA(_Vzd({211,240,241,230,196,240,239,244,245,243,226,234,239,245})) or d:IsA(_Vzd({211,240,229,196,240,239,244,245,243,226,234,239,245})) or d:IsA(_Vzd({120,149,151,142,147,140,104,148,147,152,153,151,134,142,147,153})) then
		pcall(function() d.Visible = true end)
		return true
	end
	return false
end
function _V6e58c329f0(ch)
	if not ch then return false end
	local n = ch.Name
	return n == _Vzd({200,243,226,227,209,226,243,245,244}) or n == _Vzd({200,243,226,227,205,234,239,230}) or n == _Vzd({200,243,226,227}) or n == _Vzd({200,243,226,227,195,230,226,238})
		or n == _Vzd({103,138,134,146,117,134,151,153,152}) or n == _Vzd({113,142,147,138,117,134,151,153,152})
end
function _V3bd70b6793()
	if S.toggles.invisLine then return 0 end
	local n = 0
	pcall(function()
		local function scan(ch)
			if not ch then return end
			for _, d in ipairs(ch:GetDescendants()) do
				if d:IsA(_Vzd({195,230,226,238})) or d:IsA(_Vzd({213,243,226,234,237})) then
					if _V676cef1e98(d) then n += 1 end
				end
			end
		end
		for _, ch in ipairs(workspace:GetChildren()) do
			if ch.Name == _Vzd({108,151,134,135,117,134,151,153,152}) or ch.Name == _Vzd({200,243,226,227,205,234,239,230}) then
				scan(ch)
			end
		end
		local c = char and char() or LP.Character
		if c then
			for _, d in ipairs(c:GetDescendants()) do
				if d:IsA(_Vzd({195,230,226,238})) then
					if _V676cef1e98(d) then n += 1 end
				end
			end
		end
	end)
	return n
end
do local _z6022=(11*5);if _z6022<0 and _Vj() then _z6022=_z6022+1 end local _y6022=_Vzd({79,54}) end

function _V2575215f14f()
	if S.toggles.invisLine then return end
	pcall(function()
		_V99e998c676(true)
		_V026212e1150()
		_V3bd70b6793()
		_V4fd17682d4()
	end)
	for _, t in ipairs({ 0.05, 0.15, 0.35, 0.7, 1.2, 2.0 }) do
		task.delay(t, function()
			if S.toggles.invisLine then return end
			pcall(function()
				_V99e998c676(true)
				_V3bd70b6793()
				_V026212e1150()
			end)
		end)
	end
end
do local _z9154=(11*10);if _z9154<0 and _Vj() then _z9154=_z9154+1 end local _y9154=_Vzd({75,56}) end

function _V5f5a4998cc(c)
	c = c or char()
	if not c then return end
	if _V31313e1ef4() and not _V3d2da17df5() then return end
	if not _V3d2da17df5() and not _V4eabd652ce() then return end
	for _, d in ipairs(c:GetDescendants()) do
		if d:IsA(_Vzd({124,138,145,137,104,148,147,152,153,151,134,142,147,153})) or d:IsA(_Vzd({216,230,237,229})) or d:IsA(_Vzd({211,234,232,234,229,196,240,239,244,245,243,226,234,239,245}))
			or d:IsA(_Vzd({194,237,234,232,239,209,240,244,234,245,234,240,239})) or d:IsA(_Vzd({194,237,234,232,239,208,243,234,230,239,245,226,245,234,240,239}))
			or d:IsA(_Vzd({195,226,237,237,212,240,228,236,230,245,196,240,239,244,245,243,226,234,239,245})) or d:IsA(_Vzd({201,234,239,232,230,196,240,239,244,245,243,226,234,239,245})) then
			local p0 = d.Part0
			local p1 = d.Part1
			local a0 = d:IsA(_Vzd({196,240,239,244,245,243,226,234,239,245})) and d.Attachment0
			local a1 = d:IsA(_Vzd({196,240,239,244,245,243,226,234,239,245})) and d.Attachment1
			local foreign = false
			if d:IsA(_Vzd({216,230,237,229,196,240,239,244,245,243,226,234,239,245})) or d:IsA(_Vzd({216,230,237,229})) then
				if p1 and p1:IsDescendantOf(c) and p0 and not p0:IsDescendantOf(c) then
					foreign = true
				end
			elseif a0 and a1 then
				local par0 = a0.Parent
				local par1 = a1.Parent
				if par1 and par1:IsDescendantOf(c) and par0 and not par0:IsDescendantOf(c) then
					foreign = true
				end
			end
			if foreign then pcall(function() d:Destroy() end) end
		end
		if _V3d2da17df5() or _V4eabd652ce() then
			if d:IsA(_Vzd({195,240,229,250,215,230,237,240,228,234,245,250})) or d:IsA(_Vzd({195,240,229,250,209,240,244,234,245,234,240,239})) or d:IsA(_Vzd({195,240,229,250,194,239,232,246,237,226,243,215,230,237,240,228,234,245,250}))
				or d:IsA(_Vzd({195,240,229,250,199,240,243,228,230})) or d:IsA(_Vzd({205,234,239,230,226,243,215,230,237,240,228,234,245,250})) or d:IsA(_Vzd({215,230,228,245,240,243,199,240,243,228,230}))
				or d:IsA(_Vzd({194,239,232,246,237,226,243,215,230,237,240,228,234,245,250})) then
				local n = d.Name
				if not _V83b71d5fc9(n) and n ~= _Vzd({195,243,234,239,232,195,240,229,250}) then
					local par = d.Parent
					if par and par:IsA(_Vzd({195,226,244,230,209,226,243,245})) and par:IsDescendantOf(c) then
						pcall(function() d:Destroy() end)
					end
				end
			end
			if d.Name == _Vzd({209,226,243,245,208,248,239,230,243}) then
				local val = nil
				pcall(function() val = d.Value end)
				if val ~= nil and tostring(val) ~= "" and tostring(val) ~= LP.Name then
					pcall(function() d:Destroy() end)
				end
			end
		end
	end
end
function _V0736e096c7(c)
	c = c or char()
	if not c then return end
	if _V31313e1ef4() and not _V3d2da17df5() then return end
	for _, child in ipairs(workspace:GetChildren()) do
		if child.Name == _Vzd({200,243,226,227,209,226,243,245,244}) and _V313715e1bf(child, c) then
			if FTAP.DestroyGrabLine then
				for _, d in ipairs(child:GetDescendants()) do
					if d:IsA(_Vzd({195,226,244,230,209,226,243,245})) then
						pcall(function() FTAP.DestroyGrabLine:FireServer(d) end)
					end
				end
			end
			for _, d in ipairs(child:GetDescendants()) do
				if d:IsA(_Vzd({216,230,237,229,196,240,239,244,245,243,226,234,239,245})) or d:IsA(_Vzd({216,230,237,229})) or d:IsA(_Vzd({194,237,234,232,239,209,240,244,234,245,234,240,239}))
					or d:IsA(_Vzd({194,237,234,232,239,208,243,234,230,239,245,226,245,234,240,239})) or d:IsA(_Vzd({206,240,245,240,243,183,197})) or d:IsA(_Vzd({211,234,232,234,229,196,240,239,244,245,243,226,234,239,245}))
					or d:IsA(_Vzd({195,226,237,237,212,240,228,236,230,245,196,240,239,244,245,243,226,234,239,245})) then
					pcall(function() d:Destroy() end)
				end
			end
			pcall(function() child:Destroy() end)
		end
	end
end
do local _z2173=(8*3);if _z2173<0 and _Vj() then _z2173=_z2173+1 end local _y2173=_Vzd({48,71}) end

function _V720d3f3ac6()
	if not (S.toggles.antiGucci or S.toggles.antiGrab or _Vfe3c531a209()) then return end
	if _V31313e1ef4() and not _V3d2da17df5() then return end
	local c = char()
	local r = hrp()
	if not c or not r then return end
	_V0736e096c7(c)
	pcall(function()
		for _, d in ipairs(c:GetDescendants()) do
			if d:IsA(_Vzd({216,230,237,229,196,240,239,244,245,243,226,234,239,245})) or d:IsA(_Vzd({216,230,237,229})) then
				local p0, p1 = d.Part0, d.Part1
				if p1 and p1:IsDescendantOf(c) and p0 and not p0:IsDescendantOf(c) then
					d:Destroy()
				elseif p0 and p0:IsDescendantOf(c) and p1 and not p1:IsDescendantOf(c) then
					d:Destroy()
				end
			elseif d.Name == _Vzd({209,226,243,245,208,248,239,230,243}) then
				local val = nil
				pcall(function() val = d.Value end)
				if val ~= nil and tostring(val) ~= "" and tostring(val) ~= LP.Name then
					pcall(function() d:Destroy() end)
				end
			end
		end
	end)
	if FTAP.Struggle then
		pcall(function() FTAP.Struggle:FireServer(LP) end)
		pcall(function() FTAP.Struggle:FireServer() end)
	end
	if FTAP.DestroyGrabLine then
		pcall(function() FTAP.DestroyGrabLine:FireServer(r) end)
	end
	pcall(function()
		r.Anchored = false
		local h = hum()
		if h then h.PlatformStand = false; h.Sit = false end
	end)
end
function _V117b71f2cb()
	local c = char()
	local me = hrp()
	if not c or not me then return end
	for _, n in ipairs({ _Vzd({201,246,238,226,239,240,234,229,211,240,240,245,209,226,243,245}), _Vzd({201,230,226,229}), _Vzd({213,240,243,244,240}), _Vzd({214,241,241,230,243,213,240,243,244,240}), _Vzd({205,240,248,230,243,213,240,243,244,240}),
		_Vzd({205,230,231,245,161,194,243,238}), _Vzd({119,142,140,141,153,69,102,151,146}), _Vzd({205,230,231,245,161,205,230,232}), _Vzd({211,234,232,233,245,161,205,230,232}),
		_Vzd({205,230,231,245,214,241,241,230,243,194,243,238}), _Vzd({119,142,140,141,153,122,149,149,138,151,102,151,146}), _Vzd({205,230,231,245,205,240,248,230,243,194,243,238}), _Vzd({211,234,232,233,245,205,240,248,230,243,194,243,238}),
		_Vzd({205,230,231,245,214,241,241,230,243,205,230,232}), _Vzd({211,234,232,233,245,214,241,241,230,243,205,230,232}), _Vzd({205,230,231,245,205,240,248,230,243,205,230,232}), _Vzd({211,234,232,233,245,205,240,248,230,243,205,230,232}) }) do
		local p = c:FindFirstChild(n)
		if p and p:IsA(_Vzd({195,226,244,230,209,226,243,245})) then
			sno(p, me.Position)
			pcall(function()
				p.Anchored = false
				p.Massless = false
			end)
		end
	end
end
S._gucciThrowGuardUntil = 0
S._gucciWasHeld = false
function _V4eabd652ce()
	return (S._gucciThrowGuardUntil or 0) > os.clock()
end
function _Vb0b5b9ebc2(sec)
	sec = sec or 2.25
	local untilT = os.clock() + sec
	if untilT > (S._gucciThrowGuardUntil or 0) then
		S._gucciThrowGuardUntil = untilT
	end
end
function _V83b71d5fc9(name)
	return name == _Vzd({215,208,202,197,219,224,199,237,250}) or name == _Vzd({215,208,202,197,219,224,199,237,250,200}) or name == _Vzd({215,208,202,197,219,224,200,246,228,228,234,195,215})
		or name == _Vzd({215,208,202,197,219,224,200,246,228,228,234,201,240,237,229}) or name == _Vzd({213,243,226,234,239,197,243,234,247,230,195,215}) or name == _Vzd({213,243,226,234,239,197,243,234,247,230,195,200})
end
function _V676f4937cd(c)
	c = c or char()
	if not c then return end
	if _V31313e1ef4() and not _V3d2da17df5() then return end
	for _, d in ipairs(c:GetDescendants()) do
		local n = d.Name
		if _V83b71d5fc9(n) then
		elseif d:IsA(_Vzd({195,240,229,250,215,230,237,240,228,234,245,250})) or d:IsA(_Vzd({195,240,229,250,194,239,232,246,237,226,243,215,230,237,240,228,234,245,250})) or d:IsA(_Vzd({103,148,137,158,107,148,151,136,138}))
			or d:IsA(_Vzd({195,240,229,250,209,240,244,234,245,234,240,239})) or d:IsA(_Vzd({195,240,229,250,213,233,243,246,244,245})) or d:IsA(_Vzd({205,234,239,230,226,243,215,230,237,240,228,234,245,250}))
			or d:IsA(_Vzd({102,147,140,154,145,134,151,123,138,145,148,136,142,153,158})) or d:IsA(_Vzd({215,230,228,245,240,243,199,240,243,228,230})) then

			pcall(function() d:Destroy() end)
		elseif n == _Vzd({212,236,250,215,230,237,240,228,234,245,250}) or n == _Vzd({195,243,234,239,232,195,240,229,250}) or n == _Vzd({204,234,228,236,194,246,243,226,209}) or n == _Vzd({204,234,228,236,194,246,243,226,209,178})
			or n == _Vzd({107,145,142,147,140,102,154,151,134,123,138,145,148,136,142,153,158}) or n == _Vzd({123,116,110,105,127,132,103,123}) or n == _Vzd({215,208,202,197,219,224,215,240,234,229,195,215}) then
			pcall(function() d:Destroy() end)
		end
	end
end
function _V6942e7c1c5()
	local c = char()
	local r = hrp()
	local h = hum()
	if not c or not r then return end
	if FTAP.StopAllVelocity then
		pcall(function() FTAP.StopAllVelocity:FireServer() end)
	end
	if FTAP.RagdollRemote then
		pcall(function() FTAP.RagdollRemote:FireServer(r, 0) end)
	end
	_V676f4937cd(c)
	_V5f5a4998cc(c)
	if _Vac4315d51b8 then _Vac4315d51b8(c) end

	for _, p in ipairs(c:GetDescendants()) do
		if p:IsA(_Vzd({195,226,244,230,209,226,243,245})) then
			pcall(function()
				p.Anchored = false
				p.AssemblyLinearVelocity = Vector3.zero
				p.AssemblyAngularVelocity = Vector3.zero
			end)
		end
	end
	pcall(function()
		r.AssemblyLinearVelocity = Vector3.zero
		r.AssemblyAngularVelocity = Vector3.zero
	end)
	if h then
		pcall(function()
			h.PlatformStand = false
			h.Sit = false
			h.AutoRotate = true
			local st = h:GetState()
			if st == Enum.HumanoidStateType.Physics or st == Enum.HumanoidStateType.Ragdoll
				or st == Enum.HumanoidStateType.FallingDown or st == Enum.HumanoidStateType.Flying then
				h:ChangeState(Enum.HumanoidStateType.GettingUp)
				h:ChangeState(Enum.HumanoidStateType.Running)
			end
		end)
	end
end
function _V4029dc26c3()
	local c = char()
	local r = hrp()
	local h = hum()
	if not c or not r then return end
	if _V31313e1ef4() and not _V3d2da17df5() then return end
	pcall(function()
		r.Anchored = false
		local v = r.AssemblyLinearVelocity
		r.AssemblyLinearVelocity = Vector3.new(v.X * 0.25, math.clamp(v.Y, -90, 55), v.Z * 0.25)
		r.AssemblyAngularVelocity = Vector3.zero
	end)
	if h then
		pcall(function()
			h.PlatformStand = false
			h.Sit = false
		end)
	end
	local now = os.clock()
	if not S._gucciPinFeAt or (now - S._gucciPinFeAt) > 0.1 then
		S._gucciPinFeAt = now
		if FTAP.Struggle then
			pcall(function() FTAP.Struggle:FireServer(LP) end)
			pcall(function() FTAP.Struggle:FireServer() end)
		end
	end
	_V0736e096c7(c)
	if _Vac4315d51b8 then _Vac4315d51b8(c) end
end
do local _z7371=(2*7);if _z7371<0 and _Vj() then _z7371=_z7371+1 end local _y7371=_Vzd({69,76}) end

function _Vb5733ef0c8()
	local h = hum()
	local r = hrp()
	local c = char()
	if not h or not r or not c then return end
	local victim = _Ve9516036f2(c) or _V3d2da17df5()
	local guarding = _V4eabd652ce()
	if not victim and not guarding then return end
	pcall(function()
		h.PlatformStand = false
		h.Sit = false
		h.AutoRotate = true
		r.Anchored = false
	end)

	if not victim and guarding then
		local v = r.AssemblyLinearVelocity
		if v.Magnitude > 45 or math.abs(v.Y) > 55 then
			r.AssemblyLinearVelocity = Vector3.new(v.X * 0.1, math.clamp(v.Y, -30, 20), v.Z * 0.1)
			r.AssemblyAngularVelocity = Vector3.zero
			if _Vac4315d51b8 then _Vac4315d51b8(c) end
		end
		return
	end

	if S._counterKickbackUntil and os.clock() < S._counterKickbackUntil then
		if _Vac4315d51b8 then _Vac4315d51b8(c) end
		local v = r.AssemblyLinearVelocity
		r.AssemblyLinearVelocity = Vector3.new(v.X * 0.15, math.clamp(v.Y, -40, 25), v.Z * 0.15)
		r.AssemblyAngularVelocity = Vector3.zero
		local gbv = r:FindFirstChild(_Vzd({215,208,202,197,219,224,200,246,228,228,234,195,215}))
		if gbv and gbv:IsA(_Vzd({195,240,229,250,215,230,237,240,228,234,245,250})) then gbv.Velocity = Vector3.zero end
		return
	end
	local md = h.MoveDirection
	local spd = math.max(tonumber(h.WalkSpeed) or 16, 16)
	if S.toggles.speed then spd = tonumber(S.walkSpeed) or spd end
	if S.toggles.speedCFrame then spd = spd * (tonumber(S.speedMult) or 1.5) end
	local bv = r:FindFirstChild(_Vzd({215,208,202,197,219,224,200,246,228,228,234,195,215}))
	if not bv then
		bv = Instance.new(_Vzd({195,240,229,250,215,230,237,240,228,234,245,250}))
		bv.Name = _Vzd({215,208,202,197,219,224,200,246,228,228,234,195,215})
		bv.P = 2000
		bv.Parent = r
	end
	bv.MaxForce = Vector3.new(8e5, 0, 8e5)
	if md.Magnitude > 0.06 then
		local dir = md.Unit
		local push = dir * (spd * 1.2)
		pcall(function()
			r.CFrame = r.CFrame + dir * 0.28
			local y = math.clamp(r.AssemblyLinearVelocity.Y, -80, 50)
			r.AssemblyLinearVelocity = Vector3.new(push.X, y, push.Z)
			bv.Velocity = Vector3.new(push.X, 0, push.Z)
		end)
	else
		bv.Velocity = Vector3.zero
		local v = r.AssemblyLinearVelocity
		r.AssemblyLinearVelocity = Vector3.new(v.X * 0.3, v.Y, v.Z * 0.3)
	end

	local space = false
	pcall(function() space = UserInputService:IsKeyDown(Enum.KeyCode.Space) end)
	if space then
		if not S._gucciSpaceHeld then
			S._gucciSpaceHeld = true
			local v = r.AssemblyLinearVelocity
			r.AssemblyLinearVelocity = Vector3.new(v.X, math.max(v.Y, 42), v.Z)
		end
	else
		S._gucciSpaceHeld = false
	end
end
do local _z950=(4*4); if _z950<0 and _Vj() then _z950=_z950+1 end end
function _V94198221c4()
	local c = char()
	local r = hrp()
	local h = hum()
	if not c or not r then return end
	if _V31313e1ef4() and not _V3d2da17df5() then
		return
	end
	local beingHeld = _V3d2da17df5() or _Ve9516036f2(c)
	if not beingHeld and not _V4eabd652ce() then
		return
	end
	if beingHeld then
		_Vb0b5b9ebc2(1.6)
	end
	pcall(function()
		if h then h.PlatformStand = false; h.Sit = false end
		if r then r.Anchored = false end
	end)
	if beingHeld then
		if FTAP.Struggle then
			for _ = 1, 8 do
				pcall(function() FTAP.Struggle:FireServer(LP) end)
				pcall(function() FTAP.Struggle:FireServer() end)
			end
		end
		if FTAP.DestroyGrabLine then
			for _, n in ipairs({ _Vzd({201,246,238,226,239,240,234,229,211,240,240,245,209,226,243,245}), _Vzd({213,240,243,244,240}), _Vzd({214,241,241,230,243,213,240,243,244,240}), _Vzd({201,230,226,229}) }) do
				local p = c:FindFirstChild(n)
				if p then pcall(function() FTAP.DestroyGrabLine:FireServer(p) end) end
			end
		end
		_V0736e096c7(c)
		_V5f5a4998cc(c)
		_Vb5733ef0c8()
	end
	if beingHeld or _V4eabd652ce() then
		if FTAP.StopAllVelocity then
			pcall(function() FTAP.StopAllVelocity:FireServer() end)
		end
		_V676f4937cd(c)
		_Vb5733ef0c8()
	end
	if not _V3d2da17df5() then
		pcall(function() if r then r.Anchored = false end end)
		if _V2575215f14f then pcall(_V2575215f14f) end
	end
end
do local _z4544=(9*13);if _z4544<0 and _Vj() then _z4544=_z4544+1 end local _y4544=_Vzd({88,84}) end

function _V0612b68dc1()
	if not (S.toggles.antiGucci or S.toggles.antiGrab or _Vfe3c531a209()) then return end
	local c = char()
	local r = hrp()
	if not c or not r then return end
	if _V31313e1ef4() and not _V3d2da17df5() then
		local bv = r:FindFirstChild(_Vzd({215,208,202,197,219,224,200,246,228,228,234,195,215}))
		if bv then pcall(function() bv:Destroy() end) end
		return
	end

	_V720d3f3ac6()
	local victim = _Ve9516036f2(c) or _V3d2da17df5()
	local guarding = _V4eabd652ce()
	if not victim and not guarding then
		local bv = r:FindFirstChild(_Vzd({215,208,202,197,219,224,200,246,228,228,234,195,215}))
		if bv then pcall(function() bv:Destroy() end) end
		if r.Anchored and not S.toggles.antiExplode then
			r.Anchored = false
		end
		return
	end
	if victim then
		_Vb0b5b9ebc2(1.8)
		_Vb5733ef0c8()
		S._gucciBreakAcc = (S._gucciBreakAcc or 0) + 1
		if S._gucciBreakAcc >= 2 then
			S._gucciBreakAcc = 0
			_V94198221c4()
			if _V48738c7e6b then pcall(_V48738c7e6b) end
		end
	elseif guarding then
		_Vb5733ef0c8()
	end
end
function _V5e386855db()
	if antiGrabInstalled then return end
	antiGrabInstalled = true
	local function bindCharacter(c)
		if not c then return end
		local r = c:WaitForChild(_Vzd({201,246,238,226,239,240,234,229,211,240,240,245,209,226,243,245}), 8)
		local h = c:WaitForChild(_Vzd({201,246,238,226,239,240,234,229}), 8)
		if not r or not h then return end
		task.spawn(function()
			local fpp = r:FindFirstChild(_Vzd({199,234,243,230,209,237,226,250,230,243,209,226,243,245})) or r:WaitForChild(_Vzd({199,234,243,230,209,237,226,250,230,243,209,226,243,245}), 5)
			if not fpp then return end
			local canBurn = fpp:FindFirstChild(_Vzd({196,226,239,195,246,243,239})) or fpp:WaitForChild(_Vzd({196,226,239,195,246,243,239}), 3)
			if canBurn and canBurn:IsA(_Vzd({195,240,240,237,215,226,237,246,230})) then
				canBurn.Changed:Connect(function(v)
					if v and (S.toggles.antiBurn or S.toggles.antiGucci) then
						task.spawn(function()
							while canBurn.Value and (S.toggles.antiBurn or S.toggles.antiGucci) do
								_Va1ac91f57f()
								task.wait()
							end
						end)
					end
				end)
			end
		end)
		task.spawn(function()
			local head = c:WaitForChild(_Vzd({201,230,226,229}), 8)
			local hrp2 = c:WaitForChild(_Vzd({201,246,238,226,239,240,234,229,211,240,240,245,209,226,243,245}), 8)
			local torso = c:FindFirstChild(_Vzd({213,240,243,244,240})) or c:FindFirstChild(_Vzd({214,241,241,230,243,213,240,243,244,240}))
			local watchParts = {}
			if head then table.insert(watchParts, head) end
			if hrp2 then table.insert(watchParts, hrp2) end
			if torso then table.insert(watchParts, torso) end
			for _, part in ipairs(watchParts) do
				part.ChildAdded:Connect(function(ch)
					if ch.Name == _Vzd({209,226,243,245,208,248,239,230,243}) then
						if S.autoCounter or S.toggles.autoCounter then
							local grabberVal = ch.Value
							local grabberName = nil
							if typeof(grabberVal) == _Vzd({202,239,244,245,226,239,228,230}) and grabberVal:IsA(_Vzd({209,237,226,250,230,243})) then
								grabberName = grabberVal.Name
							elseif grabberVal then
								grabberName = tostring(grabberVal)
							end
							if grabberName and grabberName ~= LP.Name then
								local grabberPlr = Players:FindFirstChild(grabberName)
								if grabberPlr and _Vd6eb72811f9(grabberPlr) then
									task.spawn(_Vc54b5f4762, grabberPlr, _Vb2220e5a155(grabberPlr))
								end
							end
						end
						if S.toggles.antiGucci or S.toggles.antiGrab then
							task.defer(function()
								_V94198221c4()
								_V0612b68dc1()
							end)
						end
					end
				end)
			end
		end)
		task.spawn(function()
			local h2 = c:FindFirstChildOfClass(_Vzd({201,246,238,226,239,240,234,229}))
			if not h2 then return end
			h2:GetPropertyChangedSignal(_Vzd({212,234,245})):Connect(function()
				if not h2.Sit then return end
				if h2.SeatPart and h2.SeatPart.Parent and h2.SeatPart.Parent.Name == _Vzd({196,243,230,226,245,246,243,230,195,237,240,227,238,226,239}) then return end
				if S.autoCounter or S.toggles.autoCounter then
					for _, bp in ipairs({ c:FindFirstChild(_Vzd({201,230,226,229})), c:FindFirstChild(_Vzd({201,246,238,226,239,240,234,229,211,240,240,245,209,226,243,245})), c:FindFirstChild(_Vzd({213,240,243,244,240})), c:FindFirstChild(_Vzd({214,241,241,230,243,213,240,243,244,240})) }) do
						if bp then
							local po = bp:FindFirstChild(_Vzd({209,226,243,245,208,248,239,230,243}))
							if po then
								local val = po.Value
								local grabberName = (typeof(val) == _Vzd({202,239,244,245,226,239,228,230}) and val:IsA(_Vzd({209,237,226,250,230,243}))) and val.Name or tostring(val or "")
								if grabberName ~= "" and grabberName ~= LP.Name then
									local grabberPlr = Players:FindFirstChild(grabberName)
									if grabberPlr and _Vd6eb72811f9(grabberPlr) then
										task.spawn(_Vc54b5f4762, grabberPlr, _Vb2220e5a155(grabberPlr))
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
						_V94198221c4()
						_V0612b68dc1()
					end)
				end
			end)
		end)
		local rag = h:FindFirstChild(_Vzd({119,134,140,137,148,145,145,138,137}))
		if rag and rag:IsA(_Vzd({195,240,240,237,215,226,237,246,230})) then
			rag.Changed:Connect(function(v)
				if v and S.toggles.antiExplode then
					task.spawn(function()
						while rag.Value and S.toggles.antiExplode do
							if _V31313e1ef4 and _V31313e1ef4() then
								r.Anchored = false
							elseif _V3d2da17df5 and _V3d2da17df5() then
								r.Anchored = false
							elseif S.toggles.antiGucci or S.toggles.antiGrab then
								r.Anchored = false
								if _Vb5733ef0c8 then pcall(_Vb5733ef0c8) end
							else
								r.Anchored = true
								r.AssemblyLinearVelocity = Vector3.zero
							end
							task.wait()
						end
						r.AssemblyLinearVelocity = Vector3.zero
						r.Anchored = false
						if not S.toggles.invisLine and _V2575215f14f then
							pcall(_V2575215f14f)
						end
					end)
				end
			end)
		end
	end
	if LP.Character then task.spawn(bindCharacter, LP.Character) end
	LP.CharacterAdded:Connect(function(c) task.spawn(bindCharacter, c) end)
	local gucciAcc = 0
	local gucciIdleSkip = 0
	_V64544f4b29(_Vzd({232,246,228,228,234,194,239,245,234,201,195}), RunService.Heartbeat:Connect(function(dt)
		if not (S.toggles.antiGucci or S.toggles.antiGrab) then
			gucciIdleSkip += 1
			if gucciIdleSkip < 20 then return end
			gucciIdleSkip = 0
			local rr = hrp()
			if rr then
				local bv = rr:FindFirstChild(_Vzd({215,208,202,197,219,224,200,246,228,228,234,195,215}))
				if bv then pcall(function() bv:Destroy() end) end
				if rr.Anchored then rr.Anchored = false end
			end
			S._gucciThrowGuardUntil = 0
			return
		end
		gucciIdleSkip = 0
		if _V3d2da17df5() then
			gucciAcc += dt
			if gucciAcc >= 0.12 then
				gucciAcc = 0
				_Vb5733ef0c8()
				S._gucciHeavyN = (S._gucciHeavyN or 0) + 1
				if S._gucciHeavyN >= 3 then
					S._gucciHeavyN = 0
					_V4029dc26c3()
					_V676f4937cd()
					_V0736e096c7()
				end
			end
			return
		end
		if _V31313e1ef4() then return end
		local guarding = _V4eabd652ce()
		if guarding then
			gucciAcc += dt
			if gucciAcc >= 0.1 then
				gucciAcc = 0
				_Vb5733ef0c8()
			end
			return
		end
		gucciAcc += dt
		if gucciAcc >= 0.25 then
			gucciAcc = 0
			_V0612b68dc1()
		end
	end))

	if S.conns.gucciAntiRS then
		pcall(function() S.conns.gucciAntiRS:Disconnect() end)
		S.conns.gucciAntiRS = nil
	end
	task.spawn(function()
		local isHeld = LP:FindFirstChild(_Vzd({202,244,201,230,237,229})) or LP:WaitForChild(_Vzd({202,244,201,230,237,229}), 15)
		if not isHeld then return end
		S._gucciWasHeld = isHeld.Value == true
		isHeld.Changed:Connect(function(held)
			if not (S.toggles.antiGrab or S.toggles.antiGucci) then return end
			if held == true then
				S._gucciWasHeld = true
				_Vb0b5b9ebc2(1.6)
				_Vb5733ef0c8()
				_V94198221c4()
				task.delay(0.2, function()
					if _V3d2da17df5() then _V94198221c4() end
				end)
			else
				S._gucciWasHeld = false
				_Vb0b5b9ebc2(1.4)
				local rr = hrp()
				if rr then
					pcall(function()
						rr.Anchored = false
						local v = rr.AssemblyLinearVelocity
						if v.Magnitude > 40 then
							rr.AssemblyLinearVelocity = Vector3.new(v.X * 0.15, math.clamp(v.Y, -40, 25), v.Z * 0.15)
						end
					end)
				end
				task.spawn(function()
					local t0 = os.clock()
					while os.clock() - t0 < 0.9 and (S.toggles.antiGucci or S.toggles.antiGrab) do
						if _V3d2da17df5() then break end
						_Vb5733ef0c8()
						task.wait(0.08)
					end
					local r2 = hrp()
					if r2 then
						local bv = r2:FindFirstChild(_Vzd({215,208,202,197,219,224,200,246,228,228,234,195,215}))
						if bv then pcall(function() bv:Destroy() end) end
						r2.Anchored = false
					end
				end)
			end
		end)
	end)

	task.spawn(function()
		local function hookChar(c)
			if not c then return end
			c.DescendantAdded:Connect(function(ch)
				if not (S.toggles.antiGucci or S.toggles.antiGrab) then return end
				if _V31313e1ef4() and not _V3d2da17df5() then return end
				if not (_V3d2da17df5() or _V4eabd652ce()) then return end
				local n = ch.Name
				if _V83b71d5fc9(n) then return end
				if ch:IsA(_Vzd({195,240,229,250,215,230,237,240,228,234,245,250})) or ch:IsA(_Vzd({195,240,229,250,194,239,232,246,237,226,243,215,230,237,240,228,234,245,250})) or ch:IsA(_Vzd({195,240,229,250,199,240,243,228,230}))
					or ch:IsA(_Vzd({195,240,229,250,209,240,244,234,245,234,240,239})) or ch:IsA(_Vzd({205,234,239,230,226,243,215,230,237,240,228,234,245,250})) or ch:IsA(_Vzd({123,138,136,153,148,151,107,148,151,136,138}))
					or n == _Vzd({212,236,250,215,230,237,240,228,234,245,250}) or n == _Vzd({195,243,234,239,232,195,240,229,250}) or n == _Vzd({112,142,136,144,102,154,151,134,117}) or n == _Vzd({204,234,228,236,194,246,243,226,209,178}) then
					task.defer(function()
						pcall(function() ch:Destroy() end)
						_V6942e7c1c5()
					end)
				end
			end)
		end
		if LP.Character then hookChar(LP.Character) end
		LP.CharacterAdded:Connect(hookChar)
	end)
end
do local _z657=(9*4); if _z657<0 and _Vj() then _z657=_z657+1 end end
do local _z4700=(2*13);if _z4700<0 and _Vj() then _z4700=_z4700+1 end local _y4700=_Vzd({70,52}) end

function _Ve2b5506a16c(on)
	S.toggles.crazyLine = on == true
	_V11a5d4671af(_Vzd({228,243,226,251,250,205,234,239,230}))
	if not on then
		_V556c1dc412c(HUB_NAME, _Vzd({196,243,226,251,250,161,205,234,239,230,161,208,199,199}), 1)
		return
	end
	if S.toggles.invisLine then
		S.toggles.invisLine = false
		_V11a5d4671af(_Vzd({234,239,247,234,244,205,234,239,230}))
	end
	if not FTAP.CreateGrabLine then _V6c6a3f4314a() end
	_V556c1dc412c(HUB_NAME, _Vzd({196,243,226,251,250,161,205,234,239,230,161,208,207,161,169,244,240,231,245,161,237,226,232,161,237,234,239,230,244,170}), 1.5)
	local lagCF = CFrame.new(
		0.12640380859375, 0.9606337547302246, -0.5000009536743164,
		0.9985212683677673, 0, -0.05436277016997337,
		-6.4805472099749295e-9, 1, -1.1903301100346653e-7,
		0.05436277016997337, 5.9604644775390625e-8, 0.9985212683677673
	)
	_V53fa917f1a2(_Vzd({228,243,226,251,250,205,234,239,230}), 0.05, function()
		if not S.toggles.crazyLine or not FTAP.CreateGrabLine then return end
		for _, pl in ipairs(Players:GetPlayers()) do
			if pl ~= LP and _Vd6eb72811f9(pl) and not _V732569ef100(pl) then
				local t = pl.Character and (pl.Character:FindFirstChild(_Vzd({213,240,243,244,240})) or pl.Character:FindFirstChild(_Vzd({214,241,241,230,243,213,240,243,244,240})) or _Vb2220e5a155(pl))
				if t then
					pcall(function() FTAP.CreateGrabLine:FireServer(t, lagCF) end)
				end
			end
		end
	end)
end
do local _z2360=(10*12);if _z2360<0 and _Vj() then _z2360=_z2360+1 end local _y2360=_Vzd({75,41}) end

function _V99e998c676(force)
	if S.toggles.invisLine then return end
	if S.toggles.antiLag and not force then return end
	pcall(function()
		local roots = {}
		local ps = LP:FindFirstChild(_Vzd({209,237,226,250,230,243,212,228,243,234,241,245,244}))
		if ps then roots[#roots + 1] = ps end
		local pg = LP:FindFirstChild(_Vzd({209,237,226,250,230,243,200,246,234}))
		if pg then roots[#roots + 1] = pg end
		local c = char and char() or LP.Character
		if c then roots[#roots + 1] = c end
		for _, root in ipairs(roots) do
			for _, name in ipairs({ _Vzd({196,233,226,243,226,228,245,230,243,194,239,229,195,230,226,238,206,240,247,230}), _Vzd({196,233,226,243,226,228,245,230,243,194,239,229,195,230,226,238}), _Vzd({103,138,134,146,114,148,155,138}), _Vzd({200,243,226,227,227,234,239,232,212,228,243,234,241,245}) }) do
				local scr = root:FindFirstChild(name) or root:FindFirstChild(name, true)
				if scr and (scr:IsA(_Vzd({205,240,228,226,237,212,228,243,234,241,245})) or scr:IsA(_Vzd({212,228,243,234,241,245}))) then
					if scr.Disabled then scr.Disabled = false end
				end
			end
		end
	end)
end
do local _z289=(5*9); if _z289<0 and _Vj() then _z289=_z289+1 end end
function _V7d6cc73178()
	pcall(function()
		local roots = {
			LP:FindFirstChild(_Vzd({209,237,226,250,230,243,212,228,243,234,241,245,244})),
			char and char() or LP.Character,
		}
		for _, root in ipairs(roots) do
			if root then
				local gs = root:FindFirstChild(_Vzd({200,243,226,227,227,234,239,232,212,228,243,234,241,245})) or root:FindFirstChild(_Vzd({200,243,226,227,227,234,239,232,212,228,243,234,241,245}), true)
				if gs and (gs:IsA(_Vzd({205,240,228,226,237,212,228,243,234,241,245})) or gs:IsA(_Vzd({212,228,243,234,241,245}))) and gs.Disabled then
					gs.Disabled = false
				end
			end
		end
	end)
end
do local _z9580=(5*9);if _z9580<0 and _Vj() then _z9580=_z9580+1 end local _y9580=_Vzd({79,76}) end

function _V23099741ef(d)
	if not d or not d:IsA(_Vzd({195,226,244,230,209,226,243,245})) then return false end
	local n = d.Name:lower()
	if n == _Vzd({229,243,226,232,241,226,243,245}) or n == _Vzd({232,243,226,227,241,226,243,245}) or n == _Vzd({233,240,237,229,241,226,243,245}) or n == _Vzd({233,234,245,241,226,243,245}) then return true end
	if n:find(_Vzd({229,243,226,232}), 1, true) and n:find(_Vzd({241,226,243,245}), 1, true) then return true end
	return false
end
function _V4fd17682d4(root)
	pcall(function()
		local function hideOne(d)
			if not _V23099741ef(d) then return end
			d.Transparency = 1
			d.LocalTransparencyModifier = 1
			pcall(function() d.CastShadow = false end)
			for _, kid in ipairs(d:GetChildren()) do
				if kid:IsA(_Vzd({212,230,237,230,228,245,234,240,239,195,240,249})) or kid:IsA(_Vzd({212,230,237,230,228,245,234,240,239,212,241,233,230,243,230}))
					or kid:IsA(_Vzd({195,240,249,201,226,239,229,237,230,194,229,240,243,239,238,230,239,245})) or kid:IsA(_Vzd({212,241,233,230,243,230,201,226,239,229,237,230,194,229,240,243,239,238,230,239,245}))
					or kid:IsA(_Vzd({201,234,232,233,237,234,232,233,245})) then
					pcall(function() kid:Destroy() end)
				end
			end
		end
		local function scan(ch)
			if not ch then return end
			if ch:IsA(_Vzd({195,226,244,230,209,226,243,245})) then hideOne(ch) end
			for _, d in ipairs(ch:GetDescendants()) do
				if d:IsA(_Vzd({195,226,244,230,209,226,243,245})) then hideOne(d) end
				if d:IsA(_Vzd({212,230,237,230,228,245,234,240,239,195,240,249})) or d:IsA(_Vzd({195,240,249,201,226,239,229,237,230,194,229,240,243,239,238,230,239,245})) then
					local ad = d.Adornee or d.Parent
					if ad and _V23099741ef(ad) then
						pcall(function() d:Destroy() end)
					end
				end
			end
		end
		if root then
			scan(root)
		else
			for _, ch in ipairs(workspace:GetChildren()) do
				if ch.Name == _Vzd({200,243,226,227,209,226,243,245,244}) or ch.Name == _Vzd({108,151,134,135,113,142,147,138}) then
					scan(ch)
				end
			end
		end
	end)
end
function _V026212e1150(root)
	if S.toggles.invisLine then return end
	pcall(function()
		local function fixContainer(ch)
			if not ch then return end
			for _, d in ipairs(ch:GetDescendants()) do
				_V676cef1e98(d)
				if d:IsA(_Vzd({195,226,244,230,209,226,243,245})) then
					if _V23099741ef(d) then
						d.Transparency = 1
						d.LocalTransparencyModifier = 1
					else
						local n = d.Name:lower()
						if n:find(_Vzd({227,230,226,238}), 1, true) or n:find(_Vzd({237,234,239,230}), 1, true) or n:find(_Vzd({243,240,241,230}), 1, true)
							or n == _Vzd({232,243,226,227,237,234,239,230}) or n == _Vzd({244,245,243,234,239,232}) then
							if d.Transparency > 0.85 then
								d.Transparency = 0
							end
							d.LocalTransparencyModifier = 0
						end
					end
				end
			end
		end
		if root then
			fixContainer(root)
			_V4fd17682d4(root)
		end
		for _, ch in ipairs(workspace:GetChildren()) do
			if ch.Name == _Vzd({200,243,226,227,209,226,243,245,244}) or ch.Name == _Vzd({200,243,226,227,205,234,239,230}) or ch.Name == _Vzd({200,243,226,227}) then
				fixContainer(ch)
				_V4fd17682d4(ch)
			end
		end
		local c = char()
		if c then
			fixContainer(c)
		end
		_V3bd70b6793()
		_V99e998c676()
	end)
end
function _Vdfe561b120b(beam)
	if not beam or not beam:IsA(_Vzd({195,230,226,238})) then return end
	if beam:GetAttribute(_Vzd({215,208,202,197,219,224,195,230,226,238,216,226,245,228,233})) then return end
	beam:SetAttribute(_Vzd({215,208,202,197,219,224,195,230,226,238,216,226,245,228,233}), true)
	local function reShow()
		if S.toggles.invisLine then return end
		_V676cef1e98(beam)
	end
	pcall(function()
		beam:GetPropertyChangedSignal(_Vzd({198,239,226,227,237,230,229})):Connect(reShow)
		beam:GetPropertyChangedSignal(_Vzd({213,243,226,239,244,241,226,243,230,239,228,250})):Connect(reShow)
	end)
	reShow()
end
function _V6b6e1e43df()
	S._grabLineWatchdog = true
	S._grabLineKeepAlive = true
	local function hookContainer(ch)
		if not ch then return end
		pcall(function()
			for _, d in ipairs(ch:GetDescendants()) do
				if d:IsA(_Vzd({195,230,226,238})) then _Vdfe561b120b(d) end
			end
			if ch:GetAttribute(_Vzd({215,208,202,197,219,224,200,243,226,227,201,240,240,236})) then return end
			ch:SetAttribute(_Vzd({215,208,202,197,219,224,200,243,226,227,201,240,240,236}), true)
			ch.DescendantAdded:Connect(function(d)
				if d:IsA(_Vzd({195,230,226,238})) then
					task.defer(function()
						_Vdfe561b120b(d)
						if not S.toggles.invisLine then _V676cef1e98(d) end
					end)
				end
			end)
		end)
	end
	for _, ch in ipairs(workspace:GetChildren()) do
		if _V6e58c329f0(ch) then
			hookContainer(ch)
		end
	end
	if S.conns.grabLineWS then
		pcall(function() S.conns.grabLineWS:Disconnect() end)
	end
	S.conns.grabLineWS = workspace.ChildAdded:Connect(function(ch)
		if _V6e58c329f0(ch) then
			task.defer(function()
				hookContainer(ch)
				if not S.toggles.invisLine then
					_V3bd70b6793()
					_V4fd17682d4(ch)
					task.spawn(function()
						for _ = 1, 8 do
							if not ch.Parent or S.toggles.invisLine then break end
							_V3bd70b6793()
							task.wait(0.12)
						end
					end)
				end
			end)
		end
	end)
	local function hookChar(c)
		if not c then return end
		hookContainer(c)
	end
	if LP.Character then hookChar(LP.Character) end
	if S.conns.grabLineChar then
		pcall(function() S.conns.grabLineChar:Disconnect() end)
	end
	S.conns.grabLineChar = LP.CharacterAdded:Connect(function(c)
		task.wait(0.25)
		hookChar(c)
		if not S.toggles.invisLine then
			_V99e998c676(true)
			_V3bd70b6793()
			task.delay(0.5, function()
				_V99e998c676(true)
				_V3bd70b6793()
			end)
		end
	end)
	if S.conns.grabLineHB then
		pcall(function() S.conns.grabLineHB:Disconnect() end)
	end
	local acc = 0
	local deadAcc = 0
	local grabScriptAcc = 0
	S.conns.grabLineHB = RunService.Heartbeat:Connect(function(dt)
		if not S._grabLineKeepAlive then return end
		if S.toggles.invisLine then return end
		acc += dt
		grabScriptAcc += dt
		if grabScriptAcc >= 0.5 then
			grabScriptAcc = 0
			_V7d6cc73178()
		end
		local holding = workspace:FindFirstChild(_Vzd({108,151,134,135,117,134,151,153,152})) ~= nil
		local need = holding and 0.12 or 0.45
		if acc < need then return end
		acc = 0
		if holding then
			_V99e998c676(true)
			_V3bd70b6793()
			S._glHideN = (S._glHideN or 0) + 1
			if S._glHideN >= 3 then
				S._glHideN = 0
				_V4fd17682d4()
			end
			local anyBeam, okVis = false, false
			local gp = workspace:FindFirstChild(_Vzd({200,243,226,227,209,226,243,245,244}))
			if gp then
				for _, d in ipairs(gp:GetDescendants()) do
					if d:IsA(_Vzd({195,230,226,238})) then
						anyBeam = true
						if d.Enabled then
							local t0 = d.Transparency
							local tv = (t0.Keypoints and t0.Keypoints[1] and t0.Keypoints[1].Value) or 0
							if tv < 0.45 then okVis = true break end
						end
					end
				end
			end
			if not okVis then
				deadAcc += need
				if deadAcc > 1.2 then
					deadAcc = 0
					pcall(_V3bd70b6793)
					if not anyBeam then
						pcall(function() _Ve56cd280d0(false) end)
					end
				end
			else
				deadAcc = 0
			end
		else
			deadAcc = 0
			_V99e998c676(true)
		end
	end)

	pcall(function() RunService:UnbindFromRenderStep(_Vzd({215,208,202,197,219,224,200,243,226,227,205,234,239,230,215,234,244})) end)
end
function _V3960c60777()
	S.toggles.invisLine = false
	_V11a5d4671af(_Vzd({234,239,247,234,244,205,234,239,230}))
	_V99e998c676(true)
	_V026212e1150()
	_V3bd70b6793()
	task.defer(function()
		_V99e998c676(true)
		_V026212e1150()
		_V3bd70b6793()
	end)
	task.delay(0.25, function()
		_V99e998c676(true)
		_V3bd70b6793()
	end)
	task.delay(1.0, _V3bd70b6793)
	task.delay(2.5, _V3bd70b6793)
	_V6b6e1e43df()
end
function _V364f891e171(on)
	S.toggles.invisLine = on == true
	_V11a5d4671af(_Vzd({234,239,247,234,244,205,234,239,230}))
	if on and S.toggles.crazyLine then
		_V556c1dc412c(HUB_NAME, _Vzd({213,246,243,239,161,196,243,226,251,250,161,205,234,239,230,161,208,199,199,161,231,240,243,161,202,239,247,234,244,234,227,237,230,161,205,234,239,230}), 2)
	end
	if on then
		_V53fa917f1a2(_Vzd({234,239,247,234,244,205,234,239,230}), 0.25, function()
			for _, ch in ipairs(workspace:GetChildren()) do
				if ch.Name == _Vzd({200,243,226,227,209,226,243,245,244}) then
					for _, d in ipairs(ch:GetDescendants()) do
						if d:IsA(_Vzd({195,230,226,238})) then
							pcall(function()
								d.Enabled = false
								d.Transparency = NumberSequence.new(1)
							end)
						end
					end
				end
			end
		end)
		_V556c1dc412c(HUB_NAME, _Vzd({110,147,155,142,152,142,135,145,138,69,113,142,147,138,69,116,115}), 1.5)
	else
		_V3960c60777()
		_V556c1dc412c(HUB_NAME, _Vzd({202,239,247,234,244,234,227,237,230,161,205,234,239,230,161,208,199,199}), 1)
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
function _Vec8a8cd9e8(enabled)
	if invisState.noclipConn then
		pcall(function() invisState.noclipConn:Disconnect() end)
		invisState.noclipConn = nil
	end
	if not enabled then return end
	invisState.noclipConn = RunService.Stepped:Connect(function()
		local c = char()
		if not c then return end
		for _, part in ipairs(c:GetChildren()) do
			if part:IsA(_Vzd({195,226,244,230,209,226,243,245})) then
				part.CanCollide = false
			end
		end
	end)
end
function _V0a71d36f16a(on, quiet)
	S.toggles.charInvis = on == true
	local r = hrp()
	local cam = workspace.CurrentCamera
	if not on then
		invisState.on = false
		_Vec8a8cd9e8(false)
		if invisState.hbConn then pcall(function() invisState.hbConn:Disconnect() end) invisState.hbConn = nil end
		if invisState.rsConn then pcall(function() invisState.rsConn:Disconnect() end) invisState.rsConn = nil end
		if r and invisState.origY then
			pcall(function()
				r.CFrame = CFrame.new(r.Position.X, invisState.origY, r.Position.Z)
				r.Transparency = invisState.hrpT or 0
			end)
		end
		invisState.origY = nil
		if not quiet then _V556c1dc412c(HUB_NAME, _Vzd({110,147,155,142,152,142,135,142,145,142,153,158,69,116,107,107}), 1.2) end
		return
	end
	if not r or not cam then
		if not quiet then _V556c1dc412c(HUB_NAME, _Vzd({207,240,161,228,233,226,243,226,228,245,230,243,161,231,240,243,161,234,239,247,234,244}), 1.5) end
		S.toggles.charInvis = false
		return
	end
	invisState.on = true
	invisState.origY = r.Position.Y
	invisState.hrpT = r.Transparency
	r.Transparency = 1
	_Vec8a8cd9e8(true)
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
	if not quiet then _V556c1dc412c(HUB_NAME, _Vzd({202,239,247,234,244,234,227,234,237,234,245,250,161,208,207,161,169,227,240,229,250,161,246,239,229,230,243,161,238,226,241,170}), 1.5) end
end
function _Vb57b94121bb()
	if not invisState.on or not S.toggles.charInvis then return false end
	local r = hrp()
	if not r then return false end
	local surfY = invisState.origY or r.Position.Y
	r.CFrame = CFrame.new(r.Position.X, surfY + 1, r.Position.Z)
	r.Transparency = 0.7
	return true
end
do local _z1558=(2*13);if _z1558<0 and _Vj() then _z1558=_z1558+1 end local _y1558=_Vzd({48,90}) end

function _V7e05ebe3d3()
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
			if S.toggles.charInvis then _V0a71d36f16a(true, true) end
		end)
	end
end)
do local _z498=(3*9); if _z498<0 and _Vj() then _z498=_z498+1 end end
do local _z8330=(10*7);if _z8330<0 and _Vj() then _z8330=_z8330+1 end local _y8330=_Vzd({53,82}) end

function _V7524b85a8b()
	local s = workspace:FindFirstChild(_Vzd({212,237,240,245,244}))
	if s then return s end
	for _, ch in ipairs(workspace:GetChildren()) do
		local n = ch.Name:lower()
		if (n == _Vzd({244,237,240,245,244}) or n:find(_Vzd({244,237,240,245}), 1, true)) and (ch:IsA(_Vzd({199,240,237,229,230,243})) or ch:IsA(_Vzd({206,240,229,230,237}))) then
			return ch
		end
	end
	return nil
end
do local _z3483=(11*8);if _z3483<0 and _Vj() then _z3483=_z3483+1 end local _y3483=_Vzd({56,61}) end

function _V3c7971fd15e()
	local root = _V7524b85a8b()
	local handles, lights = {}, {}
	if not root then return handles, lights, root end
	for _, slot in ipairs(root:GetChildren()) do
		local sh = slot:FindFirstChild(_Vzd({212,237,240,245,201,226,239,229,237,230}))
		if sh then
			local handle = sh:FindFirstChild(_Vzd({109,134,147,137,145,138}))
			local lb = sh:FindFirstChild(_Vzd({205,234,232,233,245,195,226,237,237}))
			if handle and handle:IsA(_Vzd({195,226,244,230,209,226,243,245})) then
				handles[#handles + 1] = handle
			end
			if lb and lb:IsA(_Vzd({195,226,244,230,209,226,243,245})) then
				lights[#lights + 1] = lb
			end
		end
	end
	if #handles == 0 then
		for _, d in ipairs(root:GetDescendants()) do
			if d.Name == _Vzd({201,226,239,229,237,230}) and d:IsA(_Vzd({195,226,244,230,209,226,243,245})) then
				local par = d.Parent
				if par and par.Name == _Vzd({212,237,240,245,201,226,239,229,237,230}) then
					handles[#handles + 1] = d
				end
			end
			if d.Name == _Vzd({205,234,232,233,245,195,226,237,237}) and d:IsA(_Vzd({195,226,244,230,209,226,243,245})) then
				lights[#lights + 1] = d
			end
		end
	end
	return handles, lights, root
end
function _V148012de53(slotsFolder)
	local handles = _V3c7971fd15e()
	return handles
end
do local _z270=(4*5); if _z270<0 and _Vj() then _z270=_z270+1 end end
function _V5fb04296183(slotsFolder)
	local handles, lights = _V3c7971fd15e()
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
function _V5ee3b665188(handle)
	if not handle or not handle:IsA(_Vzd({195,226,244,230,209,226,243,245})) then return end
	local me = hrp()
	if not me then return end
	local origin = me.Position
	pcall(function()
		if FTAP.SetNetworkOwner then
			FTAP.SetNetworkOwner:FireServer(handle, _Ve5bf781e109(origin, handle.Position))
		end
		sno(handle, origin)
		local sh = handle.Parent
		if sh then
			for _, d in ipairs(sh:GetDescendants()) do
				if d:IsA(_Vzd({195,226,244,230,209,226,243,245})) then
					sno(d, origin)
					if FTAP.SetNetworkOwner then
						pcall(function()
							FTAP.SetNetworkOwner:FireServer(d, _Ve5bf781e109(origin, d.Position))
						end)
					end
				end
			end
		end
	end)
end
function _Vd54091601e3(handle)
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
function _Va72ec15027()
	local handles, lights, root = _V3c7971fd15e()
	if not root then
		return false, _Vzd({239,240,161,248,240,243,236,244,241,226,228,230,175,212,237,240,245,244})
	end
	if #handles == 0 then
		return false, _Vzd({239,240,161,212,237,240,245,201,226,239,229,237,230,175,201,226,239,229,237,230})
	end
	local ready, neonN, lightN = _V5fb04296183()
	if not ready then
		return false, _Vzd({248,226,234,245,234,239,232,161,237,234,232,233,245,244,161}) .. tostring(neonN) .. "/" .. tostring(lightN)
	end
	local me = hrp()
	if not me then return false, _Vzd({239,240,161,228,233,226,243,226,228,245,230,243}) end
	local saved = me.CFrame
	local current = handles[1]
	local chase = true
	local chaseThread = task.spawn(function()
		while chase and S.toggles.autoSpin do
			local h = current
			if h and h.Parent then
				_Vd54091601e3(h)
				_V5ee3b665188(h)
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
			_Vd54091601e3(handle)
			_V5ee3b665188(handle)
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
		local stillReady = _V5fb04296183()
		if not stillReady then break end
	end
	chase = false
	pcall(function()
		if typeof(chaseThread) == _Vzd({245,233,243,230,226,229}) then
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
	return true, _Vzd({244,241,246,239,161}) .. spun .. "/" .. #handles
end
function _Ve1cc89b1165(on)
	S.toggles.autoSpin = on == true
	_V11a5d4671af(_Vzd({134,154,153,148,120,149,142,147}))
	S._autoSpinThread = nil
	if not on then
		_V556c1dc412c(HUB_NAME, _Vzd({102,154,153,148,82,120,149,142,147,69,116,107,107}), 1)
		return
	end
	local handles, lights, root = _V3c7971fd15e()
	if not root then
		_V556c1dc412c(HUB_NAME, _Vzd({194,246,245,240,174,212,241,234,239,187,161,248,240,243,236,244,241,226,228,230,175,212,237,240,245,244,161,238,234,244,244,234,239,232}), 3)
	else
		_V556c1dc412c(HUB_NAME, _Vzd({102,154,153,148,82,120,149,142,147,69,116,115,69,161,69}) .. #handles .. _Vzd({161,233,226,239,229,237,230,244,161,253,161}) .. #lights .. _Vzd({161,237,234,232,233,245,244}), 2.5)
	end
	S._autoSpinThread = true
	task.spawn(function()
		local lastMsg = 0
		local lastWaitMsg = 0
		while S.toggles.autoSpin and S._autoSpinThread do
			local okCall, a, b = pcall(_Va72ec15027)
			local ok, info = false, nil
			if okCall then
				ok, info = a, b
			else
				info = tostring(a)
			end
			if ok then
				if os.clock() - lastMsg > 8 then
					_V556c1dc412c(HUB_NAME, _Vzd({102,154,153,148,82,120,149,142,147,69,161,69}) .. tostring(info), 1.5)
					lastMsg = os.clock()
				end
				for _ = 1, 50 do
					if not S.toggles.autoSpin then break end
					task.wait(0.1)
				end
			else
				if os.clock() - lastWaitMsg > 30 then
					_V556c1dc412c(HUB_NAME, _Vzd({194,246,245,240,174,212,241,234,239,161,253,161}) .. tostring(info or _Vzd({248,226,234,245,234,239,232})), 1.2)
					lastWaitMsg = os.clock()
				end
				task.wait(1)
			end
		end
		S._autoSpinThread = nil
	end)
end
function _Va9d755db16e(on)
	if S.flyBv then pcall(function() S.flyBv:Destroy() end) S.flyBv = nil end
	if S.flyBg then pcall(function() S.flyBg:Destroy() end) S.flyBg = nil end
	if S.conns.fly then pcall(function() S.conns.fly:Disconnect() end) S.conns.fly = nil end
	if not on then return end
	local r = hrp()
	if not r then return end
	local bv = Instance.new(_Vzd({195,240,229,250,215,230,237,240,228,234,245,250}))
	bv.Name = _Vzd({215,208,202,197,219,224,199,237,250})
	bv.MaxForce = Vector3.new(9e9, 9e9, 9e9)
	bv.Velocity = Vector3.zero
	bv.Parent = r
	S.flyBv = bv
	local bg = Instance.new(_Vzd({195,240,229,250,200,250,243,240}))
	bg.Name = _Vzd({123,116,110,105,127,132,107,145,158,108})
	bg.MaxTorque = Vector3.new(9e9, 9e9, 9e9)
	bg.P = 9e4
	bg.Parent = r
	S.flyBg = bg
	S.conns.fly = RunService.RenderStepped:Connect(function()
		if not S.toggles.fly then return end
		local rr = hrp()
		if not rr then return end
		if not S.flyBv or not S.flyBv.Parent then
			S.flyBv = Instance.new(_Vzd({195,240,229,250,215,230,237,240,228,234,245,250}))
			S.flyBv.Name = _Vzd({215,208,202,197,219,224,199,237,250})
			S.flyBv.MaxForce = Vector3.new(9e9, 9e9, 9e9)
			S.flyBv.Parent = rr
		end
		if not S.flyBg or not S.flyBg.Parent then
			S.flyBg = Instance.new(_Vzd({195,240,229,250,200,250,243,240}))
			S.flyBg.Name = _Vzd({215,208,202,197,219,224,199,237,250,200})
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
_V64544f4b29(_Vzd({238,240,247,230,201,195}), RunService.Heartbeat:Connect(function()
	local t = S.toggles
	if not (t.speed or t.jump or t.noclip or t.speedCFrame) then return end
	local h = hum()
	local r = hrp()
	if t.speed and h and r and h.MoveDirection.Magnitude > 0 then
		local targetSpeed = S.walkSpeed or 50
		local mult = targetSpeed / 16
		r.CFrame = r.CFrame + h.MoveDirection * (0.3 * mult)
	end
	if t.jump and h then
		h.UseJumpPower = true
		h.JumpPower = S.jumpPower or 80
	end
	if t.noclip then
		local now = os.clock()
		if now - (S._noclipLast or 0) > 0.2 then
			S._noclipLast = now
			local c = char()
			if c then
				for _, p in ipairs(c:GetChildren()) do
					if p:IsA(_Vzd({195,226,244,230,209,226,243,245})) then p.CanCollide = false end
				end
			end
		end
	end
	if t.speedCFrame and r and h and h.MoveDirection.Magnitude > 0 then
		r.CFrame = r.CFrame + h.MoveDirection * (S.speedMult or 1.5)
	end
end))
_V64544f4b29(_Vzd({234,239,231,203,246,238,241}), UserInputService.JumpRequest:Connect(function()
	if not S.toggles.infjump then return end
	local h = hum()
	if h then h:ChangeState(Enum.HumanoidStateType.Jumping) end
end))
local KNOWN_TOYS = {
	_Vzd({194,234,243,233,240,243,239}), _Vzd({194,239,247,234,237,200,243,226,250}), _Vzd({194,243,238,196,233,226,234,243,195,237,246,230}), _Vzd({194,243,238,196,233,226,234,243,195,243,240,248,239,200,243,226,250}), _Vzd({102,151,146,104,141,134,142,151,117,142,147,144}),
	_Vzd({103,134,145,145,103,134,152,144,138,153,135,134,145,145}), _Vzd({103,134,145,145,114,134,140,142,136,113,142,140,141,153}), _Vzd({195,226,237,237,212,239,240,248,227,226,237,237}), _Vzd({195,226,245,233,243,240,240,238,212,233,240,248,230,243}), _Vzd({195,226,245,233,243,240,240,238,212,234,239,236}),
	_Vzd({195,230,229,195,237,226,239,236,230,245,195,237,246,230}), _Vzd({195,230,229,199,243,226,238,230,229,208,243,226,239,232,230}), _Vzd({103,138,137,107,154,153,148,147}), _Vzd({195,230,237,237,195,234,232}), _Vzd({195,230,237,237,212,238,226,237,237}),
	_Vzd({195,240,238,227,195,226,237,237,240,240,239}), _Vzd({195,240,238,227,197,226,243,236,206,226,245,245,230,243}), _Vzd({195,240,238,227,206,234,244,244,234,237,230}), _Vzd({195,240,240,236,206,226,239,250,209,226,232,230,244}), _Vzd({195,240,240,236,207,240,243,238,226,237}),
	_Vzd({195,240,240,238,227,240,249}), _Vzd({195,240,249,196,243,226,245,230,216,240,240,229}), _Vzd({195,246,227,227,237,230,195,237,240,248,230,243}), _Vzd({195,246,228,236,230,245,209,226,234,239,245}), _Vzd({196,226,238,241,231,234,243,230}),
	_Vzd({196,233,234,237,229,243,230,239,244,196,233,226,234,243}), _Vzd({196,233,234,237,229,243,230,239,244,196,240,246,228,233}), _Vzd({196,233,234,237,229,243,230,239,244,197,230,244,236}), _Vzd({196,233,234,237,229,243,230,239,244,212,233,230,237,231}), _Vzd({196,233,234,237,229,243,230,239,244,213,226,227,237,230}),
	_Vzd({196,237,240,228,236,194,237,226,243,238}), _Vzd({196,240,238,241,246,245,230,243,205,226,241,245,240,241,208,237,229}), _Vzd({196,240,246,228,233,195,237,246,230}), _Vzd({196,240,246,228,233,195,243,240,248,239,200,243,226,250}), _Vzd({196,240,246,228,233,197,226,243,236,200,243,226,250}),
	_Vzd({196,240,246,228,233,205,234,232,233,245,195,243,240,248,239,200,243,226,250}), _Vzd({104,148,154,136,141,117,142,147,144}), _Vzd({196,240,246,228,233,216,233,234,245,230}), _Vzd({196,240,246,228,233,209,246,243,241,237,230}),
	_Vzd({196,240,246,239,245,230,243,196,240,243,239,230,243}), _Vzd({196,240,246,239,245,230,243,212,234,239,236}), _Vzd({104,148,154,147,153,138,151,120,153,151,134,142,140,141,153}), _Vzd({196,243,230,226,245,246,243,230,195,237,240,227,238,226,239}), _Vzd({104,151,138,134,153,154,151,138,119,148,135,148,153}),
	_Vzd({104,154,149,114,154,140,103,151,148,156,147}), _Vzd({196,246,241,206,246,232,216,233,234,245,230}), _Vzd({197,234,228,230,195,234,232}), _Vzd({197,234,228,230,212,238,226,237,237}), _Vzd({197,234,244,228,240,196,240,237,240,243,195,226,237,237}),
	_Vzd({197,243,226,248,230,243,205,234,232,233,245,195,243,240,248,239}), _Vzd({199,226,228,245,240,243,250,195,230,239,228,233}), _Vzd({199,226,228,245,240,243,250,196,226,227,234,239,230,245}), _Vzd({199,226,228,245,240,243,250,196,233,226,234,243}), _Vzd({199,226,228,245,240,243,250,196,240,246,228,233}),
	_Vzd({199,240,240,229,195,226,239,226,239,226}), _Vzd({207,234,239,235,226,204,246,239,226,234}), _Vzd({209,226,237,237,230,245,205,234,232,233,245,195,243,240,248,239}), _Vzd({117,134,145,145,138,153}), _Vzd({212,241,243,226,250,196,226,239,216,197}),
	_Vzd({212,240,228,228,230,243,195,226,237,237}), _Vzd({195,240,249,234,239,232,200,237,240,247,230}), _Vzd({199,234,243,230,248,240,243,236}), _Vzd({103,134,145,145,148,148,147}), _Vzd({209,226,234,239,245,195,246,228,236,230,245}),
}
function _V38ae27e8b6()
	local owned = {}
	local function scan(container)
		if not container then return end
		for _, t in ipairs(container:GetChildren()) do
			if t:IsA(_Vzd({213,240,240,237})) or t:IsA(_Vzd({206,240,229,230,237})) or t:IsA(_Vzd({199,240,237,229,230,243})) then
				owned[t.Name] = true
			end
		end
	end
	scan(LP:FindFirstChild(_Vzd({195,226,228,236,241,226,228,236})))
	scan(char())
	local pg = LP:FindFirstChild(_Vzd({209,237,226,250,230,243,200,246,234}))
	if pg then
		for _, d in ipairs(pg:GetDescendants()) do
			if d:IsA(_Vzd({213,230,249,245,205,226,227,230,237})) or d:IsA(_Vzd({213,230,249,245,195,246,245,245,240,239})) then
				local tx = d.Text
				if type(tx) == _Vzd({244,245,243,234,239,232}) and #tx > 1 and #tx < 40 then
					for _, toy in ipairs(KNOWN_TOYS) do
						if tx:lower() == toy:lower() or tx:lower():find(toy:lower(), 1, true) then
							owned[toy] = true
						end
					end
					local low = tx:lower()
					if not low:find(_Vzd({138,150,154,142,149})) and not low:find(_Vzd({244,241,226,248,239})) and not low:find(_Vzd({227,246,250})) then
						if d.Parent and (tostring(d.Parent.Name):lower():find(_Vzd({245,240,250})) or tostring(d.Parent.Name):lower():find(_Vzd({234,239,247})) or tostring(d.Parent.Name):lower():find(_Vzd({234,245,230,238}))) then
							owned[tx] = true
						end
					end
				end
			end
		end
	end
	for _, m in ipairs(workspace:GetDescendants()) do
		if m:IsA(_Vzd({212,245,243,234,239,232,215,226,237,246,230})) and m.Name == _Vzd({209,226,243,245,208,248,239,230,243}) and m.Value == LP.Name then
			local model = m.Parent
			if model then owned[model.Name] = true end
		end
	end
	local list = {}
	for n in pairs(owned) do list[#list+1] = n end
	table.sort(list)
	return list
end
function _V1520d06eb4()
	local map = {}
	local me = hrp()
	local origin = me and me.Position or Vector3.zero
	for _, inst in ipairs(workspace:GetDescendants()) do
		if inst:IsA(_Vzd({206,240,229,230,237})) and inst:FindFirstChildWhichIsA(_Vzd({195,226,244,230,209,226,243,245}), true) then
			if not Players:GetPlayerFromCharacter(inst) then
				local name = inst.Name
				if #name > 1 and name ~= _Vzd({206,226,241}) and name ~= _Vzd({209,237,240,245,244}) and name ~= _Vzd({216,240,243,236,244,241,226,228,230}) then
					local owner = nil
					local po = inst:FindFirstChild(_Vzd({209,226,243,245,208,248,239,230,243}), true)
					if po and po:IsA(_Vzd({212,245,243,234,239,232,215,226,237,246,230})) then owner = po.Value end
					local part = inst:FindFirstChildWhichIsA(_Vzd({195,226,244,230,209,226,243,245}), true)
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
do local _z6623=(6*6);if _z6623<0 and _Vj() then _z6623=_z6623+1 end local _y6623=_Vzd({62,51}) end

function _Vc6ce077daf()
	return LP:FindFirstChild(_Vzd({196,226,239,212,241,226,248,239,213,240,250}))
end
function _Vd52163ec201(timeout)
	local can = _Vc6ce077daf()
	if not can then return true end
	local t0 = os.clock()
	timeout = timeout or 4
	while can.Parent and not can.Value and (os.clock() - t0) < timeout do
		task.wait(0.03)
	end
	return not can.Parent or can.Value
end
function _Vbe07dce9157(cf)
	if typeof(cf) ~= _Vzd({196,199,243,226,238,230}) then return Vector3.zero end
	local _, y = cf:ToOrientation()
	return Vector3.new(0, math.deg(y), 0)
end
do local _z9094=(11*4);if _z9094<0 and _Vj() then _z9094=_z9094+1 end local _y9094=_Vzd({88,49}) end

function _V7102d91c14d(name, opts)
	opts = opts or {}
	if opts.cf then return opts.cf end
	local cp = _Vc33e41953f() or hrp()
	if not cp then return nil end
	local dist = opts.dist or (tostring(name):find(_Vzd({209,226,237,237,230,245})) and 3 or 5)
	return cp.CFrame * CFrame.new(0, opts.y or 0, -dist)
end
function _V7825dc6f199(name, opts)
	opts = opts or {}
	name = name or S.selectedToy or _Vzd({209,226,237,237,230,245,205,234,232,233,245,195,243,240,248,239})
	if name == _Vzd({209,226,237,237,230,245}) then name = _Vzd({209,226,237,237,230,245,205,234,232,233,245,195,243,240,248,239}) end
	if not FTAP.SpawnToy then _V6c6a3f4314a() end
	if not FTAP.SpawnToy then
		task.wait(0.3)
		_V6c6a3f4314a()
	end
	if not FTAP.SpawnToy then
		if not opts.silent then _V556c1dc412c(HUB_NAME, _Vzd({207,240,161,212,241,226,248,239,213,240,250,161,243,230,238,240,245,230,161,174,161,237,234,239,236,161,243,230,238,240,245,230,244}), 2) end
		return false
	end
	local cf = _V7102d91c14d(name, opts)
	if not cf then return false end
	local rot = opts.rot
	if rot == nil then rot = _Vbe07dce9157(cf) end
	if not opts.skipBuy and FTAP.BuyToy then
		pcall(function() FTAP.BuyToy:InvokeServer(name) end)
	end
	_Vd52163ec201(opts.canTimeout or 4)
	local remote = FTAP.SpawnToy
	local ok = pcall(function()
		remote:InvokeServer(name, cf, rot)
	end)
	if not ok then
		_V6c6a3f4314a()
		ok = pcall(function()
			if FTAP.SpawnToy then
				FTAP.SpawnToy:InvokeServer(name, cf, rot)
			end
		end)
	end
	local gap = opts.gap
	if gap == nil then gap = S.formGap or 0.09 end
	if gap > 0 then task.wait(gap) end
	_Vd52163ec201(opts.canTimeout or 4)
	return ok
end
local toySpawnQueue = {}
local toySpawnWorker = false
function _V42b15f9913d()
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
				if not FTAP.SpawnToy then pcall(_V6c6a3f4314a) end
				local ok = _V7825dc6f199(job.name, job.opts)
				if job.opts and job.opts.onDone then
					pcall(job.opts.onDone, ok)
				end
			end
		end
		toySpawnWorker = false
	end)
end
do local _z7215=(11*3);if _z7215<0 and _Vj() then _z7215=_z7215+1 end local _y7215=_Vzd({40,60}) end

function _Vd788f8c8197(name, opts)
	opts = opts or {}
	name = name or S.selectedToy or _Vzd({209,226,237,237,230,245,205,234,232,233,245,195,243,240,248,239})
	if name == _Vzd({209,226,237,237,230,245}) then name = _Vzd({209,226,237,237,230,245,205,234,232,233,245,195,243,240,248,239}) end
	if opts.sync then
		local ok = _V7825dc6f199(name, opts)
		if ok and not opts.silent then _V556c1dc412c(HUB_NAME, _Vzd({120,149,134,156,147,69}) .. name, 0.8) end
		return ok
	end
	if not opts.silent then
		_V556c1dc412c(HUB_NAME, _Vzd({212,241,226,248,239,161}) .. name, 0.6)
	end
	local jobOpts = {}
	for k, v in pairs(opts) do jobOpts[k] = v end
	jobOpts.silent = true
	toySpawnQueue[#toySpawnQueue + 1] = { name = name, opts = jobOpts }
	_V42b15f9913d()
	return true
end
function _V5a17bd6c198(name, count)
	count = math.clamp(tonumber(count) or 1, 1, 80)
	name = name or _Vzd({209,226,237,237,230,245,205,234,232,233,245,195,243,240,248,239})
	task.spawn(function()
		if FTAP.BuyToy then pcall(function() FTAP.BuyToy:InvokeServer(name) end) end
		_Vd52163ec201(3)
		local cp = _Vc33e41953f() or hrp()
		local base = cp and cp.CFrame or CFrame.new()
		for i = 1, count do
			local cf = base * CFrame.new(0, (i - 1) * 1.1, -3)
			_V7825dc6f199(name, { cf = cf, skipBuy = true, silent = true, gap = 0.07 })
		end
		_V556c1dc412c(HUB_NAME, _Vzd({212,241,226,248,239,230,229,161,249}) .. count .. " " .. tostring(name), 1.5)
	end)
end
do local _z5798=(10*3);if _z5798<0 and _Vj() then _z5798=_z5798+1 end local _y5798=_Vzd({87,63}) end

function _Vc5b9c6e765(filterName)
	if not FTAP.DestroyToy then _V6c6a3f4314a() end
	if not FTAP.DestroyToy then
		_V556c1dc412c(HUB_NAME, _Vzd({207,240,161,197,230,244,245,243,240,250,213,240,250,161,243,230,238,240,245,230}), 2)
		return 0
	end
	local folder = workspace:FindFirstChild(LP.Name .. _Vzd({212,241,226,248,239,230,229,202,239,213,240,250,244}))
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
function _Ved9a9dcf61(filterName)
	local folder = workspace:FindFirstChild(LP.Name .. _Vzd({212,241,226,248,239,230,229,202,239,213,240,250,244}))
	if not folder then return 0 end
	local n = 0
	for _, ch in ipairs(folder:GetChildren()) do
		if not filterName or ch.Name == filterName then n += 1 end
	end
	return n
end
S.trainSpeed = S.trainSpeed or 140
S._trainDriveConn = nil
S._trainHornConn = nil
S._trainSeat = nil
S._trainRoot = nil
S._trainModel = nil
S._trainParts = nil
S.trainDriving = false
S._trainSnoBudget = 0
S._trainCached = nil
S._trainCacheT = 0
local TRAIN_CAVE_POS = Vector3.new(500, 62, -307)
local TRAIN_Y_MIN = 12
local TRAIN_Y_MAX = 380
local TRAIN_MAP_RADIUS = 4200
function _V5a741c561f0(pos)
	if typeof(pos) ~= _Vzd({215,230,228,245,240,243,180}) then return false end
	if pos.X ~= pos.X or pos.Y ~= pos.Y or pos.Z ~= pos.Z then return false end
	if pos.Y < TRAIN_Y_MIN or pos.Y > TRAIN_Y_MAX then return false end
	if math.abs(pos.X) > TRAIN_MAP_RADIUS or math.abs(pos.Z) > TRAIN_MAP_RADIUS then return false end
	return true
end
do local _z9415=(11*6);if _z9415<0 and _Vj() then _z9415=_z9415+1 end local _y9415=_Vzd({76,79}) end

function _Vf4840ba91e6(pos)
	if typeof(pos) ~= _Vzd({215,230,228,245,240,243,180}) then return pos end
	local y = math.clamp(pos.Y, TRAIN_Y_MIN, TRAIN_Y_MAX)
	local x = math.clamp(pos.X, -TRAIN_MAP_RADIUS, TRAIN_MAP_RADIUS)
	local z = math.clamp(pos.Z, -TRAIN_MAP_RADIUS, TRAIN_MAP_RADIUS)
	return Vector3.new(x, y, z)
end
function _V28caa47b1b6(quiet)
	S.trainDriving = false
	if S._trainDriveConn then pcall(function() S._trainDriveConn:Disconnect() end); S._trainDriveConn = nil end
	if S._trainHornConn then pcall(function() S._trainHornConn:Disconnect() end); S._trainHornConn = nil end
	local h = hum()
	local seat = S._trainSeat
	if h and seat and h.SeatPart == seat then
		pcall(function()
			h.Sit = false
			h.Jump = true
		end)
	end
	local killList = {}
	if S._trainParts then
		for _, p in ipairs(S._trainParts) do killList[#killList + 1] = p end
	end
	killList[#killList + 1] = S._trainSeat
	killList[#killList + 1] = S._trainRoot
	for _, part in ipairs(killList) do
		if part and part.Parent then
			for _, ch in ipairs(part:GetChildren()) do
				if ch.Name == _Vzd({213,243,226,234,239,197,243,234,247,230,195,215}) or ch.Name == _Vzd({213,243,226,234,239,197,243,234,247,230,195,200}) or ch.Name == _Vzd({213,243,226,234,239,197,243,234,247,230,195,209}) then
					pcall(function() ch:Destroy() end)
				end
			end
			pcall(function()
				if part:IsA(_Vzd({195,226,244,230,209,226,243,245})) then
					part.AssemblyLinearVelocity = Vector3.zero
				end
			end)
		end
	end
	S._trainSeat = nil
	S._trainRoot = nil
	S._trainModel = nil
	S._trainParts = nil
	if not quiet then _V556c1dc412c(HUB_NAME, _Vzd({121,151,134,142,147,69,152,153,148,149,149,138,137}), 1) end
end
function _V3012e047bc()
	local map = workspace:FindFirstChild(_Vzd({206,226,241}))
	return map and map:FindFirstChild(_Vzd({194,237,248,226,250,244,201,230,243,230,213,248,230,230,239,230,229,208,227,235,230,228,245,244}))
end
function _Vf824d69f1ef(container)
	if not container then return nil end
	for _, d in ipairs(container:GetDescendants()) do
		if d:IsA(_Vzd({215,230,233,234,228,237,230,212,230,226,245})) then return d end
	end
	return nil
end
function _Va1f463701ee(model, seat)
	if model and model:IsA(_Vzd({206,240,229,230,237})) and model.PrimaryPart then return model.PrimaryPart end
	if seat and seat:IsA(_Vzd({195,226,244,230,209,226,243,245})) then return seat end
	if model then
		local best, bestVol = nil, -1
		for _, d in ipairs(model:GetDescendants()) do
			if d:IsA(_Vzd({195,226,244,230,209,226,243,245})) and d.Transparency < 0.9 then
				local vol = d.Size.X * d.Size.Y * d.Size.Z
				if vol > bestVol then best, bestVol = d, vol end
			end
		end
		if best then return best end
		return model:FindFirstChildWhichIsA(_Vzd({195,226,244,230,209,226,243,245}), true)
	end
	return seat
end
function _V8fd670321e7(model, seat, root, maxN)
	maxN = maxN or 24
	local out, seen = {}, {}
	local function add(p)
		if p and p:IsA(_Vzd({195,226,244,230,209,226,243,245})) and p.Parent and not seen[p] then
			seen[p] = true
			out[#out + 1] = p
		end
	end
	add(root)
	if seat and seat:IsA(_Vzd({195,226,244,230,209,226,243,245})) then add(seat) end
	if model then
		local scored = {}
		for _, d in ipairs(model:GetDescendants()) do
			if d:IsA(_Vzd({195,226,244,230,209,226,243,245})) and d.Transparency < 0.85 then
				local vol = d.Size.X * d.Size.Y * d.Size.Z
				if vol > 1.5 then
					scored[#scored + 1] = { p = d, v = vol }
				end
			end
		end
		table.sort(scored, function(a, b) return a.v > b.v end)
		for i = 1, math.min(#scored, maxN) do
			add(scored[i].p)
		end
	end
	return out
end
function _V5c03a53a1ec(n)
	n = tostring(n or ""):lower()
	return n:find(_Vzd({243,240,228,236}), 1, true) or n:find(_Vzd({244,245,240,239,230}), 1, true) or n:find(_Vzd({227,240,246,237,229,230,243}), 1, true)
		or n:find(_Vzd({241,230,227,227,237,230}), 1, true) or n:find(_Vzd({240,243,230}), 1, true) or n:find(_Vzd({228,243,250,244,245,226,237}), 1, true)
		or n:find(_Vzd({229,230,227,243,234,244}), 1, true) or n:find(_Vzd({243,246,227,227,237,230}), 1, true) or n:find(_Vzd({228,237,234,231,231}), 1, true)
		or n:find(_Vzd({245,230,243,243,226,234,239}), 1, true) or n:find(_Vzd({232,243,240,246,239,229}), 1, true) or n:find(_Vzd({238,230,244,233}), 1, true)
end
function _V9d7682ff1ed(n)
	n = tostring(n or ""):lower()
	if _V5c03a53a1ec(n) then return false end
	return n == _Vzd({245,243,226,234,239}) or n:find(_Vzd({245,243,226,234,239}), 1, true) or n:find(_Vzd({238,240,239,240}), 1, true)
		or n:find(_Vzd({237,240,228,240}), 1, true) or n:find(_Vzd({243,226,234,237}), 1, true) or n:find(_Vzd({228,226,243,245}), 1, true)
		or n:find(_Vzd({244,236,250,245,243,226,234,239}), 1, true)
end
function _V40104dfc1f2(ch)
	if not ch then return -1, nil, nil end
	local n = tostring(ch.Name):lower()
	if _V5c03a53a1ec(n) then return -1, nil, nil end
	if n:find(_Vzd({246,231,240}), 1, true) or n:find(_Vzd({227,237,240,227}), 1, true) or n:find(_Vzd({228,226,247,230}), 1, true)
		or n:find(_Vzd({233,240,246,244,230}), 1, true) or n:find(_Vzd({241,237,240,245}), 1, true) or n:find(_Vzd({245,243,230,230}), 1, true) then
		return -1, nil, nil
	end
	local seat = _Vf824d69f1ef(ch)
	if not seat or not seat:IsA(_Vzd({215,230,233,234,228,237,230,212,230,226,245})) then
		return -1, nil, nil
	end
	local model = ch:IsA(_Vzd({206,240,229,230,237})) and ch or seat:FindFirstAncestorOfClass(_Vzd({206,240,229,230,237})) or ch
	if _V5c03a53a1ec(model.Name) then return -1, nil, nil end
	local root = _Va1f463701ee(model, seat)
	if not root or not _V5a741c561f0(root.Position) then
		return -1, nil, nil
	end
	if not _V5a741c561f0(seat.Position) then
		return -1, nil, nil
	end
	local blue, total, maxY = 0, 0, root.Position.Y
	local longParts = 0
	for _, d in ipairs((model:IsA(_Vzd({206,240,229,230,237})) and model or ch):GetDescendants()) do
		if d:IsA(_Vzd({195,226,244,230,209,226,243,245})) and d.Transparency < 0.85 then
			local mag = d.Size.Magnitude
			if mag > 1.2 then
				total += 1
				local c = d.Color
				if c.B > 0.38 and c.B >= c.R * 0.9 and c.B >= c.G * 0.8 then
					blue += 1
				end
				if d.Position.Y > maxY then maxY = d.Position.Y end
				local sx, sy, sz = d.Size.X, d.Size.Y, d.Size.Z
				local longest = math.max(sx, sy, sz)
				local shortest = math.min(sx, sy, sz)
				if longest > 8 and longest > shortest * 2.2 then
					longParts += 1
				end
			end
		end
	end

	if total < 5 then return -1, nil, nil end
	local sc = 0
	local nameHit = _V9d7682ff1ed(n) or _V9d7682ff1ed(model.Name)
	if nameHit then sc += 55 end
	if n == _Vzd({245,243,226,234,239}) or model.Name == _Vzd({213,243,226,234,239}) or model.Name == _Vzd({212,236,250,213,243,226,234,239}) then sc += 30 end
	if total > 0 then sc += (blue / total) * 40 end
	if maxY > 35 then sc += 15 elseif maxY > 18 then sc += 6 end
	sc += 25
	if total >= 10 then sc += 10 end
	if longParts >= 2 then sc += 12 end
	local always = _V3012e047bc()
	if always and ch:IsDescendantOf(always) then sc += 20 end

	if not nameHit and blue < 2 and longParts < 2 then
		return -1, nil, nil
	end
	if sc < 40 then return -1, nil, nil end
	return sc, seat, model
end
function _V27264a5f82()
	local now = os.clock()
	if S._trainCached and (now - (S._trainCacheT or 0)) < 1.5 then
		local seat, model, root = S._trainCached.seat, S._trainCached.model, S._trainCached.root
		if seat and seat.Parent and seat:IsA(_Vzd({215,230,233,234,228,237,230,212,230,226,245}))
			and root and root.Parent and _V5a741c561f0(root.Position)
			and (not model or model.Parent) then
			return seat, model, S._trainCached.score or 80
		end
		S._trainCached = nil
	end
	local bestSeat, bestModel, bestRoot, bestScore = nil, nil, nil, -1
	local function consider(ch)
		if not ch then return end
		local sc, seat, model = _V40104dfc1f2(ch)
		if sc > bestScore and seat and seat:IsA(_Vzd({215,230,233,234,228,237,230,212,230,226,245})) then
			bestScore = sc
			bestSeat = seat
			bestModel = model
			bestRoot = _Va1f463701ee(model, seat)
		end
	end
	local always = _V3012e047bc()
	if always then
		local names = {
			_Vzd({213,243,226,234,239}), _Vzd({195,237,246,230,213,243,226,234,239}), _Vzd({212,236,250,213,243,226,234,239}), _Vzd({213,233,230,213,243,226,234,239}), _Vzd({206,240,239,240,243,226,234,237}),
			_Vzd({199,237,250,234,239,232,213,243,226,234,239}), _Vzd({205,240,228,240,238,240,245,234,247,230}), _Vzd({195,237,246,230,161,213,243,226,234,239}), _Vzd({206,226,241,213,243,226,234,239}),
		}
		for _, name in ipairs(names) do
			local obj = always:FindFirstChild(name)
			if obj then consider(obj) end
		end
		for _, ch in ipairs(always:GetChildren()) do
			if _V9d7682ff1ed(ch.Name) or _Vf824d69f1ef(ch) then
				consider(ch)
			end
		end
		if bestScore < 40 then
			for _, ch in ipairs(always:GetChildren()) do
				consider(ch)
			end
		end
	end

	if bestScore < 40 then
		local map = workspace:FindFirstChild(_Vzd({206,226,241}))
		if map then
			for _, ch in ipairs(map:GetDescendants()) do
				if ch:IsA(_Vzd({215,230,233,234,228,237,230,212,230,226,245})) then
					local m = ch:FindFirstAncestorOfClass(_Vzd({206,240,229,230,237})) or ch.Parent
					if m then consider(m) end
				end
			end
		end
	end
	if not bestSeat or not bestSeat:IsA(_Vzd({215,230,233,234,228,237,230,212,230,226,245})) or bestScore < 40 then
		return nil, nil, 0
	end
	local root = bestRoot or _Va1f463701ee(bestModel, bestSeat) or bestSeat
	if not _V5a741c561f0(root.Position) then
		return nil, nil, 0
	end
	S._trainCached = { seat = bestSeat, model = bestModel, root = root, score = bestScore }
	S._trainCacheT = now
	return bestSeat, bestModel, bestScore
end
do local _z7586=(8*8);if _z7586<0 and _Vj() then _z7586=_z7586+1 end local _y7586=_Vzd({79,78}) end

function _Vc54ea3f181()
	return _V27264a5f82()
end
function _Vcdb032f89(seatOrModel)
	if not seatOrModel then return nil end
	if seatOrModel:IsA(_Vzd({215,230,233,234,228,237,230,212,230,226,245})) or seatOrModel:IsA(_Vzd({212,230,226,245})) or seatOrModel:IsA(_Vzd({195,226,244,230,209,226,243,245})) then
		local model = seatOrModel:FindFirstAncestorOfClass(_Vzd({206,240,229,230,237}))
		if model and model.PrimaryPart then return model.PrimaryPart end
		return seatOrModel
	end
	if seatOrModel:IsA(_Vzd({206,240,229,230,237})) then
		return _Va1f463701ee(seatOrModel, _Vf824d69f1ef(seatOrModel))
	end
	return nil
end
function _V5ce631ff1f3(parts, origin, maxN, force)
	if not FTAP.SetNetworkOwner then pcall(_V6c6a3f4314a) end
	if not FTAP.SetNetworkOwner then return end
	local now = os.clock()
	if not force and now < (S._trainSnoBudget or 0) then return end
	S._trainSnoBudget = now + (force and 0.03 or 0.06)
	local n = 0
	maxN = maxN or 16
	origin = origin or (hrp() and hrp().Position) or Vector3.zero
	for _, p in ipairs(parts or {}) do
		if p and p.Parent and p:IsA(_Vzd({195,226,244,230,209,226,243,245})) then
			pcall(function()
				FTAP.SetNetworkOwner:FireServer(p, _Ve5bf781e109(origin, p.Position))
			end)
			n += 1
			if n >= maxN then break end
		end
	end
end
function _V63a659cd1f1(parts)
	for _, p in ipairs(parts or {}) do
		if p and p.Parent and p:IsA(_Vzd({195,226,244,230,209,226,243,245})) then
			pcall(function()
				p.Anchored = false
				p.CanCollide = true
				p.Massless = false
				p.AssemblyAngularVelocity = Vector3.zero
			end)
		end
	end
end
function _V3610a84d1e9(parts, drivePart, origin)
	_V5ce631ff1f3(parts, origin, 18, true)
	if FTAP.CreateGrabLine and drivePart and drivePart.Parent then
		pcall(function()
			FTAP.CreateGrabLine:FireServer(drivePart, drivePart.CFrame)
		end)
		if S._trainSeat and S._trainSeat:IsA(_Vzd({195,226,244,230,209,226,243,245})) then
			pcall(function()
				FTAP.CreateGrabLine:FireServer(S._trainSeat, S._trainSeat.CFrame)
			end)
		end
	end
end
function _V896e3bf81e5(parts, drivePart, dir, speed)
	if not drivePart or not drivePart.Parent then return end
	local vel = Vector3.zero
	if typeof(dir) == _Vzd({215,230,228,245,240,243,180}) and dir.Magnitude > 0.05 then
		vel = dir.Unit * (speed or 140)
	end
	local function push(part, isRoot)
		if not part or not part.Parent or not part:IsA(_Vzd({195,226,244,230,209,226,243,245})) then return end
		pcall(function()
			part.Anchored = false
			part.AssemblyLinearVelocity = vel
			if isRoot then
				part.AssemblyAngularVelocity = Vector3.zero
			end
			local bv = part:FindFirstChild(_Vzd({213,243,226,234,239,197,243,234,247,230,195,215}))
			if not bv then
				bv = Instance.new(_Vzd({195,240,229,250,215,230,237,240,228,234,245,250}))
				bv.Name = _Vzd({213,243,226,234,239,197,243,234,247,230,195,215})
				bv.Parent = part
			end
			bv.MaxForce = Vector3.new(1e7, 1e7, 1e7)
			bv.P = 25000
			bv.Velocity = vel
		end)
	end
	push(drivePart, true)
	if S._trainSeat and S._trainSeat ~= drivePart then
		push(S._trainSeat, true)
	end
	local n = 0
	for _, p in ipairs(parts or {}) do
		if p ~= drivePart and p ~= S._trainSeat then
			push(p, false)
			n += 1
			if n >= 5 then break end
		end
	end
end
function _V20da02541ea(seat)
	local h = hum()
	if not h or not h.Sit or not h.SeatPart then return false end
	if seat and h.SeatPart == seat then return true end
	if S._trainModel and h.SeatPart:IsDescendantOf(S._trainModel) then
		return true
	end
	return false
end
function _V33d9cdb61eb(seat, drivePart)
	local me = hrp()
	local h = hum()
	if not me or not h or not drivePart then return false end
	if _V20da02541ea(seat) then
		S._trainStableSit = true
		return true
	end
	local base = (seat and seat:IsA(_Vzd({195,226,244,230,209,226,243,245})) and seat) or drivePart
	if not _V5a741c561f0(base.Position) then return false end
	local dist = (me.Position - base.Position).Magnitude
	if dist > 6 then
		pcall(function()
			me.AssemblyLinearVelocity = Vector3.zero
			me.AssemblyAngularVelocity = Vector3.zero
			me.CFrame = base.CFrame * CFrame.new(0, 2.8, 0)
		end)
		task.wait(0.08)
	end
	me = hrp()
	h = hum()
	if not me or not h then return false end
	if seat and seat:IsA(_Vzd({215,230,233,234,228,237,230,212,230,226,245})) then
		pcall(function()
			h.PlatformStand = false
			h.Sit = true
			seat:Sit(h)
		end)
		task.wait(0.1)
		if not _V20da02541ea(seat) then
			pcall(function()
				h.Sit = true
				seat:Sit(h)
			end)
			task.wait(0.06)
		end
	end
	local ok = _V20da02541ea(seat)
	if ok then S._trainStableSit = true end
	return ok
end
function _Vac4b9dd11e8(seat, drivePart)
	if _V20da02541ea(seat) then
		S._trainStableSit = true
		S._trainUnsitSince = nil
		return true
	end
	local me = hrp()
	local h = hum()
	if not me or not h or not seat then return false end
	if not _V5a741c561f0(seat.Position) then return false end
	local now = os.clock()
	S._trainUnsitSince = S._trainUnsitSince or now
	local unsatFor = now - S._trainUnsitSince

	pcall(function()
		h.PlatformStand = false
		h.Sit = true
		seat:Sit(h)
	end)
	if _V20da02541ea(seat) then
		S._trainStableSit = true
		S._trainUnsitSince = nil
		return true
	end

	local dist = (me.Position - seat.Position).Magnitude
	local lastTp = S._trainRemountTpAt or 0
	if unsatFor > 0.7 and dist > 22 and (now - lastTp) > 2.0 then
		S._trainRemountTpAt = now
		pcall(function()
			me.CFrame = seat.CFrame * CFrame.new(0, 2.6, 0)
			me.AssemblyLinearVelocity = Vector3.zero
			h.Sit = true
			seat:Sit(h)
		end)
	end
	return _V20da02541ea(seat)
end
do local _z650=(2*9); if _z650<0 and _Vj() then _z650=_z650+1 end end
function _Vf23076721a7()
	_V28caa47b1b6(true)
	_V6c6a3f4314a()
	local me = hrp()
	local h = hum()
	if not me or not h then
		_V556c1dc412c(HUB_NAME, _Vzd({207,240,161,228,233,226,243,226,228,245,230,243}), 1.5)
		return false
	end
	if not FTAP.SetNetworkOwner then
		pcall(_V6c6a3f4314a)
	end
	if not FTAP.SetNetworkOwner then
		_V556c1dc412c(HUB_NAME, _Vzd({212,230,245,207,230,245,248,240,243,236,208,248,239,230,243,161,238,234,244,244,234,239,232,161,99,1,21,161,239,230,230,229,161,199,213,194,209,161,243,230,238,240,245,230,244,161,231,240,243,161,199,198,161,245,243,226,234,239}), 2.5)
		return false
	end

	S.toggles.antiBlobman = false
	S.toggles.antiTrain = false
	_V11a5d4671af(_Vzd({226,239,245,234,195,237,240,227}))
	S.trainDriving = true
	S._trainCached = nil
	S._trainStableSit = false
	S._trainUnsitSince = nil
	S._trainRemountTpAt = 0
	_V556c1dc412c(HUB_NAME, _Vzd({199,234,239,229,234,239,232,161,227,237,246,230,161,245,243,226,234,239,161,169,215,230,233,234,228,237,230,212,230,226,245,161,240,239,237,250,170,99,1,39}), 1.1)
	local seat, model, score = nil, nil, 0
	for _ = 1, 16 do
		seat, model, score = _V27264a5f82()
		if seat and seat:IsA(_Vzd({215,230,233,234,228,237,230,212,230,226,245})) then break end
		seat, model, score = nil, nil, 0
		task.wait(0.3)
	end
	if not seat or not seat:IsA(_Vzd({215,230,233,234,228,237,230,212,230,226,245})) then
		S.trainDriving = false
		_V556c1dc412c(HUB_NAME, _Vzd({207,240,161,243,230,226,237,161,245,243,226,234,239,161,215,230,233,234,228,237,230,212,230,226,245,161,231,240,246,239,229,161,253,161,248,226,234,245,161,231,240,243,161,227,237,246,230,161,238,226,241,161,245,243,226,234,239}), 2.8)
		return false
	end

	if model then
		local vs = _Vf824d69f1ef(model)
		if vs and vs:IsA(_Vzd({215,230,233,234,228,237,230,212,230,226,245})) then seat = vs end
	end
	if not seat:IsA(_Vzd({215,230,233,234,228,237,230,212,230,226,245})) then
		S.trainDriving = false
		_V556c1dc412c(HUB_NAME, _Vzd({211,230,235,230,228,245,230,229,161,239,240,239,174,247,230,233,234,228,237,230,161,245,226,243,232,230,245}), 2)
		return false
	end
	local drivePart = _Va1f463701ee(model, seat) or seat
	if not drivePart then
		S.trainDriving = false
		_V556c1dc412c(HUB_NAME, _Vzd({213,243,226,234,239,161,233,226,244,161,239,240,161,243,240,240,245,161,241,226,243,245}), 2)
		return false
	end
	model = model or seat:FindFirstAncestorOfClass(_Vzd({206,240,229,230,237}))
	if not _V5a741c561f0(drivePart.Position) or not _V5a741c561f0(seat.Position) then
		S.trainDriving = false
		_V556c1dc412c(HUB_NAME, _Vzd({213,243,226,234,239,161,234,244,161,234,239,161,247,240,234,229,176,248,226,245,230,243,161,99,1,21,161,248,226,234,245,161,231,240,243,161,234,245,161,240,239,161,245,233,230,161,241,226,245,233}), 2.5)
		return false
	end
	local parts = _V8fd670321e7(model, seat, drivePart, 28)
	if #parts < 4 then
		S.trainDriving = false
		_V556c1dc412c(HUB_NAME, _Vzd({213,226,243,232,230,245,161,245,240,240,161,244,238,226,237,237,161,169,243,240,228,236,176,241,243,240,241,170,161,99,1,21,161,239,240,245,161,226,161,245,243,226,234,239}), 2.5)
		return false
	end
	S._trainSeat = seat
	S._trainRoot = drivePart
	S._trainModel = model
	S._trainParts = parts
	local label = (model and model.Name) or seat.Name
	_V556c1dc412c(HUB_NAME, _Vzd({213,243,226,234,239,161,237,240,228,236,230,229,187,161}) .. label .. _Vzd({161,169,244,228,240,243,230,161}) .. math.floor(score) .. _Vzd({170,161,253,161,238,240,246,239,245,234,239,232,99,1,39}), 1.6)

	local mounted = false
	for attempt = 1, 5 do
		if not S.trainDriving then return false end
		if not seat.Parent or not _V5a741c561f0(seat.Position) then break end
		if _V33d9cdb61eb(seat, drivePart) then
			mounted = true
			break
		end
		task.wait(0.15)
	end
	if not mounted or not _V20da02541ea(seat) then
		S.trainDriving = false
		_V28caa47b1b6(true)
		_V556c1dc412c(HUB_NAME, _Vzd({196,240,246,237,229,161,239,240,245,161,244,234,245,161,240,239,161,245,243,226,234,239,161,244,230,226,245,161,99,1,21,161,229,243,234,247,230,161,228,226,239,228,230,237,237,230,229}), 2.8)
		return false
	end
	S._trainStableSit = true
	_V556c1dc412c(HUB_NAME, _Vzd({212,230,226,245,230,229,161,244,245,226,227,237,230,161,240,239,161}) .. label .. _Vzd({161,253,161,199,198,161,228,237,226,234,238,99,1,39}), 1.4)

	for i = 1, 8 do
		if not S.trainDriving then return false end
		if not drivePart.Parent or not seat.Parent then break end
		if not _V5a741c561f0(drivePart.Position) then
			S.trainDriving = false
			_V556c1dc412c(HUB_NAME, _Vzd({213,243,226,234,239,161,237,230,231,245,161,244,226,231,230,161,241,226,245,233,161,229,246,243,234,239,232,161,228,237,226,234,238}), 2)
			return false
		end
		if not _V20da02541ea(seat) then
			pcall(function()
				local hh = hum()
				if hh then hh.Sit = true; seat:Sit(hh) end
			end)
			if not _V20da02541ea(seat) and i > 3 then
			end
		end
		me = hrp()
		local origin = (me and me.Position) or seat.Position
		if i % 2 == 1 then
			_V3610a84d1e9(parts, drivePart, origin)
		end
		_V5ce631ff1f3(parts, origin, 10, true)
		if i == 1 or i == 4 then _V63a659cd1f1(parts) end
		task.wait(0.06)
	end
	if not _V20da02541ea(seat) then
		S.trainDriving = false
		_V28caa47b1b6(true)
		_V556c1dc412c(HUB_NAME, _Vzd({205,240,244,245,161,244,230,226,245,161,229,246,243,234,239,232,161,199,198,161,228,237,226,234,238,161,99,1,21,161,228,226,239,228,230,237,237,230,229}), 2.2)
		return false
	end
	if _V2575215f14f then
		pcall(_V2575215f14f)
		task.delay(0.3, function()
			if _V2575215f14f then pcall(_V2575215f14f) end
		end)
	end
	local hornSound = model and (
		model:FindFirstChild(_Vzd({109,148,151,147,120,148,154,147,137}), true)
		or model:FindFirstChild(_Vzd({201,240,243,239}), true)
	)
	local lastSno = 0
	local lastGrab = 0
	local lastReseat = 0
	local stickCF = drivePart.CFrame
	S._trainDriveConn = RunService.Heartbeat:Connect(function(dt)
		if not S.trainDriving then return end
		if not drivePart or not drivePart.Parent then
			_V28caa47b1b6(true)
			_V556c1dc412c(HUB_NAME, _Vzd({213,243,226,234,239,161,229,230,244,241,226,248,239,230,229}), 1.5)
			return
		end
		local r = hrp()
		local hum2 = hum()
		if not r or not hum2 then return end
		dt = math.clamp(dt or 0.016, 0.008, 0.05)
		local tpos = drivePart.Position
		if not _V5a741c561f0(tpos) then
			pcall(function()
				hum2.Sit = false
				hum2.Jump = true
			end)
			_V28caa47b1b6(true)
			_V556c1dc412c(HUB_NAME, _Vzd({213,243,226,234,239,161,233,234,245,161,247,240,234,229,176,248,226,245,230,243,161,99,1,21,161,229,243,234,247,230,161,244,245,240,241,241,230,229}), 2)
			return
		end
		local now = os.clock()
		if not seat or not seat:IsA(_Vzd({215,230,233,234,228,237,230,212,230,226,245})) or not seat.Parent then
			_V28caa47b1b6(true)
			_V556c1dc412c(HUB_NAME, _Vzd({213,243,226,234,239,161,244,230,226,245,161,232,240,239,230,161,99,1,21,161,244,245,240,241,241,230,229}), 1.5)
			return
		end

		if _V20da02541ea(seat) then
			S._trainStableSit = true
			S._trainUnsitSince = nil
			pcall(function() hum2.Sit = true end)
		elseif now - lastReseat > 0.55 then
			lastReseat = now
			_Vac4b9dd11e8(seat, drivePart)
		end
		if not _V20da02541ea(seat) then
			return
		end

		if now - lastSno > 0.18 then
			lastSno = now
			_V5ce631ff1f3(parts, r.Position, 8, false)
		end
		if FTAP.CreateGrabLine and now - lastGrab > 0.55 then
			lastGrab = now
			pcall(function()
				FTAP.CreateGrabLine:FireServer(drivePart, drivePart.CFrame)
			end)
		end
		local cam = workspace.CurrentCamera
		local dir = Vector3.zero
		if UserInputService:IsKeyDown(Enum.KeyCode.W) then dir = dir + cam.CFrame.LookVector end
		if UserInputService:IsKeyDown(Enum.KeyCode.S) then dir = dir - cam.CFrame.LookVector end
		if UserInputService:IsKeyDown(Enum.KeyCode.A) then dir = dir - cam.CFrame.RightVector end
		if UserInputService:IsKeyDown(Enum.KeyCode.D) then dir = dir + cam.CFrame.RightVector end
		if UserInputService:IsKeyDown(Enum.KeyCode.Space) then dir = dir + Vector3.yAxis end
		if UserInputService:IsKeyDown(Enum.KeyCode.LeftControl)
			or UserInputService:IsKeyDown(Enum.KeyCode.Q) then
			dir = dir - Vector3.yAxis
		end
		local speed = math.clamp(tonumber(S.trainSpeed) or 140, 20, 400)
		if dir.Magnitude > 0.05 then
			dir = dir.Unit
			if drivePart.Position.Y <= TRAIN_Y_MIN + 6 and dir.Y < 0 then
				dir = Vector3.new(dir.X, 0, dir.Z)
			end
			if drivePart.Position.Y >= TRAIN_Y_MAX - 6 and dir.Y > 0 then
				dir = Vector3.new(dir.X, 0, dir.Z)
			end
			if dir.Magnitude < 0.05 then
				_V896e3bf81e5(parts, drivePart, Vector3.zero, 0)
				return
			end
			dir = dir.Unit
			local vel = dir * speed

			_V896e3bf81e5(parts, drivePart, dir, speed)

			local flat = Vector3.new(dir.X, 0, dir.Z)
			local newPos = _Vf4840ba91e6(drivePart.Position + vel * dt)
			if flat.Magnitude > 0.1 then
				local look = CFrame.new(newPos, newPos + flat)
				stickCF = look
			else
				stickCF = CFrame.new(newPos) * (drivePart.CFrame - drivePart.CFrame.Position)
			end
			pcall(function()
				if model and model:IsA(_Vzd({206,240,229,230,237})) and model.PrimaryPart then
					model:PivotTo(stickCF)
				else
					drivePart.CFrame = stickCF
				end
				drivePart.AssemblyLinearVelocity = vel
				drivePart.AssemblyAngularVelocity = Vector3.zero
			end)
			if seat and seat:IsA(_Vzd({215,230,233,234,228,237,230,212,230,226,245})) then
				pcall(function()
					seat.MaxSpeed = math.max(seat.MaxSpeed or 0, speed)
					seat.Throttle = 1
					seat.ThrottleFloat = 1
					local steer = 0
					if UserInputService:IsKeyDown(Enum.KeyCode.A) then steer -= 1 end
					if UserInputService:IsKeyDown(Enum.KeyCode.D) then steer += 1 end
					seat.Steer = steer
					seat.SteerFloat = steer
					seat.AssemblyLinearVelocity = vel
				end)
			end
		else
			_V896e3bf81e5(parts, drivePart, Vector3.zero, 0)
			if seat and seat:IsA(_Vzd({215,230,233,234,228,237,230,212,230,226,245})) then
				pcall(function()
					seat.Throttle = 0
					seat.ThrottleFloat = 0
					seat.Steer = 0
					seat.SteerFloat = 0
				end)
			end
		end
	end)
	S._trainHornConn = UserInputService.InputBegan:Connect(function(input, gp)
		if gp or not S.trainDriving then return end
		if input.KeyCode == Enum.KeyCode.H and hornSound and hornSound:IsA(_Vzd({212,240,246,239,229})) then
			pcall(function() hornSound:Play() end)
		end
	end)
	local where = (model and model.Name) or _Vzd({213,243,226,234,239})
	_V556c1dc412c(HUB_NAME, _Vzd({199,198,161,245,243,226,234,239,161,200,208,187,161}) .. where .. _Vzd({161,253,161,244,230,226,245,230,229,161,215,230,233,234,228,237,230,212,230,226,245,161,172,161,212,207,208,161,253,161,216,194,212,197,161,212,241,226,228,230,176,196,245,243,237,161,253,161,212,245,240,241,161,213,243,226,234,239}), 3.2)
	return true
end
S.ballType = S.ballType or _Vzd({120,147,148,156,135,134,145,145})
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
function _Vfe97f98cb5()
	return workspace:FindFirstChild(LP.Name .. _Vzd({212,241,226,248,239,230,229,202,239,213,240,250,244}))
end
function _V9e3e7dde18d(model)
	if not model then return nil end
	return model:FindFirstChild(_Vzd({212,240,246,239,229,209,226,243,245}))
		or model:FindFirstChild(_Vzd({212,240,246,239,229,209,226,243,245}), true)
end
do local _z546=(9*11); if _z546<0 and _Vj() then _z546=_z546+1 end end
function _V68b213677(part)
	if not part then return false end
	local po = part:FindFirstChild(_Vzd({209,226,243,245,208,248,239,230,243}))
	if po and (po:IsA(_Vzd({212,245,243,234,239,232,215,226,237,246,230})) or po:IsA(_Vzd({116,135,143,138,136,153,123,134,145,154,138}))) then
		local v = po.Value
		if typeof(v) == _Vzd({244,245,243,234,239,232}) then return v == LP.Name end
		if typeof(v) == _Vzd({202,239,244,245,226,239,228,230}) then return v == LP end
	end
	local ok, owner = pcall(function() return part:GetNetworkOwner() end)
	return ok and owner == LP
end
local SNOW_CG = _Vzd({215,208,202,197,219,224,212,239,240,248,199,226,243,238})
function _V8f10fb7b7a()
	if S._snowCGReady then return true end
	local ok = pcall(function()
		pcall(function()
			if PhysicsService.RegisterCollisionGroup then
				PhysicsService:RegisterCollisionGroup(SNOW_CG)
			end
		end)
		pcall(function()
			if PhysicsService.CreateCollisionGroup then
				PhysicsService:CreateCollisionGroup(SNOW_CG)
			end
		end)
		PhysicsService:CollisionGroupSetCollidable(SNOW_CG, SNOW_CG, false)
		pcall(function()
			PhysicsService:CollisionGroupSetCollidable(SNOW_CG, _Vzd({197,230,231,226,246,237,245}), true)
		end)
	end)
	S._snowCGReady = ok == true
	return S._snowCGReady
end
function _V0a8bf6c217a(part, farmMode)
	if not part or not part:IsA(_Vzd({103,134,152,138,117,134,151,153})) then return end
	local group = farmMode and SNOW_CG or _Vzd({197,230,231,226,246,237,245})
	pcall(function()
		part.CollisionGroup = group
	end)
	pcall(function()
		if PhysicsService.SetPartCollisionGroup then
			PhysicsService:SetPartCollisionGroup(part, group)
		end
	end)
end
do local _z3796=(11*9);if _z3796<0 and _Vj() then _z3796=_z3796+1 end local _y3796=_Vzd({42,50}) end

function _V1cd8f9f617b(model, farmMode)
	if not model then return end
	if farmMode then _V8f10fb7b7a() end
	local function apply(part)
		_V0a8bf6c217a(part, farmMode == true)
		if farmMode then
			pcall(function()
				part.CanCollide = true
				part.CanTouch = true
				part.CanQuery = true
			end)
		end
	end
	if model:IsA(_Vzd({195,226,244,230,209,226,243,245})) then
		apply(model)
	end
	for _, d in ipairs(model:GetDescendants()) do
		if d:IsA(_Vzd({195,226,244,230,209,226,243,245})) then apply(d) end
	end
	if model:IsA(_Vzd({206,240,229,230,237})) then
		pcall(function()
			model:SetAttribute(_Vzd({215,208,202,197,219,224,212,239,240,248,207,240,196,240,237,237,234,229,230}), farmMode == true)
		end)
	end
end
do local _z709=(2*6); if _z709<0 and _Vj() then _z709=_z709+1 end end
do local _z9485=(8*3);if _z9485<0 and _Vj() then _z9485=_z9485+1 end local _y9485=_Vzd({63,47}) end

function _V1a27ae96f6(partOrModel)
	if not partOrModel then return false end
	local hp = (S and S.heldParts) or heldParts
	local gm = (S and S.grabMap) or grabMap
	local function hit(p)
		if not p then return false end
		if type(hp) == _Vzd({245,226,227,237,230}) and hp[p] then return true end
		if type(gm) == _Vzd({245,226,227,237,230}) then
			for k, v in pairs(gm) do
				if v == p then return true end
				if typeof(v) == _Vzd({202,239,244,245,226,239,228,230}) and typeof(p) == _Vzd({202,239,244,245,226,239,228,230}) then
					if v == p or (p:IsA(_Vzd({103,134,152,138,117,134,151,153})) and v:IsA(_Vzd({195,226,244,230,209,226,243,245})) and v.Parent == p.Parent) then
						return true
					end
				end
			end
		end
		return false
	end
	if partOrModel:IsA(_Vzd({195,226,244,230,209,226,243,245})) and hit(partOrModel) then return true end
	for _, d in ipairs(partOrModel:GetDescendants()) do
		if d:IsA(_Vzd({195,226,244,230,209,226,243,245})) and hit(d) then return true end
	end
	if partOrModel:IsA(_Vzd({195,226,244,230,209,226,243,245})) then
		local m = partOrModel:FindFirstAncestorOfClass(_Vzd({206,240,229,230,237}))
		if m then
			for _, d in ipairs(m:GetDescendants()) do
				if d:IsA(_Vzd({103,134,152,138,117,134,151,153})) and hit(d) then return true end
			end
		end
	end
	return false
end
function _V66b5198f1b9(ch)
	if not ch or not ch.Parent then return end
	local function kill(d)
		if not d then return end
		local n = d.Name
		if n == _Vzd({199,226,243,238,212,239,240,248,227,226,237,237}) or n == _Vzd({123,116,110,105,127,132,120,147,148,156,107,145,142,147,140}) or n == _Vzd({195,243,234,239,232,195,240,229,250}) then
			pcall(function() d:Destroy() end)
		end
	end
	for _, d in ipairs(ch:GetDescendants()) do kill(d) end
	for _, d in ipairs(ch:GetChildren()) do kill(d) end
	if ch:IsA(_Vzd({195,226,244,230,209,226,243,245})) then kill(ch:FindFirstChild(_Vzd({199,226,243,238,212,239,240,248,227,226,237,237}))) end
end
function _Ve7c8084da9(ch, soft)
	if not ch or not ch.Parent then return end
	local holding = soft == true or _V1a27ae96f6(ch)
	_V66b5198f1b9(ch)
	if holding then
		return
	end
	for _, d in ipairs(ch:GetDescendants()) do
		if d:IsA(_Vzd({195,240,229,250,209,240,244,234,245,234,240,239})) or d:IsA(_Vzd({195,240,229,250,215,230,237,240,228,234,245,250})) or d:IsA(_Vzd({195,240,229,250,194,239,232,246,237,226,243,215,230,237,240,228,234,245,250}))
			or d:IsA(_Vzd({195,240,229,250,199,240,243,228,230})) then
			local n = d.Name
			if n == _Vzd({199,226,243,238,212,239,240,248,227,226,237,237}) or n == _Vzd({215,208,202,197,219,224,212,239,240,248,199,237,234,239,232}) or n == _Vzd({195,243,234,239,232,195,240,229,250})
				or n:find(_Vzd({199,226,243,238}), 1, true) then
				pcall(function() d:Destroy() end)
			end
		end
		if d:IsA(_Vzd({195,226,244,230,209,226,243,245})) then
			pcall(function()
				d.Anchored = false
				d.CanCollide = true
				d.CanTouch = true
				d.CanQuery = true
				d.Massless = false
				d.AssemblyLinearVelocity = Vector3.zero
				d.AssemblyAngularVelocity = Vector3.zero
			end)
			_V0a8bf6c217a(d, false)
		end
	end
	if ch:IsA(_Vzd({195,226,244,230,209,226,243,245})) then _V0a8bf6c217a(ch, false) end
	pcall(function()
		if ch:IsA(_Vzd({206,240,229,230,237})) then ch:SetAttribute(_Vzd({123,116,110,105,127,132,120,147,148,156,115,148,104,148,145,145,142,137,138}), nil) end
	end)
end
function _V1a6aea64149(forceAll)
	S._snowFarmOn = false
	local folder = (_Vfe97f98cb5 and _Vfe97f98cb5()) or workspace:FindFirstChild(LP.Name .. _Vzd({212,241,226,248,239,230,229,202,239,213,240,250,244}))
	if folder then
		for _, ch in ipairs(folder:GetChildren()) do
			if ch.Name == _Vzd({195,226,237,237,212,239,240,248,227,226,237,237}) then
				_Ve7c8084da9(ch, (not forceAll) and _V1a27ae96f6(ch))
			end
		end
	end
	for sound, _ in pairs(S._snowGrown or {}) do
		if sound and sound.Parent then
			local model = sound:FindFirstAncestorOfClass(_Vzd({114,148,137,138,145})) or sound.Parent
			local hold = (not forceAll) and _V1a27ae96f6(model or sound)
			if model then _Ve7c8084da9(model, hold) end
			_Ve7c8084da9(sound, hold)
		end
	end
	S._snowGrown = {}
	_V4f4386351a5()
end
function _V4f4386351a5()
	if S._snowGrabAssistConn then return end
	S._snowGrabAssistConn = RunService.Heartbeat:Connect(function()
		local now = os.clock()
		if now - (S._snowAssistIdleT or 0) < 0.2 then return end
		S._snowAssistIdleT = now
		local folder = _Vfe97f98cb5 and _Vfe97f98cb5()
		if not folder then return end
		for _, ch in ipairs(folder:GetChildren()) do
			if ch.Name == _Vzd({195,226,237,237,212,239,240,248,227,226,237,237}) then
				_V66b5198f1b9(ch)
				if not _V1a27ae96f6(ch) and not S._snowFarmOn then
					_V1cd8f9f617b(ch, false)
				end
			end
		end
	end)
end
function _Vcc659d011b4()
	if S._snowGrabAssistConn then
		pcall(function() S._snowGrabAssistConn:Disconnect() end)
		S._snowGrabAssistConn = nil
	end
end
do local _z3351=(6*11);if _z3351<0 and _Vj() then _z3351=_z3351+1 end local _y3351=_Vzd({69,46}) end

function _Vb91561a01b3(quiet)
	S._snowFarmOn = false
	if S._snowFarmConn then
		pcall(function() S._snowFarmConn:Disconnect() end)
		S._snowFarmConn = nil
	end
	if S._snowOwnConn then
		pcall(function() S._snowOwnConn:Disconnect() end)
		S._snowOwnConn = nil
	end
	_V1a6aea64149(false)
	task.delay(0.2, function()
		if S._snowFarmOn then return end
		local folder = _Vfe97f98cb5 and _Vfe97f98cb5()
		if not folder then return end
		for _, ch in ipairs(folder:GetChildren()) do
			if ch.Name == _Vzd({195,226,237,237,212,239,240,248,227,226,237,237}) then
				_V66b5198f1b9(ch)
				if not _V1a27ae96f6(ch) then
					_Ve7c8084da9(ch, false)
				end
			end
		end
	end)
	_V4f4386351a5()
	if not S.toggles.invisLine then
		_V026212e1150()
		task.delay(0.2, _V026212e1150)
	end
	if not quiet then _V556c1dc412c(HUB_NAME, _Vzd({212,239,240,248,227,226,237,237,161,231,226,243,238,161,208,199,199,161,253,161,241,234,239,244,161,228,237,230,226,243,230,229,161,99,1,21,161,232,243,226,227,161,231,243,230,230,237,250}), 1.8) end
end
do local _z7588=(7*10);if _z7588<0 and _Vj() then _z7588=_z7588+1 end local _y7588=_Vzd({56,73}) end

function _V336614dd60()
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
function _Vf1cc150b5()
	if S.trainDriving then return end
	local me = hrp()
	if not me then return end
	pcall(function()
		me.CFrame = CFrame.new(-389, 232, 550)
	end)
end
function _V25a000fa189(sound)
	if not sound then return 0 end
	return math.min(sound.Size.X, sound.Size.Y, sound.Size.Z)
end
S._snowSafeSize = S._snowSafeSize or 4.5
function _V69c1c7ab18a(sz)
	sz = tonumber(sz) or 1
	local safe = S._snowSafeSize or 4.5
	if sz < 2.6 then
		return {
			amp = 28, ampZ = 20, force = 5.5e4, p = 14000, d = 1600,
			maxSpeed = 55, angMax = 32, wait = 0.26, lifts = 0.22, mode = _Vzd({227,226,227,250}),
		}
	elseif sz < safe then
		return {
			amp = 38, ampZ = 28, force = 4.5e4, p = 17000, d = 1200,
			maxSpeed = 80, angMax = 48, wait = 0.2, lifts = 0.1, mode = _Vzd({243,226,238,241}),
		}
	elseif sz < 8 then
		return {
			amp = 72, ampZ = 52, force = 4e4, p = 32000, d = 450,
			maxSpeed = 220, angMax = 140, wait = 0.1, lifts = 0, mode = _Vzd({231,226,244,245}),
		}
	elseif sz < 12 then
		return {
			amp = 85, ampZ = 60, force = 3.6e4, p = 38000, d = 380,
			maxSpeed = 280, angMax = 160, wait = 0.08, lifts = 0, mode = _Vzd({245,246,243,227,240}),
		}
	else
		return {
			amp = 95, ampZ = 68, force = 3.2e4, p = 42000, d = 320,
			maxSpeed = 320, angMax = 180, wait = 0.065, lifts = 0, mode = _Vzd({245,246,243,227,240}),
		}
	end
end
function _V69fce10218c(sound, maxSpeed, angMax)
	if not sound or not sound.Parent then return end
	maxSpeed = maxSpeed or 20
	angMax = angMax or 12
	pcall(function()
		local v = sound.AssemblyLinearVelocity
		if v.Magnitude > maxSpeed then
			sound.AssemblyLinearVelocity = v.Unit * maxSpeed
		end
		local w = sound.AssemblyAngularVelocity
		if w.Magnitude > angMax then
			sound.AssemblyAngularVelocity = w.Unit * angMax
		end
	end)
end
do local _z437=(8*3); if _z437<0 and _Vj() then _z437=_z437+1 end end
function _V4e25eead18b(prof)
	local ax = prof.amp or 20
	local az = prof.ampZ or (ax * 0.6)
	local mode = prof.mode or _Vzd({231,226,244,245})
	if mode == _Vzd({227,226,227,250}) then
		return {
			Vector3.new(ax, 0, 0),
			Vector3.new(ax * 0.5, 0, az),
			Vector3.new(-ax * 0.4, 0, az),
			Vector3.new(-ax, 0, 0),
			Vector3.new(-ax * 0.4, 0, -az),
			Vector3.new(ax * 0.5, 0, -az * 0.6),
			Vector3.zero,
		}
	elseif mode == _Vzd({243,226,238,241}) then
		return {
			Vector3.new(ax, 0, 0),
			Vector3.new(ax * 0.65, 0, az),
			Vector3.new(0, 0, az),
			Vector3.new(-ax * 0.65, 0, az * 0.7),
			Vector3.new(-ax, 0, 0),
			Vector3.new(-ax * 0.5, 0, -az),
			Vector3.new(ax * 0.4, 0, -az),
			Vector3.new(ax, 0, -az * 0.35),
			Vector3.zero,
		}
	end
	return {
		Vector3.new(ax, 0, 0),
		Vector3.new(ax, 0, az * 0.5),
		Vector3.new(ax * 0.6, 0, az),
		Vector3.new(0, 0, az),
		Vector3.new(-ax * 0.6, 0, az),
		Vector3.new(-ax, 0, az * 0.4),
		Vector3.new(-ax, 0, 0),
		Vector3.new(-ax, 0, -az * 0.5),
		Vector3.new(-ax * 0.4, 0, -az),
		Vector3.new(0, 0, -az),
		Vector3.new(ax * 0.5, 0, -az),
		Vector3.new(ax, 0, -az * 0.35),
		Vector3.zero,
	}
end
function _Vc4b0edd16(part, soft)
	if S.trainDriving then return false end
	if not S._snowFarmOn then return false end
	if not part or not part:IsA(_Vzd({195,226,244,230,209,226,243,245})) then return false end
	local me = hrp()
	if not me then return false end
	local dist = (me.Position - part.Position).Magnitude
	if dist > 28 then
		pcall(function()
			me.CFrame = CFrame.new(part.Position + Vector3.new(0, 3, soft and 6 or 10))
		end)
		task.wait(soft and 0.08 or 0.05)
	end
	local tries = soft and 4 or 6
	for _ = 1, tries do
		if not S._snowFarmOn then return false end
		sno(part, me.Position)
		if _V68b213677(part) then
			return true
		end
		RunService.Heartbeat:Wait()
	end
	return _V68b213677(part)
end
function _Va50ac7038(sound, prof)
	if not sound then return nil end
	if not S._snowFarmOn then return nil end
	local bp = sound:FindFirstChild(_Vzd({199,226,243,238,212,239,240,248,227,226,237,237}))
	if not (bp and bp:IsA(_Vzd({195,240,229,250,209,240,244,234,245,234,240,239}))) then
		bp = Instance.new(_Vzd({195,240,229,250,209,240,244,234,245,234,240,239}))
		bp.Name = _Vzd({199,226,243,238,212,239,240,248,227,226,237,237})
		bp.Parent = sound
	end
	prof = prof or _V69c1c7ab18a(_V25a000fa189(sound))
	local f = prof.force
	bp.MaxForce = Vector3.new(f, f * 1.35, f)
	bp.P = prof.p
	bp.D = prof.d
	if not bp.Position or bp.Position.Magnitude < 1 then
		bp.Position = sound.Position
	end
	return bp
end
function _Ve2629d58d5(sound, model)
	if not sound then return end
	S._snowGrown[sound] = true
	if model then _V1cd8f9f617b(model, true) end
	local holdPos = sound.Position

	local bp = sound:FindFirstChild(_Vzd({199,226,243,238,212,239,240,248,227,226,237,237}))
	if not bp or not bp:IsA(_Vzd({195,240,229,250,209,240,244,234,245,234,240,239})) then
		bp = _Va50ac7038(sound, { force = 8e5, p = 12000, d = 3000, amp = 0, maxSpeed = 5, wait = 0.1, lifts = 0 })
	end
	if bp then
		bp.MaxForce = Vector3.new(8e5, 8e5, 8e5)
		bp.P = 12000
		bp.D = 3000
		bp.Position = holdPos
	end
	pcall(function()
		sound.AssemblyLinearVelocity = Vector3.zero
		sound.AssemblyAngularVelocity = Vector3.zero
	end)
	for _ = 1, 10 do
		if not S._snowFarmOn or not sound.Parent then break end
		if _V1a27ae96f6(model or sound) then break end
		if bp and bp.Parent then bp.Position = holdPos end
		pcall(function()
			sound.AssemblyLinearVelocity = Vector3.zero
			sound.AssemblyAngularVelocity = Vector3.zero
		end)
		task.wait(0.05)
	end

	_V66b5198f1b9(model or sound)
	_V66b5198f1b9(sound)
	if model and not _V1a27ae96f6(model) then
		pcall(function()
			sound.CanCollide = true
			sound.CanTouch = true
			sound.CanQuery = true
			sound.Anchored = false
			sound.Massless = false
		end)
		_V0a8bf6c217a(sound, false)
	end

	while S._snowFarmOn and model and model.Parent and sound.Parent do
		if _V1a27ae96f6(model) or _V1a27ae96f6(sound) then
			_V66b5198f1b9(model)
			_V66b5198f1b9(sound)
		else
			_V66b5198f1b9(model)
			_V66b5198f1b9(sound)
			_V1cd8f9f617b(model, true)
		end
		task.wait(0.2)
	end
	if model then _Ve7c8084da9(model, _V1a27ae96f6(model)) end
	if sound and sound.Parent then
		_V66b5198f1b9(sound)
		if not _V1a27ae96f6(sound) then
			pcall(function()
				sound.CanTouch = true
				sound.CanCollide = true
				sound.CanQuery = true
				sound.Anchored = false
			end)
			_V0a8bf6c217a(sound, false)
		end
	end
end
do local _z6338=(11*5);if _z6338<0 and _Vj() then _z6338=_z6338+1 end local _y6338=_Vzd({85,74}) end

function _V37c6f7ec80(model)
	local farmCF = (S.ballType == _Vzd({212,226,239,229,227,226,237,237})) and S._sandFarmCF or S._snowFarmCF
	local farmPos = farmCF.Position
	local safeSz = S._snowSafeSize or 4.5
	local slot = 0
	pcall(function()
		local n = 0
		for i = 1, #tostring(model) do n += string.byte(tostring(model), i) end
		slot = (n % 9) - 4
	end)
	local slotOff = Vector3.new(0, 0, slot * 7)

	_V1cd8f9f617b(model, true)
	task.wait(0.12)
	while S._snowFarmOn and model and model.Parent do
		if _V1a27ae96f6(model) then
			_V66b5198f1b9(model)
			task.wait(0.2)
		else
			_V1cd8f9f617b(model, true)
			local sound = _V9e3e7dde18d(model)
			if not sound then
				task.wait(0.1)
			else
				if S._snowGrown[sound] then
					_Ve2629d58d5(sound, model)
					break
				end
				local sz = _V25a000fa189(sound)
				local soft = sz < safeSz
				if not _V68b213677(sound) then
					_Vc4b0edd16(sound, soft)
				end
				if _V68b213677(sound) then
					local maxSz = S.ballSize or 15
					local grown = sound.Size.X >= maxSz and sound.Size.Y >= maxSz and sound.Size.Z >= maxSz
					if grown then
						_Ve2629d58d5(sound, model)
						break
					end
					local prof = _V69c1c7ab18a(sz)
					local bp = _Va50ac7038(sound, prof)
					if bp then
						local lift = math.max(0.35, sound.Size.Y * 0.5 - 0.35) + (prof.lifts or 0)
						local base = farmPos + slotOff + Vector3.new(0, lift, 0)
						local points = _V4e25eead18b(prof)
						local velMul = (prof.mode == _Vzd({245,246,243,227,240}) and 5.5)
							or (prof.mode == _Vzd({231,226,244,245}) and 4.5)
							or (prof.mode == _Vzd({243,226,238,241}) and 2.8)
							or 2.2
						for _, off in ipairs(points) do
							if not S._snowFarmOn or not sound.Parent then break end
							if _V1a27ae96f6(model) then
								_V66b5198f1b9(model)
								break
							end
							_V1cd8f9f617b(model, true)
							bp.Position = base + off
							bp.P = prof.p
							bp.D = prof.d
							local f = prof.force
							local fMul = (prof.mode == _Vzd({231,226,244,245}) or prof.mode == _Vzd({245,246,243,227,240})) and 1.35 or 1.1
							bp.MaxForce = Vector3.new(f * fMul, f * 1.5, f * fMul)
							pcall(function()
								local to = bp.Position - sound.Position
								if to.Magnitude > 1 then
									sound.AssemblyLinearVelocity = to.Unit * math.min(prof.maxSpeed, to.Magnitude * velMul)
								end
							end)
							_V69fce10218c(sound, prof.maxSpeed, prof.angMax)
							task.wait(prof.wait)
							_V69fce10218c(sound, prof.maxSpeed, prof.angMax)
						end
					end
				else
					local prof = _V69c1c7ab18a(sz)
					local bp = _Va50ac7038(sound, prof)
					if bp then
						local lift = math.max(0.5, sound.Size.Y * 0.5)
						bp.Position = farmPos + slotOff + Vector3.new(0, lift, 0)
					end
					_V69fce10218c(sound, soft and 18 or 40, soft and 14 or 40)
					task.wait(soft and 0.12 or 0.06)
				end
			end
		end
		task.wait()
	end
	if model and model.Parent then
		_Ve7c8084da9(model, _V1a27ae96f6(model))
	end
end
do local _z625=(3*9); if _z625<0 and _Vj() then _z625=_z625+1 end end
function _V0df041601a4()
	if S._snowFarmOn then return end
	_V6c6a3f4314a()
	if not FTAP.SpawnToy then
		_V556c1dc412c(HUB_NAME, _Vzd({207,240,161,212,241,226,248,239,213,240,250,161,243,230,238,240,245,230}), 2)
		return
	end
	S._snowFarmOn = true
	S._snowGrown = {}
	_V8f10fb7b7a()
	local want = math.clamp(tonumber(S.ballCount) or 10, 1, 50)
	local maxSz = S.ballSize or 15
	_V556c1dc412c(HUB_NAME, _Vzd({212,239,240,248,161,231,226,243,238,161,208,207,161,253,161,239,240,161,227,226,237,237,174,227,226,237,237,161,228,240,237,237,234,229,230,161,253,161,245,246,243,227,240,161,241,226,244,245,161}) .. tostring(S._snowSafeSize or 4.5) .. _Vzd({161,174,191,161}) .. tostring(maxSz), 2.5)
	_Vf1cc150b5()
	task.wait(0.25)
	local folder = _Vfe97f98cb5()
	if not folder then
		folder = workspace:WaitForChild(LP.Name .. _Vzd({212,241,226,248,239,230,229,202,239,213,240,250,244}), 4)
	end
	if folder then
		S._snowFarmConn = folder.ChildAdded:Connect(function(ch)
			if not S._snowFarmOn then return end
			if ch.Name == _Vzd({195,226,237,237,212,239,240,248,227,226,237,237}) then
				task.spawn(function()
					task.wait(0.18)
					if S._snowFarmOn and ch.Parent then
						_V37c6f7ec80(ch)
					end
				end)
			end
		end)
		for _, ch in ipairs(folder:GetChildren()) do
			if ch.Name == _Vzd({195,226,237,237,212,239,240,248,227,226,237,237}) then
				task.spawn(function() _V37c6f7ec80(ch) end)
			end
		end
	end
	task.spawn(function()
		while S._snowFarmOn do
			local me = hrp()
			if me and not S.trainDriving and (me.Position - Vector3.new(-389, 228, 550)).Magnitude > 80 then
				_Vf1cc150b5()
			end
			folder = _Vfe97f98cb5()
			if folder then
				for _, ch in ipairs(folder:GetChildren()) do
					if ch.Name == _Vzd({195,226,237,237,212,239,240,248,227,226,237,237}) then
						local sound = _V9e3e7dde18d(ch)
						if sound and not _V68b213677(sound) then
							_Vc4b0edd16(sound)
						end
					end
				end
			end
			task.wait(0.2)
		end
	end)
	task.spawn(function()
		if FTAP.BuyToy then pcall(function() FTAP.BuyToy:InvokeServer(_Vzd({195,226,237,237,212,239,240,248,227,226,237,237})) end) end
		_Vd52163ec201(4)
		while S._snowFarmOn do
			local have = _Ved9a9dcf61(_Vzd({195,226,237,237,212,239,240,248,227,226,237,237}))
			local grown = _V336614dd60()
			if grown >= want then
				_Vb91561a01b3(true)
				_V1a6aea64149(false)
				_V4f4386351a5()
				if not S.toggles.invisLine then
					_V026212e1150()
					task.delay(0.25, _V026212e1150)
				end
				_V556c1dc412c(HUB_NAME, _Vzd({200,243,240,248,239,161}) .. grown .. _Vzd({161,253,161,241,234,239,244,161,240,231,231,161,99,1,21,161,233,240,237,229,161,231,243,230,230,237,250}), 2.5)
				break
			end
			if have < want then
				local sx = ((have % 5) - 2) * 3.5 + math.random(-1, 1)
				local sz = (math.floor(have / 5) % 3 - 1) * 4
				local spawnCF = S._snowSpawnCF * CFrame.new(sx, 2.2, sz)
				_V7825dc6f199(_Vzd({195,226,237,237,212,239,240,248,227,226,237,237}), {
					cf = spawnCF,
					rot = Vector3.new(0, 97.69, 0),
					skipBuy = true,
					silent = true,
					gap = 0.28,
				})
			end
			folder = _Vfe97f98cb5()
			if folder and not S._snowFarmConn then
				S._snowFarmConn = folder.ChildAdded:Connect(function(ch)
					if ch.Name == _Vzd({195,226,237,237,212,239,240,248,227,226,237,237}) and S._snowFarmOn then
						task.spawn(function() _V37c6f7ec80(ch) end)
					end
				end)
			end
			task.wait(0.12)
		end
	end)
end
function _Vcf9e116a91(targetPlayer)
	local r = targetPlayer and _Vb2220e5a155(targetPlayer)
	if not r then
		_V556c1dc412c(HUB_NAME, _Vzd({212,230,237,230,228,245,161,226,161,245,226,243,232,230,245}), 1.5)
		return 0
	end
	local power = S.ballFlingPower or 5000
	local n = 0
	for sound, _ in pairs(S._snowGrown) do
		if sound and sound.Parent and sound:IsDescendantOf(workspace) then
			local model = sound.Parent
			task.spawn(function()
				_Vc4b0edd16(sound)
				local bp = sound:FindFirstChild(_Vzd({199,226,243,238,212,239,240,248,227,226,237,237}))
				if bp then pcall(function() bp:Destroy() end) end
				local dir = (r.Position - sound.Position)
				if dir.Magnitude < 0.2 then dir = Vector3.new(0, 0, -1) else dir = dir.Unit end
				for _ = 1, 12 do
					sno(sound, r.Position)
					pcall(function()
						sound.CanCollide = true
						sound.AssemblyLinearVelocity = dir * power + Vector3.new(0, power * 0.08, 0)
						local bv = sound:FindFirstChild(_Vzd({215,208,202,197,219,224,212,239,240,248,199,237,234,239,232}))
						if not bv then
							bv = Instance.new(_Vzd({195,240,229,250,215,230,237,240,228,234,245,250}))
							bv.Name = _Vzd({215,208,202,197,219,224,212,239,240,248,199,237,234,239,232})
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
	_V556c1dc412c(HUB_NAME, _Vzd({107,145,154,147,140,69}) .. n .. _Vzd({161,244,239,240,248,227,226,237,237,244,161,226,245,161}) .. (targetPlayer and targetPlayer.Name or "?"), 1.8)
	return n
end
do local _z168=(5*6); if _z168<0 and _Vj() then _z168=_z168+1 end end
function _Vf6adfe267e()
	if not FTAP.BombExplode then _V6c6a3f4314a() end
	local n = 0
	local me = hrp()
	local pos = me and me.Position or Vector3.zero
	for sound, _ in pairs(S._snowGrown) do
		if sound and sound.Parent and sound:IsDescendantOf(workspace) then
			local model = sound:FindFirstAncestorOfClass(_Vzd({206,240,229,230,237})) or sound.Parent
			_Vc4b0edd16(sound)
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
	_V556c1dc412c(HUB_NAME, _Vzd({198,249,241,237,240,229,230,229,161}) .. n .. _Vzd({161,244,239,240,248,227,226,237,237,244}), 1.5)
	return n
end
do local _z6910=(11*5);if _z6910<0 and _Vj() then _z6910=_z6910+1 end local _y6910=_Vzd({41,87}) end

function _V162db74910c()
	local p = S.selected
	if not p or not _Vd6eb72811f9(p) or not p.Character then
		_V556c1dc412c(HUB_NAME, _Vzd({212,230,237,230,228,245,161,226,161,245,226,243,232,230,245}), 1.5)
		return
	end
	local want = math.clamp(tonumber(S.ballCount) or 10, 1, 50)
	S.ballCount = want
	_Vb91561a01b3(true)
	S._snowGrown = {}
	_V0df041601a4()
	task.spawn(function()
		local t0 = os.clock()
		while S._snowFarmOn and (os.clock() - t0) < 120 do
			task.wait(0.5)
		end
		_Vb91561a01b3(true)
		if _V336614dd60() == 0 then
			local folder = _Vfe97f98cb5()
			if folder then
				for _, ch in ipairs(folder:GetChildren()) do
					if ch.Name == _Vzd({195,226,237,237,212,239,240,248,227,226,237,237}) then
						local s = _V9e3e7dde18d(ch)
						if s then S._snowGrown[s] = true end
					end
				end
			end
		end
		_Vcf9e116a91(p)
	end)
end
S.toyPassMode = S.toyPassMode or _Vzd({226,246,245,240})
S.formSizeScale = S.formSizeScale or 1.2
S.formGap = S.formGap or 0.09
S.formWearPieces = S.formWearPieces or {}
S.formWearConn = S.formWearConn or nil
S.formWearId = S.formWearId or nil
S.formBuilding = S.formBuilding or false
function _V649eaee6bb()
	if S.toyPassMode == _Vzd({241,226,244,244}) then return 200 end
	if S.toyPassMode == _Vzd({231,243,230,230}) then return 100 end
	local cap = LP:FindFirstChild(_Vzd({213,240,250,244,205,234,238,234,245,196,226,241}))
	if not cap then
		for _, d in ipairs(LP:GetDescendants()) do
			if d.Name == _Vzd({213,240,250,244,205,234,238,234,245,196,226,241}) and (d:IsA(_Vzd({202,239,245,215,226,237,246,230})) or d:IsA(_Vzd({207,246,238,227,230,243,215,226,237,246,230}))) then
				cap = d
				break
			end
		end
	end
	if cap and (cap:IsA(_Vzd({110,147,153,123,134,145,154,138})) or cap:IsA(_Vzd({207,246,238,227,230,243,215,226,237,246,230}))) then
		local v = tonumber(cap.Value) or 100
		if v >= 180 then return 200 end
		return 100
	end
	return 100
end
function _V24638f9e1e2()
	return math.max(0, _V649eaee6bb() - _Ved9a9dcf61())
end
function _V2894e0f044(offs, maxN)
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
function _Vcd5ce12ea5(inst)
	if not inst then return nil end
	if inst:IsA(_Vzd({195,226,244,230,209,226,243,245})) then return inst end
	if inst:IsA(_Vzd({114,148,137,138,145})) then
		return inst.PrimaryPart or inst:FindFirstChildWhichIsA(_Vzd({195,226,244,230,209,226,243,245}), true)
	end
	return inst:FindFirstChildWhichIsA(_Vzd({195,226,244,230,209,226,243,245}), true)
end
function _Vaa513f53a4()
	return workspace:FindFirstChild(LP.Name .. _Vzd({212,241,226,248,239,230,229,202,239,213,240,250,244}))
end
function _V60fd70b84d(doDestroy)
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
			for _, nm in ipairs({ _Vzd({123,116,110,105,127,132,107,148,151,146,103,117}), _Vzd({215,208,202,197,219,224,199,240,243,238,195,200}) }) do
				local m = part:FindFirstChild(nm)
				if m then pcall(function() m:Destroy() end) end
			end
		end
		if doDestroy and pe.model and FTAP.DestroyToy then
			pcall(function() FTAP.DestroyToy:FireServer(pe.model) end)
		end
	end
end
function _Ve78b0cd674(part)
	if not part or not part.Parent then return nil, nil end
	local bp = part:FindFirstChild(_Vzd({215,208,202,197,219,224,199,240,243,238,195,209}))
	if not bp then
		bp = Instance.new(_Vzd({195,240,229,250,209,240,244,234,245,234,240,239}))
		bp.Name = _Vzd({215,208,202,197,219,224,199,240,243,238,195,209})
		bp.MaxForce = Vector3.new(1e9, 1e9, 1e9)
		bp.P = 120000
		bp.D = 2500
		bp.Parent = part
	end
	local bg = part:FindFirstChild(_Vzd({215,208,202,197,219,224,199,240,243,238,195,200}))
	if not bg then
		bg = Instance.new(_Vzd({195,240,229,250,200,250,243,240}))
		bg.Name = _Vzd({215,208,202,197,219,224,199,240,243,238,195,200})
		bg.MaxTorque = Vector3.new(1e9, 1e9, 1e9)
		bg.P = 120000
		bg.D = 2500
		bg.CFrame = part.CFrame
		bg.Parent = part
	end
	return bp, bg
end
function _V2db196f719f()
	if S.formWearConn then return end
	S.formWearConn = RunService.Heartbeat:Connect(function()
		local pieces = S.formWearPieces
		if not pieces or #pieces == 0 then return end
		local me = hrp()
		local char = LP.Character
		local head = char and char:FindFirstChild(_Vzd({201,230,226,229}))
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
				if pe.anchor == _Vzd({233,230,226,229}) and head then
					anchor = head
				end
				local ox, oy, oz = pe.ox, pe.oy, pe.oz
				local yaw = pe.yaw or 0
				local pitchA, rollA = pe.pitch or 0, pe.roll or 0
				local anim = pe.anim
				if anim == _Vzd({231,237,226,241}) then
					local side = pe.side or 1
					local row = pe.row or 1
					local wave = math.sin(t * 7 + (pe.phase or 0))
					oy = oy + wave * (0.25 + row * 0.18)
					rollA = rollA + side * (wave * 28 + 8)
					oz = oz + math.abs(wave) * 0.08
				elseif anim == _Vzd({227,240,227}) then
					oy = oy + math.sin(t * 2.8) * 0.22
				elseif anim == _Vzd({244,241,234,239}) then
					yaw = yaw + t * 110 + (pe.phase or 0) * 40
				elseif anim == _Vzd({240,243,227,234,245}) then
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
				local bp, bg = _Ve78b0cd674(part)
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
function _V2e1ff742202(beforeSet, timeout)
	timeout = timeout or 2.5
	local t0 = os.clock()
	local folder = _Vaa513f53a4()
	while os.clock() - t0 < timeout do
		folder = folder or _Vaa513f53a4()
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
function _V0f9d7cad184()
	local set = {}
	local folder = _Vaa513f53a4()
	if folder then
		for _, ch in ipairs(folder:GetChildren()) do
			set[ch] = true
		end
	end
	return set
end
function _Vea9a4498144(model, off, pitch, defAnim, defAnchor)
	local part = _Vcd5ce12ea5(model)
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
		anchor = off.anchor or defAnchor or _Vzd({233,243,241}),
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
	if model and model:IsA(_Vzd({206,240,229,230,237})) then
		for _, d in ipairs(model:GetDescendants()) do
			if d:IsA(_Vzd({195,226,244,230,209,226,243,245})) then
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
	_Ve78b0cd674(part)
	S.formWearPieces[#S.formWearPieces + 1] = pe
	_V2db196f719f()
	return true
end
function _V87564428196(toy, offsets, scaleMul, opts)
	opts = opts or {}
	toy = toy or _Vzd({209,226,237,237,230,245,205,234,232,233,245,195,243,240,248,239})
	if toy == _Vzd({209,226,237,237,230,245}) then toy = _Vzd({209,226,237,237,230,245,205,234,232,233,245,195,243,240,248,239}) end
	local sizeScale = (opts.sizeScale or S.formSizeScale or 1.2) * (scaleMul or 1)
	local pitch = (opts.pitch or WEAR_PITCH) * sizeScale
	if S.formBuilding and not opts.force then
		_V556c1dc412c(HUB_NAME, _Vzd({102,145,151,138,134,137,158,69,135,154,142,145,137,142,147,140,69,134,69,139,148,151,146,83,83,83}), 1.5)
		return false
	end
	local me = hrp()
	if not me then
		_V556c1dc412c(HUB_NAME, _Vzd({207,240,161,228,233,226,243,226,228,245,230,243,161,231,240,243,161,231,240,243,238}), 1)
		return false
	end
	S.formBuilding = true
	S.formCancel = false
	local label = opts.label or _Vzd({199,240,243,238})
	local defAnim = opts.anim
	local defAnchor = opts.anchor or _Vzd({233,243,241})
	if not S.formWearPieces then S.formWearPieces = {} end
	local room = _V24638f9e1e2()
	if room < 2 then
		S.formBuilding = false
		_V556c1dc412c(HUB_NAME, _Vzd({121,148,158,69,145,142,146,142,153,69,139,154,145,145,69,77}) .. _V649eaee6bb() .. _Vzd({170,161,253,161,229,230,237,230,245,230,161,245,240,250,244,161,231,234,243,244,245}), 2.5)
		return false
	end
	local want = #offsets
	offsets = _V2894e0f044(offsets, math.max(2, room - 1))
	if #offsets < want then
		_V556c1dc412c(HUB_NAME, _Vzd({107,148,151,146,69,136,145,142,149,149,138,137,69,153,148,69}) .. #offsets .. _Vzd({161,169,237,234,238,234,245,161}) .. _V649eaee6bb() .. ")", 2)
	end
	if not opts.keep then
		_V60fd70b84d(true)
	end
	S.formWearId = opts.id or label
	_V556c1dc412c(HUB_NAME, label .. _Vzd({161,253,161,248,230,226,243,234,239,232,161}) .. #offsets .. " " .. toy, 2)
	if FTAP.BuyToy then
		pcall(function() FTAP.BuyToy:InvokeServer(toy) end)
		task.wait(0.12)
	end
	_Vd52163ec201(4)
	local n, fail = 0, 0
	for i, off in ipairs(offsets) do
		if S.formCancel then break end
		me = hrp()
		if not me then break end
		local ox = (off.x or off[1] or 0) * pitch
		local oy = (off.y or off[2] or 0) * pitch
		local oz = (off.z or off[3] or 0) * pitch
		local spawnCF = me.CFrame * CFrame.new(ox * 0.35, oy * 0.35 + 2, oz * 0.35 - 1.5)
		local before = _V0f9d7cad184()
		local ok = _V7825dc6f199(toy, {
			cf = spawnCF,
			rot = Vector3.zero,
			skipBuy = true,
			silent = true,
			gap = opts.gap or S.formGap or 0.09,
		})
		if ok then
			local model = _V2e1ff742202(before, 3.5)
			if model and _Vea9a4498144(model, off, pitch, defAnim, defAnchor) then
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
		_V556c1dc412c(HUB_NAME, label .. _Vzd({161,240,239,161,253,161}) .. n .. _Vzd({161,226,245,245,226,228,233,230,229}) .. (fail > 0 and (_Vzd({161,253,161}) .. fail .. _Vzd({69,146,142,152,152})) or ""), 2.5)
	end
	return n > 0
end
function _Vc0deb8779e(steps)
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
			anchor = _Vzd({233,230,226,229}),
			anim = _Vzd({227,240,227}),
		}
	end
	return pts
end
do local _z6289=(10*8);if _z6289<0 and _Vj() then _z6289=_z6289+1 end local _y6289=_Vzd({46,65}) end

function _Vedd04f0da2(points, rings)
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
				anim = _Vzd({244,241,234,239}),
				phase = i * 0.15,
			}
		end
	end
	return pts
end
do local _z529=(6*6); if _z529<0 and _Vj() then _z529=_z529+1 end end
function _V84dca1819b(count, radius)
	count = count or 16
	radius = radius or 1.8
	local pts = {}
	for i = 0, count - 1 do
		local a = (i / count) * math.pi * 2
		pts[#pts + 1] = {
			x = math.cos(a) * radius,
			y = 0.2,
			z = math.sin(a) * radius,
			anim = _Vzd({240,243,227,234,245}),
			phase = a,
			radius = radius,
		}
	end
	return pts
end
function _Ve8aebfa4a7()
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
				anim = _Vzd({231,237,226,241}), side = -1, row = row + 1, phase = phase,
			}
			pts[#pts + 1] = {
				x = spread, y = lift, z = depth,
				anim = _Vzd({231,237,226,241}), side = 1, row = row + 1, phase = phase,
			}
		end
	end
	for i = -1, 2 do
		pts[#pts + 1] = { x = 0, y = i * 0.55, z = 0.45 }
	end
	return pts
end
function _Vb09a053aa3()
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
function _Vb8b621319f()
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
function _Vd969732b9a()
	local pts = {}
	for i = 0, 6 do pts[#pts + 1] = { x = 0, y = i * 0.45 - 1.2, z = -1.0 } end
	for i = 0, 3 do
		pts[#pts + 1] = { x = -i * 0.4, y = 2.0 - i * 0.3, z = -1.0 }
		pts[#pts + 1] = { x = i * 0.4, y = 2.0 - i * 0.3, z = -1.0 }
	end
	return pts
end
function _Vf76bcf009c()
	local pts = {}
	for i = -3, 3 do pts[#pts + 1] = { x = i * 0.55, y = 0.6, z = -1.0 } end
	for i = -3, 3 do pts[#pts + 1] = { x = 0, y = i * 0.55 + 0.6, z = -1.0 } end
	return pts
end
function _Vb723fef29d()
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
do local _z8041=(3*7);if _z8041<0 and _Vj() then _z8041=_z8041+1 end local _y8041=_Vzd({88,87}) end

function _V2e9ca91da1(rings, segs)
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
do local _z8770=(6*7);if _z8770<0 and _Vj() then _z8770=_z8770+1 end local _y8770=_Vzd({75,66}) end

function _V39b23c4ca6()
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
function _V0d10cd1ca0()
	local pts = _V84dca1819b(14, 1.5)
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
	{ id = _Vzd({233,230,226,243,245}), title = _Vzd({201,230,226,243,245}), tip = _Vzd({107,145,148,134,153,152,69,134,135,148,155,138,69,158,148,154,151,69,141,138,134,137,69,80,69,152,148,139,153,69,135,148,135}), offsets = _Vc0deb8779e, scale = 1.0, anchor = _Vzd({233,230,226,229}), anim = _Vzd({227,240,227}) },
	{ id = _Vzd({248,234,239,232,244}), title = _Vzd({216,234,239,232,244}), tip = _Vzd({208,239,161,250,240,246,243,161,227,226,228,236,161,253,161,231,237,226,241,244,161,246,241,176,229,240,248,239}), offsets = _Ve8aebfa4a7, scale = 1.05, anim = _Vzd({231,237,226,241}) },
	{ id = _Vzd({244,246,234,245}), title = _Vzd({212,246,234,245}), tip = _Vzd({209,226,237,237,230,245,161,226,243,238,240,243,161,244,233,230,237,237,161,226,243,240,246,239,229,161,250,240,246,243,161,227,240,229,250}), offsets = _Vb09a053aa3, scale = 0.95 },
	{ id = _Vzd({243,240,227,240,245}), title = _Vzd({211,240,227,240,245}), tip = _Vzd({216,230,226,243,226,227,237,230,161,233,230,226,229,161,253,161,245,240,243,244,240,161,253,161,237,234,238,227,244,161,244,233,230,237,237}), offsets = _Vb8b621319f, scale = 0.9 },
	{ id = _Vzd({244,245,226,243}), title = _Vzd({212,245,226,243}), tip = _Vzd({212,245,226,243,161,240,239,161,250,240,246,243,161,227,226,228,236,161,253,161,244,241,234,239,244}), offsets = _Vedd04f0da2, scale = 1.0, anim = _Vzd({244,241,234,239}) },
	{ id = _Vzd({228,234,243,228,237,230}), title = _Vzd({196,234,243,228,237,230}), tip = _Vzd({208,243,227,234,245,234,239,232,161,243,234,239,232,161,226,243,240,246,239,229,161,250,240,246}), offsets = _V84dca1819b, scale = 1.0, anim = _Vzd({240,243,227,234,245}) },
	{ id = _Vzd({226,243,243,240,248}), title = _Vzd({102,151,151,148,156}), tip = _Vzd({194,243,243,240,248,161,244,233,226,241,230,161,248,240,243,239,161,234,239,161,231,243,240,239,245}), offsets = _Vd969732b9a, scale = 1.0 },
	{ id = _Vzd({228,243,240,244,244}), title = _Vzd({196,243,240,244,244}), tip = _Vzd({209,237,246,244,161,176,161,228,243,240,244,244,161,240,239,161,250,240,246}), offsets = _Vf76bcf009c, scale = 1.0 },
	{ id = _Vzd({228,246,227,230}), title = _Vzd({196,246,227,230}), tip = _Vzd({109,148,145,145,148,156,69,136,154,135,138,69,139,151,134,146,138,69,134,151,148,154,147,137,69,158,148,154}), offsets = _Vb723fef29d, scale = 0.9 },
	{ id = _Vzd({244,241,233,230,243,230}), title = _Vzd({212,241,233,230,243,230}), tip = _Vzd({212,241,233,230,243,230,161,244,233,230,237,237,161,226,243,240,246,239,229,161,250,240,246}), offsets = _V2e9ca91da1, scale = 0.9 },
	{ id = _Vzd({245,243,234,226,239,232,237,230}), title = _Vzd({213,243,234,226,239,232,237,230}), tip = _Vzd({121,151,142,134,147,140,145,138,69,148,154,153,145,142,147,138,69,148,147,69,158,148,154}), offsets = _V39b23c4ca6, scale = 1.0 },
	{ id = _Vzd({244,238,234,237,230,250}), title = _Vzd({212,238,234,237,230,250}), tip = _Vzd({107,134,136,138,69,156,148,151,147,69,142,147,69,139,151,148,147,153}), offsets = _V0d10cd1ca0, scale = 1.0 },
}
do local _z238=(8*5); if _z238<0 and _Vj() then _z238=_z238+1 end end
function _V33054fe9159(id, toy, extraOpts)
	toy = toy or S.selectedToy or _Vzd({209,226,237,237,230,245,205,234,232,233,245,195,243,240,248,239})
	extraOpts = extraOpts or {}
	for _, def in ipairs(FORM_BUILDS) do
		if def.id == id then
			local offs = def.offsets()
			task.spawn(function()
				_V87564428196(toy, offs, def.scale or 1, {
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
	_V556c1dc412c(HUB_NAME, _Vzd({122,147,144,147,148,156,147,69,139,148,151,146,95,69}) .. tostring(id), 2)
	return false
end
do local _z4735=(10*3);if _z4735<0 and _Vj() then _z4735=_z4735+1 end local _y4735=_Vzd({46,40}) end

function _V7d0b566f41()
	S.formCancel = true
	toySpawnQueue = {}
	_V556c1dc412c(HUB_NAME, _Vzd({199,240,243,238,161,228,226,239,228,230,237,161,253,161,246,244,230,161,211,230,238,240,247,230,161,199,240,243,238,161,245,240,161,229,230,245,226,228,233}), 1.2)
end
S.sparkShape = S.sparkShape or _Vzd({212,241,233,230,243,230})
S.sparkToyName = S.sparkToyName or _Vzd({199,234,243,230,248,240,243,236})
S.sparkAmount = S.sparkAmount or 16
S.sparkHeight = S.sparkHeight or 3
S.sparkRadius = S.sparkRadius or 5
S.sparkRot = S.sparkRot or 0
S.sparkLifetime = S.sparkLifetime or 6
S.sparkTargetSelf = S.sparkTargetSelf == true
S.sparkPieces = S.sparkPieces or {}
S._sparkAuraOn = false
S._sparkAuraConn = nil
S._sparkBurstTok = 0
do local _z5617=(3*13);if _z5617<0 and _Vj() then _z5617=_z5617+1 end local _y5617=_Vzd({61,42}) end

function _V246432083e(shape, count, radius, rotDeg)
	count = math.clamp(math.floor(tonumber(count) or 12), 1, 40)
	radius = math.clamp(tonumber(radius) or 5, 1, 30)
	local rot = math.rad(tonumber(rotDeg) or 0)
	local positions = {}
	shape = tostring(shape or _Vzd({212,241,233,230,243,230}))
	if shape == _Vzd({120,149,141,138,151,138}) then
		local gr = math.pi * (3 - math.sqrt(5))
		for i = 0, count - 1 do
			local y = 1 - (i / math.max(count - 1, 1)) * 2
			local r = math.sqrt(math.max(0, 1 - y * y))
			local th = gr * i + rot
			positions[#positions + 1] = Vector3.new(math.cos(th) * r * radius, y * radius, math.sin(th) * r * radius)
		end
	elseif shape == _Vzd({211,234,239,232}) then
		for i = 1, count do
			local a = (i / count) * math.pi * 2 + rot
			positions[#positions + 1] = Vector3.new(math.cos(a) * radius, 0, math.sin(a) * radius)
		end
	elseif shape == _Vzd({212,241,234,243,226,237}) then
		for i = 1, count do
			local t = i / count
			local a = t * 6 * math.pi + rot
			local r = radius * t
			positions[#positions + 1] = Vector3.new(math.cos(a) * r, (t - 0.5) * radius * 1.2, math.sin(a) * r)
		end
	elseif shape == _Vzd({196,240,239,230}) then
		for i = 1, count do
			local t = i / count
			local a = t * math.pi * 2 * 3 + rot
			local r = radius * t
			positions[#positions + 1] = Vector3.new(math.cos(a) * r, -t * radius * 1.4, math.sin(a) * r)
		end
	elseif shape == _Vzd({196,250,237,234,239,229,230,243}) then
		for i = 1, count do
			local a = (i / count) * math.pi * 2 + rot
			local y = ((i % 5) / 4 - 0.5) * radius * 1.6
			positions[#positions + 1] = Vector3.new(math.cos(a) * radius, y, math.sin(a) * radius)
		end
	elseif shape == _Vzd({199,240,246,239,245,226,234,239}) then
		for i = 1, count do
			local a = (i / count) * math.pi * 2 + rot
			local t = (i % 7) / 6
			local r = radius * (0.25 + t * 0.75)
			positions[#positions + 1] = Vector3.new(math.cos(a) * r * 0.35, t * radius * 1.8, math.sin(a) * r * 0.35)
		end
	elseif shape == _Vzd({201,226,237,240}) then
		for i = 1, count do
			local a = (i / count) * math.pi * 2 + rot
			positions[#positions + 1] = Vector3.new(math.cos(a) * radius, radius * 0.15, math.sin(a) * radius)
		end
	else
		local side = math.max(2, math.ceil(math.sqrt(count)))
		local i = 0
		for z = 0, side - 1 do
			for x = 0, side - 1 do
				i += 1
				if i > count then break end
				positions[#positions + 1] = Vector3.new(
					(x / math.max(side - 1, 1) - 0.5) * radius * 2,
					0,
					(z / math.max(side - 1, 1) - 0.5) * radius * 2
				)
			end
			if i > count then break end
		end
	end
	return positions
end
function _V56e4aed5193()
	if S.sparkTargetSelf then
		return hrp(), LP
	end
	local p = S.sparkTarget
	if p and _Vd6eb72811f9(p) then
		local r = _Vb2220e5a155(p)
		if r then return r, p end
	end
	return hrp(), LP
end
do local _z878=(4*5); if _z878<0 and _Vj() then _z878=_z878+1 end end
do local _z4552=(4*4);if _z4552<0 and _Vj() then _z4552=_z4552+1 end local _y4552=_Vzd({84,58}) end

function _Vdf19f31b192(destroy)
	if S._sparkAuraConn then
		pcall(function() S._sparkAuraConn:Disconnect() end)
		S._sparkAuraConn = nil
	end
	S._sparkAuraOn = false
	S.toggles.sparklerLoop = false
	S.toggles.sparkAura = false
	local list = S.sparkPieces or {}
	S.sparkPieces = {}
	for _, pe in ipairs(list) do
		local part, model = pe.part, pe.model
		if part and part.Parent then
			for _, nm in ipairs({ _Vzd({215,208,202,197,219,224,212,241,226,243,236,195,209}), _Vzd({215,208,202,197,219,224,212,241,226,243,236,195,200}) }) do
				local m = part:FindFirstChild(nm)
				if m then pcall(function() m:Destroy() end) end
			end
		end
		if destroy and model and model.Parent and FTAP.DestroyToy then
			pcall(function() FTAP.DestroyToy:FireServer(model) end)
		elseif model and model.Parent then
			pcall(function() Debris:AddItem(model, 0.5) end)
		end
	end
end
function _V5aa4d92b194(model, offset)
	if not model then return nil end
	local part = _Vcd5ce12ea5(model)
	if not part then return nil end
	pcall(function()
		part.CanCollide = false
		part.Massless = true
		part.Anchored = false
	end)
	if model:IsA(_Vzd({206,240,229,230,237})) then
		for _, d in ipairs(model:GetDescendants()) do
			if d:IsA(_Vzd({195,226,244,230,209,226,243,245})) then
				pcall(function()
					d.CanCollide = false
					d.Massless = true
				end)
			end
		end
	end
	local bp = part:FindFirstChild(_Vzd({123,116,110,105,127,132,120,149,134,151,144,103,117}))
	if not bp then
		bp = Instance.new(_Vzd({195,240,229,250,209,240,244,234,245,234,240,239}))
		bp.Name = _Vzd({215,208,202,197,219,224,212,241,226,243,236,195,209})
		bp.MaxForce = Vector3.new(1e6, 1e6, 1e6)
		bp.P = 40000
		bp.D = 1200
		bp.Parent = part
	end
	local bg = part:FindFirstChild(_Vzd({215,208,202,197,219,224,212,241,226,243,236,195,200}))
	if not bg then
		bg = Instance.new(_Vzd({195,240,229,250,200,250,243,240}))
		bg.Name = _Vzd({215,208,202,197,219,224,212,241,226,243,236,195,200})
		bg.MaxTorque = Vector3.new(1e6, 1e6, 1e6)
		bg.P = 20000
		bg.D = 800
		bg.Parent = part
	end
	sno(part)
	local pe = {
		model = model,
		part = part,
		ox = offset.X, oy = offset.Y, oz = offset.Z,
		phase = math.random() * math.pi * 2,
		_snoT = 0,
	}
	S.sparkPieces = S.sparkPieces or {}
	S.sparkPieces[#S.sparkPieces + 1] = pe
	return pe
end
function _V49d9c6de195(worldCF, toyName)
	toyName = toyName or S.sparkToyName or _Vzd({199,234,243,230,248,240,243,236})
	if toyName == _Vzd({212,239,240,248,227,226,237,237}) then toyName = _Vzd({195,226,237,237,212,239,240,248,227,226,237,237}) end
	_V6c6a3f4314a()
	local before = _V0f9d7cad184 and _V0f9d7cad184() or {}
	local ok = false
	pcall(function()
		if FTAP.BuyToy then FTAP.BuyToy:InvokeServer(toyName) end
	end)
	if _V7825dc6f199 then
		ok = _V7825dc6f199(toyName, {
			cf = worldCF,
			rot = Vector3.zero,
			skipBuy = true,
			silent = true,
			gap = 0.08,
		}) == true
	else
		pcall(function()
			if FTAP.SpawnToy then
				FTAP.SpawnToy:InvokeServer(toyName, worldCF, Vector3.zero)
				ok = true
			end
		end)
	end
	local model = nil
	if _V2e1ff742202 then
		model = _V2e1ff742202(before, 2.2)
	end
	if not model then
		local folder = _Vaa513f53a4 and _Vaa513f53a4() or workspace:FindFirstChild(LP.Name .. _Vzd({212,241,226,248,239,230,229,202,239,213,240,250,244}))
		if folder then
			local best, bd = nil, 25
			for _, ch in ipairs(folder:GetChildren()) do
				if ch.Name == toyName or ch.Name:find(toyName, 1, true) then
					local pp = _Vcd5ce12ea5(ch)
					if pp then
						local d = (pp.Position - worldCF.Position).Magnitude
						if d < bd then best, bd = ch, d end
					end
				end
			end
			model = best
		end
	end
	return model, ok
end
do local _z4906=(3*3);if _z4906<0 and _Vj() then _z4906=_z4906+1 end local _y4906=_Vzd({89,72}) end

function _Vc30549a515b()
	local anchor = select(1, _V56e4aed5193())
	if not anchor then
		_V556c1dc412c(HUB_NAME, _Vzd({115,148,69,152,149,134,151,144,145,138,151,69,153,134,151,140,138,153,69,84,69,136,141,134,151,134,136,153,138,151}), 1.5)
		return
	end
	S._sparkBurstTok = (S._sparkBurstTok or 0) + 1
	local tok = S._sparkBurstTok
	local amount = math.clamp(math.floor(S.sparkAmount or 16), 1, 28)
	local height = S.sparkHeight or 3
	local radius = S.sparkRadius or 5
	local toyName = S.sparkToyName or _Vzd({107,142,151,138,156,148,151,144})
	local life = math.clamp(S.sparkLifetime or 6, 2, 20)
	local positions = _V246432083e(S.sparkShape or _Vzd({212,241,233,230,243,230}), amount, radius, S.sparkRot or 0)
	_V556c1dc412c(HUB_NAME, _Vzd({120,149,134,151,144,145,138,151,69}) .. (S.sparkShape or "?") .. _Vzd({161,249}) .. #positions .. _Vzd({161,253,161}) .. toyName, 1.5)
	task.spawn(function()
		for i, off in ipairs(positions) do
			if tok ~= S._sparkBurstTok then return end
			local a = select(1, _V56e4aed5193())
			if not a then break end
			local world = a.CFrame * CFrame.new(off.X, off.Y + height, off.Z)
			local model = _V49d9c6de195(world, toyName)
			if model then
				local part = _Vcd5ce12ea5(model)
				if part then
					sno(part, a.Position)
					pcall(function()
						part.CanCollide = false
						part.Anchored = true
						part.CFrame = world
					end)
					Debris:AddItem(model, life)
				end
			end
			task.wait(0.1)
		end
	end)
end
function _V357629081a6()
	if S._sparkAuraOn then return end
	_V6c6a3f4314a()
	local anchor = select(1, _V56e4aed5193())
	if not anchor then
		_V556c1dc412c(HUB_NAME, _Vzd({115,148,69,153,134,151,140,138,153,69,139,148,151,69,152,149,134,151,144,69,134,154,151,134}), 1.5)
		return
	end
	_Vdf19f31b192(true)
	S._sparkAuraOn = true
	S.toggles.sparkAura = true
	local amount = math.clamp(math.floor(S.sparkAmount or 16), 4, 24)
	local height = S.sparkHeight or 3
	local radius = S.sparkRadius or 5
	local toyName = S.sparkToyName or _Vzd({107,142,151,138,156,148,151,144})
	local positions = _V246432083e(S.sparkShape or _Vzd({211,234,239,232}), amount, radius, S.sparkRot or 0)
	_V556c1dc412c(HUB_NAME, _Vzd({120,149,134,151,144,69,134,154,151,134,69,116,115,69,161,69}) .. #positions .. " " .. toyName .. _Vzd({69,139,148,145,145,148,156,142,147,140}), 2)
	task.spawn(function()
		for _, off in ipairs(positions) do
			if not S._sparkAuraOn then break end
			local a = select(1, _V56e4aed5193())
			if not a then break end
			local world = a.CFrame * CFrame.new(off.X, off.Y + height, off.Z)
			local model = _V49d9c6de195(world, toyName)
			if model then
				_V5aa4d92b194(model, Vector3.new(off.X, off.Y + height, off.Z))
			end
			task.wait(0.11)
		end
		if not S._sparkAuraOn then return end
		S._sparkAuraConn = RunService.Heartbeat:Connect(function()
			if not S._sparkAuraOn then return end
			local a = select(1, _V56e4aed5193())
			if not a then return end
			local t = os.clock()
			local spin = t * (S.sparkSpin or 1.6)
			local pieces = S.sparkPieces or {}
			for i = #pieces, 1, -1 do
				local pe = pieces[i]
				local part = pe.part
				if not part or not part.Parent then
					table.remove(pieces, i)
				else
					local ox, oy, oz = pe.ox, pe.oy, pe.oz
					local c, s = math.cos(spin + pe.phase), math.sin(spin + pe.phase)
					local rx = ox * c - oz * s
					local rz = ox * s + oz * c
					local bob = math.sin(t * 4 + pe.phase) * 0.35
					local cf = a.CFrame * CFrame.new(rx, oy + bob, rz)
					local bp = part:FindFirstChild(_Vzd({215,208,202,197,219,224,212,241,226,243,236,195,209}))
					local bg = part:FindFirstChild(_Vzd({123,116,110,105,127,132,120,149,134,151,144,103,108}))
					if bp then bp.Position = cf.Position end
					if bg then bg.CFrame = cf end
					pcall(function()
						part.AssemblyLinearVelocity = Vector3.zero
						part.AssemblyAngularVelocity = Vector3.zero
					end)
					if (pe._snoT or 0) < t then
						pe._snoT = t + 0.4
						sno(part, a.Position)
					end
				end
			end
		end)
	end)
end
function _V10469a8d1b5(quiet)
	_Vdf19f31b192(true)
	if not quiet then _V556c1dc412c(HUB_NAME, _Vzd({212,241,226,243,236,161,226,246,243,226,161,208,199,199}), 1.2) end
end
S.missileType = S.missileType or _Vzd({195,240,238,227,206,234,244,244,234,237,230})
S.missileCount = S.missileCount or 3
S.missileTarget = S.missileTarget or nil
local missileState = {
	running = false,
	pending = {},
	conn = nil,
}
function _V629e139434(model)
	if not model then return nil end
	local n = model.Name
	if n == _Vzd({103,148,146,135,114,142,152,152,142,145,138}) or n == _Vzd({199,234,243,230,248,240,243,236,206,234,244,244,234,237,230}) then
		return model:FindFirstChild(_Vzd({195,240,229,250})) or model:FindFirstChild(_Vzd({209,226,243,245,201,234,245,197,230,245,230,228,245,240,243})) or model:FindFirstChildWhichIsA(_Vzd({195,226,244,230,209,226,243,245}), true)
	end
	if n == _Vzd({195,240,238,227,195,226,237,237,240,240,239}) then
		return model:FindFirstChild(_Vzd({195,226,237,237,240,240,239})) or model:FindFirstChild(_Vzd({209,226,243,245,201,234,245,197,230,245,230,228,245,240,243}))
	end
	if n == _Vzd({195,240,238,227,197,226,243,236,206,226,245,245,230,243}) then
		return model:FindFirstChild(_Vzd({209,250,243,226,238,234,229})) or model:FindFirstChild(_Vzd({209,226,243,245,201,234,245,197,230,245,230,228,245,240,243}))
	end
	if n == _Vzd({209,243,230,244,230,239,245,195,234,232}) or n == _Vzd({209,243,230,244,230,239,245,212,238,226,237,237}) then
		return model:FindFirstChild(_Vzd({195,240,249})) or model:FindFirstChild(_Vzd({117,134,151,153,109,142,153,105,138,153,138,136,153,148,151}))
	end
	return model:FindFirstChild(_Vzd({209,226,243,245,201,234,245,197,230,245,230,228,245,240,243}))
		or model:FindFirstChild(_Vzd({195,240,229,250}))
		or model.PrimaryPart
		or model:FindFirstChildWhichIsA(_Vzd({103,134,152,138,117,134,151,153}), true)
end
do local _z4452=(2*3);if _z4452<0 and _Vj() then _z4452=_z4452+1 end local _y4452=_Vzd({58,75}) end

function _V077b794a130(part)
	if not part then return end
	sno(part)
end
function _Vd41a0bea7d(model, worldPos)
	if not model or not model.Parent then return false end
	if not FTAP.BombExplode then _V6c6a3f4314a() end
	local body = _V629e139434(model)
	local hitbox = model:FindFirstChild(_Vzd({209,226,243,245,201,234,245,197,230,245,230,228,245,240,243})) or body
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
function _V9445c832132(model)
	local body = _V629e139434(model)
	if not body then return end
	_V077b794a130(body)
	local me = hrp()
	local far = (me and me.Position or Vector3.zero) + Vector3.new(0, 8000, 0)
	pcall(function()
		body.Anchored = true
		body.CFrame = CFrame.new(far + Vector3.new(math.random(-40, 40), 0, math.random(-40, 40)))
	end)
end
function _Vc84a2cd41b1(quiet)
	missileState.running = false
	S.toggles.missileStrike = false
	if missileState.conn then
		pcall(function() missileState.conn:Disconnect() end)
		missileState.conn = nil
	end
	missileState.pending = {}
	if not quiet then _V556c1dc412c(HUB_NAME, _Vzd({114,142,152,152,142,145,138,69,152,153,151,142,144,138,69,116,107,107}), 1.2) end
end
function _V1e64177e1a3()
	if missileState.running then return end
	missileState.running = true
	S.toggles.missileStrike = true
	missileState.pending = {}
	_V6c6a3f4314a()
	if not FTAP.SpawnToy then
		_Vc84a2cd41b1(true)
		_V556c1dc412c(HUB_NAME, _Vzd({207,240,161,212,241,226,248,239,213,240,250,161,243,230,238,240,245,230}), 2)
		return
	end
	if not FTAP.BuyToy then
		_Vc84a2cd41b1(true)
		_V556c1dc412c(HUB_NAME, _Vzd({207,240,161,195,246,250,213,240,250,161,243,230,238,240,245,230}), 2)
		return
	end
	if not FTAP.BombExplode then
		_V556c1dc412c(HUB_NAME, _Vzd({207,240,161,195,240,238,227,198,249,241,237,240,229,230,161,253,161,238,234,244,244,234,237,230,244,161,248,234,237,237,161,244,241,226,248,239,161,227,246,245,161,239,240,245,161,229,230,245,240,239,226,245,230}), 2.5)
	end
	local folder = workspace:FindFirstChild(LP.Name .. _Vzd({212,241,226,248,239,230,229,202,239,213,240,250,244}))
	if not folder then
		folder = workspace:WaitForChild(LP.Name .. _Vzd({212,241,226,248,239,230,229,202,239,213,240,250,244}), 5)
	end
	if folder then
		missileState.conn = folder.ChildAdded:Connect(function(child)
			if not missileState.running then return end
			if child.Name ~= (S.missileType or _Vzd({195,240,238,227,206,234,244,244,234,237,230})) then return end
			task.spawn(function()
				task.wait(0.08)
				if not child.Parent or not missileState.running then return end
				_V9445c832132(child)
				missileState.pending[#missileState.pending + 1] = child
			end)
		end)
	end
	_V556c1dc412c(HUB_NAME, _Vzd({206,234,244,244,234,237,230,161,244,245,243,234,236,230,161,208,207,161,253,161,241,234,228,236,161,226,161,241,237,226,250,230,243}), 1.5)
	task.spawn(function()
		while missileState.running do
			for i = #missileState.pending, 1, -1 do
				local m = missileState.pending[i]
				if not m or not m.Parent then
					table.remove(missileState.pending, i)
				end
			end
			local need = math.clamp(tonumber(S.missileCount) or 3, 1, 12)
			local limit = _V649eaee6bb()
			need = math.min(need, math.max(1, limit - 5))
			local p = S.missileTarget or S.selected or S.controlPick
			if type(p) == _Vzd({244,245,243,234,239,232}) then p = _Vcaca3e2289(p) end
			local r = p and _Vd6eb72811f9(p) and _Vb2220e5a155(p)
			if #missileState.pending < need and _V24638f9e1e2() > 0 then
				local me = hrp()
				if me then
					local typ = S.missileType or _Vzd({195,240,238,227,206,234,244,244,234,237,230})
					if FTAP.BuyToy then pcall(function() FTAP.BuyToy:InvokeServer(typ) end) end
					_V7825dc6f199(typ, {
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
						local body = _V629e139434(m)
						if body then _V077b794a130(body) end
						_Vd41a0bea7d(m, pos)
					end)
				end
				_V556c1dc412c(HUB_NAME, _Vzd({195,240,240,238,161,249}) .. #batch .. _Vzd({69,82,99,69,101}) .. (p and p.Name or "?"), 1.2)
				task.wait(0.05)
			end
			task.wait(0.03)
		end
	end)
end
function _V9af28be6174(on)
	if on then _V1e64177e1a3() else _Vc84a2cd41b1() end
end
function _Vde108e228e()
	task.spawn(function()
		_V6c6a3f4314a()
		if not FTAP.SpawnToy then
			_V556c1dc412c(HUB_NAME, _Vzd({115,148,69,120,149,134,156,147,121,148,158,69,151,138,146,148,153,138}), 2)
			return
		end
		if not FTAP.BuyToy then
			_V556c1dc412c(HUB_NAME, _Vzd({207,240,161,195,246,250,213,240,250,161,243,230,238,240,245,230}), 2)
			return
		end
		local p = S.missileTarget or S.selected or S.controlPick
		if type(p) == _Vzd({244,245,243,234,239,232}) then p = _Vcaca3e2289(p) end
		if not p or not _Vd6eb72811f9(p) then
			_V556c1dc412c(HUB_NAME, _Vzd({209,234,228,236,161,226,161,238,234,244,244,234,237,230,161,245,226,243,232,230,245}), 1.5)
			return
		end
		local r = _Vb2220e5a155(p)
		if not r then
			_V556c1dc412c(HUB_NAME, _Vzd({207,240,161,196,233,226,243,226,228,245,230,243,161,195,234,245,228,233}), 1)
			return
		end
		local n = math.clamp(tonumber(S.missileCount) or 3, 1, 12)
		n = math.min(n, math.max(1, _V24638f9e1e2()))
		if n < 1 then
			_V556c1dc412c(HUB_NAME, _Vzd({213,240,250,161,237,234,238,234,245,161,231,246,237,237}), 1.5)
			return
		end
		if not FTAP.BombExplode then
			_V556c1dc412c(HUB_NAME, _Vzd({115,148,69,103,148,146,135,106,157,149,145,148,137,138,69,151,138,146,148,153,138,69,161,69,152,149,134,156,147,142,147,140,69,134,147,158,156,134,158}), 2)
		end
		local typ = S.missileType or _Vzd({195,240,238,227,206,234,244,244,234,237,230})
		pcall(function() FTAP.BuyToy:InvokeServer(typ) end)
		local spawned = {}
		for i = 1, n do
			local me = hrp()
			if not me then break end
			local before = _V0f9d7cad184()
			_V7825dc6f199(typ, {
				cf = me.CFrame * CFrame.new(0, 8 + i * 0.4, -5),
				skipBuy = true,
				silent = true,
				gap = 0.08,
			})
			local model = _V2e1ff742202(before, 2.5)
			if model then
				_V9445c832132(model)
				spawned[#spawned + 1] = model
			end
		end
		if #spawned < 1 then
			_V556c1dc412c(HUB_NAME, _Vzd({207,240,161,227,240,238,227,244,161,244,241,226,248,239,230,229}), 2)
			return
		end
		task.wait(0.15)
		local pos = r.Position
		local detonated = 0
		for _, m in ipairs(spawned) do
			task.spawn(function()
				local body = _V629e139434(m)
				if body then _V077b794a130(body) end
				local ok = _Vd41a0bea7d(m, pos)
				if ok then detonated += 1 end
			end)
		end
		task.wait(0.2)
		_V556c1dc412c(HUB_NAME, _Vzd({105,138,153,148,147,134,153,138,137,69}) .. detonated .. "/" .. #spawned .. _Vzd({161,174,191,161,193}) .. p.Name, 1.5)
	end)
end
local SUSPICIOUS_NAMES = {
	_Vzd({247,240,234,229,251}), _Vzd({231,230,183}), _Vzd({243,226,250,231,234,230,237,229}), _Vzd({148,151,142,148,147}), _Vzd({229,230,249}), _Vzd({234,239,231,234,239,234,245,230,250,234,230,237,229}), _Vzd({234,250,224}), _Vzd({229,226,243,236,229,230,249}),
	_Vzd({231,237,234,239,232,226,246,243,226}), _Vzd({244,236,250,247,230,237,240,228,234,245,250}), _Vzd({135,151,142,147,140,135,148,137,158}), _Vzd({236,230,245,233,233,240,240,236}), _Vzd({233,250,229,243,240,249,234,229,230}), _Vzd({244,234,238,241,237,230,161,244,241,250}),
	_Vzd({244,234,238,241,237,230,244,241,250}), _Vzd({243,230,238,240,245,230,161,244,241,250}), _Vzd({243,230,238,240,245,230,244,241,250}), _Vzd({248,234,239,229,246,234}), _Vzd({237,234,239,240,243,234,226}), _Vzd({244,234,243,234,246,244}), _Vzd({227,237,240,240,229,250}),
	_Vzd({227,237,234,245,251}), _Vzd({230,239,229,240,243,234,244}), _Vzd({241,240,240,241,233,246,227}), _Vzd({239,226,238,230,237,230,244,244}), _Vzd({244,228,243,234,241,245,174,248,226,243,230}), _Vzd({244,250,239,226,241,244,230}), _Vzd({229,243,226,248,234,239,232}),
	_Vzd({230,244,241}), _Vzd({228,233,226,238,244}), _Vzd({226,234,238,227,240,245}), _Vzd({152,142,145,138,147,153,134,142,146}), _Vzd({231,243,230,230,228,226,238}), _Vzd({239,240,228,237,234,241}), _Vzd({231,237,250,227,247}), _Vzd({227,240,229,250,247,230,237,240,228,234,245,250}),
}
function _Ve10d4cdc15c(p)
	local hits = {}
	local function mark(reason)
		hits[#hits + 1] = reason
	end
	local function checkName(str, where)
		if not str then return end
		local low = tostring(str):lower()
		for _, s in ipairs(SUSPICIOUS_NAMES) do
			if low:find(s, 1, true) then
				mark(where .. _Vzd({187,161}) .. str)
				return
			end
		end
	end
	pcall(function()
		checkName(p.Name, _Vzd({239,226,238,230}))
		checkName(p.DisplayName, _Vzd({137,142,152,149,145,134,158}))
		local c = p.Character
		if c then
			for _, d in ipairs(c:GetDescendants()) do
				checkName(d.Name, _Vzd({228,233,226,243}))
				if d:IsA(_Vzd({201,234,232,233,237,234,232,233,245})) then mark(_Vzd({201,234,232,233,237,234,232,233,245,161,198,212,209,161,240,239,161,228,233,226,243,226,228,245,230,243})) end
				if d:IsA(_Vzd({195,240,229,250,215,230,237,240,228,234,245,250})) or d:IsA(_Vzd({195,240,229,250,209,240,244,234,245,234,240,239})) or d:IsA(_Vzd({195,240,229,250,194,239,232,246,237,226,243,215,230,237,240,228,234,245,250})) then
					mark(_Vzd({149,141,158,152,142,136,152,69,146,148,155,138,151,95,69}) .. d.ClassName .. " " .. d.Name)
				end
				if d:IsA(_Vzd({195,234,237,237,227,240,226,243,229,200,246,234})) and d.AlwaysOnTop then
					mark(_Vzd({194,237,248,226,250,244,208,239,213,240,241,161,227,234,237,237,227,240,226,243,229,161,169,239,226,238,230,161,198,212,209,192,170}))
				end
			end
			local h = c:FindFirstChildOfClass(_Vzd({109,154,146,134,147,148,142,137}))
			if h and h.WalkSpeed > 30 then mark(_Vzd({216,226,237,236,212,241,230,230,229,161}) .. tostring(h.WalkSpeed)) end
			if h and h.JumpPower > 80 then mark(_Vzd({203,246,238,241,209,240,248,230,243,161}) .. tostring(h.JumpPower)) end
		end
		local bp = p:FindFirstChild(_Vzd({195,226,228,236,241,226,228,236}))
		if bp then
			for _, t in ipairs(bp:GetChildren()) do
				checkName(t.Name, _Vzd({227,226,228,236,241,226,228,236}))
			end
		end
		local pg = p:FindFirstChild(_Vzd({209,237,226,250,230,243,200,246,234}))
		if pg then
			for _, g in ipairs(pg:GetChildren()) do
				checkName(g.Name, _Vzd({209,237,226,250,230,243,200,246,234}))
			end
		end
		for _, n in ipairs({ _Vzd({199,226,243,245,233,230,243,211,230,226,228,233}), _Vzd({197,230,231,226,246,237,245,211,230,226,228,233}), _Vzd({196,246,243,243,230,239,245,211,230,226,228,233}) }) do
			if p:FindFirstChild(n) then mark(_Vzd({243,230,226,228,233,161,247,226,237,246,230,187,161}) .. n) end
		end
	end)
	return hits
end
function _Vb262b47755(line, col)
	if S.consPrint then
		S.consPrint(line, col)
	else
		print(_Vzd({220,215,208,202,197,219,222}), line)
	end
end
do local _z210=(3*6); if _z210<0 and _Vj() then _z210=_z210+1 end end
function _Vdc3119ab158(raw)
	raw = tostring(raw or ""):gsub(_Vzd({223,166,244,172}), ""):gsub(_Vzd({166,244,172,165}), "")
	if raw == "" then return end
	_Vb262b47755(_Vzd({191,161}) .. raw, C.accent2)
	local args = {}
	for w in raw:gmatch(_Vzd({166,212,172})) do args[#args + 1] = w end
	local cmd = (args[1] or ""):lower()
	local rest = table.concat(args, " ", 2)
	if cmd == _Vzd({233,230,237,241}) or cmd == "?" then
		_Vb262b47755(_Vzd({141,138,145,149,69,161,69,136,145,138,134,151,69,161,69,152,136,134,147,69,128,147,134,146,138,130,69,161,69,139,145,142,147,140,69,97,147,134,146,138,99,69,161,69,144,142,136,144,69,97,147,134,146,138,99,69,161,69,144,142,145,145,69,97,147,134,146,138,99}), C.muted)
		_Vb262b47755(_Vzd({227,243,234,239,232,161,189,239,226,238,230,191,161,253,161,244,241,226,248,239,161,189,245,240,250,191,161,253,161,241,226,237,237,230,245,161,253,161,243,230,226,228,233,161,220,239,222,161,253,161,244,239,240,161,189,239,226,238,230,191,161,253,161,241,237,226,250,230,243,244}), C.muted)
		_Vb262b47755(_Vzd({138,157,138,136,69,97,145,154,134,83,83,83,99,69,77,145,148,134,137,152,153,151,142,147,140,69,145,148,136,134,145,69,148,147,145,158,78}), C.muted)
		_Vb262b47755(_Vzd({207,208,213,198,187,161,228,226,239,239,240,245,161,243,230,226,229,161,240,245,233,230,243,161,228,237,234,230,239,245,244,168,161,241,243,234,247,226,245,230,161,230,249,230,228,246,245,240,243,161,244,228,243,234,241,245,244,175}), C.warn)
	elseif cmd == _Vzd({228,237,230,226,243}) then
		if S.consoleOut then
			for _, ch in ipairs(S.consoleOut:GetChildren()) do
				if ch:IsA(_Vzd({213,230,249,245,205,226,227,230,237})) then ch:Destroy() end
			end
		end
		_Vb262b47755(_Vzd({228,237,230,226,243,230,229}), C.muted)
	elseif cmd == _Vzd({241,237,226,250,230,243,244}) then
		for _, p in ipairs(Players:GetPlayers()) do
			if p ~= LP then _Vb262b47755(_V466aec8e137(p), C.text) end
		end
	elseif cmd == _Vzd({244,228,226,239}) then
		local targetName = rest
		local list = {}
		if targetName ~= "" then
			local p = _Vcaca3e2289(targetName)
			if p then list = { p } else _Vb262b47755(_Vzd({147,148,69,149,145,134,158,138,151,95,69}) .. targetName, C.danger); return end
		else
			for _, p in ipairs(Players:GetPlayers()) do
				if p ~= LP then list[#list + 1] = p end
			end
		end
		local suspects = {}
		for _, p in ipairs(list) do
			local hits = _Ve10d4cdc15c(p)
			if #hits > 0 then
				suspects[#suspects + 1] = _V466aec8e137(p)
			end
		end
		if #suspects == 0 then
			_Vb262b47755(_Vzd({239,240,239,230,161,231,237,226,232,232,230,229}), C.muted)
		else
			_Vb262b47755(_Vzd({241,240,244,244,234,227,237,230,161,230,249,241,237,240,234,245,244,161,169}) .. #suspects .. _Vzd({170,187}), C.warn)
			for _, name in ipairs(suspects) do
				_Vb262b47755(name, C.text)
			end
		end
		_V556c1dc412c(HUB_NAME, #suspects > 0 and (#suspects .. _Vzd({69,139,145,134,140,140,138,137})) or _Vzd({207,240,239,230,161,231,237,226,232,232,230,229}), 1.2)
	elseif cmd == _Vzd({139,145,142,147,140}) then
		local p = _Vcaca3e2289(rest)
		if p then task.spawn(_Vcc8279d692, p, S.flingPower, false, true) else _Vb262b47755(_Vzd({154,152,134,140,138,95,69,139,145,142,147,140,69,97,147,134,146,138,99}), C.danger) end
	elseif cmd == _Vzd({236,234,228,236}) then
		local p = _Vcaca3e2289(rest)
		if p then task.spawn(_V971ad737104, p, S.kickType, false) else _Vb262b47755(_Vzd({154,152,134,140,138,95,69,144,142,136,144,69,97,147,134,146,138,99}), C.danger) end
	elseif cmd == _Vzd({236,234,237,237}) then
		local p = _Vcaca3e2289(rest)
		if p then task.spawn(_V62e4aa89105, p, false) else _Vb262b47755(_Vzd({246,244,226,232,230,187,161,236,234,237,237,161,189,239,226,238,230,191}), C.danger) end
	elseif cmd == _Vzd({227,243,234,239,232}) then
		local p = _Vcaca3e2289(rest)
		if p then task.spawn(_V702f278238, p, nil, false) else _Vb262b47755(_Vzd({246,244,226,232,230,187,161,227,243,234,239,232,161,189,239,226,238,230,191}), C.danger) end
	elseif cmd == _Vzd({244,239,240}) then
		local p = _Vcaca3e2289(rest)
		if p then _Vb07b7f02185(p); _Vb262b47755(_Vzd({212,207,208,161}) .. p.Name, C.success); _V556c1dc412c(HUB_NAME, _Vzd({212,207,208,161}) .. p.Name, 1)
		else _Vb262b47755(_Vzd({154,152,134,140,138,95,69,152,147,148,69,97,147,134,146,138,99}), C.danger) end
	elseif cmd == _Vzd({244,241,226,248,239}) then
		local toy = rest ~= "" and rest or _Vzd({209,226,237,237,230,245,205,234,232,233,245,195,243,240,248,239})
		_Vd788f8c8197(toy)
		_Vb262b47755(_Vzd({152,149,134,156,147,69}) .. toy, C.success)
	elseif cmd == _Vzd({241,226,237,237,230,245}) then
		_Vd788f8c8197(_Vzd({209,226,237,237,230,245,205,234,232,233,245,195,243,240,248,239}), { dist = 2.5 })
		_Vb262b47755(_Vzd({149,134,145,145,138,153,69,136,145,154,153,136,141}), C.success)
	elseif cmd == _Vzd({243,230,226,228,233}) then
		local n = tonumber(rest) or 25
		S.extendAmount = n
		if _Ve69c958f172 then
			_Ve69c958f172(true)
		else
			S.toggles.lineExtend = true
		end
		_Vb262b47755(_Vzd({243,230,226,228,233,161}) .. n, C.success)
		_V556c1dc412c(HUB_NAME, _Vzd({119,138,134,136,141,69}) .. n, 1)
	elseif cmd == _Vzd({230,249,230,228}) or cmd == _Vzd({237,246,226}) then
		local code = rest
		if code == "" then _Vb262b47755(_Vzd({246,244,226,232,230,187,161,230,249,230,228,161,189,237,246,226,161,228,240,229,230,191}), C.danger); return end
		local fn, err = loadstring(code)
		if not fn then
			_Vb262b47755(_Vzd({228,240,238,241,234,237,230,187,161}) .. tostring(err), C.danger)
			return
		end
		local ok, res = pcall(fn)
		if ok then
			_Vb262b47755(_Vzd({240,236,187,161}) .. tostring(res), C.success)
		else
			_Vb262b47755(_Vzd({230,243,243,187,161}) .. tostring(res), C.danger)
		end
	else
		_Vb262b47755(_Vzd({246,239,236,239,240,248,239,161,228,238,229,161,253,161,245,250,241,230,161,233,230,237,241}), C.danger)
	end
end
S.broughtItems = S.broughtItems or {}
S.bringHoldConn = S.bringHoldConn or nil
function _Ve7643aee127(model)
	if not model then return false end
	for _, ch in ipairs(workspace:GetChildren()) do
		if ch.Name == _Vzd({108,151,134,135,117,134,151,153,152}) then
			for _, d in ipairs(ch:GetDescendants()) do
				if d:IsA(_Vzd({216,230,237,229,196,240,239,244,245,243,226,234,239,245})) or d:IsA(_Vzd({216,230,237,229})) then
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
function _V16bc6d9d4a(model)
	if not model then return end
	for _, d in ipairs(model:GetDescendants()) do
		if d:IsA(_Vzd({195,226,244,230,209,226,243,245})) then
			for _, nm in ipairs({ _Vzd({215,208,202,197,219,224,195,243,234,239,232,195,209}), _Vzd({215,208,202,197,219,224,195,243,234,239,232,195,200}), _Vzd({215,208,202,197,219,224,195,243,234,239,232,195,215}) }) do
				local x = d:FindFirstChild(nm)
				if x then pcall(function() x:Destroy() end) end
			end
		end
	end
end
function _Vfb44fab7148(model, quiet)
	if not model then return end
	_V16bc6d9d4a(model)
	S.broughtItems[model] = nil
	if not quiet then
		_V556c1dc412c(HUB_NAME, _Vzd({211,230,237,230,226,244,230,229,161}) .. tostring(model.Name), 1)
	end
end
function _Vf66553d6145(quiet)
	for model in pairs(S.broughtItems) do
		_V16bc6d9d4a(model)
	end
	S.broughtItems = {}
	if S.bringHoldConn then
		pcall(function() S.bringHoldConn:Disconnect() end)
		S.bringHoldConn = nil
	end
	if not quiet then _V556c1dc412c(HUB_NAME, _Vzd({211,230,237,230,226,244,230,229,161,227,243,240,246,232,233,245,161,234,245,230,238,244}), 1.2) end
end
function _V45ada06673(part)
	if not part or not part.Parent then return nil, nil end
	local bp = part:FindFirstChild(_Vzd({215,208,202,197,219,224,195,243,234,239,232,195,209}))
	if not bp then
		bp = Instance.new(_Vzd({195,240,229,250,209,240,244,234,245,234,240,239}))
		bp.Name = _Vzd({215,208,202,197,219,224,195,243,234,239,232,195,209})
		bp.MaxForce = Vector3.new(1e9, 1e9, 1e9)
		bp.P = 1e5
		bp.D = 2500
		bp.Parent = part
	end
	local bg = part:FindFirstChild(_Vzd({123,116,110,105,127,132,103,151,142,147,140,103,108}))
	if not bg then
		bg = Instance.new(_Vzd({195,240,229,250,200,250,243,240}))
		bg.Name = _Vzd({215,208,202,197,219,224,195,243,234,239,232,195,200})
		bg.MaxTorque = Vector3.new(1e9, 1e9, 1e9)
		bg.P = 5e4
		bg.D = 800
		bg.Parent = part
	end
	return bp, bg
end
function _V0e7ce31343(part, tries)
	if not part or not part:IsA(_Vzd({195,226,244,230,209,226,243,245})) then return false end
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
		if _Veec038d8d2(part) then
			if FTAP.DestroyGrabLine then
				pcall(function() FTAP.DestroyGrabLine:FireServer(part) end)
			end
			return true
		end
	end
	if FTAP.DestroyGrabLine then
		pcall(function() FTAP.DestroyGrabLine:FireServer(part) end)
	end
	return _Veec038d8d2(part)
end
do local _z5499=(11*7);if _z5499<0 and _Vj() then _z5499=_z5499+1 end local _y5499=_Vzd({48,56}) end

function _Vd5ffdb4619d()
	if S.bringHoldConn then return end
	S.bringHoldConn = RunService.Heartbeat:Connect(function()
		local me = hrp()
		if not me then return end
		local now = os.clock()
		for model, info in pairs(S.broughtItems) do
			if not model or not model.Parent then
				S.broughtItems[model] = nil
			elseif info.untilT and now > info.untilT then
				_Vfb44fab7148(model, true)
			elseif _Ve7643aee127(model) then
				_Vfb44fab7148(model, true)
			else
				local part = info.part
				if not part or not part.Parent then
					part = model.PrimaryPart or model:FindFirstChildWhichIsA(_Vzd({195,226,244,230,209,226,243,245}), true)
					info.part = part
				end
				if part and part.Parent then
					if (now - (info.lastSno or 0)) >= 0.18 then
						info.lastSno = now
						for _, d in ipairs(model:GetDescendants()) do
							if d:IsA(_Vzd({195,226,244,230,209,226,243,245})) then
								sno(d, me.Position)
							end
						end
					end
					local slot = info.slot or 0
					local ox = info.ox or ((slot % 3) - 1) * 2.2
					local oy = info.oy or 1.4
					local oz = info.oz or -5 - math.floor(slot / 3) * 1.5
					local target = me.CFrame * CFrame.new(ox, oy, oz)
					local bp, bg = _V45ada06673(part)
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
function _Ve91ac2c537(model, opts)
	opts = opts or {}
	local me = hrp()
	if not me or not model or not model.Parent then return false end
	if Players:GetPlayerFromCharacter(model) then return false end
	local primary = model.PrimaryPart or model:FindFirstChildWhichIsA(_Vzd({195,226,244,230,209,226,243,245}), true)
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
		if part:IsA(_Vzd({195,226,244,230,209,226,243,245})) then
			if _V0e7ce31343(part, 8) then claimed = true end
		end
	end
	if _V0e7ce31343(primary, 12) then claimed = true end
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
	_Vd5ffdb4619d()
	return claimed or true
end
function _Ve690f73084(name)
	name = tostring(name or "")
	local me = hrp()
	local origin = me and me.Position or Vector3.zero
	local found = {}
	for _, inst in ipairs(workspace:GetDescendants()) do
		if inst:IsA(_Vzd({206,240,229,230,237})) and inst.Name == name then
			if not Players:GetPlayerFromCharacter(inst) then
				local part = inst.PrimaryPart or inst:FindFirstChildWhichIsA(_Vzd({195,226,244,230,209,226,243,245}), true)
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
function _V4d5ced1d39(name)
	task.spawn(function()
		local found = _Ve690f73084(name)
		if #found == 0 then
			local map = _V1520d06eb4()
			local entry = map[name]
			if entry then
				for _, m in ipairs(entry.samples or {}) do
					if m and m.Parent then
						found[#found + 1] = {
							model = m,
							part = m.PrimaryPart or m:FindFirstChildWhichIsA(_Vzd({195,226,244,230,209,226,243,245}), true),
							dist = 0,
						}
					end
				end
			end
		end
		if #found == 0 then
			_V556c1dc412c(HUB_NAME, _Vzd({207,240,239,230,161,231,240,246,239,229,187,161}) .. tostring(name), 2)
			return
		end
		local n, maxN = 0, math.min(5, #found)
		_V556c1dc412c(HUB_NAME, _Vzd({103,151,142,147,140,142,147,140,69}) .. name .. "...", 1)
		for i = 1, maxN do
			local ok = _Ve91ac2c537(found[i].model, { holdSec = 60, slot = i - 1 })
			if ok then n += 1 end
			task.wait(0.08)
		end
		_V556c1dc412c(HUB_NAME, _Vzd({201,240,237,229,234,239,232,161}) .. n .. _Vzd({249,161}) .. name .. _Vzd({161,253,161,232,243,226,227,161,234,245,161,240,243,161,248,226,234,245}), 2.5)
	end)
end
function _V16c1eb5a176(on)
	pcall(function() ContextActionService:UnbindAction(_Vzd({215,208,202,197,219,224,209,226,237,237,230,245,210})) end)
	if S.conns.palletQ then pcall(function() S.conns.palletQ:Disconnect() end) S.conns.palletQ = nil end
	if not on then
		_V556c1dc412c(HUB_NAME, _Vzd({118,69,149,134,145,145,138,153,69,116,107,107}), 1)
		return
	end
	task.spawn(_V6c6a3f4314a)
	S.conns.palletQ = UserInputService.InputBegan:Connect(function(input, gp)
		if gp then return end
		if input.KeyCode == Enum.KeyCode.Q and S.toggles.palletQ then
			if not FTAP.SpawnToy then pcall(_V6c6a3f4314a) end
			if FTAP.SpawnToy then
				_Vd788f8c8197(_Vzd({209,226,237,237,230,245,205,234,232,233,245,195,243,240,248,239}), { silent = false, dist = 2.5, sync = true })
			else
				_Vd788f8c8197(_Vzd({209,226,237,237,230,245,205,234,232,233,245,195,243,240,248,239}), { silent = false, dist = 2.5 })
			end
		end
	end)
	_V556c1dc412c(HUB_NAME, _Vzd({210,161,241,226,237,237,230,245,161,208,207,161,169,234,239,244,245,226,239,245,170}), 1)
end
local espStore = {}
function _V6aa2d7b54c()
	for p, objs in pairs(espStore) do
		for _, o in ipairs(objs) do pcall(function() o:Destroy() end) end
		espStore[p] = nil
	end
end
function _V56fbc9ef16d(on)
	_V6aa2d7b54c()
	if S.conns.espAdd then pcall(function() S.conns.espAdd:Disconnect() end) end
	if not on then return end
	local fillColor = S.espFillColor or C.accent
	local outlineColor = S.espOutlineColor or C.accent2
	local fillT = tonumber(S.espFillTransparency) or 0.5
	local outlineT = tonumber(S.espOutlineTransparency) or 0.3
	local depthMode = S.espDepthMode or _Vzd({194,237,248,226,250,244,208,239,213,240,241})
	local dm = depthMode == _Vzd({208,228,228,237,246,229,230,229}) and Enum.HighlightDepthMode.OccludedByOtherParts or Enum.HighlightDepthMode.AlwaysOnTop
	local function add(p)
		if p == LP then return end
		local function attach(c)
			if not c then return end
			if espStore[p] then for _, o in ipairs(espStore[p]) do pcall(function() o:Destroy() end) end end
			local h = Instance.new(_Vzd({201,234,232,233,237,234,232,233,245}))
			h.FillColor = fillColor
			h.OutlineColor = outlineColor
			h.FillTransparency = fillT
			h.OutlineTransparency = outlineT
			h.DepthMode = dm
			h.Parent = c
			local bb = Instance.new(_Vzd({103,142,145,145,135,148,134,151,137,108,154,142}))
			bb.Size = UDim2.fromOffset(120, 18)
			bb.AlwaysOnTop = true
			bb.StudsOffset = Vector3.new(0, 3, 0)
			bb.Adornee = c:FindFirstChild(_Vzd({201,230,226,229})) or c:FindFirstChild(_Vzd({201,246,238,226,239,240,234,229,211,240,240,245,209,226,243,245}))
			bb.Parent = c
			local tl = Instance.new(_Vzd({121,138,157,153,113,134,135,138,145}))
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
do local _z137=(7*7); if _z137<0 and _Vj() then _z137=_z137+1 end end
function _Ve7a1825216f(on)
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
function _Vbd03d77e177(on)
	local cc = Lighting:FindFirstChild(_Vzd({215,208,202,197,219,224,196,196}))
	local bloom = Lighting:FindFirstChild(_Vzd({123,116,110,105,127,132,103,145,148,148,146}))
	if not on then
		if cc then cc:Destroy() end
		if bloom then bloom:Destroy() end
		return
	end
	if not cc then cc = Instance.new(_Vzd({196,240,237,240,243,196,240,243,243,230,228,245,234,240,239,198,231,231,230,228,245})); cc.Name = _Vzd({215,208,202,197,219,224,196,196}); cc.Parent = Lighting end
	cc.TintColor = Color3.fromRGB(200, 160, 255)
	cc.Saturation = 0.15
	cc.Contrast = 0.08
	cc.Brightness = 0.02
	if not bloom then bloom = Instance.new(_Vzd({195,237,240,240,238,198,231,231,230,228,245})); bloom.Name = _Vzd({215,208,202,197,219,224,195,237,240,240,238}); bloom.Parent = Lighting end
	bloom.Intensity = 0.4
	bloom.Size = 20
	bloom.Threshold = 0.9
end
do local _z322=(6*10); if _z322<0 and _Vj() then _z322=_z322+1 end end
function _Vba75ed7e20c(p, actionName, attackerFn)
	if not p then return end
	local name = p.Name
	_V53fa917f1a2(_Vzd({248,226,245,228,233,224}) .. name .. actionName, 0.25, function()
		if not p.Parent then _V11a5d4671af(_Vzd({248,226,245,228,233,224}) .. name .. actionName); return end
		if not _Vd6eb72811f9(p) then
			_V11a5d4671af(_Vzd({248,226,245,228,233,224}) .. name .. actionName)
			_V556c1dc412c(HUB_NAME, actionName .. _Vzd({161,229,240,239,230,161,253,161}) .. name, 2)
			if actionName:lower():find(_Vzd({236,234,228,236})) or actionName:lower():find(_Vzd({236,234,237,237})) then
				_V556c1dc412c(HUB_NAME, _Vzd({199,234,239,234,244,233,230,229,161,253,161}) .. tostring(name), 2)
			end
			return
		end
		attackerFn(p)
	end)
end
local grabMap = {}
local heldParts = {}
S.grabMap = grabMap
S.heldParts = heldParts
local effectParts = {}
local grabWatchInstalled = false
function _Vee7c9952fd(part)
	if not part or not part:IsA(_Vzd({195,226,244,230,209,226,243,245})) or not part.Parent then return false end
	if part.Anchored then return false end
	local n = part.Name:lower()
	if n == _Vzd({227,226,244,230,241,237,226,245,230}) or n == _Vzd({232,243,240,246,239,229}) or n == _Vzd({231,237,240,240,243}) or n:find(_Vzd({238,226,241})) or n:find(_Vzd({248,226,237,237})) then
		return false
	end
	return true
end
do local _z148=(2*8); if _z148<0 and _Vj() then _z148=_z148+1 end end
function _Vaaf305f850(part)
	if not part then return end
	effectParts[part] = nil
	pcall(function()
		for _, ch in ipairs(part:GetChildren()) do
			if ch:IsA(_Vzd({195,240,229,250,215,230,237,240,228,234,245,250})) or ch:IsA(_Vzd({103,148,137,158,107,148,151,136,138})) or ch:IsA(_Vzd({195,240,229,250,194,239,232,246,237,226,243,215,230,237,240,228,234,245,250}))
				or ch:IsA(_Vzd({195,240,229,250,200,250,243,240})) or ch:IsA(_Vzd({195,240,229,250,209,240,244,234,245,234,240,239})) then
				if ch.Name == _Vzd({215,208,202,197,219,224,213,233,243,240,248,194,243,238}) or ch.Name == _Vzd({212,246,241,230,243,212,245,243,230,239,232,245,233}) then
					if ch:IsA(_Vzd({195,240,229,250,215,230,237,240,228,234,245,250})) and ch.MaxForce.Magnitude > 1 then
						ch:Destroy()
					end
				elseif tostring(ch.Name):sub(1, 5) == _Vzd({215,208,202,197,219}) or ch.Name == _Vzd({127,138,151,148,108,151,134,155,142,153,158,107,148,151,136,138})
					or ch.Name == _Vzd({199,237,234,239,232,195,215}) or ch.Name == _Vzd({212,241,234,239,194,215}) or ch.Name == _Vzd({200,243,226,247,195,199})
					or ch.Name == _Vzd({199,243,230,230,251,230,195,209}) or ch.Name == _Vzd({199,243,230,230,251,230,195,200}) or ch.Name == _Vzd({199,240,237,237,240,248,195,209}) then
					ch:Destroy()
				end
			end
		end
	end)
end
function _Vebae4a8e14c(part)
	if not part then return nil end
	local model = part:FindFirstAncestorOfClass(_Vzd({206,240,229,230,237}))
	if model then
		local plr = Players:GetPlayerFromCharacter(model)
		if plr then
			return _Vb2220e5a155(plr) or part
		end
		local hrp = model:FindFirstChild(_Vzd({201,246,238,226,239,240,234,229,211,240,240,245,209,226,243,245}))
		if hrp and hrp:IsA(_Vzd({195,226,244,230,209,226,243,245})) then return hrp end
	end
	return part
end
function _Vb434b2b47b(part)
	if not part or not part:IsA(_Vzd({195,226,244,230,209,226,243,245})) then return nil end
	local bv = part:FindFirstChild(_Vzd({123,116,110,105,127,132,121,141,151,148,156,102,151,146}))
	if bv and bv:IsA(_Vzd({195,240,229,250,215,230,237,240,228,234,245,250})) then return bv end
	local ok, created = pcall(function()
		local b = Instance.new(_Vzd({195,240,229,250,215,230,237,240,228,234,245,250}))
		b.Name = _Vzd({215,208,202,197,219,224,213,233,243,240,248,194,243,238})
		b.MaxForce = Vector3.zero
		b.Velocity = Vector3.zero
		b.P = 1250
		b.Parent = part
		return b
	end)
	return ok and created or nil
end
do local _z663=(8*9); if _z663<0 and _Vj() then _z663=_z663+1 end end
function _V2e6ac175108(part, power, dir)
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
			FTAP.SetNetworkOwner:FireServer(part, _Ve5bf781e109(origin, part.Position))
		end
		local bv = _Vb434b2b47b(part)
		if not bv then
			bv = Instance.new(_Vzd({195,240,229,250,215,230,237,240,228,234,245,250}))
			bv.Name = _Vzd({215,208,202,197,219,224,213,233,243,240,248,194,243,238})
			bv.Parent = part
		end
		bv.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
		bv.Velocity = vel
		Debris:AddItem(bv, 0.9)
		part.AssemblyLinearVelocity = vel
		part.AssemblyAngularVelocity = Vector3.new(18, 36, 12)
		local spare = part:FindFirstChild(_Vzd({199,237,234,239,232,195,215}))
		if not spare then
			spare = Instance.new(_Vzd({195,240,229,250,215,230,237,240,228,234,245,250}))
			spare.Name = _Vzd({199,237,234,239,232,195,215})
			spare.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
			spare.Velocity = vel
			spare.Parent = part
			Debris:AddItem(spare, 0.75)
		end
	end)
end
do local _z235=(6*9); if _z235<0 and _Vj() then _z235=_z235+1 end end
function _Vd38b4a3820(part)
	if not part then return end
	local root = _Vebae4a8e14c(part)
	if not root or not root.Parent then return end
	local cam = workspace.CurrentCamera
	local dir = (cam and cam.CFrame.LookVector) or Vector3.new(0, 0, -1)
	if dir.Magnitude < 1e-3 then dir = Vector3.new(0, 0, -1) end
	dir = dir.Unit
	if S._aimAtTarget then
		local target = S._aimAtTarget
		if target and target.Parent then
			local targetRoot = target:FindFirstChild(_Vzd({201,246,238,226,239,240,234,229,211,240,240,245,209,226,243,245}))
				or target:FindFirstChild(_Vzd({201,230,226,229}))
				or target:FindFirstChildWhichIsA(_Vzd({195,226,244,230,209,226,243,245}))
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
			local ss = root:FindFirstChild(_Vzd({212,246,241,230,243,212,245,243,230,239,232,245,233})) or part:FindFirstChild(_Vzd({212,246,241,230,243,212,245,243,230,239,232,245,233}))
			if ss and ss:IsA(_Vzd({195,240,229,250,215,230,237,240,228,234,245,250})) then
				ss.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
				ss.Velocity = dir * power
				Debris:AddItem(ss, 1)
			end
		end)
		_V2e6ac175108(root, power, dir)
		if part ~= root then _V2e6ac175108(part, power * 0.9, dir) end
		local model = root:FindFirstAncestorOfClass(_Vzd({206,240,229,230,237}))
		local plr = model and Players:GetPlayerFromCharacter(model)
		if plr then task.spawn(function() pcall(function() _Vb07b7f02185(plr, root.Position) end) end) end
		effectParts[root] = true
		_V556c1dc412c(HUB_NAME, _Vzd({212,246,241,230,243,161,245,233,243,240,248,162}), 1)
		return
	end
	if wantThrow then
		local power = math.clamp((tonumber(S.grabFlingPower) or 80) * 40, 400, 25000)
		power = power * (tonumber(S.strengthMult) or 1)
		_V2e6ac175108(root, power, dir)
		if part ~= root and part.Parent then
			_V2e6ac175108(part, power * 0.95, dir)
		end
		local model = root:FindFirstAncestorOfClass(_Vzd({206,240,229,230,237}))
		local plr = model and Players:GetPlayerFromCharacter(model)
		if plr then
			task.spawn(function()
				pcall(function() _Vb07b7f02185(plr, root.Position) end)
				for _, limb in ipairs(model:GetChildren()) do
					if limb:IsA(_Vzd({103,134,152,138,117,134,151,153})) and limb ~= root then
						pcall(function()
							limb.AssemblyLinearVelocity = dir * power * 0.85 + Vector3.new(0, power * 0.08, 0)
						end)
					end
				end
			end)
		end
		effectParts[root] = true
		_V556c1dc412c(HUB_NAME, _Vzd({213,233,243,240,248,239,161,253,161}) .. math.floor(power), 1)
	end
	if wantFreeze then
		local bp = Instance.new(_Vzd({195,240,229,250,209,240,244,234,245,234,240,239}))
		bp.Name = _Vzd({199,243,230,230,251,230,195,209})
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
		local bp = Instance.new(_Vzd({195,240,229,250,209,240,244,234,245,234,240,239}))
		bp.Name = _Vzd({199,240,237,237,240,248,195,209})
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
		local bf = Instance.new(_Vzd({195,240,229,250,199,240,243,228,230}))
		bf.Name = _Vzd({200,243,226,247,195,199})
		bf.Force = Vector3.new(0, S.grabGravityForce or 5000, 0)
		bf.Parent = root
		Debris:AddItem(bf, 1.2)
		effectParts[root] = true
	end
	if wantSpin then
		local av = Instance.new(_Vzd({195,240,229,250,194,239,232,246,237,226,243,215,230,237,240,228,234,245,250}))
		av.Name = _Vzd({212,241,234,239,194,215})
		av.MaxTorque = Vector3.new(math.huge, math.huge, math.huge)
		av.AngularVelocity = Vector3.new(0, S.grabSpinSpeed or 80, 0)
		av.Parent = root
		effectParts[root] = true
	end
end
do local _z2272=(2*9);if _z2272<0 and _Vj() then _z2272=_z2272+1 end local _y2272=_Vzd({68,88}) end

function _Ve78bc9fe35(grabModel, on)
	local drag = grabModel:FindFirstChild(_Vzd({197,243,226,232,209,226,243,245}), true)
		or grabModel:FindFirstChild(_Vzd({200,243,226,227,209,226,243,245}), true)
	if not drag then return end
	local ap = drag:FindFirstChildOfClass(_Vzd({194,237,234,232,239,209,240,244,234,245,234,240,239})) or drag:FindFirstChild(_Vzd({194,237,234,232,239,209,240,244,234,245,234,240,239}), true)
	local ao = drag:FindFirstChildOfClass(_Vzd({194,237,234,232,239,208,243,234,230,239,245,226,245,234,240,239})) or drag:FindFirstChild(_Vzd({194,237,234,232,239,208,243,234,230,239,245,226,245,234,240,239}), true)
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
function _Vd129af8f1(key)
	if key then palletLocks[key] = nil end
end
do local _z217=(9*6); if _z217<0 and _Vj() then _z217=_z217+1 end end
function _Vd3d67bbc2(part)
	if not part then return false end
	local p = part
	for _ = 1, 14 do
		if not p then break end
		local n = tostring(p.Name):lower()
		if n:find(_Vzd({149,134,145,145,138,153}), 1, true) or n == _Vzd({241,226,237,237,230,245,237,234,232,233,245,227,243,240,248,239}) then return true end
		if p:IsA(_Vzd({206,240,229,230,237})) and n:find(_Vzd({149,134,145,145,138,153}), 1, true) then return true end
		p = p.Parent
	end
	local model = part:FindFirstAncestorOfClass(_Vzd({114,148,137,138,145}))
	if model and model.Parent and tostring(model.Parent.Name):find(_Vzd({212,241,226,248,239,230,229,202,239,213,240,250,244}), 1, true) then
		local n = tostring(model.Name):lower()
		if n:find(_Vzd({149,134,145,145,138,153}), 1, true) or n:find(_Vzd({228,243,226,245,230}), 1, true) or n:find(_Vzd({241,237,226,245,231,240,243,238}), 1, true) then
			return true
		end
		if part:IsA(_Vzd({195,226,244,230,209,226,243,245})) and part.Size.Y <= 2.5 and part.Size.X >= 4 and part.Size.Z >= 4 then
			return true
		end
	end
	return false
end
function _V6f85c4ff14b(palletPart)
	if not palletPart then return nil end
	local p = palletPart
	for _ = 1, 14 do
		if not p then break end
		if p:IsA(_Vzd({195,226,244,230,209,226,243,245})) and tostring(p.Name):lower():find(_Vzd({241,226,237,237,230,245}), 1, true) then
			return p
		end
		p = p.Parent
	end
	local model = palletPart:FindFirstAncestorOfClass(_Vzd({206,240,229,230,237})) or palletPart.Parent
	local base, best = nil, -1
	if model then
		for _, d in ipairs(model:GetDescendants()) do
			if d:IsA(_Vzd({195,226,244,230,209,226,243,245})) then
				local n = tostring(d.Name):lower()
				local area = d.Size.X * d.Size.Z
				local score = area
				if n:find(_Vzd({241,226,237,237,230,245}), 1, true) then score = area * 10 end
				if d.Size.Y < 3 then score = score * 1.5 end
				if score > best then base, best = d, score end
			end
		end
	end
	return base or (palletPart:IsA(_Vzd({195,226,244,230,209,226,243,245})) and palletPart or nil)
end
do local _z715=(2*10); if _z715<0 and _Vj() then _z715=_z715+1 end end
do local _z1951=(9*11);if _z1951<0 and _Vj() then _z1951=_z1951+1 end local _y1951=_Vzd({88,86}) end

function _V2907e38d4f(root)
	if not root then return end
	pcall(function()
		for _, n in ipairs({ _Vzd({123,116,110,105,127,132,117,134,145,145,138,153,113,148,136,144}), _Vzd({123,116,110,105,127,132,117,134,145,145,138,153,113,148,136,144,108}), _Vzd({215,208,202,197,219,224,209,226,237,237,230,245,195,215}), _Vzd({215,208,202,197,219,224,209,226,237,237,230,245,216,230,237,229}), _Vzd({215,208,202,197,219,224,209,226,237,237,230,245,194,237,234,232,239}) }) do
			local x = root:FindFirstChild(n)
			if x then x:Destroy() end
		end
	end)
	palletPinned[root] = nil
end
function _V2e29df7946()
	for root in pairs(palletPinned) do
		_V2907e38d4f(root)
	end
	palletPinned = {}
end
do local _z7355=(3*5);if _z7355<0 and _Vj() then _z7355=_z7355+1 end local _y7355=_Vzd({77,67}) end

function _V0b0f360f131(base)
	local halfY = base.Size.Y * 0.5
	return base.CFrame * CFrame.new(0, halfY + 2.15, 0)
end
do local _z1445=(5*13);if _z1445<0 and _Vj() then _z1445=_z1445+1 end local _y1445=_Vzd({54,83}) end

function _Ve5c59f1e156(root, base)
	if not root or not base then return false end
	local off = base.CFrame:PointToObjectSpace(root.Position)
	local hx = math.max(base.Size.X, base.Size.Z) * 0.5 + 6
	local hz = hx
	local hy = base.Size.Y * 0.5
	local top = _V0b0f360f131(base).Position
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
do local _z4519=(11*5);if _z4519<0 and _Vj() then _z4519=_z4519+1 end local _y4519=_Vzd({70,69}) end

function _V5c8df2dd136(root, base, plr)
	if not root or not base or not root.Parent or not base.Parent then return end
	local top = _V0b0f360f131(base)
	if plr then
		pcall(function() _Vb07b7f02185(plr, base.Position) end)
	end
	pcall(function() sno(root, base.Position) end)
	if FTAP.CreateGrabLine then
		pcall(function() FTAP.CreateGrabLine:FireServer(root, root.CFrame) end)
	end
	pcall(function()
		local hum = root.Parent and root.Parent:FindFirstChildOfClass(_Vzd({201,246,238,226,239,240,234,229}))
		if hum then
			hum.PlatformStand = true
			hum.Sit = false
			hum.Jump = false
		end
		root.AssemblyLinearVelocity = Vector3.zero
		root.AssemblyAngularVelocity = Vector3.zero
		local owned = _Veec038d8d2(root)
		if owned then
			root.CFrame = top
		end
		local bp = root:FindFirstChild(_Vzd({215,208,202,197,219,224,209,226,237,237,230,245,205,240,228,236}))
		if not bp then
			bp = Instance.new(_Vzd({195,240,229,250,209,240,244,234,245,234,240,239}))
			bp.Name = _Vzd({215,208,202,197,219,224,209,226,237,237,230,245,205,240,228,236})
			bp.MaxForce = Vector3.new(1e9, 1e9, 1e9)
			bp.P = 2e5
			bp.D = 3000
			bp.Parent = root
		end
		bp.Position = top.Position
		local bg = root:FindFirstChild(_Vzd({123,116,110,105,127,132,117,134,145,145,138,153,113,148,136,144,108}))
		if not bg then
			bg = Instance.new(_Vzd({195,240,229,250,200,250,243,240}))
			bg.Name = _Vzd({215,208,202,197,219,224,209,226,237,237,230,245,205,240,228,236,200})
			bg.MaxTorque = Vector3.new(1e9, 1e9, 1e9)
			bg.P = 1e5
			bg.D = 800
			bg.Parent = root
		end
		bg.CFrame = top
		local bv = root:FindFirstChild(_Vzd({215,208,202,197,219,224,209,226,237,237,230,245,195,215}))
		if not bv then
			bv = Instance.new(_Vzd({195,240,229,250,215,230,237,240,228,234,245,250}))
			bv.Name = _Vzd({215,208,202,197,219,224,209,226,237,237,230,245,195,215})
			bv.MaxForce = Vector3.new(1e9, 1e9, 1e9)
			bv.Parent = root
		end
		bv.Velocity = Vector3.zero
	end)
	palletPinned[root] = true
end
do local _z7349=(10*7);if _z7349<0 and _Vj() then _z7349=_z7349+1 end local _y7349=_Vzd({74,70}) end

function _V20002e26135(base)
	if not base or not base.Parent then return end
	local still = {}
	local myR = hrp()
	if myR and _Ve5c59f1e156(myR, base) then
		local top = _V0b0f360f131(base)
		pcall(function()
			myR.AssemblyLinearVelocity = Vector3.zero
			myR.AssemblyAngularVelocity = Vector3.zero
			local bp = myR:FindFirstChild(_Vzd({215,208,202,197,219,224,209,226,237,237,230,245,205,240,228,236}))
			if not bp then
				bp = Instance.new(_Vzd({195,240,229,250,209,240,244,234,245,234,240,239}))
				bp.Name = _Vzd({215,208,202,197,219,224,209,226,237,237,230,245,205,240,228,236})
				bp.MaxForce = Vector3.new(1e9, 1e9, 1e9)
				bp.P = 2e5
				bp.D = 3000
				bp.Parent = myR
			end
			bp.Position = top.Position
			local bv = myR:FindFirstChild(_Vzd({215,208,202,197,219,224,209,226,237,237,230,245,195,215}))
			if not bv then
				bv = Instance.new(_Vzd({195,240,229,250,215,230,237,240,228,234,245,250}))
				bv.Name = _Vzd({215,208,202,197,219,224,209,226,237,237,230,245,195,215})
				bv.MaxForce = Vector3.new(1e9, 1e9, 1e9)
				bv.Parent = myR
			end
			bv.Velocity = Vector3.zero
		end)
		still[myR] = true
	end
	for _, plr in ipairs(Players:GetPlayers()) do
		if plr ~= LP and not _V732569ef100(plr) then
			local r = _Vb2220e5a155(plr)
			if r and _Ve5c59f1e156(r, base) then
				_V5c8df2dd136(r, base, plr)
				still[r] = true
			end
		end
	end
	pcall(function()
		for _, m in ipairs(workspace:GetChildren()) do
			if m:IsA(_Vzd({206,240,229,230,237})) and not Players:GetPlayerFromCharacter(m) then
				local hum = m:FindFirstChildOfClass(_Vzd({109,154,146,134,147,148,142,137}))
				local r = m:FindFirstChild(_Vzd({201,246,238,226,239,240,234,229,211,240,240,245,209,226,243,245})) or m:FindFirstChild(_Vzd({213,240,243,244,240}))
				if hum and r and r:IsA(_Vzd({195,226,244,230,209,226,243,245})) and _Ve5c59f1e156(r, base) then
					_V5c8df2dd136(r, base, nil)
					still[r] = true
				end
			end
		end
	end)
	for root in pairs(palletPinned) do
		if not still[root] then
			local hum = root.Parent and root.Parent:FindFirstChildOfClass(_Vzd({201,246,238,226,239,240,234,229}))
			if hum then pcall(function() hum.PlatformStand = false end) end
			_V2907e38d4f(root)
		end
	end
end
do local _z2059=(7*7);if _z2059<0 and _Vj() then _z2059=_z2059+1 end local _y2059=_Vzd({79,74}) end

function _V65503c533(weld, grabPart)
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
function _Vffc77b7cb2()
	for grabModel, part in pairs(grabMap) do
		if grabModel and grabModel.Parent and part and part.Parent and isPalletPart(part) then
			local base = _V6f85c4ff14b(part)
			if base then return base, grabModel, part end
		end
	end
	for _, ch in ipairs(workspace:GetChildren()) do
		if ch.Name == _Vzd({200,243,226,227,209,226,243,245,244}) then
			local gp = ch:FindFirstChild(_Vzd({200,243,226,227,209,226,243,245}))
			local weld = gp and (gp:FindFirstChildOfClass(_Vzd({216,230,237,229,196,240,239,244,245,243,226,234,239,245})) or gp:FindFirstChild(_Vzd({216,230,237,229,196,240,239,244,245,243,226,234,239,245})))
			local grabbed = resolveGrabbedFromWeld(weld, gp)
			if grabbed and isPalletPart(grabbed) then
				grabMap[ch] = grabbed
				local base = _V6f85c4ff14b(grabbed)
				if base then return base, ch, grabbed end
			end
		end
	end
	return nil
end
function _Vd1c1b97c0(palletPart, grabModel)
	if not palletPart or not grabModel then return end
	if palletLocks[grabModel] then return end
	local base = _V6f85c4ff14b(palletPart)
	if not base then return end
	palletLocks[grabModel] = true
	if not palletCageNotified then
		palletCageNotified = true
		_V556c1dc412c(HUB_NAME, _Vzd({209,226,237,237,230,245,161,237,240,228,236,161,253,161,241,230,240,241,237,230,161,244,245,234,228,236,161,245,240,161,228,230,239,245,230,243,161,248,233,234,237,230,161,250,240,246,161,233,240,237,229}), 2)
		task.delay(3, function() palletCageNotified = false end)
	end
end
function _Va69015301c1()
	if not S.toggles.palletCage then
		if next(palletPinned) then _V2e29df7946() end
		return
	end
	local base = _Vffc77b7cb2()
	if not base then
		if next(palletPinned) then _V2e29df7946() end
		return
	end
	pcall(function()
		sno(base)
		for _, d in ipairs(base:GetDescendants()) do
			if d:IsA(_Vzd({195,226,244,230,209,226,243,245})) then sno(d) end
		end
		local model = base:FindFirstAncestorOfClass(_Vzd({206,240,229,230,237}))
		if model then
			for _, d in ipairs(model:GetDescendants()) do
				if d:IsA(_Vzd({195,226,244,230,209,226,243,245})) then sno(d) end
			end
		end
	end)
	_V20002e26135(base)
end
function _V928735634(on)
	S.toggles.palletCage = on == true
	_V11a5d4671af(_Vzd({149,134,145,145,138,153,104,134,140,138}))
	if not on then
		for k in pairs(palletLocks) do palletLocks[k] = nil end
		_V2e29df7946()
		_V556c1dc412c(HUB_NAME, _Vzd({209,226,237,237,230,245,161,237,240,228,236,161,208,199,199}), 1)
		return
	end
	_Vddd8d203e0()
	_V53fa917f1a2(_Vzd({149,134,145,145,138,153,104,134,140,138}), 0.03, _Va69015301c1)
	_V556c1dc412c(HUB_NAME, _Vzd({117,134,145,145,138,153,69,145,148,136,144,69,116,115,69,161,69,141,148,145,137,69,134,69,149,134,145,145,138,153}), 1.5)
end
	destroyPalletCage = _Vd129af8f1
	isPalletPart = _Vd3d67bbc2
	buildPalletCage = _Vd1c1b97c0
	resolveGrabbedFromWeld = _V65503c533
	setPalletCage = _V928735634
end
function _V82d3370412d(child)
	if child.Name ~= _Vzd({108,151,134,135,117,134,151,153,152}) then return end
	_V4fd17682d4(child)
	task.defer(function()
		if child.Parent then _V4fd17682d4(child) end
	end)
	task.delay(0.08, function()
		if child.Parent then _V4fd17682d4(child) end
	end)
	task.delay(0.25, function()
		if child.Parent then _V4fd17682d4(child) end
	end)
	if not S.toggles.invisLine then
		task.defer(function()
			if child.Parent then
				_V026212e1150(child)
				_V3bd70b6793()
				for _, d in ipairs(child:GetDescendants()) do
					if d:IsA(_Vzd({195,230,226,238})) then _Vdfe561b120b(d) end
				end
			end
		end)
		task.delay(0.05, function()
			if child.Parent and not S.toggles.invisLine then _V3bd70b6793() end
		end)
		task.delay(0.15, function()
			if child.Parent and not S.toggles.invisLine then
				_V026212e1150(child)
				_V3bd70b6793()
			end
		end)
		task.spawn(function()
			for _ = 1, 25 do
				if not child.Parent or S.toggles.invisLine then break end
				_V3bd70b6793()
				task.wait(0.08)
			end
		end)
	end
	task.spawn(function()
		local gp, weld, grabbed
		local ok = pcall(function()
			gp = child:WaitForChild(_Vzd({200,243,226,227,209,226,243,245}), 3)
			if not gp then return end
			for _ = 1, 30 do
				weld = gp:FindFirstChildOfClass(_Vzd({216,230,237,229,196,240,239,244,245,243,226,234,239,245})) or gp:FindFirstChild(_Vzd({124,138,145,137,104,148,147,152,153,151,134,142,147,153}))
				if weld and (weld.Part0 or weld.Part1) then break end
				task.wait(0.05)
			end
			if not weld then
				weld = gp:WaitForChild(_Vzd({216,230,237,229,196,240,239,244,245,243,226,234,239,245}), 2)
			end
			grabbed = resolveGrabbedFromWeld(weld, gp)
		end)
		if not ok or not grabbed then return end
		if not grabbed:IsA(_Vzd({195,226,244,230,209,226,243,245})) then return end
		local myChar = char()
		if myChar and grabbed:IsDescendantOf(myChar) then return end
		grabMap[child] = grabbed
		heldParts[grabbed] = true
		local model = grabbed:FindFirstAncestorOfClass(_Vzd({206,240,229,230,237})) or grabbed.Parent
		local targetHum = model and model:FindFirstChildOfClass(_Vzd({201,246,238,226,239,240,234,229}))
		local targetPlr = model and Players:GetPlayerFromCharacter(model)
		local targetRoot = targetPlr and _Vb2220e5a155(targetPlr) or grabbed
		local releaseRoot = _Vebae4a8e14c(grabbed)
		if targetPlr then
			_V4bf866fd40(targetPlr)
			_Vdfed2e1249(targetPlr)
		elseif model then
			for _, d in ipairs(model:GetDescendants()) do
				if d.Name == _Vzd({195,243,234,239,232,195,240,229,250}) or d.Name == _Vzd({199,226,243,238,212,239,240,248,227,226,237,237}) or d:IsA(_Vzd({195,240,229,250,209,240,244,234,245,234,240,239})) then
					local n = d.Name
					if n == _Vzd({195,243,234,239,232,195,240,229,250}) or n == _Vzd({199,226,243,238,212,239,240,248,227,226,237,237}) or (d:IsA(_Vzd({195,240,229,250,209,240,244,234,245,234,240,239})) and d.MaxForce.Magnitude > 1e5) then
						pcall(function() d:Destroy() end)
					end
				end
			end
		end
		if grabbed then
			_V132ff5a448(grabbed)
			local farm = grabbed:FindFirstChild(_Vzd({199,226,243,238,212,239,240,248,227,226,237,237}))
			if farm then pcall(function() farm:Destroy() end) end
		end
		do
			local snowModel = model
			if snowModel and (snowModel.Name == _Vzd({195,226,237,237,212,239,240,248,227,226,237,237}) or tostring(snowModel.Name):find(_Vzd({212,239,240,248}), 1, true)) then
				_V66b5198f1b9(snowModel)
				_V66b5198f1b9(grabbed)
				task.spawn(function()
					while child.Parent do
						_V66b5198f1b9(snowModel)
						if grabbed and grabbed.Parent then _V66b5198f1b9(grabbed) end
						task.wait(0.15)
					end
				end)
			end
		end
		_V2d5ade5d1a1()
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
				pcall(function() _Vd38b4a3820(part) end)
				task.defer(function()
					local r = _Vebae4a8e14c(part) or part
					local arm = r and r:FindFirstChild(_Vzd({215,208,202,197,219,224,213,233,243,240,248,194,243,238}))
					if arm and arm:IsA(_Vzd({195,240,229,250,215,230,237,240,228,234,245,250})) and arm.MaxForce.Magnitude < 1 then
						pcall(function() _Vd38b4a3820(part) end)
					end
				end)
			end
		end
		if targetPlr then
			grabMap[child .. _Vzd({224,245,226,243,232,230,245,209,237,243})] = targetPlr
			grabMap[child .. _Vzd({224,245,226,243,232,230,245,211,240,240,245})] = targetRoot
		end
		task.spawn(function()
			while child.Parent and not released do
				if S.toggles.palletCage then
					local part = grabMap[child] or grabbed
					if (not part or not isPalletPart(part)) and child:FindFirstChild(_Vzd({200,243,226,227,209,226,243,245})) then
						local gpx = child:FindFirstChild(_Vzd({200,243,226,227,209,226,243,245}))
						local w = gpx and (gpx:FindFirstChildOfClass(_Vzd({216,230,237,229,196,240,239,244,245,243,226,234,239,245})) or gpx:FindFirstChild(_Vzd({216,230,237,229,196,240,239,244,245,243,226,234,239,245})))
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
						tostring(part.Name):lower():find(_Vzd({244,233,246,243,234,236,230,239}), 1, true)
						or tostring(part.Name):lower():find(_Vzd({236,246,239,226,234}), 1, true)
						or (part:FindFirstAncestorOfClass(_Vzd({206,240,229,230,237})) and tostring(part:FindFirstAncestorOfClass(_Vzd({206,240,229,230,237})).Name):lower():find(_Vzd({244,233,246,243,234,236,230,239}), 1, true))
						or (part:FindFirstAncestorOfClass(_Vzd({206,240,229,230,237})) and tostring(part:FindFirstAncestorOfClass(_Vzd({206,240,229,230,237})).Name):lower():find(_Vzd({236,246,239,226,234}), 1, true))
					)
					if (isPallet and S.toggles.palletSilentAim) or (isShuriken and S.toggles.shurikenSilentAim) then
						local me = hrp()
						if me then
							local best, bd = nil, 120
							for _, p in ipairs(Players:GetPlayers()) do
								if _Vd6eb72811f9(p) then
									local r = _Vb2220e5a155(p)
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
			if releaseRoot then _Vb434b2b47b(releaseRoot) end
			_Vb434b2b47b(grabbed)
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
						if d:IsA(_Vzd({195,230,226,238})) then
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
				local old = target:FindFirstChild(_Vzd({212,246,241,230,243,212,245,243,230,239,232,245,233}))
				if old then old:Destroy() end
				local bv = Instance.new(_Vzd({195,240,229,250,215,230,237,240,228,234,245,250}))
				bv.Name = _Vzd({212,246,241,230,243,212,245,243,230,239,232,245,233})
				bv.MaxForce = Vector3.zero
				bv.Velocity = Vector3.zero
				bv.Parent = target
			end)
		end
		if S.anchorGrab or S.toggles.anchorGrab then
			task.spawn(function()
				local bp = Instance.new(_Vzd({195,240,229,250,209,240,244,234,245,234,240,239}))
				bp.Name = _Vzd({215,208,202,197,219,224,194,239,228,233,240,243,205,240,228,236})
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
					_Ve78bc9fe35(child, true)
					task.wait(0.2)
				end
			end)
		end
		if (S.radioactiveGrab or S.toggles.radioactiveGrab) and targetRoot then
			task.spawn(function()
				while child.Parent and (S.radioactiveGrab or S.toggles.radioactiveGrab) do
					_Vc98281101e(targetRoot)
					task.wait(0.15)
				end
			end)
		end
		if (S.noclipGrab or S.toggles.noclipGrab) and model then
			task.spawn(function()
				for _, d in ipairs(model:GetDescendants()) do
					if d:IsA(_Vzd({103,134,152,138,117,134,151,153})) then
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
					if targetPlr then _Vb07b7f02185(targetPlr, grabbed.Position) end
					pcall(function()
						targetHum.BreakJointsOnDeath = false
						targetHum:ChangeState(Enum.HumanoidStateType.Dead)
						targetHum.Jump = true
						targetHum.Sit = false
					end)
					if targetPlr then
						pcall(function()
							if _Veec038d8d2(grabbed) and targetHum:GetStateEnabled(Enum.HumanoidStateType.Dead) then
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
				_Vb18408d4140(targetPlr)
				while child.Parent and (S.ragdollGrab or S.toggles.ragdollGrab) do
					_Vb18408d4140(targetPlr)
					task.wait(0.08)
				end
			end)
		end
		if (S.poisonGrab or S.toggles.poisonGrab) and targetRoot then
			task.spawn(function()
				while child.Parent and (S.poisonGrab or S.toggles.poisonGrab) do
					if targetRoot then
						_Vc83fb00d1f(targetRoot)
					end
					task.wait(0.1)
				end
			end)
		end
		if (S.burnGrab or S.toggles.burnGrab) and grabbed then
			task.spawn(function()
				_V83e3d178b9(_Vzd({196,226,238,241,231,234,243,230}))
				task.wait(0.3)
				while child.Parent and (S.burnGrab or S.toggles.burnGrab) do
					local r = targetPlr and _Vb2220e5a155(targetPlr) or grabbed
					if r then
						_Vfb0808ef21(_Vzd({231,234,243,230}), targetPlr)
					end
					task.wait(0.1)
				end
			end)
		end
		if S.grabZeroG then
			_Vaaf305f850(grabbed)
			local bf = Instance.new(_Vzd({103,148,137,158,107,148,151,136,138}))
			bf.Name = _Vzd({219,230,243,240,200,243,226,247,234,245,250,199,240,243,228,230})
			bf.Force = Vector3.new(0, S.grabZeroGForce or 50000, 0)
			bf.Parent = grabbed
		end
		if S.grabSpin and S.toggles.spinWhileHold then
			local av = Instance.new(_Vzd({195,240,229,250,194,239,232,246,237,226,243,215,230,237,240,228,234,245,250}))
			av.Name = _Vzd({212,241,234,239,194,215})
			av.MaxTorque = Vector3.new(math.huge, math.huge, math.huge)
			av.AngularVelocity = Vector3.new(0, S.grabSpinSpeed or 80, 0)
			av.Parent = grabbed
		end
		pcall(function()
			child:GetPropertyChangedSignal(_Vzd({209,226,243,230,239,245})):Connect(function()
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
				weld:GetPropertyChangedSignal(_Vzd({209,226,243,245,178})):Connect(function()
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
function _Vddd8d203e0()
	if grabWatchInstalled then return end
	grabWatchInstalled = true
	workspace.ChildAdded:Connect(_V82d3370412d)
	workspace.ChildRemoved:Connect(function(ch)
		if ch.Name == _Vzd({200,243,226,227,209,226,243,245,244}) and grabMap[ch] then
			local part = grabMap[ch]
			grabMap[ch] = nil
			if part then
				heldParts[part] = nil
				task.defer(function()
					pcall(function() _Vd38b4a3820(part) end)
				end)
			end
		end
	end)
	for _, ch in ipairs(workspace:GetChildren()) do
		if ch.Name == _Vzd({200,243,226,227,209,226,243,245,244}) then _V82d3370412d(ch) end
	end
	_V64544f4b29(_Vzd({232,243,226,227,199,240,237,237,240,248,201,195}), RunService.Heartbeat:Connect(function()
		if not S.grabFollow then return end
		local me = hrp()
		if not me then return end
		local foot = me.Position - Vector3.new(0, 2.5, 0)
		for part, _ in pairs(effectParts) do
			if part and part.Parent then
				local bp = part:FindFirstChild(_Vzd({199,240,237,237,240,248,195,209}))
				if bp and bp:IsA(_Vzd({195,240,229,250,209,240,244,234,245,234,240,239})) then
					bp.Position = foot
					bp.P = (S.grabFollowSpeed or 50) * 20
				end
			else
				effectParts[part] = nil
			end
		end
	end))
	print(_Vzd({128,123,116,110,105,127,130,69,140,151,134,135,82,151,138,145,138,134,152,138,69,156,134,153,136,141,69,142,147,152,153,134,145,145,138,137}))
end
function _V89bf90a6f1(plr)
	local c = char()
	local their = plr and plr.Character
	if not c or not their then return false end
	local function linkedPart(other)
		if not other then return false end
		if other:IsDescendantOf(their) then return true end
		local cur = other
		for _ = 1, 12 do
			if not cur then break end
			if cur.Name == _Vzd({200,243,226,227,209,226,243,245,244}) then return true end
			cur = cur.Parent
		end
		return false
	end
	for _, d in ipairs(c:GetDescendants()) do
		if d:IsA(_Vzd({216,230,237,229,196,240,239,244,245,243,226,234,239,245})) or d:IsA(_Vzd({216,230,237,229})) or d:IsA(_Vzd({206,226,239,246,226,237,216,230,237,229}))
			or d:IsA(_Vzd({194,237,234,232,239,209,240,244,234,245,234,240,239})) or d:IsA(_Vzd({194,237,234,232,239,208,243,234,230,239,245,226,245,234,240,239})) or d:IsA(_Vzd({211,234,232,234,229,196,240,239,244,245,243,226,234,239,245})) then
			local p0, p1 = d.Part0, d.Part1
			if d:IsA(_Vzd({194,237,234,232,239,209,240,244,234,245,234,240,239})) or d:IsA(_Vzd({194,237,234,232,239,208,243,234,230,239,245,226,245,234,240,239})) then
				local a0 = d.Attachment0
				local a1 = d.Attachment1
				p0 = a0 and a0.Parent
				p1 = a1 and a1.Parent
			end
			if p0 and p1 then
				if (p0:IsDescendantOf(c) and linkedPart(p1)) or (p1:IsDescendantOf(c) and linkedPart(p0)) then
					return true
				end
			end
		end
	end

	return false
end
do local _z4454=(2*4);if _z4454<0 and _Vj() then _z4454=_z4454+1 end local _y4454=_Vzd({87,47}) end

function _Ve560b2cb17e(plr)
	local c = char()
	local me = hrp()
	if not c then return end
	if FTAP.Struggle then
		for _ = 1, 6 do
			pcall(function() FTAP.Struggle:FireServer(LP) end)
			pcall(function() FTAP.Struggle:FireServer() end)
		end
	end
	if me and FTAP.DestroyGrabLine then
		pcall(function() FTAP.DestroyGrabLine:FireServer(me) end)
		for _, n in ipairs({ _Vzd({201,246,238,226,239,240,234,229,211,240,240,245,209,226,243,245}), _Vzd({213,240,243,244,240}), _Vzd({214,241,241,230,243,213,240,243,244,240}), _Vzd({201,230,226,229}) }) do
			local p = c:FindFirstChild(n)
			if p then pcall(function() FTAP.DestroyGrabLine:FireServer(p) end) end
		end
	end
	if _V0736e096c7 then pcall(_V0736e096c7, c) end
	if _V5f5a4998cc then pcall(_V5f5a4998cc, c) end
	for _, child in ipairs(workspace:GetChildren()) do
		if child.Name == _Vzd({200,243,226,227,209,226,243,245,244}) and _V313715e1bf and _V313715e1bf(child, c) then
			for _, d in ipairs(child:GetDescendants()) do
				if d:IsA(_Vzd({216,230,237,229,196,240,239,244,245,243,226,234,239,245})) or d:IsA(_Vzd({216,230,237,229})) or d:IsA(_Vzd({194,237,234,232,239,209,240,244,234,245,234,240,239}))
					or d:IsA(_Vzd({194,237,234,232,239,208,243,234,230,239,245,226,245,234,240,239})) or d:IsA(_Vzd({211,234,232,234,229,196,240,239,244,245,243,226,234,239,245})) then
					pcall(function() d:Destroy() end)
				end
			end
			pcall(function() child:Destroy() end)
		end
	end
	if plr and plr.Character then
		local their = plr.Character
		for _, d in ipairs(c:GetDescendants()) do
			if d:IsA(_Vzd({216,230,237,229,196,240,239,244,245,243,226,234,239,245})) or d:IsA(_Vzd({216,230,237,229})) or d:IsA(_Vzd({206,226,239,246,226,237,216,230,237,229})) then
				local p0, p1 = d.Part0, d.Part1
				if p0 and p1 then
					local touchThem = (p0:IsDescendantOf(their) or p1:IsDescendantOf(their))
					local touchUs = (p0:IsDescendantOf(c) or p1:IsDescendantOf(c))
					if touchThem and touchUs then
						pcall(function() d:Destroy() end)
					end
				end
			end
		end
	end
end
function _Vf264411a13c()
	local c = char()
	local me = hrp()
	local h = hum()
	if not me then return end
	if _Vac4315d51b8 then _Vac4315d51b8(c) end
	pcall(function()
		me.AssemblyLinearVelocity = Vector3.zero
		me.AssemblyAngularVelocity = Vector3.zero
		me.Anchored = false
		for _, d in ipairs(me:GetChildren()) do
			if d:IsA(_Vzd({195,240,229,250,215,230,237,240,228,234,245,250})) or d:IsA(_Vzd({195,240,229,250,194,239,232,246,237,226,243,215,230,237,240,228,234,245,250})) or d:IsA(_Vzd({205,234,239,230,226,243,215,230,237,240,228,234,245,250})) then
				local n = d.Name
				if n == _Vzd({215,208,202,197,219,224,196,240,246,239,245,230,243}) or n == _Vzd({199,237,234,239,232,194,246,243,226,215,230,237,240,228,234,245,250}) or n == _Vzd({212,236,250,215,230,237,240,228,234,245,250})
					or n == _Vzd({215,208,202,197,219,224,195,215}) or _Vd2016f03ed(n) then
					d:Destroy()
				end
			end
		end
		local gbv = me:FindFirstChild(_Vzd({215,208,202,197,219,224,200,246,228,228,234,195,215}))
		if gbv and gbv:IsA(_Vzd({195,240,229,250,215,230,237,240,228,234,245,250})) then
			gbv.Velocity = Vector3.zero
		end
	end)
	if h then
		pcall(function()
			h.PlatformStand = false
			h.Sit = false
		end)
	end
end
function _Vc54b5f4762(plr, part)
	if not plr or not _Vd6eb72811f9(plr) then return end
	local now = os.clock()
	S._counterCd = S._counterCd or {}
	local uid = plr.UserId
	if (S._counterCd[uid] or 0) > now then return end
	S._counterCd[uid] = now + 0.4
	local mode = S.counterMode or _Vzd({211,230,241,246,237,244,234,240,239})
	local force = (tonumber(S.revengeForce) or 12000) * (tonumber(S.strengthMult) or 1)
	force = math.clamp(force, 500, 1e6)
	local r = _Vb2220e5a155(plr) or part
	if not r then return end
	local me = hrp()
	if not me then return end

	_Ve560b2cb17e(plr)
	if (S.toggles.antiGucci or S.toggles.antiGrab) and _V94198221c4 then
		pcall(_V94198221c4)
	end
	_Vf264411a13c()

	for _ = 1, 8 do
		if not _V89bf90a6f1(plr) then break end
		_Ve560b2cb17e(plr)
		_Vf264411a13c()
		RunService.Heartbeat:Wait()
	end
	if _V89bf90a6f1(plr) then
		S._counterCd[uid] = now + 0.12
		_Vf264411a13c()
		return
	end

	pcall(function()
		sno(r, me.Position)
		if plr.Character then
			for _, n in ipairs({ _Vzd({201,246,238,226,239,240,234,229,211,240,240,245,209,226,243,245}), _Vzd({213,240,243,244,240}), _Vzd({214,241,241,230,243,213,240,243,244,240}), _Vzd({201,230,226,229}) }) do
				local p = plr.Character:FindFirstChild(n)
				if p then sno(p, me.Position) end
			end
		end
	end)

	local away = (r.Position - me.Position)
	if away.Magnitude < 0.5 then
		away = me.CFrame.LookVector
	end
	away = Vector3.new(away.X, 0, away.Z)
	if away.Magnitude < 0.05 then away = Vector3.new(0, 0, -1) end
	away = away.Unit
	pcall(function()
		if mode == _Vzd({199,243,230,230,251,230}) then
			local hum = plr.Character and plr.Character:FindFirstChildOfClass(_Vzd({201,246,238,226,239,240,234,229}))
			if hum then
				hum.WalkSpeed = 0
				hum.JumpPower = 0
				hum.Sit = false
			end
			_Vb538a53863(r, r.CFrame)
			r.AssemblyLinearVelocity = Vector3.zero
		elseif mode == _Vzd({197,230,226,245,233}) then
			_Vadc8368767(r)
			_Vc9836fec182(r)
			local hum = plr.Character and plr.Character:FindFirstChildOfClass(_Vzd({201,246,238,226,239,240,234,229}))
			if hum then
				hum.BreakJointsOnDeath = false
				hum.Health = 0
				hum:ChangeState(Enum.HumanoidStateType.Dead)
				hum.Jump = true
				hum.Sit = true
			end
		elseif mode == _Vzd({204,234,228,236}) then
			_Vadc8368767(r)
			if _V971ad737104 then
				_V971ad737104(plr, S.kickType or _Vzd({209,233,240,230,239,234,249}), true)
			else
				_V7186e37c24(r, force, 0.15)
			end
		elseif mode == _Vzd({199,237,234,239,232}) then
			_Vadc8368767(r)
			if _Vcc8279d692 then _Vcc8279d692(plr, force, true, true) else _V7186e37c24(r, force, 0.8) end
		elseif mode == _Vzd({215,240,234,229}) then
			_Vadc8368767(r)
			if _V788517221fb then _V788517221fb(plr, true) else
				r.AssemblyLinearVelocity = Vector3.new(0, -1e5, 0)
			end
		elseif mode == _Vzd({211,226,232,229,240,237,237}) then
			_Vadc8368767(r)
			if _V7e5dd05e13e then _V7e5dd05e13e(plr, true) end
			_V7186e37c24(r, force * 0.5, 0.3)
		elseif mode == _Vzd({195,243,234,239,232}) then
			_Vadc8368767(r)
			if _V702f278238 then _V702f278238(plr, nil, true) end
		elseif mode == _Vzd({212,236,250}) then
			_Vadc8368767(r)
			_Vc9836fec182(r)
			_V7186e37c24(r, force, 2.5)
		else
			_Vadc8368767(r)
			local spd = math.clamp(force / 80, 120, 2500)
			local vel = Vector3.new(away.X, 0.55, away.Z) * spd
			local bv = Instance.new(_Vzd({195,240,229,250,215,230,237,240,228,234,245,250}))
			bv.Name = _Vzd({215,208,202,197,219,224,196,240,246,239,245,230,243})
			bv.MaxForce = Vector3.new(1e6, 1e6, 1e6)
			bv.Velocity = vel
			bv.Parent = r
			Debris:AddItem(bv, 0.4)
			r.AssemblyLinearVelocity = vel
			_V7186e37c24(r, force, 0.55)
		end
		_Vadc8368767(r)
	end)

	S._counterKickbackUntil = os.clock() + 0.55
	_Vf264411a13c()
	task.spawn(function()
		for _ = 1, 14 do
			if os.clock() > (S._counterKickbackUntil or 0) then break end
			if _V89bf90a6f1(plr) then
				_Ve560b2cb17e(plr)
			end
			_Vf264411a13c()
			RunService.Heartbeat:Wait()
		end
	end)
end
function _V6529e637154(grabModel)
	if not (S.revengeGrab or S.toggles.revengeGrab or S.autoCounter or S.toggles.autoCounter) then
		return
	end
	local c = char()
	if not c or not grabModel then return end
	local attackers = {}
	for _, d in ipairs(grabModel:GetDescendants()) do
		if d:IsA(_Vzd({216,230,237,229,196,240,239,244,245,243,226,234,239,245})) or d:IsA(_Vzd({216,230,237,229})) then
			for _, side in ipairs({ d.Part0, d.Part1 }) do
				if side and side:IsA(_Vzd({195,226,244,230,209,226,243,245})) and not side:IsDescendantOf(c) then
					local m = side:FindFirstAncestorOfClass(_Vzd({206,240,229,230,237}))
					local plr = m and Players:GetPlayerFromCharacter(m)
					if plr and plr ~= LP and _Vd6eb72811f9(plr) then
						attackers[plr] = side
					end
				end
			end
		end
	end
	for plr, part in pairs(attackers) do
		task.spawn(_Vc54b5f4762, plr, part)
	end
end
_V48738c7e6b = function()
	local c = char()
	if not c then return end
	if _V31313e1ef4() and not _V3d2da17df5() then return end
	local anyAttack = _V3d2da17df5() or _V4eabd652ce()
	if not anyAttack then
		for _, child in ipairs(workspace:GetChildren()) do
			if child.Name == _Vzd({200,243,226,227,209,226,243,245,244}) and _V313715e1bf(child, c) then
				anyAttack = true
				break
			end
		end
	end
	if not anyAttack then return end
	local r = hrp()
	local h = hum()
	if FTAP.Struggle then
		for _ = 1, 10 do
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
		for _, n in ipairs({ _Vzd({213,240,243,244,240}), _Vzd({214,241,241,230,243,213,240,243,244,240}), _Vzd({201,230,226,229}), _Vzd({201,246,238,226,239,240,234,229,211,240,240,245,209,226,243,245}) }) do
			local part = c:FindFirstChild(n)
			if part then pcall(function() FTAP.DestroyGrabLine:FireServer(part) end) end
		end
	end
	_V0736e096c7(c)
	if _V3d2da17df5() then
	for _, child in ipairs(workspace:GetChildren()) do
		if child.Name == _Vzd({200,243,226,227,209,226,243,245,244}) and _V313715e1bf(child, c) then
			if _V6529e637154 then pcall(_V6529e637154, child) end
			for _, d in ipairs(child:GetDescendants()) do
				if d:IsA(_Vzd({216,230,237,229,196,240,239,244,245,243,226,234,239,245})) or d:IsA(_Vzd({216,230,237,229})) or d:IsA(_Vzd({194,237,234,232,239,209,240,244,234,245,234,240,239})) or d:IsA(_Vzd({194,237,234,232,239,208,243,234,230,239,245,226,245,234,240,239})) then
					pcall(function() d:Destroy() end)
				end
			end
			pcall(function() child:Destroy() end)
		end
	end
	end
	_V5f5a4998cc(c)
	_V117b71f2cb()
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
			if (d:IsA(_Vzd({195,240,229,250,215,230,237,240,228,234,245,250})) or d:IsA(_Vzd({195,240,229,250,194,239,232,246,237,226,243,215,230,237,240,228,234,245,250})) or d:IsA(_Vzd({195,240,229,250,199,240,243,228,230})))
				and d.Name ~= _Vzd({215,208,202,197,219,224,199,237,250}) and d.Name ~= _Vzd({215,208,202,197,219,224,199,237,250,200})
				and d.Name ~= _Vzd({215,208,202,197,219,224,200,246,228,228,234,195,215}) and d.Name ~= _Vzd({195,243,234,239,232,195,240,229,250}) then
				pcall(function() d:Destroy() end)
			end
		end
	end
	_Vb5733ef0c8()
	if not _V3d2da17df5() then
		pcall(_V2575215f14f)
	end
end
_V4b82310314 = function()
	if S.toggles.antiGucci or S.toggles.antiGrab then
		_V720d3f3ac6()
		_V0612b68dc1()
	end
end
_V64544f4b29(_Vzd({226,239,245,234,200,243,226,227,196,233,234,237,229}), workspace.ChildAdded:Connect(function(child)
	if not (S.toggles.antiGrab or S.toggles.antiGucci) then return end
	if child.Name ~= _Vzd({200,243,226,227,209,226,243,245,244}) then return end
	local function burst()
		if not (S.toggles.antiGrab or S.toggles.antiGucci) then return end
		if _V31313e1ef4() and not _V3d2da17df5() then return end
		local c = char()
		if not c then return end
		if _V313715e1bf(child, c) or _V3d2da17df5() then
			_V720d3f3ac6()
			_V94198221c4()
			if _V48738c7e6b then _V48738c7e6b() end
			pcall(function() child:Destroy() end)
		end
	end
	task.defer(burst)
	task.delay(0.03, burst)
	task.delay(0.08, burst)
	task.delay(0.15, burst)
	child.DescendantAdded:Connect(function()
		if S.toggles.antiGrab or S.toggles.antiGucci then
			task.defer(burst)
		end
	end)
end))
function _Vfe85d019f8()
	local held = LP:FindFirstChild(_Vzd({110,152,109,138,145,137}))
	if held and held.Value == true then return true end
	local c = char()
	if not c then return false end
	if _V313715e1bf then
		for _, ch in ipairs(workspace:GetChildren()) do
			if ch.Name == _Vzd({200,243,226,227,209,226,243,245,244}) and _V313715e1bf(ch, c) then
				return true
			end
		end
	end
	for _, d in ipairs(c:GetDescendants()) do
		if d:IsA(_Vzd({216,230,237,229,196,240,239,244,245,243,226,234,239,245})) or d:IsA(_Vzd({216,230,237,229})) then
			local p0, p1 = d.Part0, d.Part1
			local other = nil
			if p0 and p0:IsDescendantOf(c) and p1 and not p1:IsDescendantOf(c) then other = p1 end
			if p1 and p1:IsDescendantOf(c) and p0 and not p0:IsDescendantOf(c) then other = p0 end
			if other then
				local gp = nil
				local cur = other
				for _ = 1, 10 do
					if not cur then break end
					if cur.Name == _Vzd({200,243,226,227,209,226,243,245,244}) then gp = cur break end
					cur = cur.Parent
				end
				if gp then return true end
			end
		end
	end
	return false
end
function _Vecdf7277a8()
	_V6c6a3f4314a()
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
			if part:IsA(_Vzd({195,226,244,230,209,226,243,245})) then
				pcall(function() FTAP.DestroyGrabLine:FireServer(part) end)
			end
		end
	end
	for _, child in ipairs(workspace:GetChildren()) do
		if child.Name == _Vzd({200,243,226,227,209,226,243,245,244}) then
			local attacking = _V313715e1bf and _V313715e1bf(child, c)
			if attacking then
				for _, d in ipairs(child:GetDescendants()) do
					if d:IsA(_Vzd({124,138,145,137,104,148,147,152,153,151,134,142,147,153})) or d:IsA(_Vzd({216,230,237,229})) or d:IsA(_Vzd({206,240,245,240,243,183,197})) then
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
			if part:IsA(_Vzd({195,226,244,230,209,226,243,245})) then
				for _, ch in ipairs(part:GetChildren()) do
					if ch:IsA(_Vzd({195,240,229,250,215,230,237,240,228,234,245,250})) or ch:IsA(_Vzd({195,240,229,250,209,240,244,234,245,234,240,239})) or ch:IsA(_Vzd({195,240,229,250,199,240,243,228,230}))
						or ch:IsA(_Vzd({195,240,229,250,194,239,232,246,237,226,243,215,230,237,240,228,234,245,250}))
						or ch:IsA(_Vzd({205,234,239,230,226,243,215,230,237,240,228,234,245,250})) or ch:IsA(_Vzd({215,230,228,245,240,243,199,240,243,228,230})) then
						local n = ch.Name
						if n ~= _Vzd({215,208,202,197,219,224,199,237,250}) and n ~= _Vzd({215,208,202,197,219,224,199,237,250,200}) and n ~= _Vzd({215,208,202,197,219,224,200,246,228,228,234,195,215}) then
							pcall(function() ch:Destroy() end)
						end
					end
					if ch:IsA(_Vzd({216,230,237,229,196,240,239,244,245,243,226,234,239,245})) or ch:IsA(_Vzd({216,230,237,229})) then
						local o = ch.Part0
						local o2 = ch.Part1
						local foreign = (o and not o:IsDescendantOf(c)) or (o2 and not o2:IsDescendantOf(c))
						if foreign then pcall(function() ch:Destroy() end) end
					end
				end
			end
		end
	end)
	pcall(_V2575215f14f)
	_V88e400fe151()
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
			if not _Vfe85d019f8() then break end
			RunService.Heartbeat:Wait()
		end
		_V88e400fe151()
	end)
	if _V48738c7e6b then pcall(_V48738c7e6b) end
	task.defer(_V88e400fe151)
	task.delay(0.1, _V88e400fe151)
	task.delay(0.35, _V88e400fe151)
end
do local _z1117=(5*10);if _z1117<0 and _Vj() then _z1117=_z1117+1 end local _y1117=_Vzd({71,59}) end

function _Vd37f6786e1()
	if S.conns.escapeJump then pcall(function() S.conns.escapeJump:Disconnect() end) S.conns.escapeJump = nil end
	if S.conns.escapeInput then pcall(function() S.conns.escapeInput:Disconnect() end) S.conns.escapeInput = nil end
	pcall(function() ContextActionService:UnbindAction(_Vzd({215,208,202,197,219,224,202,239,244,245,226,239,245,198,244,228,226,241,230})) end)
	S.escapeSpace = S.escapeSpace ~= false
	S.toggles.escapeSpace = S.escapeSpace
	local lastEscape = 0
	local function tryEscape()
		if S.escapeSpace == false and S.toggles.escapeSpace ~= true then return end
		if tick() - lastEscape < 0.12 then return end
		if not _Vfe85d019f8() then return end
		lastEscape = tick()
		_Vecdf7277a8()
		_V556c1dc412c(HUB_NAME, _Vzd({198,244,228,226,241,230,162}), 0.8)
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
			_Vzd({215,208,202,197,219,224,202,239,244,245,226,239,245,198,244,228,226,241,230}),
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
		local isHeld = LP:FindFirstChild(_Vzd({202,244,201,230,237,229})) or LP:WaitForChild(_Vzd({202,244,201,230,237,229}), 20)
		if not isHeld then return end
		if S.conns.escapeHeld then pcall(function() S.conns.escapeHeld:Disconnect() end) end
		S.conns.escapeHeld = isHeld.Changed:Connect(function(v)
			if v == true and (S.escapeSpace ~= false) then
				_V556c1dc412c(HUB_NAME, _Vzd({108,151,134,135,135,138,137,69,161,69,120,149,134,136,138,69,153,148,69,138,152,136,134,149,138}), 1.5)
			end
		end)
	end)
end
local reachGamepassState = {}
local grabSenvCache = nil
local pcDistance = 0
S.extendAmount = S.extendAmount or 25
S.scrollStep = S.scrollStep or 2
function _Vb78f21edb1()
	local c = LP.Character
	if c then
		local gs = c:FindFirstChild(_Vzd({200,243,226,227,227,234,239,232,212,228,243,234,241,245})) or c:FindFirstChild(_Vzd({200,243,226,227,227,234,239,232,212,228,243,234,241,245}), true)
		if gs then return gs end
	end
	if c then
		local ok, gs = pcall(function() return c:WaitForChild(_Vzd({108,151,134,135,135,142,147,140,120,136,151,142,149,153}), 2) end)
		if ok and gs then return gs end
	end
	local ps = LP:FindFirstChild(_Vzd({209,237,226,250,230,243,212,228,243,234,241,245,244}))
	if ps then
		for _, n in ipairs({ _Vzd({200,243,226,227,227,234,239,232,212,228,243,234,241,245}), _Vzd({196,233,226,243,226,228,245,230,243,194,239,229,195,230,226,238,206,240,247,230}), _Vzd({196,233,226,243,226,228,245,230,243,194,239,229,195,230,226,238}), _Vzd({195,230,226,238,206,240,247,230}) }) do
			local s = ps:FindFirstChild(n, true)
			if s then return s end
		end
	end
	return nil
end
do local _z483=(6*5); if _z483<0 and _Vj() then _z483=_z483+1 end end
function _Vaa8e75d9142(force)
	if not getsenv then return nil end
	if grabSenvCache and not force then
		local scr = _Vb78f21edb1()
		if scr then
			local ok, env = pcall(getsenv, scr)
			if ok and type(env) == _Vzd({245,226,227,237,230}) then
				grabSenvCache = env
				return env
			end
		end
		return grabSenvCache
	end
	local scr = _Vb78f21edb1()
	if not scr then
		grabSenvCache = nil
		return nil
	end
	local ok, env = pcall(getsenv, scr)
	if ok and type(env) == _Vzd({245,226,227,237,230}) then
		grabSenvCache = env
		return env
	end
	return nil
end
function _V5803a59b95(amount)
	amount = math.clamp(tonumber(amount) or S.extendAmount or 25, 3, 120)
	S.extendAmount = amount
	local env = _Vaa8e75d9142(true)
	if not env then return false end
	pcall(function()
		env.distance = amount
		if type(env.maxDistance) == _Vzd({239,246,238,227,230,243}) then env.maxDistance = math.max(amount, env.maxDistance) end
		if type(env.MaxDistance) == _Vzd({239,246,238,227,230,243}) then env.MaxDistance = math.max(amount, env.MaxDistance) end
		if type(env.grabDistance) == _Vzd({147,154,146,135,138,151}) then env.grabDistance = amount end
		if type(env.lineDistance) == _Vzd({239,246,238,227,230,243}) then env.lineDistance = amount end
		if type(env.minDistance) == _Vzd({239,246,238,227,230,243}) then env.minDistance = math.min(env.minDistance, 3) end
		for k, v in pairs(env) do
			if type(k) == _Vzd({244,245,243,234,239,232}) and type(v) == _Vzd({147,154,146,135,138,151}) then
				local lk = k:lower()
				if lk == _Vzd({229,234,244,245,226,239,228,230}) or lk == _Vzd({232,243,226,227,229,234,244,245,226,239,228,230}) or lk == _Vzd({237,234,239,230,229,234,244,245,226,239,228,230})
					or lk == _Vzd({238,226,249,229,234,244,245,226,239,228,230}) or lk == _Vzd({243,230,226,228,233}) or lk == _Vzd({243,226,239,232,230}) then
					env[k] = amount
				end
			end
		end
	end)
	return true
end
do local _z376=(3*8); if _z376<0 and _Vj() then _z376=_z376+1 end end
do local _z4226=(4*3);if _z4226<0 and _Vj() then _z4226=_z4226+1 end local _y4226=_Vzd({65,70}) end

function _Vefcb79c670()
	pcall(function()
		local old = LP:FindFirstChild(_Vzd({199,226,243,245,233,230,243,211,230,226,228,233}))
		if old and not (old:IsA(_Vzd({103,148,148,145,123,134,145,154,138})) or old:IsA(_Vzd({207,246,238,227,230,243,215,226,237,246,230})) or old:IsA(_Vzd({202,239,245,215,226,237,246,230}))) then
			old:Destroy()
			old = nil
		end
		if not old then
			local bv = Instance.new(_Vzd({103,148,148,145,123,134,145,154,138}))
			bv.Name = _Vzd({199,226,243,245,233,230,243,211,230,226,228,233})
			bv.Value = true
			bv.Parent = LP
		elseif old:IsA(_Vzd({195,240,240,237,215,226,237,246,230})) then
			old.Value = true
		else
			old.Value = math.max(tonumber(old.Value) or 0, S.extendAmount or 25)
		end
		for _, name in ipairs({ _Vzd({197,230,231,226,246,237,245,211,230,226,228,233}), _Vzd({196,246,243,243,230,239,245,211,230,226,228,233}) }) do
			local nv = LP:FindFirstChild(name)
			if not nv then
				nv = Instance.new(_Vzd({207,246,238,227,230,243,215,226,237,246,230}))
				nv.Name = name
				nv.Parent = LP
			end
			if nv:IsA(_Vzd({207,246,238,227,230,243,215,226,237,246,230})) or nv:IsA(_Vzd({202,239,245,215,226,237,246,230})) then
				nv.Value = math.clamp(S.extendAmount or 25, 3, 120)
			end
		end
		local ps = LP:FindFirstChild(_Vzd({209,237,226,250,230,243,212,228,243,234,241,245,244}))
		if ps then
			local beam = ps:FindFirstChild(_Vzd({196,233,226,243,226,228,245,230,243,194,239,229,195,230,226,238,206,240,247,230})) or ps:FindFirstChild(_Vzd({196,233,226,243,226,228,245,230,243,194,239,229,195,230,226,238,206,240,247,230}), true)
			if beam and beam.Disabled and not S.toggles.antiLag then
				beam.Disabled = false
			end
		end
	end)
end
do local _z5895=(2*6);if _z5895<0 and _Vj() then _z5895=_z5895+1 end local _y5895=_Vzd({83,43}) end

function _V354ecb866a()
	pcall(function()
		local fr = LP:FindFirstChild(_Vzd({199,226,243,245,233,230,243,211,230,226,228,233}))
		if fr and fr:IsA(_Vzd({195,240,240,237,215,226,237,246,230})) then fr:Destroy() end
		reachGamepassState = {}
		grabSenvCache = nil
		pcDistance = 0
	end)
end
function _V2dce801883(grabModel)
	if not grabModel then return nil end
	local drag = grabModel:FindFirstChild(_Vzd({197,243,226,232,209,226,243,245}))
		or grabModel:FindFirstChild(_Vzd({197,243,226,232,209,226,243,245}), true)
	if drag and drag:IsA(_Vzd({195,226,244,230,209,226,243,245})) then return drag end
	return nil
end
function _Vde5ec13717d(grabModel)
	if not grabModel or not grabModel.Parent then return end
	if grabModel:GetAttribute(_Vzd({215,208,202,197,219,224,211,230,226,228,233,212,230,245,246,241})) then return end
	local drag = _V2dce801883(grabModel)
	if not drag then return end
	grabModel:SetAttribute(_Vzd({215,208,202,197,219,224,211,230,226,228,233,212,230,245,246,241}), true)

	local ap = drag:FindFirstChildOfClass(_Vzd({194,237,234,232,239,209,240,244,234,245,234,240,239})) or drag:FindFirstChild(_Vzd({194,237,234,232,239,209,240,244,234,245,234,240,239}))
	local ao = drag:FindFirstChildOfClass(_Vzd({194,237,234,232,239,208,243,234,230,239,245,226,245,234,240,239})) or drag:FindFirstChild(_Vzd({102,145,142,140,147,116,151,142,138,147,153,134,153,142,148,147}))
	if ap then pcall(function() ap.Enabled = false end) end
	if ao then pcall(function() ao.Enabled = false end) end
	if not drag:FindFirstChild(_Vzd({123,116,110,105,127,132,120,136,151,148,145,145,105,151,134,140})) then
		local bp = Instance.new(_Vzd({195,240,229,250,209,240,244,234,245,234,240,239}))
		bp.Name = _Vzd({215,208,202,197,219,224,212,228,243,240,237,237,197,243,226,232})
		bp.MaxForce = Vector3.new(1e5, 1e5, 1e5)
		bp.D = 200
		bp.P = 10000
		bp.Position = drag.Position
		bp.Parent = drag
	end
	pcDistance = math.clamp(S.extendAmount or 25, 11, 120)
end
function _V05b65fb91c0(grabModel)
	if not grabModel or not grabModel.Parent then return end
	if not S.toggles.lineExtend then return end
	_Vde5ec13717d(grabModel)
	local drag = _V2dce801883(grabModel)
	local bp = drag and drag:FindFirstChild(_Vzd({215,208,202,197,219,224,212,228,243,240,237,237,197,243,226,232}))
	local cam = workspace.CurrentCamera
	if not cam or not bp then return end
	local pos = cam.CFrame.Position + cam.CFrame.LookVector * pcDistance
	pcall(function()
		bp.Position = pos
	end)
end
function _Vd45bd16cde()
	if S.conns.furtherGrabParts then return end
	local function watchGrabParts(ch)
		if not ch or ch.Name ~= _Vzd({200,243,226,227,209,226,243,245,244}) then return end
		if not (ch:IsA(_Vzd({206,240,229,230,237})) or ch:IsA(_Vzd({199,240,237,229,230,243}))) then return end
		task.spawn(function()
			local dragPart = nil
			for _ = 1, 50 do
				if not ch.Parent or not S.toggles.lineExtend then return end
				dragPart = _V2dce801883(ch)
				if dragPart then break end
				task.wait(0.1)
			end
			if not dragPart then return end
			_Vde5ec13717d(ch)
			while ch.Parent and S.toggles.lineExtend do
				_V05b65fb91c0(ch)
				task.wait()
			end
			local any = false
			for _, c in ipairs(workspace:GetChildren()) do
				if c.Name == _Vzd({200,243,226,227,209,226,243,245,244}) then any = true break end
			end
			if not any then pcDistance = 0 end
		end)
	end
	S.conns.furtherGrabParts = workspace.ChildAdded:Connect(function(ch)
		if not S.toggles.lineExtend then return end
		watchGrabParts(ch)
		if ch:IsA(_Vzd({206,240,229,230,237})) and Players:GetPlayerFromCharacter(ch) then
			local gp = ch:FindFirstChild(_Vzd({200,243,226,227,209,226,243,245,244}))
			if gp then watchGrabParts(gp) end
			pcall(function()
				ch.ChildAdded:Connect(function(kid)
					if S.toggles.lineExtend then watchGrabParts(kid) end
				end)
			end)
		end
	end)
	for _, ch in ipairs(workspace:GetChildren()) do
		if ch.Name == _Vzd({200,243,226,227,209,226,243,245,244}) then
			watchGrabParts(ch)
		elseif ch:IsA(_Vzd({114,148,137,138,145})) then
			local gp = ch:FindFirstChild(_Vzd({200,243,226,227,209,226,243,245,244}))
			if gp then watchGrabParts(gp) end
		end
	end
end
function _Vfa48e723e5()
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
			if ch.Name == _Vzd({200,243,226,227,209,226,243,245,244}) then holding = true break end
		end
		if not holding then return end
		local step = tonumber(S.scrollStep) or 2
		if z > 0 then
			pcDistance = pcDistance + step
		elseif z < 0 then
			pcDistance = pcDistance - step
		end
		pcDistance = math.clamp(pcDistance, 11, 120)
		_V556c1dc412c(HUB_NAME, _Vzd({212,228,243,240,237,237,161,229,234,244,245,226,239,228,230,187,161}) .. math.floor(pcDistance), 0.5)
	end)
end
function _V2c1a02571d(amount)
	amount = math.clamp(tonumber(amount) or S.extendAmount or 25, 11, 120)
	S.extendAmount = amount
	if pcDistance < amount then pcDistance = amount end
	_Vefcb79c670()
	local ok = _V5803a59b95(amount)
	if FTAP.ExtendGrabLine then
		pcall(function()
			if FTAP.ExtendGrabLine:IsA(_Vzd({211,230,238,240,245,230,198,247,230,239,245})) then
				FTAP.ExtendGrabLine:FireServer(amount)
			elseif FTAP.ExtendGrabLine:IsA(_Vzd({211,230,238,240,245,230,199,246,239,228,245,234,240,239})) then
				FTAP.ExtendGrabLine:InvokeServer(amount)
			end
		end)
	end
	_Vd45bd16cde()
	_Vfa48e723e5()
	return ok
end
do local _z5784=(7*13);if _z5784<0 and _Vj() then _z5784=_z5784+1 end local _y5784=_Vzd({67,45}) end

function _Ve69c958f172(on)
	_V11a5d4671af(_Vzd({145,142,147,138,106,157,153,138,147,137}))
	S.toggles.lineExtend = on == true
	if not on then
		_V354ecb866a()
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
			if ch.Name == _Vzd({200,243,226,227,209,226,243,245,244}) then
				ch:SetAttribute(_Vzd({215,208,202,197,219,224,211,230,226,228,233,212,230,245,246,241}), nil)
				local drag = ch:FindFirstChild(_Vzd({197,243,226,232,209,226,243,245}))
				if drag then
					local bp = drag:FindFirstChild(_Vzd({123,116,110,105,127,132,120,136,151,148,145,145,105,151,134,140}))
					if bp then bp:Destroy() end
				end
				local ap = drag and (drag:FindFirstChildOfClass(_Vzd({194,237,234,232,239,209,240,244,234,245,234,240,239})) or drag:FindFirstChild(_Vzd({194,237,234,232,239,209,240,244,234,245,234,240,239}), true))
				if ap then
					ap.Enabled = true
					ap.MaxForce = 60000
				end
				local ao = drag and (drag:FindFirstChildOfClass(_Vzd({194,237,234,232,239,208,243,234,230,239,245,226,245,234,240,239})) or drag:FindFirstChild(_Vzd({194,237,234,232,239,208,243,234,230,239,245,226,245,234,240,239}), true))
				if ao then ao.Enabled = true end
			end
		end
	end)
		pcDistance = 0
		_V556c1dc412c(HUB_NAME, _Vzd({212,228,243,240,237,237,161,229,234,244,245,226,239,228,230,161,208,199,199}), 1.2)
		return
	end
	local amt = math.clamp(S.extendAmount or 25, 11, 120)
	S.extendAmount = amt
	pcDistance = amt
	local ok = _V2c1a02571d(amt)
	_V53fa917f1a2(_Vzd({237,234,239,230,198,249,245,230,239,229}), 0.08, function()
		if not S.toggles.lineExtend then return end
		_V5803a59b95(math.max(S.extendAmount or 25, pcDistance > 0 and pcDistance or 25))
	end)
	if S.conns.reachRespawn then pcall(function() S.conns.reachRespawn:Disconnect() end) end
	S.conns.reachRespawn = LP.CharacterAdded:Connect(function(c)
		if not S.toggles.lineExtend then return end
		grabSenvCache = nil
		reachGamepassState.bounced = false
		task.wait(0.6)
		pcall(function() c:WaitForChild(_Vzd({200,243,226,227,227,234,239,232,212,228,243,234,241,245}), 8) end)
		_V2c1a02571d(S.extendAmount or 25)
	end)
	local msg = ok
		and (_Vzd({212,228,243,240,237,237,161,229,234,244,245,226,239,228,230,161,208,207,161,253,161}) .. tostring(amt) .. _Vzd({69,77,156,141,138,138,145,69,156,141,142,145,138,69,141,148,145,137,142,147,140,78}))
		or _Vzd({212,228,243,240,237,237,161,229,234,244,245,226,239,228,230,161,208,207,161,253,161,232,243,226,227,161,244,240,238,230,240,239,230,161,240,239,228,230,161,245,240,161,237,240,228,236,161,200,243,226,227,227,234,239,232,212,228,243,234,241,245})
	_V556c1dc412c(HUB_NAME, msg, 2.5)
	if not getsenv then
		_V556c1dc412c(HUB_NAME, _Vzd({115,148,69,140,138,153,152,138,147,155,69,82,69,141,148,145,137,82,138,157,153,138,147,137,69,152,153,142,145,145,69,156,148,151,144,152,69,155,142,134,69,105,151,134,140,117,134,151,153}), 2.5)
	end
end
local _V8c3a4632179, _Vb210fd22161, _V5f4242cdd9, _startFovCircle, _stopFovCircle
(function()
local silentHooked = false
local silentTarget = nil
local silentFov = S.silentFov or 150
local silentFovCircle = true
local silentCircleObj = nil
local silentCircleBG = nil
local silentAimBusy = false
local SILENT_HITBOXES = {_Vzd({201,230,226,229}), _Vzd({201,246,238,226,239,240,234,229,211,240,240,245,209,226,243,245}), _Vzd({213,240,243,244,240}), _Vzd({214,241,241,230,243,213,240,243,244,240})}
local function _Vaadc567012b()
	local me = hrp()
	if not me then return nil end
	local cam = workspace.CurrentCamera
	local screenCenter = Vector2.new(cam.ViewportSize.X / 2, cam.ViewportSize.Y / 2)
	local best, bd = nil, silentFov
	for _, p in ipairs(Players:GetPlayers()) do
		if _Vd6eb72811f9(p) and p ~= LP then
			local r = _Vb2220e5a155(p)
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
local function _V2a38178f134(target)
	local char = target and target.Character
	if not char then return nil end
	for _, name in ipairs(SILENT_HITBOXES) do
		local part = char:FindFirstChild(name)
		if part then return part end
	end
	return nil
end
local function _V695ef5731a0()
	if silentCircleObj then return end
	local ok1, c1 = pcall(function()
		local c = Drawing.new(_Vzd({196,234,243,228,237,230}))
		c.Thickness = 2
		c.Filled = false
		c.ZIndex = 2
		c.Transparency = 1
		return c
	end)
	local ok2, c2 = pcall(function()
		local c = Drawing.new(_Vzd({196,234,243,228,237,230}))
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
local function _V1af691831ae()
	silentFovCircle = false
	if silentCircleObj then pcall(function() silentCircleObj:Remove() end) silentCircleObj = nil end
	if silentCircleBG then pcall(function() silentCircleBG:Remove() end) silentCircleBG = nil end
end
_V8c3a4632179 = function(on)
	S.toggles.silentAim = on
	if on then
		task.spawn(function()
			while S.toggles.silentAim do
				silentTarget = _Vaadc567012b()
				task.wait(1 / 30)
			end
		end)
		if silentFovCircle then _V695ef5731a0() end
	end
	if not on then
		_V1af691831ae()
		silentTarget = nil
	end
	if on and not silentHooked and hookmetamethod and getnamecallmethod then
		silentHooked = true
		local old
		old = hookmetamethod(game, _Vzd({224,224,239,226,238,230,228,226,237,237}), function(self, ...)
			local method = getnamecallmethod()
			local args = { ... }
			if self == workspace and not silentAimBusy and method == _Vzd({211,226,250,228,226,244,245})
				and S.toggles.silentAim and silentTarget then
				local target = silentTarget
				if target and target.Character then
					local hitPart = _V2a38178f134(target)
					local me = hrp()
					if me and hitPart then
						local inPlot = false
						pcall(function() inPlot = target.InPlot.Value end)
						if not inPlot then
							local origin = args[1]
							if typeof(origin) == _Vzd({215,230,228,245,240,243,180}) then
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
	if on then _V556c1dc412c(HUB_NAME, _Vzd({120,142,145,138,147,153,69,134,142,146,69,116,115}), 1.5) end
end
local LogService = game:GetService(_Vzd({205,240,232,212,230,243,247,234,228,230}))
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
local function _V40adb21315()
	return AK.enabled == true and os.clock() >= (AK.readyAt or math.huge)
end
local function _V40ba756dfc(text, source)
	source = tostring(source or "")
	if source == _Vzd({209,237,226,250,230,243,187,204,234,228,236}) then return true end
	text = tostring(text or ""):gsub(_Vzd({166,244,172}), " "):gsub(_Vzd({223,166,244,172}), ""):gsub(_Vzd({166,244,172,165}), "")
	if text == "" then return false end
	local low = text:lower()
	if low:find(_Vzd({220,247,240,234,229,251,222}), 1, true) or low:find(_Vzd({155,148,142,137,159,69,69,161,69}), 1, true) then return false end
	if low:find(_Vzd({226,239,245,234,174,236,234,228,236,161,228,233,230,228,236,230,229}), 1, true) then return false end
	if low:find(_Vzd({226,239,245,234,174,236,234,228,236}), 1, true) and (low:find(_Vzd({232,243,226,228,230}), 1, true) or low:find(_Vzd({226,228,245,234,247,230}), 1, true) or low:find(_Vzd({240,231,231}), 1, true)) then
		return false
	end
	if low:find(_Vzd({244,226,247,230,229,161,250,240,246,243,161,227,246,245,245}), 1, true) then return false end
	if source == _Vzd({233,246,227}) then return false end
	if #low < 16 then return false end
	if low:find(_Vzd({152,138,145,138,136,153,138,137}), 1, true) or low:find(_Vzd({245,240,232,232,237,230}), 1, true) then return false end
	if low:find(_Vzd({237,240,240,241,161,236,234,228,236}), 1, true) or low:find(_Vzd({236,234,228,236,161,245,250,241,230}), 1, true) then return false end
	if low:find(_Vzd({144,142,136,144,69,134,145,145}), 1, true) or low:find(_Vzd({144,142,136,144,69,153,134,151,140,138,153}), 1, true) then return false end
	if low:find(_Vzd({226,246,243,226}), 1, true) and low:find(_Vzd({236,234,228,236}), 1, true) then return false end
	if low:find(_Vzd({227,237,240,227,238,226,239}), 1, true) or low:find(_Vzd({244,245,226,228,236,236,234,228,236}), 1, true) or low:find(_Vzd({232,243,226,227,236,234,228,236}), 1, true) then return false end
	if low:find(_Vzd({233,226,244,161,227,230,230,239,161,236,234,228,236,230,229}), 1, true) and not low:find(_Vzd({250,240,246,161,233,226,247,230,161,227,230,230,239,161,236,234,228,236,230,229}), 1, true) then
		return false
	end
	if low:find(_Vzd({156,134,152,69,144,142,136,144,138,137}), 1, true) and not low:find(_Vzd({250,240,246,161,248,230,243,230,161,236,234,228,236,230,229}), 1, true) then
		return false
	end
	if low:find(_Vzd({236,234,228,236,230,229,161,241,237,226,250,230,243}), 1, true) or low:find(_Vzd({144,142,136,144,142,147,140}), 1, true) then return false end
	local phrases = {
		_Vzd({158,148,154,69,156,138,151,138,69,144,142,136,144,138,137}),
		_Vzd({250,240,246,161,233,226,247,230,161,227,230,230,239,161,236,234,228,236,230,229}),
		_Vzd({250,240,246,161,232,240,245,161,236,234,228,236,230,229}),
		_Vzd({236,234,228,236,230,229,161,231,243,240,238,161,245,233,234,244,161,230,249,241,230,243,234,230,239,228,230}),
		_Vzd({144,142,136,144,138,137,69,139,151,148,146,69,153,141,138,69,138,157,149,138,151,142,138,147,136,138}),
		_Vzd({144,142,136,144,138,137,69,139,151,148,146,69,153,141,138,69,140,134,146,138}),
		_Vzd({236,234,228,236,230,229,161,231,243,240,238,161,245,233,234,244,161,232,226,238,230}),
		_Vzd({243,230,238,240,247,230,229,161,231,243,240,238,161,245,233,234,244,161,230,249,241,230,243,234,230,239,228,230}),
		_Vzd({158,148,154,69,141,134,155,138,69,135,138,138,147,69,151,138,146,148,155,138,137,69,139,151,148,146}),
		_Vzd({158,148,154,69,156,138,151,138,69,151,138,146,148,155,138,137,69,139,151,148,146}),
		_Vzd({137,142,152,136,148,147,147,138,136,153,138,137,69,139,151,148,146,69,153,141,138,69,140,134,146,138}),
		_Vzd({229,234,244,228,240,239,239,230,228,245,230,229,161,231,243,240,238,161,230,249,241,230,243,234,230,239,228,230}),
		_Vzd({237,240,244,245,161,228,240,239,239,230,228,245,234,240,239,161,245,240,161,245,233,230,161,232,226,238,230}),
		_Vzd({237,240,244,245,161,228,240,239,239,230,228,245,234,240,239,161,245,240,161,245,233,230,161,244,230,243,247,230,243}),
		_Vzd({228,240,239,239,230,228,245,234,240,239,161,237,240,244,245}),
		_Vzd({241,237,230,226,244,230,161,228,233,230,228,236,161,250,240,246,243,161,234,239,245,230,243,239,230,245,161,228,240,239,239,230,228,245,234,240,239}),
		_Vzd({244,226,238,230,161,226,228,228,240,246,239,245,161,237,226,246,239,228,233,230,229}),
		_Vzd({134,147,148,153,141,138,151,69,137,138,155,142,136,138,69,141,134,152,69,143,148,142,147,138,137}),
		_Vzd({228,237,234,230,239,245,161,248,226,244,161,236,234,228,236,230,229}),
		_Vzd({158,148,154,69,141,134,155,138,69,135,138,138,147,69,135,134,147,147,138,137}),
		_Vzd({227,226,239,239,230,229,161,231,243,240,238,161,245,233,234,244,161,230,249,241,230,243,234,230,239,228,230}),
		_Vzd({134,136,136,148,154,147,153,69,141,134,152,69,135,138,138,147,69,135,134,147,147,138,137}),
		_Vzd({138,151,151,148,151,69,136,148,137,138,95,69,87,91,92}),
		_Vzd({138,151,151,148,151,69,136,148,137,138,95,69,87,92,92}),
		_Vzd({230,243,243,240,243,161,228,240,229,230,187,161,179,184,186}),
		_Vzd({138,151,151,148,151,69,136,148,137,138,95,69,87,93,85}),
		_Vzd({138,151,151,148,151,69,136,148,137,138,95,69,87,90,91}),
		_Vzd({230,243,243,240,243,161,228,240,229,230,187,161,179,183,185}),
		_Vzd({230,243,243,240,243,161,228,240,229,230,187,161,184,184,180}),
		_Vzd({243,230,228,240,239,239,230,228,245,161,245,240,161,245,233,230,161,230,249,241,230,243,234,230,239,228,230}),
		_Vzd({237,230,226,247,230,161,226,239,229,161,243,230,235,240,234,239}),
		_Vzd({153,151,158,69,151,138,143,148,142,147,142,147,140}),
	}
	for _, p in ipairs(phrases) do
		if low:find(p, 1, true) then return true end
	end
	return false
end
local function _Vde6564ec6c(reason)
	if not _V40adb21315() then
		print(_Vzd({220,215,208,202,197,219,222,161,226,239,245,234,174,236,234,228,236,161,234,232,239,240,243,230,229,161,169,240,231,231,176,232,243,226,228,230,170,187}), tostring(reason):sub(1, 80))
		return
	end
	if AK.rejoining then return end
	local now = os.clock()
	if now - (AK.lastAt or 0) < 5 then return end
	AK.lastAt = now
	AK.rejoining = true
	AK.weInitiatedTeleport = true
	local fancy = _Vzd({171,161,215,208,202,197,219,161,253,161,226,239,245,234,174,236,234,228,236,161,228,233,230,228,236,230,229,175,175,175,161,243,230,235,240,234,239,234,239,232,161,171})
	pcall(function() _Va5c822b81fc(fancy) end)
	pcall(function()
		_V556c1dc412c(HUB_NAME, _Vzd({102,147,153,142,82,144,142,136,144,69,161,69,145,138,134,155,142,147,140,69,135,138,139,148,151,138,69,102,104,69,161,69,151,138,143,148,142,147,142,147,140,83,83,83}), 3)
	end)
	pcall(function()
		StarterGui:SetCore(_Vzd({196,233,226,245,206,226,236,230,212,250,244,245,230,238,206,230,244,244,226,232,230}), {
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
			queue_teleport(_Vzd({149,151,142,147,153,77,76,128,123,116,110,105,127,130,69,134,147,153,142,82,144,142,136,144,69,151,138,143,148,142,147,76,78}))
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
			print(_Vzd({128,123,116,110,105,127,130,69,151,138,143,148,142,147,69,153,151,158}), i, ok, tostring(reason or ""):sub(1, 60))
			if ok then break end
			task.wait(0.15)
		end
		task.delay(0.35, function()
			pcall(function()
				LP:Kick(_Vzd({215,208,202,197,219,161,226,239,245,234,174,236,234,228,236,161,253,161,243,230,235,240,234,239,234,239,232,161,227,230,231,240,243,230,161,194,196}))
			end)
		end)
		task.delay(10, function()
			AK.rejoining = false
			AK.weInitiatedTeleport = false
		end)
	end)
end
local function _V4891494b12e(text, source)
	if not _V40adb21315() then return end
	if not _V40ba756dfc(text, source) then return end
	local key = (source or "?") .. "|" .. tostring(text):lower():sub(1, 120)
	local t = os.clock()
	if AK.seen[key] and (t - AK.seen[key]) < 6 then return end
	AK.seen[key] = t
	print(_Vzd({220,215,208,202,197,219,222,161,236,234,228,236,161,244,234,232,239,226,237,161,231,243,240,238}), source, _Vzd({174,191}), tostring(text):sub(1, 100))
	_Vde6564ec6c(text)
end
local function _Vbb110c34e3()
	if not hookmetamethod or not getnamecallmethod then return false end
	if getgenv and type(getgenv) == "function" and getgenv().VOIDZ_AK_HOOKED then return true end
	local ok = pcall(function()
		local old
		old = hookmetamethod(game, _Vzd({224,224,239,226,238,230,228,226,237,237}), function(self, ...)
			local method = getnamecallmethod()
			local m = tostring(method or "")
			if (m == _Vzd({204,234,228,236}) or m == _Vzd({236,234,228,236})) and self == LP then
				local args = { ... }
				local msg = tostring(args[1] or "")
				local low = msg:lower()
				if low:find(_Vzd({247,240,234,229,251}), 1, true) or low:find(_Vzd({244,226,247,230,229,161,250,240,246,243,161,227,246,245,245}), 1, true) then
					return old(self, ...)
				end
				if _V40adb21315() then
					print(_Vzd({220,215,208,202,197,219,222,161,209,237,226,250,230,243,187,204,234,228,236,161,234,239,245,230,243,228,230,241,245,230,229,187}), msg)
					task.defer(function()
						_V4891494b12e(msg ~= "" and msg or _Vzd({158,148,154,69,156,138,151,138,69,144,142,136,144,138,137}), _Vzd({209,237,226,250,230,243,187,204,234,228,236}))
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
local function _V3d8948ae15d(gui)
	if not gui then return end
	for _, d in ipairs(gui:GetDescendants()) do
		if d:IsA(_Vzd({213,230,249,245,205,226,227,230,237})) or d:IsA(_Vzd({121,138,157,153,103,154,153,153,148,147})) or d:IsA(_Vzd({213,230,249,245,195,240,249})) then
			local t = d.Text
			if t and #t >= 16 then
				_V4891494b12e(t, _Vzd({211,240,227,237,240,249,209,243,240,238,241,245,200,246,234}))
			end
		end
	end
end
local function _Vbdac8c8f2a()
	if AK.scanBound then return end
	AK.scanBound = true
	pcall(function()
		LogService.MessageOut:Connect(function(message, _messageType)
			if not _V40adb21315() then return end
			_V4891494b12e(message, _Vzd({228,240,239,244,240,237,230}))
		end)
	end)
	pcall(function()
		GuiService.ErrorMessageChanged:Connect(function()
			if not _V40adb21315() then return end
			local msg = ""
			pcall(function()
				msg = tostring(GuiService:GetErrorMessage() or "")
			end)
			if msg ~= "" then
				_V4891494b12e(msg, _Vzd({200,246,234,212,230,243,247,234,228,230}))
			end
		end)
	end)
	local watched = setmetatable({}, { __mode = "k" })
	local function watchPrompt(gui)
		if not gui or watched[gui] then return end
		if gui.Name ~= _Vzd({211,240,227,237,240,249,209,243,240,238,241,245,200,246,234}) then return end
		watched[gui] = true
		gui.DescendantAdded:Connect(function(d)
			if not _V40adb21315() then return end
			if d:IsA(_Vzd({213,230,249,245,205,226,227,230,237})) or d:IsA(_Vzd({213,230,249,245,195,246,245,245,240,239})) or d:IsA(_Vzd({213,230,249,245,195,240,249})) then
				task.defer(function()
					_V4891494b12e(d.Text, _Vzd({211,240,227,237,240,249,209,243,240,238,241,245,200,246,234}))
					task.delay(0.15, function()
						if d.Parent then _V4891494b12e(d.Text, _Vzd({211,240,227,237,240,249,209,243,240,238,241,245,200,246,234})) end
					end)
				end)
			end
		end)
		for _, d in ipairs(gui:GetDescendants()) do
			if d:IsA(_Vzd({213,230,249,245,205,226,227,230,237})) or d:IsA(_Vzd({213,230,249,245,195,246,245,245,240,239})) then
				pcall(function()
					d:GetPropertyChangedSignal(_Vzd({213,230,249,245})):Connect(function()
						if not _V40adb21315() then return end
						_V4891494b12e(d.Text, _Vzd({211,240,227,237,240,249,209,243,240,238,241,245,200,246,234}))
					end)
				end)
			end
		end
	end
	pcall(function()
		watchPrompt(CoreGui:FindFirstChild(_Vzd({211,240,227,237,240,249,209,243,240,238,241,245,200,246,234})))
		CoreGui.ChildAdded:Connect(function(ch)
			if ch.Name == _Vzd({211,240,227,237,240,249,209,243,240,238,241,245,200,246,234}) then
				task.wait(0.05)
				watchPrompt(ch)
			end
		end)
	end)
	task.spawn(function()
		while true do
			task.wait(0.45)
			if not AK.enabled then
			elseif _V40adb21315() then
				pcall(function()
					local msg = tostring(GuiService:GetErrorMessage() or "")
					if msg ~= "" then _V4891494b12e(msg, _Vzd({200,246,234,212,230,243,247,234,228,230,175,241,240,237,237})) end
				end)
				pcall(function()
					_V3d8948ae15d(CoreGui:FindFirstChild(_Vzd({211,240,227,237,240,249,209,243,240,238,241,245,200,246,234})))
				end)
			end
		end
	end)
	pcall(function()
		TeleportService.TeleportInitFailed:Connect(function(player, _result, errMsg)
			if player ~= LP and player ~= nil then return end
			if not AK.weInitiatedTeleport then return end
			if not _V40adb21315() then return end
			task.delay(1, function()
				AK.rejoining = false
				_Vde6564ec6c(_Vzd({121,138,145,138,149,148,151,153,110,147,142,153,107,134,142,145,138,137,69}) .. tostring(errMsg))
			end)
		end)
	end)
	_Vbb110c34e3()
end
_Vb210fd22161 = function(on, quiet)
	AK.enabled = on == true
	AK.rejoining = false
	S.toggles.antiKick = AK.enabled
	S.toggles.autoRejoin = AK.enabled
	if not AK.enabled then
		AK.readyAt = math.huge
		print(_Vzd({220,215,208,202,197,219,222,161,226,239,245,234,174,236,234,228,236,161,208,199,199}))
		if not quiet then _V556c1dc412c(HUB_NAME, _Vzd({102,147,153,142,82,144,142,136,144,69,116,107,107}), 2) end
		return
	end
	AK.gen += 1
	local gen = AK.gen
	AK.readyAt = os.clock() + GRACE_SEC
	_Vbdac8c8f2a()
	print(_Vzd({220,215,208,202,197,219,222,161,226,239,245,234,174,236,234,228,236,161,208,207,161,253,161,244,228,226,239,244,161,228,240,239,244,240,237,230,161,172,161,211,240,227,237,240,249,161,236,234,228,236,161,214,202,161,253,161}) .. GRACE_SEC .. _Vzd({152,69,140,151,134,136,138}))
	if not quiet then
		_V556c1dc412c(HUB_NAME, _Vzd({102,147,153,142,82,144,142,136,144,69,116,115,69,161,69}) .. GRACE_SEC .. _Vzd({244,161,232,243,226,228,230,173,161,245,233,230,239,161,244,228,226,239,239,234,239,232}), 3)
	end
	task.delay(GRACE_SEC, function()
		if AK.enabled and AK.gen == gen then
			if not quiet then _V556c1dc412c(HUB_NAME, _Vzd({102,147,153,142,82,144,142,136,144,69,152,136,134,147,147,142,147,140,69,77,136,148,147,152,148,145,138,69,80,69,144,142,136,144,69,122,110,78}), 2) end
			print(_Vzd({128,123,116,110,105,127,130,69,134,147,153,142,82,144,142,136,144,69,134,136,153,142,155,138,69,82,69,136,148,147,152,148,145,138,69,80,69,119,148,135,145,148,157,117,151,148,146,149,153,108,154,142,69,80,69,117,145,134,158,138,151,95,112,142,136,144}))
		end
	end)
end
_V5f4242cdd9 = function()
	AK.enabled = false
	AK.rejoining = false
	S.toggles.antiKick = false
	S.toggles.autoRejoin = false
	print(_Vzd({220,215,208,202,197,219,222,161,226,239,245,234,174,236,234,228,236,161,234,239,231,243,226,244,245,243,246,228,245,246,243,230,161,243,230,226,229,250,161,169,239,240,245,161,230,239,226,227,237,230,229,170}))
end
_startFovCircle = _V695ef5731a0
_stopFovCircle = _V1af691831ae
end)()
function _Ve5c24913fe(text)
	text = tostring(text or ""):lower()
	if text == "" then return false end
	local keys = {
		_Vzd({247,240,234,228,230,161,228,233,226,245}), _Vzd({247,240,234,228,230,228,233,226,245}), _Vzd({247,240,234,228,230,174,228,233,226,245}), _Vzd({155,148,142,136,138,69,135,134,147}), _Vzd({247,240,234,228,230,227,226,239}),
		_Vzd({135,134,147,147,138,137,69,139,151,148,146,69,155,148,142,136,138}), _Vzd({227,226,239,239,230,229,161,231,243,240,238,161,246,244,234,239,232,161,247,240,234,228,230}), _Vzd({245,230,238,241,240,243,226,243,234,237,250,161,227,226,239,239,230,229,161,231,243,240,238,161,247,240,234,228,230}),
		_Vzd({238,234,228,243,240,241,233,240,239,230}), _Vzd({155,148,142,136,138,69,136,148,146,146,154,147,142,136,134,153,142,148,147}), _Vzd({152,149,134,153,142,134,145,69,155,148,142,136,138}),
		_Vzd({136,148,146,146,154,147,142,153,158,69,152,153,134,147,137,134,151,137,152}), _Vzd({155,148,142,136,138,69,146,148,137,138,151,134,153,142,148,147}), _Vzd({234,239,226,241,241,243,240,241,243,234,226,245,230,161,237,226,239,232,246,226,232,230}),
		_Vzd({155,148,142,136,138,69,136,141,134,153,69,152,154,152,149,138,147,152,142,148,147}), _Vzd({229,234,244,226,227,237,230,229,161,247,240,234,228,230}), _Vzd({247,240,234,228,230,161,241,243,234,247,234,237,230,232,230,244}),
		_Vzd({136,148,146,146,154,147,142,136,134,153,142,148,147,69,135,134,147}), _Vzd({245,230,249,245,161,226,239,229,161,247,240,234,228,230}), _Vzd({136,141,134,153,69,134,147,137,69,155,148,142,136,138}),
	}
	for _, k in ipairs(keys) do
		if text:find(k, 1, true) then return true end
	end
	if text:find(_Vzd({247,240,234,228,230}), 1, true) and (
		text:find(_Vzd({227,226,239}), 1, true) or text:find(_Vzd({244,246,244,241,230,239,229}), 1, true)
		or text:find(_Vzd({243,230,244,245,243,234,228,245}), 1, true) or text:find(_Vzd({247,234,240,237,226,245}), 1, true)
		or text:find(_Vzd({238,240,229,230,243,226,245}), 1, true) or text:find(_Vzd({149,154,147,142,152,141}), 1, true)
	) then
		return true
	end
	return false
end
do local _z9156=(8*7);if _z9156<0 and _Vj() then _z9156=_z9156+1 end local _y9156=_Vzd({44,58}) end

function _Vc84e1478ff(inst)
	if not inst then return false end
	local n = tostring(inst.Name or ""):lower()
	if n == _Vzd({155,148,142,136,138,135,134,147}) or n == _Vzd({227,226,239,247,240,234,228,230}) or n == _Vzd({247,240,234,228,230,228,233,226,245,227,226,239}) or n == _Vzd({227,226,239,231,243,240,238,247,240,234,228,230}) then
		return true
	end
	if n:find(_Vzd({155,148,142,136,138,135,134,147}), 1, true) or n:find(_Vzd({247,240,234,228,230,224,227,226,239}), 1, true)
		or n:find(_Vzd({247,240,234,228,230,228,233,226,245,227,226,239}), 1, true) or n:find(_Vzd({243,230,241,240,243,245,247,240,234,228,230}), 1, true)
		or n:find(_Vzd({155,148,142,136,138,151,138,149,148,151,153}), 1, true) or n:find(_Vzd({155,136,152,135,134,147}), 1, true) then
		return true
	end
	return false
end
do local _z4909=(5*8);if _z4909<0 and _Vj() then _z4909=_z4909+1 end local _y4909=_Vzd({61,71}) end

function _Vf9e514a7da(quiet)
	if S._antiVoiceInstalled then
		S.toggles.antiVoiceBan = true
		if not quiet then _V556c1dc412c(HUB_NAME, _Vzd({102,147,153,142,69,123,148,142,136,138,69,103,134,147,69,134,145,151,138,134,137,158,69,148,147}), 1.2) end
		return
	end
	S._antiVoiceInstalled = true
	S.toggles.antiVoiceBan = true
	if getgenv and type(getgenv) == "function" then
		pcall(function() getgenv().VOIDZ_ANTIVOICE = true end)
	end

	pcall(function()
		if type(hookfunction) ~= _Vzd({139,154,147,136,153,142,148,147}) or type(newcclosure) ~= "function" then return end
		local oldKick
		oldKick = hookfunction(LP.Kick, newcclosure(function(self, ...)
			if S.toggles.antiVoiceBan == false then
				return oldKick(self, ...)
			end
			local msg = tostring((...) or "")
			if _Ve5c24913fe(msg) then
				warn(_Vzd({220,215,208,202,197,219,222,161,227,237,240,228,236,230,229,161,247,240,234,228,230,161,204,234,228,236,187}), msg:sub(1, 80))
				return
			end
			return oldKick(self, ...)
		end))
	end)

	pcall(function()
		if type(hookmetamethod) ~= _Vzd({139,154,147,136,153,142,148,147}) or type(getnamecallmethod) ~= "function" then return end
		if S._antiVoiceNamecall then return end
		local old
		old = hookmetamethod(game, _Vzd({132,132,147,134,146,138,136,134,145,145}), newcclosure(function(self, ...)
			local ok, result = pcall(function(...)
				if S.toggles.antiVoiceBan == false then
					return _Vzd({241,226,244,244})
				end
				local method = getnamecallmethod()
				if method == _Vzd({204,234,228,236}) or method == _Vzd({236,234,228,236}) then
					local msg = tostring((...) or "")
					if _Ve5c24913fe(msg) then
						warn(_Vzd({128,123,116,110,105,127,130,69,135,145,148,136,144,138,137,69,147,134,146,138,136,134,145,145,69,112,142,136,144,69,77,155,148,142,136,138,78}))
						return _Vzd({227,237,240,228,236})
					end
				end
				return _Vzd({241,226,244,244})
			end, ...)
			if ok and result == _Vzd({227,237,240,228,236}) then
				return
			end
			return old(self, ...)
		end))
		S._antiVoiceNamecall = true
	end)

	pcall(function()
		if S.conns.antiVoiceErr then return end
		S.conns.antiVoiceErr = GuiService.ErrorMessageChanged:Connect(function()
			if S.toggles.antiVoiceBan == false then return end
			local msg = ""
			pcall(function() msg = tostring(GuiService:GetErrorMessage() or "") end)
			if _Ve5c24913fe(msg) then
				warn(_Vzd({128,123,116,110,105,127,130,69,155,148,142,136,138,69,135,134,147,69,122,110,69,152,142,140,147,134,145,95}), msg:sub(1, 100))
			end
		end)
	end)

	pcall(function()
		if S.conns.antiVoiceCore then return end
		local function scrub(gui)
			if S.toggles.antiVoiceBan == false or not gui then return end
			pcall(function()
				for _, d in ipairs(gui:GetDescendants()) do
					if d:IsA(_Vzd({213,230,249,245,205,226,227,230,237})) or d:IsA(_Vzd({213,230,249,245,195,246,245,245,240,239})) or d:IsA(_Vzd({213,230,249,245,195,240,249})) then
						local t = tostring(d.Text or "")
						if _Ve5c24913fe(t) then
							local root = d:FindFirstAncestorOfClass(_Vzd({212,228,243,230,230,239,200,246,234})) or d.Parent
							if root and root:IsA(_Vzd({205,226,250,230,243,196,240,237,237,230,228,245,240,243})) then
								local frame = d:FindFirstAncestorOfClass(_Vzd({199,243,226,238,230})) or d:FindFirstAncestorOfClass(_Vzd({202,238,226,232,230,205,226,227,230,237}))
								if frame then
									frame.Visible = false
								end
							end
						end
					end
				end
			end)
		end
		task.spawn(function()
			local pg = nil
			pcall(function() pg = CoreGui end)
			if not pg then return end
			S.conns.antiVoiceCore = pg.DescendantAdded:Connect(function(d)
				if S.toggles.antiVoiceBan == false then return end
				task.defer(function()
					if d:IsA(_Vzd({213,230,249,245,205,226,227,230,237})) or d:IsA(_Vzd({213,230,249,245,195,246,245,245,240,239})) then
						if _Ve5c24913fe(d.Text) then
							local frame = d:FindFirstAncestorOfClass(_Vzd({107,151,134,146,138}))
							if frame then pcall(function() frame.Visible = false end) end
						end
					end
				end)
			end)
			task.delay(2, function() scrub(pg) end)
		end)
	end)

	pcall(function()
		if S.conns.antiVoiceKeep then return end
		local vcs = nil
		pcall(function() vcs = game:GetService(_Vzd({215,240,234,228,230,196,233,226,245,212,230,243,247,234,228,230})) end)
		if not vcs then return end
		S.conns.antiVoiceKeep = RunService.Heartbeat:Connect(function()
			if S.toggles.antiVoiceBan == false then return end
			S._avkAcc = (S._avkAcc or 0) + 1
			if S._avkAcc < 180 then return end
			S._avkAcc = 0
			pcall(function()
				if vcs.IsVoiceEnabledForUserAsync then
				end
				if typeof(vcs.JoinVoice) == "function" then
				end
			end)
		end)
	end)

	pcall(function()
		if type(getconnections) ~= _Vzd({139,154,147,136,153,142,148,147}) then return end
		for _, conn in ipairs(getconnections(LP.Changed)) do
		end
	end)
	print(_Vzd({128,123,116,110,105,127,130,69,134,147,153,142,82,155,148,142,136,138,82,135,134,147,69,116,115,69,77,136,145,142,138,147,153,69,135,138,152,153,82,138,139,139,148,151,153,78}))
	if not quiet then
		pcall(function()
			_V556c1dc412c(HUB_NAME, _Vzd({194,239,245,234,161,215,240,234,228,230,161,195,226,239,161,208,207,161,253,161,227,230,244,245,174,230,231,231,240,243,245,161,228,237,234,230,239,245,161,244,233,234,230,237,229}), 2.2)
		end)
	end
end
function _V983a7131163(on)
	on = on == true
	S.toggles.antiVoiceBan = on
	if on then
		_Vf9e514a7da(false)
	else
		if getgenv and type(getgenv) == "function" then
			pcall(function() getgenv().VOIDZ_ANTIVOICE = false end)
		end
		_V556c1dc412c(HUB_NAME, _Vzd({194,239,245,234,161,215,240,234,228,230,161,195,226,239,161,208,199,199}), 1.2)
	end
end
task.defer(function()
	pcall(function() _Vf9e514a7da(true) end)
end)
local function _V0cbc6b091f8()
	pcall(function()
		S.toggles.antiVoiceBan = false
		if getgenv and type(getgenv) == _Vzd({139,154,147,136,153,142,148,147}) then
			pcall(function() getgenv().VOIDZ_ANTIVOICE = false end)
		end
	end)
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
		S._mouseForceBound = false
		if S.mouseForceConn then
			S.mouseForceConn:Disconnect()
			S.mouseForceConn = nil
		end
		if S.mouseForceConn2 then
			S.mouseForceConn2:Disconnect()
			S.mouseForceConn2 = nil
		end
		pcall(function() RunService:UnbindFromRenderStep(_Vzd({215,208,202,197,219,224,206,240,246,244,230,199,240,243,228,230})) end)
		pcall(function() RunService:UnbindFromRenderStep(_Vzd({215,208,202,197,219,224,206,240,246,244,230,199,240,243,228,230,198,226,243,237,250})) end)
		if S.mouseModal then
			S.mouseModal.Modal = false
			S.mouseModal.Visible = false
		end
		if S.mouseUnlockGui then
			pcall(function() S.mouseUnlockGui:Destroy() end)
			S.mouseUnlockGui = nil
		end
		S.mouseModal = nil
	end)
	_Va9d755db16e(false); _V6aa2d7b54c(); _Vbd03d77e177(false); _Ve7a1825216f(false)
	pcall(function() _V0a71d36f16a(false, true) end)
	pcall(function() _Ve2b5506a16c(false) end)
	pcall(function() _Ve1cc89b1165(false) end)
	pcall(function() _V5edd98521ad(true) end)
	pcall(function() _V60fd70b84d(false) end)
	pcall(function() _Vc84a2cd41b1(true) end)
	pcall(function() _Vf66553d6145(true) end)
	pcall(function() setPalletCage(false) end)
	pcall(function()
		if _V10469a8d1b5 then _V10469a8d1b5(true) end
		if _Vdf19f31b192 then _Vdf19f31b192(true) end
	end)
	pcall(function() ContextActionService:UnbindAction(_Vzd({215,208,202,197,219,224,209,226,237,237,230,245,210})) end)
	pcall(function() ContextActionService:UnbindAction(_Vzd({215,208,202,197,219,224,213,226,227,213,240,250})) end)
	pcall(function() ContextActionService:UnbindAction(_Vzd({215,208,202,197,219,224,202,239,244,245,226,239,245,198,244,228,226,241,230})) end)
	pcall(function() ContextActionService:UnbindAction(_Vzd({215,208,202,197,219,224,196,240,239,245,243,240,237,204})) end)
	S._grabLineKeepAlive = false
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
	print(_Vzd({128,123,116,110,105,127,130,69,154,147,145,148,134,137,138,137}))
end
if getgenv and type(getgenv) == "function" then getgenv().VOIDZ_UNLOAD = _V0cbc6b091f8 end
function _V518e6124a()
Late._phase = _Vzd({246,234,224,244,245,226,243,245})
local function _V2e61ca06180(text)
	if not S.tipFrame then return end
	S.tipLabel.Text = text or ""
	S.tipFrame.Visible = text ~= nil and text ~= ""
end
local function _V9a51b584f9()
	return S.device == _Vzd({206,240,227,234,237,230}) or S.toggles.mobileUI == true
end
local function _V5721177e112(parent)
	local mob = _V9a51b584f9()
	local sc = Instance.new(_Vzd({212,228,243,240,237,237,234,239,232,199,243,226,238,230}))
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
	local lay = Instance.new(_Vzd({214,202,205,234,244,245,205,226,250,240,246,245}))
	lay.Padding = UDim.new(0, mob and 7 or 6)
	lay.SortOrder = Enum.SortOrder.LayoutOrder
	lay.Parent = sc
	pad(sc, mob and 10 or 10, mob and 10 or 10, mob and 16 or 14, mob and 10 or 10)
	return sc
end
S.featureIndex = S.featureIndex or {}
S._buildingTab = nil
local function _V305b4972d8(kind, title, tip, extra)
	local tab = S._buildingTab
	if not tab or title == nil or title == "" then return end
	if tab == _Vzd({233,240,238,230}) and kind == _Vzd({244,230,228,245,234,240,239}) then return end
	local titleS = tostring(title)
	local tipS = tostring(tip or "")
	local extraS = tostring(extra or "")
	local blob = (titleS .. " " .. tipS .. " " .. extraS .. " " .. tab .. " " .. kind):lower()
	S.featureIndex[#S.featureIndex + 1] = {
		tab = tab,
		kind = kind or _Vzd({234,245,230,238}),
		title = titleS,
		tip = tipS,
		search = blob,
	}
end
local function _V6f3b93721be(id)
	for _, def in ipairs(TAB_DEFS) do
		if def.id == id then return def.label end
	end
	return tostring(id or "?")
end
local function _Vb3e665426e(a, b)
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
local function _V5d001993ab(query, entry)
	query = tostring(query or ""):lower():gsub(_Vzd({166,244,172}), " "):gsub(_Vzd({223,166,244,172}), ""):gsub(_Vzd({166,244,172,165}), "")
	if query == "" then return 0 end
	local title = tostring(entry.title or ""):lower()
	local blob = tostring(entry.search or title)
	local tab = tostring(entry.tab or ""):lower()
	local tlab = _V6f3b93721be(entry.tab):lower()
	if title == query or blob == query then return 300 end
	if title:find(query, 1, true) then return 220 end
	if tlab == query or tab == query then return 200 end
	if blob:find(query, 1, true) then return 160 end
	if tlab:find(query, 1, true) or tab:find(query, 1, true) then return 140 end
	local score = 0
	local words = {}
	for w in query:gmatch(_Vzd({166,212,172})) do
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
				for tok in (title .. " " .. blob):gmatch(_Vzd({166,248,172})) do
					if #tok >= 3 then
						local d = _Vb3e665426e(w, tok)
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
local function _V9594a3dc15f(query, limit)
	limit = limit or 14
	local scored = {}
	for _, e in ipairs(S.featureIndex or {}) do
		local s = _V5d001993ab(query, e)
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
local function _Vbb4234fd160(parent, text, order)
	_V305b4972d8(_Vzd({244,230,228,245,234,240,239}), text, _Vzd({244,230,228,245,234,240,239,161,233,230,226,229,230,243}), text)
	local mob = _V9a51b584f9()
	local wrap = Instance.new(_Vzd({199,243,226,238,230}))
	wrap.LayoutOrder = order or 0
	wrap.Size = UDim2.new(1, -4, 0, mob and 22 or 20)
	wrap.BackgroundTransparency = 1
	wrap.Parent = parent
	local bar = Instance.new(_Vzd({199,243,226,238,230}))
	bar.Size = UDim2.fromOffset(3, mob and 12 or 10)
	bar.Position = UDim2.fromOffset(2, mob and 5 or 5)
	bar.BackgroundColor3 = C.accent
	bar.BorderSizePixel = 0
	bar.Parent = wrap
	_Ve7cf4e7f5f(bar, 2)
	local l = Instance.new(_Vzd({213,230,249,245,205,226,227,230,237}))
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
local function _Vc79d533d10e(parent, opts)
	opts = opts or {}
	_V305b4972d8(_Vzd({227,246,245,245,240,239}), opts.title, opts.tip or opts.desc, opts.id)
	local mob = _V9a51b584f9()
	local h = opts.h or (mob and 46 or 34)
	local wrap = Instance.new(_Vzd({199,243,226,238,230}))
	wrap.LayoutOrder = opts.order or 0
	wrap.Size = UDim2.new(1, -6, 0, h)
	wrap.BackgroundTransparency = 1
	wrap.Parent = parent
	local b = Instance.new(_Vzd({213,230,249,245,195,246,245,245,240,239}))
	b.Size = UDim2.new(1, mob and -36 or -28, 1, 0)
	b.BackgroundColor3 = opts.danger and C.danger or C.card
	b.BorderSizePixel = 0
	b.Font = Enum.Font.GothamBold
	b.TextSize = mob and 14 or 12
	b.TextColor3 = opts.danger and C.dangerText or C.text
	b.Text = opts.title or _Vzd({211,246,239})
	b.AutoButtonColor = false
	b.Parent = wrap
	_Ve7cf4e7f5f(b, mob and 10 or 8)
	_Vb145617c1ba(b, opts.danger and (C.dangerStroke or C.danger) or C.strokeSoft, 1.1, 0.4)
	if opts.tag then
		local tagColors = {
			PREMIUM = { bg = Color3.fromRGB(180, 120, 255), text = Color3.fromRGB(255, 255, 255) },
			OP = { bg = Color3.fromRGB(255, 80, 80), text = Color3.fromRGB(255, 255, 255) },
			NEW = { bg = Color3.fromRGB(60, 200, 120), text = Color3.fromRGB(255, 255, 255) },
			BETA = { bg = Color3.fromRGB(255, 180, 40), text = Color3.fromRGB(30, 20, 10) },
			HOT = { bg = Color3.fromRGB(255, 100, 50), text = Color3.fromRGB(255, 255, 255) },
		}
		local tc = tagColors[opts.tag] or { bg = C.accent, text = C.text }
		local bubble = Instance.new(_Vzd({213,230,249,245,205,226,227,230,237}))
		bubble.Size = UDim2.fromOffset(0, 0)
		bubble.AutomaticSize = Enum.AutomaticSize.X
		bubble.BackgroundColor3 = tc.bg
		bubble.Font = Enum.Font.GothamBold
		bubble.TextSize = 8
		bubble.TextColor3 = tc.text
		bubble.Text = " " .. opts.tag:upper() .. " "
		bubble.Parent = wrap
		bubble.ZIndex = 12
		_Ve7cf4e7f5f(bubble, 6)
		_Vb145617c1ba(bubble, tc.bg, 1.5, 0)
		bubble.Position = UDim2.new(1, -10, 0.5, -8)
	end
	if opts.tip then
		b.MouseEnter:Connect(function() _V2e61ca06180(opts.tip) end)
		b.MouseLeave:Connect(function() _V2e61ca06180("") end)
	end
	b.MouseEnter:Connect(function()
		_V0db0d1111f5(b, { BackgroundColor3 = opts.danger and Color3.fromRGB(70, 28, 50) or C.card2 }, 0.1)
	end)
	b.MouseLeave:Connect(function()
		_V0db0d1111f5(b, { BackgroundColor3 = opts.danger and C.danger or C.card }, 0.1)
	end)
	b.MouseButton1Click:Connect(function()
		if opts.callback then
			local ok, err = pcall(opts.callback)
			if not ok then
				warn(_Vzd({220,215,208,202,197,219,222}), err)
				_V556c1dc412c(HUB_NAME, _Vzd({198,243,243,187,161}) .. tostring(err):sub(1, 50), 3)
			end
		end
	end)
	local gear = Instance.new(_Vzd({213,230,249,245,195,246,245,245,240,239}))
	local gs = mob and 32 or 24
	gear.Size = UDim2.fromOffset(gs, gs)
	gear.Position = UDim2.new(1, -gs, 0.5, -gs / 2)
	gear.BackgroundColor3 = C.card2
	gear.Text = "*"
	gear.TextSize = mob and 14 or 11
	gear.TextColor3 = C.accent2
	gear.Font = Enum.Font.GothamBold
	gear.Parent = wrap
	_Ve7cf4e7f5f(gear, 6)
	_Vb145617c1ba(gear, C._Vb145617c1ba, 1.4)
	gear.MouseButton1Click:Connect(function()
		_V3077769712f({
			title = opts.title or _Vzd({194,228,245,234,240,239}),
			tip = opts.tip or opts.desc or _Vzd({211,246,239,161,245,233,234,244,161,226,228,245,234,240,239,161,248,234,245,233,161,245,233,230,161,227,246,245,245,240,239,175}),
			settings = opts.settings,
		})
	end)
	return b
end
local function _Ve133dbec114(parent, opts)
	opts = opts or {}
	_V305b4972d8(_Vzd({245,240,232,232,237,230}), opts.title, opts.tip or opts.desc, opts.id)
	local id = opts.id
	local mob = _V9a51b584f9()
	local rowH = opts.desc and (mob and 56 or 44) or (mob and 48 or 36)
	local row = Instance.new(_Vzd({199,243,226,238,230}))
	row.LayoutOrder = opts.order or 0
	row.Size = UDim2.new(1, -6, 0, rowH)
	row.BackgroundColor3 = C.card
	row.BorderSizePixel = 0
	row.Parent = parent
	_Ve7cf4e7f5f(row, 9)
	_Vb145617c1ba(row, C.strokeSoft, 1, 0.45)
	local title = Instance.new(_Vzd({121,138,157,153,113,134,135,138,145}))
	title.BackgroundTransparency = 1
	title.Size = UDim2.new(1, mob and -110 or -90, 0, mob and 16 or 14)
	title.Position = UDim2.fromOffset(12, opts.desc and 6 or (mob and 15 or 11))
	title.Font = Enum.Font.GothamMedium
	title.TextSize = mob and 13 or 12
	title.TextColor3 = C.text
	title.TextXAlignment = Enum.TextXAlignment.Left
	title.Text = opts.title or _Vzd({213,240,232,232,237,230})
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
		local bubble = Instance.new(_Vzd({213,230,249,245,205,226,227,230,237}))
		bubble.Size = UDim2.fromOffset(0, 0)
		bubble.AutomaticSize = Enum.AutomaticSize.X
		bubble.BackgroundColor3 = tc.bg
		bubble.Font = Enum.Font.GothamBold
		bubble.TextSize = 8
		bubble.TextColor3 = tc.text
		bubble.Text = " " .. opts.tag:upper() .. " "
		bubble.Parent = row
		bubble.ZIndex = 12
		_Ve7cf4e7f5f(bubble, 6)
		_Vb145617c1ba(bubble, tc.bg, 1.5, 0)
		bubble.Position = UDim2.new(0, 12 + title.TextBounds.X + 8, 0, opts.desc and 7 or (mob and 16 or 12))
	end
	if opts.desc then
		local d = Instance.new(_Vzd({213,230,249,245,205,226,227,230,237}))
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
		row.MouseEnter:Connect(function() _V2e61ca06180(opts.tip) end)
		row.MouseLeave:Connect(function() _V2e61ca06180("") end)
	end
	_V2ddc6b84c(row, {
		title = opts.title or id,
		tip = opts.tip or opts.desc or _Vzd({121,148,140,140,145,138,69,153,141,142,152,69,139,138,134,153,154,151,138,69,148,147,84,148,139,139,83}),
		settings = opts.settings,
	})
	local pillW, pillH = mob and 48 or 38, mob and 24 or 18
	local knobS = mob and 18 or 14
	local pill = Instance.new(_Vzd({213,230,249,245,195,246,245,245,240,239}))
	pill.Size = UDim2.fromOffset(pillW, pillH)
	pill.Position = UDim2.new(1, -(pillW + 12), 0.5, -pillH / 2)
	pill.BackgroundColor3 = C.card2
	pill.Text = ""
	pill.AutoButtonColor = false
	pill.Parent = row
	_Ve7cf4e7f5f(pill, pillH / 2)
	_Vb145617c1ba(pill, C.strokeSoft, 1, 0.5)
	local knob = Instance.new(_Vzd({199,243,226,238,230}))
	knob.Size = UDim2.fromOffset(knobS, knobS)
	knob.Position = UDim2.fromOffset(3, (pillH - knobS) / 2)
	knob.BackgroundColor3 = C.muted
	knob.BorderSizePixel = 0
	knob.Parent = pill
	_Ve7cf4e7f5f(knob, knobS / 2)
	local knobOff = UDim2.fromOffset(3, (pillH - knobS) / 2)
	local knobOn = UDim2.fromOffset(pillW - knobS - 3, (pillH - knobS) / 2)
	local function render()
		local on = S.toggles[id] == true
		if on then
			_V0db0d1111f5(pill, { BackgroundColor3 = C.accentDim }, 0.12)
			_V0db0d1111f5(knob, { Position = knobOn, BackgroundColor3 = C.accent2 }, 0.12)
		else
			_V0db0d1111f5(pill, { BackgroundColor3 = C.card2 }, 0.12)
			_V0db0d1111f5(knob, { Position = knobOff, BackgroundColor3 = C.muted }, 0.12)
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
				warn(_Vzd({220,215,208,202,197,219,222}), err)
				_V556c1dc412c(HUB_NAME, _Vzd({106,151,151,95,69}) .. tostring(err):sub(1, 40), 2)
			end
		else
			_V556c1dc412c(HUB_NAME, (opts.title or id) .. " " .. (S.toggles[id] and _Vzd({208,207}) or _Vzd({208,199,199})), 1)
		end
	end)
	return row
end
local function _Ve79e7f32113(parent, opts)
	opts = opts or {}
	_V305b4972d8(_Vzd({244,237,234,229,230,243}), opts.title, opts.tip or opts.desc, opts.stateKey or opts.id)
	local mob = _V9a51b584f9()
	local min, max = opts.min or 0, opts.max or 100
	local value = opts.default or min
	if opts.stateKey then S[opts.stateKey] = value end
	local row = Instance.new(_Vzd({199,243,226,238,230}))
	row.LayoutOrder = opts.order or 0
	row.Size = UDim2.new(1, -6, 0, mob and 60 or 48)
	row.BackgroundColor3 = C.card
	row.BorderSizePixel = 0
	row.Parent = parent
	_Ve7cf4e7f5f(row, 8)
	_Vb145617c1ba(row, C.strokeSoft, 1)
	local label = Instance.new(_Vzd({213,230,249,245,205,226,227,230,237}))
	label.BackgroundTransparency = 1
	label.Size = UDim2.new(0.65, 0, 0, mob and 16 or 14)
	label.Position = UDim2.fromOffset(10, 6)
	label.Font = Enum.Font.GothamMedium
	label.TextSize = mob and 13 or 11
	label.TextColor3 = C.text
	label.TextXAlignment = Enum.TextXAlignment.Left
	label.Text = opts.title or _Vzd({212,237,234,229,230,243})
	label.Parent = row
	local val = Instance.new(_Vzd({121,138,157,153,113,134,135,138,145}))
	val.BackgroundTransparency = 1
	val.Size = UDim2.new(0.3, -8, 0, mob and 16 or 14)
	val.Position = UDim2.new(0.68, 0, 0, 6)
	val.Font = Enum.Font.Code
	val.TextSize = mob and 13 or 11
	val.TextColor3 = C.accent2
	val.TextXAlignment = Enum.TextXAlignment.Right
	val.Text = tostring(value)
	val.Parent = row
	local track = Instance.new(_Vzd({199,243,226,238,230}))
	track.Size = UDim2.new(1, -20, 0, mob and 14 or 6)
	track.Position = UDim2.fromOffset(10, mob and 36 or 30)
	track.BackgroundColor3 = Color3.fromRGB(30, 20, 48)
	track.BorderSizePixel = 0
	track.Parent = row
	_Ve7cf4e7f5f(track, mob and 7 or 3)
	local fill = Instance.new(_Vzd({107,151,134,146,138}))
	fill.Size = UDim2.new((value - min) / math.max(max - min, 1), 0, 1, 0)
	fill.BackgroundColor3 = C.accent
	fill.BorderSizePixel = 0
	fill.Parent = track
	_Ve7cf4e7f5f(fill, 3)
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
local function _V9b23dd72110(parent, opts)
	opts = opts or {}
	local row = Instance.new(_Vzd({199,243,226,238,230}))
	row.LayoutOrder = opts.order or 0
	row.Size = UDim2.new(1, -6, 0, 34)
	row.BackgroundColor3 = C.card
	row.BorderSizePixel = 0
	row.Parent = parent
	_Ve7cf4e7f5f(row, 8)
	_Vb145617c1ba(row, C.strokeSoft, 1)
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
		row.MouseEnter:Connect(function() _V2e61ca06180(opts.tip) end)
		row.MouseLeave:Connect(function() _V2e61ca06180("") end)
	end
	return row, box
end
local function _V966b09a310f(parent, opts)
	opts = opts or {}
	_V305b4972d8(_Vzd({229,243,240,241,229,240,248,239}), opts.title, opts.tip, table.concat(opts.options or {}, " "))
	local options = opts.options or { "-" }
	local selected = opts.default or options[1]
	local row = Instance.new(_Vzd({199,243,226,238,230}))
	row.LayoutOrder = opts.order or 0
	row.Size = UDim2.new(1, -6, 0, 34)
	row.BackgroundColor3 = C.card
	row.BorderSizePixel = 0
	row.Parent = parent
	_Ve7cf4e7f5f(row, 8)
	_Vb145617c1ba(row, C.strokeSoft, 1)
	local lbl = Instance.new(_Vzd({213,230,249,245,205,226,227,230,237}))
	lbl.BackgroundTransparency = 1
	lbl.Size = UDim2.new(0.4, 0, 1, 0)
	lbl.Position = UDim2.fromOffset(10, 0)
	lbl.Font = Enum.Font.Gotham
	lbl.TextSize = 11
	lbl.TextColor3 = C.muted
	lbl.TextXAlignment = Enum.TextXAlignment.Left
	lbl.Text = opts.title or _Vzd({212,230,237,230,228,245})
	lbl.Parent = row
	local btn = Instance.new(_Vzd({213,230,249,245,195,246,245,245,240,239}))
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
	_Ve7cf4e7f5f(btn, 6)
	_Vb145617c1ba(btn, C.strokeSoft, 1)
	local open = false
	local listFrame = Instance.new(_Vzd({199,243,226,238,230}))
	listFrame.Visible = false
	listFrame.Size = UDim2.new(1, -6, 0, 0)
	listFrame.BackgroundColor3 = C.bg2
	listFrame.BorderSizePixel = 0
	listFrame.ZIndex = 50
	listFrame.Parent = parent
	listFrame.LayoutOrder = (opts.order or 0) + 0.5
	_Ve7cf4e7f5f(listFrame, 8)
	_Vb145617c1ba(listFrame, C.accent, 1)
	local listLay = Instance.new(_Vzd({214,202,205,234,244,245,205,226,250,240,246,245}))
	listLay.Parent = listFrame
	local searchBox = nil
	local searchH = 24
	if #options > 4 then
		searchBox = Instance.new(_Vzd({213,230,249,245,195,240,249}))
		searchBox.Size = UDim2.new(1, -8, 0, searchH)
		searchBox.BackgroundColor3 = C.bg
		searchBox.BorderSizePixel = 0
		searchBox.Font = Enum.Font.Gotham
		searchBox.TextSize = 11
		searchBox.TextColor3 = C.text
		searchBox.PlaceholderColor3 = C.muted
		searchBox.PlaceholderText = _Vzd({212,230,226,243,228,233,175,175,175})
		searchBox.Text = ""
		searchBox.ClearTextOnFocus = false
		searchBox.TextXAlignment = Enum.TextXAlignment.Left
		searchBox.ZIndex = 52
		searchBox.Parent = listFrame
		_Ve7cf4e7f5f(searchBox, 6)
		_Vb145617c1ba(searchBox, C.strokeSoft, 1)
		pad(searchBox, 0, 4, 0, 4)
	end
	local function rebuild(optsList)
		options = optsList or options
		for _, ch in ipairs(listFrame:GetChildren()) do
			if ch:IsA(_Vzd({121,138,157,153,103,154,153,153,148,147})) then ch:Destroy() end
		end
		local filter = searchBox and searchBox.Text:lower() or ""
		for _, opt in ipairs(options) do
			if filter == "" or opt:lower():find(filter, 1, true) then
				local ob = Instance.new(_Vzd({213,230,249,245,195,246,245,245,240,239}))
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
		searchBox:GetPropertyChangedSignal(_Vzd({213,230,249,245})):Connect(function()
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
local function _V19a46d3f111(sc, opts, orderFn)
	opts = opts or {}
	local clickFn = opts.clickFn or function(p) S.selected = p end
	local height = opts.height or 160
	local orderCounter = 0
	local nn = type(orderFn) == "function" and orderFn or function()
		orderCounter += 1
		return orderCounter
	end
	local refresh, updateMultiBar
	local searchInput = nil
	do
		local row = Instance.new(_Vzd({199,243,226,238,230}))
		row.LayoutOrder = nn()
		row.Size = UDim2.new(1, 0, 0, 32)
		row.BackgroundTransparency = 1
		row.Parent = sc
		local box = Instance.new(_Vzd({213,230,249,245,195,240,249}))
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
		_Ve7cf4e7f5f(box, 8)
		_Vb145617c1ba(box, C.strokeSoft, 1)
		pad(box, 6, 6, 6, 6)
		searchInput = box
	end

	local clearRow = Instance.new(_Vzd({199,243,226,238,230}))
	clearRow.LayoutOrder = nn()
	clearRow.Size = UDim2.new(1, -6, 0, 28)
	clearRow.BackgroundColor3 = C.card
	clearRow.BorderSizePixel = 0
	clearRow.Parent = sc
	_Ve7cf4e7f5f(clearRow, 6)
	_Vb145617c1ba(clearRow, C.strokeSoft, 1)
	local clearInfo = Instance.new(_Vzd({213,230,249,245,205,226,227,230,237}))
	clearInfo.BackgroundTransparency = 1
	clearInfo.Size = UDim2.new(1, -70, 1, 0)
	clearInfo.Position = UDim2.fromOffset(8, 0)
	clearInfo.Font = Enum.Font.Gotham
	clearInfo.TextSize = 10
	clearInfo.TextColor3 = C.muted
	clearInfo.TextXAlignment = Enum.TextXAlignment.Left
	clearInfo.Text = _Vzd({212,230,237,230,228,245,234,240,239,161,176,161,237,240,240,241,161,238,226,243,236,244})
	clearInfo.Parent = clearRow
	local multiClearBtn = Instance.new(_Vzd({213,230,249,245,195,246,245,245,240,239}))
	multiClearBtn.Size = UDim2.fromOffset(58, 22)
	multiClearBtn.Position = UDim2.new(1, -64, 0.5, -11)
	multiClearBtn.BackgroundColor3 = C.danger or Color3.fromRGB(48, 18, 36)
	multiClearBtn.Text = _Vzd({196,237,230,226,243})
	multiClearBtn.Font = Enum.Font.GothamBold
	multiClearBtn.TextSize = 10
	multiClearBtn.TextColor3 = C.dangerText or Color3.fromRGB(255, 140, 170)
	multiClearBtn.AutoButtonColor = true
	multiClearBtn.ZIndex = 20
	multiClearBtn.Active = true
	multiClearBtn.Parent = clearRow
	_Ve7cf4e7f5f(multiClearBtn, 5)
	local multiBar = Instance.new(_Vzd({199,243,226,238,230}))
	multiBar.LayoutOrder = nn()
	multiBar.Size = UDim2.new(1, -6, 0, 22)
	multiBar.BackgroundColor3 = C.card
	multiBar.BorderSizePixel = 0
	multiBar.Visible = false
	multiBar.Parent = sc
	_Ve7cf4e7f5f(multiBar, 6)
	local multiLabel = Instance.new(_Vzd({213,230,249,245,205,226,227,230,237}))
	multiLabel.BackgroundTransparency = 1
	multiLabel.Size = UDim2.new(1, -8, 1, 0)
	multiLabel.Position = UDim2.fromOffset(8, 0)
	multiLabel.Font = Enum.Font.GothamMedium
	multiLabel.TextSize = 11
	multiLabel.TextColor3 = C.accent2 or C.accent
	multiLabel.TextXAlignment = Enum.TextXAlignment.Left
	multiLabel.Text = ""
	multiLabel.Parent = multiBar
	local listBox = Instance.new(_Vzd({199,243,226,238,230}))
	listBox.LayoutOrder = nn()
	listBox.Size = UDim2.new(1, -6, 0, height)
	listBox.BackgroundColor3 = C.bg
	listBox.BorderSizePixel = 0
	listBox.Parent = sc
	_Ve7cf4e7f5f(listBox, 8)
	_Vb145617c1ba(listBox, C.strokeSoft, 1)
	local listSc = Instance.new(_Vzd({212,228,243,240,237,237,234,239,232,199,243,226,238,230}))
	listSc.Size = UDim2.fromScale(1, 1)
	listSc.BackgroundTransparency = 1
	listSc.ScrollBarThickness = 3
	listSc.ScrollBarImageColor3 = C.accent
	listSc.AutomaticCanvasSize = Enum.AutomaticSize.Y
	listSc.CanvasSize = UDim2.new()
	listSc.Parent = listBox
	local listLay = Instance.new(_Vzd({214,202,205,234,244,245,205,226,250,240,246,245}))
	listLay.Padding = UDim.new(0, 3)
	listLay.Parent = listSc
	pad(listSc, 4, 4, 4, 4)
	function updateMultiBar()
		local count = 0
		for _ in pairs(S.loopTargets or {}) do count = count + 1 end
		if count > 0 then
			multiBar.Visible = true
			multiLabel.Text = count .. _Vzd({69,145,148,148,149,82,146,134,151,144,138,137,69,149,145,134,158,138,151}) .. (count > 1 and "s" or "")
			clearInfo.Text = count .. _Vzd({161,238,226,243,236,230,229,161,253,161,196,237,230,226,243,161,243,230,238,240,247,230,244,161,238,226,243,236,244,161,169,236,230,230,241,244,161,241,234,228,236,170})
		else
			multiBar.Visible = false
			local sel = S.selected and S.selected.Parent and _V466aec8e137(S.selected) or _Vzd({239,240,239,230})
			clearInfo.Text = _Vzd({117,142,136,144,95,69}) .. sel
		end
	end
	function refresh()
		for _, ch in ipairs(listSc:GetChildren()) do
			if ch:IsA(_Vzd({213,230,249,245,195,246,245,245,240,239})) then
				ch:Destroy()
			end
		end
		local q = searchInput and searchInput.Text or ""
		local baseCol = C.card or Color3.fromRGB(18, 12, 30)
		local selCol = C.accentDim or C.card2 or baseCol
		for _, lab in ipairs(_V240e7cb9138(q)) do
			local p = _Veeade0fa8a(lab)
			if p and p.Parent then
				local isSel = (S.selected == p)
				local isLoop = S.loopTargets and S.loopTargets[p] == true
				local b = Instance.new(_Vzd({213,230,249,245,195,246,245,245,240,239}))
				b.Size = UDim2.new(1, -4, 0, 28)
				b.BackgroundColor3 = (isLoop or isSel) and selCol or baseCol
				b.BorderSizePixel = 0
				b.Font = Enum.Font.Gotham
				b.TextSize = 11
				b.TextColor3 = C.text or Color3.new(1, 1, 1)
				b.TextXAlignment = Enum.TextXAlignment.Left
				b.Text = (isLoop and _Vzd({161,161,171,161}) or (isSel and _Vzd({161,161,191,161}) or _Vzd({161,161}))) .. lab
				b.AutoButtonColor = true
				b.Parent = listSc
				_Ve7cf4e7f5f(b, 6)
				if isLoop or isSel then
					pcall(function() _Vb145617c1ba(b, C.accent or Color3.fromRGB(155, 70, 255), isLoop and 1.5 or 1) end)
				end
				b.MouseButton1Click:Connect(function()
					S.selected = p
					S.loopTarget = p
					S.loopName = p.Name
					pcall(function() clickFn(p, lab) end)
					pcall(refresh)
					pcall(updateMultiBar)
				end)
			end
		end
		updateMultiBar()
	end
	multiClearBtn.MouseButton1Click:Connect(function()
		_V8ae8b7414e()
		pcall(refresh)
		pcall(updateMultiBar)
		local who = S.selected and S.selected.Parent and _V466aec8e137(S.selected) or _Vzd({239,240,239,230})
		_V556c1dc412c(HUB_NAME, _Vzd({206,226,243,236,244,161,228,237,230,226,243,230,229,161,253,161,241,234,228,236,161,244,245,234,237,237,161}) .. who, 1.2)
	end)
	if searchInput then
		searchInput:GetPropertyChangedSignal(_Vzd({213,230,249,245})):Connect(function()
			pcall(refresh)
		end)
	end
	task.defer(function() pcall(refresh) end)
	return {
		refresh = refresh,
		updateMultiBar = updateMultiBar,
		list = listSc,
	}
end
local function _V2194fbff10d(parent, order, meta)
	local id = meta.id
	local holder = Instance.new(_Vzd({199,243,226,238,230}))
	holder.LayoutOrder = order
	holder.Size = UDim2.new(1, -6, 0, 34)
	holder.BackgroundColor3 = C.card
	holder.BorderSizePixel = 0
	holder.AutomaticSize = Enum.AutomaticSize.Y
	holder.Parent = parent
	_Ve7cf4e7f5f(holder, 8)
	_Vb145617c1ba(holder, C.strokeSoft, 1)
	local lay = Instance.new(_Vzd({214,202,205,234,244,245,205,226,250,240,246,245}))
	lay.Padding = UDim.new(0, 4)
	lay.Parent = holder
	pad(holder, 4, 4, 6, 4)
	local head = Instance.new(_Vzd({199,243,226,238,230}))
	head.Size = UDim2.new(1, 0, 0, 30)
	head.BackgroundTransparency = 1
	head.Parent = holder
	local title = Instance.new(_Vzd({213,230,249,245,205,226,227,230,237}))
	title.BackgroundTransparency = 1
	title.Size = UDim2.new(1, -90, 1, 0)
	title.Position = UDim2.fromOffset(6, 0)
	title.Font = Enum.Font.GothamMedium
	title.TextSize = 12
	title.TextColor3 = C.text
	title.TextXAlignment = Enum.TextXAlignment.Left
	title.Text = meta.title
	title.Parent = head
	head.MouseEnter:Connect(function() _V2e61ca06180(meta.tip) end)
	head.MouseLeave:Connect(function() _V2e61ca06180("") end)
	local gear = Instance.new(_Vzd({121,138,157,153,103,154,153,153,148,147}))
	gear.Size = UDim2.fromOffset(28, 22)
	gear.Position = UDim2.new(1, -78, 0.5, -11)
	gear.BackgroundColor3 = C.bg
	gear.Text = "*"
	gear.TextColor3 = C.accent2
	gear.Font = Enum.Font.GothamBold
	gear.TextSize = 12
	gear.AutoButtonColor = false
	gear.Parent = head
	_Ve7cf4e7f5f(gear, 6)
	local pill = Instance.new(_Vzd({213,230,249,245,195,246,245,245,240,239}))
	pill.Size = UDim2.fromOffset(40, 18)
	pill.Position = UDim2.new(1, -44, 0.5, -9)
	pill.BackgroundColor3 = Color3.fromRGB(40, 28, 58)
	pill.Text = ""
	pill.AutoButtonColor = false
	pill.Parent = head
	_Ve7cf4e7f5f(pill, 9)
	local knob = Instance.new(_Vzd({199,243,226,238,230}))
	knob.Size = UDim2.fromOffset(14, 14)
	knob.Position = UDim2.fromOffset(2, 2)
	knob.BackgroundColor3 = C.muted
	knob.BorderSizePixel = 0
	knob.Parent = pill
	_Ve7cf4e7f5f(knob, 7)
	local settings = Instance.new(_Vzd({199,243,226,238,230}))
	settings.Name = _Vzd({212,230,245,245,234,239,232,244})
	settings.Size = UDim2.new(1, 0, 0, 0)
	settings.BackgroundColor3 = C.bg
	settings.BorderSizePixel = 0
	settings.Visible = false
	settings.ClipsDescendants = true
	settings.Parent = holder
	_Ve7cf4e7f5f(settings, 6)
	local sLay = Instance.new(_Vzd({214,202,205,234,244,245,205,226,250,240,246,245}))
	sLay.Padding = UDim.new(0, 4)
	sLay.Parent = settings
	pad(settings, 6, 6, 6, 6)
	local cfg = _V8e4be6b2ad(id)
	local tLabel = Instance.new(_Vzd({213,230,249,245,205,226,227,230,237}))
	tLabel.Size = UDim2.new(1, 0, 0, 14)
	tLabel.BackgroundTransparency = 1
	tLabel.Font = Enum.Font.Gotham
	tLabel.TextSize = 10
	tLabel.TextColor3 = C.muted
	tLabel.TextXAlignment = Enum.TextXAlignment.Left
	tLabel.Text = _Vzd({213,226,243,232,230,245})
	tLabel.Parent = settings
	local targets = { _Vzd({209,237,226,250,230,243,244}), _Vzd({208,227,235,230,228,245,244}), _Vzd({209,237,226,250,230,243,244,161,226,239,229,161,208,227,235,230,228,245,244}) }
	local tBtn = Instance.new(_Vzd({213,230,249,245,195,246,245,245,240,239}))
	tBtn.Size = UDim2.new(1, 0, 0, 24)
	tBtn.BackgroundColor3 = C.card
	tBtn.BorderSizePixel = 0
	tBtn.Font = Enum.Font.GothamMedium
	tBtn.TextSize = 11
	tBtn.TextColor3 = C.text
	tBtn.Text = cfg.target or _Vzd({209,237,226,250,230,243,244})
	tBtn.AutoButtonColor = false
	tBtn.Parent = settings
	_Ve7cf4e7f5f(tBtn, 6)
	local ti = 1
	for i, t in ipairs(targets) do if t == cfg.target then ti = i end end
	tBtn.MouseButton1Click:Connect(function()
		ti = ti % #targets + 1
		cfg.target = targets[ti]
		tBtn.Text = cfg.target
	end)
	local rLabel = Instance.new(_Vzd({213,230,249,245,205,226,227,230,237}))
	rLabel.Size = UDim2.new(1, 0, 0, 14)
	rLabel.BackgroundTransparency = 1
	rLabel.Font = Enum.Font.Gotham
	rLabel.TextSize = 10
	rLabel.TextColor3 = C.muted
	rLabel.TextXAlignment = Enum.TextXAlignment.Left
	rLabel.Text = _Vzd({119,134,147,140,138,95,69}) .. tostring(cfg.range or 50)
	rLabel.Parent = settings
	local rTrack = Instance.new(_Vzd({121,138,157,153,103,154,153,153,148,147}))
	rTrack.Size = UDim2.new(1, 0, 0, 10)
	rTrack.BackgroundColor3 = Color3.fromRGB(30, 20, 48)
	rTrack.Text = ""
	rTrack.AutoButtonColor = false
	rTrack.Parent = settings
	_Ve7cf4e7f5f(rTrack, 4)
	local rFill = Instance.new(_Vzd({199,243,226,238,230}))
	rFill.Size = UDim2.new(((cfg.range or 50) - 10) / 140, 0, 1, 0)
	rFill.BackgroundColor3 = C.accent
	rFill.BorderSizePixel = 0
	rFill.Parent = rTrack
	_Ve7cf4e7f5f(rFill, 4)
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
		rLabel.Text = _Vzd({119,134,147,140,138,95,69}) .. (nextV >= 9999 and _Vzd({206,194,209}) or tostring(nextV))
		rFill.Size = UDim2.new(math.clamp((math.min(nextV, 500) - 10) / 500, 0, 1), 0, 1, 0)
	end)
	local mapBtn = Instance.new(_Vzd({213,230,249,245,195,246,245,245,240,239}))
	mapBtn.Size = UDim2.new(1, 0, 0, 22)
	mapBtn.BackgroundColor3 = C.card
	mapBtn.BorderSizePixel = 0
	mapBtn.Font = Enum.Font.GothamBold
	mapBtn.TextSize = 10
	mapBtn.TextColor3 = C.accent2
	mapBtn.Text = _Vzd({120,138,153,69,119,134,147,140,138,69,98,69,124,109,116,113,106,69,114,102,117})
	mapBtn.AutoButtonColor = false
	mapBtn.Parent = settings
	_Ve7cf4e7f5f(mapBtn, 6)
	mapBtn.MouseButton1Click:Connect(function()
		cfg.range = 99999
		cfg._customRange = true
		rLabel.Text = _Vzd({119,134,147,140,138,95,69,114,102,117})
		rFill.Size = UDim2.new(1, 0, 1, 0)
	end)
	local pLabel = Instance.new(_Vzd({213,230,249,245,205,226,227,230,237}))
	pLabel.Size = UDim2.new(1, 0, 0, 14)
	pLabel.BackgroundTransparency = 1
	pLabel.Font = Enum.Font.Gotham
	pLabel.TextSize = 10
	pLabel.TextColor3 = C.muted
	pLabel.TextXAlignment = Enum.TextXAlignment.Left
	pLabel.Text = _Vzd({117,148,156,138,151,95,69}) .. tostring(cfg.power or 2500)
	pLabel.Parent = settings
	local pTrack = Instance.new(_Vzd({121,138,157,153,103,154,153,153,148,147}))
	pTrack.Size = UDim2.new(1, 0, 0, 10)
	pTrack.BackgroundColor3 = Color3.fromRGB(30, 20, 48)
	pTrack.Text = ""
	pTrack.AutoButtonColor = false
	pTrack.Parent = settings
	_Ve7cf4e7f5f(pTrack, 4)
	local pFill = Instance.new(_Vzd({199,243,226,238,230}))
	pFill.Size = UDim2.new(((cfg.power or 2500) - 400) / 20000, 0, 1, 0)
	pFill.BackgroundColor3 = C.accent2
	pFill.BorderSizePixel = 0
	pFill.Parent = pTrack
	_Ve7cf4e7f5f(pFill, 4)
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
		pLabel.Text = _Vzd({117,148,156,138,151,95,69}) .. tostring(nextV)
		pFill.Size = UDim2.new((nextV - 400) / 20000, 0, 1, 0)
	end)
	if id == _Vzd({239,230,245,240,248,239}) then
		local grabT = Instance.new(_Vzd({213,230,249,245,195,246,245,245,240,239}))
		grabT.Size = UDim2.new(1, 0, 0, 24)
		grabT.BackgroundColor3 = C.card
		grabT.BorderSizePixel = 0
		grabT.Font = Enum.Font.Gotham
		grabT.TextSize = 11
		grabT.TextColor3 = C.text
		grabT.Text = _Vzd({107,148,151,136,138,69,108,151,134,135,69,113,142,147,138,152,95,69,116,107,107})
		grabT.AutoButtonColor = false
		grabT.Parent = settings
		_Ve7cf4e7f5f(grabT, 6)
		grabT.MouseButton1Click:Connect(function()
			S.toggles.netownGrab = not S.toggles.netownGrab
			grabT.Text = _Vzd({199,240,243,228,230,161,200,243,226,227,161,205,234,239,230,244,187,161}) .. (S.toggles.netownGrab and _Vzd({208,207}) or _Vzd({208,199,199}))
		end)
	end
	local function render()
		local on = S.toggles[_Vzd({226,246,243,226,224}) .. id] == true
		if on then
			_V0db0d1111f5(pill, { BackgroundColor3 = C.accentDim }, 0.12)
			_V0db0d1111f5(knob, { Position = UDim2.fromOffset(24, 2), BackgroundColor3 = C.accent2 }, 0.12)
		else
			_V0db0d1111f5(pill, { BackgroundColor3 = Color3.fromRGB(40, 28, 58) }, 0.12)
			_V0db0d1111f5(knob, { Position = UDim2.fromOffset(2, 2), BackgroundColor3 = C.muted }, 0.12)
		end
	end
	render()
	pill.MouseButton1Click:Connect(function()
		S.toggles[_Vzd({226,246,243,226,224}) .. id] = not S.toggles[_Vzd({226,246,243,226,224}) .. id]
		render()
		_Ve239e5a8164(id, S.toggles[_Vzd({226,246,243,226,224}) .. id] == true)
		if S.toggles[_Vzd({226,246,243,226,224}) .. id] then _V556c1dc412c(HUB_NAME, meta.title .. _Vzd({161,208,207}), 1.2) end
	end)
	gear.MouseButton1Click:Connect(function()
		local open = not settings.Visible
		settings.Visible = open
		settings.Size = open and UDim2.new(1, 0, 0, 160) or UDim2.new(1, 0, 0, 0)
	end)
end
local TAB_DEFS = {
	{ id = _Vzd({233,240,238,230}), icon = "01", label = _Vzd({201,240,238,230}) },
	{ id = _Vzd({136,148,146,135,134,153}), icon = "02", label = _Vzd({196,240,238,227,226,245}) },
	{ id = _Vzd({227,237,240,227,238,226,239}), icon = _Vzd({195,206}), label = _Vzd({195,237,240,227,238,226,239}) },
	{ id = _Vzd({241,237,226,250,230,243}), icon = "03", label = _Vzd({209,237,226,250,230,243}) },
	{ id = _Vzd({232,243,226,227}), icon = "04", label = _Vzd({200,243,226,227}) },
	{ id = _Vzd({226,246,243,226,244}), icon = "05", label = _Vzd({194,246,243,226,244}) },
	{ id = _Vzd({152,138,151,155,138,151}), icon = "06", label = _Vzd({120,138,151,155,138,151}) },
	{ id = _Vzd({237,240,240,241}), icon = "07", label = _Vzd({205,240,240,241,244}) },
	{ id = _Vzd({226,239,245,234}), icon = "08", label = _Vzd({209,243,240,245,230,228,245}) },
	{ id = _Vzd({238,240,247,230}), icon = "09", label = _Vzd({206,240,247,230,238,230,239,245}) },
	{ id = _Vzd({247,234,244,246,226,237,244}), icon = "10", label = _Vzd({215,234,244,246,226,237,244}) },
	{ id = _Vzd({245,240,250,244}), icon = "11", label = _Vzd({213,240,250,244}) },
	{ id = _Vzd({230,249,241,237,240,244,234,240,239,244}), icon = "12", label = _Vzd({198,249,241,237,240,244,234,240,239,244}) },
	{ id = _Vzd({248,240,243,237,229}), icon = "13", label = _Vzd({216,240,243,237,229}) },
	{ id = _Vzd({226,246,245,240}), icon = "14", label = _Vzd({194,246,245,240}) },
	{ id = _Vzd({228,240,239,244,240,237,230}), icon = "15", label = _Vzd({206,234,244,228}) },
	{ id = _Vzd({245,243,226,239,244}), icon = "16", label = _Vzd({121,151,134,147,152}) },
	{ id = _Vzd({152,148,154,147,137,152}), icon = "17", label = _Vzd({212,240,246,239,229,244}) },
	{ id = _Vzd({231,246,239}), icon = "18", label = _Vzd({199,246,239}) },
	{ id = _Vzd({244,230,245,245,234,239,232,244}), icon = "19", label = _Vzd({104,148,147,139,142,140}) },
}
local _TAB_BUILDERS = {}
_TAB_BUILDERS[_Vzd({233,240,238,230})] = function(sc, n)
		_Vbb4234fd160(sc, _Vzd({216,198,205,196,208,206,198}), n())
		local hero = Instance.new(_Vzd({199,243,226,238,230}))
		hero.LayoutOrder = n()
		hero.Size = UDim2.new(1, -6, 0, 100)
		hero.BackgroundColor3 = C.card
		hero.BorderSizePixel = 0
		hero.Parent = sc
		_Ve7cf4e7f5f(hero, 12)
		_Vb145617c1ba(hero, C.accent, 1.4)
		_V2e8e03d1c0(hero, Color3.fromRGB(70, 30, 120), C.card, 25)
		local ht = Instance.new(_Vzd({213,230,249,245,205,226,227,230,237}))
		ht.BackgroundTransparency = 1
		ht.Size = UDim2.new(1, -16, 0, 26)
		ht.Position = UDim2.fromOffset(12, 12)
		ht.Font = Enum.Font.GothamBlack
		ht.TextSize = 18
		ht.TextColor3 = C.accent2
		ht.TextXAlignment = Enum.TextXAlignment.Left
		ht.Text = _Vzd({123,116,110,105,127,69,109,122,103})
		ht.Parent = hero
		local hs = Instance.new(_Vzd({213,230,249,245,205,226,227,230,237}))
		hs.BackgroundTransparency = 1
		hs.Size = UDim2.new(1, -16, 0, 50)
		hs.Position = UDim2.fromOffset(12, 42)
		hs.Font = Enum.Font.Gotham
		hs.TextSize = 11
		hs.TextColor3 = C.muted
		hs.TextXAlignment = Enum.TextXAlignment.Left
		hs.TextYAlignment = Enum.TextYAlignment.Top
		hs.TextWrapped = true
		hs.Text = "Search above for anything | or use the tabs.\nCombat | Players | Grab | Auras | Protect | Toys"
		hs.Parent = hero
		_Vbb4234fd160(sc, _Vzd({213,194,195,212}), n())
		local guide = Instance.new(_Vzd({213,230,249,245,205,226,227,230,237}))
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
		guide.Text = " Combat - kick / fling / kill a DUMBASS NIGGA\n Players - pick a HOE + actions\n Control - look + = to drive their bitch ass\n Grab - hold / release + scroll distance\n Auras - near-you effects (HELL YEAH)\n Server - whole map shit\n Loops - keep doing it NO CAP NIGGA\n Protect - anti-grab / anti-status BULLSHIT\n Movement | Visuals | Toys | Explosions | World | Auto\n Misc - console / forms | Config - keys"
		guide.Parent = sc
		_Ve7cf4e7f5f(guide, 8)
		pad(guide, 8, 8, 8, 8)
		_Vb145617c1ba(guide, C.strokeSoft, 1)
		_Vbb4234fd160(sc, _Vzd({212,213,194,213,214,212}), n())
		_Vc79d533d10e(sc, { order = n(), title = _Vzd({205,234,239,236,161,200,226,238,230,161,211,230,238,240,245,230,244}), tip = _Vzd({211,230,231,243,230,244,233,161,243,230,238,240,245,230,244,161,234,231,161,231,230,226,245,246,243,230,244,161,244,245,240,241,161,248,240,243,236,234,239,232}), callback = function()
			local ok = _V6c6a3f4314a()
			_V556c1dc412c(HUB_NAME, ok and _Vzd({119,138,146,148,153,138,152,69,145,142,147,144,138,137}) or _Vzd({120,153,142,145,145,69,145,148,134,137,142,147,140,69,151,138,146,148,153,138,152,83,83,83}), 2)
		end })
		local st = Instance.new(_Vzd({213,230,249,245,205,226,227,230,237}))
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
		st.Text = _Vzd({69,103,154,142,145,137,95,69}) .. BUILD .. "\n Place: " .. tostring(game.PlaceId) .. "\n Key: VOIDZHUB"
		st.Parent = sc
		_Ve7cf4e7f5f(st, 8)
		pad(st, 8, 8, 8, 8)
		S.homeStatus = st
end
_TAB_BUILDERS[_Vzd({228,240,238,227,226,245})] = function(sc, n)
		_Vbb4234fd160(sc, _Vzd({109,110,121,69,116,115,106,69,117,106,119,120,116,115}), n())
		_V966b09a310f(sc, {
			order = n(),
			title = _Vzd({201,240,248,161,213,240,161,204,234,228,236}),
			options = KICK_TYPES,
			default = S.kickType or _Vzd({212,236,250,161,194,239,228,233,240,243}),
			callback = function(v) S.kickType = v end,
			tip = _Vzd({212,236,250,161,194,239,228,233,240,243,161,176,161,199,237,240,226,245,161,209,234,239,161,240,248,239,230,243,244,233,234,241,161,236,234,228,236,244}),
		})
		if not S.kickType then S.kickType = _Vzd({212,236,250,161,194,239,228,233,240,243}) end
		local combatList = _V19a46d3f111(sc, {
			clickFn = function(p)
				S.selected = p
				S.loopTarget = p
				S.loopName = p.Name
			end,
		}, n)
		local function runOnTarget(label, fn)
			local p = _Ve55455a154()
			if not p or not p.Parent then
				_V556c1dc412c(HUB_NAME, _Vzd({207,240,161,245,226,243,232,230,245,161,174,161,228,237,234,228,236,161,226,161,241,237,226,250,230,243,161,234,239,161,245,233,230,161,237,234,244,245}), 1.5)
				return
			end
			_V556c1dc412c(HUB_NAME, label .. _Vzd({161,174,191,161}) .. _V466aec8e137(p), 1.2)
			task.spawn(function()
				local ok, err = pcall(fn, p)
				if not ok then
					warn(_Vzd({128,123,116,110,105,127,130,69,136,148,146,135,134,153}), err)
					_V556c1dc412c(HUB_NAME, _Vzd({198,243,243,187,161}) .. tostring(err):sub(1, 50), 2)
				end
			end)
		end
		_Vbb4234fd160(sc, _Vzd({201,208,214,212,198,161,176,161,209,205,208,213}), n())
		if S.toggles.plotAmbush == nil then S.toggles.plotAmbush = true end
		if S.toggles.plotPullTry == nil then S.toggles.plotPullTry = true end
		_Ve133dbec114(sc, {
			order = n(), id = _Vzd({241,237,240,245,194,238,227,246,244,233}), title = _Vzd({194,238,227,246,244,233,161,208,239,161,209,237,240,245,161,198,249,234,245}),
			tip = _Vzd({202,231,161,245,233,230,250,161,226,243,230,161,234,239,161,226,161,233,240,246,244,230,187,161,226,237,230,243,245,161,250,240,246,173,161,248,226,234,245,173,161,245,233,230,239,161,226,246,245,240,174,232,243,226,227,161,172,161,226,245,245,226,228,236,161,248,233,230,239,161,245,233,230,250,161,248,226,237,236,161,240,246,245}),
			desc = _Vzd({105,138,139,134,154,145,153,69,116,115,69,161,69,144,142,145,145,152,81,69,139,145,142,147,140,152,81,69,145,148,148,149,152,81,69,134,154,151,134,152}),
			callback = function(on)
				S.toggles.plotAmbush = on
				_V556c1dc412c(HUB_NAME, _Vzd({209,237,240,245,161,226,238,227,246,244,233,161}) .. (on and _Vzd({208,207}) or _Vzd({208,199,199})), 1.5)
			end,
		})
		_Ve133dbec114(sc, {
			order = n(), id = _Vzd({149,145,148,153,117,154,145,145,121,151,158}), title = _Vzd({213,243,250,161,209,246,237,237,161,199,243,240,238,161,201,240,246,244,230}),
			tip = _Vzd({195,230,244,245,174,230,231,231,240,243,245,161,196,243,230,226,245,230,200,243,226,227,205,234,239,230,161,176,161,230,249,245,230,239,229,161,248,233,234,237,230,161,244,245,234,237,237,161,234,239,161,241,237,240,245,161,169,240,231,245,230,239,161,231,226,234,237,244,161,174,161,230,249,234,245,161,226,238,227,246,244,233,161,234,244,161,243,230,237,234,226,227,237,230,170}),
			desc = _Vzd({197,230,231,226,246,237,245,161,208,207,161,253,161,199,213,194,209,161,246,244,246,226,237,237,250,161,227,237,240,228,236,244,161,231,246,237,237,161,240,248,239,230,243,244,233,234,241,161,234,239,244,234,229,230,161,241,237,240,245,244}),
			callback = function(on)
				S.toggles.plotPullTry = on
				_V556c1dc412c(HUB_NAME, _Vzd({201,240,246,244,230,161,241,246,237,237,161,245,243,250,161}) .. (on and _Vzd({208,207}) or _Vzd({208,199,199})), 1.5)
			end,
		})
		_Vc79d533d10e(sc, {
			order = n(), title = _Vzd({200,243,226,227,161,212,230,237,230,228,245,230,229,161,208,239,161,198,249,234,245}),
			tip = _Vzd({118,154,138,154,138,69,152,138,145,138,136,153,138,137,69,161,69,134,154,153,148,82,140,151,134,135,69,153,141,138,69,139,151,134,146,138,69,153,141,138,158,69,145,138,134,155,138,69,153,141,138,142,151,69,141,148,154,152,138}),
			callback = function()
				local p = _Ve55455a154()
				if not p then _V556c1dc412c(HUB_NAME, _Vzd({120,138,145,138,136,153,69,134,69,149,145,134,158,138,151}), 1.5); return end
				if _V318f2ee5f3(p) then
					plotWatch[p.UserId] = { kind = _Vzd({232,243,226,227}), quiet = false }
					_V556c1dc412c(HUB_NAME, _V466aec8e137(p) .. _Vzd({161,234,239,161,233,240,246,244,230,161,253,161,248,234,237,237,161,232,243,226,227,161,240,239,161,230,249,234,245}), 2)
					if S.toggles.plotPullTry then task.spawn(_V4eb11f331f4, p) end
				else
					task.spawn(function() _V37c4073396(p) end)
					_V556c1dc412c(HUB_NAME, _Vzd({200,243,226,227,227,230,229,161}) .. _V466aec8e137(p) .. _Vzd({69,77,147,148,153,69,142,147,69,141,148,154,152,138,78}), 1.5)
				end
			end,
		})
		_Vbb4234fd160(sc, _Vzd({194,196,213,202,208,207,212,161,169,244,230,237,230,228,245,230,229,161,241,237,226,250,230,243,170}), n())
		_Vc79d533d10e(sc, {
			order = n(), title = _Vzd({121,117,69,121,148,69,121,141,138,146}), tip = _Vzd({121,138,145,138,149,148,151,153,69,153,148,69,153,141,138,69,152,138,145,138,136,153,138,137,69,149,145,134,158,138,151}),
			callback = function()
				runOnTarget(_Vzd({213,209}), function(p)
					local r = _Vb2220e5a155(p)
					if r then _V41e966b01bf(CFrame.new(r.Position + Vector3.new(0, 0, -5))) end
				end)
			end,
		})
		_Vc79d533d10e(sc, {
			order = n(), title = _Vzd({121,141,151,148,156,69,121,141,138,146}), danger = true, tip = _Vzd({199,237,234,239,232,161,244,230,237,230,228,245,230,229,161,241,237,226,250,230,243,161,169,246,244,230,244,161,237,234,244,245,161,241,234,228,236,161,176,161,196,237,230,226,243,161,236,230,230,241,244,161,241,234,228,236,170}),
			callback = function()
				runOnTarget(_Vzd({213,233,243,240,248}), function(p)
					_V6c6a3f4314a()
					_Vcc8279d692(p, S.flingPower or 800, false, true)
				end)
			end,
		})
		_Vc79d533d10e(sc, {
			order = n(), title = _Vzd({112,142,136,144,69,121,141,138,146}), danger = true, tip = _Vzd({204,234,228,236,161,244,230,237,230,228,245,230,229,161,248,234,245,233,161,236,234,228,236,161,245,250,241,230}),
			callback = function()
				runOnTarget(_Vzd({204,234,228,236}), function(p) _V971ad737104(p, S.kickType or _Vzd({201,226,243,229}), false) end)
			end,
		})
		_Vc79d533d10e(sc, {
			order = n(), title = _Vzd({204,234,237,237,161,213,233,230,238}), danger = true, tip = _Vzd({112,142,145,145,69,152,138,145,138,136,153,138,137}),
			callback = function()
				runOnTarget(_Vzd({204,234,237,237}), function(p) _V62e4aa89105(p, false) end)
			end,
		})
		_Vc79d533d10e(sc, {
			order = n(), title = _Vzd({195,243,234,239,232,161,213,233,230,238,161,201,230,243,230}), tip = _Vzd({117,154,145,145,69,152,138,145,138,136,153,138,137,69,153,148,69,158,148,154}),
			callback = function()
				runOnTarget(_Vzd({103,151,142,147,140}), function(p) _V702f278238(p, nil, false) end)
			end,
		})
		_Vc79d533d10e(sc, {
			order = n(), title = _Vzd({211,226,232,229,240,237,237,161,213,233,230,238}), tip = _Vzd({119,134,140,137,148,145,145,69,152,138,145,138,136,153,138,137}),
			callback = function()
				runOnTarget(_Vzd({211,226,232,229,240,237,237}), function(p) _V7e5dd05e13e(p, true) end)
			end,
		})
		_Vc79d533d10e(sc, {
			order = n(), title = _Vzd({123,148,142,137,69,121,141,138,146}), danger = true, tip = _Vzd({212,237,226,238,161,244,230,237,230,228,245,230,229,161,234,239,245,240,161,247,240,234,229}),
			callback = function()
				runOnTarget(_Vzd({215,240,234,229}), function(p) _V788517221fb(p, false) end)
			end,
		})
		_Vc79d533d10e(sc, { order = n(), title = _Vzd({195,246,243,239,161,213,233,230,238}), danger = true, tip = _Vzd({102,149,149,145,158,69,139,142,151,138,69,155,142,134,69,152,153,134,153,154,152,69,153,148,158}), callback = function()
			runOnTarget(_Vzd({195,246,243,239}), function(p) _Vfb0808ef21(_Vzd({231,234,243,230}), p) end)
		end })
		_Vc79d533d10e(sc, { order = n(), title = _Vzd({117,148,142,152,148,147,69,121,141,138,146}), danger = true, tip = _Vzd({194,241,241,237,250,161,241,240,234,244,240,239,161,247,234,226,161,233,246,243,245,161,241,226,243,245,244}), callback = function()
			runOnTarget(_Vzd({209,240,234,244,240,239}), function(p) local r = _Vb2220e5a155(p); if r then _Vc83fb00d1f(r) end end)
		end })
		_Vc79d533d10e(sc, { order = n(), title = _Vzd({199,243,230,230,251,230,161,213,233,230,238}), tip = _Vzd({212,230,245,161,216,226,237,236,212,241,230,230,229,161,172,161,203,246,238,241,209,240,248,230,243,161,245,240,161,177}), callback = function()
			runOnTarget(_Vzd({199,243,230,230,251,230}), function(p)
				local h = p.Character and p.Character:FindFirstChildOfClass(_Vzd({201,246,238,226,239,240,234,229}))
				if h then h.WalkSpeed = 0; h.JumpPower = 0; h.JumpHeight = 0 end
			end)
		end })
		_Vc79d533d10e(sc, { order = n(), title = _Vzd({122,147,139,151,138,138,159,138,69,121,141,138,146}), tip = _Vzd({211,230,244,245,240,243,230,161,216,226,237,236,212,241,230,230,229,161,178,183,161,172,161,203,246,238,241,209,240,248,230,243,161,182,177}), callback = function()
			runOnTarget(_Vzd({214,239,231,243,230,230,251,230}), function(p)
				local h = p.Character and p.Character:FindFirstChildOfClass(_Vzd({201,246,238,226,239,240,234,229}))
				if h then h.WalkSpeed = 16; h.JumpPower = 50; h.JumpHeight = 7.2 end
			end)
		end })
		_Vc79d533d10e(sc, { order = n(), title = _Vzd({206,226,244,244,237,230,244,244,161,200,243,226,227}), tip = _Vzd({206,226,236,230,161,232,243,226,227,227,230,229,161,241,226,243,245,161,238,226,244,244,237,230,244,244,161,231,240,243,161,230,226,244,234,230,243,161,231,237,234,239,232,234,239,232}), callback = function()
			runOnTarget(_Vzd({206,226,244,244,237,230,244,244}), function(p)
				local r = _Vb2220e5a155(p)
				if r then pcall(function() r.Massless = true end) end
			end)
		end })
		_Vbb4234fd160(sc, _Vzd({194,202,206}), n())
		_Ve133dbec114(sc, {
			order = n(),
			id = _Vzd({152,142,145,138,147,153,102,142,146}),
			title = _Vzd({212,234,237,230,239,245,161,194,234,238}),
			tip = _Vzd({211,226,250,228,226,244,245,244,161,243,230,229,234,243,230,228,245,161,245,240,161,239,230,226,243,230,244,245,161,241,237,226,250,230,243,161,169,244,228,243,230,230,239,174,228,230,239,245,230,243,161,199,208,215,170}),
			callback = function(on)
				_V8c3a4632179(on)
			end,
		})
		_Ve133dbec114(sc, {
			order = n(),
			id = _Vzd({231,240,247,196,234,243,228,237,230}),
			title = _Vzd({199,208,215,161,196,234,243,228,237,230}),
			tip = _Vzd({120,141,148,156,69,107,116,123,69,136,142,151,136,145,138,69,148,147,69,152,136,151,138,138,147,69,136,138,147,153,138,151}),
			default = true,
			callback = function(on)
				silentFovCircle = on
				if on and S.toggles.silentAim then _startFovCircle() end
				if not on then _stopFovCircle() end
			end,
		})
		_Ve79e7f32113(sc, {
			order = n(),
			title = _Vzd({199,208,215,161,211,226,239,232,230}),
			min = 20,
			max = 500,
			default = S.silentFov or 150,
			stateKey = _Vzd({244,234,237,230,239,245,199,240,247}),
			callback = function(v) silentFov = v; S.silentFov = v end,
		})
end
_TAB_BUILDERS[_Vzd({227,237,240,227,238,226,239})] = function(sc, n)
		_Vbb4234fd160(sc, _Vzd({103,113,116,103,114,102,115}), n())
		local blobIntro = Instance.new(_Vzd({213,230,249,245,205,226,227,230,237}))
		blobIntro.LayoutOrder = n()
		blobIntro.Size = UDim2.new(1, -6, 0, 40)
		blobIntro.BackgroundColor3 = C.card
		blobIntro.BorderSizePixel = 0
		blobIntro.Font = Enum.Font.Gotham
		blobIntro.TextSize = 10
		blobIntro.TextColor3 = C.muted
		blobIntro.TextXAlignment = Enum.TextXAlignment.Left
		blobIntro.TextYAlignment = Enum.TextYAlignment.Top
		blobIntro.TextWrapped = true
		blobIntro.Text = " All Blobman tools in one place.\n Pick a player below, then grab / extract / kick them."
		blobIntro.Parent = sc
		_Ve7cf4e7f5f(blobIntro, 8)
		pad(blobIntro, 6, 6, 6, 6)
		_Vbb4234fd160(sc, _Vzd({121,102,119,108,106,121,69,117,113,102,126,106,119}), n())
		local blobPickNote = Instance.new(_Vzd({213,230,249,245,205,226,227,230,237}))
		blobPickNote.LayoutOrder = n()
		blobPickNote.Size = UDim2.new(1, -6, 0, 20)
		blobPickNote.BackgroundTransparency = 1
		blobPickNote.Font = Enum.Font.Gotham
		blobPickNote.TextSize = 10
		blobPickNote.TextColor3 = C.muted
		blobPickNote.TextXAlignment = Enum.TextXAlignment.Left
		blobPickNote.Text = _Vzd({161,196,237,234,228,236,161,226,161,239,226,238,230,161,245,240,161,244,230,237,230,228,245,161,248,233,240,161,195,237,240,227,238,226,239,161,226,228,245,234,240,239,244,161,233,234,245,175})
		blobPickNote.Parent = sc
		S.playerDropdowns = S.playerDropdowns or {}
		local blobListApi = _V19a46d3f111(sc, {
			clickFn = function(p)
				S.selected = p
				S.blobTarget = p
				S.loopTarget = p
				S.loopName = p.Name
				_V556c1dc412c(HUB_NAME, _Vzd({195,237,240,227,161,245,226,243,232,230,245,161,174,191,161}) .. _V466aec8e137(p), 1)
			end,
			height = 150,
		}, n)
		S._blobSearchRefresh = blobListApi and blobListApi.refresh
		local function blobTarget()
			local p = S.blobTarget or S.selected
			if p and p.Parent and p ~= LP then return p end
			p = _Ve55455a154 and _Ve55455a154() or nil
			if p and p.Parent then
				S.blobTarget = p
				S.selected = p
				return p
			end
			return nil
		end
		_Vc79d533d10e(sc, {
			order = n(),
			title = _Vzd({211,230,231,243,230,244,233,161,209,237,226,250,230,243,244}),
			callback = function()
				if S._blobSearchRefresh then pcall(S._blobSearchRefresh) end
				_V556c1dc412c(HUB_NAME, #_V240e7cb9138() .. _Vzd({69,149,145,134,158,138,151,152}), 1)
			end,
		})
		_Vbb4234fd160(sc, _Vzd({212,209,194,216,207,161,176,161,212,202,213}), n())
		_Ve133dbec114(sc, {
			order = n(), id = _Vzd({227,237,240,227,212,245,234,228,236,250,212,230,226,245}), title = _Vzd({120,153,142,136,144,158,69,120,138,134,153,69,77,134,147,153,142,82,138,143,138,136,153,78}),
			tip = _Vzd({208,241,245,174,234,239,161,240,239,237,250,175,161,216,233,234,237,230,161,208,207,173,161,243,230,174,244,234,245,161,234,231,161,230,235,230,228,245,230,229,161,231,243,240,238,161,195,237,240,227,238,226,239,175,161,200,243,226,227,176,248,243,230,228,236,176,236,234,228,236,161,229,240,161,207,208,213,161,245,246,243,239,161,245,233,234,244,161,240,239,161,231,240,243,161,250,240,246,175}),
			callback = function(on)
				S.toggles.blobStickySeat = on == true
				if on then
					if _Vc5f8332afa() then
						_V8699b7ef19c()
					end
					_V556c1dc412c(HUB_NAME, _Vzd({103,145,148,135,69,152,153,142,136,144,158,69,152,138,134,153,69,116,115,69,77,148,147,145,158,69,156,141,142,145,138,69,134,69,145,148,148,149,69,142,152,69,151,154,147,147,142,147,140,78}), 1.4)
				else
					_V987577091ab()
					if _Vc5f8332afa() then
						_V83a859e397()
					end
					S._blobStickySeat = nil
					_V556c1dc412c(HUB_NAME, _Vzd({103,145,148,135,69,152,153,142,136,144,158,69,152,138,134,153,69,116,107,107,69,161,69,140,138,153,69,148,139,139,69,139,151,138,138}), 1.2)
				end
			end,
		})
		if S.toggles.blobStickySeat == nil then S.toggles.blobStickySeat = false end
		_Vc79d533d10e(sc, {
			order = n(), title = _Vzd({212,241,226,248,239,161,172,161,212,234,245,161,195,237,240,227,238,226,239}),
			tip = _Vzd({195,246,250,176,244,241,226,248,239,161,196,243,230,226,245,246,243,230,195,237,240,227,238,226,239,161,226,239,229,161,244,234,245,161,169,244,245,234,228,236,250,161,244,230,226,245,161,240,239,237,250,161,234,231,161,250,240,246,161,245,240,232,232,237,230,161,234,245,161,208,207,170}),
			callback = function()
				task.spawn(function()
					local ok = _Vd5b67c4b72(false)
					if ok then _V556c1dc412c(HUB_NAME, _Vzd({208,239,161,195,237,240,227,238,226,239}), 1.2) end
				end)
			end,
		})
		_Vc79d533d10e(sc, {
			order = n(), title = _Vzd({103,145,148,135,146,134,147,69,102,151,146,158,69,77,88,78}),
			danger = true,
			tip = _Vzd({120,149,134,156,147,69,88,69,104,151,138,134,153,154,151,138,103,145,148,135,146,134,147,69,77,152,138,151,142,134,145,81,69,154,152,138,152,69,153,148,158,69,152,145,148,153,152,78}),
			callback = function()
				_V5a17bd6c198(_Vzd({196,243,230,226,245,246,243,230,195,237,240,227,238,226,239}), 3)
			end,
		})
		_Vc79d533d10e(sc, {
			order = n(), title = _Vzd({197,234,244,238,240,246,239,245,161,176,161,214,239,244,234,245}),
			tip = _Vzd({212,245,240,241,244,161,226,237,237,161,244,245,234,228,236,250,161,172,161,237,240,240,241,244,161,226,239,229,161,231,240,243,228,230,244,161,250,240,246,161,240,231,231,161,245,233,230,161,244,230,226,245}),
			callback = function()
				for _, id in ipairs({ _Vzd({227,237,240,227,200,243,226,227,205,240,240,241}), _Vzd({227,237,240,227,200,243,226,227,194,237,237,205,240,240,241}), _Vzd({227,237,240,227,198,249,245,243,226,228,245,209,237,240,245,244,205,240,240,241}), _Vzd({227,237,240,227,204,234,228,236,205,240,240,241}) }) do
					_V11a5d4671af(id)
					S.toggles[id] = false
				end
				_V3e8a04041b0(_Vzd({229,230,244,245,243,240,250,212,243,247}))
				S.toggles.destroyServer = false
				S.toggles.blobDestroyServer = false
				S.toggles.blobControlOn = false
				if controlState and controlState.running then _V5edd98521ad(true) end
				_Vc6f37d5c146(true)
				for _, id in ipairs({ _Vzd({227,237,240,227,200,243,226,227,205,240,240,241}), _Vzd({227,237,240,227,200,243,226,227,194,237,237,205,240,240,241}), _Vzd({227,237,240,227,198,249,245,243,226,228,245,209,237,240,245,244,205,240,240,241}), _Vzd({227,237,240,227,204,234,228,236,205,240,240,241}), _Vzd({229,230,244,245,243,240,250,212,230,243,247,230,243}), _Vzd({227,237,240,227,196,240,239,245,243,240,237,208,239}) }) do
					if S._toggleRenderers and S._toggleRenderers[id] then
						pcall(S._toggleRenderers[id])
					end
				end
				_V556c1dc412c(HUB_NAME, _Vzd({197,234,244,238,240,246,239,245,230,229,161,253,161,231,243,230,230,161,231,243,240,238,161,195,237,240,227,238,226,239}), 1.3)
			end,
		})
		_Vbb4234fd160(sc, _Vzd({196,208,207,213,211,208,205,161,169,195,237,234,245,251,174,244,245,250,237,230,170}), n())
		_Ve133dbec114(sc, {
			order = n(), id = _Vzd({227,237,240,227,196,240,239,245,243,240,237,208,239}), title = _Vzd({196,240,239,245,243,240,237,161,207,230,226,243,230,244,245,161,195,237,240,227,238,226,239}),
			tip = _Vzd({208,207,161,190,161,245,226,236,230,161,228,240,239,245,243,240,237,161,169,216,194,212,197,161,212,241,226,228,230,176,196,245,243,237,170,161,253,161,208,199,199,161,190,161,244,245,240,241,161,228,240,239,245,243,240,237,175,161,212,241,226,248,239,244,161,227,237,240,227,161,234,231,161,239,240,239,230,161,239,230,226,243,227,250,175}),
			callback = function(on)
				_V36bbfc2a166(on)
			end,
		})
		_Vc79d533d10e(sc, {
			order = n(), title = _Vzd({104,148,147,153,151,148,145,69,113,148,148,144,69,115,117,104,69,77,148,147,136,138,78}),
			tip = _Vzd({208,239,230,174,244,233,240,245,187,161,237,240,240,236,161,226,245,161,195,237,240,227,238,226,239,161,176,161,229,230,228,240,250,161,176,161,228,243,230,226,245,246,243,230,161,226,239,229,161,245,226,236,230,161,228,240,239,245,243,240,237}),
			callback = function() _Va14c2ad758() end,
		})
		_Vbb4234fd160(sc, _Vzd({200,211,194,195}), n())
		_Vc79d533d10e(sc, {
			order = n(), title = _Vzd({195,237,240,227,161,200,243,226,227,161,212,230,237,230,228,245,230,229,161,169,240,239,228,230,170}),
			danger = true,
			tip = _Vzd({116,147,138,82,152,141,148,153,69,104,151,138,134,153,154,151,138,108,151,134,135,69,148,147,69,152,138,145,138,136,153,138,137,69,149,145,134,158,138,151}),
			callback = function()
				local p = blobTarget()
				if not p then _V556c1dc412c(HUB_NAME, _Vzd({117,142,136,144,69,134,69,149,145,134,158,138,151,69,142,147,69,153,141,138,69,145,142,152,153,69,134,135,148,155,138}), 1.5); return end
				_V556c1dc412c(HUB_NAME, _Vzd({195,237,240,227,161,200,243,226,227,161,174,191,161}) .. _V466aec8e137(p), 1.2)
				task.spawn(function() _V50cb0bb02d(p) end)
			end,
		})
		_Vc79d533d10e(sc, {
			order = n(), title = _Vzd({103,145,148,135,69,108,151,134,135,69,102,145,145,69,77,148,147,136,138,78}),
			danger = true,
			tip = _Vzd({116,147,138,69,149,134,152,152,69,104,151,138,134,153,154,151,138,108,151,134,135,69,138,155,138,151,158,69,149,145,134,158,138,151}),
			callback = function()
				task.spawn(_Vbee791932b)
			end,
		})
		_Ve133dbec114(sc, {
			order = n(), id = _Vzd({227,237,240,227,200,243,226,227,205,240,240,241}), title = _Vzd({205,240,240,241,161,200,243,226,227,161,212,230,237,230,228,245,230,229}),
			tip = _Vzd({204,230,230,241,161,227,237,240,227,174,232,243,226,227,227,234,239,232,161,245,233,230,161,244,230,237,230,228,245,230,229,161,241,237,226,250,230,243,161,246,239,245,234,237,161,208,199,199}),
			callback = function(on)
				local p = blobTarget()
				local ok = _V9f76ead5169(on, p)
				if on and not ok then
					S.toggles.blobGrabLoop = false
					if S._toggleRenderers and S._toggleRenderers.blobGrabLoop then
						pcall(S._toggleRenderers.blobGrabLoop)
					end
				end
			end,
		})
		_Ve133dbec114(sc, {
			order = n(), id = _Vzd({227,237,240,227,200,243,226,227,194,237,237,205,240,240,241}), title = _Vzd({205,240,240,241,161,200,243,226,227,161,194,237,237}),
			tip = _Vzd({211,230,241,230,226,245,230,229,237,250,161,227,237,240,227,174,232,243,226,227,161,230,247,230,243,250,161,241,237,226,250,230,243,161,246,239,245,234,237,161,208,199,199}),
			callback = function(on)
				_V4188cddd168(on)
			end,
		})
		_Vc79d533d10e(sc, {
			order = n(), title = _Vzd({195,237,240,227,161,200,243,226,227,161,194,237,237,161,208,239,228,230,161,169,244,230,226,245,161,236,234,245,170}),
			danger = true,
			tip = _Vzd({208,239,230,161,241,226,244,244,161,248,233,234,237,230,161,238,240,246,239,245,230,229,161,169,236,234,245,161,231,234,243,230,170}),
			callback = function()
				task.spawn(function() pcall(_V903a73872f) end)
			end,
		})
		_Vbb4234fd160(sc, _Vzd({117,113,116,121,69,106,125,121,119,102,104,121}), n())
		_Vc79d533d10e(sc, {
			order = n(), title = _Vzd({106,157,153,151,134,136,153,69,120,138,145,138,136,153,138,137,69,77,148,147,136,138,78}),
			danger = true,
			tip = _Vzd({208,239,230,174,244,233,240,245,161,227,237,240,227,161,232,243,226,227,161,244,230,237,230,228,245,230,229,161,234,239,161,241,237,240,245}),
			callback = function()
				local p = blobTarget()
				if not p then _V556c1dc412c(HUB_NAME, _Vzd({117,142,136,144,69,134,69,149,145,134,158,138,151,69,142,147,69,153,141,138,69,145,142,152,153,69,134,135,148,155,138}), 1.5); return end
				_V556c1dc412c(HUB_NAME, _Vzd({103,145,148,135,69,138,157,153,151,134,136,153,69,82,99,69}) .. _V466aec8e137(p), 1.2)
				task.spawn(function() _V50cb0bb02d(p) end)
			end,
		})
		_Vc79d533d10e(sc, {
			order = n(), title = _Vzd({198,249,245,243,226,228,245,161,194,237,237,161,202,239,161,209,237,240,245,244,161,169,240,239,228,230,170}),
			danger = true,
			tip = _Vzd({116,147,138,69,149,134,152,152,95,69,138,155,138,151,158,69,149,145,134,158,138,151,69,136,154,151,151,138,147,153,145,158,69,142,147,69,134,69,149,145,148,153}),
			callback = function()
				_V556c1dc412c(HUB_NAME, _Vzd({195,237,240,227,161,230,249,245,243,226,228,245,161,194,205,205,161,234,239,161,241,237,240,245,244}), 1.5)
				task.spawn(function()
					for _, p in ipairs(Players:GetPlayers()) do
						if p ~= LP and _Vd6eb72811f9(p) and _V318f2ee5f3(p) then
							_V50cb0bb02d(p)
							task.wait(0.3)
						end
					end
				end)
			end,
		})
		_Ve133dbec114(sc, {
			order = n(), id = _Vzd({227,237,240,227,198,249,245,243,226,228,245,209,237,240,245,244,205,240,240,241}), title = _Vzd({205,240,240,241,161,198,249,245,243,226,228,245,161,194,237,237,161,202,239,161,209,237,240,245,244}),
			tip = _Vzd({204,230,230,241,161,230,249,245,243,226,228,245,234,239,232,161,230,247,230,243,250,240,239,230,161,234,239,161,241,237,240,245,244,161,246,239,245,234,237,161,208,199,199}),
			callback = function(on)
				_Vbb4b69f8167(on)
			end,
		})
		_Vbb4234fd160(sc, _Vzd({124,119,106,104,112,69,84,69,112,110,104,112}), n())
		_Ve133dbec114(sc, {
			order = n(), id = _Vzd({229,230,244,245,243,240,250,212,230,243,247,230,243}), title = _Vzd({124,151,138,136,144,69,120,138,151,155,138,151,69,77,103,145,148,135,146,134,147,78}),
			tip = _Vzd({116,115,69,98,69,152,142,153,69,103,145,148,135,146,134,147,69,134,147,137,69,104,151,138,134,153,154,151,138,108,151,134,135,69,138,155,138,151,158,148,147,138,69,148,147,69,134,69,145,148,148,149,69,161,69,116,107,107,69,98,69,152,153,148,149}),
			callback = function(on)
				S.toggles.blobDestroyServer = on
				if on then
					_Vbada9a16173(_Vzd({229,230,244,245,243,240,250,212,243,247}), true, _V2d53f0c669)
				else
					_V3e8a04041b0(_Vzd({229,230,244,245,243,240,250,212,243,247}))
					S.toggles.destroyServer = false
				end
			end,
		})
		_Vc79d533d10e(sc, {
			order = n(), title = _Vzd({103,145,148,135,146,134,147,69,112,142,136,144,69,120,138,145,138,136,153,138,137,69,77,148,147,136,138,78}),
			danger = true,
			tip = _Vzd({116,147,138,82,152,141,148,153,69,144,142,136,144,69,153,158,149,138,69,103,145,148,135,146,134,147,69,148,147,69,152,138,145,138,136,153,138,137,69,149,145,134,158,138,151}),
			callback = function()
				local p = blobTarget()
				if not p then _V556c1dc412c(HUB_NAME, _Vzd({117,142,136,144,69,134,69,149,145,134,158,138,151,69,142,147,69,153,141,138,69,145,142,152,153,69,134,135,148,155,138}), 1.5); return end
				task.spawn(function() _V971ad737104(p, _Vzd({195,237,240,227,238,226,239}), false) end)
			end,
		})
		_Ve133dbec114(sc, {
			order = n(), id = _Vzd({227,237,240,227,204,234,228,236,205,240,240,241}), title = _Vzd({113,148,148,149,69,103,145,148,135,146,134,147,69,112,142,136,144,69,120,138,145,138,136,153,138,137}),
			tip = _Vzd({204,230,230,241,161,236,234,228,236,234,239,232,161,244,230,237,230,228,245,230,229,161,248,234,245,233,161,195,237,240,227,238,226,239,161,236,234,228,236,161,246,239,245,234,237,161,208,199,199}),
			callback = function(on)
				_V11a5d4671af(_Vzd({227,237,240,227,204,234,228,236,205,240,240,241}))
				S.toggles.blobKickLoop = on == true
				if not on then
					_V556c1dc412c(HUB_NAME, _Vzd({103,145,148,135,69,112,142,136,144,69,113,148,148,149,69,116,107,107}), 1)
					_Vc6f37d5c146(true)
					return
				end
				local p = blobTarget()
				if not p then
					S.toggles.blobKickLoop = false
					_V556c1dc412c(HUB_NAME, _Vzd({209,234,228,236,161,226,161,241,237,226,250,230,243,161,231,234,243,244,245}), 1.5)
					if S._toggleRenderers and S._toggleRenderers.blobKickLoop then
						pcall(S._toggleRenderers.blobKickLoop)
					end
					return
				end
				local name = p.Name
				_V6eb75622116(true)
				_V8699b7ef19c()
				_V556c1dc412c(HUB_NAME, _Vzd({103,145,148,135,69,112,142,136,144,69,113,148,148,149,69,116,115,69,82,99,69}) .. _V466aec8e137(p), 1.2)
				_V53fa917f1a2(_Vzd({227,237,240,227,204,234,228,236,205,240,240,241}), 0.6, function()
					if not S.toggles.blobKickLoop then return end
					local t = Players:FindFirstChild(name) or blobTarget()
					if t and t.Parent then _V971ad737104(t, _Vzd({195,237,240,227,238,226,239}), true) end
				end)
			end,
		})
		_Vc79d533d10e(sc, {
			order = n(), title = _Vzd({120,153,148,149,69,102,145,145,69,103,145,148,135,69,113,148,148,149,152}),
			danger = true,
			tip = _Vzd({212,245,240,241,244,161,230,247,230,243,250,161,195,237,240,227,238,226,239,161,237,240,240,241,161,226,239,229,161,231,240,243,228,230,244,161,250,240,246,161,240,231,231,161,245,233,230,161,244,230,226,245}),
			callback = function()
				for _, name in ipairs({ _Vzd({137,138,152,153,151,148,158,120,151,155}), _Vzd({229,230,244,245,243,240,250,201,250,227}), _Vzd({227,237,240,227,212,243,247}) }) do
					_V3e8a04041b0(name)
				end
				for _, id in ipairs({ _Vzd({227,237,240,227,200,243,226,227,205,240,240,241}), _Vzd({227,237,240,227,200,243,226,227,194,237,237,205,240,240,241}), _Vzd({227,237,240,227,198,249,245,243,226,228,245,209,237,240,245,244,205,240,240,241}), _Vzd({227,237,240,227,204,234,228,236,205,240,240,241}) }) do
					_V11a5d4671af(id)
					S.toggles[id] = false
				end
				S.toggles.destroyServer = false
				S.toggles.blobDestroyServer = false
				S.toggles.blobControlOn = false
				if controlState and controlState.running then _V5edd98521ad(true) end
				_Vc6f37d5c146(true)
				for _, id in ipairs({ _Vzd({227,237,240,227,200,243,226,227,205,240,240,241}), _Vzd({227,237,240,227,200,243,226,227,194,237,237,205,240,240,241}), _Vzd({227,237,240,227,198,249,245,243,226,228,245,209,237,240,245,244,205,240,240,241}), _Vzd({227,237,240,227,204,234,228,236,205,240,240,241}), _Vzd({229,230,244,245,243,240,250,212,230,243,247,230,243}), _Vzd({135,145,148,135,104,148,147,153,151,148,145,116,147}) }) do
					if S._toggleRenderers and S._toggleRenderers[id] then
						pcall(S._toggleRenderers[id])
					end
				end
				_V556c1dc412c(HUB_NAME, _Vzd({194,237,237,161,195,237,240,227,238,226,239,161,237,240,240,241,244,161,244,245,240,241,241,230,229,161,253,161,231,243,230,230,161,245,240,161,237,230,226,247,230}), 1.3)
			end,
		})
		_Vbb4234fd160(sc, _Vzd({209,211,208,213,198,196,213}), n())
		_Ve133dbec114(sc, {
			order = n(), id = _Vzd({226,239,245,234,195,237,240,227,238,226,239}), title = _Vzd({194,239,245,234,161,195,237,240,227,238,226,239,161,176,161,213,243,226,234,239,161,212,230,226,245}),
			tip = _Vzd({208,207,161,190,161,231,240,243,228,230,161,246,239,244,234,245,161,234,231,161,244,245,246,228,236,161,240,239,161,227,237,240,227,176,245,243,226,234,239,161,169,244,236,234,241,241,230,229,161,248,233,234,237,230,161,244,245,234,228,236,250,161,244,230,244,244,234,240,239,170}),
			callback = function(on)
				S.toggles.antiBlobman = on
				S.toggles.antiTrain = on
				_V11a5d4671af(_Vzd({226,239,245,234,195,237,240,227}))
				if on then _V53fa917f1a2(_Vzd({226,239,245,234,195,237,240,227}), 0.15, _Vffdcd3f210) end
				_V556c1dc412c(HUB_NAME, _Vzd({194,239,245,234,161,227,237,240,227,176,245,243,226,234,239,161,244,230,226,245,161}) .. (on and _Vzd({208,207}) or _Vzd({208,199,199})), 1.2)
			end,
		})
end
_TAB_BUILDERS[_Vzd({226,246,243,226,244})] = function(sc, n)
		_Vbb4234fd160(sc, _Vzd({206,194,209,174,216,202,197,198,161,194,214,211,194,212}), n())
		local auraNote = Instance.new(_Vzd({213,230,249,245,205,226,227,230,237}))
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
		_Ve7cf4e7f5f(auraNote, 8)
		pad(auraNote, 6, 6, 6, 6)
		if S.toggles.auraMapWide == nil then S.toggles.auraMapWide = false end
		_Ve133dbec114(sc, {
			order = n(), id = _Vzd({226,246,243,226,206,226,241,216,234,229,230}), title = _Vzd({198,249,245,230,239,229,230,229,161,211,226,239,232,230,161,169,208,227,235,230,228,245,244,170}),
			tip = _Vzd({116,115,69,98,69,156,142,137,138,151,69,151,134,147,140,138,69,139,148,151,69,148,135,143,138,136,153,69,134,154,151,134,152,83,69,117,145,134,158,138,151,69,134,154,151,134,152,69,134,145,156,134,158,152,69,120,115,116,69,151,134,147,140,138,83}),
			desc = _Vzd({212,207,208,161,243,226,239,232,230,161,255,180,177,161,244,245,246,229,244,161,231,240,243,161,241,237,226,250,230,243,244,161,226,237,248,226,250,244}),
			callback = function(on)
				S.toggles.auraMapWide = on
				_V556c1dc412c(HUB_NAME, _Vzd({194,246,243,226,161,243,226,239,232,230,161}) .. (on and _Vzd({230,249,245,230,239,229,230,229}) or _Vzd({239,230,226,243,227,250,161,240,239,237,250})), 1.5)
			end,
		})
		_Ve79e7f32113(sc, {
			order = n(),
			title = _Vzd({208,227,235,230,228,245,161,197,234,244,245,226,239,228,230}),
			min = 10,
			max = 2000,
			default = S.auraRange or 50,
			stateKey = _Vzd({226,246,243,226,211,226,239,232,230}),
			callback = function(v)
				S.auraRange = v
				for _, cfg in pairs(S.auraCfg) do
					if not cfg._customRange then cfg.range = v end
				end
			end,
		})
		_Ve79e7f32113(sc, {
			order = n(),
			title = _Vzd({194,246,243,226,161,209,240,248,230,243,161,176,161,199,237,234,239,232,161,212,245,243,230,239,232,245,233}),
			min = 400,
			max = 20000,
			default = 8000,
			step = 100,
			stateKey = _Vzd({139,145,142,147,140,117,148,156,138,151}),
			callback = function(v)
				S.flingPower = v
				for _, cfg in pairs(S.auraCfg) do
					if not cfg._customPower then cfg.power = v end
				end
			end,
		})
		_V966b09a310f(sc, {
			order = n(), title = _Vzd({213,230,237,230,236,234,239,230,244,234,244,161,212,233,226,241,230}),
			options = { _Vzd({213,240,243,239,226,229,240}), _Vzd({195,237,226,228,236,233,240,237,230}) },
			default = S.tkShape or _Vzd({213,240,243,239,226,229,240}),
			callback = function(v)
				S.tkShape = v
				_V556c1dc412c(HUB_NAME, _Vzd({121,112,69,152,141,134,149,138,69,82,99,69}) .. v, 1.2)
			end,
		})
		_Vbb4234fd160(sc, _Vzd({194,214,211,194,212,161,169,238,226,241,174,248,234,229,230,161,253,161,171,161,228,246,244,245,240,238,234,251,230,170}), n())
		for _, meta in ipairs(AURA_META) do
			_V2194fbff10d(sc, n(), meta)
		end
end
_TAB_BUILDERS[_Vzd({244,230,243,247,230,243})] = function(sc, n)
		_Vbb4234fd160(sc, _Vzd({114,102,117,82,124,110,105,106,69,102,104,121,110,116,115,120}), n())
		local srvNote = Instance.new(_Vzd({213,230,249,245,205,226,227,230,237}))
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
		srvNote.Text = " Every toggle visits each player (any distance) then applies the effect.\n Same engine as auras - house campers get ambushed on exit.\n ! Some features can kick YOU | start with lower intensity."
		srvNote.Parent = sc
		_Ve7cf4e7f5f(srvNote, 8)
		pad(srvNote, 6, 6, 6, 6)
		_Vbb4234fd160(sc, _Vzd({205,194,200,161,176,161,197,198,212,213,211,208,218,161,212,198,211,215,198,211}), n())
		local lagNote = Instance.new(_Vzd({213,230,249,245,205,226,227,230,237}))
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
		lagNote.Text = " ! Lag can kick YOU or others - start intensity ~50-100.\n Lag = spam CreateGrabLine/SetNetworkOwner on everyone.\n Blobman wreck / grab tools are on the Blobman tab."
		lagNote.Parent = sc
		_Ve7cf4e7f5f(lagNote, 8)
		pad(lagNote, 6, 6, 6, 6)
		_Ve79e7f32113(sc, {
			order = n(), title = _Vzd({205,226,232,161,202,239,245,230,239,244,234,245,250}), min = 1, max = 500, default = 150, step = 1,
			stateKey = _Vzd({237,226,232,202,239,245,230,239,244,234,245,250}),
			tip = _Vzd({109,142,140,141,138,151,69,98,69,146,148,151,138,69,151,138,146,148,153,138,69,152,149,134,146,69,149,138,151,69,156,134,155,138,69,77,136,134,147,69,144,142,136,144,69,158,148,154,78}),
		})
		_Ve133dbec114(sc, {
			order = n(), id = _Vzd({237,226,232,212,230,243,247,230,243}), title = _Vzd({205,226,232,161,212,230,243,247,230,243}),
			tip = _Vzd({212,241,226,238,161,196,243,230,226,245,230,200,243,226,227,205,234,239,230,161,172,161,212,230,245,207,230,245,248,240,243,236,208,248,239,230,243,161,240,239,161,248,233,240,237,230,161,244,230,243,247,230,243}),
			callback = function(on)
				if on then _Vbada9a16173(_Vzd({237,226,232,212,243,247}), true, _Ve57be27f106) else _V3e8a04041b0(_Vzd({237,226,232,212,243,247})) end
			end,
		})
		_Vc79d533d10e(sc, {
			order = n(), title = _Vzd({120,153,148,149,69,113,134,140,69,84,69,124,151,138,136,144}), danger = true,
			tip = _Vzd({112,142,145,145,69,134,145,145,69,145,134,140,69,134,147,137,69,156,151,138,136,144,69,145,148,148,149,152,69,142,147,152,153,134,147,153,145,158}),
			callback = function()
				for _, name in ipairs({ _Vzd({237,226,232,212,243,247}), _Vzd({244,240,231,245,205,226,232}), _Vzd({141,134,151,137,113,134,140}), _Vzd({229,230,244,245,243,240,250,212,243,247}), _Vzd({137,138,152,153,151,148,158,109,158,135}), _Vzd({227,237,240,227,212,243,247}) }) do
					_V3e8a04041b0(name)
				end
				S.toggles.lagServer = false
				S.toggles.destroyServer = false
				S.toggles.blobDestroyServer = false
				_V556c1dc412c(HUB_NAME, _Vzd({212,245,240,241,241,230,229}), 1.5)
			end,
		})
		_Vbb4234fd160(sc, _Vzd({112,110,113,113,69,84,69,121,109,119,116,124,69,84,69,112,110,104,112}), n())
		local killNote = Instance.new(_Vzd({213,230,249,245,205,226,227,230,237}))
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
		killNote.Text = " Loop toggles: repeats every cycle | camera locks at home while active.\n Kill = Dead state | Throw = fling | Kick = _Vc9836fec182 + destroy."
		killNote.Parent = sc
		_Ve7cf4e7f5f(killNote, 8)
		pad(killNote, 6, 6, 6, 6)
		_Ve79e7f32113(sc, {
			order = n(), title = _Vzd({196,250,228,237,230,161,197,230,237,226,250,161,169,244,230,228,170}), min = 0.1, max = 5, default = 0.2, step = 0.1,
			stateKey = _Vzd({238,226,244,244,196,250,228,237,230,197,230,237,226,250}),
			tip = _Vzd({120,138,136,148,147,137,152,69,135,138,153,156,138,138,147,69,138,134,136,141,69,139,154,145,145,69,149,134,152,152,69,134,136,151,148,152,152,69,134,145,145,69,149,145,134,158,138,151,152}),
		})
		_Ve133dbec114(sc, {
			order = n(), id = _Vzd({146,134,152,152,132,144,142,145,145}), title = _Vzd({113,148,148,149,69,112,142,145,145,69,102,145,145}), danger = true,
			tip = _Vzd({205,240,240,241,187,161,247,234,244,234,245,161,230,226,228,233,161,241,237,226,250,230,243,161,174,191,161,212,207,208,161,174,191,161,201,246,238,226,239,240,234,229,187,196,233,226,239,232,230,212,245,226,245,230,169,197,230,226,229,170,175,161,196,226,238,230,243,226,161,237,240,228,236,244,161,233,240,238,230,175}),
			callback = function(on)
				if on then _Vbada9a16173(_Vzd({236,234,237,237}), true, _V07ffe7d2122) else _V3e8a04041b0(_Vzd({236,234,237,237})) end
			end,
		})
		_Ve133dbec114(sc, {
			order = n(), id = _Vzd({238,226,244,244,224,231,237,234,239,232}), title = _Vzd({113,148,148,149,69,121,141,151,148,156,69,102,145,145}), danger = true,
			tip = _Vzd({113,148,148,149,95,69,155,142,152,142,153,69,138,134,136,141,69,149,145,134,158,138,151,69,82,99,69,134,149,149,145,158,107,145,142,147,140,69,77,103,148,137,158,123,138,145,148,136,142,153,158,78,83,69,104,134,146,138,151,134,69,145,148,136,144,152,69,141,148,146,138,83}),
			callback = function(on)
				if on then _Vbada9a16173(_Vzd({231,237,234,239,232}), true, _V62d9688b11d) else _V3e8a04041b0(_Vzd({231,237,234,239,232})) end
			end,
		})
		_Ve133dbec114(sc, {
			order = n(), id = _Vzd({238,226,244,244,224,236,234,228,236}), title = _Vzd({113,148,148,149,69,112,142,136,144,69,102,145,145}), danger = true,
			tip = _Vzd({205,240,240,241,187,161,247,234,244,234,245,161,230,226,228,233,161,241,237,226,250,230,243,161,174,191,161,212,207,208,161,174,191,161,244,236,250,215,230,237,161,172,161,229,230,244,245,243,240,250,200,243,226,227,205,234,239,230,175,161,196,226,238,230,243,226,161,237,240,228,236,244,161,233,240,238,230,175}),
			callback = function(on)
				if on then _Vbada9a16173(_Vzd({236,234,228,236}), true, _V7cd25639120) else _V3e8a04041b0(_Vzd({236,234,228,236})) end
			end,
		})
		_Vbb4234fd160(sc, _Vzd({103,119,110,115,108,69,84,69,119,102,108,105,116,113,113,69,84,69,103,122,119,115}), n())
		local bringNote = Instance.new(_Vzd({213,230,249,245,205,226,227,230,237}))
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
		bringNote.Text = " Loop toggles: repeats every cycle | camera locks at home while active.\n Bring = pull to you | Ragdoll = BananaPeel | Burn = Campfire."
		bringNote.Parent = sc
		_Ve7cf4e7f5f(bringNote, 8)
		pad(bringNote, 6, 6, 6, 6)
		_Ve133dbec114(sc, {
			order = n(), id = _Vzd({238,226,244,244,224,227,243,234,239,232}), title = _Vzd({113,148,148,149,69,103,151,142,147,140,69,102,145,145}),
			tip = _Vzd({205,240,240,241,187,161,247,234,244,234,245,161,230,226,228,233,161,241,237,226,250,230,243,161,174,191,161,212,207,208,161,174,191,161,241,246,237,237,161,245,240,161,250,240,246,243,161,241,240,244,234,245,234,240,239,175,161,196,226,238,230,243,226,161,237,240,228,236,244,161,233,240,238,230,175}),
			callback = function(on)
				if on then _Vbada9a16173(_Vzd({227,243,234,239,232}), true, _V60122a2c119) else _V3e8a04041b0(_Vzd({227,243,234,239,232})) end
			end,
		})
		_Ve133dbec114(sc, {
			order = n(), id = _Vzd({238,226,244,244,224,243,226,232,229,240,237,237}), title = _Vzd({205,240,240,241,161,211,226,232,229,240,237,237,161,194,237,237}), danger = true,
			tip = _Vzd({205,240,240,241,187,161,244,241,226,248,239,244,161,199,240,240,229,195,226,239,226,239,226,161,174,191,161,245,240,246,228,233,230,244,161,195,226,239,226,239,226,209,230,230,237,161,245,240,161,230,226,228,233,161,241,237,226,250,230,243,175,161,196,226,238,230,243,226,161,237,240,228,236,244,161,233,240,238,230,175}),
			callback = function(on)
				if on then _Vbada9a16173(_Vzd({243,226,232,229,240,237,237}), true, _Vc1dd839f125) else _V3e8a04041b0(_Vzd({243,226,232,229,240,237,237})) end
			end,
		})
		_Ve133dbec114(sc, {
			order = n(), id = _Vzd({238,226,244,244,224,231,234,243,230}), title = _Vzd({205,240,240,241,161,195,246,243,239,161,194,237,237}), danger = true,
			tip = _Vzd({205,240,240,241,187,161,244,241,226,248,239,244,161,196,226,238,241,231,234,243,230,161,174,191,161,245,240,246,228,233,230,244,161,199,234,243,230,209,237,226,250,230,243,209,226,243,245,161,245,240,161,230,226,228,233,161,241,237,226,250,230,243,175,161,196,226,238,230,243,226,161,237,240,228,236,244,161,233,240,238,230,175}),
			callback = function(on)
				if on then _Vbada9a16173(_Vzd({231,234,243,230}), true, _Vbdabb06b11b) else _V3e8a04041b0(_Vzd({231,234,243,230})) end
			end,
		})
		_Vbb4234fd160(sc, _Vzd({205,208,208,209,161,215,208,206,202,213,161,169,206,194,209,174,216,202,197,198,170}), n())
		local vomitNote = Instance.new(_Vzd({213,230,249,245,205,226,227,230,237}))
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
		vomitNote.Text = " Spawns FoodBanana on each player -> holds it -> uses it (triggers eat + vomit).\n Loops so they keep eating and puking. Rate adjustable."
		vomitNote.Parent = sc
		_Ve7cf4e7f5f(vomitNote, 8)
		pad(vomitNote, 6, 6, 6, 6)
		_Ve79e7f32113(sc, {
			order = n(), title = _Vzd({215,240,238,234,245,161,211,226,245,230,161,169,244,230,228,170}), min = 0.5, max = 5, default = 2, step = 0.5,
			stateKey = _Vzd({247,240,238,234,245,211,226,245,230}),
			tip = _Vzd({212,230,228,240,239,229,244,161,227,230,245,248,230,230,239,161,230,226,228,233,161,247,240,238,234,245,161,228,250,228,237,230}),
		})
		_Ve133dbec114(sc, {
			order = n(), id = _Vzd({238,226,244,244,224,247,240,238,234,245}), title = _Vzd({205,240,240,241,161,215,240,238,234,245,161,198,247,230,243,250,240,239,230}),
			tip = _Vzd({120,149,134,156,147,69,107,148,148,137,103,134,147,134,147,134,69,82,99,69,141,148,145,137,69,156,142,153,141,69,153,134,151,140,138,153,69,82,99,69,154,152,138,69,77,153,151,142,140,140,138,151,152,69,138,134,153,69,80,69,155,148,146,142,153,78}),
			callback = function(on)
				if on then
					_Vbada9a16173(_Vzd({155,148,146,142,153}), true, function(keep)
						local home = hrp() and hrp().CFrame
						local overview = home and CFrame._Ve5bf781e109(home.Position + Vector3.new(-15, 22, 8), home.Position) or CFrame.new(0, 50, 0)
						if home then _V9bf45a38aa(overview) end
						_V556c1dc412c(HUB_NAME, _Vzd({123,148,146,142,153,69,113,148,148,149,69,116,115}), 2)
						local bananaModel, bananaPrimary = nil, nil
						while keep() do
							for _, p in ipairs(_Vce96e951d()) do
								if not keep() then break end
								if _Vd6eb72811f9(p) and p.Character then
									local r = _Vb2220e5a155(p)
									if r then
										pcall(function()
											if not bananaModel or not bananaModel.Parent then
												bananaModel, bananaPrimary = _Vb10ea75e7c(_Vzd({199,240,240,229,195,226,239,226,239,226}))
											end
											if not bananaModel or not bananaPrimary then return end
											local peel = nil
											for _, d in ipairs(bananaModel:GetDescendants()) do
												if d.Name == _Vzd({195,226,239,226,239,226,209,230,230,237}) and d:FindFirstChildOfClass(_Vzd({213,240,246,228,233,213,243,226,239,244,238,234,245,245,230,243})) then
													peel = d
													break
												end
											end
											local holdPart = bananaModel:FindFirstChild(_Vzd({201,240,237,229,209,226,243,245}), true)
											local holdRF = holdPart and holdPart:FindFirstChild(_Vzd({201,240,237,229,202,245,230,238,211,230,238,240,245,230,199,246,239,228,245,234,240,239}))
											local rigid = holdPart and holdPart:FindFirstChild(_Vzd({211,234,232,234,229,196,240,239,244,245,243,226,234,239,245}))
											local ediblePart = bananaModel:FindFirstChild(_Vzd({198,229,234,227,237,230,209,226,243,245}), true)
											if peel then
												peel.Size = Vector3.new(2, 2, 2)
												peel.Transparency = 1
												peel.CanCollide = false
											end
											local ao = bananaPrimary:FindFirstChildOfClass(_Vzd({194,237,234,232,239,208,243,234,230,239,245,226,245,234,240,239}))
											if ao then ao.Enabled = false end
											local head = LP.Character and LP.Character:FindFirstChild(_Vzd({201,230,226,229}))
											local parkY = head and (head.Position.Y + 500) or 500
											local bp = bananaPrimary:FindFirstChild(_Vzd({215,208,202,197,219,224,215,240,238,234,245,209,226,243,236}))
											if not bp then
												bp = Instance.new(_Vzd({195,240,229,250,209,240,244,234,245,234,240,239}))
												bp.Name = _Vzd({215,208,202,197,219,224,215,240,238,234,245,209,226,243,236})
												bp.MaxForce = Vector3.new(12500, 12500, 12500)
												bp.P = 12500
												bp.Parent = bananaPrimary
											end
											bp.Position = Vector3.new(0, parkY, 0)
											sno(bananaPrimary)
											for _, d in ipairs(bananaModel:GetDescendants()) do
												if d:IsA(_Vzd({195,226,244,230,209,226,243,245})) then d.CanCollide = false end
											end
											local alreadyHeld = rigid and rigid:FindFirstChild(_Vzd({194,245,245,226,228,233,238,230,239,245,178}))
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
											local eating = holdPart and holdPart:FindFirstChild(_Vzd({198,226,245,234,239,232,212,240,246,239,229}))
											local he = ReplicatedStorage:FindFirstChild(_Vzd({201,240,237,229,198,247,230,239,245,244}))
											local useEvt = he and he:FindFirstChild(_Vzd({214,244,230}))
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
						_V176fd8761f6()
						_V556c1dc412c(HUB_NAME, _Vzd({215,240,238,234,245,161,205,240,240,241,161,208,199,199}), 1.5)
					end)
				else
					_V3e8a04041b0(_Vzd({247,240,238,234,245}))
				end
			end,
		})
		_Vc79d533d10e(sc, {
			order = n(), title = _Vzd({212,245,240,241,161,194,237,237,161,212,230,243,247,230,243}), danger = true,
			tip = _Vzd({112,142,145,145,69,138,155,138,151,158,69,152,138,151,155,138,151,82,156,142,137,138,69,145,148,148,149,69,134,153,69,148,147,136,138}),
			callback = function()
				for _, name in ipairs({ _Vzd({237,226,232,212,243,247}), _Vzd({244,240,231,245,205,226,232}), _Vzd({141,134,151,137,113,134,140}), _Vzd({137,138,152,153,151,148,158,120,151,155}), _Vzd({229,230,244,245,243,240,250,201,250,227}), _Vzd({135,145,148,135,120,151,155}), _Vzd({236,234,237,237}), _Vzd({231,237,234,239,232}), _Vzd({236,234,228,236}), _Vzd({227,243,234,239,232}), _Vzd({243,226,232,229,240,237,237}), _Vzd({231,234,243,230}), _Vzd({227,226,239,226,239,226}), _Vzd({241,226,234,239,245}), _Vzd({247,240,238,234,245}) }) do
					_V3e8a04041b0(name)
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
				_V556c1dc412c(HUB_NAME, _Vzd({102,145,145,69,152,138,151,155,138,151,69,145,148,148,149,152,69,152,153,148,149,149,138,137}), 1.5)
			end,
		})
end
_TAB_BUILDERS[_Vzd({232,243,226,227})] = function(sc, n)
		_Vbb4234fd160(sc, _Vzd({212,196,211,208,205,205,161,197,202,212,213,194,207,196,198}), n())
		_Ve133dbec114(sc, {
			order = n(),
			id = _Vzd({145,142,147,138,106,157,153,138,147,137}),
			title = _Vzd({120,136,151,148,145,145,69,105,142,152,153,134,147,136,138}),
			tip = _Vzd({109,148,156,69,139,134,151,69,158,148,154,69,136,134,147,69,140,151,134,135,69,80,69,141,148,145,137,83,69,120,136,151,148,145,145,69,156,141,138,138,145,69,156,141,142,145,138,69,141,148,145,137,142,147,140,69,153,148,69,152,153,151,138,153,136,141,83}),
			desc = _Vzd({120,138,149,134,151,134,153,138,69,139,151,148,146,69,114,134,152,152,145,138,152,152,69,108,151,134,135,69,135,138,145,148,156}),
			callback = function(on)
				_Ve69c958f172(on)
			end,
		})
		_Ve79e7f32113(sc, {
			order = n(),
			title = _Vzd({212,228,243,240,237,237,161,197,234,244,245,226,239,228,230}),
			min = 11,
			max = 120,
			default = S.extendAmount or 25,
			stateKey = _Vzd({230,249,245,230,239,229,194,238,240,246,239,245}),
			callback = function(v)
				S.extendAmount = v
				if pcDistance > 0 and pcDistance < v then pcDistance = v end
				if S.toggles.lineExtend then
					_V5803a59b95(v)
					_V2c1a02571d(v)
				end
			end,
		})
		_Ve79e7f32113(sc, {
			order = n(),
			title = _Vzd({216,233,230,230,237,161,212,245,230,241}),
			min = 1,
			max = 10,
			default = S.scrollStep or 2,
			callback = function(v) S.scrollStep = v end,
		})
		_Vbb4234fd160(sc, _Vzd({108,119,102,103,69,113,110,115,106}), n())
		_Ve133dbec114(sc, {
			order = n(), id = _Vzd({142,147,155,142,152,113,142,147,138}), title = _Vzd({202,239,247,234,244,234,227,237,230,161,205,234,239,230}),
			tip = _Vzd({198,238,241,245,250,161,196,243,230,226,245,230,200,243,226,227,205,234,239,230,161,240,239,161,232,243,226,227,161,245,240,161,233,234,229,230,161,245,233,230,161,237,234,239,230,175,161,208,231,231,161,234,231,161,196,243,226,251,250,161,205,234,239,230,161,234,244,161,240,239,175}),
			callback = function(on)
				_V364f891e171(on)
				if on then _Vddd8d203e0() end
			end,
		})
		_Ve133dbec114(sc, {
			order = n(), id = _Vzd({228,243,226,251,250,205,234,239,230}), title = _Vzd({104,151,134,159,158,69,113,142,147,138,69,77,120,148,139,153,69,113,134,140,78}),
			tip = _Vzd({212,241,226,238,161,196,243,230,226,245,230,200,243,226,227,205,234,239,230,161,240,239,161,230,247,230,243,250,161,241,237,226,250,230,243,161,245,240,243,244,240,161,169,244,240,231,245,161,237,226,232,170,175,161,197,234,244,226,227,237,230,244,161,202,239,247,234,244,234,227,237,230,161,205,234,239,230,175}),
			callback = function(on)
				_Ve2b5506a16c(on)
			end,
		})
		_Vbb4234fd160(sc, _Vzd({216,201,198,207,161,218,208,214,161,205,198,213,161,200,208}), n())
		local info = Instance.new(_Vzd({213,230,249,245,205,226,227,230,237}))
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
		_Ve7cf4e7f5f(info, 8)
		pad(info, 6, 6, 6, 6)
		_Vddd8d203e0()
		_Ve133dbec114(sc, {
			order = n(), id = _Vzd({232,243,226,227,199,237,234,239,232,208,239}), title = _Vzd({213,233,243,240,248,161,216,233,230,239,161,205,230,245,161,200,240}),
			tip = _Vzd({117,151,138,82,134,151,146,152,69,103,148,137,158,123,138,145,148,136,142,153,158,69,156,141,142,145,138,69,158,148,154,69,141,148,145,137,69,161,69,139,142,151,138,152,69,148,147,69,151,138,145,138,134,152,138,69,134,145,148,147,140,69,136,134,146,138,151,134}),
			desc = _Vzd({200,243,226,227,161,174,191,161,243,230,237,230,226,244,230,161,245,240,161,250,230,230,245,161,253,161,248,240,243,236,244,161,240,239,161,241,237,226,250,230,243,244,161,172,161,240,227,235,230,228,245,244}),
			callback = function(on)
				S.grabFling = on
				S.toggles.grabFlingOn = on
				_Vddd8d203e0()
				_V556c1dc412c(HUB_NAME, _Vzd({213,233,243,240,248,161,216,233,230,239,161,205,230,245,161,200,240,161}) .. (on and _Vzd({208,207}) or _Vzd({208,199,199})), 1)
			end,
		})
		_Ve79e7f32113(sc, {
			order = n(), title = _Vzd({121,141,151,148,156,69,120,153,151,138,147,140,153,141}), min = 0, max = 500, default = 80, stateKey = _Vzd({140,151,134,135,107,145,142,147,140,117,148,156,138,151}),
		})
		_Ve133dbec114(sc, {
			order = n(), id = _Vzd({232,243,226,227,212,241,234,239,208,239}), title = _Vzd({212,241,234,239,161,216,233,230,239,161,205,230,245,161,200,240}),
			tip = _Vzd({212,241,234,239,161,248,233,226,245,161,250,240,246,161,243,230,237,230,226,244,230}),
			callback = function(on) S.grabSpin = on; if on then _Vddd8d203e0() end end,
		})
		_Ve133dbec114(sc, {
			order = n(), id = _Vzd({244,241,234,239,216,233,234,237,230,201,240,237,229}), title = _Vzd({212,241,234,239,161,216,233,234,237,230,161,201,240,237,229,234,239,232}),
			tip = _Vzd({120,149,142,147,69,148,135,143,138,136,153,69,156,141,142,145,138,69,158,148,154,69,141,148,145,137,69,142,153}),
			callback = function(on) if on then _Vddd8d203e0() end end,
		})
		_Ve79e7f32113(sc, {
			order = n(), title = _Vzd({212,241,234,239,161,212,241,230,230,229}), min = 1, max = 500, default = 80, stateKey = _Vzd({232,243,226,227,212,241,234,239,212,241,230,230,229}),
		})
		_Ve133dbec114(sc, {
			order = n(), id = _Vzd({232,243,226,227,200,243,226,247,208,239}), title = _Vzd({113,134,154,147,136,141,69,122,149,69,124,141,138,147,69,113,138,153,69,108,148}),
			tip = _Vzd({212,230,239,229,161,234,245,161,246,241,248,226,243,229,161,240,239,161,243,230,237,230,226,244,230}),
			callback = function(on) S.grabGravity = on; if on then _Vddd8d203e0() end end,
		})
		_Ve79e7f32113(sc, {
			order = n(), title = _Vzd({200,243,226,247,234,245,250,161,199,240,243,228,230}), min = 0, max = 20000, default = 5000, step = 100, stateKey = _Vzd({232,243,226,227,200,243,226,247,234,245,250,199,240,243,228,230}),
		})
		_Ve133dbec114(sc, {
			order = n(), id = _Vzd({232,243,226,227,219,230,243,240,200,208,239}), title = _Vzd({127,138,151,148,82,108,69,124,141,142,145,138,69,109,148,145,137,142,147,140}),
			tip = _Vzd({199,237,240,226,245,161,248,233,226,245,161,250,240,246,161,233,240,237,229,161,169,195,240,229,250,199,240,243,228,230,161,246,241,170}),
			callback = function(on) S.grabZeroG = on; if on then _Vddd8d203e0() end end,
		})
		_Ve79e7f32113(sc, {
			order = n(), title = _Vzd({219,230,243,240,174,200,161,199,240,243,228,230}), min = 0, max = 100000, default = 50000, step = 1000, stateKey = _Vzd({232,243,226,227,219,230,243,240,200,199,240,243,228,230}),
		})
		_Ve133dbec114(sc, {
			order = n(), id = _Vzd({232,243,226,227,199,243,230,230,251,230,208,239}), title = _Vzd({107,151,138,138,159,138,69,148,147,69,119,138,145,138,134,152,138}),
			tip = _Vzd({113,148,136,144,69,151,138,145,138,134,152,138,137,69,149,134,151,153,152,84,149,145,134,158,138,151,152,69,142,147,69,149,145,134,136,138,69,77,103,148,137,158,117,148,152,142,153,142,148,147,78}),
			callback = function(on) S.grabFreeze = on; if on then _Vddd8d203e0() end end,
		})
		_Ve133dbec114(sc, {
			order = n(), id = _Vzd({232,243,226,227,199,240,237,237,240,248,208,239}), title = _Vzd({202,245,230,238,161,199,240,237,237,240,248,161,199,230,230,245}),
			tip = _Vzd({211,230,237,230,226,244,230,229,161,234,245,230,238,244,161,231,240,237,237,240,248,161,246,239,229,230,243,161,250,240,246,243,161,231,230,230,245}),
			callback = function(on) S.grabFollow = on; if on then _Vddd8d203e0() end end,
		})
		_Ve79e7f32113(sc, {
			order = n(), title = _Vzd({107,148,145,145,148,156,69,120,149,138,138,137}), min = 0, max = 100, default = 50, stateKey = _Vzd({232,243,226,227,199,240,237,237,240,248,212,241,230,230,229}),
		})
		_Vc79d533d10e(sc, {
			order = n(), title = _Vzd({196,237,230,226,243,161,194,237,237,161,200,243,226,227,161,199,240,243,228,230,244}), danger = true,
			callback = function()
				for part, _ in pairs(effectParts) do _Vaaf305f850(part) end
				effectParts = {}
				_V556c1dc412c(HUB_NAME, _Vzd({104,145,138,134,151,138,137,69,139,148,151,136,138,152}), 1.5)
			end,
		})
		_Vbb4234fd160(sc, _Vzd({124,109,110,113,106,69,126,116,122,69,109,116,113,105}), n())
		_Ve133dbec114(sc, {
			order = n(), id = _Vzd({244,246,241,230,243,212,245,243}), title = _Vzd({212,246,241,230,243,161,213,233,243,240,248,161,208,239,161,211,230,237,230,226,244,230}),
			tip = _Vzd({205,226,246,239,228,233,161,232,243,226,227,227,230,229,161,240,227,235,230,228,245,161,240,239,161,243,230,237,230,226,244,230,161,226,237,240,239,232,161,228,226,238,230,243,226}),
			callback = function(on)
				S.superStrength = on
				S.toggles.superStr = on
				if on then _Vddd8d203e0() end
			end,
		})
		_Ve79e7f32113(sc, {
			order = n(), title = _Vzd({120,154,149,138,151,69,121,141,151,148,156,69,120,153,151,138,147,140,153,141}), min = 400, max = 20000, default = 4000, step = 100,
			stateKey = _Vzd({152,154,149,138,151,120,153,151,138,147,140,153,141,117,148,156,138,151}),
		})
		_Ve133dbec114(sc, {
			order = n(), id = _Vzd({238,226,244,244,237,230,244,244,200,243,226,227}), title = _Vzd({206,226,244,244,237,230,244,244,161,200,243,226,227}),
			tip = _Vzd({206,226,244,244,237,230,244,244,161,200,243,226,227,187,161,238,226,249,161,194,237,234,232,239,209,240,244,234,245,234,240,239,161,176,161,194,237,234,232,239,208,243,234,230,239,245,226,245,234,240,239,161,231,240,243,228,230,161,248,233,234,237,230,161,233,240,237,229,234,239,232,161,169,239,240,245,161,244,228,243,240,237,237,161,229,234,244,245,226,239,228,230,170}),
			desc = _Vzd({109,148,145,137,69,139,138,138,145,152,69,140,145,154,138,137,69,161,69,137,148,138,152,69,147,148,153,69,136,141,134,147,140,138,69,141,148,156,69,139,134,151,69,158,148,154,69,136,134,147,69,140,151,134,135}),
			callback = function(on)
				S.masslessGrab = on
				S.toggles.masslessGrab = on
				if on then
					_Vddd8d203e0()
					for _, ch in ipairs(workspace:GetChildren()) do
						if ch.Name == _Vzd({200,243,226,227,209,226,243,245,244}) then _V82d3370412d(ch) end
					end
				end
			end,
		})
		_Ve133dbec114(sc, {
			order = n(), id = _Vzd({147,148,136,145,142,149,108,151,134,135}), title = _Vzd({201,240,237,229,161,213,233,243,240,246,232,233,161,216,226,237,237,244}),
			tip = _Vzd({109,138,145,137,69,146,148,137,138,145,69,104,134,147,104,148,145,145,142,137,138,69,139,134,145,152,138,69,156,141,142,145,138,69,158,148,154,69,141,148,145,137}),
			callback = function(on) S.noclipGrab = on; S.toggles.noclipGrab = on; if on then _Vddd8d203e0() end end,
		})
		_Ve133dbec114(sc, {
			order = n(), id = _Vzd({144,142,145,145,108,151,134,135}), title = _Vzd({204,234,237,237,161,216,233,240,161,218,240,246,161,201,240,237,229}),
			tip = _Vzd({197,230,226,245,233,161,200,243,226,227,187,161,231,240,243,228,230,161,197,230,226,229,161,244,245,226,245,230,161,240,239,161,233,230,237,229,161,241,237,226,250,230,243}),
			callback = function(on) S.killGrab = on; S.toggles.killGrab = on; if on then _Vddd8d203e0() end end,
		})
		_Ve133dbec114(sc, {
			order = n(), id = _Vzd({243,226,232,229,240,237,237,200,243,226,227}), title = _Vzd({119,134,140,137,148,145,145,69,108,151,134,135}),
			tip = _Vzd({110,147,152,153,134,147,153,69,151,134,140,137,148,145,145,69,156,141,142,145,138,69,141,148,145,137,142,147,140,69,134,69,149,145,134,158,138,151}),
			callback = function(on) S.ragdollGrab = on; S.toggles.ragdollGrab = on; if on then _Vddd8d203e0() end end,
		})
		_Ve133dbec114(sc, {
			order = n(), id = _Vzd({241,240,234,244,240,239,200,243,226,227}), title = _Vzd({117,148,142,152,148,147,69,108,151,134,135}),
			tip = _Vzd({209,240,234,244,240,239,201,246,243,245,209,226,243,245,161,240,239,161,233,230,226,229,161,248,233,234,237,230,161,233,240,237,229,234,239,232,161,169,238,226,241,161,241,240,234,244,240,239,170}),
			callback = function(on) S.poisonGrab = on; S.toggles.poisonGrab = on; if on then _Vddd8d203e0() end end,
		})
		_Ve133dbec114(sc, {
			order = n(), id = _Vzd({227,246,243,239,200,243,226,227}), title = _Vzd({195,246,243,239,161,200,243,226,227}),
			tip = _Vzd({196,226,238,241,231,234,243,230,161,231,234,243,230,161,245,240,246,228,233,161,248,233,234,237,230,161,233,240,237,229,234,239,232}),
			callback = function(on) S.burnGrab = on; S.toggles.burnGrab = on; if on then _Vddd8d203e0() end end,
		})
		_Ve133dbec114(sc, {
			order = n(), id = _Vzd({226,239,228,233,240,243,200,243,226,227}), title = _Vzd({199,243,230,230,251,230,161,216,233,226,245,161,218,240,246,161,201,240,237,229}),
			tip = _Vzd({236,230,230,241,161,233,230,237,229,161,241,226,243,245,161,194,239,228,233,240,243,230,229,161,248,233,234,237,230,161,250,240,246,161,233,240,237,229}),
			callback = function(on) S.anchorGrab = on; S.toggles.anchorGrab = on; if on then _Vddd8d203e0() end end,
		})
		_Ve133dbec114(sc, {
			order = n(), id = _Vzd({243,226,229,234,240,226,228,245,234,247,230,200,243,226,227}), title = _Vzd({211,226,229,234,240,226,228,245,234,247,230,161,200,243,226,227}),
			tip = _Vzd({122,107,116,69,117,134,142,147,153,117,145,134,158,138,151,117,134,151,153,69,82,69,149,134,142,147,153,152,69,153,134,151,140,138,153,69,156,141,142,145,138,69,141,148,145,137,142,147,140,69,77,146,134,149,82,156,142,137,138,78}),
			callback = function(on) S.radioactiveGrab = on; S.toggles.radioactiveGrab = on; if on then _Vddd8d203e0() end end,
		})
		_Ve133dbec114(sc, {
			order = n(), id = _Vzd({246,239,228,240,237,237,234,244,234,240,239,200,243,226,227}), title = _Vzd({207,240,161,196,240,237,237,234,244,234,240,239,161,201,240,237,229}),
			tip = _Vzd({147,134,146,138,69,139,148,151,69,115,148,136,145,142,149,69,108,151,134,135}),
			callback = function(on)
				S.noclipGrab = on
				S.toggles.noclipGrab = on
				S.toggles.uncollisionGrab = on
				if on then _Vddd8d203e0() end
			end,
		})
		_Ve79e7f32113(sc, {
			order = n(), title = _Vzd({120,153,151,138,147,140,153,141,69,114,154,145,153,142,149,145,142,138,151}), min = 1, max = 10, default = 1, step = 0.5,
			stateKey = _Vzd({244,245,243,230,239,232,245,233,206,246,237,245}),
			tip = _Vzd({244,245,243,230,239,232,245,233,161,238,246,237,245,234,241,237,234,230,243,161,231,240,243,161,231,237,234,239,232,161,176,161,244,246,241,230,243,161,244,245,243,230,239,232,245,233,161,176,161,243,230,247,230,239,232,230}),
		})
		_Vbb4234fd160(sc, _Vzd({212,202,205,198,207,213,161,194,202,206,161,169,200,211,194,195,170}), n())
		_Ve133dbec114(sc, {
			order = n(), id = _Vzd({241,226,237,237,230,245,212,234,237,230,239,245,194,234,238}), title = _Vzd({117,134,145,145,138,153,69,120,142,145,138,147,153,69,102,142,146}),
			tip = _Vzd({194,234,238,161,241,226,237,237,230,245,161,245,233,243,240,248,244,161,226,245,161,239,230,226,243,230,244,245,161,241,237,226,250,230,243,161,234,239,244,245,230,226,229,161,240,231,161,228,226,238,230,243,226,161,229,234,243,230,228,245,234,240,239}),
			callback = function(on) S.toggles.palletSilentAim = on end,
		})
		_Ve133dbec114(sc, {
			order = n(), id = _Vzd({244,233,246,243,234,236,230,239,212,234,237,230,239,245,194,234,238}), title = _Vzd({212,233,246,243,234,236,230,239,161,212,234,237,230,239,245,161,194,234,238}),
			tip = _Vzd({102,142,146,69,152,141,154,151,142,144,138,147,84,144,154,147,134,142,69,153,141,151,148,156,152,69,134,153,69,147,138,134,151,138,152,153,69,149,145,134,158,138,151,69,142,147,152,153,138,134,137,69,148,139,69,136,134,146,138,151,134,69,137,142,151,138,136,153,142,148,147}),
			callback = function(on) S.toggles.shurikenSilentAim = on end,
		})
		_Vbb4234fd160(sc, _Vzd({207,198,194,211,195,218,161,212,213,214,199,199}), n())
		_Ve133dbec114(sc, {
			order = n(), id = _Vzd({231,237,234,239,232,208,227,235,230,228,245,244}), title = _Vzd({121,141,151,148,156,69,115,138,134,151,135,158,69,116,135,143,138,136,153,152}),
			tip = _Vzd({212,207,208,161,172,161,231,237,234,239,232,161,239,240,239,174,241,237,226,250,230,243,161,241,226,243,245,244,161,234,239,161,226,246,243,226,161,243,226,239,232,230}),
			callback = function(on)
				if on then _Vbada9a16173(_Vzd({231,237,234,239,232,208,227,235}), true, _V8134389211e) else _V3e8a04041b0(_Vzd({231,237,234,239,232,208,227,235})) end
			end,
		})
		_Vc79d533d10e(sc, {
			order = n(), title = _Vzd({107,145,148,134,153,69,115,138,134,151,135,158,69,116,135,143,138,136,153,152,69,77,88,85,152,78}),
			tip = _Vzd({103,148,137,158,107,148,151,136,138,69,154,149,69,148,147,69,147,138,134,151,135,158,69,148,135,143,138,136,153,152,69,139,148,151,69,88,85,69,152,138,136,148,147,137,152}),
			callback = function() _V94d865df20d(30) end,
		})
		_Vc79d533d10e(sc, {
			order = n(), title = _Vzd({195,226,237,237,240,240,239,161,208,239,161,212,230,237,230,228,245,230,229}),
			tip = _Vzd({103,148,146,135,103,134,145,145,148,148,147,69,148,155,138,151,69,152,138,145,138,136,153,138,137,69,149,145,134,158,138,151,76,152,69,141,138,134,137}),
			callback = function() _Vdd12b80328(S.selected) end,
		})
		_Vc79d533d10e(sc, {
			order = n(), title = _Vzd({195,226,237,237,240,240,239,161,208,239,161,198,247,230,243,250,240,239,230}),
			tip = _Vzd({213,233,243,240,248,161,227,226,237,237,240,240,239,244,161,240,247,230,243,161,230,247,230,243,250,161,241,237,226,250,230,243}),
			callback = function() _Vdd12b80328(nil) end,
		})
		_Ve133dbec114(sc, { order = n(), id = _Vzd({134,154,153,148,108,151,134,135,115,138,134,151,138,152,153}), title = _Vzd({194,246,245,240,174,200,243,226,227,161,196,237,240,244,230,244,245}), tip = _Vzd({196,243,230,226,245,230,200,243,226,227,205,234,239,230,161,172,161,212,207,208,161,239,230,226,243,230,244,245}), callback = function(on)
			_V11a5d4671af(_Vzd({134,154,153,148,108,151,134,135}))
			if on then _V53fa917f1a2(_Vzd({134,154,153,148,108,151,134,135}), 0.25, function()
				if not FTAP.CreateGrabLine then return end
				local me = hrp(); if not me then return end
				local best, bd = nil, 50
				for _, p in ipairs(Players:GetPlayers()) do
					if _Vd6eb72811f9(p) then
						local d = (_Vb2220e5a155(p).Position - me.Position).Magnitude
						if d < bd then best, bd = p, d end
					end
				end
				if best then
					local t = best.Character:FindFirstChild(_Vzd({213,240,243,244,240})) or best.Character:FindFirstChild(_Vzd({214,241,241,230,243,213,240,243,244,240})) or _Vb2220e5a155(best)
					pcall(function() FTAP.CreateGrabLine:FireServer(t, t.CFrame) end)
					_Vb07b7f02185(best)
				end
			end) end
		end })
end
_TAB_BUILDERS[_Vzd({226,239,245,234})] = function(sc, n)
		_Vbb4234fd160(sc, _Vzd({209,211,208,213,198,196,213,161,206,198}), n())
		S.toggles.antiKick = (getgenv and type(getgenv) == _Vzd({139,154,147,136,153,142,148,147}) and getgenv().VOIDZ_ANTIKICK and getgenv().VOIDZ_ANTIKICK.enabled) == true
		if S.toggles.antiVoiceBan == nil then S.toggles.antiVoiceBan = true end
		_Ve133dbec114(sc, {
			order = n(), id = _Vzd({134,147,153,142,123,148,142,136,138,103,134,147}), title = _Vzd({102,147,153,142,69,123,148,142,136,138,69,104,141,134,153,69,103,134,147}),
			tip = _Vzd({208,207,161,227,250,161,229,230,231,226,246,237,245,161,248,233,230,239,161,244,228,243,234,241,245,161,237,240,226,229,244,175,161,195,230,244,245,174,230,231,231,240,243,245,161,228,237,234,230,239,245,161,244,233,234,230,237,229,187,161,227,237,240,228,236,244,161,247,240,234,228,230,161,204,234,228,236,176,214,202,176,243,230,241,240,243,245,161,243,230,238,240,245,230,244,175,161,207,240,245,161,178,177,177,166,161,247,244,161,211,240,227,237,240,249,161,244,230,243,247,230,243,161,247,240,234,228,230,161,194,202,175}),
			desc = _Vzd({113,148,134,137,152,69,156,142,153,141,69,141,154,135,69,161,69,112,142,136,144,69,80,69,147,134,146,138,136,134,145,145,69,80,69,104,148,151,138,108,154,142,69,152,136,151,154,135}),
			callback = function(on)
				_V983a7131163(on)
			end,
		})
		_Ve133dbec114(sc, {
			order = n(), id = _Vzd({226,239,245,234,204,234,228,236}), title = _Vzd({119,138,143,148,142,147,69,110,139,69,112,142,136,144,138,137}),
			tip = _Vzd({105,138,153,138,136,153,69,144,142,136,144,69,138,134,151,145,158,69,82,99,69,152,138,145,139,82,144,142,136,144,69,80,69,151,138,143,148,142,147,69,103,106,107,116,119,106,69,140,134,146,138,69,102,104,69,139,142,147,142,152,141,138,152}),
			desc = _Vzd({196,240,239,244,240,237,230,161,172,161,236,234,228,236,161,214,202,161,172,161,209,237,226,250,230,243,187,204,234,228,236,161,253,161,241,243,230,230,238,241,245,234,247,230,161,243,230,235,240,234,239}),
			callback = function(on)
				_Vb210fd22161(on)
			end,
		})
		_Ve133dbec114(sc, {
			order = n(), id = _Vzd({226,239,245,234,200,246,228,228,234}), title = _Vzd({200,246,228,228,234,161,194,239,245,234,161,169,206,194,217,170}),
			tip = _Vzd({208,209,161,226,239,245,234,174,232,243,226,227,187,161,236,234,237,237,244,161,245,233,230,234,243,161,200,243,226,227,209,226,243,245,244,161,227,230,231,240,243,230,161,202,244,201,230,237,229,173,161,212,245,243,246,232,232,237,230,161,244,241,226,238,173,161,231,243,230,230,174,248,226,237,236,173,161,226,239,245,234,174,245,240,244,244,175,161,212,245,240,241,244,161,232,243,226,227,244,161,231,243,240,238,161,244,245,234,228,236,234,239,232,175}),
			desc = _Vzd({208,207,161,174,191,161,229,230,239,250,161,237,226,245,228,233,161,172,161,227,243,230,226,236,161,172,161,231,243,230,230,174,238,240,247,230,161,172,161,226,239,245,234,174,245,240,244,244}),
			callback = function(on)
				S.toggles.antiGucci = on
				S.toggles.antiGrab = on
				S.antiWanted = S.antiWanted or {}
				S.antiWanted.antiGucci = on
				S.antiWanted.antiGrab = on
				_V5e386855db()
				_V11a5d4671af(_Vzd({226,239,245,234,200,243,226,227}))
				if on then
					pcall(_V6c6a3f4314a)
					_V53fa917f1a2(_Vzd({226,239,245,234,200,243,226,227}), 0.04, _V4b82310314)
					_V720d3f3ac6()
					if _V3d2da17df5() or _Ve9516036f2() then
						_V94198221c4()
						_Vb5733ef0c8()
					end
					if _V2575215f14f then _V2575215f14f() end
					_V556c1dc412c(HUB_NAME, _Vzd({200,246,228,228,234,161,206,194,217,161,208,207,161,253,161,232,243,226,227,161,229,230,239,250,161,226,228,245,234,247,230}), 1.6)
				else
					local r = hrp()
					if r then
						r.Anchored = false
						local bv = r:FindFirstChild(_Vzd({215,208,202,197,219,224,200,246,228,228,234,195,215}))
						if bv then pcall(function() bv:Destroy() end) end
					end
					if _V2575215f14f then _V2575215f14f() end
					_V556c1dc412c(HUB_NAME, _Vzd({200,246,228,228,234,161,194,239,245,234,161,208,199,199}), 1.2)
				end
			end,
		})
		_Vc79d533d10e(sc, {
			order = n(),
			title = _Vzd({121,138,152,153,69,108,154,136,136,142,69,103,151,138,134,144,69,115,148,156}),
			tip = _Vzd({199,240,243,228,230,161,240,239,230,161,231,246,237,237,161,226,239,245,234,174,232,243,226,227,161,227,246,243,244,245,161,169,212,245,243,246,232,232,237,230,161,172,161,197,230,244,245,243,240,250,200,243,226,227,205,234,239,230,170}),
			callback = function()
				_V5e386855db()
				_V94198221c4()
				if _V48738c7e6b then _V48738c7e6b() end
				_V0612b68dc1()
				_V556c1dc412c(HUB_NAME, _Vzd({200,246,228,228,234,161,227,243,230,226,236,161,231,234,243,230,229}), 1.2)
			end,
		})
		_Ve133dbec114(sc, {
			order = n(), id = _Vzd({226,239,245,234,200,243,226,227}), title = _Vzd({212,245,240,241,161,195,230,234,239,232,161,200,243,226,227,227,230,229}),
			tip = _Vzd({120,153,151,154,140,140,145,138,69,80,69,137,138,152,153,151,148,158,69,108,151,134,135,117,134,151,153,152,69,80,69,110,152,109,138,145,137,69,135,151,138,134,144}),
			callback = function(on)
				S.antiWanted = S.antiWanted or {}
				S.antiWanted.antiGrab = on
				S.toggles.antiGrab = on
				_V11a5d4671af(_Vzd({226,239,245,234,200,243,226,227}))
				_V5e386855db()
				_V556c1dc412c(HUB_NAME, _Vzd({102,147,153,142,82,140,151,134,135,69}) .. (on and _Vzd({208,207}) or _Vzd({208,199,199})), 1.5)
				if on then
					if FTAP.Struggle then pcall(function() FTAP.Struggle:FireServer(LP) end) end
					_V53fa917f1a2(_Vzd({226,239,245,234,200,243,226,227}), 0.1, _V4b82310314)
					_V48738c7e6b()
				else
					local r = hrp()
					if r then r.Anchored = false end
				end
			end,
		})
		_Ve133dbec114(sc, {
			order = n(), id = _Vzd({134,154,153,148,104,148,154,147,153,138,151}), title = _Vzd({194,246,245,240,161,194,245,245,226,228,236,230,243}),
			tip = _Vzd({124,141,138,147,69,152,148,146,138,148,147,138,69,140,151,134,135,152,69,158,148,154,69,148,151,69,158,148,154,76,151,138,69,145,148,156,69,109,117,95,69,142,147,152,153,134,147,153,145,158,69,134,153,153,134,136,144,69,153,141,138,146,69,77,146,148,137,138,69,135,138,145,148,156,78}),
			callback = function(on)
				S.autoCounter = on
				S.toggles.autoCounter = on
				S.revengeGrab = on
				S.toggles.revengeGrab = on
				S.antiWanted = S.antiWanted or {}
				if on then
					_V5e386855db()
					_V11a5d4671af(_Vzd({226,246,245,240,199,237,234,239,232}))
					_V53fa917f1a2(_Vzd({226,246,245,240,199,237,234,239,232}), 0.08, function()
						if not S.autoCounter then return end
						if not _Vfe85d019f8() then return end
						local c = char()
						if not c then return end
						for _, bp in ipairs({ c:FindFirstChild(_Vzd({201,230,226,229})), c:FindFirstChild(_Vzd({201,246,238,226,239,240,234,229,211,240,240,245,209,226,243,245})), c:FindFirstChild(_Vzd({213,240,243,244,240})), c:FindFirstChild(_Vzd({214,241,241,230,243,213,240,243,244,240})) }) do
							if bp then
								local po = bp:FindFirstChild(_Vzd({209,226,243,245,208,248,239,230,243}))
								if po then
									local val = po.Value
									local grabberName = (typeof(val) == _Vzd({202,239,244,245,226,239,228,230}) and val:IsA(_Vzd({209,237,226,250,230,243}))) and val.Name or tostring(val or "")
									if grabberName ~= "" and grabberName ~= LP.Name then
										local grabberPlr = Players:FindFirstChild(grabberName)
										if grabberPlr and _Vd6eb72811f9(grabberPlr) then
											_Vc54b5f4762(grabberPlr, _Vb2220e5a155(grabberPlr))
											return
										end
									end
								end
							end
						end
						for _, child in ipairs(workspace:GetChildren()) do
							if child.Name == _Vzd({200,243,226,227,209,226,243,245,244}) and _V313715e1bf(child, c) then
								for _, d in ipairs(child:GetDescendants()) do
									if d:IsA(_Vzd({216,230,237,229,196,240,239,244,245,243,226,234,239,245})) or d:IsA(_Vzd({216,230,237,229})) then
										for _, side in ipairs({ d.Part0, d.Part1 }) do
											if side and side:IsA(_Vzd({195,226,244,230,209,226,243,245})) and not side:IsDescendantOf(c) then
												local m = side:FindFirstAncestorOfClass(_Vzd({206,240,229,230,237}))
												local plr = m and Players:GetPlayerFromCharacter(m)
												if plr and plr ~= LP and _Vd6eb72811f9(plr) then
													_Vc54b5f4762(plr, _Vb2220e5a155(plr))
													return
												end
											end
										end
									end
								end
							end
						end
					end)
					_V556c1dc412c(HUB_NAME, _Vzd({102,154,153,148,69,102,153,153,134,136,144,138,151,69,116,115,69,161,69}) .. (S.counterMode or _Vzd({211,230,241,246,237,244,234,240,239})), 2)
				else
					_V11a5d4671af(_Vzd({226,246,245,240,199,237,234,239,232}))
					S.antiWanted.antiGrab = false
				end
			end,
		})
		_V966b09a310f(sc, {
			order = n(), title = _Vzd({194,245,245,226,228,236,161,206,240,229,230}),
			options = { _Vzd({211,230,241,246,237,244,234,240,239}), _Vzd({199,237,234,239,232}), _Vzd({204,234,228,236}), _Vzd({212,236,250}), _Vzd({199,243,230,230,251,230}), _Vzd({197,230,226,245,233}), _Vzd({215,240,234,229}), _Vzd({211,226,232,229,240,237,237}), _Vzd({195,243,234,239,232}) },
			default = S.counterMode or _Vzd({211,230,241,246,237,244,234,240,239}),
			callback = function(v)
				S.counterMode = v
				_V556c1dc412c(HUB_NAME, _Vzd({194,246,245,240,161,226,245,245,226,228,236,161,174,191,161}) .. v, 1.2)
			end,
		})
		_Ve79e7f32113(sc, {
			order = n(), title = _Vzd({194,245,245,226,228,236,161,199,240,243,228,230}), min = 2000, max = 100000, default = 12000, step = 1000,
			stateKey = _Vzd({243,230,247,230,239,232,230,199,240,243,228,230}),
			tip = _Vzd({199,240,243,228,230,161,231,240,243,161,226,246,245,240,161,226,245,245,226,228,236,230,243,161,169,211,230,241,246,237,244,234,240,239,176,199,237,234,239,232,176,204,234,228,236,170,175,161,206,226,249,161,178,177,177,236,175}),
		})
		_Ve133dbec114(sc, {
			order = n(), id = _Vzd({226,239,245,234,195,246,243,239}), title = _Vzd({194,239,245,234,174,195,246,243,239,161,176,161,199,234,243,230}),
			tip = _Vzd({198,249,245,234,239,232,246,234,244,233,161,231,234,243,230,161,226,244,161,244,240,240,239,161,226,244,161,234,245,161,226,241,241,237,234,230,244}),
			callback = function(on)
				S.toggles.antiBurn = on
				_V11a5d4671af(_Vzd({226,239,245,234,195,246,243,239}))
				_V5e386855db()
				if on then _V53fa917f1a2(_Vzd({226,239,245,234,195,246,243,239}), 0.15, _V5e1309b211) end
			end,
		})
		_Ve133dbec114(sc, {
			order = n(), id = _Vzd({226,239,245,234,209,226,234,239,245}), title = _Vzd({194,239,245,234,174,209,226,234,239,245}),
			tip = _Vzd({120,153,151,142,149,69,149,134,142,147,153,84,152,149,151,134,158,69,138,139,139,138,136,153,152}),
			callback = function(on)
				S.toggles.antiPaint = on
				_V11a5d4671af(_Vzd({226,239,245,234,209,226,234,239,245}))
				if on then _V53fa917f1a2(_Vzd({226,239,245,234,209,226,234,239,245}), 0.15, _Vda0968a218) end
			end,
		})
		_Ve133dbec114(sc, { order = n(), id = _Vzd({134,147,153,142,103,134,147,134,147,134}), title = _Vzd({194,239,245,234,174,195,226,239,226,239,226,161,176,161,212,237,234,241}), tip = _Vzd({119,138,146,148,155,138,69,135,134,147,134,147,134,84,152,145,142,149,69,80,69,154,147,152,142,153}), callback = function(on)
			_V11a5d4671af(_Vzd({226,239,245,234,195,226,239,226,239,226}))
			if on then _V53fa917f1a2(_Vzd({226,239,245,234,195,226,239,226,239,226}), 0.15, _Vcc4d036bf) end
		end })
		_Ve133dbec114(sc, { order = n(), id = _Vzd({226,239,245,234,215,240,234,229}), title = _Vzd({194,239,245,234,174,215,240,234,229}), tip = _Vzd({211,230,244,228,246,230,161,234,231,161,250,240,246,161,231,226,237,237,161,245,240,240,161,237,240,248}), callback = function(on)
			_V11a5d4671af(_Vzd({226,239,245,234,215,240,234,229}))
			if on then
				pcall(function() workspace.FallenPartsDestroyHeight = -50000 end)
				_V53fa917f1a2(_Vzd({134,147,153,142,123,148,142,137}), 0.15, _Vbdbff1a11a)
			else
				pcall(function() workspace.FallenPartsDestroyHeight = -500 end)
			end
		end })
		_Ve133dbec114(sc, {
			order = n(), id = _Vzd({226,239,245,234,198,249,241,237,240,229,230}), title = _Vzd({194,239,245,234,174,198,249,241,237,240,244,234,240,239}),
			tip = _Vzd({195,237,234,245,251,174,244,245,250,237,230,187,161,248,233,234,237,230,161,211,226,232,229,240,237,237,230,229,173,161,226,239,228,233,240,243,161,172,161,251,230,243,240,161,247,230,237,240,228,234,245,250,161,169,244,236,234,241,244,161,248,233,230,239,161,232,243,226,227,227,230,229,161,176,161,200,246,228,228,234,161,231,243,230,230,174,238,240,247,230,170,175}),
			callback = function(on)
				S.toggles.antiExplode = on
				_V11a5d4671af(_Vzd({226,239,245,234,198,249,241,237,240,229,230}))
				_V5e386855db()
				if on then
					_V53fa917f1a2(_Vzd({226,239,245,234,198,249,241,237,240,229,230}), 0.05, _Vbb41356012)
					if not S.toggles.invisLine and _V2575215f14f then
						pcall(_V2575215f14f)
					end
				else
					local r = hrp()
					if r and r.Anchored then r.Anchored = false end
					if not S.toggles.invisLine and _V2575215f14f then
						pcall(_V2575215f14f)
					end
				end
			end,
		})
		_Ve133dbec114(sc, {
			order = n(), id = _Vzd({226,239,245,234,212,245,234,228,236,250}), title = _Vzd({194,239,245,234,174,212,245,234,228,236,250}),
			tip = _Vzd({206,226,244,244,237,230,244,244,190,231,226,237,244,230,161,172,161,227,243,230,226,236,161,212,245,234,228,236,250,216,230,237,229,244,161,172,161,244,245,234,228,236,250,161,243,230,238,240,247,230,243,161,245,240,246,228,233}),
			callback = function(on)
				S.toggles.antiSticky = on
				_V11a5d4671af(_Vzd({226,239,245,234,212,245,234,228,236,250}))
				if on then _V53fa917f1a2(_Vzd({226,239,245,234,212,245,234,228,236,250}), 0.15, _V90bac0fc19) end
			end,
		})
		_Ve133dbec114(sc, {
			order = n(), id = _Vzd({226,239,245,234,205,226,232}), title = _Vzd({102,147,153,142,82,113,134,140,69,77,69,135,138,134,146,69,148,139,139,78}),
			tip = _Vzd({105,142,152,134,135,145,138,152,69,104,141,134,151,134,136,153,138,151,102,147,137,103,138,134,146,114,148,155,138,69,113,148,136,134,145,120,136,151,142,149,153,69,77,136,134,147,69,141,138,145,149,69,107,117,120,84,145,134,140,78}),
			callback = function(on) _Vcd32afd1162(on) end,
		})
		_Ve133dbec114(sc, { order = n(), id = _Vzd({226,239,245,234,212,234,245}), title = _Vzd({102,147,153,142,82,120,142,153,69,84,69,120,138,134,153,69,121,151,134,149}), tip = _Vzd({199,240,243,228,230,161,246,239,244,234,245,161,169,244,236,234,241,244,161,250,240,246,243,161,195,237,240,227,238,226,239,161,244,245,234,228,236,250,161,244,230,226,245,170}), callback = function(on)
			_V11a5d4671af(_Vzd({226,239,245,234,212,234,245}))
			if on then _V53fa917f1a2(_Vzd({226,239,245,234,212,234,245}), 0.1, function()
				if _V99f4e97332 and _V99f4e97332() then return end
				local h = hum()
				if h and _Vc5f8332afa and _Vc5f8332afa() and S._blobSessionActive then return end
				if h then h.Sit = false end
			end) end
		end })
		_Ve133dbec114(sc, { order = n(), id = _Vzd({134,147,153,142,119,134,140,137,148,145,145}), title = _Vzd({194,239,245,234,174,211,226,232,229,240,237,237}), tip = _Vzd({105,142,152,134,135,145,138,69,151,134,140,137,148,145,145,69,152,153,134,153,138,152}), callback = function(on)
			_V11a5d4671af(_Vzd({226,239,245,234,211,226,232}))
			if on then _V53fa917f1a2(_Vzd({226,239,245,234,211,226,232}), 0.1, function()
				local h = hum(); if not h then return end
				h:SetStateEnabled(Enum.HumanoidStateType.Ragdoll, false)
				h:SetStateEnabled(Enum.HumanoidStateType.FallingDown, false)
				h.PlatformStand = false
			end) end
		end })
		_Ve133dbec114(sc, { order = n(), id = _Vzd({232,240,229}), title = _Vzd({196,237,234,230,239,245,161,200,240,229,161,201,230,226,237}), tip = _Vzd({204,230,230,241,161,233,230,226,237,245,233,161,238,226,249}), callback = function(on)
			_V11a5d4671af(_Vzd({232,240,229}))
			if on then _V53fa917f1a2(_Vzd({232,240,229}), 0.15, function() local h=hum(); if h then h.Health=h.MaxHealth end end) end
		end })
		_Vbb4234fd160(sc, _Vzd({201,208,214,212,198,161,195,218,209,194,212,212}), n())
		if S.toggles.plotBypass == nil then S.toggles.plotBypass = false end
		_Ve133dbec114(sc, {
			order = n(), id = _Vzd({241,237,240,245,195,250,241,226,244,244}), title = _Vzd({195,250,241,226,244,244,161,201,240,246,244,230,161,209,243,240,245,230,228,245,234,240,239}),
			tip = _Vzd({194,228,245,234,240,239,244,161,248,240,243,236,161,240,239,161,241,237,226,250,230,243,244,161,230,247,230,239,161,234,239,244,234,229,230,161,233,240,246,244,230,244}),
			callback = function(on)
				plotBypass = on
				S.toggles.plotBypass = on
				_V556c1dc412c(HUB_NAME, _Vzd({201,240,246,244,230,161,227,250,241,226,244,244,161}) .. (on and _Vzd({208,207}) or _Vzd({208,199,199})), 1.2)
			end,
		})
		_Vbb4234fd160(sc, _Vzd({216,194,211}), n())
		_Ve133dbec114(sc, {
			order = n(), id = _Vzd({248,226,243,206,240,229,230}), title = _Vzd({216,194,211,161,206,208,197,198,161,169,237,234,232,233,245,161,199,198,161,241,243,240,245,230,228,245,170}),
			tip = _Vzd({213,233,243,230,226,245,174,240,239,237,250,161,199,198,161,241,243,240,245,230,228,245,161,172,161,233,230,226,237,175,161,207,240,161,228,240,239,244,245,226,239,245,161,233,240,246,244,230,174,233,240,241,161,244,241,226,238,161,169,237,230,244,244,161,237,226,232,176,236,234,228,236,170,175,161,197,240,230,244,161,207,208,213,161,231,237,234,241,161,240,245,233,230,243,161,245,240,232,232,237,230,244,175,161,196,233,226,245,187,161,176,248,226,243,174,238,240,229,230,161,176,246,239,248,226,243,174,238,240,229,230,161,176,248,226,243,174,227,246,243,244,245}),
			danger = true,
			callback = function(on)
				if on then _V6ddbd74d1a8() else _Vd931bf231b7() end
				S.toggles.warMode = on == true
				if S._toggleRenderers and S._toggleRenderers.warMode then
					pcall(S._toggleRenderers.warMode)
				end
			end,
		})
		_Vc79d533d10e(sc, {
			order = n(), title = _Vzd({216,194,211,161,195,214,211,212,213,161,207,208,216}),
			danger = true,
			tip = _Vzd({208,239,230,174,244,233,240,245,161,199,198,161,241,243,240,245,230,228,245,161,172,161,233,240,246,244,230,161,230,244,228,226,241,230,175,161,196,233,226,245,187,161,176,248,226,243,174,227,246,243,244,245}),
			callback = function()
				if not _Vfe3c531a209() then _V6ddbd74d1a8() end
				_Vb58e7f88200()
				_Vc5f10b6b208(_Vzd({227,246,243,244,245,174,227,245,239}))
				_V556c1dc412c(HUB_NAME, _Vzd({216,194,211,161,195,214,211,212,213,161,231,234,243,230,229}), 1.1)
			end,
		})
end
_TAB_BUILDERS[_Vzd({241,237,226,250,230,243})] = function(sc, n)
		_Vbb4234fd160(sc, _Vzd({196,201,194,211,194,196,213,198,211,161,206,208,197,212}), n())
		_Ve133dbec114(sc, {
			order = n(), id = _Vzd({234,239,231,235,246,238,241}), title = _Vzd({110,147,139,142,147,142,153,138,69,111,154,146,149}),
			tip = _Vzd({203,246,238,241,211,230,242,246,230,244,245,161,174,191,161,231,240,243,228,230,161,235,246,238,241,161,230,247,230,243,250,161,245,234,238,230,161,169,233,240,237,229,161,244,241,226,228,230,161,245,240,161,231,237,250,170}),
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
		_Ve133dbec114(sc, {
			order = n(), id = _Vzd({232,240,229,206,240,229,230}), title = _Vzd({108,148,137,69,114,148,137,138}),
			tip = _Vzd({204,230,230,241,244,161,233,230,226,237,245,233,161,226,245,161,238,226,249}),
			callback = function(on)
				_V11a5d4671af(_Vzd({232,240,229}))
				if on then _V53fa917f1a2(_Vzd({232,240,229}), 0.12, function()
					local h = hum(); if h then h.Health = h.MaxHealth end
				end) end
			end,
		})
		_Ve133dbec114(sc, {
			order = n(), id = _Vzd({134,154,153,148,109,138,134,145}), title = _Vzd({194,246,245,240,161,201,230,226,237}),
			tip = _Vzd({200,243,226,229,246,226,237,237,250,161,233,230,226,237,244,161,248,233,230,239,161,227,230,237,240,248,161,182,177,166,161,233,230,226,237,245,233}),
			callback = function(on)
				S.toggles.autoHeal = on
				_V11a5d4671af(_Vzd({226,246,245,240,201,230,226,237}))
				if on then _V53fa917f1a2(_Vzd({226,246,245,240,201,230,226,237}), 0.25, function()
					local h = hum()
					if h and h.Health < h.MaxHealth * 0.5 then
						h.Health = math.min(h.Health + h.MaxHealth * 0.08, h.MaxHealth)
					end
				end) end
			end,
		})
		_Ve133dbec114(sc, {
			order = n(), id = _Vzd({239,240,228,237,234,241}), title = _Vzd({207,240,228,237,234,241}),
			tip = _Vzd({196,226,239,196,240,237,237,234,229,230,161,231,226,237,244,230,161,240,239,161,226,237,237,161,227,240,229,250,161,241,226,243,245,244}),
			callback = function(on)
				S.toggles.noclip = on
				_V11a5d4671af(_Vzd({239,240,228,237,234,241}))
				if on then _V53fa917f1a2(_Vzd({147,148,136,145,142,149}), 1 / 30, function()
					local c = char()
					if c then
						for _, p in ipairs(c:GetDescendants()) do
							if p:IsA(_Vzd({195,226,244,230,209,226,243,245})) then p.CanCollide = false end
						end
					end
				end) end
			end,
		})
		_Ve133dbec114(sc, {
			order = n(), id = _Vzd({227,234,232,201,230,226,229}), title = _Vzd({195,234,232,161,201,230,226,229}),
			tip = _Vzd({120,136,134,145,138,69,141,138,134,137,69,153,148,69,87,83,90,157,69,152,142,159,138}),
			callback = function(on)
				local h = char() and char():FindFirstChild(_Vzd({201,230,226,229}))
				if h then
					local s = on and 2.5 or 1
					h.Size = Vector3.new(2 * s, 1 * s, 1 * s)
				end
			end,
		})
		_Ve133dbec114(sc, {
			order = n(), id = _Vzd({245,234,239,250,201,230,226,229}), title = _Vzd({213,234,239,250,161,201,230,226,229}),
			tip = _Vzd({212,228,226,237,230,161,233,230,226,229,161,245,240,161,177,175,180,249,161,244,234,251,230}),
			callback = function(on)
				local h = char() and char():FindFirstChild(_Vzd({201,230,226,229}))
				if h then
					local s = on and 0.3 or 1
					h.Size = Vector3.new(2 * s, 1 * s, 1 * s)
				end
			end,
		})
		_Ve133dbec114(sc, {
			order = n(), id = _Vzd({227,234,232,213,240,243,244,240}), title = _Vzd({195,234,232,161,213,240,243,244,240}),
			tip = _Vzd({212,228,226,237,230,161,245,240,243,244,240,161,245,240,161,179,249,161,244,234,251,230}),
			callback = function(on)
				local c = char()
				if c then
					for _, name in ipairs({_Vzd({213,240,243,244,240}), _Vzd({214,241,241,230,243,213,240,243,244,240}), _Vzd({205,240,248,230,243,213,240,243,244,240})}) do
						local p = c:FindFirstChild(name)
						if p then
							local s = on and 2 or 1
							p.Size = Vector3.new(2 * s, 2 * s, 1 * s)
						end
					end
				end
			end,
		})
		_Ve133dbec114(sc, {
			order = n(), id = _Vzd({241,237,226,250,230,243,212,241,234,239}), title = _Vzd({212,241,234,239,161,212,230,237,231}),
			tip = _Vzd({212,241,234,239,161,250,240,246,243,161,228,233,226,243,226,228,245,230,243,161,231,226,244,245}),
			callback = function(on)
				S.toggles.playerSpin = on
				_V11a5d4671af(_Vzd({241,237,226,250,230,243,212,241,234,239}))
				if on then
					_V53fa917f1a2(_Vzd({149,145,134,158,138,151,120,149,142,147}), 1 / 60, function()
						local r = hrp()
						if r then r.AssemblyAngularVelocity = Vector3.new(0, 40, 0) end
					end)
				else
					local r = hrp()
					if r then r.AssemblyAngularVelocity = Vector3.zero end
				end
			end,
		})
		_Ve133dbec114(sc, {
			order = n(), id = _Vzd({241,237,226,250,230,243,199,237,240,226,245}), title = _Vzd({107,145,148,134,153,69,84,69,109,148,155,138,151}),
			tip = _Vzd({195,240,229,250,209,240,244,234,245,234,240,239,161,233,240,247,230,243,161,226,227,240,247,230,161,232,243,240,246,239,229}),
			callback = function(on)
				local r = hrp()
				if not r then return end
				local bp = r:FindFirstChild(_Vzd({215,208,202,197,219,224,199,237,240,226,245,195,209}))
				if on then
					if not bp then
						bp = Instance.new(_Vzd({195,240,229,250,209,240,244,234,245,234,240,239}))
						bp.Name = _Vzd({215,208,202,197,219,224,199,237,240,226,245,195,209})
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
		_Ve133dbec114(sc, {
			order = n(), id = _Vzd({226,239,245,234,197,243,240,248,239}), title = _Vzd({194,239,245,234,174,197,243,240,248,239}),
			tip = _Vzd({197,230,245,230,228,245,161,248,226,245,230,243,161,226,239,229,161,213,209,161,245,240,161,239,230,226,243,230,244,245,161,233,240,246,244,230,176,237,226,239,229}),
			callback = function(on)
				S.toggles.antiDrown = on
				_V11a5d4671af(_Vzd({226,239,245,234,197,243,240,248,239}))
				if on then _V53fa917f1a2(_Vzd({226,239,245,234,197,243,240,248,239}), 0.12, function()
					local h = hum(); if not h then return end
					local r = hrp(); if not r then return end
					local inWater = false
					pcall(function()
						if h:GetState() == Enum.HumanoidStateType.Swimming then inWater = true end
						if r.Position.Y < -8 then inWater = true end
						local ch = char()
						if ch then
							for _, p in ipairs(ch:GetDescendants()) do
								if p:IsA(_Vzd({195,226,244,230,209,226,243,245})) and p.Size.Y > 0 then
									if p.Position.Y < -8 then inWater = true break end
								end
							end
						end
					end)
					if inWater then
						_Vcbafef0f1e4(_Vzd({229,243,240,248,239}))
					end
				end) end
			end,
		})
		_Vbb4234fd160(sc, _Vzd({206,208,215,198,206,198,207,213,161,209,208,216,198,211,212}), n())
		_Ve133dbec114(sc, {
			order = n(), id = _Vzd({233,234,232,233,203,246,238,241}), title = _Vzd({212,246,241,230,243,161,203,246,238,241}),
			tip = _Vzd({111,154,146,149,117,148,156,138,151,69,148,155,138,151,151,142,137,138,69,77,152,153,134,136,144,152,69,156,142,153,141,69,142,147,139,69,143,154,146,149,78}),
			callback = function(on)
				S.toggles.highJump = on
				_V11a5d4671af(_Vzd({141,142,140,141,111,154,146,149}))
				if on then _V53fa917f1a2(_Vzd({233,234,232,233,203,246,238,241}), 0.1, function()
					local h = hum(); if h then h.JumpPower = S.superJumpPower or 200 end
				end)
				else
					local h = hum(); if h then h.JumpPower = 50 end
				end
			end,
		})
		_Ve79e7f32113(sc, { order = n(), title = _Vzd({203,246,238,241,161,201,230,234,232,233,245}), min = 50, max = 500, default = 200, stateKey = _Vzd({244,246,241,230,243,203,246,238,241,209,240,248,230,243}) })
		_Ve133dbec114(sc, {
			order = n(), id = _Vzd({152,154,149,138,151,120,149,138,138,137}), title = _Vzd({120,154,149,138,151,69,120,149,138,138,137}),
			tip = _Vzd({124,134,145,144,120,149,138,138,137,69,148,155,138,151,151,142,137,138,69,77,152,153,134,136,144,152,69,156,142,153,141,69,142,147,139,69,143,154,146,149,78}),
			callback = function(on)
				S.toggles.superSpeed = on
				_V11a5d4671af(_Vzd({244,246,241,230,243,212,241,230,230,229}))
				if on then _V53fa917f1a2(_Vzd({244,246,241,230,243,212,241,230,230,229}), 0.1, function()
					local h = hum(); if h then h.WalkSpeed = S.superSpeedPower or 100 end
				end)
				else
					local h = hum(); if h then h.WalkSpeed = 16 end
				end
			end,
		})
		_Ve79e7f32113(sc, { order = n(), title = _Vzd({120,149,138,138,137}), min = 16, max = 300, default = 100, stateKey = _Vzd({244,246,241,230,243,212,241,230,230,229,209,240,248,230,243}) })
		_Vc79d533d10e(sc, {
			order = n(), title = _Vzd({119,138,152,138,153,69,117,145,134,158,138,151}),
			tip = _Vzd({119,138,152,153,148,151,138,69,138,155,138,151,158,153,141,142,147,140,69,153,148,69,137,138,139,134,154,145,153}),
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
				for _, id in ipairs({_Vzd({232,240,229}),_Vzd({226,246,245,240,201,230,226,237}),_Vzd({241,237,226,250,230,243,212,241,234,239}),_Vzd({134,147,153,142,105,151,148,156,147}),_Vzd({233,234,232,233,203,246,238,241}),_Vzd({244,246,241,230,243,212,241,230,230,229}),_Vzd({239,240,228,237,234,241})}) do _V11a5d4671af(id) end
				local h = hum()
				if h then
					h.WalkSpeed = 16
					h.JumpPower = 50
				end
				local c = char()
				if c then
					local head = c:FindFirstChild(_Vzd({201,230,226,229}))
					if head then head.Size = Vector3.new(2, 1, 1) end
					for _, name in ipairs({_Vzd({213,240,243,244,240}), _Vzd({214,241,241,230,243,213,240,243,244,240}), _Vzd({205,240,248,230,243,213,240,243,244,240})}) do
						local p = c:FindFirstChild(name)
						if p then p.Size = Vector3.new(2, 2, 1) end
					end
				end
				local r = hrp()
				if r then
					r.AssemblyAngularVelocity = Vector3.zero
					local bp = r:FindFirstChild(_Vzd({215,208,202,197,219,224,199,237,240,226,245,195,209}))
					if bp then bp:Destroy() end
				end
				_V556c1dc412c(HUB_NAME, _Vzd({209,237,226,250,230,243,161,243,230,244,230,245}), 1.2)
			end,
		})
end
_TAB_BUILDERS[_Vzd({237,240,240,241})] = function(sc, n)
		_Vbb4234fd160(sc, _Vzd({209,202,196,204,161,216,201,208,161,253,161,205,208,208,209,161,213,194,211,200,198,213}), n())
		_V9b23dd72110(sc, { order = n(), id = _Vzd({241,237,226,250,230,243,212,230,226,243,228,233}), placeholder = _Vzd({120,138,134,151,136,141,69,137,142,152,149,145,134,158,69,148,151,69,101,154,152,138,151,147,134,146,138,83,83,83}) })
		local listBox = Instance.new(_Vzd({199,243,226,238,230}))
		listBox.LayoutOrder = n()
		listBox.Size = UDim2.new(1, -6, 0, 160)
		listBox.BackgroundColor3 = C.bg
		listBox.BorderSizePixel = 0
		listBox.Parent = sc
		_Ve7cf4e7f5f(listBox, 8)
		_Vb145617c1ba(listBox, C.strokeSoft, 1)
		local listSc = Instance.new(_Vzd({212,228,243,240,237,237,234,239,232,199,243,226,238,230}))
		listSc.Size = UDim2.fromScale(1, 1)
		listSc.BackgroundTransparency = 1
		listSc.ScrollBarThickness = 3
		listSc.ScrollBarImageColor3 = C.accent
		listSc.AutomaticCanvasSize = Enum.AutomaticSize.Y
		listSc.CanvasSize = UDim2.new()
		listSc.Parent = listBox
		local listLay = Instance.new(_Vzd({214,202,205,234,244,245,205,226,250,240,246,245}))
		listLay.Padding = UDim.new(0, 3)
		listLay.Parent = listSc
		pad(listSc, 4, 4, 4, 4)
		S.playerListFrame = listSc
		local function refreshPlayerList()
			if not S.playerListFrame then return end
			for _, ch in ipairs(S.playerListFrame:GetChildren()) do
				if ch:IsA(_Vzd({213,230,249,245,195,246,245,245,240,239})) then ch:Destroy() end
			end
			local q = S.playerSearch and S.playerSearch.Text or ""
			local selCount = 0
			for _ in pairs(S.loopTargets) do selCount += 1 end
			for _, lab in ipairs(_V240e7cb9138(q)) do
				local p = _Veeade0fa8a(lab)
				local isSelected = (S.selected == p)
				local isLoop = S.loopTargets[p] or (S.loopTarget == p)
				local b = Instance.new(_Vzd({213,230,249,245,195,246,245,245,240,239}))
				b.Size = UDim2.new(1, -4, 0, 28)
				b.BackgroundColor3 = isSelected and C.accentDim or C.card
				b.BorderSizePixel = 0
				b.Font = Enum.Font.Gotham
				b.TextSize = 11
				b.TextColor3 = C.text
				b.TextXAlignment = Enum.TextXAlignment.Left
				b.Text = " " .. lab
					.. (isLoop and _Vzd({161,161,171}) or "")
					.. (isSelected and _Vzd({161,161,171}) or "")
				b.AutoButtonColor = false
				b.Parent = S.playerListFrame
				_Ve7cf4e7f5f(b, 6)
				if isLoop then
					_Vb145617c1ba(b, C.accent, 1)
				end
				b.MouseButton1Click:Connect(function()
					S.selected = p
					_V6cf5c5971de(p)
					S.loopTarget = p
					S.loopName = p and p.Name or nil
					refreshPlayerList()
					local total = 0
					for _ in pairs(S.loopTargets) do total += 1 end
					if total > 1 then
						_V556c1dc412c(HUB_NAME, total .. _Vzd({161,237,240,240,241,161,245,226,243,232,230,245,244}), 1.2)
					else
						_V556c1dc412c(HUB_NAME, _Vzd({113,148,148,149,69,153,134,151,140,138,153,69,82,99,69}) .. lab, 1.2)
					end
				end)
			end
		end
		refreshPlayerList()
		if S.playerSearch then
			S.playerSearch:GetPropertyChangedSignal(_Vzd({213,230,249,245})):Connect(refreshPlayerList)
		end
		S.playerDropdowns.playersRefresh = refreshPlayerList
		S._loopSearchRefresh = refreshPlayerList
		_Vbb4234fd160(sc, _Vzd({105,116,69,121,116,69,121,109,106,114}), n())
		_V966b09a310f(sc, {
			order = n(), title = _Vzd({204,234,228,236,161,213,250,241,230}), options = KICK_TYPES, default = S.kickType or _Vzd({120,144,158,69,102,147,136,141,148,151}),
			callback = function(v) S.kickType = v; _V556c1dc412c(HUB_NAME, _Vzd({204,234,228,236,161,245,250,241,230,161,174,191,161}) .. v, 1) end,
		})
		_Vc79d533d10e(sc, { order = n(), title = _Vzd({199,237,234,239,232,161,212,230,237,230,228,245,230,229}), danger = true, tip = _Vzd({212,207,208,161,172,161,247,230,237,240,228,234,245,250,161,231,237,234,239,232}), callback = function()
			local targets = _V6c6f7d9eb3()
			if #targets == 0 then _V556c1dc412c(HUB_NAME, _Vzd({117,142,136,144,69,134,69,149,145,134,158,138,151,69,139,142,151,152,153}), 1.2) return end
			for _, p in ipairs(targets) do
				task.spawn(function()
					local ok, err = pcall(_Vcc8279d692, p, S.flingPower, false, true)
					if not ok then _V556c1dc412c(HUB_NAME, _Vzd({107,145,142,147,140,69,138,151,151,95,69}) .. tostring(err):sub(1, 40), 2) end
				end)
			end
		end })
		_Vc79d533d10e(sc, { order = n(), title = _Vzd({112,142,136,144,69,120,138,145,138,136,153,138,137}), danger = true, tip = _Vzd({122,152,138,152,69,144,142,136,144,69,153,158,149,138,69,134,135,148,155,138}), callback = function()
			local targets = _V6c6f7d9eb3()
			if #targets == 0 then _V556c1dc412c(HUB_NAME, _Vzd({209,234,228,236,161,226,161,241,237,226,250,230,243,161,231,234,243,244,245}), 1.2) return end
			for _, p in ipairs(targets) do
				task.spawn(function()
					local ok, err = pcall(_V971ad737104, p, S.kickType, false)
					if not ok then _V556c1dc412c(HUB_NAME, _Vzd({204,234,228,236,161,230,243,243,187,161}) .. tostring(err):sub(1, 40), 2) end
				end)
			end
		end })
		_Vc79d533d10e(sc, { order = n(), title = _Vzd({204,234,237,237,161,212,230,237,230,228,245,230,229}), danger = true, tip = _Vzd({212,236,250,161,172,161,229,230,226,245,233,161,244,245,226,245,230}), callback = function()
			local targets = _V6c6f7d9eb3()
			if #targets == 0 then _V556c1dc412c(HUB_NAME, _Vzd({209,234,228,236,161,226,161,241,237,226,250,230,243,161,231,234,243,244,245}), 1.2) return end
			for _, p in ipairs(targets) do
				task.spawn(function()
					local ok, err = pcall(_V62e4aa89105, p, false)
					if not ok then _V556c1dc412c(HUB_NAME, _Vzd({204,234,237,237,161,230,243,243,187,161}) .. tostring(err):sub(1, 40), 2) end
				end)
			end
		end })
		_Vc79d533d10e(sc, { order = n(), title = _Vzd({103,151,142,147,140,69,120,138,145,138,136,153,138,137}), tip = _Vzd({121,117,69,140,151,134,135,69,149,154,145,145,69,153,148,69,158,148,154}), callback = function()
			local targets = _V6c6f7d9eb3()
			if #targets == 0 then _V556c1dc412c(HUB_NAME, _Vzd({209,234,228,236,161,226,161,241,237,226,250,230,243,161,231,234,243,244,245}), 1.2) return end
			for _, p in ipairs(targets) do
				task.spawn(function()
					local ok, err = pcall(_V702f278238, p, nil, false)
					if not ok then _V556c1dc412c(HUB_NAME, _Vzd({195,243,234,239,232,161,230,243,243,187,161}) .. tostring(err):sub(1, 40), 2) end
				end)
			end
		end })
		_Vc79d533d10e(sc, { order = n(), title = _Vzd({121,138,145,138,149,148,151,153,69,121,148,69,120,138,145,138,136,153,138,137}), callback = function()
			local me, r = hrp(), S.selected and _Vb2220e5a155(S.selected)
			if me and r then
				me.CFrame = r.CFrame + Vector3.new(0, 3, 0)
				_V556c1dc412c(HUB_NAME, _Vzd({213,209,161,245,240,161}) .. _V466aec8e137(S.selected), 1)
			else
				_V556c1dc412c(HUB_NAME, _Vzd({115,148,69,153,134,151,140,138,153}), 1)
			end
		end })
		_Vc79d533d10e(sc, { order = n(), title = _Vzd({212,241,230,228,245,226,245,230}), callback = function()
			local cam = workspace.CurrentCamera
			local t = S.selected and S.selected.Character
			if cam and t then
				cam.CameraSubject = t:FindFirstChildOfClass(_Vzd({201,246,238,226,239,240,234,229})) or t
				_V556c1dc412c(HUB_NAME, _Vzd({212,241,230,228,245,226,245,234,239,232}), 1)
			end
		end })
		_Vc79d533d10e(sc, { order = n(), title = _Vzd({122,147,152,149,138,136,153,134,153,138}), callback = function()
			local cam, h = workspace.CurrentCamera, hum()
			if cam and h then cam.CameraSubject = h; _V556c1dc412c(HUB_NAME, _Vzd({214,239,244,241,230,228,245,226,245,230}), 1) end
		end })
		_Ve133dbec114(sc, { order = n(), id = _Vzd({248,237,199,243,234,230,239,229,244}), title = _Vzd({124,141,142,153,138,145,142,152,153,69,107,151,142,138,147,137,152}), tip = _Vzd({212,236,234,241,161,231,243,234,230,239,229,244,161,234,239,161,226,246,243,226,244,176,238,226,244,244}), callback = function(on)
			_V556c1dc412c(HUB_NAME, _Vzd({124,113,69,139,151,142,138,147,137,152,69}) .. (on and _Vzd({208,207}) or _Vzd({208,199,199})), 1)
		end })
		_Vc79d533d10e(sc, { order = n(), title = _Vzd({216,233,234,245,230,237,234,244,245,161,212,230,237,230,228,245,230,229}), callback = function()
			if S.selected then S.whitelist[S.selected.Name] = true; _V556c1dc412c(HUB_NAME, _Vzd({216,205,161}) .. S.selected.Name, 1); if S._wlRefresh then pcall(S._wlRefresh) end end
		end })
		_Vc79d533d10e(sc, { order = n(), title = _Vzd({122,147,156,141,142,153,138,145,142,152,153,69,120,138,145,138,136,153,138,137}), callback = function()
			if S.selected then S.whitelist[S.selected.Name] = nil; _V556c1dc412c(HUB_NAME, _Vzd({214,239,174,216,205}), 1); if S._wlRefresh then pcall(S._wlRefresh) end end
		end })
		_Ve133dbec114(sc, { order = n(), id = _Vzd({152,153,134,145,144}), title = _Vzd({120,153,134,145,144,69,121,138,145,138,149,148,151,153}), tip = _Vzd({205,240,240,241,161,213,209,161,227,230,233,234,239,229,161,244,230,237,230,228,245,230,229}), callback = function(on)
			_V11a5d4671af(_Vzd({152,153,134,145,144}))
			_V556c1dc412c(HUB_NAME, _Vzd({120,153,134,145,144,69}) .. (on and _Vzd({208,207}) or _Vzd({208,199,199})), 1)
			if on then _V53fa917f1a2(_Vzd({244,245,226,237,236}), 0.2, function()
				local me, r = hrp(), S.selected and _Vb2220e5a155(S.selected)
				if me and r then me.CFrame = r.CFrame * CFrame.new(0, 0, 4) end
			end) end
		end })
		_Vbb4234fd160(sc, _Vzd({205,208,208,209,161,194,196,213,202,208,207,212}), n())
		local loops = {
			{ id = _Vzd({237,240,240,241,199,237,234,239,232}), title = _Vzd({204,230,230,241,161,213,233,243,240,248,234,239,232}), tip = _Vzd({194,239,239,240,250,234,239,232,161,228,240,239,244,245,226,239,245,161,231,237,234,239,232,161,253,161,238,226,241,174,248,234,229,230}), waitRespawn = true, fn = function(p)
				local r = _Vb2220e5a155(p); if not r then return end
				_V96b8f82951(p.Character)
				_V7186e37c24(r, S.flingPower or 600, 0.3)
			end },
			{ id = _Vzd({237,240,240,241,204,234,228,236}), title = _Vzd({112,138,138,149,69,112,142,136,144,142,147,140}), tip = _Vzd({112,142,136,144,69,161,69,146,134,149,82,156,142,137,138}), waitRespawn = true, fn = function(p) _V971ad737104(p, S.kickType, true) end },
			{ id = _Vzd({237,240,240,241,204,234,237,237}), title = _Vzd({112,138,138,149,69,112,142,145,145,142,147,140}), tip = _Vzd({202,239,244,245,226,239,245,161,236,234,237,237,161,253,161,238,226,241,174,248,234,229,230}), waitRespawn = true, fn = function(p)
				local r = _Vb2220e5a155(p); if not r then return end
				local h = p.Character and p.Character:FindFirstChildOfClass(_Vzd({201,246,238,226,239,240,234,229}))
				pcall(function()
					if h then
						h.BreakJointsOnDeath = false
						h:ChangeState(Enum.HumanoidStateType.Dead)
						h.Jump = true
						h.Sit = false
					end
					_V07a307c766(r)
					_Vc9836fec182(r)
				end)
			end },
			{ id = _Vzd({145,148,148,149,119,134,140,137,148,145,145}), title = _Vzd({112,138,138,149,69,119,134,140,137,148,145,145,142,147,140}), tip = _Vzd({212,241,226,238,161,243,226,232,229,240,237,237,161,253,161,238,226,241,174,248,234,229,230}), waitRespawn = true, fn = function(p) _V7e5dd05e13e(p, true) end },
			{ id = _Vzd({237,240,240,241,195,243,234,239,232}), title = _Vzd({204,230,230,241,161,195,243,234,239,232,234,239,232}), tip = _Vzd({103,151,142,147,140,69,153,148,69,158,148,154,69,161,69,146,134,149,82,156,142,137,138}), fn = function(p) _V702f278238(p, nil, true) end },
			{ id = _Vzd({237,240,240,241,213,241}), title = _Vzd({205,240,240,241,161,213,230,237,230,241,240,243,245,161,213,240}), tip = _Vzd({120,153,134,158,69,148,147,69,153,141,138,146}), fn = function(p) local me,r=hrp(),_Vb2220e5a155(p); if me and r then me.CFrame=r.CFrame+Vector3.new(0,3,0) end end },
			{ id = _Vzd({237,240,240,241,212,236,250}), title = _Vzd({205,240,240,241,161,212,236,250,161,205,226,246,239,228,233}), tip = _Vzd({212,236,250,161,237,226,246,239,228,233,161,253,161,238,226,241,174,248,234,229,230}), waitRespawn = true, fn = function(p) _V971ad737104(p, _Vzd({212,236,250}), true) end },
			{ id = _Vzd({145,148,148,149,123,148,142,137}), title = _Vzd({205,240,240,241,161,215,240,234,229}), tip = _Vzd({123,148,142,137,69,152,145,134,146,69,161,69,146,134,149,82,156,142,137,138}), waitRespawn = true, fn = function(p) _V788517221fb(p, true) end },
			{ id = _Vzd({145,148,148,149,120,149,142,147}), title = _Vzd({205,240,240,241,161,212,241,234,239}), tip = _Vzd({120,149,142,147,69,153,141,138,146,69,161,69,146,134,149,82,156,142,137,138}), waitRespawn = true, fn = function(p) local r=_Vb2220e5a155(p); if r then _Vb07b7f02185(p); r.AssemblyAngularVelocity=Vector3.new(0,120,0) end end },
			{ id = _Vzd({237,240,240,241,212,207,208}), title = _Vzd({205,240,240,241,161,207,230,245,248,240,243,236,161,208,248,239}), tip = _Vzd({120,115,116,69,152,149,134,146,69,161,69,146,134,149,82,156,142,137,138}), fn = function(p) _Vb07b7f02185(p) end },
			{ id = _Vzd({237,240,240,241,200,243,226,227}), title = _Vzd({205,240,240,241,161,200,243,226,227,161,205,234,239,230}), tip = _Vzd({104,151,138,134,153,138,108,151,134,135,113,142,147,138,69,152,149,134,146,69,161,69,146,134,149,82,156,142,137,138}), fn = function(p) if FTAP.CreateGrabLine then local t=_Vb2220e5a155(p); pcall(function() FTAP.CreateGrabLine:FireServer(t,t.CFrame) end) end end },
			{ id = _Vzd({237,240,240,241,201,226,243,229,199,237,234,239,232}), title = _Vzd({113,148,148,149,69,109,134,151,137,69,107,145,142,147,140}), tip = _Vzd({206,226,249,161,231,237,234,239,232,161,253,161,238,226,241,174,248,234,229,230}), waitRespawn = true, fn = function(p)
				local r = _Vb2220e5a155(p); if not r then return end
				_V96b8f82951(p.Character)
				_V7186e37c24(r, 20000, 0.1)
			end },
			{ id = _Vzd({237,240,240,241,195,237,240,227,204,234,228,236}), title = _Vzd({113,148,148,149,69,103,145,148,135,146,134,147,69,112,142,136,144}), tip = _Vzd({195,237,240,227,161,236,234,228,236,161,253,161,238,226,241,174,248,234,229,230}), waitRespawn = true, fn = function(p) _V971ad737104(p, _Vzd({195,237,240,227,238,226,239}), true) end },
			{ id = _Vzd({237,240,240,241,200,243,226,227,204,234,228,236}), title = _Vzd({113,148,148,149,69,108,151,134,135,69,112,142,136,144}), tip = _Vzd({200,243,226,227,161,236,234,228,236,161,253,161,238,226,241,174,248,234,229,230}), waitRespawn = true, fn = function(p) _V971ad737104(p, _Vzd({200,243,226,227,204,234,228,236}), true) end },
			{ id = _Vzd({237,240,240,241,212,245,226,228,236,204,234,228,236}), title = _Vzd({205,240,240,241,161,212,245,226,228,236,161,204,234,228,236}), tip = _Vzd({212,245,226,228,236,161,236,234,228,236,161,253,161,238,226,241,174,248,234,229,230}), waitRespawn = true, fn = function(p) _V971ad737104(p, _Vzd({212,245,226,228,236,204,234,228,236}), true) end },
			{ id = _Vzd({237,240,240,241,212,234,237,230,239,245,204,234,228,236}), title = _Vzd({113,148,148,149,69,120,142,145,138,147,153,69,112,142,136,144}), tip = _Vzd({212,234,237,230,239,245,161,236,234,228,236,161,253,161,238,226,241,174,248,234,229,230}), waitRespawn = true, fn = function(p) _V971ad737104(p, _Vzd({212,234,237,230,239,245}), true) end },
			{ id = _Vzd({237,240,240,241,199,234,243,230}), title = _Vzd({205,240,240,241,161,199,234,243,230}), tip = _Vzd({195,246,243,239,161,245,233,230,238,161,253,161,238,226,241,174,248,234,229,230}), waitRespawn = true, fn = function(p) _V003181948f(p) end },
			{ id = _Vzd({237,240,240,241,209,240,234,244,240,239}), title = _Vzd({113,148,148,149,69,117,148,142,152,148,147}), tip = _Vzd({209,240,234,244,240,239,161,253,161,238,226,241,174,248,234,229,230}), fn = function(p) _Vfb0808ef21(_Vzd({241,240,234,244,240,239}), p) end },
			{ id = _Vzd({145,148,148,149,103,134,147,134,147,134}), title = _Vzd({113,148,148,149,69,103,134,147,134,147,134}), tip = _Vzd({120,145,142,149,69,161,69,146,134,149,82,156,142,137,138}), fn = function(p) _Vfb0808ef21(_Vzd({227,226,239,226,239,226}), p) end },
			{ id = _Vzd({237,240,240,241,209,226,234,239,245}), title = _Vzd({113,148,148,149,69,117,134,142,147,153}), tip = _Vzd({209,226,234,239,245,161,253,161,238,226,241,174,248,234,229,230}), fn = function(p) _Vfb0808ef21(_Vzd({241,226,234,239,245}), p) end },
			{ id = _Vzd({237,240,240,241,195,243,234,239,232,199,237,234,239,232}), title = _Vzd({113,148,148,149,69,103,151,142,147,140,80,107,145,142,147,140}), tip = _Vzd({195,243,234,239,232,161,245,233,230,239,161,231,237,234,239,232,161,253,161,238,226,241,174,248,234,229,230}), waitRespawn = true, fn = function(p)
				_V702f278238(p, nil, true)
				local r = _Vb2220e5a155(p); if not r then return end
				_V96b8f82951(p.Character)
				_V7186e37c24(r, S.flingPower or 600, 0.3)
			end },
			{ id = _Vzd({237,240,240,241,205,240,239,232,195,243,234,239,232}), title = _Vzd({205,240,240,241,161,205,240,239,232,161,211,230,226,228,233,161,195,243,234,239,232}), tip = _Vzd({114,134,157,69,151,138,134,136,141,69,80,69,135,151,142,147,140}), fn = function(p)
				if S.toggles.lineExtend then _V2c1a02571d(S.extendAmount or 80) end
				_V702f278238(p, nil, true)
			end },
			{ id = _Vzd({237,240,240,241,212,241,226,238,212,207,208}), title = _Vzd({205,240,240,241,161,212,241,226,238,161,212,207,208,161,209,226,243,245,244}), tip = _Vzd({208,248,239,161,230,247,230,243,250,161,241,226,243,245,161,253,161,238,226,241,174,248,234,229,230}), fn = function(p) for _,part in ipairs(p.Character:GetDescendants()) do if part:IsA(_Vzd({195,226,244,230,209,226,243,245})) then sno(part) end end end },
			{ id = _Vzd({237,240,240,241,197,230,244,245,243,240,250,200,243,226,227}), title = _Vzd({205,240,240,241,161,197,230,244,245,243,240,250,161,213,233,230,234,243,161,200,243,226,227}), tip = _Vzd({105,138,152,153,151,148,158,108,151,134,135,113,142,147,138,69,161,69,146,134,149,82,156,142,137,138}), fn = function(p) local r=_Vb2220e5a155(p); if r then _V07a307c766(r) end end },
		}
		S.loopWait = S.loopWait or {}
		for _, L in ipairs(loops) do
			_Ve133dbec114(sc, {
				order = n(),
				id = L.id,
				title = L.title,
				tip = L.tip or L.title,
				callback = function(on)
					_V11a5d4671af(L.id)
					if not on then
						for k, w in pairs(S.loopWait) do
							if k:sub(1, #L.id + 1) == L.id .. "_" or k == L.id then
								if w and w.home then
									pcall(function() _V41e966b01bf(w.home) end)
									break
								end
							end
						end
						for k in pairs(S.loopWait) do
							if k:sub(1, #L.id + 1) == L.id .. "_" or k == L.id then
								S.loopWait[k] = nil
							end
						end
						_V556c1dc412c(HUB_NAME, L.title .. _Vzd({161,208,199,199}), 1.2)
						return
					end
					_V556c1dc412c(HUB_NAME, L.title .. _Vzd({69,116,115,69,161,69,146,134,149,82,156,142,137,138}), 1.2)
					local homeCF = hrp() and hrp().CFrame
					S.loopWait[L.id] = S.loopWait[L.id] or {}
					S.loopWait[L.id].home = homeCF
					local interval = L.waitRespawn and 0.2 or 0.18
				_V53fa917f1a2(L.id, interval, function()
					local targets = _V6c6f7d9eb3()
					if #targets == 0 then
						if S.loopName then
							local found = Players:FindFirstChild(S.loopName)
							if found and found.Parent then
								S.loopTarget = found
								S.loopTargets[found] = true
								targets = { found }
								if S._loopSearchRefresh then pcall(S._loopSearchRefresh) end
								_V556c1dc412c(HUB_NAME, _V466aec8e137(found) .. _Vzd({69,151,138,82,134,136,150,154,142,151,138,137,70}), 1.5)
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
					if not plotBypass and _V318f2ee5f3(p) then
						if not w._houseWarned or (os.clock() - w._houseWarned) > 5 then
							w._houseWarned = os.clock()
							_V556c1dc412c(HUB_NAME, _V466aec8e137(p) .. _Vzd({161,234,244,161,234,239,161,226,161,233,240,246,244,230,161,174,161,248,226,234,245,234,239,232}), 2)
						end
						continue
					end
					if L.waitRespawn then
						if w.waiting then
							if _V4a303563e9(p) and p.Character and p.Character ~= w.deadChar then
								w.waiting = false
								w.deadChar = nil
								if w.home then pcall(function() _V41e966b01bf(w.home) end) end
								task.wait(0.25)
							else
								continue
							end
						end
						if not _V4a303563e9(p) and not _Vd6eb72811f9(p) then
							S.loopWait[wkey] = { waiting = true, deadChar = p.Character, home = w.home }
							continue
						end
					else
						if not _V4a303563e9(p) and not _Vd6eb72811f9(p) then continue end
					end
					_Veb5a36521fa(p, 15)
					local charBefore = p.Character
					pcall(L.fn, p)
					if w.home then pcall(function() _V41e966b01bf(w.home) end) end
					if L.waitRespawn then
						task.defer(function()
							task.wait(0.3)
							local ww = S.loopWait[wkey]
							if ww and S.loops[L.id] and p.Parent and (not _V4a303563e9(p) or p.Character ~= charBefore) then
								if not _V4a303563e9(p) then
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
_TAB_BUILDERS[_Vzd({238,240,247,230})] = function(sc, n)
		_Vbb4234fd160(sc, _Vzd({206,218,161,206,208,215,198,206,198,207,213}), n())
		_Ve133dbec114(sc, { order = n(), id = _Vzd({244,241,230,230,229}), title = _Vzd({216,226,237,236,212,241,230,230,229,161,208,247,230,243,243,234,229,230}), tip = _Vzd({211,230,174,226,241,241,237,234,230,244,161,230,247,230,243,250,161,231,243,226,238,230,161,169,199,213,194,209,161,243,230,244,230,245,244,161,244,241,230,230,229,170}), callback = function() end })
		_Ve79e7f32113(sc, { order = n(), title = _Vzd({216,226,237,236,212,241,230,230,229}), min = 16, max = 300, default = 50, stateKey = _Vzd({248,226,237,236,212,241,230,230,229}) })
		_Ve133dbec114(sc, { order = n(), id = _Vzd({244,241,230,230,229,196,199,243,226,238,230}), title = _Vzd({104,107,151,134,146,138,69,120,149,138,138,137,69,103,148,148,152,153}), tip = _Vzd({198,249,245,243,226,161,196,199,243,226,238,230,161,241,246,244,233,161,237,234,236,230,161,238,246,237,245}), callback = function() end })
		_Ve79e7f32113(sc, { order = n(), title = _Vzd({196,199,243,226,238,230,161,206,246,237,245}), min = 1, max = 8, default = 2, stateKey = _Vzd({244,241,230,230,229,206,246,237,245}) })
		_Ve133dbec114(sc, { order = n(), id = _Vzd({231,237,250}), title = _Vzd({199,237,250}), tip = _Vzd({195,240,229,250,215,230,237,240,228,234,245,250,161,172,161,195,240,229,250,200,250,243,240,161,231,237,250}), desc = _Vzd({124,102,120,105,69,161,69,120,149,134,136,138,69,161,69,120,141,142,139,153}), callback = _Va9d755db16e })
		_Ve79e7f32113(sc, { order = n(), title = _Vzd({107,145,158,69,120,149,138,138,137}), min = 20, max = 400, default = 80, stateKey = _Vzd({231,237,250,212,241,230,230,229}) })
		_Ve133dbec114(sc, { order = n(), id = _Vzd({239,240,228,237,234,241}), title = _Vzd({207,240,228,237,234,241}), tip = _Vzd({196,226,239,196,240,237,237,234,229,230,161,231,226,237,244,230,161,230,247,230,243,250,161,231,243,226,238,230}), callback = function() end })
		_Ve133dbec114(sc, {
			order = n(), id = _Vzd({234,239,231,235,246,238,241}), title = _Vzd({202,239,231,234,239,234,245,230,161,203,246,238,241,161,169,176,170}),
			tip = _Vzd({203,246,238,241,211,230,242,246,230,244,245,161,174,191,161,231,240,243,228,230,161,203,246,238,241,161,248,233,234,237,230,161,208,207}),
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
		_Ve133dbec114(sc, {
			order = n(), id = _Vzd({248,226,245,230,243,216,226,237,236}), title = _Vzd({124,134,153,138,151,69,124,134,145,144}),
			tip = _Vzd({206,226,236,230,244,161,245,233,230,161,248,233,240,237,230,161,248,226,245,230,243,161,238,226,241,161,244,240,237,234,229,161,244,240,161,250,240,246,161,248,226,237,236,161,240,239,161,234,245,161,169,239,240,161,231,237,240,226,245,161,241,237,226,245,231,240,243,238,170}),
			desc = _Vzd({120,148,145,142,137,142,139,142,138,152,69,156,134,153,138,151,69,149,134,151,153,152,69,80,69,153,138,151,151,134,142,147,69,161,69,151,138,152,153,148,151,138,152,69,156,141,138,147,69,148,139,139}),
			callback = function(on) _V962be45f17c(on) end,
		})
		_Ve133dbec114(sc, { order = n(), id = _Vzd({235,246,238,241}), title = _Vzd({203,246,238,241,209,240,248,230,243,161,208,247,230,243,243,234,229,230}), callback = function() end })
		_Ve79e7f32113(sc, { order = n(), title = _Vzd({203,246,238,241,161,209,240,248,230,243}), min = 50, max = 500, default = 80, stateKey = _Vzd({235,246,238,241,209,240,248,230,243}) })
		_Vc79d533d10e(sc, { order = n(), title = _Vzd({211,230,244,230,245,161,206,240,247,230,238,230,239,245}), callback = function()
			S.toggles.speed=false; S.toggles.fly=false; S.toggles.noclip=false; S.toggles.infjump=false; S.toggles.jump=false; S.toggles.speedCFrame=false
			_Va9d755db16e(false)
			local h = hum(); if h then h.WalkSpeed=16; h.JumpPower=50 end
		end })
		_Vbb4234fd160(sc, _Vzd({114,102,117,69,121,106,113,106,117,116,119,121}), n())
		local MAP_POSITIONS = {
			{ name = _Vzd({200,243,230,230,239,161,201,240,246,244,230}), pos = Vector3.new(-352, 99, 354) },
			{ name = _Vzd({200,243,230,230,239,161,212,226,231,230,174,201,240,246,244,230}), pos = Vector3.new(-584, -6, 93) },
			{ name = _Vzd({196,233,234,239,230,244,230,161,212,226,231,230,174,201,240,246,244,230}), pos = Vector3.new(579, 124, -94) },
			{ name = _Vzd({199,226,243,238,161,201,240,246,244,230}), pos = Vector3.new(-234, 83, -324) },
			{ name = _Vzd({212,241,226,248,239}), pos = Vector3.new(4, -7, -3) },
			{ name = _Vzd({103,145,154,138,69,120,134,139,138,82,109,148,154,152,138}), pos = Vector3.new(538, 96, -372) },
			{ name = _Vzd({120,138,136,151,138,153,69,103,142,140,69,104,134,155,138}), pos = Vector3.new(17, -7, 539) },
			{ name = _Vzd({212,230,228,243,230,245,161,213,243,226,234,239,161,196,226,247,230}), pos = Vector3.new(500, 62, -307) },
			{ name = _Vzd({206,234,239,230,161,196,226,247,230}), pos = Vector3.new(-254, -7, 518) },
			{ name = _Vzd({124,142,153,136,141,69,120,134,139,138,82,109,148,154,152,138}), pos = Vector3.new(296, -4, 494) },
			{ name = _Vzd({211,230,229,161,212,226,231,230,174,201,240,246,244,230}), pos = Vector3.new(-516, -6, -162) },
		}
		local mapNames = {}
		for _, mp in ipairs(MAP_POSITIONS) do mapNames[#mapNames + 1] = mp.name end
		S.selectedMap = S.selectedMap or mapNames[1]
		_V966b09a310f(sc, {
			order = n(), title = _Vzd({206,226,241,161,205,240,228,226,245,234,240,239}), options = mapNames, default = S.selectedMap,
			tip = _Vzd({117,142,136,144,69,134,69,146,134,149,69,145,148,136,134,153,142,148,147,69,153,148,69,153,138,145,138,149,148,151,153,69,153,148}),
			callback = function(v) S.selectedMap = v end,
		})
		_Vc79d533d10e(sc, {
			order = n(), title = _Vzd({121,138,145,138,149,148,151,153,69,153,148,69,114,134,149}), tip = _Vzd({121,138,145,138,149,148,151,153,69,153,148,69,153,141,138,69,152,138,145,138,136,153,138,137,69,146,134,149,69,145,148,136,134,153,142,148,147}),
			callback = function()
				local target
				for _, mp in ipairs(MAP_POSITIONS) do
					if mp.name == S.selectedMap then target = mp; break end
				end
				if target then
					local me = hrp()
					if me then me.CFrame = CFrame.new(target.pos + Vector3.new(0, 5, 0)); _V556c1dc412c(HUB_NAME, _Vzd({121,138,145,138,149,148,151,153,138,137,69,153,148,69}) .. target.name, 1.5) end
				end
			end,
		})
		_Vc79d533d10e(sc, {
			order = n(), title = _Vzd({213,230,237,230,241,240,243,245,161,245,240,161,212,230,237,230,228,245,230,229,161,209,237,226,250,230,243}), tip = _Vzd({121,138,145,138,149,148,151,153,69,153,148,69,153,141,138,69,149,145,134,158,138,151,69,158,148,154,69,152,138,145,138,136,153,138,137,69,142,147,69,134,147,158,69,152,138,134,151,136,141,69,145,142,152,153}),
			callback = function()
				local p = S.selected
				if not p or not _Vd6eb72811f9(p) then _V556c1dc412c(HUB_NAME, _Vzd({207,240,161,245,226,243,232,230,245,161,174,161,241,234,228,236,161,226,161,241,237,226,250,230,243,161,231,234,243,244,245}), 1.5); return end
				local r = _Vb2220e5a155(p)
				if r then
					local me = hrp()
					if me then me.CFrame = r.CFrame * CFrame.new(0, 0, 5); _V556c1dc412c(HUB_NAME, _Vzd({121,138,145,138,149,148,151,153,138,137,69,153,148,69}) .. _V466aec8e137(p), 1.5) end
				end
			end,
		})
		_Ve133dbec114(sc, {
			order = n(), id = _Vzd({145,148,148,149,121,117}), title = _Vzd({205,240,240,241,161,213,230,237,230,241,240,243,245,161,245,240,161,212,230,237,230,228,245,230,229}),
			tip = _Vzd({204,230,230,241,244,161,245,230,237,230,241,240,243,245,234,239,232,161,245,240,161,244,230,237,230,228,245,230,229,161,241,237,226,250,230,243,161,230,247,230,243,250,161,231,243,226,238,230}),
			callback = function(on)
				S.toggles.loopTP = on
				if on then
					_V53fa917f1a2(_Vzd({145,148,148,149,121,117}), 0.05, function()
						if not S.toggles.loopTP then return end
						local p = S.selected
						if p and _Vd6eb72811f9(p) then
							local r = _Vb2220e5a155(p)
							if r then
								local me = hrp()
								if me then me.CFrame = r.CFrame * CFrame.new(0, 0, 5) end
							end
						end
					end)
				else
					_V11a5d4671af(_Vzd({237,240,240,241,213,209}))
				end
			end,
		})
end
_TAB_BUILDERS[_Vzd({245,240,250,244})] = function(sc, n)
		_Vbb4234fd160(sc, _Vzd({213,208,218,161,205,202,206,202,213}), n())
		local limNote = Instance.new(_Vzd({213,230,249,245,205,226,227,230,237}))
		limNote.LayoutOrder = n()
		limNote.Size = UDim2.new(1, -6, 0, 36)
		limNote.BackgroundColor3 = C.card
		limNote.BorderSizePixel = 0
		limNote.Font = Enum.Font.Gotham
		limNote.TextSize = 11
		limNote.TextColor3 = C.muted
		limNote.TextXAlignment = Enum.TextXAlignment.Left
		limNote.TextWrapped = true
		limNote.Text = _Vzd({69,69,107,151,138,138,69,98,69,86,85,85,69,153,148,158,152,69,161,69,108,134,146,138,149,134,152,152,69,98,69,87,85,85,69,161,69,139,148,151,146,152,69,152,153,148,149,69,135,138,139,148,151,138,69,153,141,138,69,136,134,149})
		limNote.Parent = sc
		_Ve7cf4e7f5f(limNote, 8)
		pad(limNote, 6, 6, 6, 6)
		_V966b09a310f(sc, {
			order = n(),
			title = _Vzd({194,228,228,240,246,239,245,161,245,250,241,230}),
			options = { _Vzd({194,246,245,240,174,229,230,245,230,228,245}), _Vzd({207,240,161,232,226,238,230,241,226,244,244,161,169,178,177,177,170}), _Vzd({108,134,146,138,149,134,152,152,69,77,87,85,85,78}) },
			default = (S.toyPassMode == _Vzd({241,226,244,244}) and _Vzd({200,226,238,230,241,226,244,244,161,169,179,177,177,170}))
				or (S.toyPassMode == _Vzd({231,243,230,230}) and _Vzd({207,240,161,232,226,238,230,241,226,244,244,161,169,178,177,177,170}))
				or _Vzd({102,154,153,148,82,137,138,153,138,136,153}),
			callback = function(v)
				if v:find(_Vzd({200,226,238,230,241,226,244,244}), 1, true) then S.toyPassMode = _Vzd({241,226,244,244})
				elseif v:find(_Vzd({207,240,161,232,226,238,230,241,226,244,244}), 1, true) then S.toyPassMode = _Vzd({231,243,230,230})
				else S.toyPassMode = _Vzd({226,246,245,240}) end
				_V556c1dc412c(HUB_NAME, _Vzd({213,240,250,161,237,234,238,234,245,161,253,161}) .. _V649eaee6bb(), 1.2)
			end,
		})
		_Vc79d533d10e(sc, {
			order = n(),
			title = _Vzd({212,233,240,248,161,237,234,238,234,245,161,176,161,228,240,246,239,245}),
			callback = function()
				_V556c1dc412c(HUB_NAME, _Vzd({121,148,158,152,69}) .. _Ved9a9dcf61() .. _Vzd({161,176,161}) .. _V649eaee6bb() .. _Vzd({161,253,161,243,240,240,238,161}) .. _V24638f9e1e2(), 2)
			end,
		})
		_Vbb4234fd160(sc, _Vzd({212,209,194,216,207,161,204,198,218,195,202,207,197,212}), n())
		_Ve133dbec114(sc, { order = n(), id = _Vzd({149,134,145,145,138,153,118}), title = _Vzd({118,69,98,69,120,149,134,156,147,69,117,134,145,145,138,153}), tip = _Vzd({117,134,145,145,138,153,113,142,140,141,153,103,151,148,156,147,69,155,142,134,69,114,138,147,154,121,148,158,152}), desc = _Vzd({213,240,232,232,237,230,161,240,239,176,240,231,231}), callback = _V16c1eb5a176 })
		_Ve133dbec114(sc, { order = n(), id = _Vzd({153,134,135,120,149,134,156,147}), title = _Vzd({213,194,195,161,190,161,212,241,226,248,239,161,212,230,237,230,228,245,230,229,161,213,240,250}), tip = _Vzd({212,241,226,248,239,161,244,230,237,230,228,245,230,229,161,245,240,250,161,240,239,161,213,194,195}), callback = function(on)
			pcall(function() ContextActionService:UnbindAction(_Vzd({215,208,202,197,219,224,213,226,227,213,240,250})) end)
			if not on then return end
			ContextActionService:BindAction(_Vzd({215,208,202,197,219,224,213,226,227,213,240,250}), function(_, state)
				if state == Enum.UserInputState.Begin then _Vd788f8c8197(S.selectedToy or _Vzd({209,226,237,237,230,245,205,234,232,233,245,195,243,240,248,239})) end
			end, false, Enum.KeyCode.Tab)
		end })
		_Vbb4234fd160(sc, _Vzd({209,194,205,205,198,213}), n())
		_Ve133dbec114(sc, {
			order = n(),
			id = _Vzd({241,226,237,237,230,245,196,226,232,230}),
			title = _Vzd({212,245,234,228,236,161,213,240,161,209,226,237,237,230,245,161,196,230,239,245,230,243}),
			tip = _Vzd({109,148,145,137,69,134,69,149,134,145,145,138,153,95,69,120,115,116,69,80,69,149,142,147,69,149,138,148,149,145,138,69,148,147,69,142,153,69,153,148,69,153,141,138,69,153,148,149,69,136,138,147,153,138,151,69,77,107,106,69,148,156,147,138,151,152,141,142,149,78}),
			desc = _Vzd({121,141,138,158,69,146,154,152,153,69,135,138,69,147,138,134,151,69,158,148,154,69,77,163,88,85,69,152,153,154,137,152,78,69,139,148,151,69,120,115,116,69,161,69,151,138,145,138,134,152,138,152,69,156,141,138,147,69,158,148,154,69,137,151,148,149,69,153,141,138,69,149,134,145,145,138,153}),
			callback = function(on)
				setPalletCage(on)
			end,
		})
		_Vbb4234fd160(sc, _Vzd({118,122,110,104,112,69,120,117,102,124,115}), n())
		for _, toy in ipairs({
			_Vzd({209,226,237,237,230,245,205,234,232,233,245,195,243,240,248,239}), _Vzd({196,243,230,226,245,246,243,230,195,237,240,227,238,226,239}), _Vzd({195,240,238,227,206,234,244,244,234,237,230}), _Vzd({196,226,238,241,231,234,243,230}), _Vzd({207,234,239,235,226,204,246,239,226,234}),
			_Vzd({207,234,239,235,226,212,233,246,243,234,236,230,239}), _Vzd({199,240,240,229,195,226,239,226,239,226}), _Vzd({197,234,228,230,212,238,226,237,237}), _Vzd({212,241,243,226,250,196,226,239,216,197}), _Vzd({195,226,237,237,212,239,240,248,227,226,237,237}),
			_Vzd({218,240,246,197,230,228,240,250}), _Vzd({200,237,226,244,244,195,240,249,200,243,226,250}), _Vzd({199,240,240,229,195,243,230,226,229}), _Vzd({202,239,244,245,243,246,238,230,239,245,197,243,246,238,212,239,226,243,230}),
		}) do
			_Vc79d533d10e(sc, { order = n(), title = _Vzd({212,241,226,248,239,161}) .. toy, tip = _Vzd({103,154,158,80,120,149,134,156,147,69}) .. toy .. _Vzd({161,169,242,246,230,246,230,229,170}), callback = function()
				S.selectedToy = toy
				_Vd788f8c8197(toy)
			end })
		end
		_Vbb4234fd160(sc, _Vzd({199,208,211,206,161,195,214,202,205,197,212}), n())
		local formInfo = Instance.new(_Vzd({213,230,249,245,205,226,227,230,237}))
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
		formInfo.Text = " Forms ATTACH to you (SNO + BodyPosition)\n Heart = above head | Wings flap | Suit = body shell | Remove Form to clear"
		formInfo.Parent = sc
		_Ve7cf4e7f5f(formInfo, 8)
		_Ve79e7f32113(sc, {
			order = n(), title = _Vzd({199,240,243,238,161,212,234,251,230,161,212,228,226,237,230}), min = 0.5, max = 3, default = S.formSizeScale or 1.2, step = 0.1,
			callback = function(v) S.formSizeScale = v end,
		})
		_Ve79e7f32113(sc, {
			order = n(), title = _Vzd({107,148,151,146,69,105,142,152,153,134,147,136,138}), min = 4, max = 40, default = S.formDistance or 12, step = 1,
			callback = function(v) S.formDistance = v end,
		})
		_Ve79e7f32113(sc, {
			order = n(), title = _Vzd({107,148,151,146,69,109,138,142,140,141,153}), min = -5, max = 30, default = S.formHeight or 2, step = 1,
			callback = function(v) S.formHeight = v end,
		})
		_Ve79e7f32113(sc, {
			order = n(), title = _Vzd({107,148,151,146,69,116,151,142,138,147,153,134,153,142,148,147,69,77,126,69,137,138,140,78}), min = 0, max = 360, default = S.formOrientation or 0, step = 5,
			callback = function(v) S.formOrientation = v end,
		})
		_Ve79e7f32113(sc, {
			order = n(), title = _Vzd({120,149,134,156,147,69,108,134,149,69,77,152,138,136,78}), min = 0.04, max = 0.35, default = S.formGap or 0.09, step = 0.01,
			callback = function(v) S.formGap = v end,
		})
		for _, def in ipairs(FORM_BUILDS) do
			_Vc79d533d10e(sc, {
				order = n(),
				title = _Vzd({195,246,234,237,229,161}) .. def.title,
				tip = def.tip or (_Vzd({199,240,243,238,161,253,161}) .. def.title),
				callback = function()
					_V33054fe9159(def.id, S.selectedToy or _Vzd({209,226,237,237,230,245,205,234,232,233,245,195,243,240,248,239}))
				end,
			})
		end
		_Vc79d533d10e(sc, {
			order = n(),
			title = _Vzd({195,246,234,237,229,161,201,230,226,243,245,161,169,197,234,228,230,161,176,161,244,241,226,243,236,237,230,170}),
			tip = _Vzd({212,226,238,230,161,233,230,226,243,245,161,246,244,234,239,232,161,197,234,228,230,212,238,226,237,237}),
			callback = function() _V33054fe9159(_Vzd({233,230,226,243,245}), _Vzd({105,142,136,138,120,146,134,145,145})) end,
		})
		_Vc79d533d10e(sc, {
			order = n(),
			title = _Vzd({196,226,239,228,230,237,161,199,240,243,238,161,195,246,234,237,229}),
			danger = true,
			tip = _Vzd({212,245,240,241,161,238,234,229,174,227,246,234,237,229,161,172,161,228,237,230,226,243,161,244,241,226,248,239,161,242,246,230,246,230}),
			callback = _V7d0b566f41,
		})
		_Vc79d533d10e(sc, {
			order = n(),
			title = _Vzd({119,138,146,148,155,138,69,107,148,151,146,69,77,137,138,153,134,136,141,78}),
			danger = true,
			tip = _Vzd({212,245,240,241,161,248,230,226,243,161,237,240,240,241,161,172,161,197,230,244,245,243,240,250,213,240,250,161,231,240,243,238,161,241,234,230,228,230,244}),
			callback = function()
				_V60fd70b84d(true)
				_V556c1dc412c(HUB_NAME, _Vzd({199,240,243,238,161,243,230,238,240,247,230,229}), 1.2)
			end,
		})
		_Vbb4234fd160(sc, _Vzd({103,122,110,113,105,69,84,69,107,122,115}), n())
		_Vc79d533d10e(sc, { order = n(), title = _Vzd({212,241,226,248,239,161,209,226,237,237,230,245,161,212,245,226,228,236,161,169,182,170}), tip = _Vzd({90,69,149,134,145,145,138,153,152,69,152,153,134,136,144,138,137,69,77,152,138,151,142,134,145,78}), callback = function()
			_V5a17bd6c198(_Vzd({209,226,237,237,230,245,205,234,232,233,245,195,243,240,248,239}), 5)
		end })
		_Vc79d533d10e(sc, { order = n(), title = _Vzd({212,241,226,248,239,161,209,226,237,237,230,245,161,212,245,226,228,236,161,169,178,182,170}), tip = _Vzd({103,142,140,69,152,153,134,136,144}), callback = function()
			_V5a17bd6c198(_Vzd({209,226,237,237,230,245,205,234,232,233,245,195,243,240,248,239}), 15)
		end })
		_Vc79d533d10e(sc, { order = n(), title = _Vzd({120,147,148,156,135,134,145,145,69,120,153,134,136,144,69,77,86,85,78}), tip = _Vzd({195,226,237,237,212,239,240,248,227,226,237,237}), callback = function()
			_V5a17bd6c198(_Vzd({195,226,237,237,212,239,240,248,227,226,237,237}), 10)
		end })
		_Ve133dbec114(sc, { order = n(), id = _Vzd({226,246,245,240,209,226,237,237,230,245}), title = _Vzd({194,246,245,240,161,209,226,237,237,230,245,161,209,226,245,233}), tip = _Vzd({118,154,138,154,138,137,69,149,134,145,145,138,153,152,69,156,141,142,145,138,69,156,134,145,144,142,147,140}), callback = function(on)
			_V11a5d4671af(_Vzd({226,246,245,240,209,226,237,237,230,245}))
			_V556c1dc412c(HUB_NAME, _Vzd({194,246,245,240,161,241,226,237,237,230,245,161}) .. (on and _Vzd({208,207}) or _Vzd({208,199,199})), 1)
			if on then _V53fa917f1a2(_Vzd({226,246,245,240,209,226,237,237,230,245}), 0.2, function() _Vd788f8c8197(_Vzd({209,226,237,237,230,245,205,234,232,233,245,195,243,240,248,239}), { silent = true, dist = 2.5 }) end) end
		end })
		_Vbb4234fd160(sc, _Vzd({121,116,126,69,114,102,115,102,108,106,114,106,115,121}), n())
		_Vc79d533d10e(sc, { order = n(), title = _Vzd({197,230,244,245,243,240,250,161,194,237,237,161,206,250,161,213,240,250,244}), danger = true, tip = _Vzd({105,138,152,153,151,148,158,121,148,158,69,148,147,69,120,149,134,156,147,138,137,110,147,121,148,158,152,69,139,148,145,137,138,151}), callback = function()
			local n = _Vc5b9c6e765()
			_V556c1dc412c(HUB_NAME, _Vzd({197,230,244,245,243,240,250,230,229,161}) .. n .. _Vzd({161,245,240,250,244}), 2)
		end })
		_Vc79d533d10e(sc, { order = n(), title = _Vzd({105,138,152,153,151,148,158,69,102,145,145,69,114,158,69,117,134,145,145,138,153,152}), danger = true, callback = function()
			local n = _Vc5b9c6e765(_Vzd({209,226,237,237,230,245}))
			_V556c1dc412c(HUB_NAME, _Vzd({105,138,152,153,151,148,158,138,137,69}) .. n .. _Vzd({161,241,226,237,237,230,245,244}), 2)
		end })
		_Vc79d533d10e(sc, { order = n(), title = _Vzd({196,240,246,239,245,161,206,250,161,213,240,250,244}), tip = _Vzd({120,149,134,156,147,138,137,110,147,121,148,158,152,69,136,141,142,145,137,151,138,147}), callback = function()
			_V556c1dc412c(HUB_NAME, _Vzd({121,148,158,152,95,69}) .. _Ved9a9dcf61() .. _Vzd({161,253,161,209,226,237,237,230,245,244,187,161}) .. _Ved9a9dcf61(_Vzd({117,134,145,145,138,153,113,142,140,141,153,103,151,148,156,147})), 2)
		end })
		_Vbb4234fd160(sc, _Vzd({208,216,207,198,197,161,202,207,215,198,207,213,208,211,218}), n())
		_Vc79d533d10e(sc, { order = n(), title = _Vzd({119,138,139,151,138,152,141,69,116,156,147,138,137,69,80,69,114,134,149,69,120,136,134,147}), tip = _Vzd({120,136,134,147,69,135,134,136,144,149,134,136,144,84,122,110,84,146,134,149,69,148,156,147,138,151,152,141,142,149}), callback = function()
			local owned = _V38ae27e8b6()
			local map = _V1520d06eb4()
			local unowned = {}
			for name, data in pairs(map) do
				if not data.owned then unowned[#unowned+1] = name end
			end
			table.sort(unowned)
			_V556c1dc412c(HUB_NAME, _Vzd({116,156,147,138,137,69})..#owned.._Vzd({69,161,69,122,147,148,156,147,138,137,69,146,134,149,69})..#unowned, 3)
			if S.ownedList then
				for _, ch in ipairs(S.ownedList:GetChildren()) do if ch:IsA(_Vzd({213,230,249,245,195,246,245,245,240,239})) then ch:Destroy() end end
				for _, name in ipairs(owned) do
					local b = Instance.new(_Vzd({213,230,249,245,195,246,245,245,240,239}))
					b.Size = UDim2.new(1, -4, 0, 24)
					b.BackgroundColor3 = C.card
					b.BorderSizePixel = 0
					b.Font = Enum.Font.Gotham
					b.TextSize = 11
					b.TextColor3 = C.text
					b.Text = " " .. name
					b.Parent = S.ownedList
					_Ve7cf4e7f5f(b, 5)
					b.MouseButton1Click:Connect(function() S.selectedToy = name; _Vd788f8c8197(name) end)
				end
			end
			if S.unownedList then
				for _, ch in ipairs(S.unownedList:GetChildren()) do if ch:IsA(_Vzd({213,230,249,245,195,246,245,245,240,239})) then ch:Destroy() end end
				for _, name in ipairs(unowned) do
					local b = Instance.new(_Vzd({213,230,249,245,195,246,245,245,240,239}))
					b.Size = UDim2.new(1, -4, 0, 24)
					b.BackgroundColor3 = C.card
					b.BorderSizePixel = 0
					b.Font = Enum.Font.Gotham
					b.TextSize = 11
					b.TextColor3 = C.warn
					b.Text = " " .. name
					b.Parent = S.unownedList
					_Ve7cf4e7f5f(b, 5)
					b.MouseButton1Click:Connect(function() _V4d5ced1d39(name) end)
				end
			end
		end })
		local ownedBox = Instance.new(_Vzd({199,243,226,238,230}))
		ownedBox.LayoutOrder = n()
		ownedBox.Size = UDim2.new(1, -6, 0, 120)
		ownedBox.BackgroundColor3 = C.bg
		ownedBox.BorderSizePixel = 0
		ownedBox.Parent = sc
		_Ve7cf4e7f5f(ownedBox, 8)
		_Vb145617c1ba(ownedBox, C.strokeSoft, 1)
		local ownedSc = Instance.new(_Vzd({212,228,243,240,237,237,234,239,232,199,243,226,238,230}))
		ownedSc.Size = UDim2.fromScale(1, 1)
		ownedSc.BackgroundTransparency = 1
		ownedSc.ScrollBarThickness = 3
		ownedSc.ScrollBarImageColor3 = C.accent
		ownedSc.AutomaticCanvasSize = Enum.AutomaticSize.Y
		ownedSc.CanvasSize = UDim2.new()
		ownedSc.Parent = ownedBox
		local ol = Instance.new(_Vzd({214,202,205,234,244,245,205,226,250,240,246,245})); ol.Padding = UDim.new(0, 3); ol.Parent = ownedSc
		pad(ownedSc, 4, 4, 4, 4)
		S.ownedList = ownedSc
		_Vbb4234fd160(sc, _Vzd({214,207,208,216,207,198,197,161,206,194,209,161,202,213,198,206,212}), n())
		local unInfo = Instance.new(_Vzd({213,230,249,245,205,226,227,230,237}))
		unInfo.LayoutOrder = n()
		unInfo.Size = UDim2.new(1, -6, 0, 36)
		unInfo.BackgroundColor3 = C.card
		unInfo.BorderSizePixel = 0
		unInfo.Font = Enum.Font.Gotham
		unInfo.TextSize = 10
		unInfo.TextColor3 = C.muted
		unInfo.TextXAlignment = Enum.TextXAlignment.Left
		unInfo.TextWrapped = true
		unInfo.Text = _Vzd({161,161,196,237,234,228,236,161,226,161,239,226,238,230,161,174,191,161,243,230,226,237,161,212,207,208,161,227,243,234,239,232,161,253,161,233,230,237,229,161,234,239,161,231,243,240,239,245,161,240,231,161,250,240,246,161,246,239,245,234,237,161,250,240,246,161,232,243,226,227,161,234,245})
		unInfo.Parent = sc
		_Ve7cf4e7f5f(unInfo, 8)
		pad(unInfo, 6, 6, 6, 6)
		_Vc79d533d10e(sc, {
			order = n(),
			title = _Vzd({211,230,237,230,226,244,230,161,227,243,240,246,232,233,245,161,234,245,230,238,244}),
			danger = true,
			tip = _Vzd({120,153,148,149,69,141,148,145,137,142,147,140,69,142,153,138,146,152,69,77,144,138,138,149,152,69,148,156,147,138,151,152,141,142,149,69,142,139,69,158,148,154,69,134,145,151,138,134,137,158,69,140,151,134,135,135,138,137,78}),
			callback = function() _Vf66553d6145() end,
		})
		local unBox = Instance.new(_Vzd({199,243,226,238,230}))
		unBox.LayoutOrder = n()
		unBox.Size = UDim2.new(1, -6, 0, 140)
		unBox.BackgroundColor3 = C.bg
		unBox.BorderSizePixel = 0
		unBox.Parent = sc
		_Ve7cf4e7f5f(unBox, 8)
		_Vb145617c1ba(unBox, C.danger, 1)
		local unSc = Instance.new(_Vzd({212,228,243,240,237,237,234,239,232,199,243,226,238,230}))
		unSc.Size = UDim2.fromScale(1, 1)
		unSc.BackgroundTransparency = 1
		unSc.ScrollBarThickness = 3
		unSc.ScrollBarImageColor3 = C.danger
		unSc.AutomaticCanvasSize = Enum.AutomaticSize.Y
		unSc.CanvasSize = UDim2.new()
		unSc.Parent = unBox
		local ul = Instance.new(_Vzd({214,202,205,234,244,245,205,226,250,240,246,245})); ul.Padding = UDim.new(0, 3); ul.Parent = unSc
		pad(unSc, 4, 4, 4, 4)
		S.unownedList = unSc
end
_TAB_BUILDERS[_Vzd({230,249,241,237,240,244,234,240,239,244})] = function(sc, n)
		_Vbb4234fd160(sc, _Vzd({206,202,212,212,202,205,198,161,212,213,211,202,204,198}), n())
		local exNote = Instance.new(_Vzd({213,230,249,245,205,226,227,230,237}))
		exNote.LayoutOrder = n()
		exNote.Size = UDim2.new(1, -6, 0, 48)
		exNote.BackgroundColor3 = C.card
		exNote.BorderSizePixel = 0
		exNote.Font = Enum.Font.Gotham
		exNote.TextSize = 11
		exNote.TextColor3 = C.muted
		exNote.TextXAlignment = Enum.TextXAlignment.Left
		exNote.TextWrapped = true
		exNote.Text = "  Spawn missiles -> own them -> teleport onto the player -> explode\n  Respects your toy limit (100 free / 200 pass)"
		exNote.Parent = sc
		_Ve7cf4e7f5f(exNote, 8)
		pad(exNote, 6, 6, 6, 6)
		_V966b09a310f(sc, {
			order = n(),
			title = _Vzd({206,234,244,244,234,237,230,161,245,250,241,230}),
			options = { _Vzd({195,240,238,227,206,234,244,244,234,237,230}), _Vzd({199,234,243,230,248,240,243,236,206,234,244,244,234,237,230}), _Vzd({195,240,238,227,195,226,237,237,240,240,239}), _Vzd({195,240,238,227,197,226,243,236,206,226,245,245,230,243}) },
			default = S.missileType or _Vzd({195,240,238,227,206,234,244,244,234,237,230}),
			callback = function(v) S.missileType = v end,
		})
		_V966b09a310f(sc, {
			order = n(),
			title = _Vzd({194,228,228,240,246,239,245,161,245,250,241,230}),
			options = { _Vzd({194,246,245,240,174,229,230,245,230,228,245}), _Vzd({207,240,161,232,226,238,230,241,226,244,244,161,169,178,177,177,170}), _Vzd({108,134,146,138,149,134,152,152,69,77,87,85,85,78}) },
			default = (S.toyPassMode == _Vzd({241,226,244,244}) and _Vzd({200,226,238,230,241,226,244,244,161,169,179,177,177,170}))
				or (S.toyPassMode == _Vzd({231,243,230,230}) and _Vzd({115,148,69,140,134,146,138,149,134,152,152,69,77,86,85,85,78}))
				or _Vzd({194,246,245,240,174,229,230,245,230,228,245}),
			callback = function(v)
				if v:find(_Vzd({200,226,238,230,241,226,244,244}), 1, true) then S.toyPassMode = _Vzd({241,226,244,244})
				elseif v:find(_Vzd({115,148,69,140,134,146,138,149,134,152,152}), 1, true) then S.toyPassMode = _Vzd({231,243,230,230})
				else S.toyPassMode = _Vzd({226,246,245,240}) end
			end,
		})
		S.playerDropdowns = S.playerDropdowns or {}
		_V19a46d3f111(sc, {
			clickFn = function(p) S.missileTarget = p; S.selected = p end,
		}, n)
		_Ve79e7f32113(sc, {
			order = n(),
			title = _Vzd({206,234,244,244,234,237,230,244,161,241,230,243,161,227,246,243,244,245}),
			min = 1,
			max = 12,
			default = S.missileCount or 3,
			callback = function(v) S.missileCount = v end,
		})
		_Ve133dbec114(sc, {
			order = n(),
			id = _Vzd({238,234,244,244,234,237,230,212,245,243,234,236,230}),
			title = _Vzd({194,246,245,240,161,244,245,243,234,236,230,161,245,226,243,232,230,245}),
			tip = _Vzd({112,138,138,149,152,69,152,149,134,156,147,142,147,140,69,80,69,138,157,149,145,148,137,142,147,140,69,148,147,69,153,141,138,69,152,138,145,138,136,153,138,137,69,149,145,134,158,138,151}),
			danger = true,
			callback = function(on)
				_V9af28be6174(on)
			end,
		})
		_Vc79d533d10e(sc, {
			order = n(),
			title = _Vzd({199,234,243,230,161,240,239,228,230,161,169,227,246,243,244,245,170}),
			danger = true,
			tip = _Vzd({212,241,226,248,239,161,207,161,238,234,244,244,234,237,230,244,161,226,239,229,161,230,249,241,237,240,229,230,161,245,233,230,238,161,240,239,161,245,233,230,161,245,226,243,232,230,245,161,239,240,248}),
			callback = _Vde108e228e,
		})
		_Vc79d533d10e(sc, {
			order = n(),
			title = _Vzd({212,245,240,241,161,244,245,243,234,236,230}),
			danger = true,
			callback = function() _Vc84a2cd41b1() end,
		})
		_Vc79d533d10e(sc, {
			order = n(),
			title = _Vzd({105,138,145,138,153,138,69,146,158,69,146,142,152,152,142,145,138,152}),
			danger = true,
			callback = function()
				local n = 0
				for _, name in ipairs({ _Vzd({195,240,238,227,206,234,244,244,234,237,230}), _Vzd({199,234,243,230,248,240,243,236,206,234,244,244,234,237,230}), _Vzd({195,240,238,227,195,226,237,237,240,240,239}), _Vzd({195,240,238,227,197,226,243,236,206,226,245,245,230,243}) }) do
					n += _Vc5b9c6e765(name)
				end
				_V556c1dc412c(HUB_NAME, _Vzd({104,145,138,134,151,138,137,69}) .. n, 1.2)
			end,
		})
end
_TAB_BUILDERS[_Vzd({248,240,243,237,229})] = function(sc, n)
		_Vbb4234fd160(sc, _Vzd({216,208,211,205,197,161,176,161,208,195,203,198,196,213,212}), n())
		_Ve133dbec114(sc, { order = n(), id = _Vzd({226,246,243,226,224,239,230,245,240,248,239}), title = _Vzd({115,138,153,156,148,151,144,69,116,156,147,138,151,152,141,142,149,69,102,154,151,134}), tip = _Vzd({208,209,161,228,240,239,245,234,239,246,240,246,244,161,212,207,208}), callback = function(on) _Ve239e5a8164(_Vzd({239,230,245,240,248,239}), on) end })
		_Ve133dbec114(sc, { order = n(), id = _Vzd({226,246,243,226,224,231,237,234,239,232}), title = _Vzd({208,227,235,230,228,245,176,209,237,226,250,230,243,161,199,237,234,239,232,161,194,246,243,226}), tip = _Vzd({214,244,230,161,171,161,234,239,161,194,246,243,226,244,161,231,240,243,161,245,226,243,232,230,245,161,238,240,229,230}), callback = function(on) _Ve239e5a8164(_Vzd({139,145,142,147,140}), on) end })
		_Vc79d533d10e(sc, { order = n(), title = _Vzd({199,237,234,239,232,161,207,230,226,243,227,250,161,208,239,228,230}), danger = true, callback = function()
			local cfg = _V8e4be6b2ad(_Vzd({231,237,234,239,232}))
			_Vf13a128e6d(cfg, function(p,r) _Vcc8279d692(p, cfg.power, true) end, function(part) sno(part); _V7186e37c24(part, cfg.power, 0.5) end)
			_V556c1dc412c(HUB_NAME, _Vzd({117,154,145,152,138,69,139,145,142,147,140}), 1)
		end })
		_Ve133dbec114(sc, { order = n(), id = _Vzd({246,239,226,239,228,233,240,243,194,246,243,226}), title = _Vzd({214,239,226,239,228,233,240,243,161,194,246,243,226}), tip = _Vzd({122,147,134,147,136,141,148,151,69,80,69,120,115,116,69,147,138,134,151,135,158}), callback = function(on)
			_V11a5d4671af(_Vzd({154,147,134,147,136,141,148,151}))
			if on then _V53fa917f1a2(_Vzd({246,239,226,239,228,233,240,243}), 0.25, function()
				local me = hrp(); if not me then return end
				local n = 0
				for _, p in ipairs(workspace:GetDescendants()) do
					if p:IsA(_Vzd({195,226,244,230,209,226,243,245})) and p.Anchored and (p.Position-me.Position).Magnitude < (S.auraRange or 50) then
						if sno(p) then p.Anchored = false; n+=1 end
						if n > 20 then break end
					end
				end
			end) end
		end })
		_Vc79d533d10e(sc, { order = n(), title = _Vzd({196,237,230,226,243,161,207,230,226,243,227,250,161,195,240,229,250,206,240,247,230,243,244}), callback = function()
			local me = hrp(); if not me then return end
			for _, p in ipairs(workspace:GetDescendants()) do
				if (p:IsA(_Vzd({195,240,229,250,215,230,237,240,228,234,245,250})) or p:IsA(_Vzd({195,240,229,250,209,240,244,234,245,234,240,239}))) and p.Parent and p.Parent:IsA(_Vzd({195,226,244,230,209,226,243,245})) then
					if (p.Parent.Position - me.Position).Magnitude < 80 then pcall(function() p:Destroy() end) end
				end
			end
		end })
		_Ve133dbec114(sc, { order = n(), id = _Vzd({229,230,237,230,245,230,213,240,246,228,233}), title = _Vzd({197,230,237,230,245,230,161,213,240,246,228,233,230,229,161,209,226,243,245,244}), tip = _Vzd({197,230,244,245,243,240,250,161,241,226,243,245,244,161,250,240,246,161,245,240,246,228,233}), callback = function(on)
			if S.conns.delTouch then pcall(function() S.conns.delTouch:Disconnect() end) end
			if not on then return end
			local r = hrp(); if not r then return end
			S.conns.delTouch = r.Touched:Connect(function(hit)
				if hit:IsA(_Vzd({195,226,244,230,209,226,243,245})) and not hit:IsDescendantOf(char()) then
					if sno(hit) then pcall(function() hit:Destroy() end) end
				end
			end)
		end })
		_Vc79d533d10e(sc, { order = n(), title = _Vzd({195,243,234,239,232,161,194,237,237,161,207,230,226,243,227,250,161,208,227,235,230,228,245,244}), callback = function()
			local me = hrp(); if not me then return end
			local n = 0
			for _, p in ipairs(workspace:GetDescendants()) do
				if p:IsA(_Vzd({195,226,244,230,209,226,243,245})) and not p.Anchored and (p.Position-me.Position).Magnitude < 80 then
					if not LP.Character or not p:IsDescendantOf(LP.Character) then
						local m = p:FindFirstAncestorOfClass(_Vzd({114,148,137,138,145}))
						if not (m and Players:GetPlayerFromCharacter(m)) then
							sno(p); p.CFrame = me.CFrame * CFrame.new(0, 2, -6); n+=1
							if n > 30 then break end
						end
					end
				end
			end
			_V556c1dc412c(HUB_NAME, _Vzd({103,151,148,154,140,141,153,69})..n.._Vzd({161,241,226,243,245,244}), 2)
		end })
end
_TAB_BUILDERS[_Vzd({247,234,244,246,226,237,244})] = function(sc, n)
		_Vbb4234fd160(sc, _Vzd({212,213,198,194,205,213,201}), n())
		_Ve133dbec114(sc, {
			order = n(), id = _Vzd({228,233,226,243,202,239,247,234,244}), title = _Vzd({196,233,226,243,226,228,245,230,243,161,202,239,247,234,244,234,227,234,237,234,245,250}),
			tip = _Vzd({103,148,137,158,69,154,147,137,138,151,69,146,134,149,69,161,69,136,134,146,138,151,134,69,152,153,134,158,152,69,148,147,69,152,154,151,139,134,136,138,83,69,109,134,151,137,138,151,69,153,148,69,140,151,134,135,84,152,138,138,83}),
			callback = function(on)
				_V0a71d36f16a(on)
			end,
		})
		_Vbb4234fd160(sc, _Vzd({124,109,102,121,69,110,69,120,106,106}), n())
		_Ve133dbec114(sc, { order = n(), id = _Vzd({230,244,241}), title = _Vzd({117,145,134,158,138,151,69,106,120,117,69,80,69,115,134,146,138,152}), tip = _Vzd({201,234,232,233,237,234,232,233,245,161,172,161,227,234,237,237,227,240,226,243,229}), callback = _V56fbc9ef16d })
		_Ve79e7f32113(sc, { order = n(), title = _Vzd({106,120,117,69,107,142,145,145,69,121,151,134,147,152,149,134,151,138,147,136,158}), min = 0, max = 1, default = 0.5, step = 0.1,
			stateKey = _Vzd({138,152,149,107,142,145,145,121,151,134,147,152,149,134,151,138,147,136,158}), tip = _Vzd({109,148,156,69,152,138,138,82,153,141,151,148,154,140,141,69,153,141,138,69,141,142,140,141,145,142,140,141,153,69,139,142,145,145,69,142,152}), callback = function(v) S.espFillTransparency = v; if S.toggles.esp then _V56fbc9ef16d(true) end end })
		_Ve79e7f32113(sc, { order = n(), title = _Vzd({106,120,117,69,116,154,153,145,142,147,138,69,121,151,134,147,152,149,134,151,138,147,136,158}), min = 0, max = 1, default = 0.3, step = 0.1,
			stateKey = _Vzd({138,152,149,116,154,153,145,142,147,138,121,151,134,147,152,149,134,151,138,147,136,158}), tip = _Vzd({201,240,248,161,244,230,230,174,245,233,243,240,246,232,233,161,245,233,230,161,240,246,245,237,234,239,230,161,234,244}), callback = function(v) S.espOutlineTransparency = v; if S.toggles.esp then _V56fbc9ef16d(true) end end })
		_V966b09a310f(sc, { order = n(), title = _Vzd({106,120,117,69,105,138,149,153,141,69,114,148,137,138}), options = { _Vzd({194,237,248,226,250,244,208,239,213,240,241}), _Vzd({208,228,228,237,246,229,230,229}) }, default = _Vzd({194,237,248,226,250,244,208,239,213,240,241}),
			tip = _Vzd({102,145,156,134,158,152,116,147,121,148,149,69,98,69,152,138,138,69,153,141,151,148,154,140,141,69,156,134,145,145,152,69,161,69,116,136,136,145,154,137,138,137,69,98,69,141,142,137,137,138,147,69,135,158,69,156,134,145,145,152}), callback = function(v) S.espDepthMode = v; if S.toggles.esp then _V56fbc9ef16d(true) end end })
		_Ve133dbec114(sc, { order = n(), id = _Vzd({231,246,237,237,227,243,234,232,233,245}), title = _Vzd({199,246,237,237,227,243,234,232,233,245}), tip = _Vzd({206,226,249,161,227,243,234,232,233,245,239,230,244,244,161,176,161,239,240,161,231,240,232}), callback = _Ve7a1825216f })
		_Ve133dbec114(sc, { order = n(), id = _Vzd({239,240,199,240,232}), title = _Vzd({115,148,69,107,148,140}), callback = function(on) if on then Lighting.FogEnd=1e9 else Lighting.FogEnd=100000 end end })
		_Ve133dbec114(sc, { order = n(), id = _Vzd({239,234,232,233,245}), title = _Vzd({207,234,232,233,245,161,206,240,229,230}), callback = function(on) Lighting.ClockTime = on and 0 or 14 end })
		_Ve133dbec114(sc, { order = n(), id = _Vzd({229,226,250}), title = _Vzd({197,226,250,161,206,240,229,230}), callback = function(on) if on then Lighting.ClockTime = 14 end end })
		_Ve79e7f32113(sc, { order = n(), title = _Vzd({199,208,215}), min = 50, max = 120, default = 70, callback = function(v)
			local cam = workspace.CurrentCamera; if cam then cam.FieldOfView = v end
		end })
		_Vbb4234fd160(sc, _Vzd({104,102,114,106,119,102}), n())
		S.thirdPersonDist = S.thirdPersonDist or 12
		_Ve133dbec114(sc, {
			order = n(),
			id = _Vzd({245,233,234,243,229,209,230,243,244,240,239}),
			title = _Vzd({180,243,229,161,209,230,243,244,240,239,161,206,240,229,230}),
			tip = _Vzd({107,148,151,136,138,69,104,145,134,152,152,142,136,69,136,134,146,138,151,134,69,159,148,148,146,138,137,69,148,154,153,69,77,135,145,148,136,144,152,69,139,142,151,152,153,82,149,138,151,152,148,147,69,145,148,136,144,78}),
			desc = _Vzd({212,228,243,240,237,237,161,251,240,240,238,161,244,245,234,237,237,161,248,240,243,236,244,161,248,234,245,233,234,239,161,243,226,239,232,230}),
			callback = function(on)
				_V11a5d4671af(_Vzd({245,233,234,243,229,209,230,243,244,240,239}))
				S.toggles.thirdPerson = on
				if on then
					local dist = tonumber(S.thirdPersonDist) or 12
					pcall(function()
						LP.CameraMode = Enum.CameraMode.Classic
						LP.CameraMinZoomDistance = dist
						LP.CameraMaxZoomDistance = math.max(LP.CameraMaxZoomDistance, math.max(dist + 20, 128))
						local cam = workspace.CurrentCamera
						local h = char() and char():FindFirstChildOfClass(_Vzd({201,246,238,226,239,240,234,229}))
						if cam and h then
							cam.CameraType = Enum.CameraType.Custom
							cam.CameraSubject = h
						end
					end)
					_V53fa917f1a2(_Vzd({245,233,234,243,229,209,230,243,244,240,239}), 0.12, function()
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
							local h = char() and char():FindFirstChildOfClass(_Vzd({201,246,238,226,239,240,234,229}))
							if cam and h and cam.CameraSubject ~= h then
								if not (controlState and controlState.running) then
									cam.CameraSubject = h
								end
							end
						end)
					end)
					_V556c1dc412c(HUB_NAME, _Vzd({180,243,229,161,241,230,243,244,240,239,161,208,207,161,253,161,229,234,244,245,161}) .. tostring(dist), 1.2)
				else
					pcall(function()
						LP.CameraMode = Enum.CameraMode.Custom
						LP.CameraMinZoomDistance = 0.5
						LP.CameraMaxZoomDistance = 128
						local cam = workspace.CurrentCamera
						local h = char() and char():FindFirstChildOfClass(_Vzd({109,154,146,134,147,148,142,137}))
						if cam then
							cam.CameraType = Enum.CameraType.Custom
							if h and not (controlState and controlState.running) then
								cam.CameraSubject = h
							end
						end
					end)
					_V556c1dc412c(HUB_NAME, _Vzd({88,151,137,69,149,138,151,152,148,147,69,116,107,107}), 1)
				end
			end,
		})
		_Ve79e7f32113(sc, {
			order = n(),
			title = _Vzd({180,243,229,161,209,230,243,244,240,239,161,197,234,244,245,226,239,228,230}),
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
		_Vc79d533d10e(sc, { order = n(), title = _Vzd({119,138,152,138,153,69,113,142,140,141,153,142,147,140}), callback = function()
			_Ve7a1825216f(false); Lighting.ClockTime=14; Lighting.FogEnd=100000
			if S.hubOpen then _Vbd03d77e177(true) else _Vbd03d77e177(false) end
		end })
end
_TAB_BUILDERS[_Vzd({226,246,245,240})] = function(sc, n)
		_Vbb4234fd160(sc, _Vzd({194,214,213,208,161,203,208,195,212}), n())
		_Ve133dbec114(sc, { order = n(), id = _Vzd({226,239,245,234,226,231,236}), title = _Vzd({194,239,245,234,174,194,199,204}), callback = function(on)
			if S.conns.afk then pcall(function() S.conns.afk:Disconnect() end) end
			if on then S.conns.afk = LP.Idled:Connect(function()
				pcall(function() VirtualUser:CaptureController(); VirtualUser:ClickButton2(Vector2.new()) end)
			end) end
		end })
		_Ve133dbec114(sc, { order = n(), id = _Vzd({226,246,245,240,199,237,234,239,232,207,230,226,243,230,244,245}), title = _Vzd({194,246,245,240,161,199,237,234,239,232,161,207,230,226,243,230,244,245}), tip = _Vzd({210,246,234,230,245,161,237,240,240,241,161,246,239,245,234,237,161,245,233,230,250,161,229,234,230}), callback = function(on)
			_V11a5d4671af(_Vzd({226,246,245,240,199,237,234,239,232,207}))
			if on then _V53fa917f1a2(_Vzd({134,154,153,148,107,145,142,147,140,115}), 0.35, function()
				local me = hrp(); if not me then return end
				local best, bd = nil, S.auraRange or 50
				for _, p in ipairs(Players:GetPlayers()) do
					if _Vd6eb72811f9(p) then
						local d = (_Vb2220e5a155(p).Position - me.Position).Magnitude
						if d < bd then best, bd = p, d end
					end
				end
				if best then _Vcc8279d692(best, S.flingPower, true) end
			end) end
		end })
		_Ve133dbec114(sc, { order = n(), id = _Vzd({226,246,245,240,204,234,228,236,207,230,226,243,230,244,245}), title = _Vzd({102,154,153,148,69,112,142,136,144,69,115,138,134,151,138,152,153}), callback = function(on)
			_V11a5d4671af(_Vzd({226,246,245,240,204,234,228,236,207}))
			if on then _V53fa917f1a2(_Vzd({226,246,245,240,204,234,228,236,207}), 0.4, function()
				local me = hrp(); if not me then return end
				for _, p in ipairs(Players:GetPlayers()) do
					if _Vd6eb72811f9(p) and (_Vb2220e5a155(p).Position-me.Position).Magnitude < (S.auraRange or 50) then
						_V971ad737104(p, S.kickType, true)
					end
				end
			end) end
		end })
		_Ve133dbec114(sc, { order = n(), id = _Vzd({226,246,245,240,212,207,208}), title = _Vzd({194,246,245,240,161,207,230,245,248,240,243,236,161,208,248,239,161,194,246,243,226}), tip = _Vzd({194,237,234,226,244,161,240,231,161,239,230,245,240,248,239,161,226,246,243,226}), callback = function(on)
			S.toggles.aura_netown = on; _Ve239e5a8164(_Vzd({239,230,245,240,248,239}), on)
		end })
		_Ve133dbec114(sc, { order = n(), id = _Vzd({226,246,245,240,211,230,244,241,226,248,239,209,226,229}), title = _Vzd({102,154,153,148,69,120,149,134,156,147,69,117,134,145,145,138,153,69,148,147,69,119,138,152,149,134,156,147}), callback = function(on)
			if S.conns.respawnPal then pcall(function() S.conns.respawnPal:Disconnect() end) end
			if on then S.conns.respawnPal = LP.CharacterAdded:Connect(function()
				task.wait(1); _Vd788f8c8197(_Vzd({209,226,237,237,230,245,205,234,232,233,245,195,243,240,248,239}))
			end) end
		end })
		S.toggles.autoRejoin = (getgenv and type(getgenv) == "function" and getgenv().VOIDZ_ANTIKICK and getgenv().VOIDZ_ANTIKICK.enabled) == true
		_Ve133dbec114(sc, {
			order = n(), id = _Vzd({226,246,245,240,211,230,235,240,234,239}), title = _Vzd({102,154,153,148,69,119,138,143,148,142,147,69,142,139,69,112,142,136,144,138,137}),
			tip = _Vzd({212,226,238,230,161,226,244,161,194,239,245,234,161,174,191,161,194,239,245,234,174,204,234,228,236,161,169,228,240,239,244,240,237,230,161,172,161,211,240,227,237,240,249,161,236,234,228,236,161,214,202,161,244,228,226,239,170}),
			callback = function(on) _Vb210fd22161(on) end,
		})
		_Ve133dbec114(sc, { order = n(), id = _Vzd({226,246,245,240,196,237,226,234,238}), title = _Vzd({194,246,245,240,161,196,237,226,234,238,161,209,237,240,245}), tip = _Vzd({104,145,142,136,144,69,149,145,148,153,69,152,142,140,147,152,69,84,69,136,145,134,142,146,69,137,138,153,138,136,153,148,151,152,69,147,138,134,151,135,158}), callback = function(on)
			_V11a5d4671af(_Vzd({226,246,245,240,196,237,226,234,238}))
			if on then _V53fa917f1a2(_Vzd({226,246,245,240,196,237,226,234,238}), 0.8, function()
				local me = hrp(); if not me then return end
				for _, d in ipairs(workspace:GetDescendants()) do
					if d:IsA(_Vzd({196,237,234,228,236,197,230,245,230,228,245,240,243})) and d.Parent and d.Parent:IsA(_Vzd({195,226,244,230,209,226,243,245})) then
						local n = (d.Parent.Name .. " " .. (d.Parent.Parent and d.Parent.Parent.Name or "")):lower()
						if (d.Parent.Position - me.Position).Magnitude < 40 then
							if n:find(_Vzd({241,237,240,245})) or n:find(_Vzd({228,237,226,234,238})) or n:find(_Vzd({233,240,246,244,230})) or n:find(_Vzd({244,234,232,239}))
								or (d.Parent.Position - me.Position).Magnitude < 18 then
								pcall(function() fireclickdetector(d) end)
							end
						end
					end
				end
			end) end
		end })
		_Ve133dbec114(sc, {
			order = n(), id = _Vzd({226,246,245,240,212,241,234,239}), title = _Vzd({102,154,153,148,82,120,149,142,147,69,104,148,142,147,152}),
			tip = _Vzd({216,233,230,239,161,226,237,237,161,244,237,240,245,161,237,234,232,233,245,244,161,226,243,230,161,207,230,240,239,187,161,213,209,161,240,239,161,230,226,228,233,161,248,233,230,230,237,161,201,226,239,229,237,230,161,172,161,212,207,208,161,169,255,178,244,161,230,226,228,233,170}),
			desc = _Vzd({248,240,243,236,244,241,226,228,230,175,212,237,240,245,244,161,253,161,244,226,247,230,244,176,243,230,245,246,243,239,244,161,241,240,244,234,245,234,240,239,161,253,161,255,182,244,161,227,230,245,248,230,230,239,161,243,240,246,239,229,244}),
			callback = function(on)
				_Ve1cc89b1165(on)
			end,
		})
		_Vc79d533d10e(sc, {
			order = n(),
			title = _Vzd({120,149,142,147,69,104,148,142,147,152,69,116,147,136,138,69,115,148,156}),
			tip = _Vzd({116,147,138,69,139,154,145,145,69,149,134,152,152,69,147,148,156,69,77,142,140,147,148,151,138,152,69,115,138,148,147,69,156,134,142,153,78}),
			callback = function()
				task.spawn(function()
					local handles = _V3c7971fd15e()
					if #handles == 0 then
						_V556c1dc412c(HUB_NAME, _Vzd({207,240,161,212,237,240,245,201,226,239,229,237,230,175,201,226,239,229,237,230,161,231,240,246,239,229}), 2)
						return
					end
					_V556c1dc412c(HUB_NAME, _Vzd({212,241,234,239,239,234,239,232,161}) .. #handles .. "...", 1.5)
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
								_Vd54091601e3(current)
								_V5ee3b665188(current)
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
							_Vd54091601e3(handle)
							_V5ee3b665188(handle)
							task.wait(0.2)
						end
						pcall(function() handle.CanCollide = old end)
					end
					chase = false
					S.toggles.autoSpin = was
					local rr = hrp()
					if rr then pcall(function() rr.CFrame = saved end) end
					_V556c1dc412c(HUB_NAME, _Vzd({212,241,234,239,161,240,239,228,230,161,229,240,239,230}), 1.5)
				end)
			end,
		})
		_Ve133dbec114(sc, {
			order = n(), id = _Vzd({134,154,153,148,121,142,146,138,119,138,152,138,153}), title = _Vzd({194,246,245,240,161,213,234,238,230,174,211,230,244,230,245}),
			tip = _Vzd({196,237,234,228,236,161,245,234,238,230,174,243,230,244,230,245,161,176,161,228,237,240,228,236,161,214,202,161,239,230,226,243,227,250,161,245,240,161,236,230,230,241,161,241,237,240,245,161,245,234,238,230}),
			callback = function(on)
				_V11a5d4671af(_Vzd({226,246,245,240,213,234,238,230}))
				if on then _V53fa917f1a2(_Vzd({226,246,245,240,213,234,238,230}), 2, function()
					local me = hrp(); if not me then return end
					for _, d in ipairs(workspace:GetDescendants()) do
						if d:IsA(_Vzd({196,237,234,228,236,197,230,245,230,228,245,240,243})) and d.Parent and d.Parent:IsA(_Vzd({195,226,244,230,209,226,243,245})) then
							local n = tostring(d.Parent.Name):lower()
							if (n:find(_Vzd({245,234,238,230})) or n:find(_Vzd({243,230,244,230,245})) or n:find(_Vzd({228,237,240,228,236})) or n:find(_Vzd({241,243,230,244,230,243,247,230})))
								and (d.Parent.Position - me.Position).Magnitude < 50 then
								pcall(function() fireclickdetector(d) end)
							end
						end
					end
					for _, d in ipairs(workspace:GetDescendants()) do
						if d:IsA(_Vzd({209,243,240,249,234,238,234,245,250,209,243,240,238,241,245})) then
							local n = (d.ActionText .. " " .. d.ObjectText):lower()
							if n:find(_Vzd({245,234,238,230})) or n:find(_Vzd({243,230,244,230,245})) then
								pcall(function() fireproximityprompt(d) end)
							end
						end
					end
				end) end
			end,
		})
		_Ve133dbec114(sc, {
			order = n(), id = _Vzd({238,234,244,244,234,237,230,212,245,243,234,236,230}), title = _Vzd({206,234,244,244,234,237,230,161,212,245,243,234,236,230,161,169,245,226,243,232,230,245,170}),
			tip = _Vzd({212,226,238,230,161,226,244,161,198,249,241,237,240,244,234,240,239,244,161,245,226,227,161,253,161,246,244,230,244,161,244,230,237,230,228,245,230,229,161,176,161,237,240,240,241,161,245,226,243,232,230,245}),
			danger = true,
			callback = function(on)
				if on then
					S.missileTarget = S.loopTarget or S.selected or S.missileTarget
					_V9af28be6174(true)
				else
					_Vc84a2cd41b1()
				end
			end,
		})
		_Ve133dbec114(sc, {
			order = n(), id = _Vzd({226,246,245,240,205,226,232,212,230,243,247,230,243}), title = _Vzd({205,226,232,161,212,230,243,247,230,243}),
			tip = _Vzd({212,226,238,230,161,226,244,161,212,230,243,247,230,243,161,245,226,227,161,253,161,196,243,230,226,245,230,200,243,226,227,205,234,239,230,161,234,239,245,230,239,244,234,245,250,161,244,241,226,238}),
			callback = function(on)
				if on then _Vbada9a16173(_Vzd({237,226,232,212,243,247}), true, _Ve57be27f106) else _V3e8a04041b0(_Vzd({237,226,232,212,243,247})) end
			end,
		})
		_Ve133dbec114(sc, {
			order = n(), id = _Vzd({226,246,245,240,197,230,244,245,243,240,250,201,250,227,243,234,229}), title = _Vzd({197,230,244,245,243,240,250,161,201,250,227,243,234,229,161,169,239,240,161,195,237,240,227,238,226,239,170}),
			tip = _Vzd({205,226,232,161,172,161,236,234,237,237,176,231,237,234,239,232,176,245,240,250,244,161,248,233,240,237,230,161,244,230,243,247,230,243}),
			callback = function(on)
				if on then _Vbada9a16173(_Vzd({137,138,152,153,151,148,158,109,158,135}), true, _Vd72e3cde68) else _V3e8a04041b0(_Vzd({229,230,244,245,243,240,250,201,250,227})) end
			end,
		})
end
_TAB_BUILDERS[_Vzd({228,240,239,244,240,237,230})] = function(sc, n)
		_Vbb4234fd160(sc, _Vzd({212,214,211,215,202,215,194,205}), n())
		_Ve133dbec114(sc, {
			order = n(), id = _Vzd({134,147,153,142,112,142,145,145}), title = _Vzd({194,239,245,234,174,204,234,237,237,161,169,216,226,245,230,243,161,176,161,194,228,234,229,170}),
			tip = _Vzd({213,209,161,245,240,161,244,226,231,230,161,233,240,246,244,230,161,245,233,230,161,234,239,244,245,226,239,245,161,250,240,246,161,245,240,246,228,233,161,248,226,245,230,243,161,240,243,161,226,228,234,229}),
			callback = function(on)
				S.toggles.antiKill = on
				if on then
					_V53fa917f1a2(_Vzd({226,239,245,234,204,234,237,237,216,226,245,230,243}), 0.08, function()
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
									if p:IsA(_Vzd({195,226,244,230,209,226,243,245})) and p.Size.Y > 0 then
										if p.Position.Y < -8 then inWater = true break end
									end
								end
							end
						end)
						if inWater then
							local free, owned = _Vce214d5c52()
							local pool = #free > 0 and free or owned
							if #pool > 0 then
								local pick = pool[math.random(1, #pool)]
								pcall(function()
									r.AssemblyLinearVelocity = Vector3.zero
									r.AssemblyAngularVelocity = Vector3.zero
									r.CFrame = pick.cf
								end)
								_V556c1dc412c(HUB_NAME, _Vzd({102,147,153,142,82,144,142,145,145,69,161,69}) .. pick.name, 1.5)
							end
						end
					end)
					_V556c1dc412c(HUB_NAME, _Vzd({194,239,245,234,174,236,234,237,237,161,208,207}), 1.5)
				else
					_V11a5d4671af(_Vzd({226,239,245,234,204,234,237,237,216,226,245,230,243}))
				end
			end,
		})
		_Vc79d533d10e(sc, {
			order = n(), title = _Vzd({121,117,69,121,148,69,120,134,139,138,69,117,145,134,136,138,69,115,148,156}),
			tip = _Vzd({202,239,244,245,226,239,245,237,250,161,245,230,237,230,241,240,243,245,161,245,240,161,226,161,243,226,239,229,240,238,161,233,240,246,244,230}),
			callback = function()
				local free, owned = _Vce214d5c52()
				local pool = #free > 0 and free or owned
				if #pool > 0 then
					local pick = pool[math.random(1, #pool)]
					local r = hrp()
					if r then
						pcall(function()
							r.AssemblyLinearVelocity = Vector3.zero
							r.CFrame = pick.cf
						end)
						_V556c1dc412c(HUB_NAME, _Vzd({120,134,139,138,69,121,117,69,161,69}) .. pick.name, 1.5)
					end
				else
					_V556c1dc412c(HUB_NAME, _Vzd({115,148,69,141,148,154,152,138,152,69,139,148,154,147,137}), 2)
				end
			end,
		})
		_Ve133dbec114(sc, {
			order = n(), id = _Vzd({234,239,247,234,239,228,234,227,237,230}), title = _Vzd({202,239,247,234,239,228,234,227,237,230,161,169,205,240,228,236,161,202,239,161,201,240,246,244,230,170}),
			tip = _Vzd({199,240,243,228,230,161,250,240,246,243,244,230,237,231,161,234,239,244,234,229,230,161,226,161,233,240,246,244,230,175,161,196,226,239,168,245,161,248,226,237,236,161,240,246,245,161,240,243,161,227,230,161,231,240,243,228,230,229,161,240,246,245,175,161,213,240,232,232,237,230,161,208,199,199,161,245,240,161,237,230,226,247,230,175}),
			callback = function(on)
				S.toggles.invincible = on
				if on then
					local free, owned = _Vce214d5c52()
					local pool = #free > 0 and free or owned
					if #pool == 0 then
						_V556c1dc412c(HUB_NAME, _Vzd({207,240,161,233,240,246,244,230,244,161,245,240,161,237,240,228,236,161,234,239,245,240}), 2)
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
					_V53fa917f1a2(_Vzd({234,239,247,234,239,228,234,227,237,230}), 0.05, function()
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
					_V556c1dc412c(HUB_NAME, _Vzd({110,147,155,142,147,136,142,135,145,138,69,116,115,69,161,69,145,148,136,144,138,137,69,142,147,69}) .. pick.name, 2)
				else
					_V11a5d4671af(_Vzd({234,239,247,234,239,228,234,227,237,230}))
					local h = hum()
					if h then
						pcall(function()
							h.WalkSpeed = 16
							h.PlatformStand = false
						end)
					end
					_V556c1dc412c(HUB_NAME, _Vzd({202,239,247,234,239,228,234,227,237,230,161,208,199,199}), 1.5)
				end
			end,
		})
		_Ve133dbec114(sc, {
			order = n(), id = _Vzd({152,149,134,146,121,117}), title = _Vzd({120,149,134,146,69,121,117,69,77,102,147,153,142,82,112,142,145,145,78}),
			tip = _Vzd({121,138,145,138,149,148,151,153,69,134,151,148,154,147,137,69,153,141,138,69,146,134,149,69,151,134,147,137,148,146,145,158,69,134,153,69,145,142,140,141,153,69,152,149,138,138,137,83,69,104,134,147,76,153,69,135,138,69,153,134,151,140,138,153,138,137,69,148,151,69,145,148,136,144,138,137,69,148,147,83}),
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
					_V53fa917f1a2(_Vzd({244,241,226,238,213,209}), 0.06, function()
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
					_V556c1dc412c(HUB_NAME, _Vzd({120,149,134,146,69,121,117,69,116,115,69,161,69,145,142,140,141,153,69,152,149,138,138,137}), 1.5)
				else
					_V11a5d4671af(_Vzd({244,241,226,238,213,209}))
					_V556c1dc412c(HUB_NAME, _Vzd({120,149,134,146,69,121,117,69,116,107,107}), 1)
				end
			end,
		})
		_Vbb4234fd160(sc, _Vzd({194,207,213,202,174,204,202,196,204}), n())
		_Ve133dbec114(sc, {
			order = n(), id = _Vzd({226,239,245,234,204,234,228,236,206,234,244,228}), title = _Vzd({194,239,245,234,174,204,234,228,236,161,169,211,230,235,240,234,239,170}),
			tip = _Vzd({202,231,161,236,234,228,236,230,229,187,161,234,239,244,245,226,239,245,237,250,161,243,230,235,240,234,239,161,245,233,230,161,244,226,238,230,161,244,230,243,247,230,243}),
			callback = function(on)
				AK.enabled = on
				S.toggles.antiKick = on
				if on then
					AK.readyAt = os.clock() + 12
					_V556c1dc412c(HUB_NAME, _Vzd({102,147,153,142,82,144,142,136,144,69,116,115,69,161,69,86,87,152,69,140,151,134,136,138}), 2)
				else
					_V556c1dc412c(HUB_NAME, _Vzd({194,239,245,234,174,236,234,228,236,161,208,199,199}), 1)
				end
			end,
		})
		_Ve133dbec114(sc, {
			order = n(), id = _Vzd({226,239,245,234,194,199,204}), title = _Vzd({194,239,245,234,174,194,199,204}),
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
					_V556c1dc412c(HUB_NAME, _Vzd({194,239,245,234,174,194,199,204,161,208,207}), 1.5)
				else
					if S._antiAFKConn then pcall(function() S._antiAFKConn:Disconnect() end) S._antiAFKConn = nil end
				end
			end,
		})
		_Ve133dbec114(sc, {
			order = n(), id = _Vzd({226,239,245,234,205,226,232}), title = _Vzd({194,239,245,234,174,205,226,232}),
			tip = _Vzd({197,234,244,226,227,237,230,161,196,233,226,243,226,228,245,230,243,194,239,229,195,230,226,238,206,240,247,230,161,237,240,228,226,237,161,244,228,243,234,241,245,161,245,240,161,243,230,229,246,228,230,161,237,226,232}),
			callback = function(on)
				S.toggles.antiLag = on
				pcall(function()
					local script = LP.PlayerScripts:FindFirstChild(_Vzd({196,233,226,243,226,228,245,230,243,194,239,229,195,230,226,238,206,240,247,230}))
					if script then script.Disabled = on end
				end)
			end,
		})
		_Vbb4234fd160(sc, _Vzd({206,208,215,198,206,198,207,213}), n())
		_Ve133dbec114(sc, {
			order = n(), id = _Vzd({147,148,136,145,142,149}), title = _Vzd({207,240,228,237,234,241}),
			tip = _Vzd({196,226,239,196,240,237,237,234,229,230,161,231,226,237,244,230,161,230,247,230,243,250,161,231,243,226,238,230,161,174,161,248,226,237,236,161,245,233,243,240,246,232,233,161,248,226,237,237,244}),
			callback = function() end,
		})
		_Ve133dbec114(sc, {
			order = n(), id = _Vzd({244,241,230,230,229}), title = _Vzd({216,226,237,236,212,241,230,230,229,161,208,247,230,243,243,234,229,230}),
			tip = _Vzd({211,230,174,226,241,241,237,234,230,244,161,230,247,230,243,250,161,231,243,226,238,230,161,169,199,213,194,209,161,243,230,244,230,245,244,161,244,241,230,230,229,170}),
			callback = function() end,
		})
		_Ve79e7f32113(sc, { order = n(), title = _Vzd({216,226,237,236,212,241,230,230,229}), min = 16, max = 300, default = 50, stateKey = _Vzd({248,226,237,236,212,241,230,230,229}) })
		_Ve133dbec114(sc, {
			order = n(), id = _Vzd({152,149,138,138,137,104,107,151,134,146,138}), title = _Vzd({196,199,243,226,238,230,161,212,241,230,230,229,161,195,240,240,244,245}),
			tip = _Vzd({198,249,245,243,226,161,196,199,243,226,238,230,161,241,246,244,233,161,174,161,231,226,244,245,230,243,161,245,233,226,239,161,248,226,237,236,161,244,241,230,230,229}),
			callback = function() end,
		})
		_Ve79e7f32113(sc, { order = n(), title = _Vzd({196,199,243,226,238,230,161,206,246,237,245}), min = 1, max = 8, default = 2, stateKey = _Vzd({152,149,138,138,137,114,154,145,153}) })
		_Ve133dbec114(sc, {
			order = n(), id = _Vzd({234,239,231,235,246,238,241}), title = _Vzd({110,147,139,142,147,142,153,138,69,111,154,146,149}),
			tip = _Vzd({203,246,238,241,211,230,242,246,230,244,245,161,174,191,161,231,240,243,228,230,161,203,246,238,241,161,248,233,234,237,230,161,208,207}),
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
		_Ve133dbec114(sc, {
			order = n(), id = _Vzd({235,246,238,241}), title = _Vzd({203,246,238,241,209,240,248,230,243,161,208,247,230,243,243,234,229,230}),
			callback = function() end,
		})
		_Ve79e7f32113(sc, { order = n(), title = _Vzd({111,154,146,149,69,117,148,156,138,151}), min = 50, max = 500, default = 80, stateKey = _Vzd({143,154,146,149,117,148,156,138,151}) })
		_Vc79d533d10e(sc, {
			order = n(), title = _Vzd({211,230,244,230,245,161,206,240,247,230,238,230,239,245}), danger = true,
			callback = function()
				S.toggles.speed = false; S.toggles.fly = false; S.toggles.noclip = false
				S.toggles.infjump = false; S.toggles.jump = false; S.toggles.speedCFrame = false
				_Va9d755db16e(false)
				local h = hum(); if h then h.WalkSpeed = 16; h.JumpPower = 50 end
			end,
		})
		_Vbb4234fd160(sc, _Vzd({212,198,211,215,198,211}), n())
		_Vc79d533d10e(sc, { order = n(), title = _Vzd({119,138,143,148,142,147}), callback = function()
			pcall(function() TeleportService:TeleportToPlaceInstance(game.PlaceId, game.JobId, LP) end)
		end })
		_Vc79d533d10e(sc, { order = n(), title = _Vzd({104,148,149,158,69,111,148,135,110,137}), callback = function()
			if setclipboard then setclipboard(game.JobId) end; _V556c1dc412c(HUB_NAME, _Vzd({196,240,241,234,230,229}), 1)
		end })
		_Vc79d533d10e(sc, { order = n(), title = _Vzd({211,230,244,230,245,161,228,233,226,243,226,228,245,230,243}), callback = function() local h = hum(); if h then h.Health = 0 end end })
		_Vc79d533d10e(sc, { order = n(), title = _Vzd({112,142,145,145,69,134,145,145,69,145,148,148,149,152}), danger = true, callback = function()
			for k in pairs(S.loops) do S.loops[k] = false end
			for k in pairs(S.toggles) do
				if tostring(k):find(_Vzd({226,246,243,226})) or tostring(k):find(_Vzd({237,240,240,241})) or tostring(k):find(_Vzd({226,246,245,240})) then
					S.toggles[k] = false
				end
			end
			_V7d0b566f41()
			_V60fd70b84d(true)
			_V5edd98521ad(true)
			_V556c1dc412c(HUB_NAME, _Vzd({113,148,148,149,152,69,152,153,148,149,149,138,137}), 1.2)
		end })
		_Vbb4234fd160(sc, _Vzd({196,208,206,206,194,207,197,161,196,208,207,212,208,205,198}), n())
		local outBox = Instance.new(_Vzd({212,228,243,240,237,237,234,239,232,199,243,226,238,230}))
		outBox.LayoutOrder = n()
		outBox.Size = UDim2.new(1, -6, 0, 150)
		outBox.BackgroundColor3 = Color3.fromRGB(6, 4, 12)
		outBox.BorderSizePixel = 0
		outBox.ScrollBarThickness = 3
		outBox.ScrollBarImageColor3 = C.accent
		outBox.AutomaticCanvasSize = Enum.AutomaticSize.Y
		outBox.CanvasSize = UDim2.new()
		outBox.Parent = sc
		_Ve7cf4e7f5f(outBox, 8)
		_Vb145617c1ba(outBox, C._Vb145617c1ba, 1)
		local outLay = Instance.new(_Vzd({214,202,205,234,244,245,205,226,250,240,246,245}))
		outLay.Padding = UDim.new(0, 2)
		outLay.Parent = outBox
		pad(outBox, 6, 6, 6, 6)
		S.consoleOut = outBox
		local function consPrint(line, col)
			if not S.consoleOut then return end
			local l = Instance.new(_Vzd({213,230,249,245,205,226,227,230,237}))
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
				if ch:IsA(_Vzd({213,230,249,245,205,226,227,230,237})) then kids[#kids + 1] = ch end
			end
			while #kids > 80 do
				kids[1]:Destroy()
				table.remove(kids, 1)
			end
		end
		S.consPrint = consPrint
		consPrint(_Vzd({123,116,110,105,127,69,136,148,147,152,148,145,138,69,161,69,153,158,149,138,69,141,138,145,149}), C.accent2)
		consPrint(_Vzd({120,136,134,147,69,82,99,69,145,142,152,153,152,69,148,147,145,158,69,149,145,134,158,138,151,69,147,134,146,138,152,69,153,141,134,153,69,145,148,148,144,69,139,145,134,140,140,138,137,83}), C.muted)
		_V9b23dd72110(sc, { order = n(), id = _Vzd({228,240,239,244,240,237,230,202,239,241,246,245}), placeholder = _Vzd({228,238,229,161,253,161,233,230,237,241,161,253,161,231,237,234,239,232,161,239,226,238,230,161,253,161,244,228,226,239}) })
		_Vc79d533d10e(sc, {
			order = n(), title = _Vzd({119,154,147,69,104,148,146,146,134,147,137}),
			callback = function()
				local box = S.consoleInput
				local line = box and box.Text or ""
				if line == "" then return end
				if box then box.Text = "" end
				_Vdc3119ab158(line)
			end,
		})
		_Vc79d533d10e(sc, {
			order = n(), title = _Vzd({212,228,226,239,161,209,237,226,250,230,243,244,161,169,230,249,241,237,240,234,245,161,244,234,232,239,244,170}),
			callback = function() _Vdc3119ab158(_Vzd({244,228,226,239})) end,
		})
		_Vc79d533d10e(sc, {
			order = n(), title = _Vzd({104,145,138,134,151,69,104,148,147,152,148,145,138}),
			callback = function()
				if S.consoleOut then
					for _, ch in ipairs(S.consoleOut:GetChildren()) do
						if ch:IsA(_Vzd({213,230,249,245,205,226,227,230,237})) then ch:Destroy() end
					end
				end
				consPrint(_Vzd({228,237,230,226,243,230,229}), C.muted)
			end,
		})
		task.defer(function()
			if S.consoleInput then
				S.consoleInput.FocusLost:Connect(function(enter)
					if enter and S.consoleInput.Text ~= "" then
						local line = S.consoleInput.Text
						S.consoleInput.Text = ""
						_Vdc3119ab158(line)
					end
				end)
			end
		end)
		_Vbb4234fd160(sc, _Vzd({213,208,208,205,212}), n())
		_Vc79d533d10e(sc, { order = n(), title = _Vzd({197,230,237,230,245,230,161,238,250,161,245,240,250,244}), danger = true, callback = function()
			_V556c1dc412c(HUB_NAME, _Vzd({196,237,230,226,243,230,229,161}) .. _Vc5b9c6e765(), 1.2)
		end })
end
_TAB_BUILDERS[_Vzd({228,240,239,245,243,240,237})] = function(sc, n)
		_Vbb4234fd160(sc, _Vzd({196,208,207,213,211,208,205}), n())
		local ctrlNote = Instance.new(_Vzd({213,230,249,245,205,226,227,230,237}))
		ctrlNote.LayoutOrder = n()
		ctrlNote.Size = UDim2.new(1, -6, 0, 36)
		ctrlNote.BackgroundColor3 = C.card
		ctrlNote.BorderSizePixel = 0
		ctrlNote.Font = Enum.Font.Gotham
		ctrlNote.TextSize = 11
		ctrlNote.TextColor3 = C.muted
		ctrlNote.TextXAlignment = Enum.TextXAlignment.Left
		ctrlNote.TextWrapped = true
		ctrlNote.Text = _Vzd({69,113,148,148,144,69,80,69,98,69,161,69,124,102,120,105,69,137,151,142,155,138,69,161,69,120,149,134,136,138,69,143,154,146,149,69,161,69,103,145,148,135,146,134,147,95,69,120,149,134,136,138,84,104,153,151,145,69,139,145,158,69,161,69,98,69,137,151,148,149})
		ctrlNote.Parent = sc
		_Ve7cf4e7f5f(ctrlNote, 8)
		pad(ctrlNote, 8, 8, 8, 8)
		S.playerDropdowns = S.playerDropdowns or {}
		S._ctrlSearchRefresh = _V19a46d3f111(sc, {
			clickFn = function(p) S.controlPick = p; S.selected = p end,
		}, n)
		_Vc79d533d10e(sc, {
			order = n(),
			title = _Vzd({211,230,231,243,230,244,233}),
			callback = function()
				if S._ctrlSearchRefresh then S._ctrlSearchRefresh() end
				local nPl = #_V240e7cb9138()
				_V556c1dc412c(HUB_NAME, nPl .. _Vzd({69,149,145,134,158,138,151}) .. (nPl == 1 and "" or "s"), 1)
			end,
		})
		_Vc79d533d10e(sc, {
			order = n(),
			title = _Vzd({104,148,147,153,151,148,145,69,152,138,145,138,136,153,138,137}),
			callback = function() _Vabc125a75c() end,
		})
		if S.toggles.controlBindC == nil then S.toggles.controlBindC = false end
		_Ve133dbec114(sc, {
			order = n(),
			id = _Vzd({228,240,239,245,243,240,237,195,234,239,229,196}),
			title = _Vzd({98,69,161,69,145,148,148,144,69,136,148,147,153,151,148,145}),
			tip = _Vzd({119,134,158,69,139,151,148,146,69,141,138,134,137,69,134,145,148,147,140,69,136,134,146,138,151,134,83,69,124,148,151,144,152,69,148,147,69,149,145,134,158,138,151,152,69,80,69,103,145,148,135,146,134,147,83}),
			callback = function(on)
				_Vd3e2addedc(on)
			end,
		})
		_Vc79d533d10e(sc, {
			order = n(),
			title = _Vzd({196,240,239,245,243,240,237,161,237,240,240,236,161,245,226,243,232,230,245}),
			callback = function() _Vb7967b4657() end,
		})
		_Vc79d533d10e(sc, {
			order = n(),
			title = _Vzd({196,240,239,245,243,240,237,161,239,230,226,243,230,244,245}),
			callback = function()
				local p = _Vd9660b82129(1e9)
				if not p or not p.Character then
					_V556c1dc412c(HUB_NAME, _Vzd({207,240,227,240,229,250}), 1)
					return
				end
				S.selected = p
				S.controlPick = p
				if S._ctrlSearchRefresh then pcall(S._ctrlSearchRefresh) end
				_V396a943419e(p.Character)
			end,
		})
		_Vc79d533d10e(sc, {
			order = n(),
			title = _Vzd({104,148,147,153,151,148,145,69,115,117,104}),
			tip = _Vzd({197,230,228,240,250,161,176,161,243,240,227,237,240,249,234,226,239,161,176,161,228,243,230,226,245,246,243,230,244,161,169,195,237,240,227,238,226,239,161,245,240,240,237,244,161,226,243,230,161,240,239,161,195,237,240,227,238,226,239,161,245,226,227,170}),
			callback = function() _Va14c2ad758() end,
		})
		_Vc79d533d10e(sc, {
			order = n(),
			title = _Vzd({212,245,240,241}),
			danger = true,
			callback = function() _V5edd98521ad() end,
		})
end
_TAB_BUILDERS[_Vzd({153,151,134,147,152})] = function(sc, n)
		_Vbb4234fd160(sc, _Vzd({196,201,194,213,161,213,211,194,207,212,205,194,213,208,211}), n())
		local TRAN_LANGS = {
			English = _Vzd({230,239}), Spanish = _Vzd({230,244}), French = _Vzd({231,243}), German = _Vzd({229,230}),
			Portuguese = _Vzd({241,245}), Japanese = _Vzd({235,226}), Korean = _Vzd({236,240}), Chinese = _Vzd({251,233,174,196,207}),
			Russian = _Vzd({243,246}), Arabic = _Vzd({226,243}), Italian = _Vzd({234,245}), Hindi = _Vzd({233,234}),
		}
		local function detectLang(text)
			for _, c in utf8.codes(text) do
				if c > 0x2FFF then
					if c >= 0x4E00 and c <= 0x9FFF then return _Vzd({251,233}) end
					if c >= 0x3040 and c <= 0x30FF then return _Vzd({235,226}) end
					if c >= 0xAC00 and c <= 0xD7AF then return _Vzd({236,240}) end
					return _Vzd({246,239,236})
				end
			end
			if text:find("[\192-\255]") then return _Vzd({229,230,245,230,228,245}) end
			return _Vzd({230,239})
		end
		local function translateHttp(text, from, to)
			local ok, res = pcall(function()
				local url = "https://api.mymemory.translated.net/get?q=" .. game.HttpService:UrlEncode(text) .. _Vzd({167,237,226,239,232,241,226,234,243,190}) .. from .. "|" .. to
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
			return TRAN_LANGS[langName] or _Vzd({230,239})
		end
		local function isSameLang(a, b)
			if a == b then return true end
			if a == _Vzd({229,230,245,230,228,245}) and b ~= _Vzd({230,239}) then return false end
			return false
		end
		_Ve133dbec114(sc, {
			order = n(), id = _Vzd({226,246,245,240,213,243,226,239,244,237,226,245,230}), title = _Vzd({194,246,245,240,161,213,243,226,239,244,237,226,245,230,161,196,233,226,245}),
			tip = _Vzd({105,138,153,138,136,153,152,69,147,148,147,82,106,147,140,145,142,152,141,69,146,138,152,152,134,140,138,152,69,134,147,137,69,152,141,148,156,152,69,106,147,140,145,142,152,141,69,153,151,134,147,152,145,134,153,142,148,147}),
			callback = function(on)
				S.toggles.autoTranslate = on
				_V556c1dc412c(HUB_NAME, _Vzd({102,154,153,148,82,153,151,134,147,152,145,134,153,138,69}) .. (on and _Vzd({208,207}) or _Vzd({208,199,199})), 1.5)
			end,
		})
		_V966b09a310f(sc, {
			order = n(), title = _Vzd({121,151,134,147,152,145,134,153,138,69,121,148}),
			options = { _Vzd({198,239,232,237,234,244,233}), _Vzd({212,241,226,239,234,244,233}), _Vzd({199,243,230,239,228,233}), _Vzd({200,230,243,238,226,239}), _Vzd({209,240,243,245,246,232,246,230,244,230}), _Vzd({203,226,241,226,239,230,244,230}), _Vzd({204,240,243,230,226,239}), _Vzd({104,141,142,147,138,152,138}), _Vzd({119,154,152,152,142,134,147}), _Vzd({194,243,226,227,234,228}), _Vzd({202,245,226,237,234,226,239}), _Vzd({201,234,239,229,234}) },
			default = S.transLang or _Vzd({106,147,140,145,142,152,141}),
			callback = function(v) S.transLang = v end,
		})
		_Vbb4234fd160(sc, _Vzd({104,109,102,121,69,113,116,108,120}), n())
		local chatLogHost = Instance.new(_Vzd({107,151,134,146,138}))
		chatLogHost.LayoutOrder = n()
		chatLogHost.Size = UDim2.new(1, -6, 0, 200)
		chatLogHost.BackgroundColor3 = C.bg
		chatLogHost.BorderSizePixel = 0
		chatLogHost.ClipsDescendants = true
		chatLogHost.Parent = sc
		_Ve7cf4e7f5f(chatLogHost, 8)
		_Vb145617c1ba(chatLogHost, C.strokeSoft, 1)
		local chatLogSc = Instance.new(_Vzd({212,228,243,240,237,237,234,239,232,199,243,226,238,230}))
		chatLogSc.Size = UDim2.fromScale(1, 1)
		chatLogSc.BackgroundTransparency = 1
		chatLogSc.ScrollBarThickness = 3
		chatLogSc.ScrollBarImageColor3 = C.accent
		chatLogSc.AutomaticCanvasSize = Enum.AutomaticSize.Y
		chatLogSc.CanvasSize = UDim2.new()
		chatLogSc.Parent = chatLogHost
		local chatLogLay = Instance.new(_Vzd({214,202,205,234,244,245,205,226,250,240,246,245}))
		chatLogLay.Padding = UDim.new(0, 3)
		chatLogLay.Parent = chatLogSc
		pad(chatLogSc, 4, 4, 4, 4)
		S.chatLogFrame = chatLogSc
		local function addChatLog(player, message, translation)
			if not S.chatLogFrame then return end
			local row = Instance.new(_Vzd({213,230,249,245,205,226,227,230,237}))
			row.Size = UDim2.new(1, -4, 0, translation and 32 or 20)
			row.BackgroundColor3 = C.card
			row.BackgroundTransparency = 0.5
			row.BorderSizePixel = 0
			row.Font = Enum.Font.Gotham
			row.TextSize = 10
			row.TextColor3 = C.text
			row.TextXAlignment = Enum.TextXAlignment.Left
			row.TextWrapped = true
			local txt = _Vzd({161,220}) .. tostring(player or "?") .. _Vzd({222,161}) .. tostring(message or "")
			if translation then
				txt = txt .. "\n  > " .. tostring(translation)
				row.TextColor3 = C.accent
			end
			row.Text = txt
			row.ZIndex = 2
			row.Parent = S.chatLogFrame
			_Ve7cf4e7f5f(row, 4)
		end
		local function transConnect(plr)
			if plr == LP then return end
			plr.Chatted:Connect(function(msg)
				addChatLog(plr.Name, msg)
				if not S.toggles.autoTranslate then return end
				task.spawn(function()
					local srcLang = detectLang(msg)
					if srcLang == _Vzd({230,239}) then return end
					local targetCode = langCode(S.transLang or _Vzd({198,239,232,237,234,244,233}))
					if isSameLang(srcLang, targetCode) then return end
					local from = (srcLang == _Vzd({229,230,245,230,228,245})) and _Vzd({226,246,245,240}) or srcLang
					local translated = translateHttp(msg, from, targetCode)
					if translated and translated ~= msg then
						addChatLog(plr.Name .. _Vzd({161,220}) .. (S.transLang or _Vzd({198,207})) .. "]", translated)
						_V556c1dc412c(HUB_NAME, plr.Name .. _Vzd({187,161}) .. translated:sub(1, 80), 3)
					end
				end)
			end)
		end
		for _, plr in ipairs(Players:GetPlayers()) do transConnect(plr) end
		Players.PlayerAdded:Connect(function(plr) transConnect(plr) end)
		_Vc79d533d10e(sc, {
			order = n(), title = _Vzd({196,237,230,226,243,161,196,233,226,245,161,205,240,232}),
			callback = function()
				if S.chatLogFrame then
					for _, ch in ipairs(S.chatLogFrame:GetChildren()) do
						if ch:IsA(_Vzd({213,230,249,245,205,226,227,230,237})) then ch:Destroy() end
					end
				end
				_V556c1dc412c(HUB_NAME, _Vzd({104,141,134,153,69,145,148,140,69,136,145,138,134,151,138,137}), 1)
			end,
		})
end
_TAB_BUILDERS[_Vzd({244,240,246,239,229,244})] = function(sc, n)
		_Vbb4234fd160(sc, _Vzd({120,117,102,114,69,120,116,122,115,105,120}), n())
		local sndNote = Instance.new(_Vzd({213,230,249,245,205,226,227,230,237}))
		sndNote.LayoutOrder = n()
		sndNote.Size = UDim2.new(1, -6, 0, 48)
		sndNote.BackgroundColor3 = C.card
		sndNote.BorderSizePixel = 0
		sndNote.Font = Enum.Font.Gotham
		sndNote.TextSize = 11
		sndNote.TextColor3 = C.muted
		sndNote.TextWrapped = true
		sndNote.TextXAlignment = Enum.TextXAlignment.Left
		sndNote.Text = _Vzd({209,234,228,236,161,226,161,247,240,234,228,230,161,237,234,239,230,173,161,233,234,245,161,209,237,226,250,161,245,240,161,244,230,239,229,161,234,245,161,234,239,161,228,233,226,245,161,169,244,230,243,247,230,243,161,233,230,226,243,244,161,234,245,161,172,161,241,237,226,250,244,161,244,240,246,239,229,170,175,161,212,241,226,238,161,245,240,232,232,237,230,161,237,240,240,241,244,161,234,245,175})
		sndNote.Parent = sc
		_Ve7cf4e7f5f(sndNote, 8)
		pad(sndNote, 8, 8, 8, 8)
		local SOUND_TRIGGERS = {
			{ label = _Vzd({109,138,145,145,148}),     word = _Vzd({201,230,237,237,240}) },
			{ label = _Vzd({201,234}),        word = _Vzd({201,234}) },
			{ label = _Vzd({201,230,250}),       word = _Vzd({201,230,250}) },
			{ label = _Vzd({208,234}),        word = _Vzd({208,234}) },
			{ label = _Vzd({218,240}),        word = _Vzd({218,240}) },
			{ label = _Vzd({201,230,250,240}),      word = _Vzd({201,230,250,240}) },
			{ label = _Vzd({194,250,240}),       word = _Vzd({194,250,240}) },
			{ label = _Vzd({206,240,238,238,250}),     word = _Vzd({206,240,238,238,250}) },
			{ label = _Vzd({197,226,229,229,250}),     word = _Vzd({197,226,229,229,250}) },
			{ label = _Vzd({195,226,227,250}),      word = _Vzd({195,226,227,250}) },
			{ label = _Vzd({214,248,214}),       word = _Vzd({214,248,214}) },
			{ label = _Vzd({208,248,208}),       word = _Vzd({208,248,208}) },
			{ label = _Vzd({187,170}),        word = _Vzd({187,170}) },
			{ label = _Vzd({187,197}),        word = _Vzd({187,197}) },
			{ label = _Vzd({201,240,240,243,226,250}),    word = _Vzd({201,240,240,243,226,250}) },
			{ label = _Vzd({218,226,250}),       word = _Vzd({218,226,250}) },
			{ label = _Vzd({216,230,230,230}),      word = _Vzd({216,230,230,230}) },
			{ label = _Vzd({199,246,239}),       word = _Vzd({199,246,239}) },
			{ label = _Vzd({206,240,246,239,245,226,234,239}),  word = _Vzd({206,240,246,239,245,226,234,239}) },
			{ label = _Vzd({218,240,229,230,237}),     word = _Vzd({218,240,229,230,237}) },
			{ label = _Vzd({218,240,229,230,237,234,239,232}),  word = _Vzd({218,240,229,230,237,234,239,232}) },
			{ label = _Vzd({212,234,239,232}),      word = _Vzd({212,234,239,232}) },
			{ label = _Vzd({208,240,231}),       word = _Vzd({208,240,231}) },
			{ label = _Vzd({208,246,228,233}),      word = _Vzd({208,246,228,233}) },
			{ label = _Vzd({197,230,226,229}),      word = _Vzd({197,230,226,229}) },
			{ label = _Vzd({197,230,229}),       word = _Vzd({197,230,229}) },
			{ label = _Vzd({204,234,237,237}),      word = _Vzd({204,234,237,237}) },
			{ label = _Vzd({208,248}),        word = _Vzd({208,248}) },
			{ label = _Vzd({208,240,241,244}),      word = _Vzd({208,240,241,244}) },
			{ label = _Vzd({208,240,241}),       word = _Vzd({208,240,241}) },
			{ label = _Vzd({195,243,246,233}),      word = _Vzd({195,243,246,233}) },
			{ label = _Vzd({205,240,237}),       word = _Vzd({205,240,237}) },
			{ label = _Vzd({207,240,240,227}),      word = _Vzd({207,240,240,227}) },
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
		local _, sndDrop = _V966b09a310f(sc, {
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
		_Vc79d533d10e(sc, {
			order = n(),
			title = _Vzd({117,145,134,158,69,120,148,154,147,137}),
			callback = function()
				local word = getSelectedWord()
				_Va5c822b81fc(word)
				_V556c1dc412c(HUB_NAME, _Vzd({209,237,226,250,230,229,187,161}) .. word, 1)
			end,
		})
		_Ve133dbec114(sc, {
			order = n(),
			id = _Vzd({244,241,226,238,212,240,246,239,229,244}),
			title = _Vzd({120,149,134,146,69,120,148,154,147,137,69,113,148,148,149}),
			tip = _Vzd({204,230,230,241,244,161,244,230,239,229,234,239,232,161,245,233,230,161,245,243,234,232,232,230,243,161,248,240,243,229,161,234,239,161,228,233,226,245}),
			callback = function(on)
				S.toggles.spamSounds = on
				if on then
					task.spawn(function()
						while S.toggles.spamSounds do
							local word = getSelectedWord()
							_V24fc840a1fd(word)
							local spd = (S.sliderVal and S.sliderVal.spamSoundSpeed) or 1.5
							task.wait(spd)
						end
					end)
				end
			end,
		})
		_Ve79e7f32113(sc, {
			order = n(),
			id = _Vzd({244,241,226,238,212,240,246,239,229,212,241,230,230,229}),
			title = _Vzd({120,149,134,146,69,120,149,138,138,137,69,77,152,138,136,78}),
			min = 0.5,
			max = 5,
			default = S.sliderVal and S.sliderVal.spamSoundSpeed or 1.5,
			callback = function(v)
				S.sliderVal = S.sliderVal or {}
				S.sliderVal.spamSoundSpeed = v
			end,
		})
		_Vbb4234fd160(sc, _Vzd({118,122,110,104,112,69,117,113,102,126}), n())
		local quickSounds = { _Vzd({206,240,238,238,250}), _Vzd({197,226,229,229,250}), _Vzd({208,240,231}), _Vzd({204,234,237,237}), _Vzd({218,226,250}), _Vzd({214,248,214}), _Vzd({201,230,237,237,240}), _Vzd({194,250,240}), _Vzd({195,243,246,233}), _Vzd({205,240,237}), _Vzd({207,240,240,227}) }
		for _, name in ipairs(quickSounds) do
			_Vc79d533d10e(sc, {
				order = n(),
				title = name,
				callback = function()
					for _, t in ipairs(SOUND_TRIGGERS) do
						if t.label == name then
							_Va5c822b81fc(t.word)
							_V556c1dc412c(HUB_NAME, _Vzd({209,237,226,250,230,229,187,161}) .. name, 0.8)
							break
						end
					end
				end,
			})
		end
end
_TAB_BUILDERS[_Vzd({231,246,239})] = function(sc, n)
		_Vbb4234fd160(sc, _Vzd({104,116,115,121,119,116,113,69,117,113,102,126,106,119}), n())
		local ctrlNote = Instance.new(_Vzd({213,230,249,245,205,226,227,230,237}))
		ctrlNote.LayoutOrder = n()
		ctrlNote.Size = UDim2.new(1, -6, 0, 36)
		ctrlNote.BackgroundColor3 = C.card
		ctrlNote.BorderSizePixel = 0
		ctrlNote.Font = Enum.Font.Gotham
		ctrlNote.TextSize = 11
		ctrlNote.TextColor3 = C.muted
		ctrlNote.TextXAlignment = Enum.TextXAlignment.Left
		ctrlNote.TextWrapped = true
		ctrlNote.Text = _Vzd({69,113,148,148,144,69,80,69,98,69,161,69,124,102,120,105,69,161,69,103,145,148,135,146,134,147,95,69,120,149,134,136,138,84,104,153,151,145,69,139,145,158,69,161,69,98,69,137,151,148,149})
		ctrlNote.Parent = sc
		_Ve7cf4e7f5f(ctrlNote, 8)
		pad(ctrlNote, 8, 8, 8, 8)
		S.playerDropdowns = S.playerDropdowns or {}
		S._funControlSearchRefresh = _V19a46d3f111(sc, {
			clickFn = function(p) S.controlPick = p; S.selected = p end,
		}, n)
		_Vc79d533d10e(sc, {
			order = n(),
			title = _Vzd({119,138,139,151,138,152,141,69,117,145,134,158,138,151,152}),
			callback = function()
				if S._funControlSearchRefresh then S._funControlSearchRefresh() end
				local nPl = #_V240e7cb9138()
				_V556c1dc412c(HUB_NAME, nPl .. _Vzd({69,149,145,134,158,138,151}) .. (nPl == 1 and "" or "s"), 1)
			end,
		})
		_Vc79d533d10e(sc, {
			order = n(),
			title = _Vzd({196,240,239,245,243,240,237,161,212,230,237,230,228,245,230,229}),
			callback = function() _Vabc125a75c() end,
		})
		if S.toggles.controlBindC == nil then S.toggles.controlBindC = false end
		_Ve133dbec114(sc, {
			order = n(),
			id = _Vzd({228,240,239,245,243,240,237,195,234,239,229,196}),
			title = _Vzd({190,161,204,230,250,161,253,161,205,240,240,236,161,196,240,239,245,243,240,237}),
			tip = _Vzd({211,226,250,161,231,243,240,238,161,228,226,238,230,243,226,175,161,209,237,226,250,230,243,244,161,172,161,195,237,240,227,238,226,239,161,207,209,196,244,175}),
			callback = function(on)
				_Vd3e2addedc(on)
			end,
		})
		_Vc79d533d10e(sc, {
			order = n(),
			title = _Vzd({196,240,239,245,243,240,237,161,205,240,240,236,161,213,226,243,232,230,245}),
			callback = function() _Vb7967b4657() end,
		})
		_Vc79d533d10e(sc, {
			order = n(),
			title = _Vzd({196,240,239,245,243,240,237,161,207,230,226,243,230,244,245}),
			callback = function()
				local p = _Vd9660b82129(1e9)
				if not p or not p.Character then
					_V556c1dc412c(HUB_NAME, _Vzd({207,240,227,240,229,250}), 1)
					return
				end
				S.selected = p
				S.controlPick = p
				if S._funControlSearchRefresh then pcall(S._funControlSearchRefresh) end
				_V396a943419e(p.Character)
			end,
		})
		_Vc79d533d10e(sc, {
			order = n(),
			title = _Vzd({196,240,239,245,243,240,237,161,207,209,196}),
			tip = _Vzd({105,138,136,148,158,69,84,69,151,148,135,145,148,157,142,134,147,69,84,69,136,151,138,134,153,154,151,138,152,69,77,103,145,148,135,146,134,147,69,153,148,148,145,152,69,134,151,138,69,148,147,69,103,145,148,135,146,134,147,69,153,134,135,78}),
			callback = function() _Va14c2ad758() end,
		})
		_Vc79d533d10e(sc, {
			order = n(),
			title = _Vzd({120,153,148,149,69,104,148,147,153,151,148,145}),
			danger = true,
			callback = function() _V5edd98521ad() end,
		})
		_Vbb4234fd160(sc, _Vzd({109,116,113,105,69,161,69,106,102,121,69,84,69,110,115,120,121,119,122,114,106,115,121,120}), n())
		local holdNote = Instance.new(_Vzd({121,138,157,153,113,134,135,138,145}))
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
		holdNote.Text = " Auto-equip and use food (eat all) or instruments (play all).\n Spawn -> WaitForChild(HoldPart) -> Hold -> Use.\n SprayCan is touch-based (use Paint _Vbb4234fd160 below)."
		holdNote.Parent = sc
		_Ve7cf4e7f5f(holdNote, 8)
		pad(holdNote, 6, 6, 6, 6)
		local HOLD_ITEMS = {
			_Vzd({199,240,240,229,195,226,239,226,239,226}), _Vzd({107,148,148,137,103,151,138,134,137}),
			_Vzd({110,147,152,153,151,154,146,138,147,153,105,151,154,146,120,147,134,151,138}), _Vzd({202,239,244,245,243,246,238,230,239,245,200,246,234,245,226,243}), _Vzd({202,239,244,245,243,246,238,230,239,245,209,234,226,239,240}),
		}
		_V966b09a310f(sc, {
			order = n(),
			title = _Vzd({110,153,138,146,69,153,148,69,109,148,145,137}),
			options = HOLD_ITEMS,
			default = S.holdItem or HOLD_ITEMS[1],
			callback = function(v) S.holdItem = v end,
		})
		local function doHoldAndUse(itemName)
			local me = hrp()
			if not me then _V556c1dc412c(HUB_NAME, _Vzd({207,240,161,228,233,226,243,226,228,245,230,243}), 1.5) return false end
			local char = LP.Character
			if not char then return false end
			local myFolder = workspace:FindFirstChild(LP.Name .. _Vzd({212,241,226,248,239,230,229,202,239,213,240,250,244}))
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
			if not model then _V556c1dc412c(HUB_NAME, _Vzd({107,134,142,145,138,137,69,153,148,69,152,149,134,156,147,69}) .. itemName, 1.5) return false end
			local holdPart = model:FindFirstChild(_Vzd({201,240,237,229,209,226,243,245}))
			if not holdPart then
				holdPart = model:WaitForChild(_Vzd({201,240,237,229,209,226,243,245}), 3)
			end
			if not holdPart then _V556c1dc412c(HUB_NAME, _Vzd({115,148,69,109,148,145,137,117,134,151,153,69,148,147,69}) .. itemName, 1.5) return false end
			local holdRF = holdPart:FindFirstChild(_Vzd({201,240,237,229,202,245,230,238,211,230,238,240,245,230,199,246,239,228,245,234,240,239}))
			if not holdRF then
				holdRF = holdPart:WaitForChild(_Vzd({201,240,237,229,202,245,230,238,211,230,238,240,245,230,199,246,239,228,245,234,240,239}), 3)
			end
			local rigid = holdPart:FindFirstChild(_Vzd({211,234,232,234,229,196,240,239,244,245,243,226,234,239,245}))
			local isHeld = false
			if rigid and rigid:FindFirstChild(_Vzd({194,245,245,226,228,233,238,230,239,245,178})) then
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
					if rigid and rigid:FindFirstChild(_Vzd({194,245,245,226,228,233,238,230,239,245,178})) then
						local att2 = rigid.Attachment1
						if att2 and att2:IsDescendantOf(char) then
							isHeld = true
							break
						end
					end
					task.wait(0.1)
				end
			end
			if not isHeld then _V556c1dc412c(HUB_NAME, _Vzd({107,134,142,145,138,137,69,153,148,69,141,148,145,137,69}) .. itemName, 1.5) return false end
			local eatingSound = holdPart:FindFirstChild(_Vzd({106,134,153,142,147,140,120,148,154,147,137}))
			local canUse = true
			if eatingSound and eatingSound.IsPlaying then
				canUse = false
			end
			if canUse then
				local he = ReplicatedStorage:FindFirstChild(_Vzd({201,240,237,229,198,247,230,239,245,244}))
				local useEvt = he and he:FindFirstChild(_Vzd({214,244,230}))
				if useEvt then
					pcall(function() useEvt:FireServer(model) end)
					task.wait(0.5)
				end
			end
			return true
		end
		_Vc79d533d10e(sc, {
			order = n(),
			title = _Vzd({201,240,237,229,161,172,161,214,244,230,161,202,245,230,238}),
			tip = _Vzd({120,149,134,156,147,69,82,99,69,109,148,145,137,69,82,99,69,122,152,138,69,153,141,138,69,152,138,145,138,136,153,138,137,69,142,153,138,146,69,77,139,154,145,145,69,152,153,134,153,138,69,136,141,138,136,144,78}),
			callback = function()
				local item = S.holdItem or _Vzd({199,240,240,229,195,226,239,226,239,226})
				local ok = doHoldAndUse(item)
				if ok then _V556c1dc412c(HUB_NAME, _Vzd({122,152,138,137,69}) .. item, 1) end
			end,
		})
		_Vc79d533d10e(sc, {
			order = n(),
			title = _Vzd({106,134,153,69,102,145,145,69,107,148,148,137}),
			tip = _Vzd({120,149,134,156,147,152,69,107,148,148,137,103,134,147,134,147,134,69,80,69,107,148,148,137,103,151,138,134,137,81,69,141,148,145,137,152,69,138,134,136,141,81,69,138,134,153,152,69,153,141,138,146}),
			callback = function()
				local foods = { _Vzd({199,240,240,229,195,226,239,226,239,226}), _Vzd({199,240,240,229,195,243,230,226,229}) }
				for _, food in ipairs(foods) do
					local ok = doHoldAndUse(food)
					if ok then task.wait(1) end
				end
				_V556c1dc412c(HUB_NAME, _Vzd({194,245,230,161,226,237,237,161,231,240,240,229}), 1)
			end,
		})
		_Vc79d533d10e(sc, {
			order = n(),
			title = _Vzd({214,244,230,161,194,237,237,161,202,239,244,245,243,246,238,230,239,245,244}),
			tip = _Vzd({120,149,134,156,147,152,69,138,134,136,141,69,142,147,152,153,151,154,146,138,147,153,81,69,141,148,145,137,152,69,142,153,81,69,149,145,134,158,152,69,142,153}),
			callback = function()
				local insts = { _Vzd({202,239,244,245,243,246,238,230,239,245,197,243,246,238,212,239,226,243,230}), _Vzd({202,239,244,245,243,246,238,230,239,245,200,246,234,245,226,243}), _Vzd({202,239,244,245,243,246,238,230,239,245,209,234,226,239,240}) }
				for _, inst in ipairs(insts) do
					local ok = doHoldAndUse(inst)
					if ok then task.wait(1) end
				end
				_V556c1dc412c(HUB_NAME, _Vzd({117,145,134,158,138,137,69,134,145,145,69,142,147,152,153,151,154,146,138,147,153,152}), 1)
			end,
		})
		_Vbb4234fd160(sc, _Vzd({212,209,211,194,218,161,209,194,202,207,213}), n())
		local paintNote = Instance.new(_Vzd({213,230,249,245,205,226,227,230,237}))
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
		paintNote.Text = " SprayCanWD is touch-based - uses firetouchinterest, not HoldPart.\n Spawn can -> touch target with StickyRemoverPart -> delete."
		paintNote.Parent = sc
		_Ve7cf4e7f5f(paintNote, 8)
		pad(paintNote, 6, 6, 6, 6)
		_Vc79d533d10e(sc, {
			order = n(),
			title = _Vzd({120,149,151,134,158,69,117,134,142,147,153,69,121,134,151,140,138,153}),
			tip = _Vzd({212,241,226,248,239,161,212,241,243,226,250,196,226,239,216,197,173,161,231,234,243,230,245,240,246,228,233,234,239,245,230,243,230,244,245,161,240,239,161,245,226,243,232,230,245}),
			callback = function()
				local p = S.selected
				if not p or not _Vd6eb72811f9(p) or not p.Character then
					_V556c1dc412c(HUB_NAME, _Vzd({209,234,228,236,161,226,161,241,237,226,250,230,243,161,231,234,243,244,245}), 1.2) return
				end
				local me = hrp()
				if not me then return end
				local r = _Vb2220e5a155(p)
				if not r then return end
				pcall(function() if FTAP.BuyToy then FTAP.BuyToy:InvokeServer(_Vzd({212,241,243,226,250,196,226,239,216,197})) end end)
				task.wait(0.3)
				pcall(function()
					if FTAP.SpawnToy then
						FTAP.SpawnToy:InvokeServer(_Vzd({212,241,243,226,250,196,226,239,216,197}), me.CFrame * CFrame.new(0, 3, -3), Vector3.zero)
					end
				end)
				task.wait(0.5)
				pcall(function()
					local myFolder = workspace:FindFirstChild(LP.Name .. _Vzd({212,241,226,248,239,230,229,202,239,213,240,250,244}))
					local can = myFolder and myFolder:FindFirstChild(_Vzd({212,241,243,226,250,196,226,239,216,197}))
					if not can then can = workspace:FindFirstChild(_Vzd({212,241,243,226,250,196,226,239,216,197}), true) end
					if can then
						local sticky = can:FindFirstChild(_Vzd({212,245,234,228,236,250,211,230,238,240,247,230,243,209,226,243,245}))
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
				_V556c1dc412c(HUB_NAME, _Vzd({212,241,243,226,250,161,241,226,234,239,245,161,231,234,243,230,229}), 1)
			end,
		})
		_Ve133dbec114(sc, {
			order = n(), id = _Vzd({145,148,148,149,117,134,142,147,153}), title = _Vzd({113,148,148,149,69,120,149,151,134,158,69,117,134,142,147,153}),
			tip = _Vzd({104,148,147,153,142,147,154,148,154,152,145,158,69,152,149,134,156,147,69,80,69,152,149,151,134,158,69,148,147,69,152,138,145,138,136,153,138,137,69,153,134,151,140,138,153}),
			callback = function(on)
				S.toggles.loopPaint = on
				if on then
					task.spawn(function()
						_V556c1dc412c(HUB_NAME, _Vzd({205,240,240,241,161,241,226,234,239,245,161,208,207}), 1.5)
						while S.toggles.loopPaint do
							local p = S.selected
							if p and _Vd6eb72811f9(p) and p.Character then
								local me = hrp()
								local r = _Vb2220e5a155(p)
								if me and r then
									pcall(function() if FTAP.BuyToy then FTAP.BuyToy:InvokeServer(_Vzd({212,241,243,226,250,196,226,239,216,197})) end end)
									task.wait(0.2)
									pcall(function()
										if FTAP.SpawnToy then
											FTAP.SpawnToy:InvokeServer(_Vzd({212,241,243,226,250,196,226,239,216,197}), me.CFrame * CFrame.new(0, 3, -3), Vector3.zero)
										end
									end)
									task.wait(0.5)
									pcall(function()
										local myFolder = workspace:FindFirstChild(LP.Name .. _Vzd({212,241,226,248,239,230,229,202,239,213,240,250,244}))
										local can = myFolder and myFolder:FindFirstChild(_Vzd({212,241,243,226,250,196,226,239,216,197}))
										if not can then can = workspace:FindFirstChild(_Vzd({212,241,243,226,250,196,226,239,216,197}), true) end
										if can then
											local sticky = can:FindFirstChild(_Vzd({212,245,234,228,236,250,211,230,238,240,247,230,243,209,226,243,245}))
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
						_V556c1dc412c(HUB_NAME, _Vzd({205,240,240,241,161,241,226,234,239,245,161,208,199,199}), 1)
					end)
				end
			end,
		})
		_Vbb4234fd160(sc, _Vzd({102,122,121,116,69,103,119,106,102,112,69,117,113,116,121}), n())
		local breakNote = Instance.new(_Vzd({121,138,157,153,113,134,135,138,145}))
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
		_Ve7cf4e7f5f(breakNote, 8)
		pad(breakNote, 6, 6, 6, 6)
		_Ve79e7f32113(sc, {
			order = n(), title = _Vzd({195,243,230,226,236,161,211,226,245,230,161,169,244,230,228,170}), min = 0.3, max = 3, default = 0.8, step = 0.1,
			stateKey = _Vzd({227,243,230,226,236,211,226,245,230}),
			tip = _Vzd({120,138,136,148,147,137,152,69,135,138,153,156,138,138,147,69,138,134,136,141,69,135,148,146,135,69,137,151,148,149}),
		})
		_Ve133dbec114(sc, {
			order = n(), id = _Vzd({226,246,245,240,195,243,230,226,236,209,237,240,245}), title = _Vzd({194,246,245,240,161,195,243,230,226,236,161,209,237,240,245}),
			tip = _Vzd({105,151,148,149,69,146,142,152,152,142,145,138,152,84,135,148,146,135,152,69,148,147,69,152,138,145,138,136,153,138,137,69,149,145,134,158,138,151,76,152,69,149,145,148,153,69,134,151,138,134,69,161,69,145,148,148,149,152}),
			callback = function(on)
				S.toggles.autoBreakPlot = on
				if on then
					task.spawn(function()
						_V556c1dc412c(HUB_NAME, _Vzd({195,243,230,226,236,161,209,237,240,245,161,208,207}), 1.5)
						while S.toggles.autoBreakPlot do
							local p = S.selected
							if p and _Vd6eb72811f9(p) and p.Character then
								local r = _Vb2220e5a155(p)
								if r then
									pcall(function()
										if FTAP.BuyToy then FTAP.BuyToy:InvokeServer(_Vzd({195,240,238,227,206,234,244,244,234,237,230})) end
										if FTAP.SpawnToy then
											for i = 1, 3 do
												local offset = CFrame.new(math.random(-8, 8), 5, math.random(-8, 8))
												FTAP.SpawnToy:InvokeServer(_Vzd({195,240,238,227,206,234,244,244,234,237,230}), r.CFrame * offset, Vector3.zero)
											end
										end
									end)
									task.wait(0.2)
									pcall(function()
										local be = ReplicatedStorage:FindFirstChild(_Vzd({195,240,238,227,198,247,230,239,245,244}))
										if be and be:FindFirstChild(_Vzd({195,240,238,227,198,249,241,237,240,229,230})) then
											for _, obj in ipairs(workspace:GetDescendants()) do
												if obj.Name == _Vzd({195,240,238,227,206,234,244,244,234,237,230}) or obj.Name == _Vzd({206,234,244,244,234,237,230}) then
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
						_V556c1dc412c(HUB_NAME, _Vzd({195,243,230,226,236,161,209,237,240,245,161,208,199,199}), 1)
					end)
				end
			end,
		})
		_Vbb4234fd160(sc, _Vzd({212,209,194,211,204,205,198,211,212}), n())
		local sparkNote = Instance.new(_Vzd({213,230,249,245,205,226,227,230,237}))
		sparkNote.LayoutOrder = n()
		sparkNote.Size = UDim2.new(1, -6, 0, 56)
		sparkNote.BackgroundColor3 = C.card
		sparkNote.BorderSizePixel = 0
		sparkNote.Font = Enum.Font.Gotham
		sparkNote.TextSize = 10
		sparkNote.TextColor3 = C.muted
		sparkNote.TextXAlignment = Enum.TextXAlignment.Left
		sparkNote.TextYAlignment = Enum.TextYAlignment.Top
		sparkNote.TextWrapped = true
		sparkNote.Text = " Server toys around a target (everyone sees them).\n Burst = one-shot shape | Aura = toys follow + spin (Blitz style).\n Use Self for on YOU | pick a player for them."
		sparkNote.Parent = sc
		_Ve7cf4e7f5f(sparkNote, 8)
		pad(sparkNote, 6, 6, 6, 6)
		_Ve133dbec114(sc, {
			order = n(), id = _Vzd({244,241,226,243,236,213,226,243,232,230,245,212,230,237,231}), title = _Vzd({120,149,134,151,144,69,148,147,69,120,138,145,139}),
			tip = _Vzd({124,141,138,147,69,116,115,81,69,135,154,151,152,153,84,134,154,151,134,69,154,152,138,152,69,126,116,122,69,142,147,152,153,138,134,137,69,148,139,69,153,141,138,69,149,145,134,158,138,151,69,137,151,148,149,137,148,156,147}),
			callback = function(on)
				S.sparkTargetSelf = on == true
				S.toggles.sparkTargetSelf = on == true
			end,
		})
		local function sparkPlayerOptions()
			local opts = _V240e7cb9138()
			if #opts == 0 then opts = { _Vzd({239,240,227,240,229,250,161,240,239,237,234,239,230}) } end
			return opts
		end
		_V966b09a310f(sc, {
			order = n(),
			title = _Vzd({212,241,226,243,236,237,230,243,161,213,226,243,232,230,245}),
			options = sparkPlayerOptions(),
			default = (S.sparkTarget and _V466aec8e137(S.sparkTarget)) or sparkPlayerOptions()[1],
			callback = function(lab)
				local p = _Veeade0fa8a(lab)
				if p then S.sparkTarget = p end
			end,
		})
		local SPARK_SHAPES = { _Vzd({212,241,233,230,243,230}), _Vzd({211,234,239,232}), _Vzd({201,226,237,240}), _Vzd({199,240,246,239,245,226,234,239}), _Vzd({212,241,234,243,226,237}), _Vzd({196,240,239,230}), _Vzd({196,250,237,234,239,229,230,243}), _Vzd({209,237,226,239,230}) }
		S.sparkShape = S.sparkShape or _Vzd({212,241,233,230,243,230})
		_V966b09a310f(sc, {
			order = n(),
			title = _Vzd({120,141,134,149,138,69,84,69,117,134,153,153,138,151,147}),
			options = SPARK_SHAPES,
			default = S.sparkShape,
			callback = function(v) S.sparkShape = v end,
		})
		local SPARK_TOYS = {
			_Vzd({199,234,243,230,248,240,243,236}), _Vzd({195,240,238,227,195,226,237,237,240,240,239}), _Vzd({195,226,237,237,240,240,239}), _Vzd({195,226,237,237,212,239,240,248,227,226,237,237}), _Vzd({105,142,152,136,148,104,148,145,148,151,103,134,145,145}),
			_Vzd({195,246,227,227,237,230,195,237,240,248,230,243}), _Vzd({195,240,240,238,227,240,249}), _Vzd({195,230,237,237,212,238,226,237,237}), _Vzd({197,234,228,230,212,238,226,237,237}), _Vzd({196,226,239,229,250,196,240,243,239}),
		}
		S.sparkToyName = S.sparkToyName or _Vzd({199,234,243,230,248,240,243,236})
		_V966b09a310f(sc, {
			order = n(),
			title = _Vzd({213,240,250,161,245,240,161,212,241,226,248,239}),
			options = SPARK_TOYS,
			default = S.sparkToyName,
			tip = _Vzd({121,148,158,69,154,152,138,137,69,134,153,69,138,134,136,141,69,152,149,134,151,144,69,149,148,152,142,153,142,148,147,69,77,107,142,151,138,156,148,151,144,69,142,152,69,136,145,134,152,152,142,136,69,152,149,134,151,144,145,138,151,69,145,148,148,144,78}),
			callback = function(v) S.sparkToyName = v end,
		})
		_Ve79e7f32113(sc, {
			order = n(), title = _Vzd({194,238,240,246,239,245}), min = 4, max = 28, default = S.sparkAmount or 16, step = 1,
			tip = _Vzd({109,148,156,69,146,134,147,158,69,153,148,158,152,69,142,147,69,135,154,151,152,153,84,134,154,151,134,69,77,151,138,152,149,138,136,153,152,69,153,148,158,69,145,142,146,142,153,78}),
			callback = function(v) S.sparkAmount = v end,
		})
		_Ve79e7f32113(sc, {
			order = n(), title = _Vzd({211,226,229,234,246,244}), min = 2, max = 18, default = S.sparkRadius or 5, step = 0.5,
			tip = _Vzd({109,148,156,69,156,142,137,138,69,153,141,138,69,149,134,153,153,138,151,147,69,142,152,69,134,151,148,154,147,137,69,153,141,138,69,153,134,151,140,138,153}),
			callback = function(v) S.sparkRadius = v end,
		})
		_Ve79e7f32113(sc, {
			order = n(), title = _Vzd({201,230,234,232,233,245}), min = -5, max = 15, default = S.sparkHeight or 3, step = 0.5,
			tip = _Vzd({208,231,231,244,230,245,161,226,227,240,247,230,161,245,233,230,161,245,226,243,232,230,245}),
			callback = function(v) S.sparkHeight = v end,
		})
		_Ve79e7f32113(sc, {
			order = n(), title = _Vzd({120,149,142,147,69,120,149,138,138,137}), min = 0, max = 5, default = S.sparkSpin or 1.6, step = 0.1,
			tip = _Vzd({194,246,243,226,161,240,243,227,234,245,161,244,241,234,239,161,169,177,161,190,161,231,243,240,251,230,239,170}),
			callback = function(v) S.sparkSpin = v end,
		})
		_Ve79e7f32113(sc, {
			order = n(), title = _Vzd({195,246,243,244,245,161,205,234,231,230,245,234,238,230}), min = 2, max = 15, default = S.sparkLifetime or 6, step = 1,
			tip = _Vzd({120,138,136,148,147,137,152,69,135,138,139,148,151,138,69,135,154,151,152,153,69,153,148,158,152,69,134,154,153,148,82,137,138,145,138,153,138}),
			callback = function(v) S.sparkLifetime = v end,
		})
		_Vc79d533d10e(sc, {
			order = n(),
			title = _Vzd({196,243,230,226,245,230,161,212,241,226,243,236,237,230,243,161,195,246,243,244,245}),
			tip = _Vzd({208,239,230,174,244,233,240,245,161,244,233,226,241,230,161,240,231,161,245,240,250,244,161,226,243,240,246,239,229,161,245,226,243,232,230,245,161,169,226,237,237,161,241,240,234,239,245,244,161,244,241,226,248,239,161,99,1,21,161,231,234,249,230,229,170}),
			callback = function()
				task.spawn(_Vc30549a515b)
			end,
		})
		_Ve133dbec114(sc, {
			order = n(), id = _Vzd({244,241,226,243,236,194,246,243,226}), title = _Vzd({120,149,134,151,144,145,138,151,69,102,154,151,134,69,77,107,148,145,145,148,156,78}),
			tip = _Vzd({212,241,226,248,239,161,245,240,250,244,161,240,239,228,230,173,161,245,233,230,250,161,231,240,237,237,240,248,161,245,226,243,232,230,245,161,226,239,229,161,244,241,234,239,161,169,239,240,245,161,244,241,226,238,174,244,241,226,248,239,170}),
			callback = function(on)
				if on then
					task.spawn(_V357629081a6)
				else
					_V10469a8d1b5(false)
				end
			end,
		})
		_Ve133dbec114(sc, {
			order = n(), id = _Vzd({244,241,226,243,236,237,230,243,205,240,240,241}), title = _Vzd({120,149,134,151,144,145,138,151,69,103,154,151,152,153,69,113,148,148,149}),
			tip = _Vzd({211,230,241,230,226,245,161,227,246,243,244,245,161,226,243,240,246,239,229,161,245,226,243,232,230,245,161,230,247,230,243,250,161,255,178,175,179,244,161,169,246,244,230,244,161,238,240,243,230,161,245,240,250,161,244,237,240,245,244,170}),
			callback = function(on)
				S.toggles.sparklerLoop = on == true
				if on then
					task.spawn(function()
						while S.toggles.sparklerLoop do
							_Vc30549a515b()
							task.wait(1.25)
						end
					end)
				end
			end,
		})
		_Vc79d533d10e(sc, {
			order = n(),
			title = _Vzd({196,237,230,226,243,161,212,241,226,243,236,237,230,243,244}),
			danger = true,
			tip = _Vzd({212,245,240,241,161,226,246,243,226,176,237,240,240,241,161,226,239,229,161,229,230,244,245,243,240,250,161,245,243,226,228,236,230,229,161,244,241,226,243,236,161,245,240,250,244}),
			callback = function()
				S.toggles.sparklerLoop = false
				_V10469a8d1b5(true)
				_V556c1dc412c(HUB_NAME, _Vzd({212,241,226,243,236,237,230,243,244,161,228,237,230,226,243,230,229}), 1.2)
			end,
		})
		_Vbb4234fd160(sc, _Vzd({216,202,207,200,212}), n())
		local wingNote = Instance.new(_Vzd({213,230,249,245,205,226,227,230,237}))
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
		wingNote.Text = " Spawn server-sided wings made from pallets (visible to everyone).\n Uses the form system | flap animation built in.\n Click 'Spawn Wings_Vzd({161,245,240,161,228,243,230,226,245,230,161,253,161})Remove Wings' to clean up."
		wingNote.Parent = sc
		_Ve7cf4e7f5f(wingNote, 8)
		pad(wingNote, 6, 6, 6, 6)
		_Vc79d533d10e(sc, {
			order = n(),
			title = _Vzd({212,241,226,248,239,161,216,234,239,232,244}),
			tip = _Vzd({120,149,134,156,147,69,152,138,151,155,138,151,82,152,142,137,138,137,69,156,142,147,140,152,69,139,151,148,146,69,149,134,145,145,138,153,152,69,77,155,142,152,142,135,145,138,69,153,148,69,134,145,145,78}),
			callback = function()
				if S.formBuilding then _V556c1dc412c(HUB_NAME, _Vzd({194,237,243,230,226,229,250,161,227,246,234,237,229,234,239,232,161,231,240,243,238,175,175,175}), 1.5) return end
				_V60fd70b84d(true)
				local offsets = _Ve8aebfa4a7()
				_V87564428196(_Vzd({117,134,145,145,138,153,113,142,140,141,153,103,151,148,156,147}), offsets, nil, {
					label = _Vzd({216,234,239,232,244}),
					keep = true,
					silent = true,
				})
				_V556c1dc412c(HUB_NAME, _Vzd({216,234,239,232,244,161,244,241,226,248,239,230,229,161,169,244,230,243,247,230,243,174,244,234,229,230,229,161,241,226,237,237,230,245,244,170}), 1.5)
			end,
		})
		_Vc79d533d10e(sc, {
			order = n(),
			title = _Vzd({211,230,238,240,247,230,161,216,234,239,232,244}),
			danger = true,
			tip = _Vzd({197,230,244,245,243,240,250,161,250,240,246,243,161,248,234,239,232,161,241,226,237,237,230,245,244}),
			callback = function()
				_V60fd70b84d(true)
				S.formWearPieces = {}
				_V556c1dc412c(HUB_NAME, _Vzd({216,234,239,232,244,161,243,230,238,240,247,230,229}), 1)
			end,
		})
		_Vbb4234fd160(sc, _Vzd({107,116,119,104,106,69,102,115,110,114,102,121,110,116,115,120}), n())
		local animNote = Instance.new(_Vzd({213,230,249,245,205,226,227,230,237}))
		animNote.LayoutOrder = n()
		animNote.Size = UDim2.new(1, -6, 0, 36)
		animNote.BackgroundColor3 = C.card
		animNote.BorderSizePixel = 0
		animNote.Font = Enum.Font.Gotham
		animNote.TextSize = 11
		animNote.TextColor3 = C.muted
		animNote.TextWrapped = true
		animNote.TextXAlignment = Enum.TextXAlignment.Left
		animNote.Text = _Vzd({161,199,240,243,228,230,161,226,239,234,238,226,245,234,240,239,244,161,240,239,161,226,161,244,230,237,230,228,245,230,229,161,241,237,226,250,230,243,175,161,209,234,228,236,161,226,239,234,238,226,245,234,240,239,161,172,161,245,226,243,232,230,245,173,161,233,234,245,161,209,237,226,250,175})
		animNote.Parent = sc
		_Ve7cf4e7f5f(animNote, 8)
		pad(animNote, 8, 8, 8, 8)
		local ANIMS = {
			{ label = _Vzd({213,250,241,234,239,232}),        id = _Vzd({213,250,241,234,239,232}) },
			{ label = _Vzd({199,237,226,234,237}),         id = _Vzd({199,237,226,234,237}) },
			{ label = _Vzd({216,226,247,230}),          asset = "rbxassetid://180436334" },
			{ label = _Vzd({205,226,246,232,233}),         asset = "rbxassetid://180436148" },
			{ label = _Vzd({196,233,230,230,243}),         asset = "rbxassetid://180436060" },
			{ label = _Vzd({197,226,239,228,230}),         asset = "rbxassetid://180435792" },
			{ label = _Vzd({197,226,239,228,230,179}),        asset = "rbxassetid://180435792" },
			{ label = _Vzd({197,226,239,228,230,180}),        asset = "rbxassetid://180435792" },
			{ label = _Vzd({200,230,244,245,246,243,230}),       asset = "rbxassetid://180435571" },
			{ label = _Vzd({117,148,142,147,153}),         asset = "rbxassetid://180435571" },
			{ label = _Vzd({211,226,239,236}),          asset = "rbxassetid://180435571" },
			{ label = _Vzd({212,226,237,246,245,230}),        asset = "rbxassetid://180435571" },
			{ label = _Vzd({212,234,245}),           asset = "rbxassetid://2506281703" },
			{ label = _Vzd({212,245,246,239}),          asset = "rbxassetid://180435571" },
			{ label = _Vzd({199,226,237,237}),          asset = "rbxassetid://180436148" },
			{ label = _Vzd({200,230,245,214,241}),         asset = "rbxassetid://180436148" },
		}
		local animLabels = {}
		for _, a in ipairs(ANIMS) do
			table.insert(animLabels, a.label)
		end
		S.selectedAnim = S.selectedAnim or animLabels[1]
		_V966b09a310f(sc, {
			order = n(),
			title = _Vzd({194,239,234,238,226,245,234,240,239}),
			options = animLabels,
			default = S.selectedAnim or animLabels[1],
			callback = function(lab) S.selectedAnim = lab end,
		})
		_V19a46d3f111(sc, {
			clickFn = function(p) S.animTarget = p end,
		}, n)
		local function getAnimAsset()
			for _, a in ipairs(ANIMS) do
				if a.label == S.selectedAnim then
					if a.id then
						local ok, anim = pcall(function()
							local rf = game:GetService(_Vzd({211,230,241,237,234,228,226,245,230,229,199,234,243,244,245}))
							for _, v in ipairs(rf:GetDescendants()) do
								if v:IsA(_Vzd({194,239,234,238,226,245,234,240,239})) and v.Name == a.id then return v end
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
		_Vc79d533d10e(sc, {
			order = n(),
			title = _Vzd({209,237,226,250,161,194,239,234,238,226,245,234,240,239}),
			callback = function()
				local p = S.animTarget
				if not p or not _Vd6eb72811f9(p) or not p.Character then
					_V556c1dc412c(HUB_NAME, _Vzd({209,234,228,236,161,194,161,209,237,226,250,230,243,161,199,234,243,244,245}), 1.2)
					return
				end
				local hum = p.Character:FindFirstChildOfClass(_Vzd({201,246,238,226,239,240,234,229}))
				local animator = hum and hum:FindFirstChildOfClass(_Vzd({194,239,234,238,226,245,240,243}))
				if not animator then
					_V556c1dc412c(HUB_NAME, _Vzd({207,240,161,194,239,234,238,226,245,240,243,161,199,240,246,239,229}), 1.2)
					return
				end
				local assetId = getAnimAsset()
				local ok, anim = pcall(function() return Instance.new(_Vzd({194,239,234,238,226,245,234,240,239})) end)
				if not ok or not anim then return end
				anim.AnimationId = assetId
				local ok2, track = pcall(function() return animator:LoadAnimation(anim) end)
				if ok2 and track then
					track:Play()
					_V556c1dc412c(HUB_NAME, _Vzd({117,145,134,158,142,147,140,69}) .. (S.selectedAnim or _Vzd({226,239,234,238})) .. _Vzd({161,240,239,161}) .. p.Name, 1)
				else
					_V556c1dc412c(HUB_NAME, _Vzd({199,226,234,237,230,229,161,213,240,161,205,240,226,229,161,194,239,234,238,226,245,234,240,239}), 1.2)
				end
			end,
		})
		_Vc79d533d10e(sc, {
			order = n(),
			title = _Vzd({212,245,240,241,161,194,239,234,238,226,245,234,240,239}),
			callback = function()
				local p = S.animTarget
				if not p or not _Vd6eb72811f9(p) or not p.Character then return end
				local hum = p.Character:FindFirstChildOfClass(_Vzd({201,246,238,226,239,240,234,229}))
				local animator = hum and hum:FindFirstChildOfClass(_Vzd({194,239,234,238,226,245,240,243}))
				if animator then
					for _, track in ipairs(animator:GetPlayingAnimationTracks()) do
						track:Stop()
					end
				end
				_V556c1dc412c(HUB_NAME, _Vzd({194,239,234,238,226,245,234,240,239,244,161,212,245,240,241,241,230,229}), 1)
			end,
		})
		_Vbb4234fd160(sc, _Vzd({121,119,116,113,113,69,121,116,116,113,120}), n())
		_Ve133dbec114(sc, {
			order = n(),
			id = _Vzd({244,241,234,239,213,226,243,232,230,245}),
			title = _Vzd({120,149,142,147,69,121,134,151,140,138,153}),
			tip = _Vzd({206,226,236,230,244,161,244,230,237,230,228,245,230,229,161,241,237,226,250,230,243,161,244,241,234,239,161,234,239,161,228,234,243,228,237,230,244}),
			callback = function(on)
				S.toggles.spinTarget = on
				if on then
					task.spawn(function()
						while S.toggles.spinTarget do
							local p = S.selected or S.animTarget
							if p and _Vd6eb72811f9(p) and p.Character then
								local r = p.Character:FindFirstChild(_Vzd({201,246,238,226,239,240,234,229,211,240,240,245,209,226,243,245}))
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
		_Ve133dbec114(sc, {
			order = n(),
			id = _Vzd({152,149,134,146,111,154,146,149}),
			title = _Vzd({120,149,134,146,69,111,154,146,149,69,121,134,151,140,138,153}),
			tip = _Vzd({114,134,144,138,152,69,152,138,145,138,136,153,138,137,69,149,145,134,158,138,151,69,143,154,146,149,69,148,155,138,151,69,134,147,137,69,148,155,138,151}),
			callback = function(on)
				S.toggles.spamJump = on
				if on then
					task.spawn(function()
						while S.toggles.spamJump do
							local p = S.selected or S.animTarget
							if p and _Vd6eb72811f9(p) and p.Character then
								local hum = p.Character:FindFirstChildOfClass(_Vzd({201,246,238,226,239,240,234,229}))
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
		_Ve133dbec114(sc, {
			order = n(),
			id = _Vzd({244,233,226,236,250,196,226,238}),
			title = _Vzd({212,233,226,236,250,161,196,226,238,230,243,226,161,213,226,243,232,230,245}),
			tip = _Vzd({203,234,245,245,230,243,161,245,233,230,161,228,226,238,230,243,226,161,240,239,161,245,233,230,161,244,230,237,230,228,245,230,229,161,241,237,226,250,230,243}),
			callback = function(on)
				S.toggles.shakyCam = on
				if on then
					task.spawn(function()
						while S.toggles.shakyCam do
							local p = S.selected or S.animTarget
							if p and _Vd6eb72811f9(p) and p.Character then
								local r = p.Character:FindFirstChild(_Vzd({201,246,238,226,239,240,234,229,211,240,240,245,209,226,243,245}))
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
		_Vbb4234fd160(sc, _Vzd({205,202,206,195,212}), n())
		local limbNote = Instance.new(_Vzd({213,230,249,245,205,226,227,230,237}))
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
		_Ve7cf4e7f5f(limbNote, 8)
		pad(limbNote, 6, 6, 6, 6)
		local LIMB_JOINTS = { _Vzd({211,234,232,233,245,161,212,233,240,246,237,229,230,243}), _Vzd({205,230,231,245,161,212,233,240,246,237,229,230,243}), _Vzd({211,234,232,233,245,161,201,234,241}), _Vzd({113,138,139,153,69,109,142,149}), _Vzd({207,230,228,236}), _Vzd({211,240,240,245,203,240,234,239,245}) }
		local LIMB_PARTS = { _Vzd({211,234,232,233,245,161,194,243,238}), _Vzd({113,138,139,153,69,102,151,146}), _Vzd({119,142,140,141,153,69,113,138,140}), _Vzd({205,230,231,245,161,205,230,232}), _Vzd({201,230,226,229}), _Vzd({213,240,243,244,240}) }
		local function breakLimbs(character, flingPower)
			if not character then return end
			flingPower = flingPower or 2000
			local r = character:FindFirstChild(_Vzd({201,246,238,226,239,240,234,229,211,240,240,245,209,226,243,245}))
			for _, d in ipairs(character:GetDescendants()) do
				if d:IsA(_Vzd({206,240,245,240,243,183,197})) then
					pcall(function() d:Destroy() end)
				end
			end
			for _, partName in ipairs(LIMB_PARTS) do
				local part = character:FindFirstChild(partName)
				if part and part:IsA(_Vzd({195,226,244,230,209,226,243,245})) then
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
				if d:IsA(_Vzd({206,240,245,240,243,183,197})) and d.Part1 == limbPart then
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
			local myRoot = myChar:FindFirstChild(_Vzd({201,246,238,226,239,240,234,229,211,240,240,245,209,226,243,245}))
			if not myRoot then return false end
			local limb = char:FindFirstChild(limbName)
			if not limb or not limb:IsA(_Vzd({195,226,244,230,209,226,243,245})) then return false end
			local joint = findJointForLimb(char, limb)
			if joint then pcall(function() joint:Destroy() end) end
			sno(limb)
			pcall(function() FTAP.CreateGrabLine:FireServer(limb, limb.CFrame) end)
			task.wait(0.05)
			pcall(function() FTAP.CreateGrabLine:FireServer(limb, myRoot.CFrame * CFrame.new(0, 2, -5)) end)
			_Vb538a53863(limb, myRoot.CFrame * CFrame.new(0, 2, -5))
			task.wait(0.1)
			local weld = Instance.new(_Vzd({216,230,237,229,196,240,239,244,245,243,226,234,239,245}))
			weld.Name = _Vzd({215,208,202,197,219,224,212,245,240,237,230,239,205,234,238,227})
			weld.Part0 = myRoot
			weld.Part1 = limb
			weld.Parent = limb
			stolenParts[#stolenParts + 1] = { part = limb, char = char, limbName = limbName }
			return true
		end
		local STEAL_LIMBS = {
			{ label = _Vzd({205,230,231,245,161,194,243,238}),  part = _Vzd({205,230,231,245,161,194,243,238}) },
			{ label = _Vzd({119,142,140,141,153,69,102,151,146}), part = _Vzd({211,234,232,233,245,161,194,243,238}) },
			{ label = _Vzd({113,138,139,153,69,113,138,140}),  part = _Vzd({113,138,139,153,69,113,138,140}) },
			{ label = _Vzd({211,234,232,233,245,161,205,230,232}), part = _Vzd({119,142,140,141,153,69,113,138,140}) },
			{ label = _Vzd({201,230,226,229}),      part = _Vzd({201,230,226,229}) },
		}
		local function returnStolenLimbs()
			local n = 0
			for i = #stolenParts, 1, -1 do
				local info = stolenParts[i]
				local part = info.part
				if part and part.Parent then
					for _, d in ipairs(part:GetDescendants()) do
						if d:IsA(_Vzd({124,138,145,137,104,148,147,152,153,151,134,142,147,153})) and d.Name == _Vzd({215,208,202,197,219,224,212,245,240,237,230,239,205,234,238,227}) then
							pcall(function() d:Destroy() end)
						end
					end
					local bp = part:FindFirstChild(_Vzd({195,243,234,239,232,195,240,229,250}))
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
		_Vc79d533d10e(sc, {
			order = n(),
			title = _Vzd({211,230,238,240,247,230,161,206,250,161,205,234,238,227,244,161,220,214,222}),
			tip = _Vzd({195,243,230,226,236,161,235,240,234,239,245,244,161,240,239,161,218,208,214,211,161,228,233,226,243,226,228,245,230,243,161,172,161,231,237,234,239,232,161,237,234,238,227,244,161,226,248,226,250}),
			danger = true,
			callback = function()
				local char = LP.Character
				if not char then _V556c1dc412c(HUB_NAME, _Vzd({115,148,69,136,141,134,151,134,136,153,138,151}), 1) return end
				breakLimbs(char, 1500)
				_V556c1dc412c(HUB_NAME, _Vzd({205,234,238,227,244,161,243,234,241,241,230,229,161,240,231,231}), 1)
			end,
		})
		_Vc79d533d10e(sc, {
			order = n(),
			title = _Vzd({211,234,241,161,205,234,238,227,244,161,208,231,231,161,213,226,243,232,230,245}),
			tip = _Vzd({120,115,116,69,80,69,135,151,138,134,144,69,143,148,142,147,153,152,69,80,69,139,145,142,147,140,69,145,142,146,135,152,69,148,147,69,152,138,145,138,136,153,138,137,69,149,145,134,158,138,151}),
			callback = function()
				local p = S.selected
				if not p or not _Vd6eb72811f9(p) or not p.Character then
					_V556c1dc412c(HUB_NAME, _Vzd({209,234,228,236,161,226,161,241,237,226,250,230,243,161,231,234,243,244,245}), 1.2) return
				end
				_Veb5a36521fa(p, 10)
				pcall(function() breakLimbs(p.Character, 2000) end)
				_V556c1dc412c(HUB_NAME, _Vzd({205,234,238,227,244,161,243,234,241,241,230,229,161,240,231,231,161}) .. _V466aec8e137(p), 1)
			end,
		})
		_Vbb4234fd160(sc, _Vzd({212,213,198,194,205,161,195,208,197,218,161,209,194,211,213,212}), n())
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
		_Ve7cf4e7f5f(stealNote, 8)
		pad(stealNote, 6, 6, 6, 6)
		for _, entry in ipairs(STEAL_LIMBS) do
			_Vc79d533d10e(sc, {
				order = n(),
				title = _Vzd({120,153,138,134,145,69}) .. entry.label,
				tip = _Vzd({197,230,245,226,228,233,161}) .. entry.label .. _Vzd({161,231,243,240,238,161,245,226,243,232,230,245,161,172,161,226,245,245,226,228,233,161,245,240,161,250,240,246}),
				callback = function()
					local p = S.selected
					if not p or not _Vd6eb72811f9(p) or not p.Character then
						_V556c1dc412c(HUB_NAME, _Vzd({209,234,228,236,161,226,161,241,237,226,250,230,243,161,231,234,243,244,245}), 1.2) return
					end
					local myChar = LP.Character
					if not myChar or not myChar:FindFirstChild(_Vzd({201,246,238,226,239,240,234,229,211,240,240,245,209,226,243,245})) then
						_V556c1dc412c(HUB_NAME, _Vzd({126,148,154,69,147,138,138,137,69,134,69,136,141,134,151,134,136,153,138,151}), 1) return
					end
					_Veb5a36521fa(p, 10)
					task.wait(0.08)
					local ok = stealSingleLimb(p, entry.part)
					if ok then
						_V556c1dc412c(HUB_NAME, _Vzd({212,245,240,237,230,161}) .. entry.label .. _Vzd({161,231,243,240,238,161}) .. _V466aec8e137(p), 1.2)
					else
						_V556c1dc412c(HUB_NAME, _Vzd({107,134,142,145,138,137,69,153,148,69,152,153,138,134,145,69}) .. entry.label, 1.5)
					end
				end,
			})
		end
		_Vc79d533d10e(sc, {
			order = n(),
			title = _Vzd({212,245,230,226,237,161,194,205,205,161,205,234,238,227,244}),
			tip = _Vzd({197,230,245,226,228,233,161,230,247,230,243,250,161,237,234,238,227,161,231,243,240,238,161,245,226,243,232,230,245,161,172,161,226,245,245,226,228,233,161,226,237,237,161,245,240,161,250,240,246}),
			danger = true,
			callback = function()
				local p = S.selected
				if not p or not _Vd6eb72811f9(p) or not p.Character then
					_V556c1dc412c(HUB_NAME, _Vzd({117,142,136,144,69,134,69,149,145,134,158,138,151,69,139,142,151,152,153}), 1.2) return
				end
				local myChar = LP.Character
				if not myChar or not myChar:FindFirstChild(_Vzd({201,246,238,226,239,240,234,229,211,240,240,245,209,226,243,245})) then
					_V556c1dc412c(HUB_NAME, _Vzd({218,240,246,161,239,230,230,229,161,226,161,228,233,226,243,226,228,245,230,243}), 1) return
				end
				_Veb5a36521fa(p, 10)
				task.wait(0.08)
				local stolen = 0
				for _, entry in ipairs(STEAL_LIMBS) do
					if stealSingleLimb(p, entry.part) then
						stolen += 1
						task.wait(0.12)
					end
				end
				_V556c1dc412c(HUB_NAME, _Vzd({212,245,240,237,230,161}) .. stolen .. "/" .. #STEAL_LIMBS .. _Vzd({69,145,142,146,135,152,69,139,151,148,146,69}) .. _V466aec8e137(p), 1.5)
			end,
		})
		_Vc79d533d10e(sc, {
			order = n(),
			title = _Vzd({211,230,245,246,243,239,161,212,245,240,237,230,239,161,205,234,238,227,244}),
			tip = _Vzd({119,138,146,148,155,138,69,134,145,145,69,152,153,148,145,138,147,69,149,134,151,153,152,69,139,151,148,146,69,158,148,154,151,69,135,148,137,158,69,80,69,139,145,142,147,140,69,134,156,134,158}),
			danger = true,
			callback = function()
				local n = returnStolenLimbs()
				_V556c1dc412c(HUB_NAME, _Vzd({211,230,245,246,243,239,230,229,161}) .. n .. _Vzd({69,152,153,148,145,138,147,69,145,142,146,135}) .. (n == 1 and "" or "s"), 1.2)
			end,
		})
		_Ve133dbec114(sc, {
			order = n(),
			id = _Vzd({236,230,230,241,212,245,240,237,230,239,194,245,245,226,228,233,230,229}),
			title = _Vzd({204,230,230,241,161,212,245,240,237,230,239,161,194,245,245,226,228,233,230,229}),
			tip = _Vzd({113,148,148,149,95,69,151,138,82,156,138,145,137,69,152,153,148,145,138,147,69,145,142,146,135,152,69,153,148,69,158,148,154,151,69,135,148,137,158,69,156,141,142,145,138,69,146,148,155,142,147,140}),
			callback = function(on)
				S.toggles.keepStolenAttached = on
				if on then
					_V53fa917f1a2(_Vzd({236,230,230,241,212,245,240,237,230,239}), 0.15, function()
						local myRoot = hrp()
						if not myRoot then return end
						for _, info in ipairs(stolenParts) do
							local part = info.part
							if part and part.Parent then
								local hasWeld = false
								for _, d in ipairs(part:GetDescendants()) do
									if d:IsA(_Vzd({216,230,237,229,196,240,239,244,245,243,226,234,239,245})) and d.Name == _Vzd({215,208,202,197,219,224,212,245,240,237,230,239,205,234,238,227}) then
										if d.Part0 and d.Part0.Parent and d.Part1 and d.Part1.Parent then
											hasWeld = true
										else
											pcall(function() d:Destroy() end)
										end
									end
								end
								if not hasWeld then
									sno(part)
									_Vb538a53863(part, myRoot.CFrame * CFrame.new(0, 2, -5))
									local w = Instance.new(_Vzd({124,138,145,137,104,148,147,152,153,151,134,142,147,153}))
									w.Name = _Vzd({123,116,110,105,127,132,120,153,148,145,138,147,113,142,146,135})
									w.Part0 = myRoot
									w.Part1 = part
									w.Parent = part
								end
							end
						end
					end)
					_V556c1dc412c(HUB_NAME, _Vzd({120,153,148,145,138,147,69,145,142,146,135,152,69,139,148,145,145,148,156,69,158,148,154}), 1)
				else
					_V11a5d4671af(_Vzd({144,138,138,149,120,153,148,145,138,147}))
					_V556c1dc412c(HUB_NAME, _Vzd({120,153,148,145,138,147,69,145,142,146,135,152,69,152,153,134,158,69,142,147,69,149,145,134,136,138}), 1)
				end
			end,
		})
		_Ve133dbec114(sc, {
			order = n(),
			id = _Vzd({237,234,238,227,194,246,243,226}),
			title = _Vzd({205,234,238,227,161,212,245,230,226,237,161,194,246,243,226}),
			tip = _Vzd({114,134,149,82,156,142,137,138,95,69,153,138,145,138,149,148,151,153,69,153,148,69,138,134,136,141,69,149,145,134,158,138,151,69,134,147,137,69,151,142,149,69,153,141,138,142,151,69,145,142,146,135,152,69,148,139,139}),
			callback = function(on)
				S.toggles.limbAura = on
				if on then
					_V53fa917f1a2(_Vzd({237,234,238,227,194,246,243,226}), 0.5, function()
						local me = hrp()
						if not me then return end
						local homeCF = me.CFrame
						for _, p in ipairs(Players:GetPlayers()) do
							if p ~= LP and _V4a303563e9(p) and not _V318f2ee5f3(p) and not _V732569ef100(p) then
								local r = _Vb2220e5a155(p)
								if r then
									pcall(function()
										if r.Position.Y <= -12 then
											me.CFrame = CFrame.new(r.Position + Vector3.new(0, 5, -15))
										else
											me.CFrame = CFrame.new(r.Position + Vector3.new(0, -10, -10))
										end
										_Vb07b7f02185(p, r.Position)
										task.wait()
										breakLimbs(p.Character, 2000)
									end)
								end
							end
						end
						pcall(function() me.CFrame = homeCF end)
					end)
					_V556c1dc412c(HUB_NAME, _Vzd({205,234,238,227,161,212,245,230,226,237,161,194,246,243,226,161,208,207}), 1.5)
				else
					_V11a5d4671af(_Vzd({145,142,146,135,102,154,151,134}))
					_V556c1dc412c(HUB_NAME, _Vzd({205,234,238,227,161,212,245,230,226,237,161,194,246,243,226,161,208,199,199}), 1)
				end
			end,
		})
		_Vbb4234fd160(sc, _Vzd({118,122,110,104,112,69,120,106,119,123,106,119,69,102,104,121,110,116,115,120}), n())
		_Vc79d533d10e(sc, {
			order = n(),
			title = _Vzd({205,226,232,161,212,230,243,247,230,243,161,169,212,240,231,245,170}),
			tip = _Vzd({208,239,230,174,244,233,240,245,161,244,241,226,238,161,196,243,230,226,245,230,200,243,226,227,205,234,239,230,161,240,239,161,230,247,230,243,250,240,239,230}),
			callback = function()
				for _, p in ipairs(Players:GetPlayers()) do
					if p ~= LP and _Vd6eb72811f9(p) and p.Character then
						local r = _Vb2220e5a155(p)
						if r and FTAP.CreateGrabLine then
							pcall(function() FTAP.CreateGrabLine:FireServer(r, r.CFrame) end)
						end
					end
				end
				_V556c1dc412c(HUB_NAME, _Vzd({120,148,139,153,69,145,134,140,69,139,142,151,138,137}), 1)
			end,
		})
		_Vc79d533d10e(sc, {
			order = n(),
			title = _Vzd({105,138,152,153,151,148,158,69,102,145,145,69,113,142,147,138,152}),
			callback = function()
				for _, p in ipairs(Players:GetPlayers()) do
					if p ~= LP and _Vd6eb72811f9(p) and p.Character then
						local r = _Vb2220e5a155(p)
						if r and FTAP.DestroyGrabLine then
							pcall(function() FTAP.DestroyGrabLine:FireServer(r) end)
						end
					end
				end
				_V556c1dc412c(HUB_NAME, _Vzd({102,145,145,69,145,142,147,138,152,69,137,138,152,153,151,148,158,138,137}), 1)
			end,
		})
		_Vc79d533d10e(sc, {
			order = n(),
			title = _Vzd({119,134,140,137,148,145,145,69,106,155,138,151,158,148,147,138}),
			callback = function()
				for _, p in ipairs(Players:GetPlayers()) do
					if p ~= LP and _Vd6eb72811f9(p) and p.Character then
						local r = _Vb2220e5a155(p)
						if r and FTAP.RagdollRemote then
							pcall(function() FTAP.RagdollRemote:FireServer(r, 0) end)
						end
					end
				end
				_V556c1dc412c(HUB_NAME, _Vzd({198,247,230,243,250,240,239,230,161,243,226,232,229,240,237,237,230,229}), 1)
			end,
		})
		_Vc79d533d10e(sc, {
			order = n(),
			title = _Vzd({211,234,241,161,205,234,238,227,244,161,208,231,231,161,198,247,230,243,250,240,239,230}),
			tip = _Vzd({120,115,116,69,80,69,135,151,138,134,144,69,134,145,145,69,114,148,153,148,151,91,105,69,143,148,142,147,153,152,69,80,69,139,145,142,147,140,69,145,142,146,135,152,69,148,147,69,138,155,138,151,158,69,149,145,134,158,138,151}),
			danger = true,
			callback = function()
				local me = hrp()
				if not me then return end
				local homeCF = me.CFrame
				for _, p in ipairs(Players:GetPlayers()) do
					if p ~= LP and _V4a303563e9(p) and not _V318f2ee5f3(p) and not _V732569ef100(p) then
						local r = _Vb2220e5a155(p)
						if r then
							pcall(function()
								if r.Position.Y <= -12 then
									me.CFrame = CFrame.new(r.Position + Vector3.new(0, 5, -15))
								else
									me.CFrame = CFrame.new(r.Position + Vector3.new(0, -10, -10))
								end
								_Vb07b7f02185(p, r.Position)
								task.wait()
								for _, d in ipairs(p.Character:GetDescendants()) do
									if d:IsA(_Vzd({206,240,245,240,243,183,197})) then pcall(function() d:Destroy() end) end
								end
								for _, partName in ipairs({_Vzd({119,142,140,141,153,69,102,151,146}),_Vzd({113,138,139,153,69,102,151,146}),_Vzd({119,142,140,141,153,69,113,138,140}),_Vzd({205,230,231,245,161,205,230,232}),_Vzd({201,230,226,229})}) do
									local part = p.Character:FindFirstChild(partName)
									if part and part:IsA(_Vzd({195,226,244,230,209,226,243,245})) then
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
				_V556c1dc412c(HUB_NAME, _Vzd({198,247,230,243,250,240,239,230,168,244,161,237,234,238,227,244,161,243,234,241,241,230,229,161,240,231,231}), 1)
			end,
		})
_Vbb4234fd160(sc, _Vzd({121,119,102,110,115,69,104,116,115,121,119,116,113}), n())
local trainNote = Instance.new(_Vzd({213,230,249,245,205,226,227,230,237}))
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
trainNote.Text = " Bloody-style FE train: TP + sit VehicleSeat + SetNetworkOwner + multi-part BV.\n WASD / Space / Ctrl fly the train. H = horn. Stop Train to exit seat."
trainNote.Parent = sc
_Ve7cf4e7f5f(trainNote, 8)
pad(trainNote, 6, 6, 6, 6)
S.trainSpeed = S.trainSpeed or 120
_Ve79e7f32113(sc, {
	order = n(),
	title = _Vzd({213,243,226,234,239,161,212,241,230,230,229}),
	min = 20,
	max = 300,
	default = 120,
	step = 5,
	stateKey = _Vzd({245,243,226,234,239,212,241,230,230,229}),
	tip = _Vzd({103,148,137,158,123,138,145,148,136,142,153,158,69,152,149,138,138,137,69,156,141,142,145,138,69,137,151,142,155,142,147,140}),
})
_Vc79d533d10e(sc, {
	order = n(),
	title = _Vzd({197,243,234,247,230,161,195,237,246,230,161,213,243,226,234,239}),
	tip = _Vzd({195,237,240,240,229,250,174,244,245,250,237,230,187,161,238,240,246,239,245,161,172,161,244,234,245,161,169,199,198,161,240,248,239,230,243,244,233,234,241,170,161,172,161,212,207,208,161,172,161,241,246,244,233,161,248,233,240,237,230,161,245,243,226,234,239,175,161,211,230,174,244,234,245,244,161,234,231,161,230,235,230,228,245,230,229,175,161,212,226,231,230,174,241,240,244,161,240,239,237,250,161,169,239,240,161,247,240,234,229,170,175}),
	callback = function()
		task.spawn(_Vf23076721a7)
	end,
})
_Vc79d533d10e(sc, {
	order = n(),
	title = _Vzd({213,209,161,208,239,245,240,161,195,237,246,230,161,213,243,226,234,239}),
	tip = _Vzd({208,239,230,161,245,230,237,230,241,240,243,245,161,240,239,245,240,161,245,233,230,161,245,243,226,234,239,161,240,239,237,250,161,169,239,240,161,229,243,234,247,230,170,175,161,214,244,230,161,197,243,234,247,230,161,195,237,246,230,161,213,243,226,234,239,161,231,240,243,161,231,246,237,237,161,199,198,161,228,240,239,245,243,240,237,175}),
	callback = function()
		local me = hrp()
		if not me then _V556c1dc412c(HUB_NAME, _Vzd({115,148,69,136,141,134,151,134,136,153,138,151}), 1.5); return end
		local seat, model = _V27264a5f82()
		local root = (seat and seat:IsA(_Vzd({195,226,244,230,209,226,243,245})) and seat) or _Vcdb032f89(seat) or _Vcdb032f89(model)
		if not root then
			_V556c1dc412c(HUB_NAME, _Vzd({195,237,246,230,161,245,243,226,234,239,161,239,240,245,161,237,240,226,229,230,229,161,250,230,245,161,253,161,248,226,234,245,161,226,161,227,234,245}), 2)
			return
		end
		if not _V5a741c561f0(root.Position) then
			_V556c1dc412c(HUB_NAME, _Vzd({213,243,226,234,239,161,239,240,245,161,234,239,161,226,161,244,226,231,230,161,244,241,240,245,161,169,247,240,234,229,176,248,226,245,230,243,170,161,99,1,21,161,248,226,234,245}), 2)
			return
		end
		pcall(function() me.CFrame = root.CFrame * CFrame.new(0, 4, 0) end)
		_V556c1dc412c(HUB_NAME, _Vzd({208,239,161,245,243,226,234,239,161,253,161,241,243,230,244,244,161,197,243,234,247,230,161,195,237,246,230,161,213,243,226,234,239}), 1.5)
	end,
})
_Vc79d533d10e(sc, {
	order = n(),
	title = _Vzd({212,245,240,241,161,213,243,226,234,239}),
	danger = true,
	callback = function()
		_V28caa47b1b6(false)
	end,
})
_Vbb4234fd160(sc, _Vzd({102,122,121,116,69,120,115,116,124,103,102,113,113,69,114,102,112,106,119}), n())
local ballNote = Instance.new(_Vzd({121,138,157,153,113,134,135,138,145}))
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
ballNote.Text = _Vzd({161,194,246,245,240,161,244,241,226,248,239,161,253,161,232,230,239,245,237,230,161,248,233,234,237,230,161,245,234,239,250,161,253,161,226,231,245,230,243,161,244,226,231,230,161,244,234,251,230,161,199,194,212,213,161,237,240,239,232,161,238,240,246,239,245,226,234,239,161,243,240,237,237,244,161,253,161,241,226,243,236,161,248,233,230,239,161,231,246,237,237,161,253,161,231,237,234,239,232,176,230,249,241,237,240,229,230,161,243,230,226,229,250})
ballNote.Parent = sc
_Ve7cf4e7f5f(ballNote, 8)
pad(ballNote, 6, 6, 6, 6)
S.ballType = S.ballType or _Vzd({212,239,240,248,227,226,237,237})
S.ballSize = S.ballSize or 15
S.ballCount = S.ballCount or 10
S.ballFlingPower = S.ballFlingPower or 5000
_V966b09a310f(sc, {
	order = n(),
	title = _Vzd({195,226,237,237,161,213,250,241,230}),
	options = { _Vzd({212,239,240,248,227,226,237,237}), _Vzd({212,226,239,229,227,226,237,237}) },
	default = S.ballType,
	callback = function(v) S.ballType = v end,
})
_Ve79e7f32113(sc, {
	order = n(),
	title = _Vzd({108,151,148,156,69,120,142,159,138,69,77,152,153,154,137,152,78}),
	min = 4,
	max = 25,
	default = 15,
	step = 1,
	stateKey = _Vzd({227,226,237,237,212,234,251,230}),
	tip = _Vzd({120,138,151,155,138,151,69,140,151,148,156,152,69,156,141,142,145,138,69,151,148,145,145,142,147,140,69,148,147,69,152,147,148,156,69,161,69,152,153,148,149,69,156,141,138,147,69,120,142,159,138,69,99,98,69,153,141,142,152}),
})
_Ve79e7f32113(sc, {
	order = n(),
	title = _Vzd({195,226,237,237,161,196,240,246,239,245}),
	min = 1,
	max = 50,
	default = 10,
	step = 1,
	stateKey = _Vzd({227,226,237,237,196,240,246,239,245}),
	tip = _Vzd({201,240,248,161,238,226,239,250,161,195,226,237,237,212,239,240,248,227,226,237,237,161,245,240,161,231,226,243,238}),
})
_Ve79e7f32113(sc, {
	order = n(),
	title = _Vzd({199,237,234,239,232,161,209,240,248,230,243}),
	min = 500,
	max = 50000,
	default = 5000,
	step = 500,
	stateKey = _Vzd({227,226,237,237,199,237,234,239,232,209,240,248,230,243}),
	tip = _Vzd({215,230,237,240,228,234,245,250,161,226,241,241,237,234,230,229,161,245,240,161,230,226,228,233,161,232,243,240,248,239,161,227,226,237,237}),
})
_Vc79d533d10e(sc, {
	order = n(),
	title = _Vzd({212,245,226,243,245,161,199,226,243,238,161,212,239,240,248,227,226,237,237,244}),
	tip = _Vzd({212,230,243,234,226,237,161,244,241,226,248,239,161,195,226,237,237,212,239,240,248,227,226,237,237,161,172,161,243,240,237,237,174,232,243,240,248,161,246,239,245,234,237,161,228,240,246,239,245,161,243,230,226,228,233,230,229}),
	callback = function()
		task.spawn(_V0df041601a4)
	end,
})
_Vc79d533d10e(sc, {
	order = n(),
	title = _Vzd({120,153,148,149,69,107,134,151,146}),
	callback = function()
		_Vb91561a01b3(false)
	end,
})
_Vc79d533d10e(sc, {
	order = n(),
	title = _Vzd({206,226,236,230,161,167,161,199,237,234,239,232,161,226,245,161,213,226,243,232,230,245}),
	danger = true,
	tip = _Vzd({199,226,243,238,161,245,233,230,239,161,231,237,234,239,232,161,232,243,240,248,239,161,227,226,237,237,244,161,226,245,161,244,230,237,230,228,245,230,229,161,241,237,226,250,230,243}),
	callback = function()
		task.spawn(_V162db74910c)
	end,
})
_Vc79d533d10e(sc, {
	order = n(),
	title = _Vzd({199,237,234,239,232,161,200,243,240,248,239,161,226,245,161,213,226,243,232,230,245}),
	danger = true,
	tip = _Vzd({199,237,234,239,232,161,226,237,243,230,226,229,250,174,232,243,240,248,239,161,244,239,240,248,227,226,237,237,244,161,226,245,161,244,230,237,230,228,245,230,229,161,241,237,226,250,230,243}),
	callback = function()
		local p = S.selected
		if not p or not _Vd6eb72811f9(p) then _V556c1dc412c(HUB_NAME, _Vzd({212,230,237,230,228,245,161,226,161,245,226,243,232,230,245}), 1.5); return end
		task.spawn(function() _Vcf9e116a91(p) end)
	end,
})
_Vc79d533d10e(sc, {
	order = n(),
	title = _Vzd({198,249,241,237,240,229,230,161,200,243,240,248,239,161,212,239,240,248,227,226,237,237,244}),
	danger = true,
	tip = _Vzd({195,240,238,227,198,249,241,237,240,229,230,161,226,237,237,161,232,243,240,248,239,161,244,239,240,248,227,226,237,237,244}),
	callback = function()
		task.spawn(_Vf6adfe267e)
	end,
})
end
_TAB_BUILDERS[_Vzd({244,230,245,245,234,239,232,244})] = function(sc, n)
		_Vbb4234fd160(sc, _Vzd({213,201,198,206,198,212}), n())
		_V966b09a310f(sc, {
			order = n(), title = _Vzd({104,148,145,148,151,69,121,141,138,146,138}),
			options = { _Vzd({209,246,243,241,237,230}), _Vzd({211,230,229}), _Vzd({216,233,234,245,230}), _Vzd({195,237,226,228,236}), _Vzd({200,243,230,230,239}), _Vzd({195,237,246,230}) },
			default = S.theme or _Vzd({209,246,243,241,237,230}),
			callback = function(v)
				_V7241708f22(v)
			end,
		})
		_Vbb4234fd160(sc, _Vzd({105,106,123,110,104,106}), n())
		_V966b09a310f(sc, {
			order = n(), title = _Vzd({197,230,247,234,228,230}),
			tip = _Vzd({209,196,161,232,230,245,244,161,244,228,243,240,237,237,161,248,233,230,230,237,161,253,161,206,240,227,234,237,230,161,232,230,245,244,161,240,239,174,244,228,243,230,230,239,161,227,246,245,245,240,239,244}),
			options = { _Vzd({209,196}), _Vzd({206,240,227,234,237,230}) },
			default = S.device or _Vzd({209,196}),
			callback = function(v)
				S.device = v
				S.toggles.mobileUI = (v == _Vzd({206,240,227,234,237,230}))
				_V556c1dc412c(HUB_NAME, _Vzd({197,230,247,234,228,230,161,174,191,161}) .. v, 1)
			end,
		})
		_Vbb4234fd160(sc, _Vzd({214,202}), n())
		_Ve79e7f32113(sc, {
			order = n(), title = _Vzd({201,246,227,161,212,228,226,237,230}), min = 60, max = 120, default = 100,
			tip = _Vzd({214,202,161,244,234,251,230,161,241,230,243,228,230,239,245,226,232,230,161,169,178,177,177,161,190,161,229,230,231,226,246,237,245,170}),
			callback = function(v)
				S.hubScale = v
				if S.root then
					local scale = v / 100
					S.root.Size = UDim2.fromOffset(math.floor(520 * scale), math.floor(340 * scale))
				end
			end,
		})
		_Ve133dbec114(sc, {
			order = n(), id = _Vzd({154,147,145,148,136,144,114,148,154,152,138}), title = _Vzd({214,239,237,240,228,236,161,206,240,246,244,230}),
			tip = _Vzd({205,230,245,244,161,250,240,246,161,228,237,234,228,236,161,245,233,230,161,232,226,238,230,161,248,233,234,237,230,161,245,233,230,161,233,246,227,161,234,244,161,240,241,230,239,161,169,209,196,161,240,239,237,250,170,175,161,208,239,161,227,250,161,229,230,231,226,246,237,245,161,248,233,230,239,161,233,246,227,161,240,241,230,239,244,175}),
			callback = function(on)
				S.toggles.unlockMouse = on == true
				if S.hubOpen and S._V63e1d243175 then
					pcall(S._V63e1d243175, on == true)
				end
				_V556c1dc412c(HUB_NAME, _Vzd({122,147,145,148,136,144,69,114,148,154,152,138,69}) .. (on and _Vzd({208,207}) or _Vzd({208,199,199})), 1)
			end,
		})
		_Vbb4234fd160(sc, _Vzd({216,201,202,213,198,205,202,212,213}), n())
		_Ve133dbec114(sc, {
			order = n(), id = _Vzd({248,237,199,243,234,230,239,229,244}), title = _Vzd({124,141,142,153,138,145,142,152,153,69,107,151,142,138,147,137,152}),
			tip = _Vzd({212,236,234,241,161,231,243,234,230,239,229,244,161,234,239,161,226,246,243,226,244,161,176,161,238,226,244,244,161,237,240,240,241,244}),
			callback = function(on) S.toggles.wlFriends = on end,
		})
		_Vc79d533d10e(sc, {
			order = n(), title = _Vzd({194,229,229,161,212,230,237,230,228,245,230,229,161,209,237,226,250,230,243}),
			tip = _Vzd({102,137,137,69,136,154,151,151,138,147,153,69,149,145,134,158,138,151,69,137,151,148,149,137,148,156,147,69,152,138,145,138,136,153,142,148,147,69,153,148,69,156,141,142,153,138,145,142,152,153}),
			callback = function()
				if S.selected then
					S.whitelist[S.selected.Name] = true
					_V556c1dc412c(HUB_NAME, _Vzd({124,141,142,153,138,145,142,152,153,138,137,69}) .. S.selected.Name, 1)
					if S._wlRefresh then pcall(S._wlRefresh) end
				else
					_V556c1dc412c(HUB_NAME, _Vzd({207,240,161,241,237,226,250,230,243,161,244,230,237,230,228,245,230,229}), 1)
				end
			end,
		})
		_Vc79d533d10e(sc, {
			order = n(), title = _Vzd({211,230,238,240,247,230,161,212,230,237,230,228,245,230,229,161,209,237,226,250,230,243}),
			callback = function()
				if S.selected then
					S.whitelist[S.selected.Name] = nil
					_V556c1dc412c(HUB_NAME, _Vzd({119,138,146,148,155,138,137,69}) .. S.selected.Name, 1)
					if S._wlRefresh then pcall(S._wlRefresh) end
				else
					_V556c1dc412c(HUB_NAME, _Vzd({207,240,161,241,237,226,250,230,243,161,244,230,237,230,228,245,230,229}), 1)
				end
			end,
		})
		_Vc79d533d10e(sc, {
			order = n(), title = _Vzd({196,237,230,226,243,161,216,233,234,245,230,237,234,244,245}),
			callback = function()
				S.whitelist = {}
				_V556c1dc412c(HUB_NAME, _Vzd({216,233,234,245,230,237,234,244,245,161,228,237,230,226,243,230,229}), 1)
				if S._wlRefresh then pcall(S._wlRefresh) end
			end,
		})
		local wlLabel = Instance.new(_Vzd({213,230,249,245,205,226,227,230,237}))
		wlLabel.LayoutOrder = n()
		wlLabel.Size = UDim2.new(1, -6, 0, 14)
		wlLabel.BackgroundTransparency = 1
		wlLabel.Font = Enum.Font.Gotham
		wlLabel.TextSize = 10
		wlLabel.TextColor3 = C.muted
		wlLabel.TextXAlignment = Enum.TextXAlignment.Left
		wlLabel.Text = _Vzd({216,233,234,245,230,237,234,244,245,230,229,161,209,237,226,250,230,243,244})
		wlLabel.Parent = sc
		local wlBox = Instance.new(_Vzd({199,243,226,238,230}))
		wlBox.LayoutOrder = n()
		wlBox.Size = UDim2.new(1, -6, 0, 100)
		wlBox.BackgroundColor3 = C.bg
		wlBox.BorderSizePixel = 0
		wlBox.Parent = sc
		_Ve7cf4e7f5f(wlBox, 8)
		_Vb145617c1ba(wlBox, C.strokeSoft, 1)
		local wlSc = Instance.new(_Vzd({212,228,243,240,237,237,234,239,232,199,243,226,238,230}))
		wlSc.Size = UDim2.fromScale(1, 1)
		wlSc.BackgroundTransparency = 1
		wlSc.ScrollBarThickness = 3
		wlSc.ScrollBarImageColor3 = C.accent
		wlSc.AutomaticCanvasSize = Enum.AutomaticSize.Y
		wlSc.CanvasSize = UDim2.new()
		wlSc.Parent = wlBox
		local wlLay = Instance.new(_Vzd({214,202,205,234,244,245,205,226,250,240,246,245}))
		wlLay.Padding = UDim.new(0, 3)
		wlLay.Parent = wlSc
		pad(wlSc, 4, 4, 4, 4)
		local function refreshWL()
			for _, ch in ipairs(wlSc:GetChildren()) do
				if ch:IsA(_Vzd({199,243,226,238,230})) then ch:Destroy() end
			end
			local hasAny = false
			for name in pairs(S.whitelist) do
				hasAny = true
				local row = Instance.new(_Vzd({199,243,226,238,230}))
				row.Size = UDim2.new(1, -4, 0, 24)
				row.BackgroundColor3 = C.card
				row.BorderSizePixel = 0
				row.Parent = wlSc
				_Ve7cf4e7f5f(row, 6)
				local lbl = Instance.new(_Vzd({213,230,249,245,205,226,227,230,237}))
				lbl.Size = UDim2.new(1, -36, 1, 0)
				lbl.Position = UDim2.fromOffset(6, 0)
				lbl.BackgroundTransparency = 1
				lbl.Font = Enum.Font.Gotham
				lbl.TextSize = 11
				lbl.TextColor3 = C.text
				lbl.TextXAlignment = Enum.TextXAlignment.Left
				lbl.Text = name
				lbl.Parent = row
				local rm = Instance.new(_Vzd({213,230,249,245,195,246,245,245,240,239}))
				rm.Size = UDim2.fromOffset(24, 18)
				rm.Position = UDim2.new(1, -28, 0.5, -9)
				rm.BackgroundColor3 = Color3.fromRGB(180, 50, 50)
				rm.Text = "X"
				rm.TextColor3 = C.text
				rm.Font = Enum.Font.GothamBold
				rm.TextSize = 10
				rm.AutoButtonColor = false
				rm.Parent = row
				_Ve7cf4e7f5f(rm, 4)
				rm.MouseButton1Click:Connect(function()
					S.whitelist[name] = nil
					refreshWL()
					_V556c1dc412c(HUB_NAME, _Vzd({119,138,146,148,155,138,137,69}) .. name, 1)
				end)
			end
			if not hasAny then
				local empty = Instance.new(_Vzd({213,230,249,245,205,226,227,230,237}))
				empty.Size = UDim2.new(1, 0, 0, 24)
				empty.BackgroundTransparency = 1
				empty.Font = Enum.Font.Gotham
				empty.TextSize = 11
				empty.TextColor3 = C.muted
				empty.Text = _Vzd({115,148,69,149,145,134,158,138,151,152,69,156,141,142,153,138,145,142,152,153,138,137})
				empty.Parent = wlSc
			end
		end
		S._wlRefresh = refreshWL
		refreshWL()
		_Vbb4234fd160(sc, _Vzd({197,194,207,200,198,211,161,219,208,207,198}), n())
		_Vc79d533d10e(sc, {
			order = n(), title = _Vzd({122,147,145,148,134,137,69,120,136,151,142,149,153}), danger = true,
			tip = _Vzd({196,240,238,241,237,230,245,230,237,250,161,246,239,237,240,226,229,161,230,247,230,243,250,245,233,234,239,232,161,174,161,214,202,173,161,237,240,240,241,244,173,161,228,240,239,239,230,228,245,234,240,239,244,173,161,226,237,237,161,240,231,161,234,245}),
			callback = function()
				_V556c1dc412c(HUB_NAME, _Vzd({214,239,237,240,226,229,234,239,232,175,175,175}), 2)
				task.delay(0.5, function()
					pcall(function() _V0cbc6b091f8() end)
				end)
			end,
		})
		_Vbb4234fd160(sc, _Vzd({112,106,126,103,110,115,105,69,121,116,108,108,113,106,120}), n())
		_Ve133dbec114(sc, {
			order = n(), id = _Vzd({236,227,224,245,240,232,232,237,230,214,202}), title = _Vzd({213,240,232,232,237,230,161,201,246,227,161,220,211,234,232,233,245,212,233,234,231,245,222}),
			tip = _Vzd({211,234,232,233,245,212,233,234,231,245,161,245,240,161,240,241,230,239,176,228,237,240,244,230,161,233,246,227}),
			callback = function(on) S.toggles.kb_toggleUI = on end,
		})
		_Ve133dbec114(sc, {
			order = n(), id = _Vzd({236,227,224,231,237,250}), title = _Vzd({199,237,250,161,220,215,222}),
			callback = function(on) S.toggles.kb_fly = on end,
		})
		_Ve133dbec114(sc, {
			order = n(), id = _Vzd({236,227,224,239,240,228,237,234,241}), title = _Vzd({207,240,228,237,234,241,161,220,207,222}),
			callback = function(on) S.toggles.kb_noclip = on end,
		})
		_Ve133dbec114(sc, {
			order = n(), id = _Vzd({144,135,132,151,138,134,136,141}), title = _Vzd({120,136,151,148,145,145,69,105,142,152,153,134,147,136,138,69,128,119,130}),
			callback = function(on) S.toggles.kb_reach = on end,
		})
		_Ve133dbec114(sc, {
			order = n(), id = _Vzd({236,227,224,241,226,237,237,230,245}), title = _Vzd({209,226,237,237,230,245,161,216,234,239,232,244,161,220,210,222}),
			callback = function(on) S.toggles.kb_pallet = on end,
		})
		_Ve133dbec114(sc, {
			order = n(), id = _Vzd({236,227,224,231,237,234,239,232,194,246,243,226}), title = _Vzd({199,237,234,239,232,161,194,246,243,226,161,220,199,222}),
			callback = function(on) S.toggles.kb_flingAura = on end,
		})
		_Ve133dbec114(sc, {
			order = n(), id = _Vzd({236,227,224,239,230,245,240,248,239}), title = _Vzd({115,138,153,69,116,156,147,138,151,69,102,154,151,134,69,128,108,130}),
			callback = function(on) S.toggles.kb_netown = on end,
		})
		_Ve133dbec114(sc, {
			order = n(), id = _Vzd({236,227,224,226,239,245,234,200,243,226,227}), title = _Vzd({194,239,245,234,174,200,243,226,227,161,220,201,222}),
			callback = function(on) S.toggles.kb_antiGrab = on end,
		})
		_Ve133dbec114(sc, {
			order = n(), id = _Vzd({236,227,224,231,237,234,239,232,207,230,226,243}), title = _Vzd({107,145,142,147,140,69,115,138,134,151,69,128,121,130}),
			callback = function(on) S.toggles.kb_flingNear = on end,
		})
		_Ve133dbec114(sc, {
			order = n(), id = _Vzd({236,227,224,244,245,240,238,241}), title = _Vzd({212,245,240,238,241,161,194,246,243,226,161,220,218,222}),
			callback = function(on) S.toggles.kb_stomp = on end,
		})
		_Ve133dbec114(sc, {
			order = n(), id = _Vzd({236,227,224,240,243,227,234,245}), title = _Vzd({208,243,227,234,245,161,194,246,243,226,161,220,208,222}),
			callback = function(on) S.toggles.kb_orbit = on end,
		})
		_Ve133dbec114(sc, {
			order = n(), id = _Vzd({236,227,224,244,230,243,247,230,243,199,237,234,239,232}), title = _Vzd({120,138,151,155,138,151,69,107,145,142,147,140,69,128,111,130}),
			callback = function(on) S.toggles.kb_serverFling = on end,
		})
		_Vbb4234fd160(sc, _Vzd({108,113,116,103,102,113,69,117,116,124,106,119,120}), n())
		_Ve79e7f32113(sc, {
			order = n(), title = _Vzd({107,145,142,147,140,69,117,148,156,138,151}), min = 400, max = 20000, default = S.flingPower or 8000, step = 100,
			stateKey = _Vzd({231,237,234,239,232,209,240,248,230,243}),
		})
		_Ve79e7f32113(sc, {
			order = n(), title = _Vzd({212,245,243,230,239,232,245,233,161,206,246,237,245,234,241,237,234,230,243}), min = 0.1, max = 10, default = S.strengthMult or 1, step = 0.1,
			callback = function(v) S.strengthMult = v end,
		})
		_Ve79e7f32113(sc, {
			order = n(), title = _Vzd({194,246,243,226,161,211,226,239,232,230}), min = 10, max = 200, default = S.auraRange or 50,
			stateKey = _Vzd({226,246,243,226,211,226,239,232,230}),
		})
		_Ve79e7f32113(sc, {
			order = n(), title = _Vzd({205,226,232,161,202,239,245,230,239,244,234,245,250}), min = 1, max = 500, default = S.lagIntensity or 150,
			tip = _Vzd({104,151,138,134,153,138,108,151,134,135,113,142,147,138,69,152,149,134,146,69,151,134,153,138,69,77,145,134,140,69,152,138,151,155,138,151,69,145,148,148,149,152,78}),
			stateKey = _Vzd({237,226,232,202,239,245,230,239,244,234,245,250}),
		})
		_Vbb4234fd160(sc, _Vzd({198,217,209,208,211,213,161,176,161,202,206,209,208,211,213}), n())
		_Vc79d533d10e(sc, {
			order = n(), title = _Vzd({198,249,241,240,243,245,161,196,240,239,231,234,232}),
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
					_V556c1dc412c(HUB_NAME, _Vzd({196,240,239,231,234,232,161,228,240,241,234,230,229,161,245,240,161,228,237,234,241,227,240,226,243,229}), 2)
				else
					_V556c1dc412c(HUB_NAME, _Vzd({106,157,149,148,151,153,69,139,134,142,145,138,137}), 2)
				end
			end,
		})
		_V9b23dd72110(sc, {
			order = n(), id = _Vzd({234,238,241,240,243,245,195,240,249}), placeholder = _Vzd({209,226,244,245,230,161,228,240,239,231,234,232,161,203,212,208,207,161,233,230,243,230,175,175,175}),
		})
		_Vc79d533d10e(sc, {
			order = n(), title = _Vzd({110,146,149,148,151,153,69,104,148,147,139,142,140}),
			callback = function()
				local box = S.importBox
				local txt = box and box.Text
				if not txt or txt == "" then
					_V556c1dc412c(HUB_NAME, _Vzd({117,134,152,153,138,69,111,120,116,115,69,139,142,151,152,153}), 1)
					return
				end
				local ok, data = pcall(function()
					return game.HttpService:JSONDecode(txt)
				end)
				if ok and type(data) == _Vzd({245,226,227,237,230}) then
					for k, v in pairs(data) do
						if k == _Vzd({153,141,138,146,138}) and type(v) == _Vzd({244,245,243,234,239,232}) then
							S.theme = v; _V7241708f22(v)
						elseif k == _Vzd({137,138,155,142,136,138}) and type(v) == _Vzd({244,245,243,234,239,232}) then
							S.device = v
						elseif type(v) == _Vzd({239,246,238,227,230,243}) then
							S[k] = v
						end
					end
					_V556c1dc412c(HUB_NAME, _Vzd({196,240,239,231,234,232,161,234,238,241,240,243,245,230,229,161,174,161,243,230,240,241,230,239,161,233,246,227,161,245,240,161,226,241,241,237,250}), 2)
				else
					_V556c1dc412c(HUB_NAME, _Vzd({110,147,155,134,145,142,137,69,111,120,116,115}), 2)
				end
			end,
		})
		_Vbb4234fd160(sc, _Vzd({194,214,213,208,161,206,208,197,198}), n())
		_Ve133dbec114(sc, {
			order = n(), id = _Vzd({226,246,245,240,206,240,229,230}), title = _Vzd({102,154,153,148,69,114,148,137,138,69,77,103,106,121,102,78}),
			tip = _Vzd({194,246,245,240,238,226,245,234,228,226,237,237,250,161,230,239,226,227,237,230,244,161,245,233,230,161,227,230,244,245,161,240,241,245,234,240,239,244,161,231,240,243,161,248,233,226,245,230,247,230,243,161,244,234,245,246,226,245,234,240,239,161,250,240,246,168,243,230,161,234,239}),
			callback = function(on)
				S.toggles.autoMode = on
				if on then
					if not S._autoModeConn then
						S._autoModeConn = {}
						table.insert(S._autoModeConn, RunService.Heartbeat:Connect(function()
							if not S.toggles.autoMode then return end
							local ch = LP.Character
							local h = ch and ch:FindFirstChildOfClass(_Vzd({201,246,238,226,239,240,234,229}))
							local hr = hrp()
							if not h or not hr then return end
							local r = hr
							local po = r and r:FindFirstChild(_Vzd({209,226,243,245,208,248,239,230,243}))
							if not po then
								for _, desc in ipairs(r and r:GetDescendants() or {}) do
									if desc.Name == _Vzd({209,226,243,245,208,248,239,230,243}) then po = desc; break end
								end
							end
							if po then
								S.toggles.escapeSpace = true
								if not S.conns.escapeJump then _Vd37f6786e1() end
								if S.autoCounter or S.toggles.autoCounter then
									local grabber = (po:IsA(_Vzd({208,227,235,230,228,245,215,226,237,246,230})) and po.Value) or nil
									if grabber and grabber:IsA(_Vzd({209,237,226,250,230,243})) and grabber ~= LP then
										task.spawn(function() _Vc54b5f4762(grabber) end)
									end
								end
							end
							if h.Health < h.MaxHealth * 0.3 and h.Health > 0 then
								if not S.toggles.antiKill then
									S.antiWanted = S.antiWanted or {}
									S.antiWanted.antiKill = true
									pcall(function() _V7414540719a() end)
								end
							end
						end))
						table.insert(S._autoModeConn, RunService.Heartbeat:Connect(function()
							if not S.toggles.autoMode then return end
							local me = hrp()
							if not me then return end
							local closest, dist = nil, 50
							for _, p in ipairs(_Vce96e951d()) do
								if _Vd6eb72811f9(p) then
									local r = _Vb2220e5a155(p)
									if r then
										local d = (r.Position - me.Position).Magnitude
										if d < dist then closest = p; dist = d end
									end
								end
							end
							if closest then
								_Vcc8279d692(closest, S.flingPower or 200, true)
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
		_Vbb4234fd160(sc, _Vzd({211,198,212,198,213}), n())
		_Vc79d533d10e(sc, {
			order = n(), title = _Vzd({119,138,152,138,153,69,102,145,145,69,120,138,153,153,142,147,140,152}),
			danger = true,
			callback = function()
				S.flingPower = 8000; S.auraRange = 50; S.walkSpeed = 50
				S.flySpeed = 80; S.jumpPower = 80; S.strengthMult = 1
				S.lagIntensity = 150; S.extendAmount = 25; S.silentFov = 150
				S.hubScale = 100; S.device = _Vzd({209,196}); S.theme = _Vzd({209,246,243,241,237,230})
				_V7241708f22(_Vzd({209,246,243,241,237,230}))
				_V556c1dc412c(HUB_NAME, _Vzd({194,237,237,161,244,230,245,245,234,239,232,244,161,243,230,244,230,245,161,245,240,161,229,230,231,226,246,237,245,244}), 2)
			end,
		})
end
local function _Vcf5dc7af3d(id, sc)
	S._buildingTab = id
	local o = 0
	local function n() o += 1; return o end
	local fn = _TAB_BUILDERS[id]
	if fn then fn(sc, n) end
end
local function _V6e73fa601bc(id)
	for tid, panel in pairs(S.panels) do
		panel.Visible = tid == id
		if tid == id then
			local sc = panel:FindFirstChildWhichIsA(_Vzd({212,228,243,240,237,237,234,239,232,199,243,226,238,230}), true)
			if sc then sc.CanvasPosition = Vector2.zero end
		end
	end
	for tid, btn in pairs(S.tabs) do
		local lab = S.tabLabels and S.tabLabels[tid]
		local badge = S.tabBadges and S.tabBadges[tid]
		local ts = S.tabStrokes and S.tabStrokes[tid]
		local bg = S.tabBadgeGlows and S.tabBadgeGlows[tid]
		if tid == id then
			btn:SetAttribute(_Vzd({226,228,245,234,247,230,213,226,227}), true)
			btn.BackgroundColor3 = C.accentDim
			btn.BackgroundTransparency = 0.05
			if lab then lab.TextColor3 = C.text end
			if badge then badge.BackgroundColor3 = C.accent end
			if ts then _V0db0d1111f5(ts, { Color = C.accent, Transparency = 0.15 }, 0.2) end
			if bg then _V0db0d1111f5(bg, { Color = C.accent, Transparency = 0.1, Thickness = 1.5 }, 0.2) end
		else
			btn:SetAttribute(_Vzd({226,228,245,234,247,230,213,226,227}), nil)
			btn.BackgroundColor3 = C.bg
			btn.BackgroundTransparency = 0.35
			if lab then lab.TextColor3 = C.muted end
			if badge then badge.BackgroundColor3 = C.accentDim end
			if ts then _V0db0d1111f5(ts, { Color = C.strokeSoft, Transparency = 0.6 }, 0.2) end
			if bg then _V0db0d1111f5(bg, { Color = C.accent, Transparency = 0.5, Thickness = 0.8 }, 0.2) end
		end
	end
	if S.hubOpen and S.toggles.unlockMouse ~= false then
		pcall(function()
			UserInputService.MouseBehavior = Enum.MouseBehavior.Default
			UserInputService.MouseIconEnabled = true
			if S.mouseModal then
				S.mouseModal.Visible = true
				S.mouseModal.Modal = true
			end
		end)
	end
end
S.savedMouseBehavior = S.savedMouseBehavior or Enum.MouseBehavior.LockCenter
S.savedCameraMode = S.savedCameraMode
S.hubOpen = true
S.hubAnimating = false
S.weUnlockedMouse = false
local MOUSE_FORCE_NAME = _Vzd({215,208,202,197,219,224,206,240,246,244,230,199,240,243,228,230})
local MOUSE_FORCE_NAME2 = _Vzd({123,116,110,105,127,132,114,148,154,152,138,107,148,151,136,138,106,134,151,145,158})
local function _V71a47cae1b2()
	S._mouseForceBound = false
	if S.mouseForceConn then
		pcall(function() S.mouseForceConn:Disconnect() end)
		S.mouseForceConn = nil
	end
	if S.mouseForceConn2 then
		pcall(function() S.mouseForceConn2:Disconnect() end)
		S.mouseForceConn2 = nil
	end
	pcall(function() RunService:UnbindFromRenderStep(MOUSE_FORCE_NAME) end)
	pcall(function() RunService:UnbindFromRenderStep(MOUSE_FORCE_NAME2) end)
end
local function _V79fd1f521c()
	pcall(function()
		UserInputService.MouseBehavior = Enum.MouseBehavior.Default
		UserInputService.MouseIconEnabled = true
	end)
	pcall(function()
		if LP.CameraMode == Enum.CameraMode.LockFirstPerson then
			if S.savedCameraMode == nil then
				S.savedCameraMode = Enum.CameraMode.LockFirstPerson
			end
			LP.CameraMode = Enum.CameraMode.Classic
		end
	end)
end
local function _Vf09b6fb779(on)
	on = on == true
	local parent = nil
	pcall(function()
		if S.gui and S.gui.Parent then parent = S.gui.Parent end
	end)
	if not parent then
		pcall(function() parent = _V90e443b5bd() end)
	end
	if not parent then return end
	local sg = S.mouseUnlockGui
	if not sg or not sg.Parent then
		sg = Instance.new(_Vzd({212,228,243,230,230,239,200,246,234}))
		sg.Name = _Vzd({215,208,202,197,219,224,206,240,246,244,230,214,239,237,240,228,236})
		sg.ResetOnSpawn = false
		sg.IgnoreGuiInset = true
		sg.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
		sg.DisplayOrder = 99990
		sg.Enabled = true
		sg.Parent = parent
		S.mouseUnlockGui = sg
	end
	sg.Enabled = on
	local m = S.mouseModal
	if not m or not m.Parent or m.Parent ~= sg then
		if m then pcall(function() m:Destroy() end) end
		m = Instance.new(_Vzd({213,230,249,245,195,246,245,245,240,239}))
		m.Name = _Vzd({215,208,202,197,219,224,206,240,246,244,230,206,240,229,226,237})
		m.BackgroundTransparency = 1
		m.Text = ""
		m.BorderSizePixel = 0
		m.Size = UDim2.fromScale(1, 1)
		m.Position = UDim2.fromScale(0, 0)
		m.AutoButtonColor = false
		m.Selectable = false
		m.Active = false
		m.ZIndex = 1
		m.Parent = sg
		S.mouseModal = m
	end
	m.Visible = on
	m.Modal = on
	if on then
		m.Modal = false
		m.Modal = true
	end
end
local function _V63e1d243175(unlocked)
	if _V9a51b584f9() then
		_V71a47cae1b2()
		pcall(_Vf09b6fb779, false)
		_V79fd1f521c()
		return
	end
	pcall(function()
		if unlocked then
			if not S.weUnlockedMouse then
				local cur = UserInputService.MouseBehavior
				if cur == Enum.MouseBehavior.LockCenter or cur == Enum.MouseBehavior.LockCurrentPosition then
					S.savedMouseBehavior = cur
				else
					S.savedMouseBehavior = Enum.MouseBehavior.LockCenter
				end
				pcall(function() S.savedCameraMode = LP.CameraMode end)
				S.weUnlockedMouse = true
			end
			_Vf09b6fb779(true)
			_V79fd1f521c()
			local function tickFree()
				if not S.hubOpen or S.toggles.unlockMouse == false then return end
				if not S.root or not S.root.Parent then return end
				S._mouseTickN = (S._mouseTickN or 0) + 1
				if S._mouseTickN % 3 ~= 0 then return end
				if UserInputService.MouseBehavior ~= Enum.MouseBehavior.Default
					or UserInputService.MouseIconEnabled ~= true then
					_V79fd1f521c()
				end
				local m = S.mouseModal
				if m and (not m.Modal or not m.Visible) then
					m.Visible = true
					m.Modal = true
				end
			end
			if not S._mouseForceBound then
				S._mouseForceBound = true
				pcall(function()
					RunService:BindToRenderStep(
						MOUSE_FORCE_NAME,
						Enum.RenderPriority.Last.Value + 100,
						tickFree
					)
				end)
			end
		else
			S.weUnlockedMouse = false
			_V71a47cae1b2()
			_Vf09b6fb779(false)
			local target = Enum.MouseBehavior.LockCenter
			if S.savedMouseBehavior == Enum.MouseBehavior.LockCurrentPosition then
				target = Enum.MouseBehavior.LockCurrentPosition
			end
			pcall(function()
				UserInputService.MouseBehavior = target
				UserInputService.MouseIconEnabled = false
			end)
			pcall(function()
				if S.savedCameraMode ~= nil then
					LP.CameraMode = S.savedCameraMode
				end
			end)
			local untilT = os.clock() + 0.55
			S.mouseForceConn = RunService.Heartbeat:Connect(function()
				if S.hubOpen and S.toggles.unlockMouse ~= false and S.root and S.root.Parent then
					_V71a47cae1b2()
					_V63e1d243175(true)
					return
				end
				pcall(function()
					UserInputService.MouseBehavior = target
					UserInputService.MouseIconEnabled = false
				end)
				if os.clock() >= untilT then
					_V71a47cae1b2()
				end
			end)
		end
	end)
end
S._V63e1d243175 = _V63e1d243175
local function _V6e8082ced6()
	return UDim2.fromOffset(S.mainW or 660, S.mainH or 450)
end
local function _V1a9b8228170(open)
	if not S.root then return end
	open = open == true
	if S.hubAnimating and open == S.hubOpen then
		if open and S.toggles.unlockMouse ~= false then
			_V63e1d243175(true)
		end
		return
	end
	S.hubOpen = open
	local root = S.root
	S.hubAnimating = true
	if S.hubOpen then
		root.Visible = true
		root.Size = UDim2.fromOffset(40, 40)
		root.BackgroundTransparency = 0.5
		_V0db0d1111f5(root, { Size = _V6e8082ced6(), BackgroundTransparency = 0 }, 0.4, Enum.EasingStyle.Quint)
		pcall(_Vbd03d77e177, true)
		if S.toggles.unlockMouse ~= false then
			_V63e1d243175(true)
		end
		if S.syncMobileChrome then S.syncMobileChrome() end
		task.delay(0.42, function()
			S.hubAnimating = false
			if S.hubOpen and S.toggles.unlockMouse ~= false then
				_V63e1d243175(true)
			end
		end)
	else
		S.hubOpen = false
		pcall(_Vbd03d77e177, false)
		_V63e1d243175(false)
		_V0db0d1111f5(root, { Size = UDim2.fromOffset(40, 40), BackgroundTransparency = 0.6 }, 0.28, Enum.EasingStyle.Quad)
		if S.syncMobileChrome then S.syncMobileChrome() end
		task.delay(0.28, function()
			if S.root then S.root.Visible = false end
			S.hubAnimating = false
			if S.syncMobileChrome then S.syncMobileChrome() end
			if not S.hubOpen then
				_V63e1d243175(false)
				pcall(_Vbd03d77e177, false)
			elseif S.toggles.unlockMouse ~= false then
				_V63e1d243175(true)
			end
		end)
	end
end
local function _V2e69fe2d1dd()
	_V1a9b8228170(not S.hubOpen)
end
local function _Va2cb3a6c102(name)
	name = tostring(name or "")
	local ok, k = pcall(function() return Enum.KeyCode[name] end)
	if ok and k then return k end
	return nil
end
local function _Vb8982797e2()
	_V64544f4b29(_Vzd({236,230,250,227,234,239,229,244}), UserInputService.InputBegan:Connect(function(input, gp)
		if gp then return end
		if input.UserInputType ~= Enum.UserInputType.Keyboard then return end
		local code = input.KeyCode
		if code == Enum.KeyCode.RightShift then
			if S.toggles.kb_toggleUI ~= false then _V2e69fe2d1dd() end
			return
		end
		local function pressed(name)
			local e = _Va2cb3a6c102(name)
			return e and code == e
		end
		if S.toggles.kb_flingAura and pressed(S.keybinds and S.keybinds.aura_fling or "F") then
			S.toggles.aura_fling = not S.toggles.aura_fling
			_Ve239e5a8164(_Vzd({231,237,234,239,232}), S.toggles.aura_fling == true)
			_V556c1dc412c(HUB_NAME, _Vzd({107,145,142,147,140,69,134,154,151,134,69}) .. (S.toggles.aura_fling and _Vzd({208,207}) or _Vzd({208,199,199})), 1)
		elseif S.toggles.kb_netown and pressed(S.keybinds and S.keybinds.aura_netown or "G") then
			S.toggles.aura_netown = not S.toggles.aura_netown
			_Ve239e5a8164(_Vzd({239,230,245,240,248,239}), S.toggles.aura_netown == true)
			_V556c1dc412c(HUB_NAME, _Vzd({115,138,153,69,148,156,147,69}) .. (S.toggles.aura_netown and _Vzd({208,207}) or _Vzd({208,199,199})), 1)
		elseif S.toggles.kb_antiGrab and pressed(S.keybinds and S.keybinds.antiGrab or "H") then
			S.toggles.antiGrab = not S.toggles.antiGrab
			_V11a5d4671af(_Vzd({226,239,245,234,200,243,226,227}))
			if S.toggles.antiGrab then _V53fa917f1a2(_Vzd({226,239,245,234,200,243,226,227}), 0.1, _V4b82310314) end
			_V556c1dc412c(HUB_NAME, _Vzd({102,147,153,142,82,140,151,134,135,69}) .. (S.toggles.antiGrab and _Vzd({208,207}) or _Vzd({208,199,199})), 1)
		elseif S.toggles.kb_fly and pressed(S.keybinds and S.keybinds.fly or "V") then
			S.toggles.fly = not S.toggles.fly
			_Va9d755db16e(S.toggles.fly == true)
		elseif S.toggles.kb_noclip and pressed(S.keybinds and S.keybinds.noclip or "N") then
			S.toggles.noclip = not S.toggles.noclip
		elseif S.toggles.kb_reach and pressed(S.keybinds and S.keybinds.lineExtend or "R") then
			S.toggles.lineExtend = not S.toggles.lineExtend
			_Ve69c958f172(S.toggles.lineExtend == true)
		elseif S.toggles.kb_pallet and pressed(S.keybinds and S.keybinds.pallet or "Q") then
			if S.toggles.palletQ or S.toggles.kb_pallet then
				if not FTAP.SpawnToy then pcall(_V6c6a3f4314a) end
				if FTAP.SpawnToy then
					_Vd788f8c8197(_Vzd({209,226,237,237,230,245,205,234,232,233,245,195,243,240,248,239}), { sync = true })
				else
					_Vd788f8c8197(_Vzd({209,226,237,237,230,245,205,234,232,233,245,195,243,240,248,239}))
				end
			end
		elseif S.toggles.kb_flingNear and pressed(S.keybinds and S.keybinds.flingNear or "T") then
			local me = hrp()
			if me then
				local best, bd = nil, 1e9
				for _, p in ipairs(Players:GetPlayers()) do
					if _Vd6eb72811f9(p) then
						local d = (_Vb2220e5a155(p).Position - me.Position).Magnitude
						if d < bd then best, bd = p, d end
					end
				end
				if best then _Vcc8279d692(best, S.flingPower, false, true) end
			end
		elseif S.toggles.kb_stomp and pressed(S.keybinds and S.keybinds.aura_stomp or "Y") then
			S.toggles.aura_stomp = not S.toggles.aura_stomp
			_Ve239e5a8164(_Vzd({152,153,148,146,149}), S.toggles.aura_stomp == true)
		elseif S.toggles.kb_orbit and pressed(S.keybinds and S.keybinds.aura_orbit or "O") then
			S.toggles.aura_orbit = not S.toggles.aura_orbit
			_Ve239e5a8164(_Vzd({148,151,135,142,153}), S.toggles.aura_orbit == true)
		elseif pressed("U") then
			local char = LP.Character
			if char then
				local LIMB_PARTS = { _Vzd({211,234,232,233,245,161,194,243,238}), _Vzd({205,230,231,245,161,194,243,238}), _Vzd({211,234,232,233,245,161,205,230,232}), _Vzd({205,230,231,245,161,205,230,232}), _Vzd({201,230,226,229}) }
				local r = char:FindFirstChild(_Vzd({201,246,238,226,239,240,234,229,211,240,240,245,209,226,243,245}))
				for _, d in ipairs(char:GetDescendants()) do
					if d:IsA(_Vzd({206,240,245,240,243,183,197})) then pcall(function() d:Destroy() end) end
				end
				for _, partName in ipairs(LIMB_PARTS) do
					local part = char:FindFirstChild(partName)
					if part and part:IsA(_Vzd({195,226,244,230,209,226,243,245})) then
						pcall(function()
							local dir = (part.Position - (r and r.Position or part.Position))
							if dir.Magnitude < 0.1 then dir = Vector3.new(math.random(-1,1), 1, math.random(-1,1)).Unit end
							part.AssemblyLinearVelocity = dir.Unit * 1500
						end)
					end
				end
				_V556c1dc412c(HUB_NAME, _Vzd({205,234,238,227,244,161,243,234,241,241,230,229,161,240,231,231}), 1)
			end
		elseif S.toggles.kb_serverFling and pressed(S.keybinds and S.keybinds.srv_fling or "J") then
			S.toggles.srv_fling = not S.toggles.srv_fling
			_V46c59b4f178(_Vzd({231,237,234,239,232}), S.toggles.srv_fling == true)
		end
	end))
end
local function _V3df536df12a()
	local me = hrp()
	if not me then return nil end
	local best, bd = nil, 1e9
	for _, p in ipairs(Players:GetPlayers()) do
		if _Vd6eb72811f9(p) then
			local r = _Vb2220e5a155(p)
			if r then
				local d = (r.Position - me.Position).Magnitude
				if d < bd then best, bd = p, d end
			end
		end
	end
	return best
end
local function _V0d7d2d243c(sg)
	if not _V9a51b584f9() or not sg then return end
	S.mobileHudBtns = {}
	local menu = Instance.new(_Vzd({213,230,249,245,195,246,245,245,240,239}))
	menu.Name = _Vzd({114,148,135,142,145,138,114,138,147,154})
	menu.AnchorPoint = Vector2.new(0, 0)
	menu.Position = UDim2.new(0, 14, 0, 52)
	menu.Size = UDim2.fromOffset(72, 36)
	menu.BackgroundColor3 = C.bg2
	menu.BackgroundTransparency = 0.08
	menu.BorderSizePixel = 0
	menu.Font = Enum.Font.GothamBold
	menu.TextSize = 13
	menu.TextColor3 = C.text
	menu.Text = _Vzd({206,198,207,214})
	menu.AutoButtonColor = false
	menu.ZIndex = 200
	menu.Parent = sg
	_Ve7cf4e7f5f(menu, 10)
	_Vb145617c1ba(menu, C.accent, 1.25, 0.25)
	S.mobileMenuBtn = menu
	menu.MouseButton1Click:Connect(function()
		_V2e69fe2d1dd()
	end)
	local actionPad = Instance.new(_Vzd({199,243,226,238,230}))
	actionPad.Name = _Vzd({206,240,227,234,237,230,209,226,229})
	actionPad.AnchorPoint = Vector2.new(1, 0.5)
	actionPad.Position = UDim2.new(1, -12, 0.55, 0)
	actionPad.Size = UDim2.fromOffset(76, 0)
	actionPad.AutomaticSize = Enum.AutomaticSize.Y
	actionPad.BackgroundColor3 = C.bg2
	actionPad.BackgroundTransparency = 0.12
	actionPad.BorderSizePixel = 0
	actionPad.ZIndex = 190
	actionPad.Parent = sg
	_Ve7cf4e7f5f(actionPad, 12)
	_Vb145617c1ba(actionPad, C.strokeSoft, 1.1, 0.3)
	S.mobilePad = actionPad
	local padLay = Instance.new(_Vzd({214,202,205,234,244,245,205,226,250,240,246,245}))
	padLay.Padding = UDim.new(0, 5)
	padLay.HorizontalAlignment = Enum.HorizontalAlignment.Center
	padLay.SortOrder = Enum.SortOrder.LayoutOrder
	padLay.Parent = actionPad
	pad(actionPad, 7, 6, 7, 6)
	local function styleBtn(b, on)
		if on then
			b.BackgroundColor3 = C.accentDim
			local s = b:FindFirstChildOfClass(_Vzd({214,202,212,245,243,240,236,230}))
			if s then s.Color = C.accent; s.Transparency = 0.15 end
		else
			b.BackgroundColor3 = C.card
			local s = b:FindFirstChildOfClass(_Vzd({214,202,212,245,243,240,236,230}))
			if s then s.Color = C.strokeSoft; s.Transparency = 0.4 end
		end
	end
	local function addPadBtn(order, label, opts)
		opts = opts or {}
		local b = Instance.new(_Vzd({213,230,249,245,195,246,245,245,240,239}))
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
		_Ve7cf4e7f5f(b, 8)
		_Vb145617c1ba(b, opts.danger and C.dangerStroke or C.strokeSoft, 1, 0.4)
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
	addPadBtn(1, _Vzd({209,194,205,205,198,213}), { onPress = function() _Vd788f8c8197(S.selectedToy or _Vzd({209,226,237,237,230,245,205,234,232,233,245,195,243,240,248,239})) end })
	addPadBtn(2, _Vzd({199,205,218}), {
		toggleKey = _Vzd({231,237,250}),
		onPress = function()
			S.toggles.fly = not S.toggles.fly
			_Va9d755db16e(S.toggles.fly == true)
		end,
	})
	addPadBtn(3, _Vzd({207,208,196,205,202,209}), {
		toggleKey = _Vzd({239,240,228,237,234,241}),
		onPress = function() S.toggles.noclip = not S.toggles.noclip end,
	})
	addPadBtn(4, _Vzd({194,207,213,202}), {
		toggleKey = _Vzd({226,239,245,234,200,243,226,227}),
		onPress = function()
			S.toggles.antiGrab = not S.toggles.antiGrab
			S.antiWanted = S.antiWanted or {}
			S.antiWanted.antiGrab = S.toggles.antiGrab
			_V11a5d4671af(_Vzd({226,239,245,234,200,243,226,227}))
			if S.toggles.antiGrab then _V53fa917f1a2(_Vzd({226,239,245,234,200,243,226,227}), 0.1, _V4b82310314) end
		end,
	})
	addPadBtn(5, _Vzd({199,205,202,207,200}), {
		toggleKey = _Vzd({134,154,151,134,132,139,145,142,147,140}),
		onPress = function()
			S.toggles.aura_fling = not S.toggles.aura_fling
			_Ve239e5a8164(_Vzd({231,237,234,239,232}), S.toggles.aura_fling == true)
		end,
	})
	addPadBtn(6, _Vzd({213,201,211,208,216}), {
		onPress = function()
			local p = S.selected or _V3df536df12a()
			if p then _Vcc8279d692(p, S.flingPower, false, true)
			else _V556c1dc412c(HUB_NAME, _Vzd({207,240,161,245,226,243,232,230,245}), 1) end
		end,
	})
	addPadBtn(7, _Vzd({204,202,205,205}), {
		danger = true,
		onPress = function()
			local p = S.selected or _V3df536df12a()
			if p then _V62e4aa89105(p, true)
			else _V556c1dc412c(HUB_NAME, _Vzd({207,240,161,245,226,243,232,230,245}), 1) end
		end,
	})
	local bot = Instance.new(_Vzd({107,151,134,146,138}))
	bot.Name = _Vzd({206,240,227,234,237,230,195,240,245,245,240,238})
	bot.AnchorPoint = Vector2.new(0.5, 1)
	bot.Position = UDim2.new(0.5, 0, 1, -18)
	bot.Size = UDim2.fromOffset(0, 44)
	bot.AutomaticSize = Enum.AutomaticSize.X
	bot.BackgroundColor3 = C.bg2
	bot.BackgroundTransparency = 0.1
	bot.BorderSizePixel = 0
	bot.ZIndex = 190
	bot.Parent = sg
	_Ve7cf4e7f5f(bot, 12)
	_Vb145617c1ba(bot, C.strokeSoft, 1.1, 0.3)
	S.mobileBot = bot
	local botLay = Instance.new(_Vzd({214,202,205,234,244,245,205,226,250,240,246,245}))
	botLay.FillDirection = Enum.FillDirection.Horizontal
	botLay.Padding = UDim.new(0, 6)
	botLay.HorizontalAlignment = Enum.HorizontalAlignment.Center
	botLay.VerticalAlignment = Enum.VerticalAlignment.Center
	botLay.SortOrder = Enum.SortOrder.LayoutOrder
	botLay.Parent = bot
	pad(bot, 5, 8, 5, 8)
	local function addBot(order, text, danger, fn)
		local b = Instance.new(_Vzd({213,230,249,245,195,246,245,245,240,239}))
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
		_Ve7cf4e7f5f(b, 8)
		_Vb145617c1ba(b, danger and C.dangerStroke or C.strokeSoft, 1, 0.35)
		b.MouseButton1Click:Connect(function() pcall(fn) end)
	end
	addBot(1, _Vzd({195,211,202,207,200}), false, function()
		local p = S.selected or _V3df536df12a()
		if p then _V702f278238(p) else _V556c1dc412c(HUB_NAME, _Vzd({207,240,161,245,226,243,232,230,245}), 1) end
	end)
	addBot(2, _Vzd({198,212,196,194,209,198}), false, function()
		if _Vecdf7277a8 then _Vecdf7277a8()
		elseif _V48738c7e6b then _V48738c7e6b() end
	end)
	addBot(3, _Vzd({201,208,214,212,198}), false, function()
		if S.toggles.antiKill then _Va7283ef61aa() else _V7414540719a() end
	end)
	addBot(4, _Vzd({195,205,208,195}), true, function()
		task.spawn(function() pcall(_V903a73872f) end)
	end)
	local function syncMobileChrome()
		local hubVis = S.hubOpen and S.root and S.root.Visible
		if actionPad then actionPad.Visible = not hubVis end
		if bot then bot.Visible = not hubVis end
		if menu then menu.Text = hubVis and _Vzd({201,202,197,198}) or _Vzd({206,198,207,214}) end
	end
	S.syncMobileChrome = syncMobileChrome
	syncMobileChrome()
end
function _Vb50e317c3b()
	_V6c6a3f4314a()
	S.toggles.unlockMouse = true
	S.toggles.freeCamMass = false
	S.toggles.kb_toggleUI = true
	S.antiWanted = S.antiWanted or {}
	pcall(function()
		if S.toggles.antiVoiceBan ~= false then
			_Vf9e514a7da(true)
		end
	end)
	if S.device ~= _Vzd({206,240,227,234,237,230}) and UserInputService.TouchEnabled and not UserInputService.KeyboardEnabled then
		S.device = _Vzd({206,240,227,234,237,230})
		S.toggles.mobileUI = true
	end
	local mobile = _V9a51b584f9()
	local parent = _V90e443b5bd()
	local old = parent:FindFirstChild(_Vzd({215,208,202,197,219,224,201,214,195})); if old then old:Destroy() end
	local sg = Instance.new(_Vzd({212,228,243,230,230,239,200,246,234}))
	sg.Name = _Vzd({215,208,202,197,219,224,201,214,195})
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
	local toast = Instance.new(_Vzd({199,243,226,238,230}))
	toast.AnchorPoint = Vector2.new(1, 0)
	toast.Position = UDim2.new(1, -16, 0, mobile and 96 or 18)
	toast.Size = UDim2.fromOffset(mobile and 260 or 240, 50)
	toast.BackgroundColor3 = C.bg2
	toast.BackgroundTransparency = 0.05
	toast.Visible = false
	toast.BorderSizePixel = 0
	toast.Parent = sg
	_Ve7cf4e7f5f(toast, 12)
	_Vb145617c1ba(toast, C.accent, 1.1, 0.35)
	local tt = Instance.new(_Vzd({213,230,249,245,205,226,227,230,237}))
	tt.BackgroundTransparency = 1
	tt.Size = UDim2.new(1, -16, 0, 16)
	tt.Position = UDim2.fromOffset(12, 7)
	tt.Font = Enum.Font.GothamBold
	tt.TextSize = 12
	tt.TextColor3 = C.accent2
	tt.TextXAlignment = Enum.TextXAlignment.Left
	tt.Text = HUB_NAME
	tt.Parent = toast
	local tb = Instance.new(_Vzd({213,230,249,245,205,226,227,230,237}))
	tb.BackgroundTransparency = 1
	tb.Size = UDim2.new(1, -16, 0, 18)
	tb.Position = UDim2.fromOffset(12, 24)
	tb.Font = Enum.Font.Gotham
	tb.TextSize = 11
	tb.TextColor3 = C.text
	tb.TextXAlignment = Enum.TextXAlignment.Left
	tb.Text = ""
	tb.Parent = toast
	S._V556c1dc412c = { Frame = toast, Title = tt, Body = tb }
	local tip = Instance.new(_Vzd({199,243,226,238,230}))
	tip.AnchorPoint = Vector2.new(0, 1)
	tip.Position = UDim2.new(0, 14, 1, mobile and -68 or -14)
	tip.Size = UDim2.fromOffset(mobile and math.min(vw - 28, 300) or 300, 44)
	tip.BackgroundColor3 = C.tip
	tip.BackgroundTransparency = 0.05
	tip.Visible = false
	tip.BorderSizePixel = 0
	tip.Parent = sg
	_Ve7cf4e7f5f(tip, 10)
	_Vb145617c1ba(tip, C.strokeSoft, 1, 0.4)
	local tipL = Instance.new(_Vzd({213,230,249,245,205,226,227,230,237}))
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
	local root = Instance.new(_Vzd({199,243,226,238,230}))
	root.Name = _Vzd({211,240,240,245})
	root.AnchorPoint = Vector2.new(0.5, 0.5)
	root.Position = UDim2.fromScale(0.5, mobile and 0.46 or 0.5)
	root.Size = UDim2.fromOffset(0, 0)
	root.BackgroundColor3 = C.bg
	root.BorderSizePixel = 0
	root.ClipsDescendants = true
	root.Parent = sg
	S.root = root
	_Ve7cf4e7f5f(root, 16)
	local rootStroke = _Vb145617c1ba(root, C.accent, 1.35, 0.2)
	_V2e8e03d1c0(root, C.bg2, C.bg, 125)
	_V0db0d1111f5(root, { Size = _V6e8082ced6() }, 0.4, Enum.EasingStyle.Quint)
	task.spawn(function()
		local glow = rootStroke
		while root.Parent do
			if S.hubOpen then
				_V0db0d1111f5(glow, { Transparency = 0.08 }, 2.2, Enum.EasingStyle.Sine)
				task.wait(2.2)
				_V0db0d1111f5(glow, { Transparency = 0.35 }, 2.2, Enum.EasingStyle.Sine)
				task.wait(2.2)
			else
				task.wait(1.2)
			end
		end
	end)
	local headerH = mobile and 48 or 44
	local header = Instance.new(_Vzd({107,151,134,146,138}))
	header.Size = UDim2.new(1, 0, 0, headerH)
	header.BackgroundColor3 = C.bg2
	header.BackgroundTransparency = 0.15
	header.BorderSizePixel = 0
	header.ZIndex = 5
	header.Parent = root
	local top = Instance.new(_Vzd({199,243,226,238,230}))
	top.Size = UDim2.new(1, 0, 0, 3)
	top.BackgroundColor3 = Color3.new(1, 1, 1)
	top.BorderSizePixel = 0
	top.ZIndex = 6
	top.Parent = header
	local topGrad = Instance.new(_Vzd({214,202,200,243,226,229,234,230,239,245}))
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
			if S.hubOpen then
				rot = (rot + 2) % 360
				topGrad.Rotation = rot
			end
			task.wait(0.08)
		end
	end)
	local glowLine = Instance.new(_Vzd({107,151,134,146,138}))
	glowLine.Size = UDim2.new(1, 0, 0, 8)
	glowLine.Position = UDim2.new(0, 0, 0, 3)
	glowLine.BackgroundTransparency = 0.7
	glowLine.BackgroundColor3 = C.accent
	glowLine.BorderSizePixel = 0
	glowLine.ZIndex = 6
	glowLine.Parent = header
	_Ve7cf4e7f5f(glowLine, 0)
	local glowGrad = Instance.new(_Vzd({122,110,108,151,134,137,142,138,147,153}))
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
	logo.Text = _Vzd({215,208,202,197,219})
	logo.ZIndex = 7
	logo.Parent = header
	local logoGrad = Instance.new(_Vzd({214,202,200,243,226,229,234,230,239,245}))
	logoGrad.Color = ColorSequence.new({
		ColorSequenceKeypoint.new(0, C.accent2 or C.accent),
		ColorSequenceKeypoint.new(0.5, Color3.new(1, 1, 1)),
		ColorSequenceKeypoint.new(1, C.accent),
	})
	logoGrad.Rotation = 30
	logoGrad.Parent = logo
	local status = Instance.new(_Vzd({213,230,249,245,205,226,227,230,237}))
	status.BackgroundTransparency = 1
	status.Size = UDim2.new(0, 72, 0, 20)
	status.Position = UDim2.new(1, mobile and -118 or -112, 0.5, -10)
	status.Font = Enum.Font.GothamMedium
	status.TextSize = 10
	status.TextColor3 = C.muted
	status.TextXAlignment = Enum.TextXAlignment.Center
	status.Text = FTAP.ok and _Vzd({199,213,194,209}) or "..."
	status.ZIndex = 7
	status.Parent = header
	local statusBg = Instance.new(_Vzd({199,243,226,238,230}))
	statusBg.Size = UDim2.fromOffset(72, 22)
	statusBg.Position = UDim2.new(1, mobile and -118 or -112, 0.5, -11)
	statusBg.BackgroundColor3 = C.card
	statusBg.BackgroundTransparency = 0.25
	statusBg.BorderSizePixel = 0
	statusBg.ZIndex = 6
	statusBg.Parent = header
	_Ve7cf4e7f5f(statusBg, 7)
	_Vb145617c1ba(statusBg, C.strokeSoft, 1, 0.5)
	status.Parent = header
	S.status = status
	local close = Instance.new(_Vzd({213,230,249,245,195,246,245,245,240,239}))
	local closeS = mobile and 32 or 28
	close.Size = UDim2.fromOffset(closeS, closeS)
	close.Position = UDim2.new(1, -(closeS + 10), 0.5, -closeS / 2)
	close.BackgroundColor3 = C.card
	close.Text = "x"
	close.TextColor3 = C.muted
	close.Font = Enum.Font.GothamBold
	close.TextSize = mobile and 16 or 15
	close.ZIndex = 8
	close.AutoButtonColor = false
	close.Parent = header
	_Ve7cf4e7f5f(close, 8)
	local closeStroke = _Vb145617c1ba(close, C.strokeSoft, 1, 0.45)
	close.MouseButton1Click:Connect(function() _V1a9b8228170(false) end)
	close.MouseEnter:Connect(function()
		_V0db0d1111f5(close, { BackgroundColor3 = C.danger, BackgroundTransparency = 0 }, 0.15)
		_V0db0d1111f5(closeStroke, { Color = C.dangerText or C.danger, Transparency = 0 }, 0.15)
		_V0db0d1111f5(close, { TextColor3 = Color3.new(1, 1, 1) }, 0.15)
	end)
	close.MouseLeave:Connect(function()
		_V0db0d1111f5(close, { BackgroundColor3 = C.card, BackgroundTransparency = 0 }, 0.2)
		_V0db0d1111f5(closeStroke, { Color = C.strokeSoft, Transparency = 0.45 }, 0.2)
		_V0db0d1111f5(close, { TextColor3 = C.muted }, 0.2)
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
	local side = Instance.new(_Vzd({120,136,151,148,145,145,142,147,140,107,151,134,146,138}))
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
	_Ve7cf4e7f5f(side, 12)
	local sideStroke = _Vb145617c1ba(side, C.strokeSoft, 1.2, 0.4)
	task.spawn(function()
		while side.Parent do
			if S.hubOpen then
				_V0db0d1111f5(sideStroke, { Color = C.accent, Transparency = 0.2 }, 2, Enum.EasingStyle.Sine)
				task.wait(2)
				_V0db0d1111f5(sideStroke, { Color = C.strokeSoft, Transparency = 0.5 }, 2, Enum.EasingStyle.Sine)
				task.wait(2)
			else
				task.wait(0.5)
			end
		end
	end)
	local sideLay = Instance.new(_Vzd({214,202,205,234,244,245,205,226,250,240,246,245}))
	sideLay.Padding = UDim.new(0, 4)
	sideLay.SortOrder = Enum.SortOrder.LayoutOrder
	sideLay.Parent = side
	pad(side, 6, 6, 6, 6)
	local content = Instance.new(_Vzd({199,243,226,238,230}))
	content.Size = UDim2.new(1, -(sideW + gap * 3), 1, -(contentTop + gap))
	content.Position = UDim2.fromOffset(sideW + gap * 2, contentTop)
	content.BackgroundColor3 = C.bg2
	content.BackgroundTransparency = 0.25
	content.BorderSizePixel = 0
	content.ClipsDescendants = true
	content.ZIndex = 4
	content.Parent = root
	_Ve7cf4e7f5f(content, 12)
	_Vb145617c1ba(content, C.strokeSoft, 1, 0.5)
	local contentGrad = Instance.new(_Vzd({214,202,200,243,226,229,234,230,239,245}))
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
		local btn = Instance.new(_Vzd({213,230,249,245,195,246,245,245,240,239}))
		btn.LayoutOrder = i
		btn.Size = UDim2.new(1, 0, 0, mobile and 38 or 30)
		btn.BackgroundColor3 = C.bg
		btn.BackgroundTransparency = 0.35
		btn.BorderSizePixel = 0
		btn.Text = ""
		btn.AutoButtonColor = false
		btn.ZIndex = 5
		btn.Parent = side
		_Ve7cf4e7f5f(btn, 8)
		local btnStroke = _Vb145617c1ba(btn, C.strokeSoft, 0.8, 0.6)
		btn.MouseEnter:Connect(function()
			_V0db0d1111f5(btn, { BackgroundTransparency = 0.15 }, 0.15)
			_V0db0d1111f5(btnStroke, { Color = C.accent, Transparency = 0.3 }, 0.15)
		end)
		btn.MouseLeave:Connect(function()
			if S.tabs[def.id] ~= btn or not btn:GetAttribute(_Vzd({226,228,245,234,247,230,213,226,227})) then
				_V0db0d1111f5(btn, { BackgroundTransparency = 0.35 }, 0.15)
				_V0db0d1111f5(btnStroke, { Color = C.strokeSoft, Transparency = 0.6 }, 0.15)
			end
		end)
		local badge = Instance.new(_Vzd({199,243,226,238,230}))
		local bs = mobile and 22 or 20
		badge.Size = UDim2.fromOffset(bs, bs)
		badge.Position = UDim2.fromOffset(5, (mobile and 38 or 30) / 2 - bs / 2)
		badge.BackgroundColor3 = C.accentDim
		badge.BackgroundTransparency = 0.15
		badge.BorderSizePixel = 0
		badge.ZIndex = 6
		badge.Parent = btn
		_Ve7cf4e7f5f(badge, 6)
		local badgeGlow = _Vb145617c1ba(badge, C.accent, 0.8, 0.5)
		local badgeTx = Instance.new(_Vzd({213,230,249,245,205,226,227,230,237}))
		badgeTx.BackgroundTransparency = 1
		badgeTx.Size = UDim2.fromScale(1, 1)
		badgeTx.Font = Enum.Font.GothamBold
		badgeTx.TextSize = mobile and 10 or 9
		badgeTx.TextColor3 = C.text
		badgeTx.Text = def.icon
		badgeTx.ZIndex = 7
		badgeTx.Parent = badge
		local lab = Instance.new(_Vzd({213,230,249,245,205,226,227,230,237}))
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
		btn:SetAttribute(_Vzd({121,134,135,110,137}), def.id)
		S.tabs[def.id] = btn
		S.tabLabels = S.tabLabels or {}
		S.tabLabels[def.id] = lab
		S.tabBadges = S.tabBadges or {}
		S.tabBadges[def.id] = badge
		S.tabStrokes = S.tabStrokes or {}
		S.tabStrokes[def.id] = btnStroke
		S.tabBadgeGlows = S.tabBadgeGlows or {}
		S.tabBadgeGlows[def.id] = badgeGlow
		local panel = Instance.new(_Vzd({199,243,226,238,230}))
		panel.Name = def.id
		panel.Size = UDim2.fromScale(1, 1)
		panel.BackgroundTransparency = 1
		panel.Visible = false
		panel.ZIndex = 5
		panel.Parent = content
		S.panels[def.id] = panel
		local sc = _V5721177e112(panel)
		local ok, err = pcall(_Vcf5dc7af3d, def.id, sc)
		if not ok then warn(_Vzd({220,215,208,202,197,219,222,161,245,226,227,161})..def.id, err) end
		btn.MouseButton1Click:Connect(function() _V6e73fa601bc(def.id) end)
	end
	S._buildingTab = nil
	_V6e73fa601bc(_Vzd({233,240,238,230}))
	_Vbd03d77e177(true)
	S.toggles.kb_toggleUI = true
	_Vb8982797e2()
	_Vd3e2addedc(true, true)
	S.escapeSpace = false
	S.toggles.escapeSpace = false
	if mobile then
		_V0d7d2d243c(sg)
	end
	S.hubOpen = true
	S.toggles.invisLine = false
	pcall(_V3960c60777)
	S.toggles.unlockMouse = true
	pcall(_V63e1d243175, true)
	task.defer(function()
		if S.hubOpen and S.toggles.unlockMouse ~= false then
			pcall(_V63e1d243175, true)
		end
		pcall(_V3960c60777)
	end)
	task.delay(0.5, function()
		if S.hubOpen and S.toggles.unlockMouse ~= false then
			pcall(_V63e1d243175, true)
		end
		pcall(_V026212e1150)
	end)

	pcall(_V05d80c6fe)
	LP.CharacterAdded:Connect(function()
		task.wait(0.8)
		local w = S.antiWanted or {}
		if w.antiGrab == true and S.toggles.antiGrab then
			_V11a5d4671af(_Vzd({226,239,245,234,200,243,226,227}))
			_V53fa917f1a2(_Vzd({226,239,245,234,200,243,226,227}), 0.1, _V4b82310314)
			_V556c1dc412c(HUB_NAME, _Vzd({194,239,245,234,174,232,243,226,227,161,243,230,174,226,243,238,230,229}), 1.5)
		elseif w.antiGrab ~= true then
			S.toggles.antiGrab = false
			_V11a5d4671af(_Vzd({226,239,245,234,200,243,226,227}))
		end
		if w.antiKill or S.toggles.antiKill then
			_V7414540719a()
			_V556c1dc412c(HUB_NAME, _Vzd({102,147,153,142,82,144,142,145,145,69,151,138,82,134,151,146,138,137,69,161,69,141,148,154,152,138,69,121,117}), 1.5)
		end
		for _, key in ipairs({ _Vzd({226,239,245,234,195,246,243,239}), _Vzd({226,239,245,234,195,226,239,226,239,226}), _Vzd({134,147,153,142,123,148,142,137}), _Vzd({226,239,245,234,199,237,234,239,232}), _Vzd({226,239,245,234,198,249,241,237,240,229,230}), _Vzd({226,239,245,234,212,234,245}), _Vzd({226,239,245,234,211,226,232,229,240,237,237}), _Vzd({232,240,229}) }) do
			if w[key] or S.toggles[key] then
				S.toggles[key] = true
			end
		end
		local fp = workspace:FindFirstChild(_Vzd({123,116,110,105,127,132,107,151,138,138,159,138,117,134,151,153}))
		if fp then
			_V176fd8761f6()
			local anyCam = MASS.bring or MASS.kick or MASS.kill or MASS.fling or MASS._V7e5dd05e13e or MASS.fire or MASS.vomit
			if anyCam then
				local me = hrp()
				if me then _V9bf45a38aa(me.CFrame + Vector3.new(0, 10, 0)) end
			end
		end
	end)
	task.spawn(function()
		while S.gui and S.gui.Parent do
			task.wait(20)
			pcall(_V6c6a3f4314a)
			if S.playerListFrame then pcall(S._loopSearchRefresh) end
			if S._ctrlSearchRefresh then pcall(S._ctrlSearchRefresh) end
			if S._funControlSearchRefresh then pcall(S._funControlSearchRefresh) end
			if S.toggles.lineExtend then pcall(_V2c1a02571d, S.extendAmount or 40) end
			if S.status then S.status.Text = FTAP.ok and _Vzd({107,121,102,117,95,116,115}) or _Vzd({199,213,194,209,187,175,175,175}) end
			if S.homeStatus then
				S.homeStatus.Text = _Vzd({161,195,246,234,237,229,187,161}) .. BUILD
					.. "\n Place: " .. tostring(game.PlaceId)
					.. "\n FTAP: " .. (FTAP.ok and _Vzd({237,234,239,236,230,229}) or _Vzd({244,228,226,239,239,234,239,232}))
					.. _Vzd({161,253,161,241,237,226,250,230,243,244,187,161}) .. tostring(#labels)
			end
		end
	end)
	task.spawn(function()
		while S.gui and S.gui.Parent do
			if not FTAP.ok then _V6c6a3f4314a() end
			task.wait(3)
		end
	end)
	_V556c1dc412c(HUB_NAME, _Vzd({208,239,237,234,239,230,161,207,234,232,232,226,161,253,161}) .. (FTAP.ok and _Vzd({199,213,194,209,161,205,234,239,236,230,229,161,201,230,237,237,161,218,230,226,233}) or _Vzd({212,228,226,239,161,211,230,238,240,245,230,244,161,218,240,246,161,197,246,238,227,226,244,244,175,175,175})), 3)
	print(_Vzd({128,123,116,110,105,127,69,109,122,103,130}), BUILD, _Vzd({199,213,194,209}), FTAP.ok)
end
local function _Vb8c33a843a()
	local parent = _V90e443b5bd()
	local old = parent:FindFirstChild(_Vzd({215,208,202,197,219,224,204,198,218})); if old then old:Destroy() end
	local sg = Instance.new(_Vzd({212,228,243,230,230,239,200,246,234}))
	sg.Name = _Vzd({215,208,202,197,219,224,204,198,218})
	sg.ResetOnSpawn = false
	sg.IgnoreGuiInset = true
	sg.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	sg.DisplayOrder = 2147483647
	pcall(function() if protect_gui_fn then protect_gui_fn(sg) end end)
	sg.Parent = parent
	S.gui = sg
	local dim = Instance.new(_Vzd({199,243,226,238,230}))
	dim.Size = UDim2.fromScale(1, 1)
	dim.BackgroundColor3 = C.black
	dim.BackgroundTransparency = 1
	dim.Parent = sg
	_V0db0d1111f5(dim, { BackgroundTransparency = 0.4 }, 0.35)
	local card = Instance.new(_Vzd({199,243,226,238,230}))
	card.AnchorPoint = Vector2.new(0.5, 0.5)
	card.Position = UDim2.fromScale(0.5, 0.5)
	card.Size = UDim2.fromOffset(0, 0)
	card.BackgroundColor3 = C.bg2
	card.BorderSizePixel = 0
	card.Parent = sg
	_Ve7cf4e7f5f(card, 16); _Vb145617c1ba(card, C.accent, 1.8)
	_V2e8e03d1c0(card, Color3.fromRGB(45, 18, 80), C.bg, 120)
	_V0db0d1111f5(card, { Size = UDim2.fromOffset(380, 280) }, 0.45, Enum.EasingStyle.Back)
	local top = Instance.new(_Vzd({199,243,226,238,230}))
	top.Size = UDim2.new(1, 0, 0, 3)
	top.BackgroundColor3 = C.accent
	top.BorderSizePixel = 0
	top.Parent = card
	local skull = Instance.new(_Vzd({213,230,249,245,205,226,227,230,237}))
	skull.BackgroundTransparency = 1
	skull.Size = UDim2.new(1, 0, 0, 36)
	skull.Position = UDim2.fromOffset(0, 22)
	skull.Font = Enum.Font.GothamBlack
	skull.TextSize = 24
	skull.TextColor3 = C.accent2
	skull.Text = _Vzd({215,208,202,197,219})
	skull.Parent = card
	local title = Instance.new(_Vzd({213,230,249,245,205,226,227,230,237}))
	title.BackgroundTransparency = 1
	title.Size = UDim2.new(1, -40, 0, 22)
	title.Position = UDim2.fromOffset(20, 68)
	title.Font = Enum.Font.GothamBold
	title.TextSize = 18
	title.TextColor3 = C.text
	title.Text = _Vzd({123,116,110,105,127,69,109,122,103,69,115,110,108,108,102})
	title.Parent = card
	local sub = Instance.new(_Vzd({213,230,249,245,205,226,227,230,237}))
	sub.BackgroundTransparency = 1
	sub.Size = UDim2.new(1, -40, 0, 16)
	sub.Position = UDim2.fromOffset(20, 96)
	sub.Font = Enum.Font.Gotham
	sub.TextSize = 12
	sub.TextColor3 = C.muted
	sub.Text = _Vzd({107,121,102,117,69,116,117,69,120,122,110,121,106,69,161,69,106,115,121,106,119,69,121,109,106,69,105,102,114,115,69,112,106,126,69,115,110,108,108,102})
	sub.Parent = card
	local box = Instance.new(_Vzd({213,230,249,245,195,240,249}))
	box.Size = UDim2.new(1, -56, 0, 38)
	box.Position = UDim2.fromOffset(28, 132)
	box.BackgroundColor3 = C.bg
	box.BorderSizePixel = 0
	box.Font = Enum.Font.Code
	box.TextSize = 15
	box.TextColor3 = C.text
	box.PlaceholderText = _Vzd({204,198,218})
	box.PlaceholderColor3 = C.muted
	box.Text = ""
	box.Parent = card
	_Ve7cf4e7f5f(box, 10); _Vb145617c1ba(box, C.strokeSoft, 1)
	local status = Instance.new(_Vzd({213,230,249,245,205,226,227,230,237}))
	status.BackgroundTransparency = 1
	status.Size = UDim2.new(1, -40, 0, 14)
	status.Position = UDim2.fromOffset(20, 180)
	status.Font = Enum.Font.Gotham
	status.TextSize = 11
	status.TextColor3 = C.muted
	status.Text = _Vzd({112,138,158,95,69,123,116,110,105,127,109,122,103})
	status.Parent = card
	local unlock = Instance.new(_Vzd({213,230,249,245,195,246,245,245,240,239}))
	unlock.Size = UDim2.new(1, -56, 0, 40)
	unlock.Position = UDim2.fromOffset(28, 208)
	unlock.BackgroundColor3 = C.accentDim
	unlock.BorderSizePixel = 0
	unlock.Font = Enum.Font.GothamBold
	unlock.TextSize = 14
	unlock.TextColor3 = C.text
	unlock.Text = _Vzd({214,207,205,208,196,204,161,174,191})
	unlock.AutoButtonColor = false
	unlock.Parent = card
	_Ve7cf4e7f5f(unlock, 10); _Vb145617c1ba(unlock, C.accent, 1.2)
	local function showDeviceSplash(device, onDone)
		_V1762c12c181(device, onDone)
	end
	local function pickDeviceThenMain()
		local dim = Instance.new(_Vzd({199,243,226,238,230}))
		dim.Size = UDim2.fromScale(1, 1)
		dim.BackgroundColor3 = C.black
		dim.BackgroundTransparency = 0.35
		dim.Parent = sg
		local pick = Instance.new(_Vzd({199,243,226,238,230}))
		pick.AnchorPoint = Vector2.new(0.5, 0.5)
		pick.Position = UDim2.fromScale(0.5, 0.5)
		pick.Size = UDim2.fromOffset(340, 200)
		pick.BackgroundColor3 = C.bg2
		pick.BorderSizePixel = 0
		pick.Parent = dim
		_Ve7cf4e7f5f(pick, 14)
		_Vb145617c1ba(pick, C.accent, 2)
		local pt = Instance.new(_Vzd({213,230,249,245,205,226,227,230,237}))
		pt.BackgroundTransparency = 1
		pt.Size = UDim2.new(1, -20, 0, 28)
		pt.Position = UDim2.fromOffset(10, 16)
		pt.Font = Enum.Font.GothamBold
		pt.TextSize = 16
		pt.TextColor3 = C.accent2
		pt.Text = _Vzd({196,233,240,240,244,230,161,229,230,247,234,228,230})
		pt.Parent = pick
		local ps = Instance.new(_Vzd({213,230,249,245,205,226,227,230,237}))
		ps.BackgroundTransparency = 1
		ps.Size = UDim2.new(1, -20, 0, 36)
		ps.Position = UDim2.fromOffset(10, 48)
		ps.Font = Enum.Font.Gotham
		ps.TextSize = 11
		ps.TextColor3 = C.muted
		ps.TextWrapped = true
		ps.Text = "PC = keyboard binds | Mobile = larger buttons / touch\nThen a themed splash loads your hub."
		ps.Parent = pick
		local function go(dev)
			S.device = dev
			S.toggles.mobileUI = (dev == _Vzd({206,240,227,234,237,230}))
			pcall(function() sg:Destroy() end)
			showDeviceSplash(dev, function()
				_Vb50e317c3b()
				if _Vd37f6786e1 then _Vd37f6786e1() end
			end)
		end
		local pc = Instance.new(_Vzd({213,230,249,245,195,246,245,245,240,239}))
		pc.Size = UDim2.new(0.42, 0, 0, 40)
		pc.Position = UDim2.new(0.06, 0, 1, -58)
		pc.BackgroundColor3 = C.accentDim
		pc.Text = _Vzd({209,196})
		pc.TextColor3 = C.text
		pc.Font = Enum.Font.GothamBold
		pc.TextSize = 14
		pc.Parent = pick
		_Ve7cf4e7f5f(pc, 10)
		_Vb145617c1ba(pc, C.accent, 1.5)
		local mob = Instance.new(_Vzd({213,230,249,245,195,246,245,245,240,239}))
		mob.Size = UDim2.new(0.42, 0, 0, 40)
		mob.Position = UDim2.new(0.52, 0, 1, -58)
		mob.BackgroundColor3 = C.card
		mob.Text = _Vzd({206,240,227,234,237,230})
		mob.TextColor3 = C.text
		mob.Font = Enum.Font.GothamBold
		mob.TextSize = 14
		mob.Parent = pick
		_Ve7cf4e7f5f(mob, 10)
		_Vb145617c1ba(mob, C._Vb145617c1ba, 1.5)
		pc.MouseButton1Click:Connect(function() go(_Vzd({209,196})) end)
		mob.MouseButton1Click:Connect(function() go(_Vzd({206,240,227,234,237,230})) end)
	end
	local function try()
		local key = (box.Text or ""):gsub(_Vzd({223,166,244,172}), ""):gsub(_Vzd({166,244,172,165}), "")
		if key == ACCESS_KEY then
			status.TextColor3 = C.success
			status.Text = _Vzd({102,136,136,138,152,152,69,140,151,134,147,153,138,137})
			task.wait(0.15)
			box.Visible = false
			unlock.Visible = false
			status.Visible = false
			sub.Text = _Vzd({102,145,146,148,152,153,69,151,138,134,137,158})
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
		S.device = device or S.device or _Vzd({209,196})
		S.toggles.mobileUI = (S.device == _Vzd({206,240,227,234,237,230}))
		_Vb50e317c3b()
		pcall(function()
			if _Vd37f6786e1 then _Vd37f6786e1() end
		end)
	end
	Late._Vb8c33a843a = _Vb8c33a843a
	Late._Vb50e317c3b = _Vb50e317c3b
	_G._Vb50e317c3b = _Vb50e317c3b
	Late.openHub = openHub
	Late._phase = _Vzd({138,157,149,148,151,153,138,137})
	pcall(function()
		local g = getgenv and getgenv()
		if g then
			g.VOIDZ_API = {
				openHub = openHub,
				_Vb50e317c3b = _Vb50e317c3b,
				_Vb8c33a843a = _Vb8c33a843a,
			}
			g.VOIDZ_OPEN_HUB = openHub
		end
	end)
	print(_Vzd({220,215,208,202,197,219,222,161,214,202,161,228,240,243,230,161,230,249,241,240,243,245,230,229,161,169,240,241,230,239,201,246,227,161,243,230,226,229,250,170}))
	Late._phase = _Vzd({246,234,224,230,249,241,240,243,245,230,229})
end
	pcall(function()
		local g = getgenv and getgenv()
		if g then g._V518e6124a = _V518e6124a end
	end)
	print(_Vzd({220,215,208,202,197,219,222,161,224,247,240,234,229,251,202,239,234,245,214,202,161,244,245,226,243,245,234,239,232,175,175,175}))
	Late._phase = _Vzd({246,234,224,228,226,237,237,234,239,232})
	local _uiOk, _uiErr = pcall(_V518e6124a)
	if not _uiOk then
		warn(_Vzd({128,123,116,110,105,127,130,69,132,155,148,142,137,159,110,147,142,153,122,110,69,106,119,119,116,119,95}), _uiErr)
		error(_Vzd({128,123,116,110,105,127,130,69,132,155,148,142,137,159,110,147,142,153,122,110,69,139,134,142,145,138,137,95,69}) .. tostring(_uiErr))
	end
	if not Late.openHub then
		local g = getgenv and getgenv()
		if g and type(g._V518e6124a) == "function" then
			pcall(g._V518e6124a)
		end
	end
	if not Late.openHub and not (getgenv and getgenv().VOIDZ_OPEN_HUB) then
		error(_Vzd({128,123,116,110,105,127,130,69,132,155,148,142,137,159,110,147,142,153,122,110,69,139,142,147,142,152,141,138,137,69,135,154,153,69,148,149,138,147,109,154,135,69,152,153,142,145,145,69,147,142,145}))
	end
	print(_Vzd({220,215,208,202,197,219,222,161,224,247,240,234,229,251,202,239,234,245,214,202,161,240,236,161,253,161,240,241,230,239,201,246,227,161,244,230,245}))
	Late._phase = _Vzd({246,234,224,240,236})
	Late._V5f4242cdd9 = _V5f4242cdd9
	Late._Vddd8d203e0 = _Vddd8d203e0
	Late._V5e386855db = _V5e386855db
	Late._V0cbc6b091f8 = _V0cbc6b091f8
	Late._initDone = true
	if getgenv and type(getgenv) == _Vzd({139,154,147,136,153,142,148,147}) then
		getgenv().VOIDZ_UNLOAD = _V0cbc6b091f8
		getgenv().VOIDZ_LATE = Late
		if Late.openHub then getgenv().VOIDZ_OPEN_HUB = Late.openHub end
	end
	if type(Late.openHub) ~= "function" then
		warn(_Vzd({220,215,208,202,197,219,222,161,240,241,230,239,201,246,227,161,238,234,244,244,234,239,232,161,226,245,161,237,226,245,230,174,234,239,234,245,161,245,226,234,237,161,174,161,234,239,244,245,226,237,237,234,239,232,161,230,238,230,243,232,230,239,228,250,161,240,241,230,239,230,243}))
		Late.openHub = function(device)
			S.device = device or S.device or _Vzd({209,196})
			S.toggles.mobileUI = (S.device == _Vzd({206,240,227,234,237,230}))
			local bm = rawget(_G, _Vzd({227,246,234,237,229,206,226,234,239})) or (getgenv and getgenv()._Vb50e317c3b)
			if type(bm) ~= "function" and type(_Vb50e317c3b) == "function" then bm = _Vb50e317c3b end
			if type(bm) ~= "function" then
				error(_Vzd({227,246,234,237,229,206,226,234,239,161,239,240,245,161,226,247,226,234,237,226,227,237,230,161,174,161,214,202,161,234,239,234,245,161,239,230,247,230,243,161,228,240,238,241,237,230,245,230,229}))
			end
			bm()
			pcall(function()
				if _Vd37f6786e1 then _Vd37f6786e1() end
			end)
		end
		pcall(function()
			if getgenv then getgenv().VOIDZ_OPEN_HUB = Late.openHub end
		end)
	end
	print(_Vzd({220,215,208,202,197,219,222,161,237,226,245,230,161,234,239,234,245,161,245,226,234,237,161,229,240,239,230,161,253,161,240,241,230,239,201,246,227,190}), type(Late.openHub))
end
local function _V586dd4f66f(errMsg)
	pcall(function()
		local parent = _V90e443b5bd()
		local old = parent:FindFirstChild(_Vzd({215,208,202,197,219,224,204,198,218}))
		if old then old:Destroy() end
		local sg = Instance.new(_Vzd({212,228,243,230,230,239,200,246,234}))
		sg.Name = _Vzd({215,208,202,197,219,224,204,198,218})
		sg.ResetOnSpawn = false
		sg.IgnoreGuiInset = true
		sg.DisplayOrder = 2147483647
		pcall(function() if protect_gui_fn then protect_gui_fn(sg) end end)
		sg.Parent = parent
		local f = Instance.new(_Vzd({199,243,226,238,230}))
		f.AnchorPoint = Vector2.new(0.5, 0.5)
		f.Position = UDim2.fromScale(0.5, 0.5)
		f.Size = UDim2.fromOffset(360, 160)
		f.BackgroundColor3 = Color3.fromRGB(12, 8, 20)
		f.BorderSizePixel = 0
		f.Parent = sg
		local c = Instance.new(_Vzd({214,202,196,240,243,239,230,243}))
		c.CornerRadius = UDim.new(0, 12)
		c.Parent = f
		local t = Instance.new(_Vzd({213,230,249,245,205,226,227,230,237}))
		t.BackgroundTransparency = 1
		t.Size = UDim2.new(1, -20, 0, 40)
		t.Position = UDim2.fromOffset(10, 12)
		t.Font = Enum.Font.GothamBold
		t.TextSize = 16
		t.TextColor3 = Color3.fromRGB(195, 120, 255)
		t.Text = _Vzd({123,116,110,105,127,69,109,122,103,69,161,69,151,138,136,148,155,138,151,158})
		t.Parent = f
		local b = Instance.new(_Vzd({213,230,249,245,205,226,227,230,237}))
		b.BackgroundTransparency = 1
		b.Size = UDim2.new(1, -20, 0, 80)
		b.Position = UDim2.fromOffset(10, 56)
		b.Font = Enum.Font.Gotham
		b.TextSize = 12
		b.TextColor3 = Color3.fromRGB(245, 240, 255)
		b.TextWrapped = true
		b.TextXAlignment = Enum.TextXAlignment.Left
		b.TextYAlignment = Enum.TextYAlignment.Top
		b.Text = "Main UI failed to open.\n" .. tostring(errMsg or _Vzd({246,239,236,239,240,248,239})):sub(1, 160) .. "\nF9 for full error."
		b.Parent = f
		warn(_Vzd({220,215,208,202,197,219,222,161,230,238,230,243,232,230,239,228,250,161,214,202,187}), errMsg)
	end)
end
print(_Vzd({128,123,116,110,105,127,69,109,122,103,130,69,145,148,134,137,142,147,140}), BUILD)
local function _Vd7e89d0717f()
	local parent = _V90e443b5bd()
	local old = parent:FindFirstChild(_Vzd({215,208,202,197,219,224,204,198,218}))
	if old then pcall(function() old:Destroy() end) end

	local colDeep = Color3.fromRGB(4, 2, 10)
	local colCard = Color3.fromRGB(12, 8, 22)
	local colCard2 = Color3.fromRGB(20, 12, 36)
	local colPurple = Color3.fromRGB(120, 40, 220)
	local colViolet = Color3.fromRGB(155, 70, 255)
	local colDarkV = Color3.fromRGB(70, 25, 140)
	local colText = Color3.fromRGB(245, 240, 255)
	local colMuted = Color3.fromRGB(140, 120, 170)
	local colOk = Color3.fromRGB(160, 255, 190)
	local colBad = Color3.fromRGB(255, 120, 150)
	local sg = Instance.new(_Vzd({120,136,151,138,138,147,108,154,142}))
	sg.Name = _Vzd({215,208,202,197,219,224,204,198,218})
	sg.ResetOnSpawn = false
	sg.IgnoreGuiInset = true
	sg.DisplayOrder = 2147483647
	sg.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	pcall(function() if protect_gui_fn then protect_gui_fn(sg) end end)
	sg.Parent = parent
	local dim = Instance.new(_Vzd({199,243,226,238,230}))
	dim.Size = UDim2.fromScale(1, 1)
	dim.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	dim.BackgroundTransparency = 1
	dim.BorderSizePixel = 0
	dim.Parent = sg
	_V0db0d1111f5(dim, { BackgroundTransparency = 0.3 }, 0.35)
	local wash = Instance.new(_Vzd({199,243,226,238,230}))
	wash.Size = UDim2.fromScale(1.2, 1.2)
	wash.AnchorPoint = Vector2.new(0.5, 0.5)
	wash.Position = UDim2.fromScale(0.5, 0.5)
	wash.BackgroundColor3 = Color3.new(1, 1, 1)
	wash.BackgroundTransparency = 0.65
	wash.BorderSizePixel = 0
	wash.Parent = dim
	local washG = Instance.new(_Vzd({214,202,200,243,226,229,234,230,239,245}))
	washG.Color = ColorSequence.new({
		ColorSequenceKeypoint.new(0, colDeep),
		ColorSequenceKeypoint.new(0.4, colDarkV),
		ColorSequenceKeypoint.new(0.7, colPurple),
		ColorSequenceKeypoint.new(1, colDeep),
	})
	washG.Transparency = NumberSequence.new({
		NumberSequenceKeypoint.new(0, 0.2),
		NumberSequenceKeypoint.new(0.5, 0.45),
		NumberSequenceKeypoint.new(1, 0.65),
	})
	washG.Rotation = 24
	washG.Parent = wash
	task.spawn(function()
		while wash.Parent do
			washG.Rotation = (washG.Rotation + 0.22) % 360
			RunService.RenderStepped:Wait()
		end
	end)
	local card = Instance.new(_Vzd({199,243,226,238,230}))
	card.AnchorPoint = Vector2.new(0.5, 0.5)
	card.Position = UDim2.fromScale(0.5, 0.52)
	card.Size = UDim2.fromOffset(0, 0)
	card.BackgroundColor3 = colCard
	card.BorderSizePixel = 0
	card.ClipsDescendants = true
	card.Parent = sg
	local cc = Instance.new(_Vzd({214,202,196,240,243,239,230,243}))
	cc.CornerRadius = UDim.new(0, 10)
	cc.Parent = card
	local cardStroke = Instance.new(_Vzd({214,202,212,245,243,240,236,230}))
	cardStroke.Color = colPurple
	cardStroke.Thickness = 1.4
	cardStroke.Transparency = 0.25
	cardStroke.Parent = card
	local cardGrad = Instance.new(_Vzd({214,202,200,243,226,229,234,230,239,245}))
	cardGrad.Color = ColorSequence.new(colCard2, colDeep)
	cardGrad.Rotation = 120
	cardGrad.Parent = card
	local topBar = Instance.new(_Vzd({199,243,226,238,230}))
	topBar.Size = UDim2.new(1, 0, 0, 3)
	topBar.BackgroundColor3 = Color3.new(1, 1, 1)
	topBar.BorderSizePixel = 0
	topBar.Parent = card
	local topG = Instance.new(_Vzd({214,202,200,243,226,229,234,230,239,245}))
	topG.Color = ColorSequence.new({
		ColorSequenceKeypoint.new(0, colViolet),
		ColorSequenceKeypoint.new(0.5, colPurple),
		ColorSequenceKeypoint.new(1, colDarkV),
	})
	topG.Parent = topBar
	local badge = Instance.new(_Vzd({199,243,226,238,230}))
	badge.Size = UDim2.fromOffset(40, 40)
	badge.Position = UDim2.fromOffset(22, 22)
	badge.BackgroundColor3 = colDeep
	badge.BorderSizePixel = 0
	badge.Parent = card
	local badgeC = Instance.new(_Vzd({214,202,196,240,243,239,230,243}))
	badgeC.CornerRadius = UDim.new(0, 6)
	badgeC.Parent = badge
	local badgeStroke = Instance.new(_Vzd({214,202,212,245,243,240,236,230}))
	badgeStroke.Color = colViolet
	badgeStroke.Thickness = 1.2
	badgeStroke.Parent = badge
	local badgeTx = Instance.new(_Vzd({213,230,249,245,205,226,227,230,237}))
	badgeTx.BackgroundTransparency = 1
	badgeTx.Size = UDim2.fromScale(1, 1)
	badgeTx.Font = Enum.Font.GothamBlack
	badgeTx.TextSize = 18
	badgeTx.TextColor3 = colText
	badgeTx.Text = "V"
	badgeTx.Parent = badge
	local title = Instance.new(_Vzd({213,230,249,245,205,226,227,230,237}))
	title.BackgroundTransparency = 1
	title.Size = UDim2.new(1, -90, 0, 26)
	title.Position = UDim2.fromOffset(76, 22)
	title.Font = Enum.Font.GothamBlack
	title.TextSize = 22
	title.TextColor3 = colText
	title.TextXAlignment = Enum.TextXAlignment.Left
	title.Text = _Vzd({215,208,202,197,219,161,201,214,195})
	title.Parent = card
	local sub = Instance.new(_Vzd({213,230,249,245,205,226,227,230,237}))
	sub.BackgroundTransparency = 1
	sub.Size = UDim2.new(1, -90, 0, 18)
	sub.Position = UDim2.fromOffset(76, 48)
	sub.Font = Enum.Font.GothamBold
	sub.TextSize = 11
	sub.TextColor3 = colMuted
	sub.TextXAlignment = Enum.TextXAlignment.Left
	sub.Text = _Vzd({102,104,104,106,120,120,69,69,84,84,69,69,107,121,102,117})
	sub.Parent = card
	local divider = Instance.new(_Vzd({199,243,226,238,230}))
	divider.Size = UDim2.new(1, -44, 0, 1)
	divider.Position = UDim2.fromOffset(22, 78)
	divider.BackgroundColor3 = colPurple
	divider.BackgroundTransparency = 0.55
	divider.BorderSizePixel = 0
	divider.Parent = card
	local keyLab = Instance.new(_Vzd({213,230,249,245,205,226,227,230,237}))
	keyLab.BackgroundTransparency = 1
	keyLab.Size = UDim2.new(1, -44, 0, 16)
	keyLab.Position = UDim2.fromOffset(22, 94)
	keyLab.Font = Enum.Font.GothamBold
	keyLab.TextSize = 10
	keyLab.TextColor3 = colMuted
	keyLab.TextXAlignment = Enum.TextXAlignment.Left
	keyLab.Text = _Vzd({204,198,218})
	keyLab.Parent = card

	local outlinePurp = Color3.fromRGB(190, 100, 255)
	local OL = 3
	local function paintOutline(host, col, th)
		th = th or OL
		col = col or outlinePurp
		local names = { _Vzd({215,208,202,197,219,224,208,205,224,213}), _Vzd({123,116,110,105,127,132,116,113,132,103}), _Vzd({215,208,202,197,219,224,208,205,224,205}), _Vzd({215,208,202,197,219,224,208,205,224,211}) }
		for _, n in ipairs(names) do
			local old = host:FindFirstChild(n)
			if old then old:Destroy() end
		end
		local function edge(name, size, pos)
			local e = Instance.new(_Vzd({199,243,226,238,230}))
			e.Name = name
			e.BackgroundColor3 = col
			e.BackgroundTransparency = 0
			e.BorderSizePixel = 0
			e.Size = size
			e.Position = pos
			e.ZIndex = (host.ZIndex or 1) + 5
			e.Parent = host
			return e
		end
		edge(_Vzd({215,208,202,197,219,224,208,205,224,213}), UDim2.new(1, 0, 0, th), UDim2.fromOffset(0, 0))
		edge(_Vzd({215,208,202,197,219,224,208,205,224,195}), UDim2.new(1, 0, 0, th), UDim2.new(0, 0, 1, -th))
		edge(_Vzd({215,208,202,197,219,224,208,205,224,205}), UDim2.new(0, th, 1, 0), UDim2.fromOffset(0, 0))
		edge(_Vzd({215,208,202,197,219,224,208,205,224,211}), UDim2.new(0, th, 1, 0), UDim2.new(1, -th, 0, 0))
	end
	local function setOutlineColor(host, col)
		for _, n in ipairs({ _Vzd({215,208,202,197,219,224,208,205,224,213}), _Vzd({215,208,202,197,219,224,208,205,224,195}), _Vzd({215,208,202,197,219,224,208,205,224,205}), _Vzd({123,116,110,105,127,132,116,113,132,119}) }) do
			local e = host:FindFirstChild(n)
			if e then e.BackgroundColor3 = col end
		end
	end

	local boxHost = Instance.new(_Vzd({199,243,226,238,230}))
	boxHost.Name = _Vzd({112,138,158,107,142,138,145,137})
	boxHost.Size = UDim2.new(1, -44, 0, 48)
	boxHost.Position = UDim2.fromOffset(22, 112)
	boxHost.BackgroundColor3 = Color3.fromRGB(6, 4, 14)
	boxHost.BorderSizePixel = 0
	boxHost.ClipsDescendants = true
	boxHost.ZIndex = 2
	boxHost.Parent = card
	local boxHostC = Instance.new(_Vzd({214,202,196,240,243,239,230,243}))
	boxHostC.CornerRadius = UDim.new(0, 6)
	boxHostC.Parent = boxHost
	local box = Instance.new(_Vzd({213,230,249,245,195,240,249}))
	box.Size = UDim2.new(1, -(OL * 2), 1, -(OL * 2))
	box.Position = UDim2.fromOffset(OL, OL)
	box.BackgroundColor3 = Color3.fromRGB(10, 6, 20)
	box.BorderSizePixel = 0
	box.Font = Enum.Font.GothamMedium
	box.TextSize = 15
	box.TextColor3 = colText
	box.PlaceholderColor3 = Color3.fromRGB(90, 75, 120)
	box.PlaceholderText = _Vzd({138,147,153,138,151,69,144,138,158,83,83,83})
	box.Text = ""
	box.ClearTextOnFocus = false
	box.ZIndex = 3
	box.Parent = boxHost
	local bc = Instance.new(_Vzd({214,202,196,240,243,239,230,243}))
	bc.CornerRadius = UDim.new(0, 4)
	bc.Parent = box
	local boxPad = Instance.new(_Vzd({214,202,209,226,229,229,234,239,232}))
	boxPad.PaddingLeft = UDim.new(0, 12)
	boxPad.PaddingRight = UDim.new(0, 12)
	boxPad.Parent = box
	paintOutline(boxHost, outlinePurp, OL)
	box.Focused:Connect(function()
		setOutlineColor(boxHost, colViolet)
	end)
	box.FocusLost:Connect(function()
		setOutlineColor(boxHost, outlinePurp)
	end)
	local status = Instance.new(_Vzd({213,230,249,245,205,226,227,230,237}))
	status.BackgroundTransparency = 1
	status.Size = UDim2.new(1, -44, 0, 18)
	status.Position = UDim2.fromOffset(22, 168)
	status.Font = Enum.Font.Gotham
	status.TextSize = 12
	status.TextColor3 = colMuted
	status.TextXAlignment = Enum.TextXAlignment.Left
	status.Text = _Vzd({248,226,234,245,234,239,232,175,175,175})
	status.ZIndex = 2
	status.Parent = card

	local unlockHost = Instance.new(_Vzd({199,243,226,238,230}))
	unlockHost.Name = _Vzd({214,239,237,240,228,236,201,240,244,245})
	unlockHost.Size = UDim2.new(1, -44, 0, 50)
	unlockHost.Position = UDim2.fromOffset(22, 196)
	unlockHost.BackgroundColor3 = Color3.fromRGB(28, 14, 55)
	unlockHost.BorderSizePixel = 0
	unlockHost.ClipsDescendants = true
	unlockHost.ZIndex = 2
	unlockHost.Parent = card
	local unlockHostC = Instance.new(_Vzd({214,202,196,240,243,239,230,243}))
	unlockHostC.CornerRadius = UDim.new(0, 6)
	unlockHostC.Parent = unlockHost
	local unlock = Instance.new(_Vzd({121,138,157,153,103,154,153,153,148,147}))
	unlock.Size = UDim2.new(1, -(OL * 2), 1, -(OL * 2))
	unlock.Position = UDim2.fromOffset(OL, OL)
	unlock.BackgroundColor3 = Color3.fromRGB(45, 22, 90)
	unlock.BorderSizePixel = 0
	unlock.Font = Enum.Font.GothamBlack
	unlock.TextSize = 14
	unlock.TextColor3 = colText
	unlock.Text = _Vzd({214,207,205,208,196,204})
	unlock.AutoButtonColor = false
	unlock.ZIndex = 3
	unlock.Parent = unlockHost
	local uc = Instance.new(_Vzd({122,110,104,148,151,147,138,151}))
	uc.CornerRadius = UDim.new(0, 4)
	uc.Parent = unlock
	paintOutline(unlockHost, outlinePurp, OL)
	unlock.MouseEnter:Connect(function()
		_V0db0d1111f5(unlock, { BackgroundColor3 = colDarkV }, 0.12)
		setOutlineColor(unlockHost, colViolet)
	end)
	unlock.MouseLeave:Connect(function()
		_V0db0d1111f5(unlock, { BackgroundColor3 = Color3.fromRGB(45, 22, 90) }, 0.12)
		setOutlineColor(unlockHost, outlinePurp)
	end)
	local foot = Instance.new(_Vzd({213,230,249,245,205,226,227,230,237}))
	foot.BackgroundTransparency = 1
	foot.Size = UDim2.new(1, -44, 0, 16)
	foot.Position = UDim2.fromOffset(22, 256)
	foot.Font = Enum.Font.Code
	foot.TextSize = 10
	foot.TextColor3 = Color3.fromRGB(70, 55, 100)
	foot.TextXAlignment = Enum.TextXAlignment.Left
	foot.Text = _Vzd({135,154,142,145,137,69}) .. tostring(BUILD)
	foot.Parent = card
	_V0db0d1111f5(card, {
		Size = UDim2.fromOffset(400, 290),
		Position = UDim2.fromScale(0.5, 0.5),
	}, 0.4, Enum.EasingStyle.Quint)
	local function tryUnlock()
		local key = (box.Text or ""):gsub(_Vzd({223,166,244,172}), ""):gsub(_Vzd({166,244,172,165}), "")
		if key ~= ACCESS_KEY then
			status.TextColor3 = colBad
			status.Text = _Vzd({110,147,155,134,145,142,137,69,144,138,158,69,82,69,153,151,158,69,134,140,134,142,147})
			_V0db0d1111f5(cardStroke, { Color = colBad }, 0.12)
			task.delay(0.5, function()
				if cardStroke.Parent then
					_V0db0d1111f5(cardStroke, { Color = colViolet }, 0.25)
				end
			end)
			return
		end
		status.TextColor3 = colOk
		status.Text = _Vzd({102,136,136,138,152,152,69,140,151,134,147,153,138,137,69,161,69,145,148,134,137,142,147,140,69,141,154,135,83,83,83})
		unlock.Text = _Vzd({208,209,198,207,202,207,200,175,175,175})
		unlock.Active = false
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
					if type(e) == _Vzd({245,226,227,237,230}) then fn = e[name] end
					if type(fn) ~= _Vzd({139,154,147,136,153,142,148,147}) and type(_G) == _Vzd({245,226,227,237,230}) then fn = _G[name] end
					if type(fn) ~= _Vzd({139,154,147,136,153,142,148,147}) then
						local ok, v = pcall(function() return rawget(e, name) end)
						if ok then fn = v end
					end
					if type(fn) == "function" then return fn end
				end
				return nil
			end
			local function getOpenFn()
				local e = env()
				if type(e.VOIDZ_OPEN_HUB) == "function" then return e.VOIDZ_OPEN_HUB end
				if type(e.VOIDZ_API) == _Vzd({245,226,227,237,230}) and type(e.VOIDZ_API.openHub) == "function" then
					return e.VOIDZ_API.openHub
				end
				if type(e.VOIDZ_API) == _Vzd({245,226,227,237,230}) and type(e.VOIDZ_API._Vb50e317c3b) == "function" then
					local bm = e.VOIDZ_API._Vb50e317c3b
					return function(device)
						S.device = device or S.device or _Vzd({209,196})
						S.toggles.mobileUI = (S.device == _Vzd({206,240,227,234,237,230}))
						bm()
					end
				end
				if type(Late) == _Vzd({245,226,227,237,230}) and type(Late.openHub) == "function" then return Late.openHub end
				if type(Late) == _Vzd({245,226,227,237,230}) and type(Late._Vb50e317c3b) == "function" then
					local bm = Late._Vb50e317c3b
					return function(device)
						S.device = device or S.device or _Vzd({209,196})
						S.toggles.mobileUI = (S.device == _Vzd({206,240,227,234,237,230}))
						bm()
					end
				end
				local bm = pickFn(_Vzd({227,246,234,237,229,206,226,234,239}))
				if bm then
					return function(device)
						S.device = device or S.device or _Vzd({209,196})
						S.toggles.mobileUI = (S.device == _Vzd({206,240,227,234,237,230}))
						bm()
					end
				end
				return nil
			end
			local function ensureCore()
				status.Text = _Vzd({113,148,134,137,142,147,140,69,141,154,135,69,136,148,151,138,83,83,83})
				local ok, err = pcall(_Vbe6e7c8db)
				if not ok then
					return nil, _Vzd({145,134,153,138,69,142,147,142,153,95,69}) .. tostring(err):sub(1, 120)
				end
				local uiInit = pickFn(_Vzd({224,247,240,234,229,251,202,239,234,245,214,202}))
				if type(uiInit) == "function" then
					status.Text = _Vzd({103,154,142,145,137,142,147,140,69,122,110,69,136,148,151,138,83,83,83})
					local ok2, err2 = pcall(uiInit)
					if not ok2 then
						return nil, _Vzd({246,234,161,234,239,234,245,187,161}) .. tostring(err2):sub(1, 120)
					end
				end
				local openFn = getOpenFn()
				if openFn then
					Late._initDone = true
					return openFn, nil
				end
				local bm = pickFn(_Vzd({227,246,234,237,229,206,226,234,239}))
				if bm then
					Late._initDone = true
					return function(device)
						S.device = device or S.device or _Vzd({209,196})
						S.toggles.mobileUI = (S.device == _Vzd({206,240,227,234,237,230}))
						bm()
					end, nil
				end
				return nil, _Vzd({147,148,69,148,149,138,147,109,154,135,84,135,154,142,145,137,114,134,142,147,69,77,154,142,110,147,142,153,98}) .. tostring(type(uiInit)) .. ")"
			end
			local openFn, err = ensureCore()
			if not openFn then
				status.TextColor3 = colBad
				status.Text = _Vzd({196,240,243,230,161,231,226,234,237,187,161}) .. tostring(err or "?"):gsub(_Vzd({166,244,172}), " "):sub(1, 70)
				unlock.Text = _Vzd({214,207,205,208,196,204,161,201,214,195})
				unlock.Active = true
				warn(_Vzd({128,123,116,110,105,127,130,69,138,147,152,154,151,138,104,148,151,138,69,139,134,142,145,138,137,95}), err)
				return
			end
			status.TextColor3 = colOk
			status.Text = _Vzd({194,228,228,230,244,244,161,232,243,226,239,245,230,229,161,253,161,244,241,237,226,244,233,175,175,175})
			pcall(function() sg:Destroy() end)
			local opened = false
			local function openMain()
				if opened then return end
				opened = true
				local ok2, err2 = pcall(function()
					openFn(S.device or _Vzd({209,196}))
				end)
				if not ok2 then
					warn(_Vzd({220,215,208,202,197,219,222,161,240,241,230,239,201,246,227,161,231,226,234,237,230,229,187}), err2)
					pcall(_V586dd4f66f, err2)
				else
					print(_Vzd({220,215,208,202,197,219,161,201,214,195,222,161,238,226,234,239,161,233,246,227,161,240,241,230,239}))
				end
			end
			local okSplash, splashErr = pcall(function()
				_V1762c12c181(S.device or _Vzd({209,196}), openMain)
			end)
			if not okSplash then
				warn(_Vzd({128,123,116,110,105,127,130,69,152,149,145,134,152,141,69,139,134,142,145,138,137,95}), splashErr)
				openMain()
			end
		end)
	end
	unlock.MouseButton1Click:Connect(function() task.spawn(tryUnlock) end)
	box.FocusLost:Connect(function(enter)
		if enter then task.spawn(tryUnlock) end
	end)
	S.gui = sg
	print(_Vzd({220,215,208,202,197,219,161,201,214,195,222,161,236,230,250,161,214,202,161,231,240,243,228,230,229,161,240,241,230,239}))
	return sg
end
local uiOk, uiErr = pcall(_Vd7e89d0717f)
if not uiOk then
	warn(_Vzd({220,215,208,202,197,219,222,161,234,238,238,230,229,234,226,245,230,161,214,202,161,231,226,234,237,230,229,187}), uiErr)
	pcall(_V586dd4f66f, uiErr)
end
task.spawn(function()
	if Late._initDone then return end
	Late._initStarted = true
	local ok, err = pcall(_Vbe6e7c8db)
	if not ok then
		warn(_Vzd({220,215,208,202,197,219,222,161,237,226,245,230,161,234,239,234,245,161,231,226,234,237,230,229,187}), err)
		Late._initStarted = false
		Late._initErr = tostring(err)
		return
	end
	local g = getgenv and getgenv()
	local ready = (Late.openHub ~= nil) or (g and g.VOIDZ_OPEN_HUB ~= nil)
	if not ready then
		warn(_Vzd({220,215,208,202,197,219,222,161,237,226,245,230,161,234,239,234,245,161,243,230,245,246,243,239,230,229,161,227,246,245,161,240,241,230,239,201,246,227,161,238,234,244,244,234,239,232}))
		Late._initErr = _Vzd({240,241,230,239,201,246,227,161,238,234,244,244,234,239,232})
		Late._initStarted = false
		return
	end
	Late._initDone = true
	print(_Vzd({128,123,116,110,105,127,69,109,122,103,130,69,145,134,153,138,69,142,147,142,153,69,148,144,69,161,69,148,149,138,147,109,154,135,69,151,138,134,137,158}))
	pcall(_V6c6a3f4314a)
	pcall(function() if Late._V5f4242cdd9 then Late._V5f4242cdd9() end end)
	pcall(function() if Late._Vddd8d203e0 then Late._Vddd8d203e0() end end)
	pcall(function() if Late._V5e386855db then Late._V5e386855db() end end)
end)

-- VOIDZ HUB
-- hi im voidz
