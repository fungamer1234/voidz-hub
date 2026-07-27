

if getgenv and getgenv().VOIDZ_LOADED then
	pcall(function() if getgenv().VOIDZ_UNLOAD then getgenv().VOIDZ_UNLOAD() end end)
end
if getgenv then getgenv().VOIDZ_LOADED = true end

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local ContextActionService = game:GetService("ContextActionService")
local TweenService = game:GetService("TweenService")
local Lighting = game:GetService("Lighting")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local StarterGui = game:GetService("StarterGui")
local CoreGui = game:GetService("CoreGui")
local Debris = game:GetService("Debris")
local TeleportService = game:GetService("TeleportService")
local VirtualUser = game:GetService("VirtualUser")
local TextChatService = game:GetService("TextChatService")

local LP = Players.LocalPlayer
while not LP do task.wait() LP = Players.LocalPlayer end
local Mouse = LP:GetMouse()

local ACCESS_KEY = "kingvoidz"
local HUB_NAME = "VOIDZ HUB"
local BUILD = "2026-07-27-1.1.6"
local GuiService = game:GetService("GuiService")

-- 6 themes (Purple = classic VOIDZ)
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
	loopGen = {}, -- prevents an old task from coming back alive after a quick off/on toggle
	auraCfg = {},
	whitelist = {},
	antiGrabWhitelist = {}, -- players allowed to grab you even with anti-grab on
	selected = nil,
	loopTarget = nil,
	loopTargets = {}, -- multi-select: {Player = true}
	loopNames = {}, -- track target names for rejoin re-acquire
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
	superStrengthHold = false,
	superStrengthHoldPower = 5000,
	masslessGrab = false,
	noclipGrab = false,
	killGrab = false,
	poisonGrab = false,
	burnGrab = false,
	ragdollGrab = false,
	revengeGrab = false,
	revengeForce = 12000,
	anchorGrab = false,
	strengthMult = 1,
	counterMode = "Repulsion",
	autoCounter = false,
	tkShape = "Tornado",
	lagIntensity = 150,
	silentRange = 200,
	theme = "Purple",
	device = "PC",
	escapeSpace = false,
	-- Blitzbr-style anchor objects
	anchorMode = false,
	anchorOwnership = true,
	-- Anti-spectate
	antiSpectate = false,
	antiSpectateMode = "hide",
	-- Dev join effects
	devJoinEffects = false,
	devJoinSound = false,
}

-- default aura config factory
function auraDefaults()
	return { target = "Players", range = 50, power = 2500 }
end
function getAura(id)
	if not S.auraCfg[id] then S.auraCfg[id] = auraDefaults() end
	local cfg = S.auraCfg[id]
	cfg._id = id
	-- live global sliders unless per-aura ⚙ customized
	if not cfg._customRange then
		cfg.range = tonumber(S.auraRange) or cfg.range or 50
	end
	if not cfg._customPower then
		cfg.power = tonumber(S.flingPower) or cfg.power or 2500
	end
	return cfg
end

------------------------------------------------------------------------
-- Tiny utils
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
	-- never run hotter than ~30fps for background loops (lag fix)
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

function refreshThemeVisuals()
	if not S.gui then return end
	local oldName = S._prevTheme or "Purple"
	local newName = S.theme or "Purple"
	local oldT = THEMES[oldName] or THEMES.Purple
	local newT = THEMES[newName] or THEMES.Purple
	-- build old→new pairs by RGB component comparison (Color3 can't be table keys in Luau)
	local rgbPairs = {}
	for k, oldC in pairs(oldT) do
		if typeof(oldC) == "Color3" and typeof(newT[k]) == "Color3" then
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
	pcall(function() notify(HUB_NAME, "Theme · " .. name, 1.5) end)
end

-- Fancy option detail panel (description + optional sliders)
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
	local x = Instance.new("TextButton")
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
	local body = Instance.new("TextLabel")
	body.BackgroundTransparency = 1
	body.Size = UDim2.new(1, -28, 0, 90)
	body.Position = UDim2.fromOffset(14, 44)
	body.Font = Enum.Font.Gotham
	body.TextSize = 12
	body.TextColor3 = C.text
	body.TextXAlignment = Enum.TextXAlignment.Left
	body.TextYAlignment = Enum.TextYAlignment.Top
	body.TextWrapped = true
	body.Text = opts.tip or opts.desc or "No extra description."
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
				local track = Instance.new("TextButton")
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

-- Public chat only for anti-kick rejoin notice (user-requested)
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
			-- legacy fallback some games still use
			game:GetService("Players"):Chat(msg)
		end
	end)
end

-- Spam version: wraps trigger word in invisible chars so chat appears blank
-- but game still detects the trigger word and plays the sound
local INV = "\u{3164}" -- Hangul Filler (invisible, works on Roblox)
function voidzChatSpam(msg)
	msg = tostring(msg or "")
	if msg == "" then return end
	-- wrap: invisible + trigger + invisible = blank chat, sound still fires
	voidzChat(INV .. msg .. INV)
end

function getUiParent()
	local ok, h = pcall(function() if gethui then return gethui() end end)
	if ok and h then return h end
	local ok2 = pcall(function() local t=Instance.new("Folder"); t.Parent=CoreGui; t:Destroy() end)
	if ok2 then return CoreGui end
	return LP:WaitForChild("PlayerGui")
end

function char() return LP.Character end
function hum() local c=char(); return c and c:FindFirstChildOfClass("Humanoid") end
function hrp()
	local c = char()
	if not c then return end
	return c:FindFirstChild("HumanoidRootPart") or c:FindFirstChild("Torso") or c:FindFirstChild("UpperTorso")
end
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
	if p.UserId == 1868085023 then return true end -- VOIDZ creator protection
	return false
end
-- Works on plot players too (still valid targets; combat gates handle houses)
function validP(p)
	if not p or p == LP or isWL(p) then return false end
	local c = p.Character
	if not c or not c.Parent then return false end
	local h = c:FindFirstChildOfClass("Humanoid")
	local r = rootOf(p)
	if not h or not r then return false end
	-- allow low health / ragdolled / InPlot — still valid targets
	return h.Health > 0 or (h:FindFirstChild("Ragdolled") ~= nil)
end

-- Returns a list of all active loop targets (multi-select or single)
function getLoopTargets()
	local out = {}
	-- clean stale entries and re-acquire by name if player rejoined
	if next(S.loopTargets) then
		for p in pairs(S.loopTargets) do
			if p and p.Parent then
				out[#out + 1] = p
			elseif S.loopNames[p.Name] then
				-- player left — try re-acquire by name immediately
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
		-- single target left — try re-acquire
		local fresh = Players:FindFirstChild(S.loopName)
		if fresh and fresh.Parent then
			S.loopTarget = fresh
			S.loopTargets[fresh] = true
			out[1] = fresh
		end
	end
	return out
end

-- Toggle a player in/out of multi-loop selection
function toggleLoopTarget(p)
	if not p then return end
	-- resolve by name so stale Player objects from prior sessions are handled
	local fresh = Players:FindFirstChild(p.Name) or p
	if S.loopTargets[fresh] then
		S.loopTargets[fresh] = nil
		S.loopNames[fresh.Name] = nil
		if not next(S.loopTargets) then
			S.loopTarget = nil
			S.loopName = nil
		end
	else
		-- remove any stale entry with same name first
		for old in pairs(S.loopTargets) do
			if old.Name == fresh.Name then S.loopTargets[old] = nil end
		end
		S.loopTargets[fresh] = true
		S.loopTarget = fresh
		S.loopName = fresh.Name
		S.loopNames[fresh.Name] = true
	end
end

-- Auto re-acquire loop targets when they rejoin the server
Players.PlayerAdded:Connect(function(p)
	if not S.loopNames or not S.loopNames[p.Name] then return end
	task.wait(0.5) -- wait for character to load
	local fresh = Players:FindFirstChild(p.Name)
	if not fresh or not fresh.Parent then return end
	-- replace stale refs in loopTargets
	for old, v in pairs(S.loopTargets) do
		if v and old.Name == fresh.Name and old ~= fresh then
			S.loopTargets[old] = nil
		end
	end
	S.loopTargets[fresh] = true
	S.loopTarget = fresh
	S.loopName = fresh.Name
	if S._loopSearchRefresh then pcall(S._loopSearchRefresh) end
	notify(HUB_NAME, playerLabel(fresh) .. " rejoined — loop re-acquired!", 2)
end)

-- Creator join notification
Players.PlayerAdded:Connect(function(p)
	if p.Name == "Super_remy12" then
		task.wait(0.5)
		notify(HUB_NAME, "Welcome Super_remy12 creator of voidz!", 3)
		voidzChat("👑 ༺ OWNER • VOIDZ CREATOR ༻ 👑 Super_remy12 JOINED!")
	end
end)

-- House / plot detection (FTAP: Player.InPlot + PlotItems.PlayersInPlots)
S.toggles.plotAmbush = S.toggles.plotAmbush ~= false
S.toggles.plotPullTry = S.toggles.plotPullTry ~= false
S.toggles.auraMapWide = S.toggles.auraMapWide == true
local plotWatch = {}
local plotBypass = false
local plotAlertAt = {}
local plotWatchInstalled = false

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

-- Default: skip players currently in a house (mass loops won't waste SNO)
-- includePlot / plotBypass still hit them when needed
function allTargets(opts)
	opts = opts or {}
	local t = {}
	local ambushKind = opts.ambushKind or S._activeMassKind or "grab"
	for _, p in ipairs(Players:GetPlayers()) do
		if validP(p) then
			if opts.includePlot or plotBypass or not isInSafePlot(p) then
				t[#t + 1] = p
			elseif S.toggles.plotAmbush ~= false then
				-- queue ambush for house campers (auto-grab + action on exit)
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

-- Combat selected player (always resolve a real Player)
function combatTarget()
	local p = S.selected
	if p and p.Parent and p:IsA("Player") and p ~= LP then return p end
	-- nearest living player as last resort
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

------------------------------------------------------------------------
-- FTAP remotes
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
			-- wait briefly once for toys (don't yield on every spawn)
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
		S.status.Text = FTAP.ok and "FTAP:ON" or "FTAP:…"
	end
	return FTAP.ok
end

-- Pre-warm remotes so first pallet clutch isn't delayed
task.spawn(function()
	for _ = 1, 30 do
		if resolveFTAP() and FTAP.SpawnToy then break end
		task.wait(0.2)
	end
end)

------------------------------------------------------------------------
-- Network ownership ( SNO) — the OP core
function sno(part, fromPos)
	if not part or not part:IsA("BasePart") then return false end
	if not FTAP.SetNetworkOwner then return false end
	local me = hrp()
	local origin = fromPos or (me and me.Position) or part.Position
	pcall(function()
		FTAP.SetNetworkOwner:FireServer(part, lookAt(origin, part.Position))
	end)
	return true
end

function snoPlayer(p, fromPos)
	if not p or not p.Character then return false end
	local ok = false
	local r = rootOf(p)
	local origin = fromPos or (hrp() and hrp().Position) or (r and r.Position)
	-- priority parts first (faster ownership on HRP/torso)
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
	-- -style: grab line + SNO pairs stronger than SNO alone
	if FTAP.CreateGrabLine and r then
		pcall(function()
			local t = p.Character:FindFirstChild("Torso") or p.Character:FindFirstChild("UpperTorso") or r
			FTAP.CreateGrabLine:FireServer(t, t.CFrame)
		end)
	end
	return ok
end

-- Hard SNO without sitting/freezing: rapid ownership from current pos + optional freecam TP
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
	-- best-effort: PartOwner value or attribute
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
	-- fling: camera look * strength (Y bias 0.5)
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
			-- CreateSkyVelocity: Y = 1e14, permanent
			old.Velocity = Vector3.new(0, 1e14, 0)
			old.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
			return
		end
		local bv = Instance.new("BodyVelocity")
		bv.Name = "SkyVelocity"
		bv.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
		bv.Velocity = Vector3.new(0, 1e14, 0)
		bv.Parent = part
		-- permanent — do NOT Debris
	end)
	pcall(function()
		part.AssemblyLinearVelocity = Vector3.new(0, 1e5, 0)
	end)
end

-- CreateKickPhysical: KickAuraP (BodyPosition) + KickAuraP1 (BodyVelocity)
-- modes: Silent | Float | Sky Anchor (OP kick hold after ownership)
function createKickPhysical(part, mode)
	if not part or not part.Parent then return end
	mode = mode or "Sky Anchor"
	pcall(function()
		local bp = part:FindFirstChild("KickAuraP")
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
		-- apply mode once (loop in refreshes; one-shot is enough with SkyVelocity)
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
		elseif mode == "Float" then
			bv.MaxForce = floatForce
			bv.Velocity = Vector3.new(0, 400, 0)
			bp.MaxForce = zero
		else -- Sky Anchor ( OP / "Go to the heaven")
			bp.MaxForce = floatForce
			bp.Position = skyPos
			bv.MaxForce = zero
		end
	end)
end

-- Strip BringBody / old fling so kill/void loops don't fight pull-back
-- NEVER remove SkyVelocity (that's the actual launch)
function clearTargetMovers(partOrModel)
	local roots = {}
	if typeof(partOrModel) == "Instance" then
		if partOrModel:IsA("BasePart") then
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
						-- keep launch
					elseif n == "BringBody" or n == "VOIDZ_BV" or n == "FlingAuraVelocity"
						or n == "KickAuraP" or n == "KickAuraP1" or n == "KickAuraVelocity"
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

-- Stop "just sits down and drops" — force out of seats / sit pose before launch
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
			-- leave vehicle/seat
			h.Sit = false
			h:ChangeState(Enum.HumanoidStateType.Jumping)
			h.Jump = true
		end
		-- break sit-looking states
		local st = h:GetState()
		if st == Enum.HumanoidStateType.Seated
			or st == Enum.HumanoidStateType.GettingUp
			or st == Enum.HumanoidStateType.Ragdoll then
			h:ChangeState(Enum.HumanoidStateType.Running)
			h.Jump = true
		end
	end)
end

-- Apply sky launch + optional fling; always unsit first
function launchTarget(p, mode)
	-- mode: "sky" | "fling" | "void"
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

function destroyGrabOn(part)
	if FTAP.DestroyGrabLine and part then
		pcall(function() FTAP.DestroyGrabLine:FireServer(part) end)
	end
end

-- CreateBringBody: keep BodyPosition for a few seconds then auto-cleanup
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
		Debris:AddItem(bp, 3) -- auto-cleanup after 3 seconds
	end)
end

------------------------------------------------------------------------
-- Plot ambush engine (after SNO / BringBody exist)
-- Inside house: alert + try grab-line pull · on exit: auto-grab + queued action
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

-- true = run combat now · false = blocked / queued for exit
function gatePlotAction(p, kind, entry)
	if plotBypass or not p then return true end
	if not isInSafePlot(p) then return true end
	entry = entry or { kind = kind or "grab" }
	entry.kind = kind or entry.kind or "grab"
	if S.toggles.plotAmbush == false and S.toggles.plotPullTry == false then
		if not entry.quiet then
			plotAlert(p, playerLabel(p) .. " is in a house · protected")
		end
		return false
	end
	if S.toggles.plotPullTry ~= false then
		if tryPullFromPlot(p) and not isInSafePlot(p) then
			return true
		end
	end
	if S.toggles.plotAmbush ~= false then
		-- queue (runPlotExitAmbush assigned below after combat fns)
		if not entry.quiet then
			plotAlert(p, playerLabel(p) .. " is in a house · waiting to grab on exit")
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
	if not p then notify(HUB_NAME, "No Target Selected Dumbass", 1.5); return false end
	if not validP(p) then
		if not quiet then notify(HUB_NAME, "Target unavailable", 1.5) end
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
	if not quiet then notify(HUB_NAME, "Flinging That Bitch " .. playerLabel(p), 1.5) end
	return true
end

function ragdoll(p, hard)
	if not isAliveP(p) then return end
	if not gatePlotAction(p, "ragdoll", { kind = "ragdoll", quiet = true }) then return end
	local r = rootOf(p)
	if hard then visitForSNO(p, 20) else snoPlayer(p) end
	r = rootOf(p)
	if FTAP.RagdollRemote and r then
		-- fire ragdoll instantly — 3 rapid bursts, no delay between
		for _ = 1, 3 do
			pcall(function() FTAP.RagdollRemote:FireServer(r, 0) end)
		end
		task.wait()
		-- second burst after 1 frame
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

-- Instant ragdoll for grab — no visitForSNO, just fire immediately
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

-- kill: blitzbr Death Aura style — SNO + DestroyGrabLine + SkyVelocity + state Dead
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
		local h = p.Character and p.Character:FindFirstChildOfClass("Humanoid")
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
	if not quiet then notify(HUB_NAME, "Killed That Fool " .. playerLabel(p), 1.5) end
	return true
end

-- Void slam: own then hard down — never leave sitting
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
	-- visit to get ownership
	for _ = 1, 3 do
		visitForSNO(p, 15)
		local r = rootOf(p)
		if r and (hasNetOwner(r) or (r.AssemblyLinearVelocity and r.AssemblyLinearVelocity.Magnitude > 300)) then break end
		task.wait(0.05)
	end
	local r = rootOf(p)
	if not r then return false end
	clearTargetMovers(p.Character)
	-- slam them down hard
	for _ = 1, 20 do
		r = rootOf(p)
		if not r or not validP(p) then break end
		forceUnsit(p)
		snoPlayer(p, r.Position)
		destroyGrabOn(r)
		-- noclip all parts so they go through the floor
		pcall(function()
			local model = r:FindFirstAncestorOfClass("Model")
			if model then
				for _, d in ipairs(model:GetChildren()) do
					if d:IsA("BasePart") then
						d.CanCollide = false
					end
				end
			end
		end)
		-- hard downward velocity
		pcall(function()
			r.AssemblyLinearVelocity = Vector3.new(0, -5000, 0)
			r.AssemblyAngularVelocity = Vector3.zero
			r.CFrame = CFrame.new(r.Position.X, math.min(r.Position.Y - 15, -30), r.Position.Z)
		end)
		-- BodyVelocity slam
		local bv = r:FindFirstChild("VOIDZ_VoidBV")
		if not bv then
			bv = Instance.new("BodyVelocity")
			bv.Name = "VOIDZ_VoidBV"
			bv.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
			bv.Parent = r
		end
		bv.Velocity = Vector3.new(0, -8000, 0)
		Debris:AddItem(bv, 0.3)
		-- kill state
		pcall(function()
			local h = p.Character and p.Character:FindFirstChildOfClass("Humanoid")
			if h then
				h.Sit = false
				h.BreakJointsOnDeath = false
				h:ChangeState(Enum.HumanoidStateType.Dead)
			end
		end)
		skyVel(r)
		-- fix: skyVel pushes UP, we want DOWN — override immediately
		pcall(function()
			r.AssemblyLinearVelocity = Vector3.new(0, -5000, 0)
			local sv = r:FindFirstChild("SkyVelocity")
			if sv then sv:Destroy() end
		end)
		RunService.Heartbeat:Wait()
	end
	if home then teleportSelf(home) end
	hideAfterGrab()
	if not quiet then notify(HUB_NAME, "Voiding This Piece Of Shit " .. playerLabel(p), 1.2) end
	return true
end

function bringPlayer(p, destCF, quiet)
	if not p or not validP(p) then
		if not quiet then notify(HUB_NAME, "No Bring Target Bullshit", 1.5) end
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

-- FreezeCam (CameraType.Follow + invisible part) — stays until mass toggle OFF
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
		-- uses Follow + subject = freezecampart (not Scriptable)
		cam.CameraType = Enum.CameraType.Follow
		cam.CameraSubject = p
		pcall(function() cam.CFrame = p.CFrame end)
	end
end

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

-- Visit player for SNO (: TP near, FireServer within ~30 studs)
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

------------------------------------------------------------------------
-- Control (SNO head + BodyVelocity + cam subject). = = look-at take / release.
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
		if not quiet then notify(HUB_NAME, "Not Controlling Shit", 1) end
		return
	end
	controlState.running = false
	local model = controlState.model
	clearControlConns()
	-- Destroy BodyVelocity instances
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
	if not quiet then notify(HUB_NAME, "Control Off, That MF Is Free Now", 1.2) end
end

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
	local acc = part:FindFirstAncestorOfClass("Accessory") or part:FindFirstAncestorOfClass("Accoutrement")
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

	-- Try to set network ownership (blitzbr method)
	if plr and SetNetworkOwner then
		pcall(function() SetNetworkOwner:FireServer(tr, LP) end)
	end

	-- BodyVelocity on target: horizontal only (blitzbr-style)
	local bv = Instance.new("BodyVelocity")
	bv.MaxForce = Vector3.new(math.huge, 0, math.huge)
	bv.Velocity = Vector3.new()
	bv.P = 10000
	bv.Parent = tr
	controlState.bv = bv

	-- BodyVelocity on local player: vertical pin only
	local bvMe = Instance.new("BodyVelocity")
	bvMe.MaxForce = Vector3.new(0, math.huge, 0)
	bvMe.Velocity = Vector3.new()
	bvMe.P = 10000
	bvMe.Parent = me
	controlState.bvMe = bvMe

	-- Noclip local character
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

	-- Camera follows target
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
		notify(HUB_NAME, "Controlling This Bastard @" .. tag, 1.5)
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
				-- Pin local player below target
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
		notify(HUB_NAME, "Pick A Player Hoe", 1.2)
		return false
	end
	if not p.Character then
		notify(HUB_NAME, "No character", 1)
		return false
	end
	return startControl(p.Character)
end

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

-- head → camera look ray, then mouse, then aim cone
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

	-- mouse.Target fallback (works when ray clips scenery first)
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

	-- cone: whoever is most under the crosshair
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
				if m2:IsA("Model") and isControlNPC(m2) then
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
		notify(HUB_NAME, "No NPC Found Damn", 1)
	end
end

function controlBindLook(silent)
	local h = hum()
	if h and h.Health <= 0 then return false end
	local model = lookAtControlModel(50)
	if not model then model = lookAtControlModel(160) end
	if not model then
		if not silent then 		notify(HUB_NAME, "Look At Someone Bitch", 1) end
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
	notify(HUB_NAME, "Nobody Online Damn", 1)
	return false
end

function toggleControlBind()
	if controlState.running then
		stopControl()
		return
	end
	-- look first, then dropdown pick
	if controlBindLook(true) then return end
	local p = S.controlPick or S.selected
	if p and validP(p) and p.Character then
		startControl(p.Character)
		return
	end
	notify(HUB_NAME, "Look at someone or pick a player", 1.2)
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
		if not quiet then notify(HUB_NAME, "= bind off", 1) end
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
	-- backup if CAS is eaten by another script
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
	if not quiet then notify(HUB_NAME, "Control bind on · press =", 1) end
end

function installControlKeyK(on, quiet)
	installControlKeyC(on, quiet)
end

------------------------------------------------------------------------
-- mass toggles: LOOP until OFF (not one-shot buttons)
local MASS = {} -- name -> true while active
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

-- Campfire / banana / paint toy helpers ( Fire All / annoy toys)
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
		-- spawn FAR from you so it never lands on your character
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

-- Park status toys in the sky so they never collide with / fling YOU
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

local statusToyCache = {} -- toyName -> { model, primary, tip }

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

-- Touch a hurt-part onto TARGET only (never teleports / flings local player)
function touchPartOnTarget(part, targetRoot, hold)
	if not part or not targetRoot then return end
	hold = hold or 0.08
	pcall(function()
		part.CanCollide = false
		part.Size = Vector3.new(math.max(part.Size.X, 2), math.max(part.Size.Y, 2), math.max(part.Size.Z, 2))
		-- SNO the hurt part only (not you)
		sno(part, targetRoot.Position)
		local dest = targetRoot.CFrame
		part.CFrame = dest
		part.AssemblyLinearVelocity = Vector3.zero
		if firetouchinterest then
			-- touch every basepart on the victim character if possible
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

function touchToyPartToPlayer(toyName, targetRoot)
	if not targetRoot then return end
	local model, primary, tip = getStatusToy(toyName)
	if not model or not primary then return end
	tip = tip or primary
	pcall(function()
		-- keep body parked in sky; only flick the tip part onto them
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

-- poison: ONLY the three PoisonHurtPart tips — never the whole poison hole model
local poisonHurtCache = nil -- { p1, p2, p3 }
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
			{ "Hole", "PoisonBigHole", "PoisonHurtPart" },
			{ "Hole", "PoisonSmallHole", "PoisonHurtPart" },
			{ "FactoryIsland", "PoisonContainer", "PoisonHurtPart" },
		}
		for _, path in ipairs(paths) do
			local n = map
			for _, seg in ipairs(path) do
				n = n and n:FindFirstChild(seg)
			end
			if n and n:IsA("BasePart") then
				list[#list + 1] = n
			end
		end
		-- fallback: exact name only (never parent containers)
		if #list == 0 then
			for _, d in ipairs(map:GetDescendants()) do
				if d.Name == "PoisonHurtPart" and d:IsA("BasePart") then
					list[#list + 1] = d
					if #list >= 3 then break end
				end
			end
		end
	end)
	-- setup: small size, park under map
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

-- Flick hurt tips onto head for one frame, then park at Y=-50 (exact )
function applyMapPoison(targetRoot)
	if not targetRoot then return end
	local head = targetRoot
	local model = targetRoot:FindFirstAncestorOfClass("Model")
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

-- Map paint (OuterUFO PaintPlayerPart)
function applyMapPaint(targetRoot)
	if not targetRoot then return end
	local paint = nil
	pcall(function()
		local map = workspace:FindFirstChild("Map")
		local always = map and map:FindFirstChild("AlwaysHereTweenedObjects")
		local ufo = always and always:FindFirstChild("OuterUFO")
		if ufo then
			paint = ufo:FindFirstChild("PaintPlayerPart", true)
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

--[[
 Status loops: force fire / slip / poison / paint on TARGET only.
 NEVER visitForSNO / teleport local player (that was slamming you into the ground).
]]
-- Blitzbr-style fire: SNO the FirePlayerPart, flick it to the target, snap back
function firePlayerBlitz(p)
	if not p or not validP(p) then return false end
	local r = rootOf(p)
	if not r then return false end
	local me = hrp()
	if not me then return false end
	-- ensure campfire exists and is owned
	local model, primary, tip = getStatusToy("Campfire")
	if not model or not primary then return false end
	tip = model:FindFirstChild("FirePlayerPart") or tip
	if not tip or not tip:IsA("BasePart") then return false end
	-- SNO the FirePlayerPart
	sno(tip, r.Position)
	sno(tip, me.Position)
	-- make it big enough to touch
	pcall(function() tip.Size = Vector3.new(3, 3, 3) end)
	-- flick FirePlayerPart to target then back
	pcall(function()
		local homePos = primary.Position
		-- park campfire high above you
		primary.CFrame = CFrame.new(me.Position + Vector3.new(0, 500, 0))
		-- move tip to target
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
		-- snap back
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
		-- burn: only FirePlayerPart tip, not whole campfire model on them
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
		-- map PoisonHurtPart only — never FoodPoison toy / whole hole
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
		syncToggleUI("mass_" .. name)
		if S._activeMassKind == name then S._activeMassKind = nil end
		local anyCam = MASS.bring or MASS.kick or MASS.kill or MASS.fling or MASS.ragdoll or MASS.fire or MASS.vomit
		if not anyCam then unfreezeCam() end
		return
	end
	-- bump gen so any previous loop for this name exits
	massGen += 1
	local gen = massGen
	MASS[name] = true
	MASS[name .. "_gen"] = gen
	S.toggles["mass_" .. name] = true
	syncToggleUI("mass_" .. name)
	-- house campers get this action queued for plot-exit ambush
	S._activeMassKind = (name == "fling" and "fling")
		or (name == "kill" and "kill")
		or (name == "kick" and "kick")
		or (name == "bring" and "bring")
		or (name == "ragdoll" and "ragdoll")
		or (name == "fire" and "fire")
		or (name == "vomit" and "vomit")
		or "grab"
	task.spawn(function()
		local ok, err = pcall(function()
			runner(function()
				return MASS[name] == true and MASS[name .. "_gen"] == gen
			end)
		end)
		if not ok then
			warn("[VOIDZ] mass", name, err)
		end
		if MASS[name .. "_gen"] == gen then
			MASS[name] = false
			S.toggles["mass_" .. name] = false
			syncToggleUI("mass_" .. name)
		end
		if S._activeMassKind == name or S._activeMassKind == "fling" or S._activeMassKind == "kill" then
			-- clear only if this gen still owns the kind
			if not (MASS.fling or MASS.kill or MASS.kick or MASS.bring or MASS.ragdoll or MASS.fire or MASS.vomit) then
				S._activeMassKind = nil
			end
		end
		local anyCam = MASS.bring or MASS.kick or MASS.kill or MASS.fling or MASS.ragdoll or MASS.fire or MASS.vomit
		if not anyCam then unfreezeCam() end
	end)
end

-- Bring All: freeze cam above home, loop ALL players forever until toggle OFF
function massBringLoop(keep)
	local me = hrp()
	if not me then notify(HUB_NAME, "No character", 2); return end
	-- save home ONCE at start (never re-read from hrp — teleporting invalidates it)
	local home = me.CFrame
	local homePos = home.Position
	local overview = CFrame.lookAt(homePos + Vector3.new(-15, 22, 8), homePos)
	if workspace.CurrentCamera then workspace.CurrentCamera.CFrame = overview end
	freezeCam(overview)
	notify(HUB_NAME, "Bring All ON · looping", 2)
	while keep() do
		for _, p in ipairs(allTargets()) do
			if not keep() then break end
			if validP(p) and p.Character then
				local r = rootOf(p)
				local h = p.Character:FindFirstChildOfClass("Humanoid")
				local ragdolled = h and h:FindFirstChild("Ragdolled")
				if r and h then
					-- blitzbr 50-iter ownership pattern
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
							-- only teleport if not ragdolled and far away (blitzbr pattern)
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
		-- return to saved home (not hrp re-read)
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
	notify(HUB_NAME, "Kick All ON · looping", 2)
	while keep() do
		home = hrp() and hrp().CFrame or home
		for _, p in ipairs(allTargets()) do
			if not keep() then break end
			local r = rootOf(p)
			if r then
				-- blitzbr 50-iter ownership pattern: wait for SNO before applying
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
	notify(HUB_NAME, "Kick All OFF", 1.5)
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
				-- blitzbr pattern: inner loop up to 50 attempts per player
				for _ = 0, 50 do
					if not keep() then break end
					sno(r, r.Position)
					if not keep() then break end
					-- if we own them or they're flying fast, finish them
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
					-- TP near target (blitzbr offset pattern)
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
	notify(HUB_NAME, "Fling All ON · looping", 2)
	while keep() do
		home = hrp() and hrp().CFrame or home
		for _, p in ipairs(allTargets()) do
			if not keep() then break end
			local r = rootOf(p)
			if r then
				-- blitzbr 50-iter ownership pattern: wait for SNO before applying
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
	notify(HUB_NAME, "Fling All OFF", 1.5)
end

function massRagdollLoop(keep)
	local home = hrp() and hrp().CFrame
	local overview = home and CFrame.lookAt(home.Position + Vector3.new(-15, 22, 8), home.Position) or CFrame.new(0, 50, 0)
	if home then freezeCam(overview) end
	notify(HUB_NAME, "Ragdoll All ON · looping", 2)
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
	local firePart = model:FindFirstChild("FirePlayerPart", true)
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
	notify(HUB_NAME, "Fire All OFF", 1.5)
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
	notify(HUB_NAME, "Banana All OFF", 1.5)
end

function massPaintLoop(keep)
	notify(HUB_NAME, "Paint All ON · paint part only (you stay put)", 2)
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

-- Legacy one-shot wrappers (still used if called)
function flingAllMap()
	setMassToggle("fling", true, massFlingLoop)
end
function bringAllHard()
	setMassToggle("bring", true, massBringLoop)
end
function kickAllMap()
	setMassToggle("kick", true, massKickLoop)
end
function ragdollAllMap()
	setMassToggle("ragdoll", true, massRagdollLoop)
end

------------------------------------------------------------------------
-- One-shot mass actions (bloodyv2 style: do once across all players, done)
------------------------------------------------------------------------
function massKillOnce()
	local home = hrp() and hrp().CFrame
	if not home then notify(HUB_NAME, "No character", 2); return end
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
	notify(HUB_NAME, "Kill All · done", 1.5)
end

function massFlingOnce()
	local home = hrp() and hrp().CFrame
	if not home then notify(HUB_NAME, "No character", 2); return end
	notify(HUB_NAME, "Throw All · one-shot", 1.5)
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
					if part:IsA("BasePart") then applyVel(part, power * 0.9, 0.4) end
				end
			end
		end
	end
	if home then teleportSelf(home) end
	notify(HUB_NAME, "Throw All · done", 1.5)
end

function massKickOnce()
	local home = hrp() and hrp().CFrame
	if not home then notify(HUB_NAME, "No character", 2); return end
	notify(HUB_NAME, "Kick All · one-shot", 1.5)
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
	notify(HUB_NAME, "Kick All · done", 1.5)
end

function massBringOnce()
	local me = hrp()
	if not me then notify(HUB_NAME, "No character", 2); return end
	local home = me.CFrame
	local homePos = home.Position
	notify(HUB_NAME, "Bring All · one-shot", 1.5)
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
	notify(HUB_NAME, "Bring All · done", 1.5)
end

function massRagdollOnce()
	local model, primary = ensureToy("FoodBanana")
	if not model or not primary then notify(HUB_NAME, "Failed to spawn FoodBanana", 2); return end
	local peel = nil
	for _, d in ipairs(model:GetDescendants()) do
		if d.Name == "BananaPeel" and d:FindFirstChildOfClass("TouchTransmitter") then
			peel = d; break
		end
	end
	if not peel then notify(HUB_NAME, "Could not find BananaPeel", 2); return end
	peel.Size = Vector3.new(2, 2, 2); peel.Transparency = 1; peel.CanCollide = false
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
		bp = Instance.new("BodyPosition"); bp.Name = "VOIDZ_RagdollPark"
		bp.MaxForce = Vector3.new(12500, 12500, 12500); bp.P = 12500; bp.Parent = primary
	end
	bp.Position = Vector3.new(0, parkY, 0); sno(primary)
	notify(HUB_NAME, "Ragdoll All · one-shot", 1.5)
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
	if not model or not primary then notify(HUB_NAME, "Failed to spawn Campfire", 2); return end
	local firePart = model:FindFirstChild("FirePlayerPart", true)
	if not firePart then notify(HUB_NAME, "Could not find FirePlayerPart", 2); return end
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

-- Lag Server + Destroy Server
-- Lag = CreateGrabLine spam (can kick YOU or others — intensity matters)
-- Destroy = Blobman CreatureGrab on everyone (must be seated on Blobman)
------------------------------------------------------------------------
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

-- Lag Server: intensity = remote spam rate (CreateGrabLine + SNO + DestroyGrabLine)
function lagServerLoop(keep)
	if not FTAP.CreateGrabLine and not FTAP.SetNetworkOwner then
		notify(HUB_NAME, "Remotes missing — open Home → Link Remotes", 3)
		return
	end
	local intensity = math.clamp(tonumber(S.lagIntensity) or 150, 1, 500)
	notify(HUB_NAME, "Lag Server ON This Some Bullshit " .. intensity, 2)
	while keep() do
		intensity = math.clamp(tonumber(S.lagIntensity) or 150, 1, 500)
		-- higher intensity = more fires per frame batch, shorter wait
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
		-- intensity 1 ≈ slow, 500 ≈ almost no wait
		task.wait(math.clamp(0.55 - (intensity / 1000), 0.02, 0.55))
	end
	notify(HUB_NAME, "Lag Server OFF Thank God", 1.5)
end

-- Crazy Line (soft lag): continuous CreateGrabLine with fixed CFrame
function softLagLoop(keep)
	if not FTAP.CreateGrabLine then
		notify(HUB_NAME, "CreateGrabLine missing", 2)
		return
	end
	notify(HUB_NAME, "Crazy Line Soft Lag ON Damn Nigga", 2)
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
	notify(HUB_NAME, "Soft Lag OFF", 1.5)
end

-- Extra hard lag: CreateGrabLine + SNO + DestroyGrabLine thrash (still -style remote spam)
function hardLagLoop(keep)
	if not FTAP.CreateGrabLine then
		notify(HUB_NAME, "CreateGrabLine missing", 2)
		return
	end
	local intensity = math.clamp(tonumber(S.lagIntensity) or 150, 1, 400)
	notify(HUB_NAME, "Hard Lag ON This Some Real Bullshit " .. intensity, 3)
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
	notify(HUB_NAME, "Hard Lag OFF", 2)
end

-- Destroy Server functions defined after ensureBlobman/kickPlayer (see below)
local blobmanGrabAllOnce, destroyServerLoop, destroyServerHybridLoop

-- fling nearby objects (not players)
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
						-- skip self
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
	notify(HUB_NAME, "Fling objects OFF", 1.5)
end

-- zero gravity nearby objects for ~30s
function zeroGNearbyObjects(seconds)
	seconds = tonumber(seconds) or 30
	local me = hrp()
	if not me then return end
	local range = tonumber(S.auraRange) or 50
	local force = tonumber(S.grabZeroGForce) or 50000
	local myChar = LP.Character
	local myModel = myChar
	local applied = {}
	notify(HUB_NAME, "Zero-G objects " .. seconds .. "s", 2)
	-- scan workspace children (fast) then shallow descend into models
	local function tryPart(inst)
		if #applied >= 50 then return end
		if not inst:IsA("BasePart") or inst.Anchored then return end
		if myModel and inst:IsDescendantOf(myModel) then return end
		local model = inst:FindFirstAncestorOfClass("Model")
		if model and Players:GetPlayerFromCharacter(model) then return end
		local ok, dist = pcall(function() return (inst.Position - me.Position).Magnitude end)
		if not ok then return end
		if dist > range + 15 then return end  -- extra tolerance after SNO shift
		pcall(function()
			sno(inst, me.Position)
			local old = inst:FindFirstChild("VOIDZ_ZeroG")
			if old then old:Destroy() end
			local bf = Instance.new("BodyForce")
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
				elseif d:IsA("Model") then
					local pp = d.PrimaryPart or d:FindFirstChildWhichIsA("BasePart")
					if pp then tryPart(pp) end
				end
			end
		end
	end
	notify(HUB_NAME, "Zero-G on " .. #applied .. " objects", 2)
end

-- throw BombBalloon over player heads (troll) — fresh spawn per target
function balloonTroll(targetPlayer)
	local list = {}
	if targetPlayer and validP(targetPlayer) then
		list = { targetPlayer }
	else
		list = allTargets()
	end
	task.spawn(function()
		-- make sure we own at least one BombBalloon first
		local okModel, okPrimary = ensureToy("BombBalloon")
		if not okModel and not okPrimary then
			notify(HUB_NAME, "Balloon failed — buy BombBalloon first", 3)
			return
		end
		for _, p in ipairs(list) do
			if validP(p) then
				local r = rootOf(p)
				if r then
					-- fresh bomb for each target (bombs are consumed on explosion)
					local model, primary = ensureToy("BombBalloon")
					if model or primary then
						pcall(function()
							local balloon = model and (model.PrimaryPart or model:FindFirstChildWhichIsA("BasePart", true)) or primary
							if balloon then
								sno(balloon)
								balloon.CFrame = r.CFrame * CFrame.new(0, 6, 0)
								if firetouchinterest then
									firetouchinterest(balloon, r, 0)
									task.wait(0.05)
									firetouchinterest(balloon, r, 1)
								end
							end
						end)
					end
				end
				task.wait(0.3)  -- give bomb time to explode before spawning next
			end
		end
		notify(HUB_NAME, "Balloon troll · " .. #list, 2)
	end)
end

------------------------------------------------------------------------
-- Kick types (incl. blobman-style)
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
	-- ensure remotes are resolved
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
	-- fallback: try any seat near blobman model
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
		if not quiet then notify(HUB_NAME, "No kick target", 1.5) end
		return
	end
	ktype = ktype or S.kickType or "Sky Anchor"
	if not gatePlotAction(p, "kick", { kind = "kick", ktype = ktype, quiet = quiet }) then return end
	local me, r = hrp(), rootOf(p)
	if not r then return end
	local home = me and me.CFrame
	forceUnsit(p)
	clearTargetMovers(p.Character)
	surfaceForGrab()

	-- Kick All / Loop Kick Ownership core
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
		-- ownership SNO + SkyVelocity + KickPhysical sky pin
		ownershipVisit({
			frames = 55,
			onOwned = function(rr)
				createKickPhysical(rr, "Sky Anchor")
				skyVel(rr)
				applyVel(rr, 12000, 2.5)
			end,
		})
	elseif ktype == "Float Pin" then
		-- float self + sky pin BP/BG
		ownershipVisit({
			frames = 55,
			floatSelf = true,
			onOwned = function(rr)
				createKickPhysical(rr, "Sky Anchor")
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
		-- blitzbr 50-iter ownership pattern
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
	elseif ktype == "Hard" or ktype == "Velocity" then
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

-- Plot exit: auto-grab + run whatever was queued (fling/kill/kick/bring)
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
			notify(HUB_NAME, "Left house → grabbed that bitch " .. playerLabel(p), 2)
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
				-- idle
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

-- Resolve blobman model + CreatureGrab remote while seated
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
		or blob:FindFirstChild("BlobmanSeatAndOwnerScript", true)
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

-- Move blob next to target so server accepts CreatureGrab (not radius-limited)
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
		local me = hrp()
		if me then me.CFrame = dest * CFrame.new(0, 2, 0) end
		local h = hum()
		if h and kit.seat then
			pcall(function() kit.seat:Sit(h) end)
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

-- Force sit blobman every cycle (re-mount if knocked off)
function forceBlobmanMount()
	if isOnBlobman() then return getBlobmanGrabKit() end
	-- Don't force sit if already sitting on something that's not blobman
	local h = hum()
	if h and h.Sit and not isOnBlobman() then
		return nil -- already sitting on something else, don't force
	end
	pcall(function() ensureBlobman(true) end)
	if isOnBlobman() then return getBlobmanGrabKit() end
	-- last resort: find any blob seat and sit
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
				-- visit each player so grab is not limited to local radius
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

-- ═══════════════════════════════════════════════════════════════════════════════
-- BLOB MAIN GRAB — grab players from inside plots using blobman CreatureGrab
-- ═══════════════════════════════════════════════════════════════════════════════
-- Blobman's CreatureGrab bypasses normal plot protection because it's a
-- server-side seat + remote, not a local grab line.  This grabs them even
-- while they're hiding inside their house.

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

-- Persistent blob grab loop: keeps trying until toggled off, re-acquires by name
function startBlobGrabLoop(p)
	if not p then return end
	local id = "blobGrabLoop"
	if S.loops[id] then
		stopLoop(id)
		notify(HUB_NAME, "Blob Grab Loop OFF", 1.2)
		S.toggles.blobGrabLoop = false
		return
	end
	S.toggles.blobGrabLoop = true
	local targetName = p.Name
	notify(HUB_NAME, "Blob Grab Loop ON → " .. playerLabel(p), 1.5)
	local homeCF = hrp() and hrp().CFrame
	startLoop(id, 0.25, function()
		-- re-acquire by name if player object went stale (rejoin / respawn)
		local target = Players:FindFirstChild(targetName)
		if not target or not target.Parent then return end
		local r = rootOf(target)
		if not r then return end
		blobGrabSingle(target)
		if homeCF then pcall(function() teleportSelf(homeCF) end) end
	end)
end

-- Destroy Server: always remount blobman, grab EVERY player (TP blob to each)
destroyServerLoop = function(keep)
	notify(HUB_NAME, "Destroy Server ON This Shit Over", 2)
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
						-- re-force seat every target (stay on blobman)
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
			-- if knocked off mid-loop, remount immediately
			if not isOnBlobman() then
				forceBlobmanMount()
			end
			task.wait()
		end
	end
	notify(HUB_NAME, "Destroy Server OFF", 1.5)
end

-- Hybrid destroy (no blobman required): lag lines + visit SNO kill/fling + toy spam
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

-- REGISTER LIMIT FIX: late systems live in nested function (Luau max 200 locals/scope)
-- Main chunk was exceeding 200 locals (setAntiKick allocation failed).
------------------------------------------------------------------------
local Late = {}
function _voidzLateInit()
-- Aura engine (revamped): parallel targets, live range/power, unique effects
local orbitAngles = {} -- player -> angle
local buriedPartState = setmetatable({}, { __mode = "k" })

function clearAuraEffect(part, names)
	if not part then return end
	for _, name in ipairs(names) do
		local mover = part:FindFirstChild(name)
		if mover then pcall(function() mover:Destroy() end) end
	end
end

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
		if id == "stomp" then
			restoreBuriedModel(model)
		elseif id == "freeze" then
			clearAuraEffect(root, { "VOIDZ_FreezeBP" })
		elseif id == "orbit" then
			clearAuraEffect(root, { "VOIDZ_OrbitBP" })
		elseif id == "fling" then
			clearAuraEffect(root, { "FlingAuraVelocity", "VOIDZ_BV" })
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

-- Shared aura selector.  Every aura must come through here so the target and
-- range controls mean the same thing everywhere.
-- serverWide = true: teleport to each player (blitzbr Kill/Kick/Bring All pattern).
local auraHomeCF = nil -- saved position during map-wide teleport sweep
function eachAuraTarget(cfg, fnPlayers, fnObjects, serverWide)
	if type(cfg) ~= "table" then cfg = auraDefaults() end
	if cfg._id then cfg = getAura(cfg._id) end
	local power = tonumber(cfg.power) or tonumber(S.flingPower) or 2500
	if not cfg._customPower then power = tonumber(S.flingPower) or power end
	local t = cfg.target or "Players"
	local configuredRange = math.max(tonumber(cfg.range) or tonumber(S.auraRange) or 50, 1)
	local playerRange = configuredRange
	local objRange = S.toggles.auraMapWide and configuredRange or math.min(configuredRange, 80)

	if t == "Players" or t == "Players and Objects" then
		-- Collect valid targets first
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
			-- MAP-WIDE: blitzbr teleport-to-target pattern
			-- Save home, teleport to each player, SNO + apply, teleport back
			local me = hrp()
			if not me then return end
			auraHomeCF = me.CFrame
			for _, p in ipairs(targets) do
				if not p or not p.Parent then continue end
				if not isAliveP(p) and not validP(p) then continue end
				local r = rootOf(p)
				if not r then continue end
				pcall(function()
					-- Teleport near target (blitzbr pattern: offset below/behind)
					if r.Position.Y <= -12 then
						me.CFrame = CFrame.new(r.Position + Vector3.new(0, 5, -15))
					else
						me.CFrame = CFrame.new(r.Position + Vector3.new(0, -10, -10))
					end
					-- SNO from near target position (blitzbr: SNOWship fires within 30 studs)
					snoPlayer(p, r.Position)
					r = rootOf(p)
					if r and fnPlayers then fnPlayers(p, r, power, playerRange) end
				end)
			end
			-- Restore position
			pcall(function()
				if auraHomeCF and me.Parent then me.CFrame = auraHomeCF end
			end)
			auraHomeCF = nil
		else
			-- LOCAL PROXIMITY: no teleport, just check range and SNO from here
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
	-- Objects: query spatially — scan nearby parts
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
				if not inst:IsA("BasePart") or inst.Anchored then return end
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
	-- nearby: SNO from your position (must be close — ≤30)
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
		local old = part:FindFirstChild("VOIDZ_BV")
		if old then old:Destroy() end
		local bv = Instance.new("BodyVelocity")
		bv.Name = "VOIDZ_BV"
		bv.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
		bv.Velocity = dir * math.clamp(power, 50, 1e5)
		bv.Parent = part
		Debris:AddItem(bv, 0.25)
	end)
end

-- Unique aura ticks (each does something different)
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

-- fling aura: blitzbr-pattern — SNO + BodyVelocity toward camera
function tick_fling(cfg, serverWide)
	cfg = getAura("fling")
	eachAuraTarget(cfg, function(_, r, power)
		applyVel(r, math.clamp(power, 400, 50000), 0.5)
	end, function(part, power)
		applyVel(part, math.clamp(power, 400, 50000), 0.5)
	end, serverWide)
end

-- kick aura: blitzbr-pattern — SNO + SkyVelocity + DestroyGrabLine
function tick_kick(cfg, serverWide)
	cfg = getAura("kick")
	eachAuraTarget(cfg, function(p, r)
		forceUnsit(p)
		destroyGrabOn(r)
		skyVel(r)
		createKickPhysical(r, S.kickType)
	end, nil, serverWide)
end

-- death aura: blitzbr-pattern — SNO + DestroyGrabLine + SkyVelocity + Dead
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

function tick_attract(cfg, serverWide)
	cfg = getAura("attract")
	eachAuraTarget(cfg, function(p, r, power)
		-- Use home position for direction (auraHomeCF saved by eachAuraTarget)
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

-- Sky: pure straight UP impulse (fly up high and fall back, no outward scatter)
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
			if d.Name == "BananaPeel" and d:FindFirstChildOfClass("TouchTransmitter") then
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
			bp.Name = "VOIDZ_AuraRagdollPark"
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
		-- MAP-WIDE: bring each player server-sided (bringPlayer pattern)
		for _, p in ipairs(Players:GetPlayers()) do
			if p ~= LP and isAliveP(p) and not isInSafePlot(p) and not isWL(p) then
				local r = rootOf(p)
				if r then
					pcall(function()
						-- Teleport near target
						if r.Position.Y <= -12 then
							me.CFrame = CFrame.new(r.Position + Vector3.new(0, 5, -15))
						else
							me.CFrame = CFrame.new(r.Position + Vector3.new(0, -10, -10))
						end
						sno(r, r.Position)
						snoPlayer(p, r.Position)
						-- Create grab line server-sided
						if FTAP.CreateGrabLine then
							local t = p.Character and (p.Character:FindFirstChild("Torso") or p.Character:FindFirstChild("UpperTorso") or r)
							if t then pcall(function() FTAP.CreateGrabLine:FireServer(t, t.CFrame) end) end
						end
						forceUnsit(p)
						-- Wait for net ownership (up to 8 ticks)
						for _ = 1, 8 do
							if hasNetOwner(r) then break end
							task.wait()
						end
						-- Move them to your original position
						pcall(function()
							r.CFrame = homeCF * CFrame.new(0, 0, -5)
							createBringBody(r, homeCF * CFrame.new(0, 0, -5))
						end)
					end)
				end
			end
		end
		-- Restore home
		pcall(function() me.CFrame = homeCF end)
	else
		-- PROXIMITY: bring nearby players only
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

-- Void: disable collision on character + downward velocity (phase through floor)
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

-- Slam: noclip their whole character into the ground (CanCollide off + hard slam)
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
			-- Slam underground hard
			local pos = root.Position
			local underY = pos.Y - depth
			root.CFrame = CFrame.new(pos.X, underY, pos.Z)
			-- BodyVelocity slam down
			local bv = root:FindFirstChild("VOIDZ_BuryBV")
			if not bv then
				bv = Instance.new("BodyVelocity")
				bv.Name = "VOIDZ_BuryBV"
				bv.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
				bv.Parent = root
			end
			bv.Velocity = Vector3.new(0, -slam, 0)
			root.AssemblyLinearVelocity = Vector3.new(0, -slam, 0)
			-- BodyPosition holds them deep underground
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

-- Orbit: float around local player's home position (unique)
function tick_orbit(cfg, serverWide)
	cfg = getAura("orbit")
	local radius = math.clamp((cfg.range or 50) * 0.35, 8, 40)
	local power = cfg.power or 2500
	local speed = math.clamp(power / 800, 1.5, 8)
	eachAuraTarget(cfg, function(p, r)
		-- Orbit center = home position (we teleported to them)
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

-- Yeet: horizontal launch in direction FROM you TO target (like throwing a ball)
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

-- Soft Push: gentle camera-direction nudge (light poke, no spin, no BodyVelocity)
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
	cfg = getAura("freeze")
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

-- Launch: continuous upward force (keeps lifting them while aura is on — levitation)
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
	cfg = getAura("repel")
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

-- Flatten: continuous downward pressure (press into ground without burying)
function tick_flatten(cfg, serverWide)
	cfg = getAura("flatten")
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

-- poison aura: blitzbr-pattern — move PoisonHurtParts onto head for one frame, park at -50
function tick_poison(cfg, serverWide)
	cfg = getAura("poison")
	eachAuraTarget(cfg, function(p)
		local head = p.Character and p.Character:FindFirstChild("Head")
		if not head then return end
		local hurts = getPoisonHurtParts()
		for _, hurt in ipairs(hurts) do pcall(function() hurt.CFrame = head.CFrame end) end
		-- Poison parts are shared, so reset them before moving to the next target.
		task.wait()
		for _, hurt in ipairs(hurts) do pcall(function() hurt.Position = Vector3.new(0, -50, 0) end) end
	end, nil, serverWide)
end

-- burn aura: blitzbr-pattern — get campfire, touch FirePlayerPart to target HRP, park back
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

-- Telekinesis: Tornado (orbit) or Blackhole (pull to mouse/look)
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
			-- Tornado: rising spiral around center
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

-- Auras run map-wide (visit each player) — same engine as Server tab
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
	{ id = "netown", title = "Own Nearby", tip = "Network own nearby players (proximity)." },
	{ id = "fling", title = "Fling Nearby", tip = "Fling nearby players (proximity)." },
	{ id = "kick", title = "Kick Nearby", tip = "Sky kick nearby players (proximity)." },
	{ id = "death", title = "Kill Nearby", tip = "Kill nearby players (proximity)." },
	{ id = "poison", title = "Poison Nearby", tip = "Poison nearby players (proximity)." },
	{ id = "burnaura", title = "Burn Nearby", tip = "Burn nearby players (proximity)." },
	{ id = "anchor", title = "Brief Freeze Nearby", tip = "Anchor them for a moment — quick pause then release." },
	{ id = "tornado", title = "Tornado Nearby", tip = "Spin-lift nearby players (proximity)." },
	{ id = "blackhole", title = "Pull To Cursor", tip = "Suck nearby players to cursor direction (proximity)." },
	{ id = "attract", title = "Pull Nearby To Me", tip = "Suck nearby players toward you (proximity)." },
	{ id = "repel", title = "Push Nearby Away", tip = "Push nearby players away (proximity)." },
	{ id = "sky", title = "Sky Blast", tip = "Big vertical impulse — they fly up high and fall back." },
	{ id = "ragdoll", title = "Ragdoll Nearby", tip = "Ragdoll nearby players (proximity)." },
	{ id = "bring", title = "Bring Nearby", tip = "Bring nearby players in front of you (proximity)." },
	{ id = "void", title = "Phase Through Floor", tip = "Disable collision + drop — they phase through the ground." },
	{ id = "stomp", title = "Bury Underground", tip = "Noclip + slam them underground and hold them there." },
	{ id = "orbit", title = "Orbit Nearby", tip = "Spin nearby players around you (proximity)." },
	{ id = "yeet", title = "Yeet Nearby", tip = "Horizontal launch toward target direction (like throwing a ball)." },
	{ id = "soft", title = "Soft Push", tip = "Gentle camera-direction nudge (light poke, no spin)." },
	{ id = "launch", title = "Levitate Nearby", tip = "Continuous upward force — keeps lifting them while on." },
	{ id = "spike", title = "Spike Nearby", tip = "Quick up then down burst nearby (proximity)." },
	{ id = "freeze", title = "Hold Nearby Still", tip = "Continuous BodyPosition pin — frozen in place while on." },
	{ id = "chaos", title = "Random Fling Nearby", tip = "Random directions on nearby players (proximity)." },
	{ id = "flatten", title = "Ground Press Nearby", tip = "Continuous downward pressure — press into ground without burying." },
}

-- bind ids for getAura merge
for _, m in ipairs(AURA_META) do
	local c = getAura(m.id)
	c._id = m.id
end

function setAura(id, on)
	stopLoop("aura_" .. id)
	if on and AURA_TICKS[id] then
		-- proximity-based auras: only affect players within range, no teleporting
		local interval = 0.15
		startLoop("aura_" .. id, interval, AURA_TICKS[id])
		notify(HUB_NAME, "Aura " .. id .. " ON", 1.2)
	else
		cleanupAura(id)
	end
end

function setServerFx(id, on)
	stopLoop("srv_" .. id)
	S.toggles["srv_" .. id] = on == true
	if on and SERVER_TICKS[id] then
		startLoop("srv_" .. id, 0.15, SERVER_TICKS[id])
		notify(HUB_NAME, "Server " .. id .. " ON · map-wide", 1.5)
	elseif not on then
		notify(HUB_NAME, "Server " .. id .. " OFF", 1)
	end
end

------------------------------------------------------------------------
-- Anti systems — open-source methods (IsHeld / CanBurn / Extinguish)
local antiGrabTick
local doAntiGrabHard
local antiGrabInstalled = false
local extinguishPart -- Map Hole ExtinguishPart ( apagarfogo)

function getExtinguishPart()
	if extinguishPart and extinguishPart.Parent then return extinguishPart end
	pcall(function()
		local map = workspace:FindFirstChild("Map")
		local hole = map and map:FindFirstChild("Hole")
		local poison = hole and hole:FindFirstChild("PoisonBigHole")
		local ep = poison and poison:FindFirstChild("ExtinguishPart")
		if ep and ep:IsA("BasePart") then
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
		-- fallback: strip client fire visuals
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
		if n:find("paint") or n:find("spray") or n:find("color") then
			if d:IsA("Decal") or d:IsA("Texture") or d:IsA("ParticleEmitter") then
				pcall(function() d:Destroy() end)
			elseif d:IsA("BoolValue") or d:IsA("StringValue") or d:IsA("NumberValue") then
				pcall(function()
					if d:IsA("BoolValue") then d.Value = false end
				end)
			end
		end
	end
	-- reset body colors if painted
	local bc = c:FindFirstChildOfClass("BodyColors")
	if bc then
		pcall(function()
			-- no hard reset if already default; strip paint attachments
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
	-- FallenPartsDestroyHeight + rescue if Y < -800
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
	-- anti-explosion style: while ragdolled, anchor + zero vel
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

-- / : Anti-Sticky (force Massless=false + break StickyWelds on you)
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
			if d:IsA("Weld") or d:IsA("WeldConstraint") or d:IsA("RigidConstraint") then
				pcall(function() d:Destroy() end)
			end
		end
	end
	-- nearby sticky parts glued to us
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
	-- sticky remover toy touch if we own one
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

-- Optional only: force unsit from blob/train seats (NOT tied to Gucci — that fought intentional sits)
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

-- Anti-Lag: disable CharacterAndBeamMove LocalScript (reduces grab lag)
function setAntiLag(on)
	S.toggles.antiLag = on == true
	pcall(function()
		local ps = LP:FindFirstChild("PlayerScripts")
		if not ps then return end
		local beam = ps:FindFirstChild("CharacterAndBeamMove")
			or ps:FindFirstChild("CharacterAndBeamMove", true)
		if beam and (beam:IsA("LocalScript") or beam:IsA("Script")) then
			beam.Disabled = on == true
			notify(HUB_NAME, "Anti-Lag " .. (on and "ON (beam script off)" or "OFF"), 2)
		else
			notify(HUB_NAME, "Anti-Lag: CharacterAndBeamMove not found", 2)
		end
	end)
end

------------------------------------------------------------------------
-- Blitzbr-style Anchor Objects system (ownership tracking + auto-release)
local AnchoredObjects = {}
local _AnchorDebris = game:GetService("Debris")

function anchorobjecteffectFX(part)
	pcall(function()
		local att = Instance.new("Attachment")
		att.Parent = part
		local snd = Instance.new("Sound", att)
		snd.SoundId = "rbxassetid://1091083826"
		snd:Play()
		_AnchorDebris:AddItem(att, 2)
	end)
end

function setAnchorObject(part)
	if not S.toggles.anchorMode then return false end
	if not part or not part.Parent then return false end
	if not part:IsA("BasePart") then return false end
	if AnchoredObjects[part] then return true end
	pcall(function()
		part.Anchored = true
		part:SetAttribute("AnchorOwnership", S.toggles.anchorOwnership)
		part:SetAttribute("IsAnchored", true)
		AnchoredObjects[part] = {
			PartAnchored = part,
			Model = part.Parent,
			Connections = {},
			Ownership = S.toggles.anchorOwnership,
		}
		anchorobjecteffectFX(part)
	end)
	return true
end

function unAnchorObject(part)
	if not part or not part.Parent then return end
	pcall(function()
		part.Anchored = false
		part:SetAttribute("AnchorOwnership", false)
		part:SetAttribute("IsAnchored", false)
		AnchoredObjects[part] = nil
	end)
end

function disconnectAnchorObject(part)
	if not part or not AnchoredObjects[part] then return end
	local data = AnchoredObjects[part]
	pcall(function()
		for _, conn in pairs(data.Connections) do
			pcall(function() conn:Disconnect() end)
		end
		data.PartAnchored = nil
		part:SetAttribute("IsAnchored", nil)
		part:SetAttribute("AnchorOwnership", nil)
		AnchoredObjects[part] = nil
	end)
end

function anchorAllNearby(duration)
	local me = hrp()
	if not me then return end
	local count = 0
	for _, p in ipairs(workspace:GetChildren()) do
		if p:IsA("Model") or p:IsA("Folder") then
			for _, part in ipairs(p:GetDescendants()) do
				if part:IsA("BasePart") and not part.Anchored and (part.Position - me.Position).Magnitude < (S.auraRange or 50) then
					if setAnchorObject(part) then count += 1 end
				end
			end
		end
	end
	notify(HUB_NAME, "Anchored " .. count .. " nearby parts", 2)
	if duration and duration > 0 then
		task.delay(duration, function()
			for part, _ in pairs(AnchoredObjects) do
				pcall(function() unAnchorObject(part) end)
			end
		end)
	end
end

function autoAnchorLoop()
	if not S.toggles.anchorMode then return end
	local me = hrp()
	if not me then return end
	for _, p in ipairs(Players:GetPlayers()) do
		if validP(p) and p ~= _LocalPlayer then
			local r = rootOf(p)
			if r then
				for _, part in ipairs(r:GetChildren()) do
					if part:IsA("BasePart") and not part.Anchored then
						setAnchorObject(part)
					end
				end
			end
		end
	end
end

-- Anti-Spectate: prevent others from spectating you via camera hacks
function setAntiSpectate(on)
	S.toggles.antiSpectate = on == true
	S.toggles.antiSpectateMode = on and "hide" or "off"
	if on then
		pcall(function()
			local cam = workspace.CurrentCamera
			if cam then
				cam.CameraSubject = LP.Character or LP
				cam.FieldOfView = 70
			end
		end)
		notify(HUB_NAME, "Anti-Spectate ON · camera protected", 2)
	else
		notify(HUB_NAME, "Anti-Spectate OFF", 1.5)
	end
end

-- Dev Join Effects: troll visual when devs join
local devJoinConn = nil
function setDevJoinEffects(on)
	S.toggles.devJoinEffects = on == true
	S.toggles.devJoinSound = on == true
	if on then
		if devJoinConn then pcall(function() devJoinConn:Disconnect() end) end
		devJoinConn = game:GetService("PlayerAdded"):Connect(function(p)
			pcall(function()
				if p and p.DisplayName and (p.DisplayName:lower():find("dev") or p.DisplayName:lower():find("admin") or p.DisplayName:lower():find("mod") or p.DisplayName:lower():find("owner") or p.DisplayName:lower():find("owner") or p.DisplayName ~= _LocalPlayer.DisplayName) then
					local c = LP.Character
					if c then
						for _, d in ipairs(c:GetDescendants()) do
							if d:IsA("Part") or d:IsA("MeshPart") or d:IsA("UnionOperation") then
								pcall(function() d.Material = Enum.Material.Neon end)
								pcall(function() d.Color = Color3.fromRGB(math.random(150,255), math.random(0,255), math.random(200,255)) end)
							end
						end
						notify(HUB_NAME, "Dev Join Effect · " .. p.Name .. " joined", 2)
						task.delay(3, function()
							for _, d in ipairs(c:GetDescendants()) do
								if d:IsA("BasePart") then
									pcall(function() d.Material = Enum.Material.SmoothPlastic end)
									pcall(function() d.Color = Color3.fromRGB(200, 200, 200) end)
								end
							end
						end)
					end
				end
			end)
		end)
		notify(HUB_NAME, "Dev Join Effects ON", 2)
	else
		if devJoinConn then pcall(function() devJoinConn:Disconnect() end) end
		devJoinConn = nil
		notify(HUB_NAME, "Dev Join Effects OFF", 1.5)
	end
end

-- Water walk (nested — register budget)
local setWaterWalk
(function()
local waterPartBackup = {} -- BasePart -> { CanCollide, CanTouch, CanQuery }
local waterTerrainBackup = {} -- { region, materials, occupancies }
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
		-- already tracked — keep solid while toggle on
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
		-- keep touch/query so nothing else breaks
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
	-- deep-copy ReadVoxels materials/occupancies so we can restore later
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
	-- Roblox WriteVoxels expects a table with .Size
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
	-- clamp Y — water is near surface, don't scan whole sky/void
	minV = Vector3.new(minV.X, math.clamp(minV.Y, -60, 0), minV.Z)
	maxV = Vector3.new(maxV.X, math.clamp(maxV.Y, 20, 150), maxV.Z)
	return minV, maxV
end

local function solidifyTerrainWater()
	-- convert Terrain Water cells → Ice (solid, still water-looking) across the map
	waterTerrainBackup = {}
	local Terrain = workspace.Terrain
	if not Terrain then return 0 end
	local minV, maxV = mapWaterBounds()
	local res = 4
	local step = 96 -- stud chunks (grid-aligned-ish)
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
										-- Ice = solid collision, still reads as water-ish
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
		-- yield every row to avoid freezing the game
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
		notify(HUB_NAME, "Water walk OFF · water restored", 1.5)
		return
	end

	-- destroy any old under-feet platform leftovers
	for _, d in ipairs(workspace:GetChildren()) do
		if d.Name == "VOIDZ_WaterWalk" then pcall(function() d:Destroy() end) end
	end

	local partCount = solidifyAllWaterParts()
	local cellCount = 0
	pcall(function() cellCount = solidifyTerrainWater() end)

	-- keep solid if the map streams new water parts in
	waterSolidConn = workspace.DescendantAdded:Connect(function(d)
		if not S.toggles.waterWalk then return end
		if isWaterishPart(d) then
			task.defer(function() solidifyWaterPart(d) end)
		end
	end)

	-- light re-assert: some maps reset CanCollide on water parts
	startLoop("waterWalk", 1.0, function()
		if not S.toggles.waterWalk then return end
		for part, _ in pairs(waterPartBackup) do
			if part and part.Parent and not part.CanCollide then
				pcall(function() part.CanCollide = true end)
			end
		end
	end)

	notify(HUB_NAME, "Water solid · " .. partCount .. " parts · " .. cellCount .. " terrain cells", 2.2)
end
end)()

-- True only when YOU are the victim of someone else's GrabParts (not when YOU are grabbing)
function grabPartsIsAttackingUs(grabModel, ourChar)
	if not grabModel or not ourChar then return false end
	for _, d in ipairs(grabModel:GetDescendants()) do
		if d:IsA("WeldConstraint") or d:IsA("Weld") then
			local p0, p1 = d.Part0, d.Part1
			-- victim = our character is Part1 (held) or welded as victim
			if p1 and p1:IsDescendantOf(ourChar) then return true end
			if p0 and p0:IsDescendantOf(ourChar) then
				-- if both ends on us, ignore; if other end is not our grab tool, we're grabbed
				local other = p1
				if other and not other:IsDescendantOf(ourChar) and not other:IsDescendantOf(grabModel) then
					return true
				end
			end
		end
	end
	return false
end

------------------------------------------------------------------------
-- Anti-kill house TP: random plot interior, prefer unowned houses
function plotHasOwner(plot)
	if not plot then return false end
	local sign = plot:FindFirstChild("PlotSign") or plot:FindFirstChild("PlotSign", true)
	if not sign then
		-- fallback: any ThisPlotsOwners under plot
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
	-- PlotArea is the FTAP safe interior region ( uses PlotArea.Position)
	local area = plot:FindFirstChild("PlotArea") or plot:FindFirstChild("PlotArea", true)
	if area and area:IsA("BasePart") then
		-- sit slightly above floor center so you land inside the house
		return CFrame.new(area.Position + Vector3.new(0, 4, 0))
	end
	for _, name in ipairs({ "Spawn", "SpawnLocation", "HouseSpawn", "InteriorSpawn", "Floor", "Base" }) do
		local p = plot:FindFirstChild(name, true)
		if p and p:IsA("BasePart") then
			return p.CFrame * CFrame.new(0, 3, 0)
		end
	end
	-- any large anchored floor-ish part near plot center
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
	-- fallback: any PlotArea under workspace if Plots folder empty/odd
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
	-- priority: unowned houses first
	local pool = (#free > 0) and free or owned
	if #pool == 0 then
		-- last resort: last safe CF if we ever stored one
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

	-- break grab forces briefly while we TP
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

	-- reassert TP a few frames (grab/align can yank you back)
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

	local tag = pick.free and "empty" or "owned"
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

	-- water / drowning → house TP (both anti-kill and anti-drown share this)
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
		tpToRandomHouse("water")
		return
	end

	-- anytime grabbed → random house (prefer empty)
	if isLocalPlayerGrabbed() then
		tpToRandomHouse("grab")
	end

	-- anytime damage → random house
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
	-- instant damage hook
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

-- Restore grounded movement after escape/anti-grab (no float / no leave Anchored)
function restoreGroundPhysics()
	local r = hrp()
	local h = hum()
	if r then
		pcall(function()
			r.Anchored = false
			local v = r.AssemblyLinearVelocity
			r.AssemblyLinearVelocity = Vector3.new(v.X * 0.3, math.min(v.Y, 0), v.Z * 0.3)
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
			local st = h:GetState()
			if st == Enum.HumanoidStateType.Physics or st == Enum.HumanoidStateType.Ragdoll
				or st == Enum.HumanoidStateType.FallingDown or st == Enum.HumanoidStateType.Flying then
				h:ChangeState(Enum.HumanoidStateType.GettingUp)
			end
			h:ChangeState(Enum.HumanoidStateType.Running)
			h.Jump = false
		end)
	end
end

-- True when someone is holding / welding US (not when we grab others)
function isGucciVictim(c)
	c = c or char()
	if not c then return false end
	local held = LP:FindFirstChild("IsHeld")
	if held and held.Value == true then return true end
	-- Head.PartOwner while held = someone owns your head
	local head = c:FindFirstChild("Head")
	if head and head:FindFirstChild("PartOwner") then
		local po = head.PartOwner
		local val = nil
		pcall(function() val = po.Value end)
		if val ~= nil and tostring(val) ~= "" and tostring(val) ~= LP.Name then
			return true
		end
		-- PartOwner exists while grabbed even if value is delayed
		if held and held.Value then return true end
	end
	for _, child in ipairs(workspace:GetChildren()) do
		if child.Name == "GrabParts" and grabPartsIsAttackingUs(child, c) then
			return true
		end
	end
	return false
end

-- Get the player who is grabbing us (if any)
function getGrabber(c)
	c = c or char()
	if not c then return nil end
	-- Check PartOwner on head/HRP
	for _, partName in ipairs({ "Head", "HumanoidRootPart", "Torso", "UpperTorso" }) do
		local part = c:FindFirstChild(partName)
		if part then
			local po = part:FindFirstChild("PartOwner")
			if po then
				local val = nil
				pcall(function() val = po.Value end)
				if typeof(val) == "Instance" and val:IsA("Player") and val ~= LP then
					return val
				end
				if type(val) == "string" and val ~= "" and val ~= LP.Name then
					return Players:FindFirstChild(val)
				end
			end
		end
	end
	-- Check GrabParts welds
	for _, child in ipairs(workspace:GetChildren()) do
		if child.Name == "GrabParts" then
			for _, d in ipairs(child:GetDescendants()) do
				if d:IsA("WeldConstraint") or d:IsA("Weld") then
					local p0, p1 = d.Part0, d.Part1
					local other = nil
					if p0 and p0:IsDescendantOf(c) and p1 and not p1:IsDescendantOf(c) then
						other = p1
					elseif p1 and p1:IsDescendantOf(c) and p0 and not p0:IsDescendantOf(c) then
						other = p0
					end
					if other then
						local model = other:FindFirstAncestorOfClass("Model")
						if model then
							local plr = Players:GetPlayerFromCharacter(model)
							if plr and plr ~= LP then return plr end
						end
					end
				end
			end
		end
	end
	return nil
end

-- Check if grabber is whitelisted for anti-grab bypass
function isAntiGrabWhitelisted(grabber)
	if not grabber then return false end
	if S.antiGrabWhitelist[grabber.UserId] == true then return true end
	if S.antiGrabWhitelist[grabber.Name] == true then return true end
	return false
end

function gucciBreakGrabNow()
	local c = char()
	local r = hrp()
	local h = hum()
	if not c or not r then return end

	-- zero velocity while breaking — do NOT leave Anchored (that causes float after free)
	pcall(function()
		r.AssemblyLinearVelocity = Vector3.zero
		r.AssemblyAngularVelocity = Vector3.zero
		r.Anchored = false
	end)

	if FTAP.Struggle then
		for _ = 1, 4 do
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

	-- DestroyGrabLine on all body parts (server often keys off specific part)
	if FTAP.DestroyGrabLine then
		for _, n in ipairs({ "HumanoidRootPart", "Torso", "UpperTorso", "LowerTorso", "Head", "Left Arm", "Right Arm", "Left Leg", "Right Leg", "LeftUpperArm", "RightUpperArm" }) do
			local p = c:FindFirstChild(n)
			if p then pcall(function() FTAP.DestroyGrabLine:FireServer(p) end) end
		end
		pcall(function() FTAP.DestroyGrabLine:FireServer(r) end)
	end

	for _, child in ipairs(workspace:GetChildren()) do
		if child.Name == "GrabParts" and grabPartsIsAttackingUs(child, c) then
			for _, d in ipairs(child:GetDescendants()) do
				if d:IsA("WeldConstraint") or d:IsA("Weld") or d:IsA("AlignPosition") or d:IsA("AlignOrientation") then
					pcall(function() d:Destroy() end)
				end
			end
			pcall(function() child:Destroy() end)
		end
	end

	-- strip foreign welds on our body that pin us to others
	for _, d in ipairs(c:GetDescendants()) do
		if d:IsA("WeldConstraint") or d:IsA("Weld") then
			local p0, p1 = d.Part0, d.Part1
			local other = nil
			if p0 and p0:IsDescendantOf(c) and p1 and not p1:IsDescendantOf(c) then other = p1 end
			if p1 and p1:IsDescendantOf(c) and p0 and not p0:IsDescendantOf(c) then other = p0 end
			if other then pcall(function() d:Destroy() end) end
		end
	end

	if h then
		pcall(function()
			h.PlatformStand = false
			h.Sit = false
			h.AutoRotate = true
			h:SetStateEnabled(Enum.HumanoidStateType.Jumping, true)
			h:SetStateEnabled(Enum.HumanoidStateType.Running, true)
			h:SetStateEnabled(Enum.HumanoidStateType.FallingDown, false)
			h:SetStateEnabled(Enum.HumanoidStateType.Ragdoll, false)
			local st = h:GetState()
			if st == Enum.HumanoidStateType.Physics or st == Enum.HumanoidStateType.Ragdoll
				or st == Enum.HumanoidStateType.FallingDown or st == Enum.HumanoidStateType.Seated then
				h:ChangeState(Enum.HumanoidStateType.GettingUp)
				h:ChangeState(Enum.HumanoidStateType.Running)
			end
		end)
	end

	-- land properly after break (no Y boost float)
	task.defer(function()
		if not r.Parent then return end
		r.Anchored = false
		local still = isGucciVictim(c)
		if not still then
			r.AssemblyLinearVelocity = Vector3.zero
			restoreGroundPhysics()
		elseif S.toggles.antiGucci then
			local move = h and h.MoveDirection or Vector3.zero
			if move.Magnitude > 0.1 then
				local spd = (S.toggles.speed and S.walkSpeed) or (h and h.WalkSpeed) or 16
				-- horizontal only — no +Y float
				r.AssemblyLinearVelocity = Vector3.new(move.X * spd * 1.15, 0, move.Z * spd * 1.15)
			else
				r.AssemblyLinearVelocity = Vector3.zero
			end
		end
	end)
	task.delay(0.12, function()
		if r.Parent and not isGucciVictim(c) then
			r.Anchored = false
			restoreGroundPhysics()
		end
	end)
end

-- Gucci anti: hard break when WE are victim — never kills your own grab line
function gucciAntiTick()
	if not (S.toggles.antiGucci or S.toggles.antiGrab) then return end
	local c = char()
	local r = hrp()
	local h = hum()
	if not c or not r then return end

	-- Always safe: burn/sticky (don't touch grab remotes)
	if S.toggles.antiBurn or S.toggles.antiGucci then
		extinguishFire()
	end
	if S.toggles.antiSticky or S.toggles.antiGucci then
		antiStickyTick()
	end
	-- Note: blob/train unsit is NOT part of Gucci (separate toggle only)

	if not isGucciVictim(c) then
		if r.Anchored and not S.toggles.antiExplode then
			-- don't leave yourself stuck anchored if anti-explode isn't holding you
			local held = LP:FindFirstChild("IsHeld")
			if not (held and held.Value) then
				r.Anchored = false
			end
		end
		stopBlitzbrAntiGrab()
		return -- DO NOT DestroyGrabLine while we grab others
	end

	-- Check if grabber is in anti-grab whitelist
	local grabber = getGrabberPlayer()
	if grabber and isAntiGrabWhitelisted(grabber) then
		return -- whitelisted player allowed to grab you
	end

	-- Start blitzbr-style continuous anti-grab on heartbeat
	startBlitzbrAntiGrab()

	-- Anti-kill house escape while grabbed (if enabled)
	if S.toggles.antiKill then
		tpToRandomHouse("grab")
	end

	gucciBreakGrabNow()
	if doAntiGrabHard then pcall(doAntiGrabHard) end

	-- Auto attacker via Gucci: find grabber from PartOwner and counter-attack
	if S.autoCounter or S.toggles.autoCounter then
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
							break
						end
					end
				end
			end
		end
	end

	-- Blitzbr-style continuous anti-grab: run on Heartbeat while held
	-- Anchors HRP + zero velocity + Struggle + RagdollRemote until released
	if not S._blitzbrAntiGrabConn then
		S._blitzbrAntiGrabConn = RunService.Heartbeat:Connect(function()
			if not (S.toggles.antiGucci or S.toggles.antiGrab) then return end
			local held = LP:FindFirstChild("IsHeld")
			if not (held and held.Value) then return end
			local c2 = char()
			local r2 = hrp()
			if not c2 or not r2 then return end
			pcall(function()
				r2.Anchored = true
				r2.AssemblyLinearVelocity = Vector3.zero
				r2.AssemblyAngularVelocity = Vector3.zero
				if FTAP.Struggle then pcall(function() FTAP.Struggle:FireServer(LP) end) end
				if FTAP.RagdollRemote then pcall(function() FTAP.RagdollRemote:FireServer(r2, 0) end) end
			end)
		end)
	end
end

function stopBlitzbrAntiGrab()
	if S._blitzbrAntiGrabConn then
		S._blitzbrAntiGrabConn:Disconnect()
		S._blitzbrAntiGrabConn = nil
	end
	-- Unanchor on stop
	pcall(function()
		local r = hrp()
		if r then r.Anchored = false end
	end)
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
			local fpp = r:FindFirstChild("FirePlayerPart") or r:WaitForChild("FirePlayerPart", 5)
			if not fpp then return end
			local canBurn = fpp:FindFirstChild("CanBurn") or fpp:WaitForChild("CanBurn", 3)
			if canBurn and canBurn:IsA("BoolValue") then
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

		-- PartOwner on ANY body part = grab ownership signal (anti-grab v2 + auto-counter)
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
						-- Auto-counter: blitzbr-style — attack grabber via PartOwner.Value
						if S.autoCounter or S.toggles.autoCounter then
							local grabberVal = ch.Value
							local grabberName = nil
							if typeof(grabberVal) == "Instance" and grabberVal:IsA("Player") then
								grabberName = grabberVal.Name
							elseif grabberVal then
								grabberName = tostring(grabberVal)
							end
							if grabberName and grabberName ~= LP.Name then
								local grabberPlr = Players:FindFirstChild(grabberName)
								if grabberPlr and validP(grabberPlr) then
									-- fire counter BEFORE breaking grab (like blitzbr)
									task.spawn(counterAttackPlayer, grabberPlr, rootOf(grabberPlr))
								end
							end
						end
						-- Anti-grab: break the grab
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

		-- Sit-state backup detection (blitzbr-style): grab forces Sit = true
		task.spawn(function()
			local h2 = c:FindFirstChildOfClass("Humanoid")
			if not h2 then return end
			h2:GetPropertyChangedSignal("Sit"):Connect(function()
				if not h2.Sit then return end
				if h2.SeatPart and h2.SeatPart.Parent and h2.SeatPart.Parent.Name == "CreatureBlobman" then return end
				-- Sit = true without a seat = grabbed
				if S.autoCounter or S.toggles.autoCounter then
					-- find grabber from PartOwner on any body part
					for _, bp in ipairs({ c:FindFirstChild("Head"), c:FindFirstChild("HumanoidRootPart"), c:FindFirstChild("Torso"), c:FindFirstChild("UpperTorso") }) do
						if bp then
							local po = bp:FindFirstChild("PartOwner")
							if po then
								local val = po.Value
								local grabberName = (typeof(val) == "Instance" and val:IsA("Player")) and val.Name or tostring(val or "")
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
				-- Anti-grab: force unfreeze sit
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

	-- Fast when Gucci ON ( ~0.04), slightly slower for plain antiGrab
	local gucciAcc = 0
	bind("gucciAntiHB", RunService.Heartbeat:Connect(function(dt)
		if not (S.toggles.antiGucci or S.toggles.antiGrab) then return end
		gucciAcc += dt
		local need = S.toggles.antiGucci and 0.04 or 0.1
		if gucciAcc < need then return end
		gucciAcc = 0
		gucciAntiTick()
	end))

	task.spawn(function()
		local isHeld = LP:FindFirstChild("IsHeld") or LP:WaitForChild("IsHeld", 15)
		if not isHeld then return end
		isHeld.Changed:Connect(function(held)
			if held == true and (S.toggles.antiGrab or S.toggles.antiGucci) then
				-- burst: same-frame + next frames
				gucciBreakGrabNow()
				if doAntiGrabHard then doAntiGrabHard() end
				gucciAntiTick()
				task.defer(gucciBreakGrabNow)
				task.delay(0.03, gucciBreakGrabNow)
				task.delay(0.08, gucciBreakGrabNow)
				task.delay(0.15, gucciBreakGrabNow)
			end
		end)
	end)
end

------------------------------------------------------------------------
-- line tricks + character invisibility
function setCrazyLine(on)
	S.toggles.crazyLine = on == true
	stopLoop("crazyLine")
	if not on then
		notify(HUB_NAME, "Crazy Line OFF", 1)
		return
	end
	if S.toggles.invisLine then
		-- note: Invisible Line won't work if Crazy Line is Enabled
		S.toggles.invisLine = false
		stopLoop("invisLine")
	end
	if not FTAP.CreateGrabLine then resolveFTAP() end
	notify(HUB_NAME, "Crazy Line ON (soft lag lines)", 1.5)
	-- CFrame used for soft-lag grab lines
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
		notify(HUB_NAME, "Turn Crazy Line OFF for Invisible Line", 2)
	end
	if on then
		-- local visual hide + empty CreateGrabLine fires on grab (see onGrabPartsAdded)
		startLoop("invisLine", 0.25, function()
			for _, ch in ipairs(workspace:GetChildren()) do
				if ch.Name == "GrabParts" then
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

-- Character invis ( underground FE method — body under map, camera on surface)
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
		if not quiet then notify(HUB_NAME, "No character for invis", 1.5) end
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
	if not quiet then notify(HUB_NAME, "Invisibility ON (body under map)", 1.5) end
end

-- Temporarily surface character for grab actions while invisible
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

-- re-arm invis after respawn
LP.CharacterAdded:Connect(function()
	if S.toggles.charInvis then
		task.delay(0.6, function()
			if S.toggles.charInvis then setCharacterInvis(true, true) end
		end)
	end
end)


------------------------------------------------------------------------
-- Auto-Spin Coins (workspace.Slots → SlotHandle.Handle)
-- Ready when all LightBalls are Neon · then TP above each Handle + SNO ~1s
------------------------------------------------------------------------
function findSlotsFolder()
	local s = workspace:FindFirstChild("Slots")
	if s then return s end
	for _, ch in ipairs(workspace:GetChildren()) do
		local n = ch.Name:lower()
		if (n == "slots" or n:find("slot", 1, true)) and (ch:IsA("Folder") or ch:IsA("Model")) then
			return ch
		end
	end
	return nil
end

-- Collect SlotHandle.Handle parts + LightBalls under workspace.Slots
function scanSlotMachines()
	local root = findSlotsFolder()
	local handles, lights = {}, {}
	if not root then return handles, lights, root end
	-- Prefer direct children with SlotHandle (real machines)
	for _, slot in ipairs(root:GetChildren()) do
		local sh = slot:FindFirstChild("SlotHandle")
		if sh then
			local handle = sh:FindFirstChild("Handle")
			local lb = sh:FindFirstChild("LightBall")
			if handle and handle:IsA("BasePart") then
				handles[#handles + 1] = handle
			end
			if lb and lb:IsA("BasePart") then
				lights[#lights + 1] = lb
			end
		end
	end
	-- Fallback: deep scan (map variants)
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

function collectSlotHandles(slotsFolder)
	local handles = scanSlotMachines()
	return handles
end

-- All LightBalls Neon = spin window open (if no lights found, allow attempt)
function slotsSpinReady(slotsFolder)
	local handles, lights = scanSlotMachines()
	if #handles == 0 then return false, 0, 0 end
	if #lights == 0 then
		return true, 0, 0 -- structure unknown — still try
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
		-- keep look rotation, only move position (FTAP-friendly)
		local pos = handle.Position + Vector3.new(0, 5, 0)
		me.CFrame = me.CFrame.Rotation + pos
		me.AssemblyLinearVelocity = Vector3.zero
		me.AssemblyAngularVelocity = Vector3.zero
	end)
end

-- One full pass: every SlotHandle.Handle for ~1s with CanCollide off + TP + SNO
function autoSpinCoinsOnce()
	local handles, lights, root = scanSlotMachines()
	if not root then
		return false, "no workspace.Slots"
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

	-- live target handle for background TP/SNO loop
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
		-- ~1s on this handle (5 × 0.2)
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
		-- round ended mid-pass
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
		notify(HUB_NAME, "Auto-Spin OFF", 1)
		return
	end
	local handles, lights, root = scanSlotMachines()
	if not root then
		notify(HUB_NAME, "Auto-Spin: workspace.Slots missing", 3)
	else
		notify(HUB_NAME, "Auto-Spin ON · " .. #handles .. " handles · " .. #lights .. " lights", 2.5)
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
				-- ~5s between rounds
				for _ = 1, 50 do
					if not S.toggles.autoSpin then break end
					task.wait(0.1)
				end
			else
				-- only notify waiting every 30s to reduce spam
				if os.clock() - lastWaitMsg > 30 then
					notify(HUB_NAME, "Auto-Spin · " .. tostring(info or "waiting"), 1.2)
					lastWaitMsg = os.clock()
				end
				task.wait(1)
			end
		end
		S._autoSpinThread = nil
	end)
end

------------------------------------------------------------------------
-- Movement (Heartbeat enforced — FTAP resets WalkSpeed)
function setFly(on)
	if S.flyBv then pcall(function() S.flyBv:Destroy() end) S.flyBv = nil end
	if S.flyBg then pcall(function() S.flyBg:Destroy() end) S.flyBg = nil end
	if S.conns.fly then pcall(function() S.conns.fly:Disconnect() end) S.conns.fly = nil end
	if not on then return end
	local r = hrp()
	if not r then return end
	local bv = Instance.new("BodyVelocity")
	bv.Name = "VOIDZ_Fly"
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

-- movement heartbeat
bind("moveHB", RunService.Heartbeat:Connect(function()
	local h = hum()
	local r = hrp()
	-- WalkSpeed override: use cFrame push (FTAP resets h.WalkSpeed)
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
			if p:IsA("BasePart") then p.CanCollide = false end
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

------------------------------------------------------------------------
-- Toys / inventory / unowned map
-- Internal toy names from working FTAP spawner scripts
local KNOWN_TOYS = {
	"Airhorn", "AnvilGray", "ArmChairBlue", "ArmChairBrownGray", "ArmChairPink",
	"BallBasketball", "BallMagicLight", "BallSnowball", "BathroomShower", "BathroomSink",
	"BedBlanketBlue", "BedFramedOrange", "BedFuton", "BellBig", "BellSmall",
	"BombBalloon", "BombDarkMatter", "BombMissile", "BookManyPages", "BookNormal",
	"Boombox", "BoxCrateWood", "BubbleBlower", "BucketPaint", "Campfire",
	"ChildrensChair", "ChildrensCouch", "ChildrensDesk", "ChildrensShelf", "ChildrensTable",
	"ClockAlarm", "ComputerLaptopOld", "CouchBlue", "CouchBrownGray", "CouchDarkGray",
	"CouchLightBrownGray", "CouchPink", "CouchWhite", "CouchPurple",
	"CounterCorner", "CounterSink", "CounterStraight", "CreatureBlobman", "CreatureRobot",
	"CupMugBrown", "CupMugWhite", "DiceBig", "DiceSmall", "DiscoColorBall",
	"DrawerLightBrown", "FactoryBench", "FactoryCabinet", "FactoryChair", "FactoryCouch",
	"FoodBanana", "NinjaKunai", "PalletLightBrown", "Pallet", "SprayCanWD",
	"SoccerBall", "BoxingGlove", "Firework", "Balloon", "PaintBucket",
}

function getOwnedToyNames()
	local owned = {}
	-- backpack + character tools
	local function scan(container)
		if not container then return end
		for _, t in ipairs(container:GetChildren()) do
			if t:IsA("Tool") or t:IsA("Model") or t:IsA("Folder") then
				owned[t.Name] = true
			end
		end
	end
	scan(LP:FindFirstChild("Backpack"))
	scan(char())
	-- PlayerGui inventory labels/buttons
	local pg = LP:FindFirstChild("PlayerGui")
	if pg then
		for _, d in ipairs(pg:GetDescendants()) do
			if d:IsA("TextLabel") or d:IsA("TextButton") then
				local tx = d.Text
				if type(tx) == "string" and #tx > 1 and #tx < 40 then
					for _, toy in ipairs(KNOWN_TOYS) do
						if tx:lower() == toy:lower() or tx:lower():find(toy:lower(), 1, true) then
							owned[toy] = true
						end
					end
					-- any non-generic inventory text
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
	-- models we already own on map (PartOwner)
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
	-- returns { name = {owned=bool, parts={...}, models={...}} }
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

------------------------------------------------------------------------
-- Toy spawn ( serial queue + CanSpawnToy gate like /)
-- FTAP SpawnToyRemoteFunction args: (name, CFrame, Vector3 rotation degrees)
-- Parallel InvokeServer = only 1 pallet lands. Forms MUST spawn one-by-one.
------------------------------------------------------------------------
-- S.formSizeScale = S.formSizeScale or 1.2
-- S.formDistance = S.formDistance or 12
S.formOrientation = S.formOrientation or 0
S.formHeight = S.formHeight or 2
S.formGap = S.formGap or 0.09 -- seconds between spawns
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
	-- Vector3.new(0, CamPart.Orientation.Y, 0) — degrees
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

-- Synchronous spawn (used by queue + form builder). Returns true if invoke ran.
function spawnToyNow(name, opts)
	opts = opts or {}
	name = name or S.selectedToy or "PalletLightBrown"
	if name == "Pallet" then name = "PalletLightBrown" end
	if not FTAP.SpawnToy then resolveFTAP() end
	if not FTAP.SpawnToy then
		-- one more attempt after a brief wait
		task.wait(0.3)
		resolveFTAP()
	end
	if not FTAP.SpawnToy then
		if not opts.silent then notify(HUB_NAME, "No SpawnToy remote — link remotes", 2) end
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

	-- server flips CanSpawnToy false→true; give it a beat
	local gap = opts.gap
	if gap == nil then gap = S.formGap or 0.09 end
	if gap > 0 then task.wait(gap) end
	waitForCanSpawn(opts.canTimeout or 4)
	return ok
end

-- single-worker queue (never parallel InvokeServer spam)
local toySpawnQueue = {}
local toySpawnWorker = false

function pumpToyQueue()
	if toySpawnWorker then return end
	toySpawnWorker = true
	task.spawn(function()
		while #toySpawnQueue > 0 do
			-- never interleave with form builds (same remote, CanSpawnToy)
			local formWaitStart = os.clock()
			while S.formBuilding do
				task.wait(0.1)
				-- safety: if formBuilding stuck for >8s, force reset
				if os.clock() - formWaitStart > 8 then
					S.formBuilding = false
					break
				end
			end
			local job = table.remove(toySpawnQueue, 1)
			if job then
				-- auto-resolve remotes if missing
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

-- Public: clutch-friendly enqueue (Q key never stalls the input thread)
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
		notify(HUB_NAME, "Spawn " .. name, 0.6)
	end
	-- copy opts so we can force silent for the worker
	local jobOpts = {}
	for k, v in pairs(opts) do jobOpts[k] = v end
	jobOpts.silent = true
	toySpawnQueue[#toySpawnQueue + 1] = { name = name, opts = jobOpts }
	pumpToyQueue()
	return true
end

function spawnToyBurst(name, count)
	count = math.clamp(tonumber(count) or 1, 1, 80)
	name = name or "PalletLightBrown"
	task.spawn(function()
		-- buy once, then serial spawn with spacing so stack is visible
		if FTAP.BuyToy then pcall(function() FTAP.BuyToy:InvokeServer(name) end) end
		waitForCanSpawn(3)
		local cp = camPart() or hrp()
		local base = cp and cp.CFrame or CFrame.new()
		for i = 1, count do
			local cf = base * CFrame.new(0, (i - 1) * 1.1, -3)
			spawnToyNow(name, { cf = cf, skipBuy = true, silent = true, gap = 0.07 })
		end
		notify(HUB_NAME, "Spawned x" .. count .. " " .. tostring(name), 1.5)
	end)
end

function destroyAllMyToys(filterName)
	if not FTAP.DestroyToy then resolveFTAP() end
	if not FTAP.DestroyToy then
		notify(HUB_NAME, "No DestroyToy remote", 2)
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

function countMyToys(filterName)
	local folder = workspace:FindFirstChild(LP.Name .. "SpawnedInToys")
	if not folder then return 0 end
	local n = 0
	for _, ch in ipairs(folder:GetChildren()) do
		if not filterName or ch.Name == filterName then n += 1 end
	end
	return n
end

------------------------------------------------------------------------
-- Toy limit (free = 100 · gamepass = 200) + form wear
------------------------------------------------------------------------
S.toyPassMode = S.toyPassMode or "auto" -- auto | free | pass
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
			if d.Name == "ToysLimitCap" and (d:IsA("IntValue") or d:IsA("NumberValue")) then
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

------------------------------------------------------------------------
-- Form builds (wearable): spawn serial → SNO → stick + animate
------------------------------------------------------------------------
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
				-- re-SNO periodically so ownership sticks while you move
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
	-- short ownership pulse
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
		notify(HUB_NAME, "Already building a form…", 1.5)
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
	-- respect toy cap (free 100 / pass 200)
	local room = toysRoom()
	if room < 2 then
		S.formBuilding = false
		notify(HUB_NAME, "Toy limit full (" .. getToyLimit() .. ") · delete toys first", 2.5)
		return false
	end
	local want = #offsets
	offsets = clampOffsetList(offsets, math.max(2, room - 1))
	if #offsets < want then
		notify(HUB_NAME, "Form clipped to " .. #offsets .. " (limit " .. getToyLimit() .. ")", 2)
	end
	-- replace previous worn form so shapes don't stack forever
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
		-- spawn slightly behind/above so it doesn't slam into you, then wear loop snaps it on
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
		notify(HUB_NAME, label .. " on · " .. n .. " attached" .. (fail > 0 and (" · " .. fail .. " miss") or ""), 2.5)
	end
	return n > 0
end

-- Grid-space shape generators (unit ≈ wear pitch after scale)
function formHeartOffsets(steps)
	steps = steps or 28
	local pts = {}
	for i = 0, steps - 1 do
		local tt = (i / steps) * math.pi * 2
		local x = 16 * (math.sin(tt) ^ 3)
		local y = 13 * math.cos(tt) - 5 * math.cos(2 * tt) - 2 * math.cos(3 * tt) - math.cos(4 * tt)
		-- sit above head; head anchor + small bob
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
	-- spine / back plate
	for i = -1, 2 do
		pts[#pts + 1] = { x = 0, y = i * 0.55, z = 0.45 }
	end
	return pts
end

function formSuitOffsets()
	-- tight body shell (armor around HRP)
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
	ring(1.55, 0.55, 6, 0) -- shoulders / neck
	ring(0.85, 0.85, 8, 0) -- chest
	ring(0.1, 0.9, 8, 0) -- mid
	ring(-0.7, 0.75, 7, 0) -- hips
	-- front plate
	for y = -0.5, 1.2, 0.45 do
		pts[#pts + 1] = { x = 0, y = y, z = -0.85 }
		pts[#pts + 1] = { x = -0.55, y = y, z = -0.7 }
		pts[#pts + 1] = { x = 0.55, y = y, z = -0.7 }
	end
	-- back plate
	for y = -0.4, 1.1, 0.45 do
		pts[#pts + 1] = { x = 0, y = y, z = 0.75 }
	end
	return pts
end

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
	box(0, 2.4, 0, 0.55, 0.55, 0.45, 0.85) -- head
	box(0, 0.85, 0, 0.85, 0.95, 0.5, 0.85) -- torso
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
	{ id = "heart", title = "Heart", tip = "Floats above your head + soft bob", offsets = formHeartOffsets, scale = 1.0, anchor = "head", anim = "bob" },
	{ id = "wings", title = "Wings", tip = "On your back · flaps up/down", offsets = formWingsOffsets, scale = 1.05, anim = "flap" },
	{ id = "suit", title = "Suit", tip = "Pallet armor shell around your body", offsets = formSuitOffsets, scale = 0.95 },
	{ id = "robot", title = "Robot", tip = "Wearable head · torso · limbs shell", offsets = formRobotOffsets, scale = 0.9 },
	{ id = "star", title = "Star", tip = "Star on your back · spins", offsets = formStarOffsets, scale = 1.0, anim = "spin" },
	{ id = "circle", title = "Circle", tip = "Orbiting ring around you", offsets = formCircleOffsets, scale = 1.0, anim = "orbit" },
	{ id = "arrow", title = "Arrow", tip = "Arrow shape worn in front", offsets = formArrowOffsets, scale = 1.0 },
	{ id = "cross", title = "Cross", tip = "Plus / cross on you", offsets = formCrossOffsets, scale = 1.0 },
	{ id = "cube", title = "Cube", tip = "Hollow cube frame around you", offsets = formCubeOffsets, scale = 0.9 },
	{ id = "sphere", title = "Sphere", tip = "Sphere shell around you", offsets = formSphereOffsets, scale = 0.9 },
	{ id = "triangle", title = "Triangle", tip = "Triangle outline on you", offsets = formTriangleOffsets, scale = 1.0 },
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

------------------------------------------------------------------------
-- Missile strike: spawn → own → TP on target → BombExplode
------------------------------------------------------------------------
S.missileType = S.missileType or "BombMissile"
S.missileCount = S.missileCount or 3
S.missileTarget = S.missileTarget or nil

local missileState = {
	running = false,
	pending = {},
	conn = nil,
}

function bombBodyOf(model)
	if not model then return nil end
	local n = model.Name
	if n == "BombMissile" or n == "FireworkMissile" then
		return model:FindFirstChild("Body") or model:FindFirstChild("PartHitDetector") or model:FindFirstChildWhichIsA("BasePart", true)
	end
	if n == "BombBalloon" then
		return model:FindFirstChild("Balloon") or model:FindFirstChild("PartHitDetector")
	end
	if n == "BombDarkMatter" then
		return model:FindFirstChild("Pyramid") or model:FindFirstChild("PartHitDetector")
	end
	if n == "PresentBig" or n == "PresentSmall" then
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
	if not quiet then notify(HUB_NAME, "Missile strike OFF", 1.2) end
end

function startMissileStrike()
	if missileState.running then return end
	missileState.running = true
	S.toggles.missileStrike = true
	missileState.pending = {}
	resolveFTAP()
	if not FTAP.SpawnToy then
		stopMissileStrike(true)
		notify(HUB_NAME, "No SpawnToy remote", 2)
		return
	end
	if not FTAP.BuyToy then
		stopMissileStrike(true)
		notify(HUB_NAME, "No BuyToy remote", 2)
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

	notify(HUB_NAME, "Missile strike ON · pick a player", 1.5)

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
				task.wait(0.15)
			end

			task.wait(0.1)
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
			notify(HUB_NAME, "No BuyToy remote", 2)
			return
		end
		local p = S.missileTarget or S.selected or S.controlPick
		if type(p) == "string" then p = findPlayer(p) end
		if not p or not validP(p) then
			notify(HUB_NAME, "Pick a missile target", 1.5)
			return
		end
		local r = rootOf(p)
		if not r then
			notify(HUB_NAME, "No Character Bitch", 1)
			return
		end
		local n = math.clamp(tonumber(S.missileCount) or 3, 1, 12)
		n = math.min(n, math.max(1, toysRoom()))
		if n < 1 then
			notify(HUB_NAME, "Toy limit full", 1.5)
			return
		end
		if not FTAP.BombExplode then
			notify(HUB_NAME, "No BombExplode remote · spawning anyway", 2)
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
		notify(HUB_NAME, "Detonated " .. detonated .. "/" .. #spawned .. " → @" .. p.Name, 1.5)
	end)
end

------------------------------------------------------------------------
-- Console: commands + exploit sign scanner (replicated only)
local SUSPICIOUS_NAMES = {
	"voidz", "fe6", "rayfield", "orion", "dex", "infiniteyield", "iy_", "darkdex",
	"flingaura", "skyvelocity", "bringbody", "kethhook", "hydroxide", "simple spy",
	"simplespy", "remote spy", "remotespy", "windui", "linoria", "sirius", "bloody",
	"blitz", "endoris", "poophub", "nameless", "script-ware", "synapse", "drawing",
	"esp", "chams", "aimbot", "silentaim", "freecam", "noclip", "flybv", "bodyvelocity",
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
				if d:IsA("Highlight") then mark("Highlight ESP on character") end
				if d:IsA("BodyVelocity") or d:IsA("BodyPosition") or d:IsA("BodyAngularVelocity") then
					mark("physics mover: " .. d.ClassName .. " " .. d.Name)
				end
				if d:IsA("BillboardGui") and d.AlwaysOnTop then
					mark("AlwaysOnTop billboard (name ESP?)")
				end
			end
			local h = c:FindFirstChildOfClass("Humanoid")
			if h and h.WalkSpeed > 30 then mark("WalkSpeed " .. tostring(h.WalkSpeed)) end
			if h and h.JumpPower > 80 then mark("JumpPower " .. tostring(h.JumpPower)) end
		end
		local bp = p:FindFirstChild("Backpack")
		if bp then
			for _, t in ipairs(bp:GetChildren()) do
				checkName(t.Name, "backpack")
			end
		end
		-- PlayerGui rarely replicates; still try
		local pg = p:FindFirstChild("PlayerGui")
		if pg then
			for _, g in ipairs(pg:GetChildren()) do
				checkName(g.Name, "PlayerGui")
			end
		end
		-- known NumberValues for reach exploit
		for _, n in ipairs({ "FartherReach", "DefaultReach", "CurrentReach" }) do
			if p:FindFirstChild(n) then mark("reach value: " .. n) end
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
		consoleLog("help | clear | scan [name] | fling <name> | kick <name> | kill <name>", C.muted)
		consoleLog("bring <name> | spawn <toy> | pallet | reach [n] | sno <name> | players", C.muted)
		consoleLog("exec <lua...> (loadstring local only)", C.muted)
		consoleLog("NOTE: cannot read other clients' private executor scripts.", C.warn)
	elseif cmd == "clear" then
		if S.consoleOut then
			for _, ch in ipairs(S.consoleOut:GetChildren()) do
				if ch:IsA("TextLabel") then ch:Destroy() end
			end
		end
		consoleLog("cleared", C.muted)
	elseif cmd == "players" then
		for _, p in ipairs(Players:GetPlayers()) do
			if p ~= LP then consoleLog(playerLabel(p), C.text) end
		end
	elseif cmd == "scan" then
		local targetName = rest
		local list = {}
		if targetName ~= "" then
			local p = findPlayer(targetName)
			if p then list = { p } else consoleLog("no player: " .. targetName, C.danger); return end
		else
			for _, p in ipairs(Players:GetPlayers()) do
				if p ~= LP then list[#list + 1] = p end
			end
		end
		-- names only — who might have something loaded (best-effort)
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
			consoleLog("possible exploits (" .. #suspects .. "):", C.warn)
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
		if p then task.spawn(kickPlayer, p, S.kickType, false) else consoleLog("usage: kick <name>", C.danger) end
	elseif cmd == "kill" then
		local p = findPlayer(rest)
		if p then task.spawn(killPlayer, p, false) else consoleLog("usage: kill <name>", C.danger) end
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
		consoleLog("pallet clutch", C.success)
	elseif cmd == "reach" then
		local n = tonumber(rest) or 25
		S.extendAmount = n
		if setLineExtend then
			setLineExtend(true)
		else
			S.toggles.lineExtend = true
		end
		consoleLog("reach " .. n, C.success)
		notify(HUB_NAME, "Reach " .. n, 1)
	elseif cmd == "exec" or cmd == "lua" then
		local code = rest
		if code == "" then consoleLog("usage: exec <lua code>", C.danger); return end
		local fn, err = loadstring(code)
		if not fn then
			consoleLog("compile: " .. tostring(err), C.danger)
			return
		end
		local ok, res = pcall(fn)
		if ok then
			consoleLog("ok: " .. tostring(res), C.success)
		else
			consoleLog("err: " .. tostring(res), C.danger)
		end
	else
		consoleLog("unknown cmd · type help", C.danger)
	end
end

-- Real bring: SNO within range → keep ownership → hold in front of you until grab/release
S.broughtItems = S.broughtItems or {} -- [model] = { part, untilT, lastSno, ox, oy, oz }
S.bringHoldConn = S.bringHoldConn or nil

function modelGrabbedLocally(model)
	if not model then return false end
	for _, ch in ipairs(workspace:GetChildren()) do
		if ch.Name == "GrabParts" then
			for _, d in ipairs(ch:GetDescendants()) do
				if d:IsA("WeldConstraint") or d:IsA("Weld") then
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
	if not quiet then notify(HUB_NAME, "Released brought items", 1.2) end
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
		-- SNO only sticks within ~30 studs
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
				-- you grabbed it — drop our hold so you can move/drop freely
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
		-- stop loop if empty
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
	-- get in SNO range of the item
	if (primary.Position - me.Position).Magnitude > 26 then
		went = true
		pcall(function() me.CFrame = primary.CFrame * CFrame.new(0, 4, 6) end)
		task.wait(0.06)
	end

	local claimed = false
	for _, part in ipairs(model:GetDescendants()) do
		if part:IsA("BasePart") then
			if claimPartOwnership(part, 8) then claimed = true end
		end
	end
	-- one more hard pulse on primary
	if claimPartOwnership(primary, 12) then claimed = true end

	if went then
		pcall(function() me.CFrame = home end)
		task.wait(0.05)
		me = hrp() or me
	end

	-- register hold (keeps SNO + parks in front of you)
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
			-- fallback to cached scan samples
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
		-- bring closest first, then a few more of same name
		local n, maxN = 0, math.min(5, #found)
		notify(HUB_NAME, "Bringing " .. name .. "…", 1)
		for i = 1, maxN do
			local ok = bringModel(found[i].model, { holdSec = 60, slot = i - 1 })
			if ok then n += 1 end
			task.wait(0.08)
		end
		notify(HUB_NAME, "Holding " .. n .. "× " .. name .. " · grab it or wait", 2.5)
	end)
end

-- Q pallet toggle — InputBegan only, zero delay
function setPalletQ(on)
	pcall(function() ContextActionService:UnbindAction("VOIDZ_PalletQ") end)
	if S.conns.palletQ then pcall(function() S.conns.palletQ:Disconnect() end) S.conns.palletQ = nil end
	if not on then
		notify(HUB_NAME, "Q pallet OFF", 1)
		return
	end
	-- pre-resolve so first Q is instant
	task.spawn(resolveFTAP)
	S.conns.palletQ = UserInputService.InputBegan:Connect(function(input, gp)
		if gp then return end
		if input.KeyCode == Enum.KeyCode.Q and S.toggles.palletQ then
			-- auto-resolve remotes if missing, then sync spawn for instant response
			if not FTAP.SpawnToy then pcall(resolveFTAP) end
			if FTAP.SpawnToy then
				spawnToy("PalletLightBrown", { silent = false, dist = 2.5, sync = true })
			else
				-- queue fallback if remotes still loading
				spawnToy("PalletLightBrown", { silent = false, dist = 2.5 })
			end
		end
	end)
	notify(HUB_NAME, "Q pallet ON (instant)", 1)
end

------------------------------------------------------------------------
-- ESP / visuals
------------------------------------------------------------------------
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
	if not cc then cc = Instance.new("ColorCorrectionEffect"); cc.Name = "VOIDZ_CC"; cc.Parent = Lighting end
	cc.TintColor = Color3.fromRGB(200, 160, 255)
	cc.Saturation = 0.15
	cc.Contrast = 0.08
	cc.Brightness = 0.02
	if not bloom then bloom = Instance.new("BloomEffect"); bloom.Name = "VOIDZ_Bloom"; bloom.Parent = Lighting end
	bloom.Intensity = 0.4
	bloom.Size = 20
	bloom.Threshold = 0.9
end

------------------------------------------------------------------------
-- Loops with death detect + quiet mode
function watchUntilDead(p, actionName, attackerFn)
	-- runs attackerFn repeatedly until dead, then one notify + chat
	if not p then return end
	local name = p.Name
	startLoop("watch_" .. name .. actionName, 0.25, function()
		if not p.Parent then stopLoop("watch_" .. name .. actionName); return end
		if not validP(p) then
			stopLoop("watch_" .. name .. actionName)
			notify(HUB_NAME, actionName .. " done · " .. name, 2)
			if actionName:lower():find("kick") or actionName:lower():find("kill") then
				notify(HUB_NAME, "Finished · " .. tostring(name), 2)
			end
			return
		end
		attackerFn(p)
	end)
end

------------------------------------------------------------------------
-- Grab-release engine (working FTAP method — GrabParts ChildAdded)
-- Source: pastebin FLING IN PEOPLE complete script
------------------------------------------------------------------------
local grabMap = {} -- GrabParts model -> BasePart
local heldParts = {}
local effectParts = {} -- part -> true while forces applied
local grabWatchInstalled = false

function isValidGrabItem(part)
	if not part or not part:IsA("BasePart") or not part.Parent then return false end
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
			if ch:IsA("BodyVelocity") or ch:IsA("BodyForce") or ch:IsA("BodyAngularVelocity")
				or ch:IsA("BodyGyro") or ch:IsA("BodyPosition") then
				-- never strip dormant throw arms while still MaxForce 0 (holding)
				if ch.Name == "VOIDZ_ThrowArm" or ch.Name == "SuperStrength" then
					if ch:IsA("BodyVelocity") and ch.MaxForce.Magnitude > 1 then
						ch:Destroy()
					end
				elseif tostring(ch.Name):sub(1, 5) == "VOIDZ" or ch.Name == "ZeroGravityForce"
					or ch.Name == "FlingBV" or ch.Name == "SpinAV" or ch.Name == "GravBF"
					or ch.Name == "FreezeBP" or ch.Name == "FreezeBG" or ch.Name == "FollowBP" then
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

-- Pre-arm BodyVelocity WHILE holding ( SuperStrength method).
-- Ownership only lasts during grab — BV must already be parented before let-go.
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
		-- keep ownership pulse while we still can
		if FTAP.SetNetworkOwner then
			local me = hrp()
			local origin = me and me.Position or (part.Position - dir * 6)
			FTAP.SetNetworkOwner:FireServer(part, lookAt(origin, part.Position))
		end
		local bv = ensureThrowArm(part)
		if not bv then
			bv = Instance.new("BodyVelocity")
			bv.Name = "VOIDZ_ThrowArm"
			bv.Parent = part
		end
		bv.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
		bv.Velocity = vel
		Debris:AddItem(bv, 0.9)
		part.AssemblyLinearVelocity = vel
		part.AssemblyAngularVelocity = Vector3.new(18, 36, 12)
		-- spare FlingBV in case arm was stripped
		local spare = part:FindFirstChild("FlingBV")
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

	-- Silent aim override: pallet / shuriken aimed at nearest target
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

	-- Super throw wins if both on
	if S.superStrength or (S.toggles and S.toggles.superStr) then
		local power = (tonumber(S.superStrengthPower) or 4000) * (tonumber(S.strengthMult) or 1)
		-- activate pre-armed SuperStrength BV () + our throw arm
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
		notify(HUB_NAME, "Super throw!", 1)
		return
	end

	if wantThrow then
		-- slider 0–500 → ~0–20000 (default 80 → 3200)
		local power = math.clamp((tonumber(S.grabFlingPower) or 80) * 40, 400, 25000)
		power = power * (tonumber(S.strengthMult) or 1)
		launchThrowArm(root, power, dir)
		if part ~= root and part.Parent then
			launchThrowArm(part, power * 0.95, dir)
		end
		-- if player: SNO whole character + fling limbs
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
		bp.Name = "FreezeBP"
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
		bp.Name = "FollowBP"
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

-- boost AlignPosition/AlignOrientation on GrabParts DragPart (Massless Grab)
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

------------------------------------------------------------------------
-- Stick To Pallet Center — MUST be above onGrabPartsAdded (Luau locals)
-- While YOU hold a pallet: hard-SNO anyone near it + pin their HRP to top center.
-- No client-only welds (those never stick FE). Ownership + BP/CFrame every frame.
------------------------------------------------------------------------
local destroyPalletCage, isPalletPart, buildPalletCage, resolveGrabbedFromWeld, setPalletCage
do
local palletLocks = {} -- GrabParts model -> true
local palletPinned = {} -- root -> true (for cleanup)
local palletCageNotified = false

function _destroyPalletCage(key)
	if key then palletLocks[key] = nil end
end

function _isPalletPart(part)
	if not part then return false end
	local p = part
	for _ = 1, 14 do
		if not p then break end
		local n = tostring(p.Name):lower()
		if n:find("pallet", 1, true) or n == "palletlightbrown" then return true end
		-- your spawned toys folder often parents models as PalletLightBrown
		if p:IsA("Model") and n:find("pallet", 1, true) then return true end
		p = p.Parent
	end
	-- flat wood-ish platform from SpawnedInToys (fallback)
	local model = part:FindFirstAncestorOfClass("Model")
	if model and model.Parent and tostring(model.Parent.Name):find("SpawnedInToys", 1, true) then
		local n = tostring(model.Name):lower()
		if n:find("pallet", 1, true) or n:find("crate", 1, true) or n:find("platform", 1, true) then
			return true
		end
		-- large flat part you're holding from toys folder
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
		if p:IsA("BasePart") and tostring(p.Name):lower():find("pallet", 1, true) then
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
				if n:find("pallet", 1, true) then score = area * 10 end
				-- prefer flat wide parts
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
		for _, n in ipairs({ "VOIDZ_PalletLock", "VOIDZ_PalletLockG", "VOIDZ_PalletBV", "VOIDZ_PalletWeld", "VOIDZ_PalletAlign" }) do
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
	-- stand slightly above top face center
	return base.CFrame * CFrame.new(0, halfY + 2.15, 0)
end

function rootOnPallet(root, base)
	if not root or not base then return false end
	local off = base.CFrame:PointToObjectSpace(root.Position)
	-- generous pad — people slide around while you swing the pallet
	local hx = math.max(base.Size.X, base.Size.Z) * 0.5 + 6
	local hz = hx
	local hy = base.Size.Y * 0.5
	-- also accept sphere check (tilted pallet)
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
	-- ownership first — without it BP/CFrame is local spoof only
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
			-- hard stick when we own them
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

function pinEveryoneOnPallet(base)
	if not base or not base.Parent then return end
	local still = {}

	-- Pin LOCAL PLAYER (you) to pallet top — no PlatformStand so you can still move
	local myR = hrp()
	if myR and rootOnPallet(myR, base) then
		local top = palletTopCFrame(base)
		pcall(function()
			myR.AssemblyLinearVelocity = Vector3.zero
			myR.AssemblyAngularVelocity = Vector3.zero
			-- BodyPosition locks you to top center
			local bp = myR:FindFirstChild("VOIDZ_PalletLock")
			if not bp then
				bp = Instance.new("BodyPosition")
				bp.Name = "VOIDZ_PalletLock"
				bp.MaxForce = Vector3.new(1e9, 1e9, 1e9)
				bp.P = 2e5
				bp.D = 3000
				bp.Parent = myR
			end
			bp.Position = top.Position
			-- BodyVelocity kills any slide
			local bv = myR:FindFirstChild("VOIDZ_PalletBV")
			if not bv then
				bv = Instance.new("BodyVelocity")
				bv.Name = "VOIDZ_PalletBV"
				bv.MaxForce = Vector3.new(1e9, 1e9, 1e9)
				bv.Parent = myR
			end
			bv.Velocity = Vector3.zero
		end)
		still[myR] = true
	end

	-- Pin OTHER players
	for _, plr in ipairs(Players:GetPlayers()) do
		if plr ~= LP and not isWL(plr) then
			local r = rootOf(plr)
			if r and rootOnPallet(r, base) then
				pinRootToPalletCenter(r, base, plr)
				still[r] = true
			end
		end
	end
	-- NPCs
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
	-- free anyone who left
	for root in pairs(palletPinned) do
		if not still[root] then
			local hum = root.Parent and root.Parent:FindFirstChildOfClass("Humanoid")
			if hum then pcall(function() hum.PlatformStand = false end) end
			clearPalletLockForces(root)
		end
	end
end

-- resolve which side of the weld is the world object (not GrabPart)
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
	-- live scan GrabParts (in case grabMap missed Part0)
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
		notify(HUB_NAME, "Pallet lock · people stick to center while you hold", 2)
		task.delay(3, function() palletCageNotified = false end)
	end
end

-- always-on enforcer while toggle is active (more reliable than one while-loop)
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
	-- keep SNO on the pallet itself so physics stays with you
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
		notify(HUB_NAME, "Pallet lock OFF", 1)
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
			-- weld can be delayed a frame
			for _ = 1, 30 do
				weld = gp:FindFirstChildOfClass("WeldConstraint") or gp:FindFirstChild("WeldConstraint")
				if weld and (weld.Part0 or weld.Part1) then break end
				task.wait(0.05)
			end
			if not weld then
				weld = gp:WaitForChild("WeldConstraint", 2)
			end
			-- Part0 OR Part1 can be the world object (FTAP varies)
			grabbed = resolveGrabbedFromWeld(weld, gp)
		end)
		if not ok or not grabbed then return end
		-- allow most parts (old isValidGrabItem blocked too much)
		if not grabbed:IsA("BasePart") then return end
		local myChar = char()
		if myChar and grabbed:IsDescendantOf(myChar) then return end

		grabMap[child] = grabbed
		heldParts[grabbed] = true
		local model = grabbed:FindFirstAncestorOfClass("Model") or grabbed.Parent
		local targetHum = model and model:FindFirstChildOfClass("Humanoid")
		local targetPlr = model and Players:GetPlayerFromCharacter(model)
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
			-- fire immediately ( Parent-changed style) + one Heartbeat later as backup
			if part then
				pcall(function() applyReleaseEffects(part) end)
				task.defer(function()
					-- re-fire if arm still dormant (edge race with network)
					local r = resolveReleaseRoot(part) or part
					local arm = r and r:FindFirstChild("VOIDZ_ThrowArm")
					if arm and arm:IsA("BodyVelocity") and arm.MaxForce.Magnitude < 1 then
						pcall(function() applyReleaseEffects(part) end)
					end
				end)
			end
		end

		-- pallet stick while holding (Part0/Part1 + late weld settle)
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
				-- Silent aim: pallet / shuriken — lock target while holding
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

		-- ALWAYS pre-arm throw BVs while holding if throw / super throw might fire
		-- (must exist before GrabParts dies or ownership is gone)
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

		-- Invisible Line: empty CreateGrabLine so others don't see the beam
		if S.toggles.invisLine and FTAP.CreateGrabLine and not S.toggles.crazyLine then
			pcall(function() FTAP.CreateGrabLine:FireServer() end)
			task.defer(function()
				if S.toggles.invisLine and FTAP.CreateGrabLine then
					pcall(function() FTAP.CreateGrabLine:FireServer() end)
				end
			end)
		end
		-- local beam hide backup
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

		-- Super Strength placeholder BV (: MaxForce 0 → launch on release)
		if S.superStrength or (S.toggles and S.toggles.superStr) then
			pcall(function()
				local target = releaseRoot or grabbed
				local old = target:FindFirstChild("SuperStrength")
				if old then old:Destroy() end
				local bv = Instance.new("BodyVelocity")
				bv.Name = "SuperStrength"
				bv.MaxForce = Vector3.zero
				bv.Velocity = Vector3.zero
				bv.Parent = target
			end)
		end

		-- Anchored grabbed object while held
		if S.anchorGrab or S.toggles.anchorGrab then
			task.spawn(function()
				local was = grabbed.Anchored
				while child.Parent and (S.anchorGrab or S.toggles.anchorGrab) do
					pcall(function()
						grabbed.Anchored = true
						grabbed.AssemblyLinearVelocity = Vector3.zero
					end)
					task.wait()
				end
				pcall(function() grabbed.Anchored = was end)
			end)
		end

		-- Massless Grab: crank Align forces while held
		if S.masslessGrab or S.toggles.masslessGrab then
			task.spawn(function()
				while child.Parent and (S.masslessGrab or S.toggles.masslessGrab) do
					boostGrabAlign(child, true)
					task.wait(0.2)
				end
			end)
		end

		-- Noclip Grab: disable collision on held model while held
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

		-- Super Strength While Holding: apply constant force toward camera direction
		if S.superStrengthHold or S.toggles.superStrHold then
			task.spawn(function()
				while child.Parent and (S.superStrengthHold or S.toggles.superStrHold) do
					pcall(function()
						local cam = workspace.CurrentCamera
						local dir = cam and cam.CFrame.LookVector or Vector3.new(0, 0, -1)
						local power = tonumber(S.superStrengthHoldPower) or 5000
						local force = dir * power + Vector3.new(0, power * 0.3, 0)
						-- Apply to grabbed part and root
						local targets = {grabbed}
						if releaseRoot and releaseRoot ~= grabbed then
							table.insert(targets, releaseRoot)
						end
						for _, part in ipairs(targets) do
							if part and part.Parent then
								part.AssemblyLinearVelocity = force
								local bv = part:FindFirstChild("SuperStrengthHold")
								if not bv then
									bv = Instance.new("BodyVelocity")
									bv.Name = "SuperStrengthHold"
									bv.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
									bv.Parent = part
								end
								bv.Velocity = force
							end
						end
					end)
					task.wait()
				end
				-- cleanup
				pcall(function()
					local bv1 = grabbed:FindFirstChild("SuperStrengthHold")
					if bv1 then bv1:Destroy() end
					if releaseRoot then
						local bv2 = releaseRoot:FindFirstChild("SuperStrengthHold")
						if bv2 then bv2:Destroy() end
					end
				end)
			end)
		end

		-- Death / Kill Grab — blitzbr pattern: SNO + DestroyGrabLine + Dead state
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
					-- destroy grab line like blitzbr so the death state actually kills them
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

		-- Ragdoll Grab (instant)
		if (S.ragdollGrab or S.toggles.ragdollGrab) and targetPlr then
			task.spawn(function()
				-- fire immediately on grab
				ragdollInstant(targetPlr)
				while child.Parent and (S.ragdollGrab or S.toggles.ragdollGrab) do
					ragdollInstant(targetPlr)
					task.wait(0.08)
				end
			end)
		end

		-- Poison Grab (uses canonical getPoisonHurtParts + applyMapPoison)
		if (S.poisonGrab or S.toggles.poisonGrab) and grabbed then
			task.spawn(function()
				while child.Parent and (S.poisonGrab or S.toggles.poisonGrab) do
					local r = targetPlr and rootOf(targetPlr) or grabbed
					if r then
						applyMapPoison(r)
					end
					task.wait(0.1)
				end
			end)
		end

		-- Burn Grab (ensure campfire exists first)
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

		-- zero-g while holding
		if S.grabZeroG then
			clearPartForces(grabbed)
			local bf = Instance.new("BodyForce")
			bf.Name = "ZeroGravityForce"
			bf.Force = Vector3.new(0, S.grabZeroGForce or 50000, 0)
			bf.Parent = grabbed
		end

		-- while held: optional spin drag
		if S.grabSpin and S.toggles.spinWhileHold then
			local av = Instance.new("BodyAngularVelocity")
			av.Name = "SpinAV"
			av.MaxTorque = Vector3.new(math.huge, math.huge, math.huge)
			av.AngularVelocity = Vector3.new(0, S.grabSpinSpeed or 80, 0)
			av.Parent = grabbed
		end

		-- Release detection ( uses Parent changed; also Ancestry + Destroying + weld break)
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
		-- weld broke / Part1 cleared while GrabParts still exists
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
		-- safety: poll until GrabParts gone
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
			-- onGrabPartsAdded poll/Parent should handle; this is a hard backup
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
	-- catch already-existing
	for _, ch in ipairs(workspace:GetChildren()) do
		if ch.Name == "GrabParts" then onGrabPartsAdded(ch) end
	end
	-- keep follow BP updated
	bind("grabFollowHB", RunService.Heartbeat:Connect(function()
		if not S.grabFollow then return end
		local me = hrp()
		if not me then return end
		local foot = me.Position - Vector3.new(0, 2.5, 0)
		for part, _ in pairs(effectParts) do
			if part and part.Parent then
				local bp = part:FindFirstChild("FollowBP")
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

-- Auto Attacker: instant grabber fling — no long loops, just SNO + fling + break
function counterAttackPlayer(plr, part)
	if not plr or not validP(plr) then return end
	-- Don't attack anti-grab whitelisted players
	if isAntiGrabWhitelisted(plr) then return end
	local mode = S.counterMode or "Repulsion"
	local force = (tonumber(S.revengeForce) or 12000) * (tonumber(S.strengthMult) or 1)
	local r = rootOf(plr) or part
	if not r then return end
	local me = hrp()
	if not me then return end

	-- quick SNO (you're already next to them while grabbed)
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
			-- Repulsion: launch grabber away from you
			local look = lookAt(me.Position, r.Position)
			local vel = Vector3.new(look.LookVector.X, 0.5, look.LookVector.Z) * math.clamp(force / 100, 80, 300)
			local bv = Instance.new("BodyVelocity")
			bv.Name = "VOIDZ_Counter"
			bv.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
			bv.Velocity = vel
			bv.Parent = r
			Debris:AddItem(bv, 0.3)
			r.AssemblyLinearVelocity = vel
		end
		-- break grab line on grabber
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

-- + : Struggle spam, kill GrabParts on us, optional revenge fling grabber
doAntiGrabHard = function()
	local c = char()
	if not c then return end
	local r = hrp()
	local h = hum()

	if FTAP.Struggle then
		pcall(function() FTAP.Struggle:FireServer(LP) end)
		pcall(function() FTAP.Struggle:FireServer() end)
	end
	if FTAP.StopAllVelocity then pcall(function() FTAP.StopAllVelocity:FireServer() end) end
	if r and FTAP.RagdollRemote then
		pcall(function() FTAP.RagdollRemote:FireServer(r, 0) end)
	end

	-- Only break GrabParts that are attacking US (never our own grabs)
	for _, child in ipairs(workspace:GetChildren()) do
		if child.Name == "GrabParts" and grabPartsIsAttackingUs(child, c) then
			revengeFromGrabParts(child)
			for _, d in ipairs(child:GetDescendants()) do
				if d:IsA("WeldConstraint") or d:IsA("Weld") then
					pcall(function() d:Destroy() end)
				end
			end
			pcall(function() child:Destroy() end)
		end
	end

	-- do NOT strip all welds / DestroyGrabLine on every body part — that kills YOUR grab line

	if h then
		pcall(function()
			h.PlatformStand = false
			h.Sit = false
			h.AutoRotate = true
			h:SetStateEnabled(Enum.HumanoidStateType.Jumping, true)
			h:SetStateEnabled(Enum.HumanoidStateType.Running, true)
			h:SetStateEnabled(Enum.HumanoidStateType.FallingDown, false)
			h:SetStateEnabled(Enum.HumanoidStateType.Ragdoll, false)
			local st = h:GetState()
			if st == Enum.HumanoidStateType.Physics or st == Enum.HumanoidStateType.Ragdoll
				or st == Enum.HumanoidStateType.FallingDown then
				h:ChangeState(Enum.HumanoidStateType.Running)
			end
		end)
	end

	-- while held: zero velocity (anchor handled by IsHeld Heartbeat)
	if r then
		local held = LP:FindFirstChild("IsHeld")
		if held and held.Value then
			r.AssemblyLinearVelocity = Vector3.zero
		end
		for _, d in ipairs(r:GetChildren()) do
			if (d:IsA("BodyVelocity") or d:IsA("BodyAngularVelocity") or d:IsA("BodyForce"))
				and d.Name ~= "VOIDZ_Fly" and d.Name ~= "VOIDZ_FlyG" and d.Name ~= "BringBody" then
				pcall(function() d:Destroy() end)
			end
		end
	end
end

antiGrabTick = function()
	if S.toggles.antiGucci or S.toggles.antiGrab then
		gucciAntiTick()
	end
end

-- Instant anti-grab the frame GrabParts appears (ChildAdded + DescendantAdded)
bind("antiGrabChild", workspace.ChildAdded:Connect(function(child)
	if not (S.toggles.antiGrab or S.toggles.antiGucci) then return end
	if child.Name ~= "GrabParts" then return end
	local function burst()
		if not (S.toggles.antiGrab or S.toggles.antiGucci) then return end
		-- only break if this GrabParts is on US
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

-- True when someone is holding YOU (not when you are grabbing others)
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
	-- weld on our character from foreign GrabParts
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

-- Get the player who is grabbing us (if any)
function getGrabberPlayer()
	local c = char()
	if not c then return nil end
	-- Check via IsHeld
	local held = LP:FindFirstChild("IsHeld")
	if held and held.Value then
		-- Try to find grabber from PartOwner
		for _, part in ipairs(c:GetDescendants()) do
			if part:IsA("BasePart") then
				local po = part:FindFirstChild("PartOwner")
				if po and po.Value then
					local plr = po.Value
					if typeof(plr) == "Instance" and plr:IsA("Player") and plr ~= LP then
						return plr
					end
				end
			end
		end
	end
	-- Check via GrabParts welds
	if grabPartsIsAttackingUs then
		for _, ch in ipairs(workspace:GetChildren()) do
			if ch.Name == "GrabParts" and grabPartsIsAttackingUs(ch, c) then
				-- Find the player who owns this GrabParts
				for _, d in ipairs(ch:GetDescendants()) do
					if d:IsA("WeldConstraint") or d:IsA("Weld") then
						local other = nil
						if d.Part0 and d.Part0:IsDescendantOf(c) and d.Part1 and not d.Part1:IsDescendantOf(c) then other = d.Part1 end
						if d.Part1 and d.Part1:IsDescendantOf(c) and d.Part0 and not d.Part0:IsDescendantOf(c) then other = d.Part0 end
						if other then
							local model = other:FindFirstAncestorOfClass("Model")
							if model then
								local plr = Players:GetPlayerFromCharacter(model)
								if plr and plr ~= LP then return plr end
							end
						end
					end
				end
			end
		end
	end
	-- Check via welds on our character
	for _, d in ipairs(c:GetDescendants()) do
		if d:IsA("WeldConstraint") or d:IsA("Weld") then
			local other = nil
			if d.Part0 and d.Part0:IsDescendantOf(c) and d.Part1 and not d.Part1:IsDescendantOf(c) then other = d.Part1 end
			if d.Part1 and d.Part1:IsDescendantOf(c) and d.Part0 and not d.Part0:IsDescendantOf(c) then other = d.Part0 end
			if other then
				local gp = nil
				local cur = other
				for _ = 1, 10 do
					if not cur then break end
					if cur.Name == "GrabParts" then gp = cur break end
					cur = cur.Parent
				end
				if gp then
					for _, d2 in ipairs(gp:GetDescendants()) do
						if d2:IsA("WeldConstraint") or d2:IsA("Weld") then
							local other2 = nil
							if d2.Part0 and not d2.Part0:IsDescendantOf(c) and d2.Part1 and d2.Part1:IsDescendantOf(c) then other2 = d2.Part0 end
							if d2.Part1 and not d2.Part1:IsDescendantOf(c) and d2.Part0 and d2.Part0:IsDescendantOf(c) then other2 = d2.Part1 end
							if other2 then
								local model = other2:FindFirstAncestorOfClass("Model")
								if model then
									local plr = Players:GetPlayerFromCharacter(model)
									if plr and plr ~= LP then return plr end
								end
							end
						end
					end
				end
			end
		end
	end
	return nil
end

-- Full free: Struggle + DestroyGrabLine + break GrabParts on us (no sky/float boost)
function freeFromGrabInstant()
	resolveFTAP()
	local c = char()
	local r = hrp()
	local h = hum()
	if not c or not r then return end

	-- spam struggle ()
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

	-- DestroyGrabLine on every BasePart of us (server-side break)
	if FTAP.DestroyGrabLine then
		pcall(function() FTAP.DestroyGrabLine:FireServer(r) end)
		for _, part in ipairs(c:GetDescendants()) do
			if part:IsA("BasePart") then
				pcall(function() FTAP.DestroyGrabLine:FireServer(part) end)
			end
		end
	end

	-- client-side: kill GrabParts that are attacking us
	for _, child in ipairs(workspace:GetChildren()) do
		if child.Name == "GrabParts" then
			local attacking = grabPartsIsAttackingUs and grabPartsIsAttackingUs(child, c)
			if attacking then
				for _, d in ipairs(child:GetDescendants()) do
					if d:IsA("WeldConstraint") or d:IsA("Weld") or d:IsA("Motor6D") then
						pcall(function() d:Destroy() end)
					end
				end
				pcall(function() child:Destroy() end)
			end
		end
	end

	-- strip grab forces on our body (never leave BodyPosition floating us)
	pcall(function()
		r.Anchored = false
		for _, part in ipairs(c:GetDescendants()) do
			if part:IsA("BasePart") then
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

	-- short burst while still marked held — struggle only, NO upward velocity
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
					-- clamp upward only — never force float
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

-- Instant escape: Space / Jump / mobile jump while grabbed
function installInstantEscape()
	-- always rebind cleanly
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
		notify(HUB_NAME, "Escape!", 0.8)
	end

	-- JumpRequest often blocked while grabbed — still hook it
	S.conns.escapeJump = UserInputService.JumpRequest:Connect(function()
		tryEscape()
	end)
	-- Space / gamepad A always
	S.conns.escapeInput = UserInputService.InputBegan:Connect(function(input, _gp)
		if input.KeyCode == Enum.KeyCode.Space
			or input.KeyCode == Enum.KeyCode.ButtonA
			or input.KeyCode == Enum.KeyCode.ButtonX then
			tryEscape()
		end
	end)
	-- high priority so game grab scripts don't eat Space
	pcall(function()
		ContextActionService:BindActionAtPriority(
			"VOIDZ_InstantEscape",
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

	-- if grab starts, just notify (user presses Space to escape, like ruhub)
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

------------------------------------------------------------------------
-- Scroll Distance ( Further Extend) — SEPARATE from Massless Grab
-- 1) GrabbingScript senv.distance = how far you can START a grab
-- 2) DragPart1 at camera * pcDistance = how far you HOLD them (mouse wheel)
------------------------------------------------------------------------
local reachGamepassState = {}
local grabSenvCache = nil
local pcDistance = 0 -- live hold distance while grabbing (scroll this)
S.extendAmount = S.extendAmount or 25 -- slider target / scroll step base
S.scrollStep = S.scrollStep or 2 -- how much wheel changes distance

function getGrabbingScript()
	local c = LP.Character
	if c then
		local gs = c:FindFirstChild("GrabbingScript") or c:FindFirstChild("GrabbingScript", true)
		if gs then return gs end
	end
	-- wait briefly (script often late after respawn)
	if c then
		local ok, gs = pcall(function() return c:WaitForChild("GrabbingScript", 2) end)
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

function refreshGrabSenv(force)
	if not getsenv then return nil end
	if grabSenvCache and not force then
		-- stale if character changed
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
	if ok and type(env) == "table" then
		grabSenvCache = env
		return env
	end
	return nil
end

-- Force GrabbingScript env.distance (grab START range) — sets this via scroll
function forceGrabDistance(amount)
	amount = math.clamp(tonumber(amount) or S.extendAmount or 25, 3, 120)
	S.extendAmount = amount
	local env = refreshGrabSenv(true)
	if not env then return false end
	pcall(function()
		-- only writes .distance; we force high so grab initiates far away
		env.distance = amount
		if type(env.maxDistance) == "number" then env.maxDistance = math.max(amount, env.maxDistance) end
		if type(env.MaxDistance) == "number" then env.MaxDistance = math.max(amount, env.MaxDistance) end
		if type(env.grabDistance) == "number" then env.grabDistance = amount end
		if type(env.lineDistance) == "number" then env.lineDistance = amount end
		if type(env.minDistance) == "number" then env.minDistance = math.min(env.minDistance, 3) end
		-- common alternate names in forks
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
		-- keep CharacterAndBeamMove alive (anti-lag turns it off and kills reach)
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
		if fr and fr:IsA("BoolValue") then fr:Destroy() end
		reachGamepassState = {}
		grabSenvCache = nil
		pcDistance = 0
	end)
end

-- PC extend: BodyPosition on DragPart, drive to camera * pcDistance every frame
function setupDragExtend(grabModel)
	if not grabModel or not grabModel.Parent then return end
	if grabModel:GetAttribute("VOIDZ_ReachSetup") then return end
	local drag = grabModel:FindFirstChild("DragPart")
	if not drag or not drag:IsA("BasePart") then return end
	grabModel:SetAttribute("VOIDZ_ReachSetup", true)

	-- disable original AlignPosition + AlignOrientation so they don't fight BodyPosition
	pcall(function() drag.AlignPosition.Enabled = false end)
	pcall(function() drag.AlignOrientation.Enabled = false end)

	-- BodyPosition on the ORIGINAL DragPart (which pulls GrabPart + welded victim)
	local bp = Instance.new("BodyPosition")
	bp.Name = "VOIDZ_ScrollDrag"
	bp.MaxForce = Vector3.new(1e5, 1e5, 1e5)
	bp.D = 200
	bp.P = 10000
	bp.Position = drag.Position
	bp.Parent = drag

	-- start at extend distance (not raw distance which can be 0 if facing away)
	pcDistance = math.clamp(S.extendAmount or 25, 11, 120)
end

function tickDragExtend(grabModel)
	if not grabModel or not grabModel.Parent then return end
	if not S.toggles.lineExtend then return end
	setupDragExtend(grabModel)
	local drag = grabModel:FindFirstChild("DragPart")
	local bp = drag and drag:FindFirstChild("VOIDZ_ScrollDrag")
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
			-- blitzbr pattern: WaitForChild for both parts before proceeding
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
		if input.UserInputType ~= Enum.UserInputType.MouseWheel then return end
		local step = tonumber(S.scrollStep) or 2
		local z = input.Position.Z
		if z > 0 then
			pcDistance = pcDistance + step
		else
			pcDistance = pcDistance - step
		end
		pcDistance = math.clamp(pcDistance, 11, 120)
		local amt = pcDistance
		if FTAP.ExtendGrabLine then
			pcall(function()
				if FTAP.ExtendGrabLine:IsA("RemoteEvent") then
					FTAP.ExtendGrabLine:FireServer(amt)
				elseif FTAP.ExtendGrabLine:IsA("RemoteFunction") then
					FTAP.ExtendGrabLine:InvokeServer(amt)
				end
			end)
		end
		for _, ch in ipairs(workspace:GetChildren()) do
			if ch.Name == "GrabParts" then
				local drag = ch:FindFirstChild("DragPart")
				if drag then
					local me = hrp()
					if me then
						drag.Position = me.Position + (me.CFrame.LookVector * amt)
					end
				end
				ch:GetAttribute("VOIDZ_ReachSetup")
			end
		end
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
				local ao = drag and (drag:FindFirstChildOfClass("AlignOrientation") or drag:FindFirstChild("AlignOrientation", true))
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
	-- re-force grab-start distance (game resets senv)
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
		and ("Scroll distance ON · " .. tostring(amt) .. " (wheel while holding)")
		or "Scroll distance ON · grab someone once to lock GrabbingScript"
	notify(HUB_NAME, msg, 2.5)
	if not getsenv then
		notify(HUB_NAME, "No getsenv — hold-extend still works via DragPart", 2.5)
	end
end

------------------------------------------------------------------------
-- Silent aim + anti-kick in nested scope (keeps _voidzLateInit under 200 locals)
------------------------------------------------------------------------
local setSilentAim, setAntiKick, installAntiKickOnLoad, _startFovCircle, _stopFovCircle
-- nested to free ~15 locals from _voidzLateInit (Luau 200 limit)
(function()
local silentHooked = false
local silentTarget = nil
local silentFov = S.silentFov or 150
local silentFovCircle = true
local silentCircleObj = nil
local silentCircleBG = nil
local silentAimBusy = false
local SILENT_HITBOXES = {"Head", "HumanoidRootPart", "Torso", "UpperTorso"}

-- find nearest player to crosshair (screen-center distance)
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

-- pick random hitbox part from target (existence-checked fallback)
local function pickHitbox(target)
	local char = target and target.Character
	if not char then return nil end
	for _, name in ipairs(SILENT_HITBOXES) do
		local part = char:FindFirstChild(name)
		if part then return part end
	end
	return nil
end

-- FOV circle render loop
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
		-- cleanup
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
		-- start target updater
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
			-- use silentAimBusy flag instead of checkcaller() (unreliable on many executors)
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

------------------------------------------------------------------------
-- Anti-kick: scan YOUR client only (console + Roblox disconnect UI + Kick)
-- Strict phrases only — ignores hub buttons / other players' kicks
------------------------------------------------------------------------
local LogService = game:GetService("LogService")
local AK = (getgenv and getgenv().VOIDZ_ANTIKICK) or {}
if getgenv then getgenv().VOIDZ_ANTIKICK = AK end
-- reset on every inject so old hooks cannot instant-rejoin
AK.enabled = false
AK.rejoining = false
AK.lastAt = 0
AK.readyAt = math.huge
AK.weInitiatedTeleport = false
AK.scanBound = false
AK.gen = (AK.gen or 0) + 1
AK.seen = AK.seen or {} -- dedupe console lines briefly

local GRACE_SEC = 12 -- no rejoin during load / UI build

local function antiKickReady()
	return AK.enabled == true and os.clock() >= (AK.readyAt or math.huge)
end

-- Detect FTAP kick blackhole (appears in CoreGui/PlayerGui before kick)
local function detectKickBlackhole()
	if not antiKickReady() then return false end
	-- Check CoreGui for kick blackhole (FTAP shows blackhole before kick)
	pcall(function()
		local cg = game:GetService("CoreGui")
		for _, child in ipairs(cg:GetChildren()) do
			local name = child.Name:lower()
			if name:find("blackhole", 1, true) or name:find("black_hole", 1, true) or name:find("kickblack", 1, true) or name:find("disconnectblack", 1, true) then
				for _, desc in ipairs(child:GetDescendants()) do
					if desc:IsA("Frame") or desc:IsA("ImageLabel") then
						local bg = desc.BackgroundColor3
						if bg.R < 0.1 and bg.G < 0.1 and bg.B < 0.1 and desc.BackgroundTransparency < 0.5 then
							if desc.AbsoluteSize.X > 100 or desc.AbsoluteSize.Y > 100 then
								onKickSignal("Kick BlackHole detected: " .. child.Name, "BlackHole")
								return
							end
						end
					end
				end
			end
		end
	end)
	-- Check PlayerGui too
	pcall(function()
		local pg = LP:FindFirstChild("PlayerGui")
		if pg then
			for _, child in ipairs(pg:GetChildren()) do
				local name = child.Name:lower()
				if name:find("blackhole", 1, true) or name:find("black_hole", 1, true) then
					for _, desc in ipairs(child:GetDescendants()) do
						if desc:IsA("Frame") or desc:IsA("ImageLabel") then
							local bg = desc.BackgroundColor3
							if bg.R < 0.1 and bg.G < 0.1 and bg.B < 0.1 and desc.BackgroundTransparency < 0.5 then
								if desc.AbsoluteSize.X > 100 or desc.AbsoluteSize.Y > 100 then
									onKickSignal("Kick BlackHole detected (PlayerGui): " .. child.Name, "BlackHole")
									return
								end
							end
						end
					end
				end
			end
		end
	end)
	return false
end

-- True only for REAL kick / disconnect language aimed at YOU
local function isRealKickSignal(text, source)
	source = tostring(source or "")
	-- LocalPlayer:Kick namecall is always a real kick attempt on you
	if source == "Player:Kick" then return true end

	text = tostring(text or ""):gsub("%s+", " "):gsub("^%s+", ""):gsub("%s+$", "")
	if text == "" then return false end
	local low = text:lower()

	-- ignore our own prints / rejoin notice
	if low:find("[voidz]", 1, true) or low:find("voidz ·", 1, true) then return false end
	if low:find("anti-kick checked", 1, true) then return false end
	if low:find("anti-kick", 1, true) and (low:find("grace", 1, true) or low:find("active", 1, true) or low:find("off", 1, true)) then
		return false
	end
	if low:find("saved your butt", 1, true) then return false end

	-- ignore hub / combat UI wording (never rejoin from button labels)
	if source == "hub" then return false end
	if #low < 16 then return false end -- "Kick Selected" etc. are short
	if low:find("selected", 1, true) or low:find("toggle", 1, true) then return false end
	if low:find("loop kick", 1, true) or low:find("kick type", 1, true) then return false end
	if low:find("kick all", 1, true) or low:find("kick target", 1, true) then return false end
	if low:find("aura", 1, true) and low:find("kick", 1, true) then return false end
	if low:find("blobman", 1, true) or low:find("stackkick", 1, true) or low:find("grabkick", 1, true) then return false end

	-- ignore other players being kicked (not you)
	if low:find("has been kicked", 1, true) and not low:find("you have been kicked", 1, true) then
		return false
	end
	if low:find("was kicked", 1, true) and not low:find("you were kicked", 1, true) then
		return false
	end
	if low:find("kicked player", 1, true) or low:find("kicking", 1, true) then return false end

	-- strict YOU / client disconnect phrases only
	local phrases = {
		"you were kicked",
		"you have been kicked",
		"you got kicked",
		"kicked from this experience",
		"kicked from the experience",
		"kicked from the game",
		"kicked from this game",
		"removed from this experience",
		"you have been removed from",
		"you were removed from",
		"disconnected from the game",
		"disconnected from experience",
		"lost connection to the game",
		"lost connection to the server",
		"connection lost",
		"please check your internet connection",
		"same account launched",
		"another device has joined",
		"client was kicked",
		"you have been banned",
		"banned from this experience",
		"account has been banned",
		"error code: 267", -- kicked
		"error code: 277",
		"error code: 279",
		"error code: 280",
		"error code: 256",
		"error code: 268",
		"error code: 773",
		"reconnect to the experience",
		"leave and rejoin",
		"try rejoining",
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

	local fancy = "✦ VOIDZ · anti-kick triggered · rejoining ✦"
	pcall(function() voidzChat(fancy) end)
	pcall(function()
		notify(HUB_NAME, "Anti-kick · leaving before AC · rejoining…", 3)
	end)
	pcall(function()
		StarterGui:SetCore("ChatMakeSystemMessage", {
			Text = fancy,
			Color = Color3.fromRGB(180, 120, 255),
			Font = Enum.Font.GothamBold,
			TextSize = 16,
		})
	end)

	task.spawn(function()
		local placeId = game.PlaceId
		local jobId = game.JobId
		-- Queue rejoin FIRST so even if we self-kick, teleport is pending
		pcall(function()
			if queue_on_teleport then
				queue_on_teleport("print('[VOIDZ] anti-kick rejoin')")
			end
			if syn and syn.queue_on_teleport then
				syn.queue_on_teleport("print('[VOIDZ] anti-kick rejoin')")
			end
		end)
		-- Teleport same server ASAP (beat game AC kick)
		local tries = {
			function()
				if jobId and #jobId > 0 then
					TeleportService:TeleportToPlaceInstance(placeId, jobId, LP)
				else
					error("no job")
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
		-- Preemptive self-kick so YOU disconnect cleanly before game AC finishes
		-- (message contains VOIDZ so namecall hook allows it)
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
	-- short dedupe so same console line / prompt doesn't multi-fire
	local key = (source or "?") .. "|" .. tostring(text):lower():sub(1, 120)
	local t = os.clock()
	if AK.seen[key] and (t - AK.seen[key]) < 6 then return end
	AK.seen[key] = t
	print("[VOIDZ] kick signal from", source, "→", tostring(text):sub(1, 100))
	doVoidzRejoin(text)
end

local function installNamecallKickHook()
	if not hookmetamethod or not getnamecallmethod then return false end
	if getgenv and getgenv().VOIDZ_AK_HOOKED then return true end
	local ok = pcall(function()
		local old
		old = hookmetamethod(game, "__namecall", function(self, ...)
			local method = getnamecallmethod()
			local m = tostring(method or "")
			if (m == "Kick" or m == "kick") and self == LP then
				local args = { ... }
				local msg = tostring(args[1] or "")
				local low = msg:lower()
				if low:find("voidz", 1, true) or low:find("saved your butt", 1, true) then
					return old(self, ...)
				end
				if antiKickReady() then
					-- about to kick → rejoin before disconnect finishes
					print("[VOIDZ] Player:Kick intercepted:", msg)
					task.defer(function()
						onKickSignal(msg ~= "" and msg or "you were kicked", "Player:Kick")
					end)
					return -- swallow so teleport can run
				end
				return old(self, ...)
			end
			return old(self, ...)
		end)
		if getgenv then getgenv().VOIDZ_AK_HOOKED = true end
	end)
	return ok
end

local function scanPromptGuiText(gui)
	if not gui then return end
	for _, d in ipairs(gui:GetDescendants()) do
		if d:IsA("TextLabel") or d:IsA("TextButton") or d:IsA("TextBox") then
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

	-- 1) YOUR client console only (LogService = local output, not other players)
	pcall(function()
		LogService.MessageOut:Connect(function(message, _messageType)
			if not antiKickReady() then return end
			onKickSignal(message, "console")
		end)
	end)

	-- 2) Official Roblox error message (disconnect / kick dialogs)
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

	-- 3) RobloxPromptGui only (disconnect / leave prompts) — not our hub
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
					-- text sometimes fills in a frame later
					task.delay(0.15, function()
						if d.Parent then onKickSignal(d.Text, "RobloxPromptGui") end
					end)
				end)
			end
		end)
		-- property changes on existing labels
		for _, d in ipairs(gui:GetDescendants()) do
			if d:IsA("TextLabel") or d:IsA("TextButton") then
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

	-- 4) Poll official error + prompt (catches late-filled text)
	task.spawn(function()
		while true do
			task.wait(0.45)
			if not AK.enabled then
				-- keep loop alive for re-enable; cheap when off
			elseif antiKickReady() then
				pcall(function()
					local msg = tostring(GuiService:GetErrorMessage() or "")
					if msg ~= "" then onKickSignal(msg, "GuiService.poll") end
				end)
				pcall(function()
					scanPromptGuiText(CoreGui:FindFirstChild("RobloxPromptGui"))
				end)
				pcall(detectKickBlackhole)
			end
		end
	end)

	-- 5) Teleport retry only for rejoins WE started
	pcall(function()
		TeleportService.TeleportInitFailed:Connect(function(player, _result, errMsg)
			if player ~= LP and player ~= nil then return end
			if not AK.weInitiatedTeleport then return end
			if not antiKickReady() then return end
			task.delay(1, function()
				AK.rejoining = false
				doVoidzRejoin("TeleportInitFailed " .. tostring(errMsg))
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
	print("[VOIDZ] anti-kick ON · scans console + Roblox kick UI · " .. GRACE_SEC .. "s grace")
	if not quiet then
		notify(HUB_NAME, "Anti-kick ON · " .. GRACE_SEC .. "s grace, then scanning", 3)
	end
	task.delay(GRACE_SEC, function()
		if AK.enabled and AK.gen == gen then
			if not quiet then notify(HUB_NAME, "Anti-kick scanning (console + kick UI)", 2) end
			print("[VOIDZ] anti-kick active — console + RobloxPromptGui + Player:Kick")
		end
	end)
end

installAntiKickOnLoad = function()
	-- set up anti-kick infrastructure but do NOT auto-enable
	AK.enabled = false
	AK.rejoining = false
	S.toggles.antiKick = false
	S.toggles.autoRejoin = false
	print("[VOIDZ] anti-kick infrastructure ready (not enabled)")
end

-- expose FOV circle functions to outer scope for combat tab
_startFovCircle = startFovCircle
_stopFovCircle = stopFovCircle

end)()

------------------------------------------------------------------------
-- Unload
local function unload()
	-- hard-disable anti-kick so stacked hooks from prior injects never rejoin
	pcall(function()
		local ak = getgenv and getgenv().VOIDZ_ANTIKICK
		if ak then
			ak.enabled = false
			ak.readyAt = math.huge
			ak.rejoining = false
			ak.weInitiatedTeleport = false
		end
	end)
	for k in pairs(S.loops) do S.loops[k] = false end
	for _, c in pairs(S.conns) do pcall(function() c:Disconnect() end) end
	-- kill UI mouse-unlock force loop FIRST (lives outside S.conns)
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
	pcall(function() ContextActionService:UnbindAction("VOIDZ_PalletQ") end)
	pcall(function() ContextActionService:UnbindAction("VOIDZ_TabToy") end)
	pcall(function() ContextActionService:UnbindAction("VOIDZ_InstantEscape") end)
	pcall(function() ContextActionService:UnbindAction("VOIDZ_ControlK") end)
	-- destroy UI before re-lock so no open-hub path re-unlocks
	if S.gui then pcall(function() S.gui:Destroy() end) end
	S.gui = nil
	S.root = nil
	-- hard re-lock camera mouse (game + leftover RenderStepped both fight this)
	task.spawn(function()
		for _ = 1, 120 do
			pcall(function()
				UserInputService.MouseBehavior = Enum.MouseBehavior.LockCenter
				UserInputService.MouseIconEnabled = false
			end)
			RunService.RenderStepped:Wait()
		end
	end)
	if getgenv then getgenv().VOIDZ_LOADED = nil; getgenv().VOIDZ_UNLOAD = nil end
	print("[VOIDZ] unloaded")
end
if getgenv then getgenv().VOIDZ_UNLOAD = unload end

------------------------------------------------------------------------
-- UI nested scope (Luau max 200 locals per function — UI was pushing past limit)
local function _voidzInitUI()
-- UI helpers (tooltips, settings drawers, dropdowns)
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

-- Feature search index (home search bar)
S.featureIndex = S.featureIndex or {}
S._buildingTab = nil

local function indexFeature(kind, title, tip, extra)
	local tab = S._buildingTab
	if not tab or title == nil or title == "" then return end
	-- skip pure layout noise on home
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
			-- subsequence
			local j = 1
			for i = 1, #blob do
				if blob:sub(i, i) == w:sub(j, j) then
					j += 1
					if j > #w then best = math.max(best, 12); break end
				end
			end
			-- typo tolerance vs title tokens
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
	-- require roughly half the words to hit for multi-word queries
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
	-- dedupe same title+tab
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
	indexFeature("section", text, "section header", text)
	local mob = isMobileMode()
	local wrap = Instance.new("Frame")
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
	-- bubble tag for buttons
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
				warn("[VOIDZ]", err)
				notify(HUB_NAME, "Err: " .. tostring(err):sub(1, 50), 3)
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
			tip = opts.tip or opts.desc or "Run this action with the button.",
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
	-- bubble tag (premium/op/new badge)
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
		bubble.Parent = row
		bubble.ZIndex = 12
		corner(bubble, 6)
		stroke(bubble, tc.bg, 1.5, 0)
		-- position after title
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
		tip = opts.tip or opts.desc or "Toggle this feature on/off.",
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
				notify(HUB_NAME, "Err: " .. tostring(err):sub(1, 40), 2)
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
	local box = Instance.new("TextBox")
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
	local lbl = Instance.new("TextLabel")
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
	-- search filter for dropdowns with many options
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

-- Reusable player search list — same look/feel as Loops tab
-- clickFn(p, lab) is called when a player is clicked
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
		box.PlaceholderText = "Search display or @username..."
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
			b.BackgroundColor3 = isSel and C.accentDim or C.card
			b.BorderSizePixel = 0
			b.Font = Enum.Font.Gotham
			b.TextSize = 11
			b.TextColor3 = C.text
			b.TextXAlignment = Enum.TextXAlignment.Left
			b.Text = " " .. lab .. (isLoop and "  ★" or "") .. (isSel and "  ●" or "")
			b.AutoButtonColor = false
			b.Parent = listSc
			corner(b, 6)
			if isLoop then stroke(b, C.accent, 1) end
			b.MouseButton1Click:Connect(function()
				S.selected = p
				pcall(function() clickFn(p, lab) end)
				refresh()
			end)
		end
	end
	refresh()
	if searchInput then
		searchInput:GetPropertyChangedSignal("Text"):Connect(refresh)
	end
	return refresh
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

	-- main toggle row
	local head = Instance.new("Frame")
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

	local gear = Instance.new("TextButton")
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

	-- target dropdown inside settings
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
	local tBtn = Instance.new("TextButton")
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

	-- range slider mini
	local rLabel = Instance.new("TextLabel")
	rLabel.Size = UDim2.new(1, 0, 0, 14)
	rLabel.BackgroundTransparency = 1
	rLabel.Font = Enum.Font.Gotham
	rLabel.TextSize = 10
	rLabel.TextColor3 = C.muted
	rLabel.TextXAlignment = Enum.TextXAlignment.Left
	rLabel.Text = "Range: " .. tostring(cfg.range or 50)
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
		rLabel.Text = "Range: " .. (nextV >= 9999 and "MAP" or tostring(nextV))
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
	pLabel.Text = "Power: " .. tostring(cfg.power or 2500)
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
		grabT.Text = "Force Grab Lines: OFF"
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
		setAura(id, S.toggles["aura_" .. id] == true)
		if S.toggles["aura_" .. id] then notify(HUB_NAME, meta.title .. " ON", 1.2) end
	end)
	gear.MouseButton1Click:Connect(function()
		local open = not settings.Visible
		settings.Visible = open
		settings.Size = open and UDim2.new(1, 0, 0, 160) or UDim2.new(1, 0, 0, 0)
	end)
end

------------------------------------------------------------------------
-- Build tabs
-- Tab names closer to / hubs
local TAB_DEFS = {
	-- core
	{ id = "home", icon = "01", label = "Home" },
	{ id = "combat", icon = "02", label = "Combat" },
	{ id = "player", icon = "03", label = "Player" },
	{ id = "grab", icon = "04", label = "Grab" },
	{ id = "auras", icon = "05", label = "Auras" },
	{ id = "server", icon = "06", label = "Server" },
	{ id = "loop", icon = "07", label = "Loops" },
	-- self
	{ id = "anti", icon = "08", label = "Protect" },
	{ id = "move", icon = "09", label = "Movement" },
	{ id = "visuals", icon = "10", label = "Visuals" },
-- world / toys
	{ id = "toys", icon = "11", label = "Toys" },
	{ id = "explosions", icon = "12", label = "Explosions" },
	{ id = "world", icon = "13", label = "World" },
	{ id = "blobman", icon = "14", label = "Blobman" },
	{ id = "auto", icon = "15", label = "Auto" },
	{ id = "console", icon = "16", label = "Misc" },
	{ id = "trans", icon = "16", label = "Trans" },
	{ id = "sounds", icon = "17", label = "Sounds" },
	{ id = "fun", icon = "18", label = "Fun" },
	{ id = "settings", icon = "19", label = "Config" },
}

local _TAB_BUILDERS = {}
_TAB_BUILDERS["home"] = function(sc, n)
		section(sc, "WELCOME", n())
		local hero = Instance.new("Frame")
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
			notify(HUB_NAME, ok and "Remotes linked" or "Still loading remotes…", 2)
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
		st.Text = " Build: " .. BUILD .. "\n Place: " .. tostring(game.PlaceId) .. "\n Key: kingvoidz"
		st.Parent = sc
		corner(st, 8)
		pad(st, 8, 8, 8, 8)
		S.homeStatus = st
end
_TAB_BUILDERS["combat"] = function(sc, n)
		section(sc, "HIT ONE PERSON", n())
		makeSlider(sc, { order = n(), title = "Throw Strength", min = 400, max = 20000, default = 8000, step = 100, stateKey = "flingPower" })
		makeDropdown(sc, {
			order = n(),
			title = "How To Kick",
			options = KICK_TYPES,
			default = S.kickType or "Sky Anchor",
			callback = function(v) S.kickType = v end,
			tip = "Sky Anchor / Float Pin ownership kicks",
		})
		if not S.kickType then S.kickType = "Sky Anchor" end
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
section(sc, "HOUSE / PLOT", n())
	if S.toggles.plotAmbush == nil then S.toggles.plotAmbush = true end
	if S.toggles.plotPullTry == nil then S.toggles.plotPullTry = true end
	makeToggle(sc, {
			order = n(), id = "plotAmbush", title = "Ambush On Plot Exit",
			tip = "If they are in a house: alert you, wait, then auto-grab + attack when they walk out",
			desc = "Default ON · kills, flings, loops, auras",
			callback = function(on)
				S.toggles.plotAmbush = on
				notify(HUB_NAME, "Plot ambush " .. (on and "ON" or "OFF"), 1.5)
			end,
		})
		makeToggle(sc, {
			order = n(), id = "plotPullTry", title = "Try Pull From House",
			tip = "Best-effort CreateGrabLine / extend while still in plot (often fails — exit ambush is reliable)",
			desc = "Default ON · FTAP usually blocks full ownership inside plots",
			callback = function(on)
				S.toggles.plotPullTry = on
				notify(HUB_NAME, "House pull try " .. (on and "ON" or "OFF"), 1.5)
			end,
		})
		makeButton(sc, {
			order = n(), title = "Grab Selected On Exit",
			tip = "Queue selected · auto-grab the frame they leave their house (uses blobman if in plot)",
			callback = function()
				local p = combatTarget()
				if not p then notify(HUB_NAME, "Select a player", 1.5); return end
				if isInSafePlot(p) then
					plotWatch[p.UserId] = { kind = "grab", quiet = false }
					notify(HUB_NAME, playerLabel(p) .. " in house · blob grab on exit", 2)
					if S.toggles.plotPullTry then task.spawn(tryPullFromPlot, p) end
					task.delay(3, function() if plotWatch[p.UserId] then blobGrabSingle(p) end end)
				else
					task.spawn(function() forceGrabOnExit(p) end)
					notify(HUB_NAME, "Grabbed " .. playerLabel(p) .. " (not in house)", 1.5)
				end
			end,
		})
		section(sc, "ACTIONS (selected player)", n())
		makeButton(sc, {
			order = n(), title = "TP To Them", tip = "Teleport to the selected player",
			callback = function()
				runOnTarget("TP", function(p)
					local r = rootOf(p)
					if r then teleportSelf(CFrame.new(r.Position + Vector3.new(0, 0, -5))) end
				end)
			end,
		})
		makeButton(sc, {
			order = n(), title = "Throw Them", danger = true, tip = "Fling selected (map-wide visit SNO)",
			callback = function()
				runOnTarget("Throw", function(p) flingPlayer(p, S.flingPower, false, true) end)
			end,
		})
		makeButton(sc, {
			order = n(), title = "Kick Them", danger = true, tip = "Kick selected with kick type",
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
			order = n(), title = "Bring Them Here", tip = "Pull selected to you",
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
			order = n(), title = "Void Them", danger = true, tip = "Slam selected into void",
			callback = function()
				runOnTarget("Void", function(p) voidPlayer(p, false) end)
			end,
		})
		makeButton(sc, { order = n(), title = "Burn Them", danger = true, tip = "Apply fire via status toy", callback = function()
			runOnTarget("Burn", function(p) applyStatusToPlayer("fire", p) end)
		end })
		makeButton(sc, { order = n(), title = "Poison Them", danger = true, tip = "Apply poison via hurt parts", callback = function()
			runOnTarget("Poison", function(p) local r = rootOf(p); if r then applyMapPoison(r) end end)
		end })
		makeButton(sc, { order = n(), title = "Freeze Them", tip = "Set WalkSpeed + JumpPower to 0", callback = function()
			runOnTarget("Freeze", function(p)
				local h = p.Character and p.Character:FindFirstChildOfClass("Humanoid")
				if h then h.WalkSpeed = 0; h.JumpPower = 0; h.JumpHeight = 0 end
			end)
		end })
		makeButton(sc, { order = n(), title = "Unfreeze Them", tip = "Restore WalkSpeed 16 + JumpPower 50", callback = function()
			runOnTarget("Unfreeze", function(p)
				local h = p.Character and p.Character:FindFirstChildOfClass("Humanoid")
				if h then h.WalkSpeed = 16; h.JumpPower = 50; h.JumpHeight = 7.2 end
			end)
		end })
makeButton(sc, { order = n(), title = "Massless Grab", tip = "Make grabbed part massless for easier flinging", callback = function()
			runOnTarget("Massless", function(p)
				local r = rootOf(p)
				if r then pcall(function() r.Massless = true end) end
			end)
		end })

		section(sc, "GRAB EFFECTS", n())
		makeToggle(sc, { order = n(), id = "grabRadiation", title = "Radiation Grab",
			tip = "OuterUFO follows target · radiation damage over time",
			callback = function(on)
				S.toggles.grabRadiation = on
				stopLoop("grabRadiation")
				if on then startLoop("grabRadiation", 0.1, function()
					local p = S.selected or combatTarget()
					if not p then return end
					local r = rootOf(p)
					if not r then return end
					local outer = workspace:FindFirstChild("OuterUFO")
					if outer then
						outer.Position = r.Position
						outer.Anchored = true
					end
				end) end
			end,
		})
		makeToggle(sc, { order = n(), id = "grabBurn", title = "Burn Grab",
			tip = "Fire trail on grabbed target · continuous burn damage",
			callback = function(on)
				S.toggles.grabBurn = on
				stopLoop("grabBurn")
				if on then startLoop("grabBurn", 0.2, function()
					local p = S.selected or combatTarget()
					if not p then return end
					local body = p.Character and p.Character:FindFirstChild("HumanoidRootPart")
					if not body then return end
					pcall(function()
						local fire = Instance.new("Fire")
						fire.Size = 8
						fire.Heat = 25
						fire.Color = Color3.fromRGB(255, 100, 0)
						fire.SecondaryColor = Color3.fromRGB(255, 0, 0)
						fire.Parent = body
					end)
				end) end
			end,
		})
		makeToggle(sc, { order = n(), id = "grabPoison", title = "Poison Grab",
			tip = "PoisonHurtPart follows target head · poison damage over time",
			callback = function(on)
				S.toggles.grabPoison = on
				stopLoop("grabPoison")
				if on then startLoop("grabPoison", 0.15, function()
					local p = S.selected or combatTarget()
					if not p then return end
					local head = p.Character and p.Character:FindFirstChild("Head")
					if not head then return end
					local list = workspace:GetDescendants()
					local hurts = {}
					for _, d in ipairs(list) do
						if d.Name == "PoisonHurtPart" and d:IsA("BasePart") then
							hurts[#hurts + 1] = d
						end
					end
					for _, hurt in ipairs(hurts) do
						hurt.CFrame = head.CFrame
					end
				end) end
			end,
		})
		makeToggle(sc, { order = n(), id = "grabDeath", title = "Death Grab",
			tip = "Force-kill grabbed target on cycle break",
			callback = function(on)
				S.toggles.grabDeath = on
				stopLoop("grabDeath")
				if on then startLoop("grabDeath", 0.5, function()
					local p = S.selected or combatTarget()
					if not p then return end
					local h = p.Character and p.Character:FindFirstChildOfClass("Humanoid")
					if h and h.Health > 0 then
						h:ChangeState(Enum.HumanoidStateType.Dead)
					end
				end) end
			end,
		})
		makeToggle(sc, { order = n(), id = "grabNoclip", title = "Noclip Grab",
			tip = "Disable collisions on grabbed target",
			callback = function(on)
				S.toggles.grabNoclip = on
				stopLoop("grabNoclip")
				if on then startLoop("grabNoclip", 0.3, function()
					local p = S.selected or combatTarget()
					if not p then return end
					pcall(function()
						for _, part in ipairs(p.Character:GetDescendants()) do
							if part:IsA("BasePart") then
								part.CanCollide = false
							end
						end
					end)
				end) end
			end,
		})
		makeToggle(sc, { order = n(), id = "grabPerspective", title = "Perspective Grab",
			tip = "Shift grabbed target camera · disorientation effect",
			callback = function(on)
				S.toggles.grabPerspective = on
				stopLoop("grabPerspective")
				if on then startLoop("grabPerspective", 0.2, function()
					local p = S.selected or combatTarget()
					if not p then return end
					local r = rootOf(p)
					if r then r.CFrame = r.CFrame * CFrame.Angles(0, math.rad(180), 0) end
				end) end
			end,
		})

		section(sc, "PLOT EXTRACTION", n())
		makeToggle(sc, { order = n(), id = "plotExtract", title = "Extract from Plot",
			tip = "Knock players out of safe plots with high force",
			callback = function(on)
				S.toggles.plotExtract = on
				stopLoop("plotExtract")
				if on then startLoop("plotExtract", 0.8, function()
					for _, p in ipairs(Players:GetPlayers()) do
						if validP(p) then
							local flag = p:FindFirstChild("InPlot")
							if flag and flag:IsA("BoolValue") and flag.Value then
								flingPlayer(p, 15000, true)
							end
						end
					end
				end) end
			end,
		})

		section(sc, "FREEZE CAM", n())
		makeToggle(sc, { order = n(), id = "freezeCam", title = "Freeze Camera",
			tip = "Freeze game camera at current position · unfreeze toggles off",
			callback = function(on)
				S.toggles.freezeCam = on
				if on then freezeCam(workspace.CurrentCamera.CFrame)
				else unfreezeCam() end
			end,
		})

		section(sc, "AIM", n())
		makeToggle(sc, {
			order = n(),
			id = "silentAim",
			title = "Silent Aim",
			tip = "Raycasts redirect to nearest player (screen-center FOV)",
			callback = function(on)
				setSilentAim(on)
			end,
		})
		makeToggle(sc, {
			order = n(),
			id = "fovCircle",
			title = "FOV Circle",
			tip = "Show FOV circle on screen center",
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
_TAB_BUILDERS["auras"] = function(sc, n)
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
			order = n(), id = "auraMapWide", title = "Extended Range (Objects)",
			tip = "ON = wider range for object auras. Player auras always SNO range.",
			desc = "SNO range ~30 studs for players always",
			callback = function(on)
				S.toggles.auraMapWide = on
				notify(HUB_NAME, "Aura range " .. (on and "extended" or "nearby only"), 1.5)
			end,
		})
		makeSlider(sc, {
			order = n(),
			title = "Object Distance",
			min = 10,
			max = 2000,
			default = S.auraRange or 50,
			stateKey = "auraRange",
			callback = function(v)
				S.auraRange = v
				for _, cfg in pairs(S.auraCfg) do
					if not cfg._customRange then cfg.range = v end
				end
			end,
		})
		makeSlider(sc, {
			order = n(),
			title = "Aura Power / Fling Strength",
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
			order = n(), title = "Telekinesis Shape",
			options = { "Tornado", "Blackhole" },
			default = S.tkShape or "Tornado",
			callback = function(v)
				S.tkShape = v
				notify(HUB_NAME, "TK shape → " .. v, 1.2)
			end,
		})
		section(sc, "AURAS (map-wide · ⚙ customize)", n())
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

		section(sc, "LAG / DESTROY SERVER", n())
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
			order = n(), title = "Lag Intensity", min = 1, max = 500, default = 150, step = 1,
			stateKey = "lagIntensity",
			tip = "Higher = more remote spam per wave (can kick you)",
		})
		makeToggle(sc, {
			order = n(), id = "lagServer", title = "Lag Server",
			tip = "Spam CreateGrabLine + SetNetworkOwner on whole server",
			callback = function(on)
				if on then setMassToggle("lagSrv", true, lagServerLoop) else stopMass("lagSrv") end
			end,
		})
		makeToggle(sc, {
			order = n(), id = "destroyServer", title = "Wreck Server (Blobman)",
			tip = "Spawn Blobman, ride it, grab every player on the server",
			callback = function(on)
				if on then setMassToggle("destroySrv", true, destroyServerLoop) else stopMass("destroySrv") end
			end,
		})
		makeButton(sc, {
			order = n(), title = "Stop Lag / Wreck", danger = true,
			tip = "Kill all lag and wreck loops instantly",
			callback = function()
				for _, name in ipairs({ "lagSrv", "softLag", "hardLag", "destroySrv", "destroyHyb", "blobSrv" }) do
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
			order = n(), title = "Cycle Delay (sec)", min = 0.1, max = 5, default = 0.2, step = 0.1,
			stateKey = "massCycleDelay",
			tip = "Seconds between each full pass across all players",
		})
		makeToggle(sc, {
			order = n(), id = "mass_kill", title = "Loop Kill All", danger = true,
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
			order = n(), id = "mass_kick", title = "Loop Kick All", danger = true,
			tip = "Loop: visit each player → SNO → skyVel + destroyGrabLine. Camera locks home.",
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
			order = n(), id = "mass_bring", title = "Loop Bring All",
			tip = "Loop: visit each player → SNO → pull to your position. Camera locks home.",
			callback = function(on)
				if on then setMassToggle("bring", true, massBringLoop) else stopMass("bring") end
			end,
		})
		makeToggle(sc, {
			order = n(), id = "mass_ragdoll", title = "Loop Ragdoll All", danger = true,
			tip = "Loop: spawns FoodBanana → touches BananaPeel to each player. Camera locks home.",
			callback = function(on)
				if on then setMassToggle("ragdoll", true, massRagdollLoop) else stopMass("ragdoll") end
			end,
		})
		makeToggle(sc, {
			order = n(), id = "mass_fire", title = "Loop Burn All", danger = true,
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
			order = n(), id = "mass_vomit", title = "Loop Vomit Everyone",
			tip = "Spawn FoodBanana → hold with target → use (triggers eat + vomit)",
			callback = function(on)
				if on then
					setMassToggle("vomit", true, function(keep)
						local home = hrp() and hrp().CFrame
						local overview = home and CFrame.lookAt(home.Position + Vector3.new(-15, 22, 8), home.Position) or CFrame.new(0, 50, 0)
						if home then freezeCam(overview) end
						notify(HUB_NAME, "Vomit Loop ON", 2)
						local bananaModel, bananaPrimary = nil, nil
						while keep() do
							for _, p in ipairs(allTargets()) do
								if not keep() then break end
								if validP(p) and p.Character then
									local r = rootOf(p)
									if r then
										pcall(function()
											-- blitzbr pattern: ensure FoodBanana owned
											if not bananaModel or not bananaModel.Parent then
												bananaModel, bananaPrimary = ensureToy("FoodBanana")
											end
											if not bananaModel or not bananaPrimary then return end
											-- find BananaPeel with TouchTransmitter (blitzbr ragdoll/vomit part)
											local peel = nil
											for _, d in ipairs(bananaModel:GetDescendants()) do
												if d.Name == "BananaPeel" and d:FindFirstChildOfClass("TouchTransmitter") then
													peel = d
													break
												end
											end
											-- find HoldPart for eating
											local holdPart = bananaModel:FindFirstChild("HoldPart", true)
											local holdRF = holdPart and holdPart:FindFirstChild("HoldItemRemoteFunction")
											local rigid = holdPart and holdPart:FindFirstChild("RigidConstraint")
											local ediblePart = bananaModel:FindFirstChild("EdiblePart", true)
											-- blitzbr pattern: make model big + invisible for touch hit
											if peel then
												peel.Size = Vector3.new(2, 2, 2)
												peel.Transparency = 1
												peel.CanCollide = false
											end
											-- disable AlignOrientation (blitzbr)
											local ao = bananaPrimary:FindFirstChildOfClass("AlignOrientation")
											if ao then ao.Enabled = false end
											-- park model high with BodyPosition (blitzbr pattern)
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
											-- set all parts CanCollide false (blitzbr SetModelProperties)
											for _, d in ipairs(bananaModel:GetDescendants()) do
												if d:IsA("BasePart") then d.CanCollide = false end
											end
											-- hold with target's character
											local alreadyHeld = rigid and rigid:FindFirstChild("Attachment1")
											if not alreadyHeld and holdRF then
												pcall(function() holdRF:InvokeServer(bananaModel, p.Character) end)
												task.wait(0.2)
											end
											-- blitzbr pattern: touch BananaPeel to target for vomit trigger
											if peel and r then
												sno(peel, r.Position)
												peel.Position = r.Position
												task.wait()
												peel.Position = bananaPrimary.Position
											end
											-- also fire Use if eating sound not playing
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
						notify(HUB_NAME, "Vomit Loop OFF", 1.5)
					end)
				else
					stopMass("vomit")
				end
			end,
		})
		makeButton(sc, {
			order = n(), title = "Stop All Server", danger = true,
			tip = "Kill every server-wide loop at once",
			callback = function()
				for _, name in ipairs({ "lagSrv", "softLag", "hardLag", "destroySrv", "destroyHyb", "blobSrv", "kill", "fling", "kick", "bring", "ragdoll", "fire", "banana", "paint", "vomit" }) do
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
				notify(HUB_NAME, "All server loops stopped", 1.5)
			end,
		})
end
_TAB_BUILDERS["grab"] = function(sc, n)
		section(sc, "SCROLL DISTANCE", n())
		makeToggle(sc, {
			order = n(),
			id = "lineExtend",
			title = "Scroll Distance",
			tip = "How far you can grab + hold. Scroll wheel while holding to stretch.",
			desc = "Separate from Massless Grab below",
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
			title = "Wheel Step",
			min = 1,
			max = 10,
			default = S.scrollStep or 2,
			callback = function(v) S.scrollStep = v end,
		})
		section(sc, "GRAB LINE", n())
		makeToggle(sc, {
			order = n(), id = "invisLine", title = "Invisible Line",
			tip = "Empty CreateGrabLine on grab to hide the line. Off if Crazy Line is on.",
			callback = function(on)
				setInvisibleLine(on)
				if on then installGrabWatch() end
			end,
		})
		makeToggle(sc, {
			order = n(), id = "crazyLine", title = "Crazy Line (Soft Lag)",
			tip = "Spam CreateGrabLine on every player torso (soft lag). Disables Invisible Line.",
			callback = function(on)
				setCrazyLine(on)
			end,
		})
		section(sc, "WHEN YOU LET GO", n())
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
			order = n(), id = "grabFlingOn", title = "Throw When Let Go",
			tip = "Pre-arms BodyVelocity while you hold · fires on release along camera",
			desc = "Grab → release to yeet · works on players + objects",
			callback = function(on)
				S.grabFling = on
				S.toggles.grabFlingOn = on
				installGrabWatch()
				notify(HUB_NAME, "Throw When Let Go " .. (on and "ON" or "OFF"), 1)
			end,
		})
		makeSlider(sc, {
			order = n(), title = "Throw Strength", min = 0, max = 500, default = 80, stateKey = "grabFlingPower",
		})
		makeToggle(sc, {
			order = n(), id = "grabSpinOn", title = "Spin When Let Go",
			tip = "Spin what you release",
			callback = function(on) S.grabSpin = on; if on then installGrabWatch() end end,
		})
		makeToggle(sc, {
			order = n(), id = "spinWhileHold", title = "Spin While Holding",
			tip = "Spin object while you hold it",
			callback = function(on) if on then installGrabWatch() end end,
		})
		makeSlider(sc, {
			order = n(), title = "Spin Speed", min = 1, max = 500, default = 80, stateKey = "grabSpinSpeed",
		})
		makeToggle(sc, {
			order = n(), id = "grabGravOn", title = "Launch Up When Let Go",
			tip = "Send it upward on release",
			callback = function(on) S.grabGravity = on; if on then installGrabWatch() end end,
		})
		makeSlider(sc, {
			order = n(), title = "Gravity Force", min = 0, max = 20000, default = 5000, step = 100, stateKey = "grabGravityForce",
		})
		makeToggle(sc, {
			order = n(), id = "grabZeroGOn", title = "Zero-G While Holding",
			tip = "Float what you hold (BodyForce up)",
			callback = function(on) S.grabZeroG = on; if on then installGrabWatch() end end,
		})
		makeSlider(sc, {
			order = n(), title = "Zero-G Force", min = 0, max = 100000, default = 50000, step = 1000, stateKey = "grabZeroGForce",
		})
		makeToggle(sc, {
			order = n(), id = "grabFreezeOn", title = "Freeze on Release",
			tip = "Lock released parts/players in place (BodyPosition)",
			callback = function(on) S.grabFreeze = on; if on then installGrabWatch() end end,
		})
		makeToggle(sc, {
			order = n(), id = "grabFollowOn", title = "Item Follow Feet",
			tip = "Released items follow under your feet",
			callback = function(on) S.grabFollow = on; if on then installGrabWatch() end end,
		})
		makeSlider(sc, {
			order = n(), title = "Follow Speed", min = 0, max = 100, default = 50, stateKey = "grabFollowSpeed",
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
		order = n(), id = "superStr", title = "Super Throw On Release",
		tip = "Launch grabbed object on release along camera",
		callback = function(on)
			S.superStrength = on
			S.toggles.superStr = on
			if on then installGrabWatch() end
		end,
	})
	makeSlider(sc, {
		order = n(), title = "Super Throw Strength", min = 400, max = 20000, default = 4000, step = 100,
		stateKey = "superStrengthPower",
	})
	makeToggle(sc, {
		order = n(), id = "superStrHold", title = "Super Strength While Holding",
		tip = "Applies constant force to held target while you hold (like blitzbr) · great for dragging players",
		callback = function(on)
			S.superStrengthHold = on
			S.toggles.superStrHold = on
			if on then installGrabWatch() end
		end,
	})
	makeSlider(sc, {
		order = n(), title = "Hold Force", min = 500, max = 20000, default = 5000, step = 100,
		stateKey = "superStrengthHoldPower",
	})
	makeToggle(sc, {
			order = n(), id = "masslessGrab", title = "Massless Grab",
			tip = "Massless Grab: max AlignPosition / AlignOrientation force while holding (not scroll distance)",
			desc = "Hold feels glued · does not change how far you can grab",
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
			order = n(), id = "killGrab", title = "Kill Who You Hold",
			tip = "Death Grab: force Dead state on held player",
			callback = function(on) S.killGrab = on; S.toggles.killGrab = on; if on then installGrabWatch() end end,
		})
		makeToggle(sc, {
			order = n(), id = "ragdollGrab", title = "Ragdoll Grab",
			tip = "Instant ragdoll while holding a player",
			callback = function(on) S.ragdollGrab = on; S.toggles.ragdollGrab = on; if on then installGrabWatch() end end,
		})
		makeToggle(sc, {
			order = n(), id = "poisonGrab", title = "Poison Grab",
			tip = "PoisonHurtPart on head while holding (map poison)",
			callback = function(on) S.poisonGrab = on; S.toggles.poisonGrab = on; if on then installGrabWatch() end end,
		})
		makeToggle(sc, {
			order = n(), id = "burnGrab", title = "Burn Grab",
			tip = "Campfire fire touch while holding",
			callback = function(on) S.burnGrab = on; S.toggles.burnGrab = on; if on then installGrabWatch() end end,
		})
		makeToggle(sc, {
			order = n(), id = "anchorGrab", title = "Freeze What You Hold",
			tip = "keep held part Anchored while you hold",
			callback = function(on) S.anchorGrab = on; S.toggles.anchorGrab = on; if on then installGrabWatch() end end,
		})
		makeToggle(sc, {
			order = n(), id = "uncollisionGrab", title = "No Collision Hold",
			tip = "name for Noclip Grab",
			callback = function(on)
				S.noclipGrab = on
				S.toggles.noclipGrab = on
				S.toggles.uncollisionGrab = on
				if on then installGrabWatch() end
			end,
		})
		makeSlider(sc, {
			order = n(), title = "Strength Multiplier", min = 1, max = 10, default = 1, step = 0.5,
			stateKey = "strengthMult",
			tip = "strength multiplier for fling / super strength / revenge",
		})
		section(sc, "SILENT AIM (GRAB)", n())
		makeToggle(sc, {
			order = n(), id = "palletSilentAim", title = "Pallet Silent Aim",
			tip = "Aim pallet throws at nearest player instead of camera direction",
			callback = function(on) S.toggles.palletSilentAim = on end,
		})
		makeToggle(sc, {
			order = n(), id = "shurikenSilentAim", title = "Shuriken Silent Aim",
			tip = "Aim shuriken/kunai throws at nearest player instead of camera direction",
			callback = function(on) S.toggles.shurikenSilentAim = on end,
		})
		section(sc, "NEARBY STUFF", n())
		makeToggle(sc, {
			order = n(), id = "flingObjects", title = "Throw Nearby Objects",
			tip = "SNO + fling non-player parts in aura range",
			callback = function(on)
				if on then setMassToggle("flingObj", true, massFlingObjectsLoop) else stopMass("flingObj") end
			end,
		})
		makeButton(sc, {
			order = n(), title = "Float Nearby Objects (30s)",
			tip = "BodyForce up on nearby objects for 30 seconds",
			callback = function() zeroGNearbyObjects(30) end,
		})
		makeButton(sc, {
			order = n(), title = "Balloon On Selected",
			tip = "BombBalloon over selected player's head",
			callback = function() balloonTroll(S.selected) end,
		})
		makeButton(sc, {
			order = n(), title = "Balloon On Everyone",
			tip = "Throw balloons over every player",
			callback = function() balloonTroll(nil) end,
		})
		makeToggle(sc, { order = n(), id = "autoGrabNearest", title = "Auto-Grab Closest", tip = "CreateGrabLine + SNO nearest", callback = function(on)
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
		makeButton(sc, {
			order = n(), title = "Anchor All Nearby",
			tip = "Anchor all physics parts within range for 15 seconds (Blitzbr-style)",
			callback = function() anchorAllNearby(15) end,
		})
		makeToggle(sc, {
			order = n(), id = "anchorMode", title = "Anchor Loop",
			tip = "Auto-anchor nearby parts + players' parts when they respawn",
			callback = function(on)
				S.toggles.anchorMode = on
				if on then
					startLoop("anchorLoop", 2, autoAnchorLoop)
					notify(HUB_NAME, "Anchor Loop ON · anchoring nearby parts", 2)
				else
					stopLoop("anchorLoop")
					notify(HUB_NAME, "Anchor Loop OFF", 1.5)
				end
			end,
		})
end
_TAB_BUILDERS["anti"] = function(sc, n)
		section(sc, "PROTECT ME", n())
		S.toggles.antiKick = (getgenv and getgenv().VOIDZ_ANTIKICK and getgenv().VOIDZ_ANTIKICK.enabled) == true
		makeToggle(sc, {
			order = n(), id = "antiKick", title = "Rejoin If Kicked",
			tip = "Detect kick early → self-kick + rejoin BEFORE game AC finishes",
			desc = "Console + kick UI + Player:Kick · preemptive rejoin",
			callback = function(on)
				setAntiKick(on)
			end,
		})
		makeToggle(sc, {
			order = n(), id = "antiGucci", title = "Gucci Anti (Grab Only)",
			tip = "Hard anti-grab: IsHeld + PartOwner + GrabParts · Struggle spam · DestroyGrabLine. Does NOT unsit Blobman/train.",
			desc = "ON → 40ms break loop · instant on grab · recommended",
			callback = function(on)
				S.toggles.antiGucci = on
				S.toggles.antiGrab = on -- keep plain anti-grab armed with Gucci
				S.antiWanted = S.antiWanted or {}
				S.antiWanted.antiGucci = on
				S.antiWanted.antiGrab = on
				installAntis()
				stopLoop("antiGrab")
				if on then
					startLoop("antiGrab", 0.05, antiGrabTick)
					gucciBreakGrabNow()
					if doAntiGrabHard then doAntiGrabHard() end
					gucciAntiTick()
					notify(HUB_NAME, "Gucci Anti ON · grab break only (no blob unsit)", 1.8)
				else
					local r = hrp()
					if r then r.Anchored = false end
					stopBlitzbrAntiGrab()
					notify(HUB_NAME, "Gucci Anti OFF", 1.2)
				end
			end,
		})
		makeButton(sc, {
			order = n(),
			title = "Test Gucci Break Now",
			tip = "Force one full anti-grab burst (Struggle + DestroyGrabLine)",
			callback = function()
				installAntis()
				gucciBreakGrabNow()
				if doAntiGrabHard then doAntiGrabHard() end
				gucciAntiTick()
				notify(HUB_NAME, "Gucci break fired", 1.2)
			end,
		})
		makeToggle(sc, {
			order = n(), id = "autoCounter", title = "Auto Attacker",
			tip = "When someone grabs you or you're low HP: instantly attack them (mode below)",
			callback = function(on)
				S.autoCounter = on
				S.toggles.autoCounter = on
				S.revengeGrab = on
				S.toggles.revengeGrab = on
				S.antiWanted = S.antiWanted or {}
				if on then
					installAntis()
					-- heartbeat loop: actively check if grabbed → fling grabber
					stopLoop("autoFling")
					startLoop("autoFling", 0.08, function()
						if not S.autoCounter then return end
						if not isLocalVictimGrabbed() then return end
						-- find grabber from PartOwner on any body part
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
						-- fallback: find grabber from GrabParts welds
						for _, child in ipairs(workspace:GetChildren()) do
							if child.Name == "GrabParts" and grabPartsIsAttackingUs(child, c) then
								for _, d in ipairs(child:GetDescendants()) do
									if d:IsA("WeldConstraint") or d:IsA("Weld") then
										for _, side in ipairs({ d.Part0, d.Part1 }) do
											if side and side:IsA("BasePart") and not side:IsDescendantOf(c) then
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
					notify(HUB_NAME, "Auto Attacker ON · " .. (S.counterMode or "Repulsion"), 2)
				else
					stopLoop("autoFling")
					S.antiWanted.antiGrab = false
				end
			end,
		})
		makeDropdown(sc, {
			order = n(), title = "Fling Mode",
			options = { "Repulsion", "Freeze", "Death", "Kick" },
			default = S.counterMode or "Repulsion",
			callback = function(v)
				S.counterMode = v
				notify(HUB_NAME, "Fling → " .. v, 1.2)
			end,
		})
		makeSlider(sc, {
			order = n(), title = "Attack Force", min = 2000, max = 30000, default = 12000, step = 500,
			stateKey = "revengeForce",
			tip = "Force multiplier for auto attacker",
		})
		makeToggle(sc, { order = n(), id = "antiFling", title = "Anti-Fling", tip = "Zero extreme velocity", callback = function(on)
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
			tip = "Strip paint/spray effects",
			callback = function(on)
				S.toggles.antiPaint = on
				stopLoop("antiPaint")
				if on then startLoop("antiPaint", 0.15, antiPaintTick) end
			end,
		})
		makeToggle(sc, { order = n(), id = "antiBanana", title = "Anti-Banana / Slip", tip = "Remove banana/slip + unsit", callback = function(on)
			stopLoop("antiBanana")
			if on then startLoop("antiBanana", 0.15, antiBananaTick) end
		end })
		makeToggle(sc, { order = n(), id = "antiVoid", title = "Anti-Void", tip = "Rescue if you fall too low", callback = function(on)
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
				if on then startLoop("antiBlob", 0.15, antiBlobmanTick) end
			end,
		})
		makeToggle(sc, {
			order = n(), id = "antiLag", title = "Anti-Lag ( beam off)",
			tip = "Disables CharacterAndBeamMove LocalScript (can help FPS/lag)",
			callback = function(on) setAntiLag(on) end,
		})
		makeToggle(sc, { order = n(), id = "antiSit", title = "Anti-Sit / Seat Trap", tip = "Force unsit", callback = function(on)
			stopLoop("antiSit")
			if on then startLoop("antiSit", 0.1, function() local h=hum(); if h then h.Sit=false end end) end
		end })
		makeToggle(sc, { order = n(), id = "antiRagdoll", title = "Anti-Ragdoll", tip = "Disable ragdoll states", callback = function(on)
			stopLoop("antiRag")
			if on then startLoop("antiRag", 0.1, function()
				local h = hum(); if not h then return end
				h:SetStateEnabled(Enum.HumanoidStateType.Ragdoll, false)
				h:SetStateEnabled(Enum.HumanoidStateType.FallingDown, false)
				h.PlatformStand = false
			end) end
		end })
		makeToggle(sc, { order = n(), id = "god", title = "Client God Heal", tip = "Keep health max", callback = function(on)
			stopLoop("god")
			if on then startLoop("god", 0.15, function() local h=hum(); if h then h.Health=h.MaxHealth end end) end
		end })
section(sc, "HOUSE BYPASS", n())
	if S.toggles.plotBypass == nil then S.toggles.plotBypass = false end
	makeToggle(sc, {
			order = n(), id = "plotBypass", title = "Bypass House Protection",
			tip = "Actions work on players even inside houses",
			callback = function(on)
				plotBypass = on
				S.toggles.plotBypass = on
				notify(HUB_NAME, "House bypass " .. (on and "ON" or "OFF"), 1.2)
			end,
		})

	section(sc, "ANTI-GRAB WHITELIST", n())
	local agwlLabel = Instance.new("TextLabel")
	agwlLabel.LayoutOrder = n()
	agwlLabel.Size = UDim2.new(1, -6, 0, 16)
	agwlLabel.BackgroundTransparency = 1
	agwlLabel.Font = Enum.Font.GothamBold
	agwlLabel.TextSize = 12
	agwlLabel.TextColor3 = C.muted
	agwlLabel.TextXAlignment = Enum.TextXAlignment.Left
	agwlLabel.Text = "Anti-Grab Whitelisted: (none)"
	agwlLabel.Parent = sc

	local function refreshAntiGrabWL()
		local names = {}
		for name in pairs(S.antiGrabWhitelist) do
			if tonumber(name) == nil then -- only names, not UserIds
				names[#names + 1] = name
			end
		end
		table.sort(names)
		agwlLabel.Text = #names > 0 and ("Anti-Grab Whitelisted: " .. table.concat(names, ", ")) or "Anti-Grab Whitelisted: (none)"
	end

	-- Searchable player dropdown for whitelist
	local agwlPlayerDropdown = nil
	makePlayerSearchList(sc, {
		label = "Select Player for Whitelist",
		clickFn = function(p)
			if not p then return end
			S.antiGrabWhitelist[p.UserId] = true
			S.antiGrabWhitelist[p.Name] = true
			notify(HUB_NAME, "Anti-grab WL: " .. playerLabel(p), 1.5)
			refreshAntiGrabWL()
		end,
	}, n)

	makeButton(sc, {
		order = n(), title = "Whitelist Selected (Allow Grab)",
		tip = "Add selected player to anti-grab whitelist · they can grab you even with anti-grab ON",
		callback = function()
			local p = S.selected or combatTarget()
			if not p then notify(HUB_NAME, "Select a player", 1.5); return end
			S.antiGrabWhitelist[p.UserId] = true
			S.antiGrabWhitelist[p.Name] = true
			notify(HUB_NAME, "Anti-grab WL: " .. playerLabel(p), 1.5)
			refreshAntiGrabWL()
		end,
	})
	makeButton(sc, {
		order = n(), title = "Unwhitelist Selected",
		callback = function()
			local p = S.selected or combatTarget()
			if not p then notify(HUB_NAME, "Select a player", 1.5); return end
			S.antiGrabWhitelist[p.UserId] = nil
			S.antiGrabWhitelist[p.Name] = nil
			notify(HUB_NAME, "Removed anti-grab WL: " .. playerLabel(p), 1.5)
			refreshAntiGrabWL()
		end,
	})
	makeButton(sc, {
		order = n(), title = "Clear Anti-Grab Whitelist",
		callback = function()
			S.antiGrabWhitelist = {}
			notify(HUB_NAME, "Anti-grab whitelist cleared", 1.5)
			refreshAntiGrabWL()
		end,
	})
	refreshAntiGrabWL()
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
			tip = "Keeps health at max",
			callback = function(on)
				stopLoop("god")
				if on then startLoop("god", 0.12, function()
					local h = hum(); if h then h.Health = h.MaxHealth end
				end) end
			end,
		})
		makeToggle(sc, {
			order = n(), id = "autoHeal", title = "Auto Heal",
			tip = "Gradually heals when below 50% health",
			callback = function(on)
				S.toggles.autoHeal = on
				stopLoop("autoHeal")
				if on then startLoop("autoHeal", 0.25, function()
					local h = hum()
					if h and h.Health < h.MaxHealth * 0.5 then
						h.Health = math.min(h.Health + h.MaxHealth * 0.08, h.MaxHealth)
					end
				end) end
			end,
		})
		makeToggle(sc, {
			order = n(), id = "noclip", title = "Noclip",
			tip = "CanCollide false on all body parts",
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
			tip = "Scale head to 2.5x size",
			callback = function(on)
				local h = char() and char():FindFirstChild("Head")
				if h then
					local s = on and 2.5 or 1
					h.Size = Vector3.new(2 * s, 1 * s, 1 * s)
				end
			end,
		})
		makeToggle(sc, {
			order = n(), id = "tinyHead", title = "Tiny Head",
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
			order = n(), id = "playerSpin", title = "Spin Self",
			tip = "Spin your character fast",
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
			tip = "BodyPosition hover above ground",
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
			order = n(), id = "antiDrown", title = "Anti-Drown",
			tip = "Detect water and TP to nearest house/land",
			callback = function(on)
				S.toggles.antiDrown = on
				stopLoop("antiDrown")
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
			tip = "JumpPower override (stacks with inf jump)",
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
		makeSlider(sc, { order = n(), title = "Jump Height", min = 50, max = 500, default = 200, stateKey = "superJumpPower" })
		makeToggle(sc, {
			order = n(), id = "superSpeed", title = "Super Speed",
			tip = "WalkSpeed override (stacks with inf jump)",
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
		section(sc, "PICK WHO · LOOP TARGET", n())
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
		local listLay = Instance.new("UIListLayout")
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
			-- count selected
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
					-- multi-select: always toggle into loopTargets
					toggleLoopTarget(p)
					S.loopTarget = p
					S.loopName = p and p.Name or nil
					refreshPlayerList()
					local total = 0
					for _ in pairs(S.loopTargets) do total += 1 end
					if total > 1 then
						notify(HUB_NAME, total .. " loop targets", 1.2)
					else
						notify(HUB_NAME, "Loop target → " .. lab, 1.2)
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
			order = n(), title = "Kick Type", options = KICK_TYPES, default = S.kickType or "Sky Anchor",
			callback = function(v) S.kickType = v; notify(HUB_NAME, "Kick type → " .. v, 1) end,
		})
		makeButton(sc, { order = n(), title = "Fling Selected", danger = true, tip = "SNO + velocity fling", callback = function()
			local targets = getLoopTargets()
			if #targets == 0 then notify(HUB_NAME, "Pick a player first", 1.2) return end
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
					if not ok then notify(HUB_NAME, "Kick err: " .. tostring(err):sub(1, 40), 2) end
				end)
			end
		end })
		makeButton(sc, { order = n(), title = "Kill Selected", danger = true, tip = "Sky + death state", callback = function()
			local targets = getLoopTargets()
			if #targets == 0 then notify(HUB_NAME, "Pick a player first", 1.2) return end
			for _, p in ipairs(targets) do
				task.spawn(function()
					local ok, err = pcall(killPlayer, p, false)
					if not ok then notify(HUB_NAME, "Kill err: " .. tostring(err):sub(1, 40), 2) end
				end)
			end
		end })
		makeButton(sc, { order = n(), title = "Bring Selected", tip = "TP grab pull to you", callback = function()
			local targets = getLoopTargets()
			if #targets == 0 then notify(HUB_NAME, "Pick a player first", 1.2) return end
			for _, p in ipairs(targets) do
				task.spawn(function()
					local ok, err = pcall(bringPlayer, p, nil, false)
					if not ok then notify(HUB_NAME, "Bring err: " .. tostring(err):sub(1, 40), 2) end
				end)
			end
		end })
		makeButton(sc, { order = n(), title = "Teleport To Selected", callback = function()
			local me, r = hrp(), S.selected and rootOf(S.selected)
			if me and r then
				me.CFrame = r.CFrame + Vector3.new(0, 3, 0)
				notify(HUB_NAME, "TP to " .. playerLabel(S.selected), 1)
			else
				notify(HUB_NAME, "No target", 1)
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
		makeToggle(sc, { order = n(), id = "wlFriends", title = "Whitelist Friends", tip = "Skip friends in auras/mass", callback = function(on)
			notify(HUB_NAME, "WL friends " .. (on and "ON" or "OFF"), 1)
		end })
		makeButton(sc, { order = n(), title = "Whitelist Selected", callback = function()
			if S.selected then S.whitelist[S.selected.Name] = true; notify(HUB_NAME, "WL " .. S.selected.Name, 1); if S._wlRefresh then pcall(S._wlRefresh) end end
		end })
		makeButton(sc, { order = n(), title = "Unwhitelist Selected", callback = function()
			if S.selected then S.whitelist[S.selected.Name] = nil; notify(HUB_NAME, "Un-WL", 1); if S._wlRefresh then pcall(S._wlRefresh) end end
		end })
		makeToggle(sc, { order = n(), id = "stalk", title = "Stalk Teleport", tip = "Loop TP behind selected", callback = function(on)
			stopLoop("stalk")
			notify(HUB_NAME, "Stalk " .. (on and "ON" or "OFF"), 1)
			if on then startLoop("stalk", 0.2, function()
				local me, r = hrp(), S.selected and rootOf(S.selected)
				if me and r then me.CFrame = r.CFrame * CFrame.new(0, 0, 4) end
			end) end
		end })

		section(sc, "LOOP ACTIONS", n())
		local loops = {
			{ id = "loopFling", title = "Keep Throwing", tip = "Annoying constant fling · map-wide", waitRespawn = true, fn = function(p)
				local r = rootOf(p); if not r then return end
				clearTargetMovers(p.Character)
				applyVel(r, S.flingPower or 600, 0.3)
			end },
			{ id = "loopKick", title = "Keep Kicking", tip = "Kick · map-wide", waitRespawn = true, fn = function(p) kickPlayer(p, S.kickType, true) end },
			{ id = "loopKill", title = "Keep Killing", tip = "Instant kill · map-wide", waitRespawn = true, fn = function(p)
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
			{ id = "loopRagdoll", title = "Keep Ragdolling", tip = "Spam ragdoll · map-wide", waitRespawn = true, fn = function(p) ragdoll(p, true) end },
			{ id = "loopBring", title = "Keep Bringing", tip = "Bring to you · map-wide", fn = function(p) bringPlayer(p, nil, true) end },
			{ id = "loopTp", title = "Loop Teleport To", tip = "Stay on them", fn = function(p) local me,r=hrp(),rootOf(p); if me and r then me.CFrame=r.CFrame+Vector3.new(0,3,0) end end },
			{ id = "loopSky", title = "Loop Sky Launch", tip = "Sky launch · map-wide", waitRespawn = true, fn = function(p) kickPlayer(p, "Sky", true) end },
			{ id = "loopVoid", title = "Loop Void", tip = "Void slam · map-wide", waitRespawn = true, fn = function(p) voidPlayer(p, true) end },
			{ id = "loopSpin", title = "Loop Spin", tip = "Spin them · map-wide", waitRespawn = true, fn = function(p) local r=rootOf(p); if r then snoPlayer(p); r.AssemblyAngularVelocity=Vector3.new(0,120,0) end end },
			{ id = "loopSNO", title = "Loop Network Own", tip = "SNO spam · map-wide", fn = function(p) snoPlayer(p) end },
			{ id = "loopGrab", title = "Loop Grab Line", tip = "CreateGrabLine spam · map-wide", fn = function(p) if FTAP.CreateGrabLine then local t=rootOf(p); pcall(function() FTAP.CreateGrabLine:FireServer(t,t.CFrame) end) end end },
			{ id = "loopHardFling", title = "Loop Hard Fling", tip = "Max fling · map-wide", waitRespawn = true, fn = function(p)
				local r = rootOf(p); if not r then return end
				clearTargetMovers(p.Character)
				applyVel(r, 20000, 0.1)
			end },
			{ id = "loopBlobKick", title = "Loop Blobman Kick", tip = "Blob kick · map-wide", waitRespawn = true, fn = function(p) kickPlayer(p, "Blobman", true) end },
			{ id = "loopGrabKick", title = "Loop Grab Kick", tip = "Grab kick · map-wide", waitRespawn = true, fn = function(p) kickPlayer(p, "GrabKick", true) end },
			{ id = "loopStackKick", title = "Loop Stack Kick", tip = "Stack kick · map-wide", waitRespawn = true, fn = function(p) kickPlayer(p, "StackKick", true) end },
			{ id = "loopSilentKick", title = "Loop Silent Kick", tip = "Silent kick · map-wide", waitRespawn = true, fn = function(p) kickPlayer(p, "Silent", true) end },
			{ id = "loopFire", title = "Loop Fire", tip = "Burn them · map-wide", waitRespawn = true, fn = function(p) firePlayerBlitz(p) end },
			{ id = "loopPoison", title = "Loop Poison", tip = "Poison · map-wide", fn = function(p) applyStatusToPlayer("poison", p) end },
			{ id = "loopBanana", title = "Loop Banana", tip = "Slip · map-wide", fn = function(p) applyStatusToPlayer("banana", p) end },
			{ id = "loopPaint", title = "Loop Paint", tip = "Paint · map-wide", fn = function(p) applyStatusToPlayer("paint", p) end },
			{ id = "loopBringFling", title = "Loop Bring+Fling", tip = "Bring then fling · map-wide", waitRespawn = true, fn = function(p)
				bringPlayer(p, nil, true)
				local r = rootOf(p); if not r then return end
				clearTargetMovers(p.Character)
				applyVel(r, S.flingPower or 600, 0.3)
			end },
			{ id = "loopLongBring", title = "Loop Long Reach Bring", tip = "Max reach + bring", fn = function(p)
				if S.toggles.lineExtend then applyLineExtendDistance(S.extendAmount or 80) end
				bringPlayer(p, nil, true)
			end },
			{ id = "loopSpamSNO", title = "Loop Spam SNO Parts", tip = "Own every part · map-wide", fn = function(p) for _,part in ipairs(p.Character:GetDescendants()) do if part:IsA("BasePart") then sno(part) end end end },
			{ id = "loopDestroyGrab", title = "Loop Destroy Their Grab", tip = "DestroyGrabLine · map-wide", fn = function(p) local r=rootOf(p); if r then destroyGrabOn(r) end end },
		}
		S.loopWait = S.loopWait or {} -- id -> { deadChar = Model?, home = CFrame }
		for _, L in ipairs(loops) do
			makeToggle(sc, {
				order = n(),
				id = L.id,
				title = L.title,
				tip = L.tip or L.title,
				callback = function(on)
					stopLoop(L.id)
					-- restore position when loop stops (use first available home)
					if not on then
						for k, w in pairs(S.loopWait) do
							if k:sub(1, #L.id + 1) == L.id .. "_" or k == L.id then
								if w and w.home then
									pcall(function() teleportSelf(w.home) end)
									break
								end
							end
						end
						-- clear all per-player wait states for this loop
						for k in pairs(S.loopWait) do
							if k:sub(1, #L.id + 1) == L.id .. "_" or k == L.id then
								S.loopWait[k] = nil
							end
						end
						notify(HUB_NAME, L.title .. " OFF", 1.2)
						return
					end
					notify(HUB_NAME, L.title .. " ON · map-wide", 1.2)
					-- save home position when loop starts
					local homeCF = hrp() and hrp().CFrame
					S.loopWait[L.id] = S.loopWait[L.id] or {}
					S.loopWait[L.id].home = homeCF
					local interval = L.waitRespawn and 0.2 or 0.18
				startLoop(L.id, interval, function()
					local targets = getLoopTargets()
					if #targets == 0 then
						-- try re-acquire single target
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

					-- house check
					if not plotBypass and isInSafePlot(p) then
						if not w._houseWarned or (os.clock() - w._houseWarned) > 5 then
							w._houseWarned = os.clock()
							notify(HUB_NAME, playerLabel(p) .. " is in a house — waiting", 2)
						end
						continue
					end

					-- wait for respawn (waitRespawn loops)
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

					-- TP to target
					visitForSNO(p, 15)

					-- act
					local charBefore = p.Character
					pcall(L.fn, p)

					-- TP back to saved home
					if w.home then pcall(function() teleportSelf(w.home) end) end

					-- if they died from this hit, wait for next life
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
					end -- for targets
					end)
				end
			})
		end
		makeToggle(sc, {
			order = n(), id = "antiSpectate", title = "Anti-Spectate",
			tip = "Hide your character from spectators · protect camera",
			callback = function(on) setAntiSpectate(on) end,
		})
		makeToggle(sc, {
			order = n(), id = "devJoinEffects", title = "Dev Join Effects",
			tip = "Flash neon + color when any player joins (troll)",
			callback = function(on) setDevJoinEffects(on) end,
		})
end
_TAB_BUILDERS["move"] = function(sc, n)
		section(sc, "MY MOVEMENT", n())
		makeToggle(sc, { order = n(), id = "speed", title = "WalkSpeed Override", tip = "Re-applies every frame (FTAP resets speed)", callback = function() end })
		makeSlider(sc, { order = n(), title = "WalkSpeed", min = 16, max = 300, default = 50, stateKey = "walkSpeed" })
		makeToggle(sc, { order = n(), id = "speedCFrame", title = "CFrame Speed Boost", tip = "Extra CFrame push like mult", callback = function() end })
		makeSlider(sc, { order = n(), title = "CFrame Mult", min = 1, max = 8, default = 2, stateKey = "speedMult" })
		makeToggle(sc, { order = n(), id = "fly", title = "Fly", tip = "BodyVelocity + BodyGyro fly", desc = "WASD · Space · Shift", callback = setFly })
		makeSlider(sc, { order = n(), title = "Fly Speed", min = 20, max = 400, default = 80, stateKey = "flySpeed" })
		makeToggle(sc, { order = n(), id = "noclip", title = "Noclip", tip = "CanCollide false every frame", callback = function() end })
		makeToggle(sc, {
			order = n(), id = "infjump", title = "Infinite Jump (/)",
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
			order = n(), id = "waterWalk", title = "Water Walk",
			tip = "Makes the whole water map solid so you walk on it (no float platform)",
			desc = "Solidifies water parts + terrain · restores when off",
			callback = function(on) setWaterWalk(on) end,
		})
		makeToggle(sc, { order = n(), id = "jump", title = "JumpPower Override", callback = function() end })
		makeSlider(sc, { order = n(), title = "Jump Power", min = 50, max = 500, default = 80, stateKey = "jumpPower" })
		makeButton(sc, { order = n(), title = "Reset Movement", callback = function()
			S.toggles.speed=false; S.toggles.fly=false; S.toggles.noclip=false; S.toggles.infjump=false; S.toggles.jump=false; S.toggles.speedCFrame=false
			setFly(false)
			local h = hum(); if h then h.WalkSpeed=16; h.JumpPower=50 end
		end })
		section(sc, "MAP TELEPORT", n())
		local MAP_POSITIONS = {
			{ name = "Green House", pos = Vector3.new(-352, 99, 354) },
			{ name = "Green Safe-House", pos = Vector3.new(-584, -6, 93) },
			{ name = "Chinese Safe-House", pos = Vector3.new(579, 124, -94) },
			{ name = "Farm House", pos = Vector3.new(-234, 83, -324) },
			{ name = "Spawn", pos = Vector3.new(4, -7, -3) },
			{ name = "Blue Safe-House", pos = Vector3.new(538, 96, -372) },
			{ name = "Secret Big Cave", pos = Vector3.new(17, -7, 539) },
			{ name = "Secret Train Cave", pos = Vector3.new(500, 62, -307) },
			{ name = "Mine Cave", pos = Vector3.new(-254, -7, 518) },
			{ name = "Witch Safe-House", pos = Vector3.new(296, -4, 494) },
			{ name = "Red Safe-House", pos = Vector3.new(-516, -6, -162) },
		}
		local mapNames = {}
		for _, mp in ipairs(MAP_POSITIONS) do mapNames[#mapNames + 1] = mp.name end
		S.selectedMap = S.selectedMap or mapNames[1]
		makeDropdown(sc, {
			order = n(), title = "Map Location", options = mapNames, default = S.selectedMap,
			tip = "Pick a map location to teleport to",
			callback = function(v) S.selectedMap = v end,
		})
		makeButton(sc, {
			order = n(), title = "Teleport to Map", tip = "Teleport to the selected map location",
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
			order = n(), title = "Teleport to Selected Player", tip = "Teleport to the player you selected in any search list",
			callback = function()
				local p = S.selected
				if not p or not validP(p) then notify(HUB_NAME, "No target — pick a player first", 1.5); return end
				local r = rootOf(p)
				if r then
					local me = hrp()
					if me then me.CFrame = r.CFrame * CFrame.new(0, 0, 5); notify(HUB_NAME, "Teleported to " .. playerLabel(p), 1.5) end
				end
			end,
		})
		makeToggle(sc, {
			order = n(), id = "loopTP", title = "Loop Teleport to Selected",
			tip = "Keeps teleporting to selected player every frame",
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
		section(sc, "TOY LIMIT", n())
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
		limNote.Text = "  Free = 100 toys · Gamepass = 200 · forms stop before the cap"
		limNote.Parent = sc
		corner(limNote, 8)
		pad(limNote, 6, 6, 6, 6)
		makeDropdown(sc, {
			order = n(),
			title = "Account type",
			options = { "Auto-detect", "No gamepass (100)", "Gamepass (200)" },
			default = (S.toyPassMode == "pass" and "Gamepass (200)")
				or (S.toyPassMode == "free" and "No gamepass (100)")
				or "Auto-detect",
			callback = function(v)
				if v:find("Gamepass", 1, true) then S.toyPassMode = "pass"
				elseif v:find("No gamepass", 1, true) then S.toyPassMode = "free"
				else S.toyPassMode = "auto" end
				notify(HUB_NAME, "Toy limit · " .. getToyLimit(), 1.2)
			end,
		})
		makeButton(sc, {
			order = n(),
			title = "Show limit / count",
			callback = function()
				notify(HUB_NAME, "Toys " .. countMyToys() .. " / " .. getToyLimit() .. " · room " .. toysRoom(), 2)
			end,
		})
		section(sc, "SPAWN KEYBINDS", n())
		makeToggle(sc, { order = n(), id = "palletQ", title = "Q = Spawn Pallet", tip = "PalletLightBrown via MenuToys", desc = "Toggle on/off", callback = setPalletQ })
		makeToggle(sc, { order = n(), id = "tabSpawn", title = "TAB = Spawn Selected Toy", tip = "Spawn selected toy on TAB", callback = function(on)
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
			title = "Stick To Pallet Center",
			tip = "Hold a pallet: SNO + pin people on it to the top center (FE ownership)",
			desc = "They must be near you (~30 studs) for SNO · releases when you drop the pallet",
			callback = function(on)
				setPalletCage(on)
			end,
		})
		section(sc, "QUICK SPAWN", n())
		for _, toy in ipairs({
			"PalletLightBrown", "CreatureBlobman", "BombMissile", "Campfire", "NinjaKunai",
			"NinjaShuriken", "FoodBanana", "DiceSmall", "SprayCanWD", "BallSnowball",
			"YouDecoy", "GlassBoxGray", "FoodBread", "InstrumentDrumSnare",
		}) do
			makeButton(sc, { order = n(), title = "Spawn " .. toy, tip = "Buy+Spawn " .. toy .. " (queued)", callback = function()
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
			order = n(), title = "Form Distance", min = 4, max = 40, default = S.formDistance or 12, step = 1,
			callback = function(v) S.formDistance = v end,
		})
		makeSlider(sc, {
			order = n(), title = "Form Height", min = -5, max = 30, default = S.formHeight or 2, step = 1,
			callback = function(v) S.formHeight = v end,
		})
		makeSlider(sc, {
			order = n(), title = "Form Orientation (Y°)", min = 0, max = 360, default = S.formOrientation or 0, step = 5,
			callback = function(v) S.formOrientation = v end,
		})
		makeSlider(sc, {
			order = n(), title = "Spawn Gap (sec)", min = 0.04, max = 0.35, default = S.formGap or 0.09, step = 0.01,
			callback = function(v) S.formGap = v end,
		})
		for _, def in ipairs(FORM_BUILDS) do
			makeButton(sc, {
				order = n(),
				title = "Build " .. def.title,
				tip = def.tip or ("Form · " .. def.title),
				callback = function()
					runFormBuild(def.id, S.selectedToy or "PalletLightBrown")
				end,
			})
		end
		makeButton(sc, {
			order = n(),
			title = "Build Heart (Dice / sparkle)",
			tip = "Same heart using DiceSmall",
			callback = function() runFormBuild("heart", "DiceSmall") end,
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
			title = "Remove Form (detach)",
			danger = true,
			tip = "Stop wear loop + DestroyToy form pieces",
			callback = function()
				clearFormWear(true)
				notify(HUB_NAME, "Form removed", 1.2)
			end,
		})
		section(sc, "BUILD / FUN", n())
		makeButton(sc, { order = n(), title = "Spawn Pallet Stack (5)", tip = "5 pallets stacked (serial)", callback = function()
			spawnToyBurst("PalletLightBrown", 5)
		end })
		makeButton(sc, { order = n(), title = "Spawn Pallet Stack (15)", tip = "Big stack", callback = function()
			spawnToyBurst("PalletLightBrown", 15)
		end })
		makeButton(sc, { order = n(), title = "Blobman Army (3)", danger = true, callback = function()
			spawnToyBurst("CreatureBlobman", 3)
		end })
		makeButton(sc, { order = n(), title = "Snowball Stack (10)", tip = "BallSnowball", callback = function()
			spawnToyBurst("BallSnowball", 10)
		end })
		makeToggle(sc, { order = n(), id = "autoPallet", title = "Auto Pallet Path", tip = "Queued pallets while walking", callback = function(on)
			stopLoop("autoPallet")
			notify(HUB_NAME, "Auto pallet " .. (on and "ON" or "OFF"), 1)
			if on then startLoop("autoPallet", 0.2, function() spawnToy("PalletLightBrown", { silent = true, dist = 2.5 }) end) end
		end })
		section(sc, "TOY MANAGEMENT", n())
		makeButton(sc, { order = n(), title = "Destroy All My Toys", danger = true, tip = "DestroyToy on SpawnedInToys folder", callback = function()
			local n = destroyAllMyToys()
			notify(HUB_NAME, "Destroyed " .. n .. " toys", 2)
		end })
		makeButton(sc, { order = n(), title = "Destroy All My Pallets", danger = true, callback = function()
			local n = destroyAllMyToys("Pallet")
			notify(HUB_NAME, "Destroyed " .. n .. " pallets", 2)
		end })
		makeButton(sc, { order = n(), title = "Count My Toys", tip = "SpawnedInToys children", callback = function()
			notify(HUB_NAME, "Toys: " .. countMyToys() .. " · Pallets: " .. countMyToys("PalletLightBrown"), 2)
		end })
		section(sc, "OWNED INVENTORY", n())
		makeButton(sc, { order = n(), title = "Refresh Owned + Map Scan", tip = "Scan backpack/UI/map ownership", callback = function()
			-- rebuild lists dynamically by re-opening would need frame refs; print + notify
			local owned = getOwnedToyNames()
			local map = getMapItems()
			local unowned = {}
			for name, data in pairs(map) do
				if not data.owned then unowned[#unowned+1] = name end
			end
			table.sort(unowned)
			notify(HUB_NAME, "Owned "..#owned.." · Unowned map "..#unowned, 3)
			-- fill UI lists if present
			if S.ownedList then
				for _, ch in ipairs(S.ownedList:GetChildren()) do if ch:IsA("TextButton") then ch:Destroy() end end
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
		local ownedBox = Instance.new("Frame")
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
		local ol = Instance.new("UIListLayout"); ol.Padding = UDim.new(0, 3); ol.Parent = ownedSc
		pad(ownedSc, 4, 4, 4, 4)
		S.ownedList = ownedSc

		section(sc, "UNOWNED MAP ITEMS", n())
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
		unInfo.Text = "  Click a name → real SNO bring · held in front of you until you grab it"
		unInfo.Parent = sc
		corner(unInfo, 8)
		pad(unInfo, 6, 6, 6, 6)
		makeButton(sc, {
			order = n(),
			title = "Release brought items",
			danger = true,
			tip = "Stop holding items (keeps ownership if you already grabbed)",
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
			title = "Missile type",
			options = { "BombMissile", "FireworkMissile", "BombBalloon", "BombDarkMatter" },
			default = S.missileType or "BombMissile",
			callback = function(v) S.missileType = v end,
		})
		makeDropdown(sc, {
			order = n(),
			title = "Account type",
			options = { "Auto-detect", "No gamepass (100)", "Gamepass (200)" },
			default = (S.toyPassMode == "pass" and "Gamepass (200)")
				or (S.toyPassMode == "free" and "No gamepass (100)")
				or "Auto-detect",
			callback = function(v)
				if v:find("Gamepass", 1, true) then S.toyPassMode = "pass"
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
			title = "Missiles per burst",
			min = 1,
			max = 12,
			default = S.missileCount or 3,
			callback = function(v) S.missileCount = v end,
		})
		makeToggle(sc, {
			order = n(),
			id = "missileStrike",
			title = "Auto strike target",
			tip = "Keeps spawning + exploding on the selected player",
			danger = true,
			callback = function(on)
				setMissileStrike(on)
			end,
		})
		makeButton(sc, {
			order = n(),
			title = "Fire once (burst)",
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
			title = "Delete my missiles",
			danger = true,
			callback = function()
				local n = 0
				for _, name in ipairs({ "BombMissile", "FireworkMissile", "BombBalloon", "BombDarkMatter" }) do
					n += destroyAllMyToys(name)
				end
				notify(HUB_NAME, "Cleared " .. n, 1.2)
			end,
		})
end

_TAB_BUILDERS["blobman"] = function(sc, n)
	section(sc, "BLOBMAN SPAWN", n())
	makeButton(sc, {
		order = n(), title = "Spawn Blobman",
		tip = "Buy + spawn CreatureBlobman and auto-sit",
		callback = function()
			notify(HUB_NAME, "Spawning blobman...", 1.5)
			task.spawn(function()
				local ok = ensureBlobman()
				if ok then notify(HUB_NAME, "Blobman ready", 1.5) else notify(HUB_NAME, "Spawn failed", 2) end
			end)
		end,
	})
	makeToggle(sc, {
		order = n(), id = "autoRemountBlobman",
		title = "Auto Re-mount",
		tip = "Re-sits blobman if knocked off",
		callback = function(on)
			S.toggles.autoRemountBlobman = on
			if on then
				startLoop("autoRemountBlobman", 1, function()
					if not isOnBlobman() then
						forceBlobmanMount()
					end
				end)
			else
				stopLoop("autoRemountBlobman")
			end
		end,
	})

	section(sc, "CREATURE GRAB (works in plots)", n())
	S.playerDropdowns = S.playerDropdowns or {}
	makePlayerSearchList(sc, {
		label = "Target",
		clickFn = function(p) S.blobmanTarget = p; S.selected = p end,
	}, n)
	makeButton(sc, {
		order = n(), title = "Blob Grab Selected",
		danger = true,
		tip = "Spawn blobman → TP to target → CreatureGrab (works in plots)",
		callback = function()
			local p = S.blobmanTarget or combatTarget()
			if not p then notify(HUB_NAME, "Select a player", 1.5); return end
			notify(HUB_NAME, "Blob Grab → " .. playerLabel(p), 1.2)
			task.spawn(function() blobGrabSingle(p) end)
		end,
	})
	makeButton(sc, {
		order = n(), title = "Blob Grab All",
		danger = true,
		tip = "Spawn blobman → TP to every player → CreatureGrab all",
		callback = function()
			task.spawn(blobGrabAll)
		end,
	})
	makeButton(sc, {
		order = n(), title = "Blob Grab Loop",
		danger = true,
		tip = "Loop blob grab selected until toggled off · persists through rejoin",
		callback = function()
			local p = combatTarget()
			if not p then notify(HUB_NAME, "Select a player", 1.5); return end
			startBlobGrabLoop(p)
		end,
	})
	makeToggle(sc, { order = n(), id = "blobLockLight", title = "Blobman Lock Light",
		tip = "Light persistent grab · re-holds target on creature",
		callback = function(on)
			S.toggles.blobLockLight = on
			stopLoop("blobLockLight")
			if on then startLoop("blobLockLight", 0.25, function()
				local p = S.selected or combatTarget()
				if p then blobGrabSingle(p) end
			end) end
		end,
	})
	makeToggle(sc, { order = n(), id = "blobLockStrong", title = "Blobman Lock Strong",
		tip = "Persistent grab + SNO · target cannot stand to escape",
		callback = function(on)
			S.toggles.blobLockStrong = on
			stopLoop("blobLockStrong")
			if on then startLoop("blobLockStrong", 0.2, function()
				local p = S.selected or combatTarget()
				if not p then return end
				blobGrabSingle(p)
				if rootOf(p) then snoPlayer(p) end
			end) end
		end,
	})
	makeToggle(sc, { order = n(), id = "blobLockBest", title = "Blobman Lock Best",
		tip = "Max persistent lock · re-grab at highest rate · works in plots",
		callback = function(on)
			S.toggles.blobLockBest = on
			stopLoop("blobLockBest")
			if on then startLoop("blobLockBest", 0.1, function()
				local p = S.selected or combatTarget()
				if not p then return end
				blobGrabSingle(p)
				if rootOf(p) then snoPlayer(p) end
			end) end
		end,
	})

	section(sc, "BLOBMAN ARMY", n())
	makeButton(sc, { order = n(), title = "Blobman Army (3)", danger = true,
		tip = "Spawn 3 blobmen",
		callback = function()
			spawnToyBurst("CreatureBlobman", 3)
		end,
	})
	makeButton(sc, { order = n(), title = "Blobman Army (5)", danger = true,
		tip = "Spawn 5 blobmen",
		callback = function()
			spawnToyBurst("CreatureBlobman", 5)
		end,
	})
	makeButton(sc, { order = n(), title = "Clear All Blobmen",
		tip = "Destroy all spawned blobmen",
		callback = function()
			local n = destroyAllMyToys("CreatureBlobman")
			notify(HUB_NAME, "Cleared " .. n .. " blobmen", 1.5)
		end,
	})
end

_TAB_BUILDERS["world"] = function(sc, n)
		section(sc, "WORLD / OBJECTS", n())
		makeToggle(sc, { order = n(), id = "aura_netown", title = "Network Ownership Aura", tip = "OP continuous SNO", callback = function(on) setAura("netown", on) end })
		makeToggle(sc, { order = n(), id = "aura_fling", title = "Object/Player Fling Aura", tip = "Use ⚙ in Auras for target mode", callback = function(on) setAura("fling", on) end })
		makeButton(sc, { order = n(), title = "Fling Nearby Once", danger = true, callback = function()
			local cfg = getAura("fling")
			eachAuraTarget(cfg, function(p,r) flingPlayer(p, cfg.power, true) end, function(part) sno(part); applyVel(part, cfg.power, 0.5) end)
			notify(HUB_NAME, "Pulse fling", 1)
		end })
		makeToggle(sc, { order = n(), id = "unanchorAura", title = "Unanchor Aura", tip = "Unanchor + SNO nearby", callback = function(on)
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
		makeButton(sc, { order = n(), title = "Clear Nearby BodyMovers", callback = function()
			local me = hrp(); if not me then return end
			for _, p in ipairs(workspace:GetDescendants()) do
				if (p:IsA("BodyVelocity") or p:IsA("BodyPosition")) and p.Parent and p.Parent:IsA("BasePart") then
					if (p.Parent.Position - me.Position).Magnitude < 80 then pcall(function() p:Destroy() end) end
				end
			end
		end })
		makeToggle(sc, { order = n(), id = "deleteTouch", title = "Delete Touched Parts", tip = "Destroy parts you touch", callback = function(on)
			if S.conns.delTouch then pcall(function() S.conns.delTouch:Disconnect() end) end
			if not on then return end
			local r = hrp(); if not r then return end
			S.conns.delTouch = r.Touched:Connect(function(hit)
				if hit:IsA("BasePart") and not hit:IsDescendantOf(char()) then
					if sno(hit) then pcall(function() hit:Destroy() end) end
				end
			end)
		end })
		makeButton(sc, { order = n(), title = "Bring All Nearby Objects", callback = function()
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
		makeSlider(sc, { order = n(), title = "ESP Fill Transparency", min = 0, max = 1, default = 0.5, step = 0.1,
			stateKey = "espFillTransparency", tip = "How see-through the highlight fill is", callback = function(v) S.espFillTransparency = v; if S.toggles.esp then setESP(true) end end })
		makeSlider(sc, { order = n(), title = "ESP Outline Transparency", min = 0, max = 1, default = 0.3, step = 0.1,
			stateKey = "espOutlineTransparency", tip = "How see-through the outline is", callback = function(v) S.espOutlineTransparency = v; if S.toggles.esp then setESP(true) end end })
		makeDropdown(sc, { order = n(), title = "ESP Depth Mode", options = { "AlwaysOnTop", "Occluded" }, default = "AlwaysOnTop",
			tip = "AlwaysOnTop = see through walls · Occluded = hidden by walls", callback = function(v) S.espDepthMode = v; if S.toggles.esp then setESP(true) end end })
		makeToggle(sc, { order = n(), id = "fullbright", title = "Fullbright", tip = "Max brightness / no fog", callback = setFullbright })
		makeToggle(sc, { order = n(), id = "noFog", title = "No Fog", callback = function(on) if on then Lighting.FogEnd=1e9 else Lighting.FogEnd=100000 end end })
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
					startLoop("thirdPerson", 0.12, function()
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
								-- don't steal control-player / freecam subject
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
			title = "3rd Person Distance",
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
			-- hub tint stays tied to open/close only
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
		makeToggle(sc, { order = n(), id = "autoFlingNearest", title = "Auto Fling Nearest", tip = "Quiet loop until they die", callback = function(on)
			stopLoop("autoFlingN")
			if on then startLoop("autoFlingN", 0.35, function()
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
		makeToggle(sc, { order = n(), id = "autoKickNearest", title = "Auto Kick Nearest", callback = function(on)
			stopLoop("autoKickN")
			if on then startLoop("autoKickN", 0.4, function()
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
		makeToggle(sc, { order = n(), id = "autoRespawnPad", title = "Auto Spawn Pallet on Respawn", callback = function(on)
			if S.conns.respawnPal then pcall(function() S.conns.respawnPal:Disconnect() end) end
			if on then S.conns.respawnPal = LP.CharacterAdded:Connect(function()
				task.wait(1); spawnToy("PalletLightBrown")
			end) end
		end })
		S.toggles.autoRejoin = (getgenv and getgenv().VOIDZ_ANTIKICK and getgenv().VOIDZ_ANTIKICK.enabled) == true
		makeToggle(sc, {
			order = n(), id = "autoRejoin", title = "Auto Rejoin if Kicked",
			tip = "Same as Anti → Anti-Kick (console + Roblox kick UI scan)",
			callback = function(on) setAntiKick(on) end,
		})
		makeToggle(sc, { order = n(), id = "autoClaim", title = "Auto Claim Plot", tip = "Click plot signs / claim detectors nearby", callback = function(on)
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
			order = n(), id = "autoSpin", title = "Auto-Spin Coins",
			tip = "When all slot lights are Neon: TP on each wheel Handle + SNO (~1s each)",
			desc = "workspace.Slots · saves/returns position · ~5s between rounds",
			callback = function(on)
				setAutoSpinCoins(on)
			end,
		})
		makeButton(sc, {
			order = n(),
			title = "Spin Coins Once Now",
			tip = "One full pass now (ignores Neon wait)",
			callback = function()
				task.spawn(function()
					local handles = scanSlotMachines()
					if #handles == 0 then
						notify(HUB_NAME, "No SlotHandle.Handle found", 2)
						return
					end
					notify(HUB_NAME, "Spinning " .. #handles .. "…", 1.5)
					local was = S.toggles.autoSpin
					S.toggles.autoSpin = true
					-- force ready path: temporarily treat as ready by spinning handles directly
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
			order = n(), id = "autoTimeReset", title = "Auto Time-Reset",
			tip = "Click time-reset / clock UI nearby to keep plot time",
			callback = function(on)
				stopLoop("autoTime")
				if on then startLoop("autoTime", 2, function()
					local me = hrp(); if not me then return end
					for _, d in ipairs(workspace:GetDescendants()) do
						if d:IsA("ClickDetector") and d.Parent and d.Parent:IsA("BasePart") then
							local n = tostring(d.Parent.Name):lower()
							if (n:find("time") or n:find("reset") or n:find("clock") or n:find("preserve"))
								and (d.Parent.Position - me.Position).Magnitude < 50 then
								pcall(function() fireclickdetector(d) end)
							end
						end
					end
					-- also ProximityPrompts
					for _, d in ipairs(workspace:GetDescendants()) do
						if d:IsA("ProximityPrompt") then
							local n = (d.ActionText .. " " .. d.ObjectText):lower()
							if n:find("time") or n:find("reset") then
								pcall(function() fireproximityprompt(d) end)
							end
						end
					end
				end) end
			end,
		})
		makeToggle(sc, {
			order = n(), id = "missileStrike", title = "Missile Strike (target)",
			tip = "Same as Explosions tab · uses selected / loop target",
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
			order = n(), id = "blobDestroyServer", title = "Destroy Server (Blobman)",
			tip = "Same as Server tab · sit Blobman · CreatureGrab all",
			callback = function(on)
				if on then setMassToggle("destroySrv", true, destroyServerLoop) else stopMass("destroySrv") end
			end,
		})
		makeToggle(sc, {
			order = n(), id = "autoLagServer", title = "Lag Server",
			tip = "Same as Server tab · CreateGrabLine intensity spam",
			callback = function(on)
				if on then setMassToggle("lagSrv", true, lagServerLoop) else stopMass("lagSrv") end
			end,
		})
		makeToggle(sc, {
			order = n(), id = "autoDestroyHybrid", title = "Destroy Hybrid (no Blobman)",
			tip = "Lag + kill/fling/toys whole server",
			callback = function(on)
				if on then setMassToggle("destroyHyb", true, destroyServerHybridLoop) else stopMass("destroyHyb") end
			end,
		})
end
_TAB_BUILDERS["console"] = function(sc, n)
		-- SURVIVAL
		section(sc, "SURVIVAL", n())
		makeToggle(sc, {
			order = n(), id = "antiKill", title = "Anti-Kill (Water / Acid)",
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
								notify(HUB_NAME, "Anti-kill · " .. pick.name, 1.5)
							end
						end
					end)
					notify(HUB_NAME, "Anti-kill ON", 1.5)
				else
					stopLoop("antiKillWater")
				end
			end,
		})
		makeButton(sc, {
			order = n(), title = "TP To Safe Place Now",
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
					notify(HUB_NAME, "No houses found", 2)
				end
			end,
		})
		makeToggle(sc, {
			order = n(), id = "invincible", title = "Invincible (Lock In House)",
			tip = "Force yourself inside a house. Can't walk out or be forced out. Toggle OFF to leave.",
			callback = function(on)
				S.toggles.invincible = on
				if on then
					-- TP to a house and lock position
					local free, owned = collectHouseSpots()
					local pool = #free > 0 and free or owned
					if #pool == 0 then
						notify(HUB_NAME, "No houses to lock into", 2)
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
					startLoop("invincible", 0.05, function()
						if not S.toggles.invincible then return end
						local r = hrp()
						local h = hum()
						if not r or not S._invincibleCF then return end
						-- lock position: keep snapping back to house
						pcall(function()
							r.CFrame = S._invincibleCF
							r.AssemblyLinearVelocity = Vector3.zero
							r.AssemblyAngularVelocity = Vector3.zero
						end)
						-- prevent walk out
						if h then
							pcall(function()
								h.WalkSpeed = 0
								h.PlatformStand = true
							end)
						end
						-- break any grab holding you
						if FTAP.Struggle then
							pcall(function() FTAP.Struggle:FireServer(LP) end)
						end
					end)
					notify(HUB_NAME, "Invincible ON · locked in " .. pick.name, 2)
				else
					stopLoop("invincible")
					local h = hum()
					if h then
						pcall(function()
							h.WalkSpeed = 16
							h.PlatformStand = false
						end)
					end
					notify(HUB_NAME, "Invincible OFF", 1.5)
				end
			end,
		})
		makeToggle(sc, {
			order = n(), id = "spamTP", title = "Spam TP (Anti-Kill)",
			tip = "Teleport around the map randomly at light speed. Can't be targeted or locked on.",
			callback = function(on)
				S.toggles.spamTP = on
				if on then
					-- blitzbr-style map locations for random TP
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
						-- add slight randomness so you never land exact same spot
						spot = spot * CFrame.new(math.random(-8, 8), math.random(0, 4), math.random(-8, 8))
						pcall(function()
							r.AssemblyLinearVelocity = Vector3.zero
							r.AssemblyAngularVelocity = Vector3.zero
							r.CFrame = spot
						end)
					end)
					notify(HUB_NAME, "Spam TP ON · light speed", 1.5)
				else
					stopLoop("spamTP")
					notify(HUB_NAME, "Spam TP OFF", 1)
				end
			end,
		})

		-- ANTI-KICK
		section(sc, "ANTI-KICK", n())
		makeToggle(sc, {
			order = n(), id = "antiKickMisc", title = "Anti-Kick (Rejoin)",
			tip = "If kicked: instantly rejoin the same server",
			callback = function(on)
				AK.enabled = on
				S.toggles.antiKick = on
				if on then
					AK.readyAt = os.clock() + 12
					notify(HUB_NAME, "Anti-kick ON · 12s grace", 2)
				else
					notify(HUB_NAME, "Anti-kick OFF", 1)
				end
			end,
		})
		makeToggle(sc, {
			order = n(), id = "antiAFK", title = "Anti-AFK",
			tip = "Prevents idle kick by simulating input",
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
			order = n(), id = "antiLag", title = "Anti-Lag",
			tip = "Disable CharacterAndBeamMove local script to reduce lag",
			callback = function(on)
				S.toggles.antiLag = on
				pcall(function()
					local script = LP.PlayerScripts:FindFirstChild("CharacterAndBeamMove")
					if script then script.Disabled = on end
				end)
			end,
		})

		-- MOVEMENT
		section(sc, "MOVEMENT", n())
		makeToggle(sc, {
			order = n(), id = "noclip", title = "Noclip",
			tip = "CanCollide false every frame — walk through walls",
			callback = function() end,
		})
		makeToggle(sc, {
			order = n(), id = "speed", title = "WalkSpeed Override",
			tip = "Re-applies every frame (FTAP resets speed)",
			callback = function() end,
		})
		makeSlider(sc, { order = n(), title = "WalkSpeed", min = 16, max = 300, default = 50, stateKey = "walkSpeed" })
		makeToggle(sc, {
			order = n(), id = "speedCFrame", title = "CFrame Speed Boost",
			tip = "Extra CFrame push — faster than walk speed",
			callback = function() end,
		})
		makeSlider(sc, { order = n(), title = "CFrame Mult", min = 1, max = 8, default = 2, stateKey = "speedMult" })
		makeToggle(sc, {
			order = n(), id = "infjump", title = "Infinite Jump",
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
			order = n(), id = "jump", title = "JumpPower Override",
			callback = function() end,
		})
		makeSlider(sc, { order = n(), title = "Jump Power", min = 50, max = 500, default = 80, stateKey = "jumpPower" })
		makeButton(sc, {
			order = n(), title = "Reset Movement", danger = true,
			callback = function()
				S.toggles.speed = false; S.toggles.fly = false; S.toggles.noclip = false
				S.toggles.infjump = false; S.toggles.jump = false; S.toggles.speedCFrame = false
				setFly(false)
				local h = hum(); if h then h.WalkSpeed = 16; h.JumpPower = 50 end
			end,
		})

		-- SERVER
		section(sc, "SERVER", n())
		makeButton(sc, { order = n(), title = "Rejoin", callback = function()
			pcall(function() TeleportService:TeleportToPlaceInstance(game.PlaceId, game.JobId, LP) end)
		end })
		makeButton(sc, { order = n(), title = "Copy JobId", callback = function()
			if setclipboard then setclipboard(game.JobId) end; notify(HUB_NAME, "Copied", 1)
		end })
		makeButton(sc, { order = n(), title = "Reset character", callback = function() local h = hum(); if h then h.Health = 0 end end })
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
			notify(HUB_NAME, "Loops stopped", 1.2)
		end })

		-- COMMAND CONSOLE
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
		consPrint("VOIDZ console · type help", C.accent2)
		consPrint("Scan → lists only player names that look flagged.", C.muted)

		makeInput(sc, { order = n(), id = "consoleInput", placeholder = "cmd · help | fling name | scan" })
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
			order = n(), title = "Scan Players (exploit signs)",
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

		-- TOYS
		section(sc, "TOOLS", n())
		makeButton(sc, { order = n(), title = "Delete my toys", danger = true, callback = function()
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
		ctrlNote.Text = " Look at them + = · WASD drives · = again to drop"
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
				notify(HUB_NAME, nPl .. " player" .. (nPl == 1 and "" or "s"), 1)
			end,
		})
		makeButton(sc, {
			order = n(),
			title = "Control selected",
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
			title = "Control NPC",
			tip = "Blobman / decoy / robloxian",
			callback = function() controlLookNPC() end,
		})
		makeButton(sc, {
			order = n(),
			title = "Stop",
			danger = true,
			callback = function() stopControl() end,
		})
end
_TAB_BUILDERS["trans"] = function(sc, n)
		section(sc, "CHAT TRANSLATOR", n())
		local TRAN_LANGS = {
			English = "en", Spanish = "es", French = "fr", German = "de",
			Portuguese = "pt", Japanese = "ja", Korean = "ko", Chinese = "zh-CN",
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
			if a == "detect" and b ~= "en" then return false end
			return false
		end
		makeToggle(sc, {
			order = n(), id = "autoTranslate", title = "Auto Translate Chat",
			tip = "Detects non-English messages and shows English translation",
			callback = function(on)
				S.toggles.autoTranslate = on
				notify(HUB_NAME, "Auto-translate " .. (on and "ON" or "OFF"), 1.5)
			end,
		})
		makeDropdown(sc, {
			order = n(), title = "Translate To",
			options = { "English", "Spanish", "French", "German", "Portuguese", "Japanese", "Korean", "Chinese", "Russian", "Arabic", "Italian", "Hindi" },
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
			order = n(), title = "Clear Chat Log",
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

		-- FTAP chat trigger words -> the game plays a sound when these are typed in chat
		local SOUND_TRIGGERS = {
			{ label = "Hello",     word = "Hello" },
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
			{ label = "Mountain",  word = "Mountain" },
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
			title = "Voice Line",
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

		-- Play once
		makeButton(sc, {
			order = n(),
			title = "Play Sound",
			callback = function()
				local word = getSelectedWord()
				voidzChat(word)
				notify(HUB_NAME, "Played: " .. word, 1)
			end,
		})

		-- Spam toggle
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

		-- Spam speed slider
		makeSlider(sc, {
			order = n(),
			id = "spamSoundSpeed",
			title = "Spam Speed (sec)",
			min = 0.5,
			max = 5,
			default = S.sliderVal and S.sliderVal.spamSoundSpeed or 1.5,
			callback = function(v)
				S.sliderVal = S.sliderVal or {}
				S.sliderVal.spamSoundSpeed = v
			end,
		})

		-- Quick play buttons for popular ones
		section(sc, "QUICK PLAY", n())
		local quickSounds = { "Mommy", "Daddy", "Oof", "Kill", "Yay", "UwU", "Hello", "Ayo", "Bruh", "Lol", "Noob" }
		for _, name in ipairs(quickSounds) do
			makeButton(sc, {
				order = n(),
				title = name,
				callback = function()
					for _, t in ipairs(SOUND_TRIGGERS) do
						if t.label == name then
							voidzChat(t.word)
							notify(HUB_NAME, "Played: " .. name, 0.8)
							break
						end
					end
				end,
			})
		end
end
_TAB_BUILDERS["fun"] = function(sc, n)
		-- ═══════════════════════════════════════════════════════════
		-- CONTROL PLAYER (moved from dedicated tab)
		-- ═══════════════════════════════════════════════════════════
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
		ctrlNote.Text = " Look at them + = key · WASD drives them · = again to drop"
		ctrlNote.Parent = sc
		corner(ctrlNote, 8)
		pad(ctrlNote, 8, 8, 8, 8)

		S.playerDropdowns = S.playerDropdowns or {}
		S._funControlSearchRefresh = makePlayerSearchList(sc, {
			clickFn = function(p) S.controlPick = p; S.selected = p end,
		}, n)

		makeButton(sc, {
			order = n(),
			title = "Refresh Players",
			callback = function()
				if S._funControlSearchRefresh then S._funControlSearchRefresh() end
				local nPl = #playerLabels()
				notify(HUB_NAME, nPl .. " player" .. (nPl == 1 and "" or "s"), 1)
			end,
		})
		makeButton(sc, {
			order = n(),
			title = "Control Selected",
			callback = function() controlSelectedPlayer() end,
		})
		if S.toggles.controlBindC == nil then S.toggles.controlBindC = false end
		makeToggle(sc, {
			order = n(),
			id = "controlBindC",
			title = "= Key · Look Control",
			tip = "Ray from head along camera. On by default.",
			callback = function(on)
				installControlKeyC(on)
			end,
		})
		makeButton(sc, {
			order = n(),
			title = "Control Look Target",
			callback = function() controlBindLook() end,
		})
		makeButton(sc, {
			order = n(),
			title = "Control Nearest",
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
			tip = "Blobman / decoy / robloxian",
			callback = function() controlLookNPC() end,
		})
		makeButton(sc, {
			order = n(),
			title = "Stop Control",
			danger = true,
			callback = function() stopControl() end,
		})

		-- ═══════════════════════════════════════════════════════════
		-- HOLD (eat food / use instruments)
		-- ═══════════════════════════════════════════════════════════
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
			"FoodBanana", "FoodBread",
			"InstrumentDrumSnare", "InstrumentGuitar", "InstrumentPiano",
		}
		makeDropdown(sc, {
			order = n(),
			title = "Item to Hold",
			options = HOLD_ITEMS,
			default = S.holdItem or HOLD_ITEMS[1],
			callback = function(v) S.holdItem = v end,
		})

		-- Core hold+use function with proper state checks (blitzbr-style)
		local function doHoldAndUse(itemName)
			local me = hrp()
			if not me then notify(HUB_NAME, "No character", 1.5) return false end
			local char = LP.Character
			if not char then return false end

			-- Step 0: Check if we already own this item in SpawnedInToys
			local myFolder = workspace:FindFirstChild(LP.Name .. "SpawnedInToys")
			local model = nil
			if myFolder then
				model = myFolder:FindFirstChild(itemName)
			end

			-- Step 1: If not found, spawn + buy
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
				-- Wait for model to appear
				for _ = 1, 30 do
					if myFolder then model = myFolder:FindFirstChild(itemName) end
					if not model then model = workspace:FindFirstChild(itemName, true) end
					if model then break end
					task.wait(0.1)
				end
			end

			if not model then notify(HUB_NAME, "Failed to spawn " .. itemName, 1.5) return false end

			-- Step 2: Wait for HoldPart and its children
			local holdPart = model:FindFirstChild("HoldPart")
			if not holdPart then
				holdPart = model:WaitForChild("HoldPart", 3)
			end
			if not holdPart then notify(HUB_NAME, "No HoldPart on " .. itemName, 1.5) return false end

			local holdRF = holdPart:FindFirstChild("HoldItemRemoteFunction")
			if not holdRF then
				holdRF = holdPart:WaitForChild("HoldItemRemoteFunction", 3)
			end
			local rigid = holdPart:FindFirstChild("RigidConstraint")

			-- Step 3: HOLD the item (if not already held)
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
				-- Wait for attachment to appear (hold confirmed)
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

			if not isHeld then notify(HUB_NAME, "Failed to hold " .. itemName, 1.5) return false end

			-- Step 4: USE the item (check EatingSound isn't already playing)
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
			title = "Hold + Use Item",
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
			tip = "Spawns FoodBanana + FoodBread, holds each, eats them",
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
			title = "Use All Instruments",
			tip = "Spawns each instrument, holds it, plays it",
			callback = function()
				local insts = { "InstrumentDrumSnare", "InstrumentGuitar", "InstrumentPiano" }
				for _, inst in ipairs(insts) do
					local ok = doHoldAndUse(inst)
					if ok then task.wait(1) end
				end
				notify(HUB_NAME, "Played all instruments", 1)
			end,
		})

		-- Paint spray (touch-based, different from hold items)
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
			title = "Spray Paint Target",
			tip = "Spawn SprayCanWD, firetouchinterest on target",
			callback = function()
				local p = S.selected
				if not p or not validP(p) or not p.Character then
					notify(HUB_NAME, "Pick a player first", 1.2) return
				end
				local me = hrp()
				if not me then return end
				local r = rootOf(p)
				if not r then return end
				-- buy
				pcall(function() if FTAP.BuyToy then FTAP.BuyToy:InvokeServer("SprayCanWD") end end)
				task.wait(0.3)
				-- spawn
				pcall(function()
					if FTAP.SpawnToy then
						FTAP.SpawnToy:InvokeServer("SprayCanWD", me.CFrame * CFrame.new(0, 3, -3), Vector3.zero)
					end
				end)
				task.wait(0.5)
				-- find the spray can and touch the target with it
				pcall(function()
					local myFolder = workspace:FindFirstChild(LP.Name .. "SpawnedInToys")
					local can = myFolder and myFolder:FindFirstChild("SprayCanWD")
					if not can then can = workspace:FindFirstChild("SprayCanWD", true) end
					if can then
						local sticky = can:FindFirstChild("StickyRemoverPart")
						if sticky then
							-- fire touch interest on target
							if firetouchinterest then
								firetouchinterest(sticky, r, 0)
								task.wait(0.1)
								firetouchinterest(sticky, r, 1)
							else
								-- fallback: teleport sticky to target
								sticky.CFrame = r.CFrame
								task.wait(0.2)
							end
						end
					end
				end)
				notify(HUB_NAME, "Spray paint fired", 1)
			end,
		})
		makeToggle(sc, {
			order = n(), id = "loopPaint", title = "Loop Spray Paint",
			tip = "Continuously spawn + spray on selected target",
			callback = function(on)
				S.toggles.loopPaint = on
				if on then
					task.spawn(function()
						notify(HUB_NAME, "Loop paint ON", 1.5)
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

		-- ═══════════════════════════════════════════════════════════
		-- AUTO BREAK PLOT
		-- ═══════════════════════════════════════════════════════════
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
			order = n(), title = "Break Rate (sec)", min = 0.3, max = 3, default = 0.8, step = 0.1,
			stateKey = "breakRate",
			tip = "Seconds between each bomb drop",
		})
		makeToggle(sc, {
			order = n(), id = "autoBreakPlot", title = "Auto Break Plot",
			tip = "Drop missiles/bombs on selected player's plot area · loops",
			callback = function(on)
				S.toggles.autoBreakPlot = on
				if on then
					task.spawn(function()
						notify(HUB_NAME, "Break Plot ON", 1.5)
						while S.toggles.autoBreakPlot do
							local p = S.selected
							if p and validP(p) and p.Character then
								local r = rootOf(p)
								if r then
									-- spawn missiles on them
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
									-- detonate
									pcall(function()
										local be = ReplicatedStorage:FindFirstChild("BombEvents")
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
						notify(HUB_NAME, "Break Plot OFF", 1)
					end)
				end
			end,
		})

		-- ═══════════════════════════════════════════════════════════
		-- SPARKLERS
		-- ═══════════════════════════════════════════════════════════
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

		-- sparkler player dropdown
		local function sparkPlayerOptions()
			local opts = playerLabels()
			if #opts == 0 then opts = { "nobody online" } end
			return opts
		end
		makeDropdown(sc, {
			order = n(),
			title = "Sparkler Target",
			options = sparkPlayerOptions(),
			default = (S.sparkTarget and playerLabel(S.sparkTarget)) or sparkPlayerOptions()[1],
			callback = function(lab)
				local p = findPlayerFromLabel(lab)
				if p then S.sparkTarget = p end
			end,
		})

		local SPARK_SHAPES = { "Sphere", "Ring", "Spiral", "Cone", "Cylinder", "Plane" }
		S.sparkShape = S.sparkShape or "Sphere"
		makeDropdown(sc, {
			order = n(),
			title = "Shape / Pattern",
			options = SPARK_SHAPES,
			default = S.sparkShape,
			callback = function(v) S.sparkShape = v end,
		})

		local SPARK_TOYS = { "Firework", "Balloon", "Snowball", "BombBalloon", "CandyCorn", "WaterBomb", "Pumpkin", "Present" }
		S.sparkToyName = S.sparkToyName or "Firework"
		makeDropdown(sc, {
			order = n(),
			title = "Toy to Spawn",
			options = SPARK_TOYS,
			default = S.sparkToyName,
			tip = "Which toy to spawn at each sparkle position",
			callback = function(v) S.sparkToyName = v end,
		})

		makeSlider(sc, {
			order = n(), title = "Particle Amount", min = 5, max = 100, default = S.sparkAmount or 30, step = 5,
			tip = "Number of toys to spawn in the burst",
			callback = function(v) S.sparkAmount = v end,
		})
		makeSlider(sc, {
			order = n(), title = "Height", min = -5, max = 15, default = S.sparkHeight or 3, step = 1,
			tip = "How high above the target the toys appear",
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
			else -- Plane
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
			title = "Create Sparkler Burst",
			tip = "Spawn actual sparkler toys around target (server-sided)",
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
						-- spawn actual toy server-side
						pcall(function()
							if FTAP.BuyToy then FTAP.BuyToy:InvokeServer(toyName) end
						end)
						pcall(function()
							if FTAP.SpawnToy then
								FTAP.SpawnToy:InvokeServer(toyName, cf, Vector3.zero)
							end
						end)
						-- SNO the spawned toy so it stays in place
						task.wait(0.15)
						local myFolder = workspace:FindFirstChild(LP.Name .. "SpawnedInToys")
						if myFolder then
							for _, model in ipairs(myFolder:GetChildren()) do
								if model.Name == toyName then
									local pp = model.PrimaryPart or model:FindFirstChildWhichIsA("BasePart", true)
									if pp and (pp.Position - cf.Position).Magnitude < 20 then
										sno(pp, cf.Position)
										-- anchor it in place
										pcall(function()
											pp.Anchored = true
											pp.CanCollide = false
										end)
										-- auto-delete after 5 seconds
										Debris:AddItem(model, 5)
										break
									end
								end
							end
						end
						task.wait(0.08)
					end
				end)
				notify(HUB_NAME, "Sparkler burst (" .. (S.sparkShape or "Sphere") .. " x " .. amount .. ") . server", 1.2)
			end,
		})
		makeToggle(sc, {
			order = n(), id = "sparklerLoop", title = "Sparkler Loop",
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
									local positions = calcSparkPositions(S.sparkShape or "Sphere", amount, 4)
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
										-- SNO + anchor the toy
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

		-- ═══════════════════════════════════════════════════════════
		-- WINGS (sparkler wings / bone wings)
		-- ═══════════════════════════════════════════════════════════
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
			title = "Spawn Wings",
			tip = "Spawn server-sided wings from pallets (visible to all)",
			callback = function()
				if S.formBuilding then notify(HUB_NAME, "Already building form...", 1.5) return end
				-- clear any existing form wear
				clearFormWear(true)
				-- spawn pallets using the form system with wing offsets
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
			title = "Remove Wings",
			danger = true,
			tip = "Destroy your wing pallets",
			callback = function()
				clearFormWear(true)
				S.formWearPieces = {}
				notify(HUB_NAME, "Wings removed", 1)
			end,
		})

		-- ═══════════════════════════════════════════════════════════
		-- FORCE ANIMATIONS
		-- ═══════════════════════════════════════════════════════════
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
			title = "Play Animation",
			callback = function()
				local p = S.animTarget
				if not p or not validP(p) or not p.Character then
					notify(HUB_NAME, "Pick A Player First", 1.2)
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
					notify(HUB_NAME, "Playing " .. (S.selectedAnim or "anim") .. " on " .. p.Name, 1)
				else
					notify(HUB_NAME, "Failed To Load Animation", 1.2)
				end
			end,
		})
		makeButton(sc, {
			order = n(),
			title = "Stop Animation",
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

		-- ═══════════════════════════════════════════════════════════
		-- TROLL TOOLS
		-- ═══════════════════════════════════════════════════════════
		section(sc, "TROLL TOOLS", n())
		makeToggle(sc, {
			order = n(),
			id = "spinTarget",
			title = "Spin Target",
			tip = "Makes selected player spin in circles",
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
			tip = "Makes selected player jump over and over",
			callback = function(on)
				S.toggles.spamJump = on
				if on then
					task.spawn(function()
						while S.toggles.spamJump do
							local p = S.selected or S.animTarget
							if p and validP(p) and p.Character then
								local hum = p.Character:FindFirstChildOfClass("Humanoid")
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
			title = "Shaky Camera Target",
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

		-- ═══════════════════════════════════════════════════════════
		-- LIMBS (remove own / steal others)
		-- ═══════════════════════════════════════════════════════════
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

		local LIMB_JOINTS = { "Right Shoulder", "Left Shoulder", "Right Hip", "Left Hip", "Neck", "RootJoint" }
		local LIMB_PARTS = { "Right Arm", "Left Arm", "Right Leg", "Left Leg", "Head", "Torso" }

		-- core function: break joints on a character and fling limbs
		local function breakLimbs(character, flingPower)
			if not character then return end
			flingPower = flingPower or 2000
			local r = character:FindFirstChild("HumanoidRootPart")
			-- break all Motor6D joints
			for _, d in ipairs(character:GetDescendants()) do
				if d:IsA("Motor6D") then
					pcall(function() d:Destroy() end)
				end
			end
			-- fling each limb away
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

		-- stolen parts tracker
		local stolenParts = {}

		-- find Motor6D that connects a specific part to its parent
		local function findJointForLimb(char, limbPart)
			for _, d in ipairs(char:GetDescendants()) do
				if d:IsA("Motor6D") and d.Part1 == limbPart then
					return d
				end
			end
			return nil
		end

		-- steal a single limb from target → attach to YOUR character
		local function stealSingleLimb(targetPlr, limbName)
			local char = targetPlr and targetPlr.Character
			if not char then return false end
			local myChar = LP.Character
			if not myChar then return false end
			local myRoot = myChar:FindFirstChild("HumanoidRootPart")
			if not myRoot then return false end

			local limb = char:FindFirstChild(limbName)
			if not limb or not limb:IsA("BasePart") then return false end

			-- break the Motor6D connecting this limb
			local joint = findJointForLimb(char, limb)
			if joint then pcall(function() joint:Destroy() end) end

			-- SNO the detached limb
			sno(limb)

			-- createGrabLine to grab the limb
			pcall(function() FTAP.CreateGrabLine:FireServer(limb, limb.CFrame) end)
			task.wait(0.05)
			pcall(function() FTAP.CreateGrabLine:FireServer(limb, myRoot.CFrame * CFrame.new(0, 2, -5)) end)

			-- pull to our character with BodyPosition
			createBringBody(limb, myRoot.CFrame * CFrame.new(0, 2, -5))

			-- weld to our character so it sticks
			task.wait(0.1)
			local weld = Instance.new("WeldConstraint")
			weld.Name = "VOIDZ_StolenLimb"
			weld.Part0 = myRoot
			weld.Part1 = limb
			weld.Parent = limb

			-- track for return
			stolenParts[#stolenParts + 1] = { part = limb, char = char, limbName = limbName }
			return true
		end

		-- map of limb names we support stealing (R6 names)
		local STEAL_LIMBS = {
			{ label = "Left Arm",  part = "Left Arm" },
			{ label = "Right Arm", part = "Right Arm" },
			{ label = "Left Leg",  part = "Left Leg" },
			{ label = "Right Leg", part = "Right Leg" },
			{ label = "Head",      part = "Head" },
		}

		-- return all stolen limbs (destroy welds, fling away)
		local function returnStolenLimbs()
			local n = 0
			for i = #stolenParts, 1, -1 do
				local info = stolenParts[i]
				local part = info.part
				if part and part.Parent then
					-- destroy the weld
					for _, d in ipairs(part:GetDescendants()) do
						if d:IsA("WeldConstraint") and d.Name == "VOIDZ_StolenLimb" then
							pcall(function() d:Destroy() end)
						end
					end
					-- remove BodyPosition
					local bp = part:FindFirstChild("BringBody")
					if bp then pcall(function() bp:Destroy() end) end
					-- fling away
					pcall(function()
						part.AssemblyLinearVelocity = Vector3.new(math.random(-50,50), 100, math.random(-50,50))
					end)
					n += 1
				end
				table.remove(stolenParts, i)
			end
			return n
		end

		-- U keybind: remove YOUR own limbs
		makeButton(sc, {
			order = n(),
			title = "Remove My Limbs [U]",
			tip = "Break joints on YOUR character + fling limbs away",
			danger = true,
			callback = function()
				local char = LP.Character
				if not char then notify(HUB_NAME, "No character", 1) return end
				breakLimbs(char, 1500)
				notify(HUB_NAME, "Limbs ripped off", 1)
			end,
		})
		makeButton(sc, {
			order = n(),
			title = "Rip Limbs Off Target",
			tip = "SNO + break joints + fling limbs on selected player",
			callback = function()
				local p = S.selected
				if not p or not validP(p) or not p.Character then
					notify(HUB_NAME, "Pick a player first", 1.2) return
				end
				visitForSNO(p, 10)
				pcall(function() breakLimbs(p.Character, 2000) end)
				notify(HUB_NAME, "Limbs ripped off " .. playerLabel(p), 1)
			end,
		})

		-- ═══════════════════════════════════════════════════════════
		-- STEAL BODY PARTS
		-- ═══════════════════════════════════════════════════════════
		section(sc, "STEAL BODY PARTS", n())
		local stealNote = Instance.new("TextLabel")
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
				tip = "Detach " .. entry.label .. " from target + attach to you",
				callback = function()
					local p = S.selected
					if not p or not validP(p) or not p.Character then
						notify(HUB_NAME, "Pick a player first", 1.2) return
					end
					local myChar = LP.Character
					if not myChar or not myChar:FindFirstChild("HumanoidRootPart") then
						notify(HUB_NAME, "You need a character", 1) return
					end
					visitForSNO(p, 10)
					task.wait(0.08)
					local ok = stealSingleLimb(p, entry.part)
					if ok then
						notify(HUB_NAME, "Stole " .. entry.label .. " from " .. playerLabel(p), 1.2)
					else
						notify(HUB_NAME, "Failed to steal " .. entry.label, 1.5)
					end
				end,
			})
		end
		makeButton(sc, {
			order = n(),
			title = "Steal ALL Limbs",
			tip = "Detach every limb from target + attach all to you",
			danger = true,
			callback = function()
				local p = S.selected
				if not p or not validP(p) or not p.Character then
					notify(HUB_NAME, "Pick a player first", 1.2) return
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
				notify(HUB_NAME, "Stole " .. stolen .. "/" .. #STEAL_LIMBS .. " limbs from " .. playerLabel(p), 1.5)
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
			tip = "Loop: re-weld stolen limbs to your body while moving",
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
			title = "Limb Steal Aura",
			tip = "Map-wide: teleport to each player and rip their limbs off",
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
					notify(HUB_NAME, "Limb Steal Aura ON", 1.5)
				else
					stopLoop("limbAura")
					notify(HUB_NAME, "Limb Steal Aura OFF", 1)
				end
			end,
		})

		-- ═══════════════════════════════════════════════════════════
		-- QUICK SERVER ACTIONS
		-- ═══════════════════════════════════════════════════════════
		section(sc, "QUICK SERVER ACTIONS", n())
		makeButton(sc, {
			order = n(),
			title = "Lag Server (Soft)",
			tip = "One-shot spam CreateGrabLine on everyone",
			callback = function()
				for _, p in ipairs(Players:GetPlayers()) do
					if p ~= LP and validP(p) and p.Character then
						local r = rootOf(p)
						if r and FTAP.CreateGrabLine then
							pcall(function() FTAP.CreateGrabLine:FireServer(r, r.CFrame) end)
						end
					end
				end
				notify(HUB_NAME, "Soft lag fired", 1)
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
				notify(HUB_NAME, "All lines destroyed", 1)
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
				notify(HUB_NAME, "Everyone ragdolled", 1)
			end,
		})
		makeButton(sc, {
			order = n(),
			title = "Rip Limbs Off Everyone",
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
								-- break all Motor6D joints
								for _, d in ipairs(p.Character:GetDescendants()) do
									if d:IsA("Motor6D") then pcall(function() d:Destroy() end) end
								end
								-- fling limbs
								for _, partName in ipairs({"Right Arm","Left Arm","Right Leg","Left Leg","Head"}) do
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
end
_TAB_BUILDERS["settings"] = function(sc, n)
		section(sc, "THEMES", n())
		makeDropdown(sc, {
			order = n(), title = "Color Theme",
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
				notify(HUB_NAME, "Device → " .. v, 1)
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
			order = n(), id = "unlockMouse", title = "Unlock Mouse",
			tip = "Lets you click the game while the hub is open (PC only)",
			callback = function(on)
				S.toggles.unlockMouse = on == true
				notify(HUB_NAME, "Unlock Mouse " .. (on and "ON" or "OFF"), 1)
			end,
		})
		section(sc, "WHITELIST", n())
		makeToggle(sc, {
			order = n(), id = "wlFriends", title = "Whitelist Friends",
			tip = "Skip friends in auras / mass loops",
			callback = function(on) S.toggles.wlFriends = on end,
		})
		makeButton(sc, {
			order = n(), title = "Add Selected Player",
			tip = "Add current player dropdown selection to whitelist",
			callback = function()
				if S.selected then
					S.whitelist[S.selected.Name] = true
					notify(HUB_NAME, "Whitelisted " .. S.selected.Name, 1)
					if S._wlRefresh then pcall(S._wlRefresh) end
				else
					notify(HUB_NAME, "No player selected", 1)
				end
			end,
		})
		makeButton(sc, {
			order = n(), title = "Remove Selected Player",
			callback = function()
				if S.selected then
					S.whitelist[S.selected.Name] = nil
					notify(HUB_NAME, "Removed " .. S.selected.Name, 1)
					if S._wlRefresh then pcall(S._wlRefresh) end
				else
					notify(HUB_NAME, "No player selected", 1)
				end
			end,
		})
		makeButton(sc, {
			order = n(), title = "Clear Whitelist",
			callback = function()
				S.whitelist = {}
				notify(HUB_NAME, "Whitelist cleared", 1)
				if S._wlRefresh then pcall(S._wlRefresh) end
			end,
		})
		-- Whitelist player list
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
				if ch:IsA("Frame") then ch:Destroy() end
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
			order = n(), title = "Unload Script", danger = true,
			tip = "Completely unload everything — UI, loops, connections, all of it",
			callback = function()
				notify(HUB_NAME, "Unloading…", 2)
				task.delay(0.5, function()
					pcall(function() unload() end)
				end)
			end,
		})
		section(sc, "KEYBIND TOGGLES", n())
		makeToggle(sc, {
			order = n(), id = "kb_toggleUI", title = "Toggle Hub [RightShift]",
			tip = "RightShift to open/close hub",
			callback = function(on) S.toggles.kb_toggleUI = on end,
		})
		makeToggle(sc, {
			order = n(), id = "kb_fly", title = "Fly [V]",
			callback = function(on) S.toggles.kb_fly = on end,
		})
		makeToggle(sc, {
			order = n(), id = "kb_noclip", title = "Noclip [N]",
			callback = function(on) S.toggles.kb_noclip = on end,
		})
		makeToggle(sc, {
			order = n(), id = "kb_reach", title = "Scroll Distance [R]",
			callback = function(on) S.toggles.kb_reach = on end,
		})
		makeToggle(sc, {
			order = n(), id = "kb_pallet", title = "Pallet Wings [Q]",
			callback = function(on) S.toggles.kb_pallet = on end,
		})
		makeToggle(sc, {
			order = n(), id = "kb_flingAura", title = "Fling Aura [F]",
			callback = function(on) S.toggles.kb_flingAura = on end,
		})
		makeToggle(sc, {
			order = n(), id = "kb_netown", title = "Net Owner Aura [G]",
			callback = function(on) S.toggles.kb_netown = on end,
		})
		makeToggle(sc, {
			order = n(), id = "kb_antiGrab", title = "Anti-Grab [H]",
			callback = function(on) S.toggles.kb_antiGrab = on end,
		})
		makeToggle(sc, {
			order = n(), id = "kb_flingNear", title = "Fling Near [T]",
			callback = function(on) S.toggles.kb_flingNear = on end,
		})
		makeToggle(sc, {
			order = n(), id = "kb_stomp", title = "Stomp Aura [Y]",
			callback = function(on) S.toggles.kb_stomp = on end,
		})
		makeToggle(sc, {
			order = n(), id = "kb_orbit", title = "Orbit Aura [O]",
			callback = function(on) S.toggles.kb_orbit = on end,
		})
		makeToggle(sc, {
			order = n(), id = "kb_serverFling", title = "Server Fling [J]",
			callback = function(on) S.toggles.kb_serverFling = on end,
		})
		section(sc, "GLOBAL POWERS", n())
		makeSlider(sc, {
			order = n(), title = "Fling Power", min = 400, max = 20000, default = S.flingPower or 8000, step = 100,
			stateKey = "flingPower",
		})
		makeSlider(sc, {
			order = n(), title = "Strength Multiplier", min = 0.1, max = 10, default = S.strengthMult or 1, step = 0.1,
			callback = function(v) S.strengthMult = v end,
		})
		makeSlider(sc, {
			order = n(), title = "Aura Range", min = 10, max = 200, default = S.auraRange or 50,
			stateKey = "auraRange",
		})
		makeSlider(sc, {
			order = n(), title = "Lag Intensity", min = 1, max = 500, default = S.lagIntensity or 150,
			tip = "CreateGrabLine spam rate (lag server loops)",
			stateKey = "lagIntensity",
		})
		section(sc, "EXPORT / IMPORT", n())
		makeButton(sc, {
			order = n(), title = "Export Config",
			tip = "Copy current settings to clipboard as JSON",
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
					notify(HUB_NAME, "Config copied to clipboard", 2)
				else
					notify(HUB_NAME, "Export failed", 2)
				end
			end,
		})
		makeInput(sc, {
			order = n(), id = "importBox", placeholder = "Paste config JSON here...",
		})
		makeButton(sc, {
			order = n(), title = "Import Config",
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
						elseif k == "device" and type(v) == "string" then
							S.device = v
						elseif type(v) == "number" then
							S[k] = v
						end
					end
					notify(HUB_NAME, "Config imported — reopen hub to apply", 2)
				else
					notify(HUB_NAME, "Invalid JSON", 2)
				end
			end,
		})
		section(sc, "AUTO MODE", n())
		makeToggle(sc, {
			order = n(), id = "autoMode", title = "Auto Mode (BETA)",
			tip = "Automatically enables the best options for whatever situation you're in",
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

-- mouse / hub open state lives on S (no extra locals — Luau register budget)
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

-- unlocked=true: free cursor for UI · unlocked=false: lock cursor back into game
local function setMouseUnlocked(unlocked)
	-- mobile / touch: never force mouse lock
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
		-- UI always on RightShift
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
			setAura("fling", S.toggles.aura_fling == true)
			notify(HUB_NAME, "Fling aura " .. (S.toggles.aura_fling and "ON" or "OFF"), 1)
		elseif S.toggles.kb_netown and pressed(S.keybinds and S.keybinds.aura_netown or "G") then
			S.toggles.aura_netown = not S.toggles.aura_netown
			setAura("netown", S.toggles.aura_netown == true)
			notify(HUB_NAME, "Net own " .. (S.toggles.aura_netown and "ON" or "OFF"), 1)
		elseif S.toggles.kb_antiGrab and pressed(S.keybinds and S.keybinds.antiGrab or "H") then
			S.toggles.antiGrab = not S.toggles.antiGrab
			stopLoop("antiGrab")
			if S.toggles.antiGrab then startLoop("antiGrab", 0.1, antiGrabTick) end
			notify(HUB_NAME, "Anti-grab " .. (S.toggles.antiGrab and "ON" or "OFF"), 1)
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
					spawnToy("PalletLightBrown", { sync = true })
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
			-- U = remove own limbs (blitzbr/bloodyv2 style)
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
				notify(HUB_NAME, "Limbs ripped off", 1)
			end
		elseif S.toggles.kb_serverFling and pressed(S.keybinds and S.keybinds.srv_fling or "J") then
			S.toggles.srv_fling = not S.toggles.srv_fling
			setServerFx("fling", S.toggles.srv_fling == true)
		-- = control is installControlKeyC (always-on path)
		end
	end))
end

------------------------------------------------------------------------
-- Mobile touch HUD (always-on quick buttons)
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

	-- floating menu (top-left)
	local menu = Instance.new("TextButton")
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

	-- right rail: compact quick actions
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
			stopLoop("antiGrab")
			if S.toggles.antiGrab then startLoop("antiGrab", 0.1, antiGrabTick) end
		end,
	})
	addPadBtn(5, "FLING", {
		toggleKey = "aura_fling",
		onPress = function()
			S.toggles.aura_fling = not S.toggles.aura_fling
			setAura("fling", S.toggles.aura_fling == true)
		end,
	})
	addPadBtn(6, "THROW", {
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
			else notify(HUB_NAME, "No target", 1) end
		end,
	})

	-- bottom action bar
	local bot = Instance.new("Frame")
	bot.Name = "MobileBottom"
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

------------------------------------------------------------------------
-- Main window
local function buildMain()
	resolveFTAP()
	-- defaults before UI build so toggles render ON correctly
	S.toggles.unlockMouse = false
	S.toggles.freeCamMass = false
	S.toggles.kb_toggleUI = true
	S.antiWanted = S.antiWanted or {}
	-- auto-detect touch if user forgot to pick mobile
	if S.device ~= "Mobile" and UserInputService.TouchEnabled and not UserInputService.KeyboardEnabled then
		S.device = "Mobile"
		S.toggles.mobileUI = true
	end
	local mobile = isMobileMode()

	local parent = getUiParent()
	local old = parent:FindFirstChild("VOIDZ_HUB"); if old then old:Destroy() end
	local sg = Instance.new("ScreenGui")
	sg.Name = "VOIDZ_HUB"
	sg.ResetOnSpawn = false
	sg.IgnoreGuiInset = true
	sg.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	sg.DisplayOrder = 100000
	sg.Parent = parent
	S.gui = sg

	-- viewport-based size
	local cam = workspace.CurrentCamera
	local vw = (cam and cam.ViewportSize.X) or 800
	local vh = (cam and cam.ViewportSize.Y) or 600
	if mobile then
		S.mainW = math.clamp(math.floor(vw * 0.92), 300, 720)
		S.mainH = math.clamp(math.floor(vh * 0.72), 340, 620)
	else
		S.mainW, S.mainH = 680, 460
	end

	-- toast (clean pill)
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

	-- tip bubble
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
	-- animated root glow pulse
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
	-- animated gradient top bar
	local top = Instance.new("Frame")
	top.Size = UDim2.new(1, 0, 0, 3)
	top.BackgroundColor3 = Color3.new(1, 1, 1)
	top.BorderSizePixel = 0
	top.ZIndex = 6
	top.Parent = header
	local topGrad = Instance.new("UIGradient")
	topGrad.Color = ColorSequence.new({
		ColorSequenceKeypoint.new(0, C.accent),
		ColorSequenceKeypoint.new(0.3, C.accent2 or C.accent),
		ColorSequenceKeypoint.new(0.6, C.success or C.accent),
		ColorSequenceKeypoint.new(1, C.accent),
	})
	topGrad.Rotation = 0
	topGrad.Parent = top
	-- animate the gradient rotation
	task.spawn(function()
		local rot = 0
		while top.Parent do
			rot = (rot + 1.2) % 360
			topGrad.Rotation = rot
			task.wait(0.03)
		end
	end)
	-- glow line below the gradient bar
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

	local logo = Instance.new("TextLabel")
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
	-- gradient text effect on logo
	local logoGrad = Instance.new("UIGradient")
	logoGrad.Color = ColorSequence.new({
		ColorSequenceKeypoint.new(0, C.accent2 or C.accent),
		ColorSequenceKeypoint.new(0.5, Color3.new(1, 1, 1)),
		ColorSequenceKeypoint.new(1, C.accent),
	})
	logoGrad.Rotation = 30
	logoGrad.Parent = logo

	local status = Instance.new("TextLabel")
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

	-- drag
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
	-- sidebar glow pulse
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
	-- subtle gradient on content area
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
		-- hover glow on tab button
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
		-- monogram badge
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
		if not ok then warn("[VOIDZ] tab "..def.id, err) end
		btn.MouseButton1Click:Connect(function() switchTab(def.id) end)
	end


	S._buildingTab = nil

	switchTab("home")
	setPurpleTint(true) -- hub open tint (auto-clears on close)
	S.toggles.kb_toggleUI = true
	installKeybindHandler()
	installControlKeyC(true, true)
	S.escapeSpace = false
	S.toggles.escapeSpace = false
	if mobile then
		buildMobileHud(sg)
	end

	S.hubOpen = true

	-- re-enable wanted antis after death/respawn
	LP.CharacterAdded:Connect(function()
		task.wait(0.8)
		local w = S.antiWanted or {}
		-- Only re-arm if user explicitly set antiWanted.antiGrab = true via UI
		if w.antiGrab == true and S.toggles.antiGrab then
			stopLoop("antiGrab")
			startLoop("antiGrab", 0.1, antiGrabTick)
			notify(HUB_NAME, "Anti-grab re-armed", 1.5)
		elseif w.antiGrab ~= true then
			S.toggles.antiGrab = false
			stopLoop("antiGrab")
		end
		if w.antiKill or S.toggles.antiKill then
			startAntiKillLoop()
			notify(HUB_NAME, "Anti-kill re-armed · house TP", 1.5)
		end
		for _, key in ipairs({ "antiBurn", "antiBanana", "antiVoid", "antiFling", "antiExplode", "antiSit", "antiRagdoll", "god" }) do
			if w[key] or S.toggles[key] then
				S.toggles[key] = true
			end
		end
		-- fix orphaned freezePart after death — reset camera
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

	-- auto-update everything every 20s
	task.spawn(function()
		while S.gui and S.gui.Parent do
			task.wait(20)
			pcall(resolveFTAP)
			if S.playerListFrame then pcall(S._loopSearchRefresh) end
			if S._ctrlSearchRefresh then pcall(S._ctrlSearchRefresh) end
			if S._funControlSearchRefresh then pcall(S._funControlSearchRefresh) end
			if S.toggles.lineExtend then pcall(applyLineExtendDistance, S.extendAmount or 40) end
			if S.status then S.status.Text = FTAP.ok and "FTAP:ON" or "FTAP:…" end
			if S.homeStatus then
				S.homeStatus.Text = " Build: " .. BUILD
					.. "\n Place: " .. tostring(game.PlaceId)
					.. "\n FTAP: " .. (FTAP.ok and "linked" or "scanning")
					.. " · players: " .. tostring(#labels)
			end
		end
	end)

	-- keep remotes alive faster
	task.spawn(function()
		while S.gui and S.gui.Parent do
			if not FTAP.ok then resolveFTAP() end
			task.wait(3)
		end
	end)

	notify(HUB_NAME, "Online Nigga · " .. (FTAP.ok and "FTAP Linked Hell Yeah" or "Scan Remotes You Dumbass…"), 3)
	print("[VOIDZ HUB]", BUILD, "FTAP", FTAP.ok)
end

------------------------------------------------------------------------
-- Key gate
local function buildKey()
	local parent = getUiParent()
	local old = parent:FindFirstChild("VOIDZ_KEY"); if old then old:Destroy() end
	local sg = Instance.new("ScreenGui")
	sg.Name = "VOIDZ_KEY"
	sg.ResetOnSpawn = false
	sg.IgnoreGuiInset = true
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
	skull.Text = "VOIDZ"
	skull.Parent = card

	local title = Instance.new("TextLabel")
	title.BackgroundTransparency = 1
	title.Size = UDim2.new(1, -40, 0, 22)
	title.Position = UDim2.fromOffset(20, 68)
	title.Font = Enum.Font.GothamBold
	title.TextSize = 18
	title.TextColor3 = C.text
	title.Text = "VOIDZ HUB NIGGA"
	title.Parent = card

	local sub = Instance.new("TextLabel")
	sub.BackgroundTransparency = 1
	sub.Size = UDim2.new(1, -40, 0, 16)
	sub.Position = UDim2.fromOffset(20, 96)
	sub.Font = Enum.Font.Gotham
	sub.TextSize = 12
	sub.TextColor3 = C.muted
	sub.Text = "FTAP OP SUITE · ENTER THE DAMN KEY NIGGA"
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
	status.Text = "Key: kingvoidz"
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
		-- Full-screen themed splash (PC vs Mobile layouts differ)
		local parent = getUiParent()
		local old = parent:FindFirstChild("VOIDZ_SPLASH")
		if old then old:Destroy() end
		local splash = Instance.new("ScreenGui")
		splash.Name = "VOIDZ_SPLASH"
		splash.ResetOnSpawn = false
		splash.IgnoreGuiInset = true
		splash.DisplayOrder = 999
		splash.Parent = parent

		local isMobile = device == "Mobile"
		local bg = Instance.new("Frame")
		bg.Size = UDim2.fromScale(1, 1)
		bg.BackgroundColor3 = C.bg
		bg.BorderSizePixel = 0
		bg.BackgroundTransparency = 1
		bg.Parent = splash
		tween(bg, { BackgroundTransparency = 0 }, 0.35)

		-- accent wash
		local wash = Instance.new("Frame")
		wash.Size = UDim2.fromScale(1, 1)
		wash.BackgroundColor3 = C.accent
		wash.BackgroundTransparency = 0.88
		wash.BorderSizePixel = 0
		wash.Parent = bg
		grad(wash, C.accentDim, C.bg, isMobile and 180 or 35)

		-- cinematic bars (PC) or soft vignette ring (Mobile)
		if not isMobile then
			for _, side in ipairs({ "top", "bot" }) do
				local bar = Instance.new("Frame")
				bar.Size = UDim2.new(1, 0, 0, 52)
				bar.Position = side == "top" and UDim2.new(0, 0, 0, 0) or UDim2.new(0, 0, 1, -52)
				bar.BackgroundColor3 = C.black
				bar.BorderSizePixel = 0
				bar.BackgroundTransparency = 0.15
				bar.Parent = bg
				local line = Instance.new("Frame")
				line.Size = UDim2.new(1, 0, 0, 2)
				line.Position = side == "top" and UDim2.new(0, 0, 1, -2) or UDim2.new(0, 0, 0, 0)
				line.BackgroundColor3 = C.accent
				line.BorderSizePixel = 0
				line.Parent = bar
			end
			for _, x in ipairs({ 0, 1 }) do
				local rail = Instance.new("Frame")
				rail.AnchorPoint = Vector2.new(x, 0.5)
				rail.Position = UDim2.fromScale(x, 0.5)
				rail.Size = UDim2.new(0, 3, 0.42, 0)
				rail.BackgroundColor3 = C.accent
				rail.BackgroundTransparency = 0.25
				rail.BorderSizePixel = 0
				rail.Parent = bg
			end
		else
			local ring = Instance.new("Frame")
			ring.AnchorPoint = Vector2.new(0.5, 0.5)
			ring.Position = UDim2.fromScale(0.5, 0.48)
			ring.Size = UDim2.fromOffset(280, 280)
			ring.BackgroundTransparency = 1
			ring.Parent = bg
			local rs = Instance.new("UIStroke")
			rs.Color = C.accent
			rs.Thickness = 2.5
			rs.Transparency = 0.35
			rs.Parent = ring
			corner(ring, 140)
			local ring2 = ring:Clone()
			ring2.Size = UDim2.fromOffset(220, 220)
			ring2.Parent = bg
			local rs2 = ring2:FindFirstChildOfClass("UIStroke")
			if rs2 then
				rs2.Thickness = 1.5
				rs2.Transparency = 0.55
			end
		end

		local brand = Instance.new("TextLabel")
		brand.BackgroundTransparency = 1
		brand.AnchorPoint = Vector2.new(0.5, 0.5)
		brand.Position = UDim2.fromScale(0.5, isMobile and 0.40 or 0.42)
		brand.Size = UDim2.new(0.9, 0, 0, isMobile and 56 or 64)
		brand.Font = Enum.Font.GothamBlack
		brand.TextSize = isMobile and 42 or 52
		brand.TextColor3 = C.accent2
		brand.Text = "VOIDZ"
		brand.TextTransparency = 1
		brand.Parent = bg
		tween(brand, { TextTransparency = 0 }, 0.45)

		local sub = Instance.new("TextLabel")
		sub.BackgroundTransparency = 1
		sub.AnchorPoint = Vector2.new(0.5, 0)
		sub.Position = UDim2.new(0.5, 0, isMobile and 0.48 or 0.50, 0)
		sub.Size = UDim2.new(0.85, 0, 0, 28)
		sub.Font = Enum.Font.GothamBold
		sub.TextSize = isMobile and 14 or 16
		sub.TextColor3 = C.text
		sub.Text = isMobile and "MOBILE · TOUCH OPS" or "PC · FULL CONTROL"
		sub.TextTransparency = 1
		sub.Parent = bg
		tween(sub, { TextTransparency = 0 }, 0.5)

		local tag = Instance.new("TextLabel")
		tag.BackgroundTransparency = 1
		tag.AnchorPoint = Vector2.new(0.5, 0)
		tag.Position = UDim2.new(0.5, 0, isMobile and 0.54 or 0.56, 0)
		tag.Size = UDim2.new(0.8, 0, 0, 20)
		tag.Font = Enum.Font.Gotham
		tag.TextSize = 12
		tag.TextColor3 = C.muted
		tag.Text = (S.theme or "Purple") .. " theme · FTAP suite · " .. BUILD
		tag.TextTransparency = 1
		tag.Parent = bg
		tween(tag, { TextTransparency = 0 }, 0.55)

		local slash = Instance.new("Frame")
		slash.AnchorPoint = Vector2.new(0.5, 0.5)
		slash.Position = UDim2.fromScale(0.5, isMobile and 0.47 or 0.49)
		slash.Size = UDim2.fromOffset(0, 3)
		slash.BackgroundColor3 = C.accent
		slash.BorderSizePixel = 0
		slash.Parent = bg
		tween(slash, { Size = UDim2.fromOffset(isMobile and 120 or 180, 3) }, 0.55, Enum.EasingStyle.Quint)

		if isMobile then
			local chip = Instance.new("TextLabel")
			chip.AnchorPoint = Vector2.new(0.5, 1)
			chip.Position = UDim2.new(0.5, 0, 1, -48)
			chip.Size = UDim2.fromOffset(200, 32)
			chip.BackgroundColor3 = C.accentDim
			chip.BorderSizePixel = 0
			chip.Font = Enum.Font.GothamBold
			chip.TextSize = 12
			chip.TextColor3 = C.text
			chip.Text = "TAP READY"
			chip.Parent = bg
			corner(chip, 16)
			stroke(chip, C.accent, 1.5)
		else
			local keys = Instance.new("TextLabel")
			keys.BackgroundTransparency = 1
			keys.AnchorPoint = Vector2.new(0.5, 1)
			keys.Position = UDim2.new(0.5, 0, 1, -64)
			keys.Size = UDim2.new(0.7, 0, 0, 18)
			keys.Font = Enum.Font.Code
			keys.TextSize = 12
			keys.TextColor3 = C.accent2
			keys.Text = "WASD · Q PALLET · TAB TOY · SPACE ESCAPE"
			keys.Parent = bg
		end

		local done = false
		local function finish()
			if done then return end
			done = true
			tween(bg, { BackgroundTransparency = 1 }, 0.35)
			tween(brand, { TextTransparency = 1 }, 0.3)
			task.delay(0.38, function()
				pcall(function() splash:Destroy() end)
				if onDone then onDone() end
			end)
		end
		task.delay(isMobile and 2.1 or 2.4, finish)
		local skip = Instance.new("TextButton")
		skip.Size = UDim2.fromScale(1, 1)
		skip.BackgroundTransparency = 1
		skip.Text = ""
		skip.ZIndex = 50
		skip.Parent = bg
		skip.MouseButton1Click:Connect(finish)
	end

	local function pickDeviceThenMain()
		local dim = Instance.new("Frame")
		dim.Size = UDim2.fromScale(1, 1)
		dim.BackgroundColor3 = C.black
		dim.BackgroundTransparency = 0.35
		dim.Parent = sg
		local pick = Instance.new("Frame")
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
			status.Text = "Access granted"
			task.wait(0.15)
			box.Visible = false
			unlock.Visible = false
			status.Visible = false
			sub.Text = "Almost ready"
			if LP.Name ~= "Super_remy12" then
				voidzChat("✧ ༺ VOIDZ HUB ✧ LOADED ༻ ✧")
			end
			pickDeviceThenMain()
		else
			status.TextColor3 = C.danger
			status.Text = "Invalid key"
			box.Text = ""
		end
	end
	unlock.MouseButton1Click:Connect(function() task.spawn(try) end)
	box.FocusLost:Connect(function(e) if e then task.spawn(try) end end)
end

	Late.buildKey = buildKey
end 

	_voidzInitUI()

	-- export boot-critical entry points to outer scope
	Late.installAntiKickOnLoad = installAntiKickOnLoad
	Late.installGrabWatch = installGrabWatch
	Late.installAntis = installAntis
	Late.unload = unload
	if getgenv then
		getgenv().VOIDZ_UNLOAD = unload
	end
end
_voidzLateInit()

print("[VOIDZ HUB] loading", BUILD)
task.spawn(resolveFTAP)
task.spawn(Late.installAntiKickOnLoad)
task.spawn(Late.installGrabWatch)
task.spawn(Late.installAntis)
Late.buildKey()

-- hello everyone this is voidz enjoy the script v1.1.6
