local Players = game:GetService("Players")
local LP = Players.LocalPlayer
local UIS = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")

-- ═══════════════════════════════════════════════════════════════
-- SCRIPTS REGISTRY
-- ═══════════════════════════════════════════════════════════════
local SCRIPTS = {
    {
        name = "VOIDZ HUB",
        desc = "FTAP — Full exploit hub. 19 tabs, 270+ features.",
        game = "Fling Things & People",
        url = "https://raw.githubusercontent.com/fungamer1234/voidz-hub/main/VOIDZ_HUB.lua",
        color = Color3.fromRGB(140, 70, 255),
    },
    {
        name = "IRONMAN HUB",
        desc = "FTAP — Iron Man themed. Red & black, MK1–MK19 icons.",
        game = "Fling Things & People",
        url = "https://raw.githubusercontent.com/fungamer1234/IRONMAN-hub-/main/IRONMAN_HUB.lua",
        color = Color3.fromRGB(220, 40, 40),
    },
    {
        name = "BATMAN HUB",
        desc = "FTAP — Batman themed. Black & yellow, B01–B19 icons.",
        game = "Fling Things & People",
        url = "https://raw.githubusercontent.com/fungamer1234/BATMAN-HUB/main/BATMAN_HUB.lua",
        color = Color3.fromRGB(255, 200, 0),
    },
    {
        name = "MM2 HUB",
        desc = "Murder Mystery 2 — 10 tabs. ESP, combat, farm, roles.",
        game = "Murder Mystery 2",
        url = "https://raw.githubusercontent.com/fungamer1234/MM2-hub/main/MM2_HUB.lua",
        color = Color3.fromRGB(80, 180, 255),
    },
    {
        name = "BROOKHAVEN HUB",
        desc = "Brookhaven RP — 12 tabs. Sander Premium features, admin, gamepass, troll.",
        game = "Brookhaven RP",
        url = "https://raw.githubusercontent.com/fungamer1234/Voidz-Brookhaven/main/Voidz_Brookhaven.lua",
        color = Color3.fromRGB(50, 200, 100),
    },
    {
        name = "FE6 ADMIN",
        desc = "Universal admin script. ~200 commands, full GUI.",
        game = "Universal",
        url = "https://raw.githubusercontent.com/fungamer1234/FE6-admin/main/FE6_ADMIN.lua",
        color = Color3.fromRGB(0, 200, 120),
    },
    {
        name = "SKILZ HUB (de11x)",
        desc = "FTAP — SKILZ HUB by de11x. Compact OP features.",
        game = "Fling Things & People",
        url = "https://raw.githubusercontent.com/fungamer1234/FE6-admin/main/FE6xDE11_FTAP_OP.lua",
        color = Color3.fromRGB(255, 100, 50),
    },
    {
        name = "BASEPLATE HUB",
        desc = "Fight on a Baseplate — Kill Aura, Auto Weave, Hitbox, ESP, Speed, 25+ features.",
        game = "Fight on a Baseplate",
        url = "https://raw.githubusercontent.com/fungamer1234/Voidz-Baseplate/main/VOIDZ_BASEPLATE.lua",
        color = Color3.fromRGB(255, 80, 80),
    },
}

-- ═══════════════════════════════════════════════════════════════
-- THEME
-- ═══════════════════════════════════════════════════════════════
local C = {
    bg      = Color3.fromRGB(18, 18, 24),
    bg2     = Color3.fromRGB(24, 24, 32),
    card    = Color3.fromRGB(30, 30, 42),
    cardHov = Color3.fromRGB(38, 38, 52),
    accent  = Color3.fromRGB(140, 70, 255),
    accent2 = Color3.fromRGB(180, 100, 255),
    text    = Color3.fromRGB(235, 235, 240),
    muted   = Color3.fromRGB(140, 140, 160),
    border  = Color3.fromRGB(55, 55, 75),
    success = Color3.fromRGB(60, 200, 120),
    danger  = Color3.fromRGB(220, 50, 50),
}

-- ═══════════════════════════════════════════════════════════════
-- HELPERS
-- ═══════════════════════════════════════════════════════════════
local function corner(obj, r)
    local c = Instance.new("UICorner")
    c.CornerRadius = UDim.new(0, r or 8)
    c.Parent = obj
end

local function stroke(obj, col, th, tr)
    local s = Instance.new("UIStroke")
    s.Color = col or C.border
    s.Thickness = th or 1
    s.Transparency = tr or 0.4
    s.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    s.Parent = obj
    return s
end

local function pad(obj, t, b, l, r)
    local p = Instance.new("UIPadding")
    p.PaddingTop = UDim.new(0, t or 8)
    p.PaddingBottom = UDim.new(0, b or 8)
    p.PaddingLeft = UDim.new(0, l or 8)
    p.PaddingRight = UDim.new(0, r or 8)
    p.Parent = obj
end

local function tween(obj, props, dur, style, dir)
    local t = TweenService:Create(obj, TweenInfo.new(dur or 0.25, style or Enum.EasingStyle.Quad, dir or Enum.EasingDirection.Out), props)
    t:Play()
    return t
end

local function safeLoad(url)
    local ok, err = pcall(function()
        loadstring(game:HttpGet(url, true))()
    end)
    return ok, err
end

-- ═══════════════════════════════════════════════════════════════
-- GUI
-- ═══════════════════════════════════════════════════════════════
if game:GetService("CoreGui"):FindFirstChild("THE_VOIDZ") then
    pcall(function() game:GetService("CoreGui"):FindFirstChild("THE_VOIDZ"):Destroy() end)
    task.wait(0.1)
end

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "THE_VOIDZ"
screenGui.ResetOnSpawn = false
screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
screenGui.Parent = game:GetService("CoreGui")

-- Main frame
local Main = Instance.new("Frame")
Main.Size = UDim2.new(0, 480, 0, 620)
Main.Position = UDim2.new(0.5, -240, 0.5, -310)
Main.BackgroundColor3 = C.bg
Main.BorderSizePixel = 0
Main.ClipsDescendants = true
Main.Parent = screenGui
corner(Main, 14)
stroke(Main, C.accent, 1.2, 0.25)

-- Glow accent bar at top
local GlowBar = Instance.new("Frame")
GlowBar.Size = UDim2.new(1, 0, 0, 3)
GlowBar.Position = UDim2.new(0, 0, 0, 0)
GlowBar.BackgroundColor3 = C.accent
GlowBar.BorderSizePixel = 0
GlowBar.Parent = Main

-- Header
local Header = Instance.new("Frame")
Header.Size = UDim2.new(1, 0, 0, 56)
Header.Position = UDim2.new(0, 0, 0, 3)
Header.BackgroundColor3 = C.bg2
Header.BorderSizePixel = 0
Header.ClipsDescendants = true
Header.Parent = Main
corner(Header, 14)

local TitleLabel = Instance.new("TextLabel")
TitleLabel.Size = UDim2.new(1, -60, 0, 30)
TitleLabel.Position = UDim2.new(0, 16, 0, 4)
TitleLabel.BackgroundTransparency = 1
TitleLabel.Text = "THE VOIDZ"
TitleLabel.Font = Enum.Font.GothamBlack
TitleLabel.TextSize = 20
TitleLabel.TextColor3 = C.accent
TitleLabel.TextXAlignment = Enum.TextXAlignment.Left
TitleLabel.Parent = Header

local SubtitleLabel = Instance.new("TextLabel")
SubtitleLabel.Size = UDim2.new(1, -60, 0, 16)
SubtitleLabel.Position = UDim2.new(0, 16, 0, 32)
SubtitleLabel.BackgroundTransparency = 1
SubtitleLabel.Text = "Script Launcher  |  RightShift to toggle"
SubtitleLabel.Font = Enum.Font.Gotham
SubtitleLabel.TextSize = 10
SubtitleLabel.TextColor3 = C.muted
SubtitleLabel.TextXAlignment = Enum.TextXAlignment.Left
SubtitleLabel.Parent = Header

-- Close button
local CloseBtn = Instance.new("TextButton")
CloseBtn.Size = UDim2.new(0, 28, 0, 28)
CloseBtn.Position = UDim2.new(1, -38, 0, 14)
CloseBtn.BackgroundColor3 = C.danger
CloseBtn.Text = "X"
CloseBtn.Font = Enum.Font.GothamBold
CloseBtn.TextSize = 12
CloseBtn.TextColor3 = C.text
CloseBtn.BorderSizePixel = 0
CloseBtn.Parent = Header
corner(CloseBtn, 8)

-- Scroll area
local Scroll = Instance.new("ScrollingFrame")
Scroll.Size = UDim2.new(1, -20, 1, -72)
Scroll.Position = UDim2.new(0, 10, 0, 64)
Scroll.BackgroundTransparency = 1
Scroll.BorderSizePixel = 0
Scroll.ScrollBarThickness = 4
Scroll.ScrollBarImageColor3 = C.accent
Scroll.CanvasSize = UDim2.new(0, 0, 0, 0)
Scroll.AutomaticCanvasSize = Enum.AutomaticSize.Y
Scroll.Parent = Main

local Layout = Instance.new("UIListLayout")
Layout.Padding = UDim.new(0, 8)
Layout.SortOrder = Enum.SortOrder.LayoutOrder
Layout.Parent = Scroll

-- ═══════════════════════════════════════════════════════════════
-- STATUS TOAST
-- ═══════════════════════════════════════════════════════════════
local Toast = Instance.new("TextLabel")
Toast.Size = UDim2.new(1, -20, 0, 32)
Toast.Position = UDim2.new(0, 10, 1, -42)
Toast.BackgroundColor3 = C.card
Toast.BackgroundTransparency = 0.3
Toast.Text = ""
Toast.Font = Enum.Font.GothamMedium
Toast.TextSize = 11
Toast.TextColor3 = C.accent2
Toast.TextTransparency = 1
Toast.BorderSizePixel = 0
Toast.ZIndex = 10
Toast.Parent = Main
corner(Toast, 8)
pad(Toast, 4, 4, 10, 10)

local function showToast(msg, dur)
    Toast.Text = msg
    tween(Toast, {TextTransparency = 0}, 0.15)
    task.delay(dur or 2.5, function()
        tween(Toast, {TextTransparency = 1}, 0.3)
    end)
end

-- ═══════════════════════════════════════════════════════════════
-- SCRIPT CARDS
-- ═══════════════════════════════════════════════════════════════
local loaded = {}

for i, def in ipairs(SCRIPTS) do
    local card = Instance.new("Frame")
    card.Size = UDim2.new(1, 0, 0, 72)
    card.BackgroundColor3 = C.card
    card.BorderSizePixel = 0
    card.LayoutOrder = i
    card.Parent = Scroll
    corner(card, 10)
    stroke(card, def.color, 0.8, 0.55)

    -- Color accent stripe
    local stripe = Instance.new("Frame")
    stripe.Size = UDim2.new(0, 4, 0, 40)
    stripe.Position = UDim2.new(0, 10, 0.5, -20)
    stripe.BackgroundColor3 = def.color
    stripe.BorderSizePixel = 0
    stripe.Parent = card
    corner(stripe, 2)

    -- Script name
    local nameLabel = Instance.new("TextLabel")
    nameLabel.Size = UDim2.new(1, -100, 0, 20)
    nameLabel.Position = UDim2.new(0, 24, 0, 10)
    nameLabel.BackgroundTransparency = 1
    nameLabel.Text = def.name
    nameLabel.Font = Enum.Font.GothamBold
    nameLabel.TextSize = 13
    nameLabel.TextColor3 = C.text
    nameLabel.TextXAlignment = Enum.TextXAlignment.Left
    nameLabel.Parent = card

    -- Description
    local descLabel = Instance.new("TextLabel")
    descLabel.Size = UDim2.new(1, -100, 0, 14)
    descLabel.Position = UDim2.new(0, 24, 0, 30)
    descLabel.BackgroundTransparency = 1
    descLabel.Text = def.desc
    descLabel.Font = Enum.Font.Gotham
    descLabel.TextSize = 10
    descLabel.TextColor3 = C.muted
    descLabel.TextXAlignment = Enum.TextXAlignment.Left
    descLabel.TextTruncate = Enum.TextTruncate.AtEnd
    descLabel.Parent = card

    -- Game tag
    local tag = Instance.new("TextLabel")
    tag.Size = UDim2.new(0, 0, 0, 14)
    tag.Position = UDim2.new(0, 24, 0, 48)
    tag.AutomaticSize = Enum.AutomaticSize.X
    tag.BackgroundColor3 = def.color
    tag.BackgroundTransparency = 0.8
    tag.Text = "  " .. def.game .. "  "
    tag.Font = Enum.Font.GothamMedium
    tag.TextSize = 8
    tag.TextColor3 = def.color
    tag.BorderSizePixel = 0
    tag.Parent = card
    corner(tag, 4)

    -- Execute button
    local execBtn = Instance.new("TextButton")
    execBtn.Size = UDim2.new(0, 70, 0, 32)
    execBtn.Position = UDim2.new(1, -84, 0.5, -16)
    execBtn.BackgroundColor3 = loaded[def.name] and C.success or def.color
    execBtn.Text = loaded[def.name] and "RUNNING" or "EXECUTE"
    execBtn.Font = Enum.Font.GothamBold
    execBtn.TextSize = 10
    execBtn.TextColor3 = C.text
    execBtn.BorderSizePixel = 0
    execBtn.Parent = card
    corner(execBtn, 8)

    -- Copy loadstring button
    local copyBtn = Instance.new("TextButton")
    copyBtn.Size = UDim2.new(0, 42, 0, 32)
    copyBtn.Position = UDim2.new(1, -120, 0.5, -16)
    copyBtn.BackgroundColor3 = C.card
    copyBtn.BackgroundTransparency = 0.6
    copyBtn.Text = ""
    copyBtn.BorderSizePixel = 0
    copyBtn.Parent = card
    corner(copyBtn, 8)

    local copyIcon = Instance.new("TextLabel")
    copyIcon.Size = UDim2.new(1, 0, 1, 0)
    copyIcon.BackgroundTransparency = 1
    copyIcon.Text = "COPY"
    copyIcon.Font = Enum.Font.GothamBold
    copyIcon.TextSize = 8
    copyIcon.TextColor3 = C.muted
    copyIcon.Parent = copyBtn

    -- Hover effects
    card.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement then
            tween(card, {BackgroundColor3 = C.cardHov}, 0.15)
        end
    end)
    card.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement then
            tween(card, {BackgroundColor3 = C.card}, 0.15)
        end
    end)

    -- Execute
    execBtn.MouseButton1Click:Connect(function()
        if loaded[def.name] then
            showToast(def.name .. " already running", 2)
            return
        end
        execBtn.Text = "LOADING..."
        tween(execBtn, {BackgroundColor3 = C.muted}, 0.15)
        showToast("Loading " .. def.name .. "...", 3)

        task.spawn(function()
            local ok, err = safeLoad(def.url)
            if ok then
                loaded[def.name] = true
                execBtn.Text = "RUNNING"
                tween(execBtn, {BackgroundColor3 = C.success}, 0.2)
                showToast(def.name .. " loaded", 2.5)
            else
                execBtn.Text = "FAILED"
                tween(execBtn, {BackgroundColor3 = C.danger}, 0.2)
                showToast("Failed: " .. tostring(err):sub(1, 50), 3)
                task.delay(2, function()
                    execBtn.Text = "EXECUTE"
                    tween(execBtn, {BackgroundColor3 = def.color}, 0.2)
                end)
            end
        end)
    end)

    -- Copy loadstring
    copyBtn.MouseButton1Click:Connect(function()
        local ls = 'loadstring(game:HttpGet("' .. def.url .. '", true))()'
        if setclipboard then
            setclipboard(ls)
            showToast("Loadstring copied — " .. def.name, 2)
        else
            showToast("Clipboard not available", 2)
        end
    end)
end

-- ═══════════════════════════════════════════════════════════════
-- DRAG
-- ═══════════════════════════════════════════════════════════════
do
    local dragging, dragStart, startPos
    Main.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            dragStart = input.Position
            startPos = Main.Position
        end
    end)
    Main.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = false
        end
    end)
    UIS.InputChanged:Connect(function(input)
        if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
            local delta = input.Position - dragStart
            Main.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
        end
    end)
end

-- ═══════════════════════════════════════════════════════════════
-- TOGGLE (RightShift)
-- ═══════════════════════════════════════════════════════════════
local visible = true
UIS.InputBegan:Connect(function(input, processed)
    if processed then return end
    if input.KeyCode == Enum.KeyCode.RightShift then
        visible = not visible
        Main.Visible = visible
    end
end)

CloseBtn.MouseButton1Click:Connect(function()
    visible = false
    Main.Visible = false
end)

-- Entry animation
Main.Size = UDim2.new(0, 480, 0, 0)
Main.BackgroundTransparency = 0.3
tween(Main, {Size = UDim2.new(0, 480, 0, 620), BackgroundTransparency = 0}, 0.35, Enum.EasingStyle.Back)
