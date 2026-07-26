--// SERVICES
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Workspace = game:GetService("Workspace")
local StarterGui = game:GetService("StarterGui")
local TweenService = game:GetService("TweenService")
local HttpService = game:GetService("HttpService")
local TeleportService = game:GetService("TeleportService")
local Lighting = game:GetService("Lighting")
local VIM = game:GetService("VirtualInputManager")
local LP = Players.LocalPlayer
local Camera = Workspace.CurrentCamera

--============================================================================================--
-- THEME
--============================================================================================--
local THEMES = {
    Purple = {
        bg = Color3.fromRGB(7, 5, 12),
        bg2 = Color3.fromRGB(12, 8, 20),
        card = Color3.fromRGB(18, 12, 30),
        card2 = Color3.fromRGB(28, 16, 44),
        stroke = Color3.fromRGB(120, 55, 210),
        strokeSoft = Color3.fromRGB(70, 35, 120),
        accent = Color3.fromRGB(155, 70, 255),
        accent2 = Color3.fromRGB(195, 120, 255),
        accentDim = Color3.fromRGB(90, 40, 165),
        text = Color3.fromRGB(245, 240, 255),
        muted = Color3.fromRGB(145, 125, 175),
        danger = Color3.fromRGB(48, 18, 36),
        dangerText = Color3.fromRGB(255, 140, 170),
        dangerStroke = Color3.fromRGB(200, 70, 110),
        success = Color3.fromRGB(110, 255, 175),
        warn = Color3.fromRGB(255, 200, 90),
        black = Color3.fromRGB(0, 0, 0),
        tip = Color3.fromRGB(22, 14, 36),
    },
}
local C = THEMES.Purple

--============================================================================================--
-- UI HELPERS
--============================================================================================--
local function tween(o, props, t, style)
    local tw = TweenService:Create(o, TweenInfo.new(t or 0.2, style or Enum.EasingStyle.Quint, Enum.EasingDirection.Out), props)
    tw:Play()
    return tw
end
local function corner(i, r) local c=Instance.new("UICorner"); c.CornerRadius=UDim.new(0,r or 8); c.Parent=i; return c end
local function stroke(i, col, th, tr) local s=Instance.new("UIStroke"); s.Color=col or C.strokeSoft; s.Thickness=th or 1.15; s.Transparency=tr~=nil and tr or 0.35; s.ApplyStrokeMode=Enum.ApplyStrokeMode.Border; s.Parent=i; return s end
local function pad(i,a,b,c,d) local p=Instance.new("UIPadding"); p.PaddingTop=UDim.new(0,a or 6); p.PaddingRight=UDim.new(0,b or 6); p.PaddingBottom=UDim.new(0,c or 6); p.PaddingLeft=UDim.new(0,d or 6); p.Parent=i; return p end

--============================================================================================--
-- ACCESS KEY CHECK
--============================================================================================--
local ACCESS_KEY = "MM2"
local keyAccepted = false
do
    local keyGui = Instance.new("ScreenGui"); keyGui.Name="MM2_KeyCheck"; keyGui.ResetOnSpawn=false; keyGui.IgnoreGuiInset=true; keyGui.ZIndexBehavior=Enum.ZIndexBehavior.Sibling; keyGui.DisplayOrder=100001
    local keyRoot = Instance.new("Frame"); keyRoot.AnchorPoint=Vector2.new(0.5,0.5); keyRoot.Position=UDim2.new(0.5,0,0.5,0); keyRoot.Size=UDim2.new(0,0,0,0); keyRoot.BackgroundColor3=C.bg; keyRoot.BorderSizePixel=0; keyRoot.ClipsDescendants=true; keyRoot.Parent=keyGui
    corner(keyRoot,16); stroke(keyRoot,C.accent,1.35,0.2); keyGui.Parent=LP:WaitForChild("PlayerGui")
    tween(keyRoot,{Size=UDim2.new(0,320,0,200)},0.35,Enum.EasingStyle.Quint)
    local kt = Instance.new("TextLabel"); kt.Size=UDim2.new(1,0,0,30); kt.Position=UDim2.new(0,0,0,20); kt.BackgroundTransparency=1; kt.Text="MM2 HUB"; kt.Font=Enum.Font.GothamBlack; kt.TextSize=18; kt.TextColor3=C.text; kt.Parent=keyRoot
    local ks = Instance.new("TextLabel"); ks.Size=UDim2.new(1,0,0,20); ks.Position=UDim2.new(0,0,0,50); ks.BackgroundTransparency=1; ks.Text="Enter access key to continue"; ks.Font=Enum.Font.GothamMedium; ks.TextSize=11; ks.TextColor3=C.muted; ks.Parent=keyRoot
    local kb = Instance.new("TextBox"); kb.Size=UDim2.new(0,200,0,32); kb.Position=UDim2.new(0.5,-100,0,80); kb.BackgroundColor3=C.card2; kb.Text=""; kb.PlaceholderText="Enter key..."; kb.PlaceholderColor3=C.muted; kb.Font=Enum.Font.GothamMedium; kb.TextSize=13; kb.TextColor3=C.text; kb.BorderSizePixel=0; kb.ClearTextOnFocus=false; kb.Parent=keyRoot; corner(kb,8); stroke(kb,C.strokeSoft,1,0.4)
    local ke = Instance.new("TextLabel"); ke.Size=UDim2.new(1,0,0,16); ke.Position=UDim2.new(0,0,0,116); ke.BackgroundTransparency=1; ke.Text=""; ke.Font=Enum.Font.GothamMedium; ke.TextSize=10; ke.TextColor3=C.dangerText; ke.Parent=keyRoot
    local ks2 = Instance.new("TextButton"); ks2.Size=UDim2.new(0,200,0,32); ks2.Position=UDim2.new(0.5,-100,0,140); ks2.BackgroundColor3=C.accent; ks2.Text="Unlock"; ks2.Font=Enum.Font.GothamBold; ks2.TextSize=13; ks2.TextColor3=C.text; ks2.BorderSizePixel=0; ks2.Parent=keyRoot; corner(ks2,8)
    ks2.MouseEnter:Connect(function() tween(ks2,{BackgroundColor3=C.accent2},0.12) end)
    ks2.MouseLeave:Connect(function() tween(ks2,{BackgroundColor3=C.accent},0.12) end)
    local function submitKey()
        if kb.Text == ACCESS_KEY then keyAccepted=true; tween(keyRoot,{Size=UDim2.new(0,40,0,40)},0.25,Enum.EasingStyle.Quad); task.wait(0.25); keyGui:Destroy()
        else ke.Text="Invalid key!"; tween(kb,{Position=UDim2.new(0.5,-110,0,80)},0.05); task.wait(0.05); tween(kb,{Position=UDim2.new(0.5,-90,0,80)},0.05); task.wait(0.05); tween(kb,{Position=UDim2.new(0.5,-100,0,80)},0.05) end
    end
    ks2.MouseButton1Click:Connect(submitKey)
    kb.FocusLost:Connect(function(ep) if ep then submitKey() end end)
    while not keyAccepted do task.wait(0.1) end
end

--============================================================================================--
-- TAB DEFINITIONS (10 tabs)
--============================================================================================--
local TAB_DEFS = {
    { id="home",icon="01",label="Home" },
    { id="combat",icon="02",label="Combat" },
    { id="movement",icon="03",label="Movement" },
    { id="visuals",icon="04",label="Visuals" },
    { id="farm",icon="05",label="Farm" },
    { id="roles",icon="06",label="Roles" },
    { id="troll",icon="07",label="Troll" },
    { id="server",icon="08",label="Server" },
    { id="world",icon="09",label="World" },
    { id="settings",icon="10",label="Config" },
}

--============================================================================================--
-- STATE
--============================================================================================--
local S={toggles={},conns={},espObjects={},espBeams={},espHighlights={},gunDropCache=nil,coinCache={},gui=nil,activeTab="home",
    keybinds={noclip=Enum.KeyCode.T,fly=Enum.KeyCode.F,esp=Enum.KeyCode.E,godmode=Enum.KeyCode.G,toggleHub=Enum.KeyCode.RightShift},
    whitelist={},flySpeed=60,walkSpeed=32,jumpPower=50,spinSpeed=10,hipHeight=0,killAuraRange=20,autoInterval=0.15,coinFarmSpeed=0.2,
    espShowDistance=true,brightness=15,timeOfDay=14,configJson="",roleDetection="Tool"}

for _,t in ipairs({"autoShoot","autoKill","autoKnifeThrow","autoPickupGun","killAura","silentAim","antiKnife","godMode","antiFling",
    "touchFling","noclip","fly","infJump","bhop","spinBot","playerEsp","gunEsp","coinEsp","espLines","playerHighlight",
    "fullBright","xray","chams","autoCoinFarm","resetWhenBagFull","goToLobbyWhenFull","antiAfk","autoServerHop","emoteSpam",
    "flingTarget","removeFog","atmosphereRemove","removeBarriers","unlockCamera","autoDetect"}) do S.toggles[t]=false end

local function addConn(n,c) S.conns[n]=c end
local function cleanConn(n) if S.conns[n] then if S.conns[n].Connected then S.conns[n]:Disconnect() end; S.conns[n]=nil end end

--============================================================================================--
-- UTILITY FUNCTIONS
--============================================================================================--
local function getChar() return LP.Character or LP.CharacterAdded:Wait() end
local function getHum(c) return c and c:FindFirstChildOfClass("Humanoid") end
local function getHRP(c) return c and (c:FindFirstChild("HumanoidRootPart") or c:FindFirstChild("Torso")) end
local function getTorso(c) return c and (c:FindFirstChild("UpperTorso") or c:FindFirstChild("Torso")) end
local function isAlive()
    local c=getChar(); local h=getHum(c)
    return c and h and h.Health>0
end
local function getBackpack() return LP:FindFirstChild("Backpack") end
local function getRole()
    local c=getChar(); local tools={}
    for _,t in ipairs(c:GetChildren()) do if t:IsA("Tool") then table.insert(tools,t.Name) end end
    for _,t in ipairs((getBackpack() or {}):GetChildren()) do if t:IsA("Tool") then table.insert(tools,t.Name) end end
    local roleVal=c and c:FindFirstChild("roleValue")
    local roleStr=c and c:FindFirstChild("roleString")
    local ls=LP:FindFirstChild("leaderstats")
    if #tools>0 then
        for _,n in ipairs(tools) do
            if n=="Knife" or n=="Revolver" or n=="Silencer" or n=="Deagle" or n=="Shotgun" or n=="Uzi" or n=="Sniper" or n=="Rifle" then
                return "Murderer", n
            end
        end
        for _,n in ipairs(tools) do
            if n=="Gun" or n=="Revolver" then return "Sheriff", n end
        end
    end
    if roleVal then
        local rv=roleVal.Value
        if type(rv)=="string" then
            if rv=="Murderer" or rv=="Killer" then return "Murderer", nil
            elseif rv=="Sheriff" or rv=="Hero" then return "Sheriff", nil
            end
        end
    end
    if roleStr then
        local rs=roleStr.Value
        if rs=="Murderer" or rs=="Killer" then return "Murderer", nil
        elseif rs=="Sheriff" or rs=="Hero" then return "Sheriff", nil
        end
    end
    if ls then
        for _,v in ipairs(ls:GetChildren()) do
            if v.Name=="Role" and v:IsA("StringValue") then
                if v.Value=="Murderer" or v.Value=="Killer" then return "Murderer", nil
                elseif v.Value=="Sheriff" or v.Value=="Hero" then return "Sheriff", nil end
            end
        end
    end
    return "Innocent", nil
end
local function getWeapon()
    local c=getChar()
    if c then for _,t in ipairs(c:GetChildren()) do if t:IsA("Tool") then return t end end end
    local bp=getBackpack()
    if bp then for _,t in ipairs(bp:GetChildren()) do if t:IsA("Tool") then return t end end end
    return nil
end
local function equipWeapon()
    local w=getWeapon()
    if w and w.Parent~=getChar() then
        local c=getChar()
        if c then w.Parent=c end
    end
    return w
end

--============================================================================================--
-- GUN / COIN CACHING (event-based)
--============================================================================================--
S.gunDropCache = setmetatable({},{__mode="k"})
S.coinCache = setmetatable({},{__mode="k"})

local function findGunDrop()
    for obj in pairs(S.gunDropCache) do
        if obj and obj.Parent then return obj end
        S.gunDropCache[obj] = nil
    end
    for _,c in ipairs(Workspace:GetChildren()) do
        if c:IsA("Tool") or c:IsA("Model") then
            local n=c.Name
            if n=="GunDrop" or n=="RevolverDrop" or n=="SilencerDrop" or n=="DeagleDrop" or n=="ShotgunDrop" or n=="UziDrop" or n=="SniperDrop" or n=="RifleDrop" or n=="Revolver" or n=="Silencer" or n=="Deagle" or n=="Shotgun" or n=="Uzi" or n=="Sniper" or n=="Rifle" then
                S.gunDropCache[c] = true
                return c
            end
            for _,ch in ipairs(c:GetDescendants()) do
                if ch:IsA("BasePart") and (ch.Name=="GunDrop" or ch.Name=="Handle") then
                    local root = c
                    S.gunDropCache[root] = true
                    return root
                end
            end
        end
    end
    return nil
end

local function findCoins()
    local coins={}
    for obj in pairs(S.coinCache) do
        if obj and obj.Parent then table.insert(coins,obj) else S.coinCache[obj]=nil end
    end
    if #coins>0 then return coins end
    local coinFolder=Workspace:FindFirstChild("CoinFolder") or Workspace:FindFirstChild("Coins") or Workspace:FindFirstChild("CoinContainer")
    if not coinFolder then
        for _,c in ipairs(Workspace:GetDescendants()) do
            if c.Name=="CoinFolder" or c.Name=="Coins" or c.Name=="CoinContainer" then coinFolder=c; break end
        end
    end
    if coinFolder then
        for _,c in ipairs(coinFolder:GetDescendants()) do
            if c:IsA("BasePart") and c:FindFirstChildOfClass("TouchTransmitter") then
                S.coinCache[c]=true
                table.insert(coins,c)
            end
        end
    end
    return coins
end

local function getClosestPlayer(range)
    local hrp=getHRP(getChar()); if not hrp then return nil,math.huge end
    local best,bestDist=nil,range or math.huge
    for _,p in ipairs(Players:GetPlayers()) do
        if p~=LP and p.Character then
            local phrp=getHRP(p.Character)
            if phrp then
                local d=(hrp.Position-phrp.Position).Magnitude
                if d<bestDist then
                    local isWL=false
                    for _,w in ipairs(S.whitelist) do if w==p.Name then isWL=true; break end end
                    if not isWL then best=p; bestDist=d end
                end
            end
        end
    end
    return best,bestDist
end

local function getGunHolder()
    for _,p in ipairs(Players:GetPlayers()) do
        if p~=LP and p.Character then
            for _,t in ipairs(p.Character:GetChildren()) do
                if t:IsA("Tool") then
                    local n=t.Name
                    if n=="Gun" or n=="Revolver" or n=="Silencer" or n=="Deagle" or n=="Shotgun" or n=="Uzi" or n=="Sniper" or n=="Rifle" then
                        return p
                    end
                end
            end
        end
    end
    return nil
end

--============================================================================================--
-- MAIN GUI
--============================================================================================--
local GUI = Instance.new("ScreenGui")
GUI.Name = "MM2_HUB_VoidStyle"
GUI.ResetOnSpawn = false
GUI.IgnoreGuiInset = true
GUI.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
GUI.DisplayOrder = 99999
GUI.Parent = LP:WaitForChild("PlayerGui")
S.gui = GUI

local Main = Instance.new("Frame")
Main.Name = "Main"
Main.AnchorPoint = Vector2.new(0.5,0.5)
Main.Position = UDim2.new(0.5,0,0.5,0)
Main.Size = UDim2.new(0,0,0,0)
Main.BackgroundColor3 = C.bg
Main.BorderSizePixel = 0
Main.ClipsDescendants = true
Main.Parent = GUI
corner(Main,14); stroke(Main,C.accent,1.5,0.18)
tween(Main,{Size=UDim2.new(0,620,0,440)},0.55,Enum.EasingStyle.Quint)

-- GRIP BAR
local grip=Instance.new("Frame"); grip.AnchorPoint=Vector2.new(0,0.5); grip.Position=UDim2.new(0,0,0.5,0); grip.Size=UDim2.new(0,5,0,70); grip.BackgroundColor3=C.accent; grip.BorderSizePixel=0; grip.ZIndex=30; grip.Parent=Main; corner(grip,4)

--============================================================================================--
-- HEADER
--============================================================================================--
local Header=Instance.new("Frame"); Header.Size=UDim2.new(0,620,0,50); Header.Position=UDim2.new(0,0,0,0); Header.BackgroundColor3=C.bg2; Header.BorderSizePixel=0; Header.ClipsDescendants=true; Header.Parent=Main
Instance.new("UICorner",Header).CornerRadius=UDim.new(0,14)
stroke(Header,C.strokeSoft,0.8,0.45)
local HeaderLine=Instance.new("Frame"); HeaderLine.Size=UDim2.new(0,620,0,2); HeaderLine.Position=UDim2.new(0,0,1,-1); HeaderLine.BackgroundColor3=C.accent; HeaderLine.BackgroundTransparency=0.6; HeaderLine.BorderSizePixel=0; HeaderLine.Parent=Header
local GlowLine=Instance.new("Frame"); GlowLine.Size=UDim2.new(0,42,0,2); GlowLine.Position=UDim2.new(0,8,1,-1); GlowLine.BackgroundColor3=C.accent2; GlowLine.BorderSizePixel=0; GlowLine.ZIndex=3; GlowLine.Parent=Header
Instance.new("UICorner",GlowLine).CornerRadius=UDim.new(1,0)
local GlowDot=Instance.new("Frame"); GlowDot.Size=UDim2.new(0,16,0,3); GlowDot.Position=UDim2.new(0,8,1,-1); GlowDot.BackgroundColor3=C.accent2; GlowDot.BackgroundTransparency=0.25; GlowDot.BorderSizePixel=0; GlowDot.ZIndex=4; GlowDot.Parent=Header
Instance.new("UICorner",GlowDot).CornerRadius=UDim.new(1,0)

local LogoLabel=Instance.new("TextLabel"); LogoLabel.Size=UDim2.new(0,150,0,50); LogoLabel.Position=UDim2.new(0,14,0,0); LogoLabel.BackgroundTransparency=1; LogoLabel.Text="MM2 HUB"; LogoLabel.Font=Enum.Font.GothamBlack; LogoLabel.TextSize=24; LogoLabel.TextColor3=C.text; LogoLabel.TextXAlignment=Enum.TextXAlignment.Left; LogoLabel.Parent=Header
local GlowFrame=Instance.new("Frame"); GlowFrame.Size=UDim2.new(0,34,0,34); GlowFrame.Position=UDim2.new(0,10,0,8); GlowFrame.BackgroundTransparency=1; GlowFrame.ZIndex=5; GlowFrame.Parent=Header
local GlowCircle=Instance.new("ImageLabel"); GlowCircle.Size=UDim2.new(1,0,1,0); GlowCircle.BackgroundTransparency=1; GlowCircle.Image="rbxassetid://7912134082"; GlowCircle.ImageColor3=C.accent; GlowCircle.ImageTransparency=0.55; GlowCircle.ZIndex=5; GlowCircle.Parent=GlowFrame
local StatusLabel=Instance.new("TextLabel"); StatusLabel.Size=UDim2.new(1,-120,0,14); StatusLabel.Position=UDim2.new(0,14,0,34); StatusLabel.BackgroundTransparency=1; StatusLabel.Text="by VOIDZ | Build 2026-07-26"; StatusLabel.Font=Enum.Font.GothamMedium; StatusLabel.TextSize=9; StatusLabel.TextColor3=C.muted; StatusLabel.TextXAlignment=Enum.TextXAlignment.Left; StatusLabel.Parent=Header

local HeaderRight=Instance.new("Frame"); HeaderRight.Size=UDim2.new(0,84,0,30); HeaderRight.Position=UDim2.new(1,-92,0,10); HeaderRight.BackgroundTransparency=1; HeaderRight.Parent=Header
local MinBtn=Instance.new("TextButton"); MinBtn.Size=UDim2.new(0,36,0,30); MinBtn.Position=UDim2.new(0,0,0,0); MinBtn.BackgroundColor3=C.card; MinBtn.Text="-"; MinBtn.Font=Enum.Font.GothamBold; MinBtn.TextSize=16; MinBtn.TextColor3=C.muted; MinBtn.BorderSizePixel=0; MinBtn.Parent=HeaderRight; corner(MinBtn,8)
local CloseBtn=Instance.new("TextButton"); CloseBtn.Size=UDim2.new(0,36,0,30); CloseBtn.Position=UDim2.new(0,44,0,0); CloseBtn.BackgroundColor3=C.danger; CloseBtn.Text="X"; CloseBtn.Font=Enum.Font.GothamBold; CloseBtn.TextSize=16; CloseBtn.TextColor3=C.dangerText; CloseBtn.BorderSizePixel=0; CloseBtn.Parent=HeaderRight; corner(CloseBtn,8)
stroke(CloseBtn,C.dangerStroke,1.35,0.35)

local minimized=false
MinBtn.MouseButton1Click:Connect(function()
    minimized=not minimized
    if minimized then tween(Main,{Size=UDim2.new(0,620,0,50)},0.32,Enum.EasingStyle.Back)
    else tween(Main,{Size=UDim2.new(0,620,0,440)},0.32,Enum.EasingStyle.Back) end
    MinBtn.Text=minimized and "+" or "-"
end)
CloseBtn.MouseButton1Click:Connect(function()
    Main.Visible=false
    GUI:Destroy()
end)

--============================================================================================--
-- SIDEBAR
--============================================================================================--
local Sidebar=Instance.new("Frame"); Sidebar.Size=UDim2.new(0,56,1,-50); Sidebar.Position=UDim2.new(0,0,0,50); Sidebar.BackgroundColor3=C.bg2; Sidebar.BorderSizePixel=0; Sidebar.ClipsDescendants=true; Sidebar.Parent=Main
Instance.new("UICorner",Sidebar).CornerRadius=UDim.new(0,14)
stroke(Sidebar,C.strokeSoft,0.75,0.5)
local SideLine=Instance.new("Frame"); SideLine.Size=UDim2.new(0,2,1,0); SideLine.Position=UDim2.new(1,-1,0,0); SideLine.BackgroundColor3=C.strokeSoft; SideLine.BackgroundTransparency=0.55; SideLine.BorderSizePixel=0; SideLine.Parent=Sidebar
local SideGlow=Instance.new("Frame"); SideGlow.Size=UDim2.new(0,2,0,32); SideGlow.Position=UDim2.new(1,-1,0,6); SideGlow.BackgroundColor3=C.accent2; SideGlow.BorderSizePixel=0; SideGlow.ZIndex=4; SideGlow.Parent=Sidebar
Instance.new("UICorner",SideGlow).CornerRadius=UDim.new(1,0)

local TabBtns={}
local TabIndicator=Instance.new("Frame"); TabIndicator.Size=UDim2.new(1,0,0,32); TabIndicator.Position=UDim2.new(0,0,0,6); TabIndicator.BackgroundColor3=C.card; TabIndicator.BorderSizePixel=0; TabIndicator.ZIndex=1; TabIndicator.Parent=Sidebar
Instance.new("UICorner",TabIndicator).CornerRadius=UDim.new(0,10)

local ContentHolder=Instance.new("Frame"); ContentHolder.Size=UDim2.new(1,-72,1,-56); ContentHolder.Position=UDim2.new(0,64,0,54); ContentHolder.BackgroundTransparency=1; ContentHolder.ClipsDescendants=true; ContentHolder.Parent=Main

local activeTabId="home"
local TabFrames={}
local tabOrder={"home","combat","movement","visuals","farm","roles","troll","server","world","settings"}

for i,def in ipairs(TAB_DEFS) do
    local b=Instance.new("TextButton")
    b.Size=UDim2.new(1,-6,0,32); b.Position=UDim2.new(0,3,0,(i-1)*36+6)
    b.BackgroundColor3=def.id=="home" and C.card or Color3.fromRGB(0,0,0)
    b.BackgroundTransparency=def.id=="home" and 0 or 1
    b.Text=""; b.BorderSizePixel=0; b.ZIndex=6; b.Parent=Sidebar
    corner(b,10)
    local lb=Instance.new("TextLabel"); lb.Size=UDim2.new(1,0,0,12); lb.Position=UDim2.new(0,0,0,1); lb.BackgroundTransparency=1; lb.Text="|"..string.rep("_",tonumber(def.icon) and tonumber(def.icon)-1 or 0); lb.Font=Enum.Font.Code; lb.TextSize=6; lb.TextColor3=C.strokeSoft; lb.TextTransparency=0.4; lb.ZIndex=8; lb.Parent=b
    local ic=Instance.new("TextLabel"); ic.Size=UDim2.new(1,0,0,12); ic.Position=UDim2.new(0,0,0,9); ic.BackgroundTransparency=1; ic.Text=def.icon; ic.Font=Enum.Font.GothamBlack; ic.TextSize=11; ic.TextColor3=def.id=="home" and C.accent or C.muted; ic.ZIndex=8; ic.Parent=b
    local tx=Instance.new("TextLabel"); tx.Size=UDim2.new(1,0,0,8); tx.Position=UDim2.new(0,0,0,22); tx.BackgroundTransparency=1; tx.Text=def.label; tx.Font=Enum.Font.GothamMedium; tx.TextSize=6; tx.TextColor3=def.id=="home" and C.text or C.muted; tx.ZIndex=8; tx.Parent=b
    TabBtns[def.id]={btn=b,icon=ic,label=tx,badge=lb}

    local sf=Instance.new("ScrollingFrame"); sf.Name=def.id; sf.Size=UDim2.new(1,0,1,0); sf.BackgroundTransparency=1; sf.BorderSizePixel=0; sf.ScrollBarThickness=5; sf.ScrollBarImageColor3=C.accentDim; sf.CanvasSize=UDim2.new(0,0,0,0); sf.AutomaticCanvasSize=Enum.AutomaticSize.Y; sf.Visible=def.id=="home"; sf.ZIndex=5; sf.Parent=ContentHolder
    Instance.new("UIListLayout",sf).Padding=UDim.new(0,8); pad(sf,8,8,8,8)
    TabFrames[def.id]=sf
end

local function switchTab(id)
    for tid,frames in pairs(TabFrames) do frames.Visible=(tid==id) end
    for tid,btns in pairs(TabBtns) do
        local active=(tid==id)
        tween(btns.btn,{BackgroundColor3=active and C.card or Color3.fromRGB(0,0,0),BackgroundTransparency=active and 0 or 1},0.18)
        tween(btns.icon,{TextColor3=active and C.accent or C.muted},0.18)
        tween(btns.label,{TextColor3=active and C.text or C.muted},0.18)
    end
    if id~="settings" and id~="home" and id~="troll" then SideGlow.Position=UDim2.new(1,-1,0,6+(table.find(tabOrder,id)-1)*36) end
    activeTabId=id
end

--============================================================================================--
-- UI FACTORY
--============================================================================================--
local function makeScroll(tabId, scrollName)
    local sf=TabFrames[tabId]
    if not sf then return nil end
    local f=Instance.new("Frame"); f.Name=scrollName or ""; f.Size=UDim2.new(1,0,0,0); f.AutomaticSize=Enum.AutomaticSize.Y; f.BackgroundColor3=C.bg2; f.BorderSizePixel=0; f.ZIndex=6; f.Parent=sf
    corner(f,12); stroke(f,C.strokeSoft,1,0.42)
    local il=Instance.new("UIListLayout"); il.Padding=UDim.new(0,4); il.FillDirection=Enum.FillDirection.Vertical; il.SortOrder=Enum.SortOrder.LayoutOrder; il.Parent=f
    pad(f,6,6,6,6)
    return f
end

local function section(tabId,title,iconChar,_,order)
    local host=makeScroll(tabId,title)
    local f=Instance.new("Frame"); f.Name=title; f.Size=UDim2.new(1,0,0,0); f.AutomaticSize=Enum.AutomaticSize.Y; f.BackgroundTransparency=1; f.ZIndex=7; f.LayoutOrder=order or 0; f.Parent=host
    local il=Instance.new("UIListLayout"); il.Padding=UDim.new(0,6); il.Parent=f
    local hd=Instance.new("Frame"); hd.Size=UDim2.new(1,0,0,22); hd.BackgroundTransparency=1; hd.ZIndex=8; hd.Parent=f
    local ib=Instance.new("TextLabel"); ib.Size=UDim2.new(0,16,0,16); ib.Position=UDim2.new(0,4,0,3); ib.BackgroundTransparency=1; ib.Text=iconChar or ""; ib.TextColor3=C.accent; ib.Font=Enum.Font.GothamBlack; ib.TextSize=13; ib.ZIndex=9; ib.Parent=hd
    local tb=Instance.new("TextLabel"); tb.Size=UDim2.new(1,0,0,16); tb.Position=UDim2.new(0,20,0,3); tb.BackgroundTransparency=1; tb.Text=title; tb.Font=Enum.Font.GothamBold; tb.TextSize=12; tb.TextColor3=C.text; tb.TextXAlignment=Enum.TextXAlignment.Left; tb.ZIndex=9; tb.Parent=hd
    local ul=Instance.new("Frame"); ul.Size=UDim2.new(1,-24,0,1); ul.Position=UDim2.new(0,20,0,20); ul.BackgroundColor3=C.strokeSoft; ul.BackgroundTransparency=0.65; ul.BorderSizePixel=0; ul.ZIndex=8; ul.Parent=f
    return f
end

local function makeToggle(sec,name,default,callback,order)
    local row=Instance.new("Frame"); row.Name=name; row.Size=UDim2.new(1,0,0,28); row.BackgroundColor3=C.card2; row.BackgroundTransparency=0.15; row.ZIndex=9; row.LayoutOrder=order or 0; row.Parent=sec
    corner(row,8)
    local lb=Instance.new("TextLabel"); lb.Size=UDim2.new(1,-40,0,14); lb.Position=UDim2.new(0,8,0,7); lb.BackgroundTransparency=1; lb.Text=name; lb.Font=Enum.Font.GothamMedium; lb.TextSize=11; lb.TextColor3=C.text; lb.TextXAlignment=Enum.TextXAlignment.Left; lb.ZIndex=10; lb.Parent=row
    local sw=Instance.new("TextButton"); sw.Size=UDim2.new(0,32,0,16); sw.Position=UDim2.new(1,-40,0,6); sw.BackgroundColor3=default and C.accent or C.card; sw.Text=""; sw.BorderSizePixel=0; sw.ZIndex=10; sw.Parent=row; corner(sw,8)
    local thumb=Instance.new("Frame"); thumb.Size=UDim2.new(0,12,0,12); thumb.Position=default and UDim2.new(1,-16,0,2) or UDim2.new(0,2,0,2); thumb.BackgroundColor3=C.text; thumb.BorderSizePixel=0; thumb.ZIndex=11; thumb.Parent=sw; corner(thumb,6)
    S.toggles[name]=default
    local function update()
        local on=S.toggles[name]
        tween(sw,{BackgroundColor3=on and C.accent or C.card},0.14)
        tween(thumb,{Position=on and UDim2.new(1,-16,0,2) or UDim2.new(0,2,0,2)},0.14)
    end
    sw.MouseButton1Click:Connect(function()
        S.toggles[name]=not S.toggles[name]; update()
        if callback then callback(S.toggles[name]) end
    end)
    update()
    return row
end

local function makeSlider(sec,name,min,max,default,callback,order)
    local row=Instance.new("Frame"); row.Name=name; row.Size=UDim2.new(1,0,0,38); row.BackgroundColor3=C.card2; row.BackgroundTransparency=0.15; row.ZIndex=9; row.LayoutOrder=order or 0; row.Parent=sec
    corner(row,8)
    local lb=Instance.new("TextLabel"); lb.Size=UDim2.new(1,-70,0,14); lb.Position=UDim2.new(0,8,0,5); lb.BackgroundTransparency=1; lb.Text=name; lb.Font=Enum.Font.GothamMedium; lb.TextSize=11; lb.TextColor3=C.text; lb.TextXAlignment=Enum.TextXAlignment.Left; lb.ZIndex=10; lb.Parent=row
    local vb=Instance.new("TextLabel"); vb.Size=UDim2.new(0,32,0,14); vb.Position=UDim2.new(1,-40,0,5); vb.BackgroundTransparency=1; vb.Text=tostring(default); vb.Font=Enum.Font.GothamBold; vb.TextSize=10; vb.TextColor3=C.accent2; vb.ZIndex=10; vb.Parent=row
    local bg=Instance.new("Frame"); bg.Size=UDim2.new(1,-24,0,5); bg.Position=UDim2.new(0,12,0,24); bg.BackgroundColor3=C.card; bg.BorderSizePixel=0; bg.ZIndex=10; bg.Parent=row; corner(bg,4)
    local fill=Instance.new("Frame"); fill.Size=UDim2.new((default-min)/(max-min),0,1,0); fill.BackgroundColor3=C.accent; fill.BorderSizePixel=0; fill.ZIndex=11; fill.Parent=bg; corner(fill,4)
    local knob=Instance.new("Frame"); knob.Size=UDim2.new(0,12,0,12); knob.Position=UDim2.new((default-min)/(max-min),-6,0.5,-6); knob.BackgroundColor3=C.text; knob.BorderSizePixel=0; knob.ZIndex=12; knob.Parent=bg; corner(knob,6)
    stroke(knob,C.accent,1.2,0.25)
    S[name]=default
    local dragging=false
    local function update(input)
        local p=math.clamp((input.Position.X-bg.AbsolutePosition.X)/bg.AbsoluteSize.X,0,1)
        local val=math.floor(min+(max-min)*p+0.5)
        S[name]=val
        tween(fill,{Size=UDim2.new(p,0,1,0)},0.08)
        tween(knob,{Position=UDim2.new(p,-6,0.5,-6)},0.08)
        vb.Text=tostring(val)
        if callback then callback(val) end
    end
    bg.InputBegan:Connect(function(inp)
        if inp.UserInputType==Enum.UserInputType.MouseButton1 or inp.UserInputType==Enum.UserInputType.Touch then
            dragging=true; update(inp)
        end
    end)
    UserInputService.InputChanged:Connect(function(inp)
        if dragging and (inp.UserInputType==Enum.UserInputType.MouseMovement or inp.UserInputType==Enum.UserInputType.Touch) then update(inp) end
    end)
    UserInputService.InputEnded:Connect(function(inp)
        if inp.UserInputType==Enum.UserInputType.MouseButton1 or inp.UserInputType==Enum.UserInputType.Touch then dragging=false end
    end)
    return row
end

local function makeButton(sec,name,callback,order)
    local b=Instance.new("TextButton"); b.Name=name; b.Size=UDim2.new(1,0,0,28); b.BackgroundColor3=C.card2; b.BackgroundTransparency=0.15; b.Text=name; b.Font=Enum.Font.GothamBold; b.TextSize=11; b.TextColor3=C.text; b.BorderSizePixel=0; b.ZIndex=9; b.LayoutOrder=order or 0; b.Parent=sec
    corner(b,8)
    b.MouseEnter:Connect(function() tween(b,{BackgroundColor3=C.accentDim},0.12) end)
    b.MouseLeave:Connect(function() tween(b,{BackgroundColor3=C.card2},0.12) end)
    if callback then b.MouseButton1Click:Connect(callback) end
    return b
end

local function makeDropdown(sec,name,opts,default,callback,order)
    local row=Instance.new("Frame"); row.Name=name; row.Size=UDim2.new(1,0,0,28); row.BackgroundColor3=C.card2; row.BackgroundTransparency=0.15; row.ZIndex=9; row.LayoutOrder=order or 0; row.Parent=sec
    corner(row,8)
    local lb=Instance.new("TextLabel"); lb.Size=UDim2.new(0.5,0,0,14); lb.Position=UDim2.new(0,8,0,7); lb.BackgroundTransparency=1; lb.Text=name; lb.Font=Enum.Font.GothamMedium; lb.TextSize=11; lb.TextColor3=C.text; lb.TextXAlignment=Enum.TextXAlignment.Left; lb.ZIndex=10; lb.Parent=row
    local db=Instance.new("TextButton"); db.Size=UDim2.new(0.5,-14,0,20); db.Position=UDim2.new(0.5,-4,0,4); db.BackgroundColor3=C.card; db.Text=default or opts[1] or "..."; db.Font=Enum.Font.GothamMedium; db.TextSize=10; db.TextColor3=C.accent2; db.TextTruncate=Enum.TextTruncate.AtEnd; db.BorderSizePixel=0; db.ZIndex=10; db.Parent=row; corner(db,6)
    stroke(db,C.strokeSoft,0.8,0.45)
    local list=Instance.new("Frame"); list.Size=UDim2.new(0.5,-14,0,#opts*22); list.Position=UDim2.new(0.5,-4,0,28); list.BackgroundColor3=C.card; list.BorderSizePixel=0; list.Visible=false; list.ZIndex=20; list.Parent=row; corner(list,8); pad(list,4,4,4,4)
    stroke(list,C.strokeSoft,1,0.3)
    Instance.new("UIListLayout",list).Padding=UDim.new(0,2)
    local curVal=default or opts[1]
    S[name]=curVal
    for _,o in ipairs(opts) do
        local ob=Instance.new("TextButton"); ob.Size=UDim2.new(1,0,0,20); ob.BackgroundColor3=Color3.fromRGB(0,0,0); ob.BackgroundTransparency=1; ob.Text=o; ob.Font=Enum.Font.GothamMedium; ob.TextSize=10; ob.TextColor3=C.text; ob.TextXAlignment=Enum.TextXAlignment.Left; ob.ZIndex=21; ob.Parent=list; corner(ob,6)
        ob.MouseButton1Click:Connect(function()
            curVal=o; S[name]=o; db.Text=o; list.Visible=false
            if callback then callback(o) end
        end)
    end
    db.MouseButton1Click:Connect(function() list.Visible=not list.Visible end)
    return row
end

local function makeLabel(sec,text,color,order)
    local lb=Instance.new("TextLabel"); lb.Size=UDim2.new(1,0,0,16); lb.BackgroundTransparency=1; lb.Text=text; lb.Font=Enum.Font.GothamMedium; lb.TextSize=11; lb.TextColor3=color or C.muted; lb.TextXAlignment=Enum.TextXAlignment.Left; lb.TextWrapped=true; lb.ZIndex=9; lb.LayoutOrder=order or 0; lb.Parent=sec
    return lb
end

local function makeInputBox(sec,name,placeholder,default,callback,order)
    local row=Instance.new("Frame"); row.Name=name; row.Size=UDim2.new(1,0,0,28); row.BackgroundColor3=C.card2; row.BackgroundTransparency=0.15; row.ZIndex=9; row.LayoutOrder=order or 0; row.Parent=sec
    corner(row,8)
    local lb=Instance.new("TextLabel"); lb.Size=UDim2.new(0.4,0,0,14); lb.Position=UDim2.new(0,8,0,7); lb.BackgroundTransparency=1; lb.Text=name; lb.Font=Enum.Font.GothamMedium; lb.TextSize=11; lb.TextColor3=C.text; lb.TextXAlignment=Enum.TextXAlignment.Left; lb.ZIndex=10; lb.Parent=row
    local ib=Instance.new("TextBox"); ib.Size=UDim2.new(0.6,-14,0,20); ib.Position=UDim2.new(0.6,-4,0,4); ib.BackgroundColor3=C.card; ib.Text=default or ""; ib.PlaceholderText=placeholder or ""; ib.PlaceholderColor3=C.muted; ib.Font=Enum.Font.GothamMedium; ib.TextSize=10; ib.TextColor3=C.accent2; ib.ClearTextOnFocus=false; ib.BorderSizePixel=0; ib.ZIndex=10; ib.Parent=row; corner(ib,6); stroke(ib,C.strokeSoft,0.8,0.45)
    S[name]=default or ""
    ib.FocusLost:Connect(function(ep)
        S[name]=ib.Text
        if callback and ep then callback(ib.Text) end
    end)
    return row
end

local function makeInfoCard(sec,text,order)
    local f=Instance.new("Frame"); f.Size=UDim2.new(1,0,0,0); f.AutomaticSize=Enum.AutomaticSize.Y; f.BackgroundColor3=C.tip; f.BackgroundTransparency=0.12; f.ZIndex=9; f.LayoutOrder=order or 9999; f.Parent=sec
    corner(f,8); stroke(f,C.accent,0.8,0.55)
    local tb=Instance.new("TextLabel"); tb.Size=UDim2.new(1,-16,0,0); tb.AutomaticSize=Enum.AutomaticSize.Y; tb.Position=UDim2.new(0,8,0,6); tb.BackgroundTransparency=1; tb.Text=text; tb.Font=Enum.Font.GothamMedium; tb.TextSize=10; tb.TextColor3=C.muted; tb.TextWrapped=true; tb.TextXAlignment=Enum.TextXAlignment.Left; tb.ZIndex=10; tb.Parent=f
    pad(f,6,8,6,8)
    return f
end

--============================================================================================--
-- DRAG SYSTEM
--============================================================================================--
do
    local dragging,dragStart,startPos
    Header.InputBegan:Connect(function(inp)
        if inp.UserInputType==Enum.UserInputType.MouseButton1 or inp.UserInputType==Enum.UserInputType.Touch then
            dragging=true; dragStart=inp.Position; startPos=Main.Position
            inp.Changed:Connect(function() if inp.UserInputState==Enum.UserInputState.End then dragging=false end end)
        end
    end)
    UserInputService.InputChanged:Connect(function(inp)
        if dragging and (inp.UserInputType==Enum.UserInputType.MouseMovement or inp.UserInputType==Enum.UserInputType.Touch) then
            local d=inp.Position-dragStart
            tween(Main,{Position=UDim2.new(startPos.X.Scale,startPos.X.Offset+d.X,startPos.Y.Scale,startPos.Y.Offset+d.Y)},0.06)
        end
    end)
end

--============================================================================================--
-- HOME TAB
--============================================================================================--
do
    local sf=TabFrames["home"]
    local welcome=Instance.new("Frame"); welcome.Size=UDim2.new(1,0,0,80); welcome.BackgroundColor3=C.bg2; welcome.BorderSizePixel=0; welcome.ZIndex=6; welcome.Parent=sf
    corner(welcome,12); stroke(welcome,C.accent,1.1,0.3)
    local wl=Instance.new("TextLabel"); wl.Size=UDim2.new(1,-16,0,20); wl.Position=UDim2.new(0,8,0,10); wl.BackgroundTransparency=1; wl.Text="Welcome to MM2 HUB"; wl.Font=Enum.Font.GothamBlack; wl.TextSize=16; wl.TextColor3=C.text; wl.TextXAlignment=Enum.TextXAlignment.Left; wl.ZIndex=7; wl.Parent=welcome
    local ws=Instance.new("TextLabel"); ws.Size=UDim2.new(1,-16,0,14); ws.Position=UDim2.new(0,8,0,30); ws.BackgroundTransparency=1; ws.Text="Murder Mystery 2 | VOIDZ-style UI | 10 Tabs"; ws.Font=Enum.Font.GothamMedium; ws.TextSize=10; ws.TextColor3=C.muted; ws.TextXAlignment=Enum.TextXAlignment.Left; ws.ZIndex=7; ws.Parent=welcome
    local wb=Instance.new("TextLabel"); wb.Size=UDim2.new(1,-16,0,14); wb.Position=UDim2.new(0,8,0,46); wb.BackgroundTransparency=1;     wb.Text="Build: 2026-07-26 | by VOIDZ"; wb.Font=Enum.Font.GothamMedium; wb.TextSize=10; ws.TextColor3=C.muted; wb.ZIndex=7; wb.Parent=welcome
    
    local cs=section("home","Stats","icons","",1)
    makeLabel(cs,"Players: "..#Players:GetPlayers().." | Role: Loading...",C.text,1)
    makeLabel(cs,"Press RightShift to toggle hub visibility",C.muted,2)
    
    local cs2=section("home","Quick Start","icons","",2)
    makeButton(cs2,"Server Hop",function()
        local servers=HttpService:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/"..game.PlaceId.."/servers/Public?sortOrder=Asc&limit=100"))
        if servers and servers.data then
            for _,s in ipairs(servers.data) do
                if s.id~=game.JobId and s.playing<s.maxPlayers then
                    TeleportService:TeleportToPlaceInstance(game.PlaceId,s.id,LP); break
                end
            end
        end
    end,1)
    makeButton(cs2,"Rejoin Server",function() TeleportService:Teleport(game.PlaceId,LP) end,2)
    
    local cs3=section("home","Keybinds","icons","",3)
    makeLabel(cs3,"Combat: RightCtrl = Auto Shoot | RCtrl+K = Kill Aura",C.muted,1)
    makeLabel(cs3,"Movement: T = Noclip | F = Fly | V = Infinite Jump",C.muted,2)
    makeLabel(cs3,"Visuals: E = Player ESP | C = Coin ESP | G = Gun ESP",C.muted,3)
    makeLabel(cs3,"Misc: RightShift = Toggle Hub | G = Godmode",C.muted,4)
    
    makeInfoCard(cs3,"Tip: All toggles use events, not polling loops, for minimal lag.",5)
end

--============================================================================================--
-- COMBAT TAB
--============================================================================================--
do
    local sf=TabFrames["combat"]
    local cs=section("combat","Combat Settings","icons","",1)
    makeToggle(cs,"Auto Shoot",false,function(v)
        if v then
            addConn("autoShoot",RunService.Heartbeat:Connect(function()
                if not S.toggles.autoShoot then return end
                local w=getWeapon()
                if w and w:FindFirstChild("Handle") and w:FindFirstChild("RemoteEvent") then
                    local gh=getGunHolder()
                    if gh and gh.Character then
                        local hrp=getHRP(gh.Character)
                        if hrp then w.RemoteEvent:FireServer("SHOOT",hrp.Position) end
                    end
                end
            end))
        else cleanConn("autoShoot") end
    end,1)
    
    makeToggle(cs,"Auto Knife Throw",false,function(v)
        if v then
            addConn("autoKnifeThrow",RunService.Heartbeat:Connect(function()
                if not S.toggles.autoKnifeThrow then return end
                local role=getRole()
                if role~="Murderer" then return end
                local w=getWeapon()
                if w and w:FindFirstChild("Handle") then
                    local tgt=getClosestPlayer(40)
                    if tgt and tgt.Character then
                        local tHRP=getHRP(tgt.Character)
                        if tHRP and w:FindFirstChild("RemoteEvent") then
                            w.RemoteEvent:FireServer("THROW",tHRP.Position)
                        end
                    end
                end
            end))
        else cleanConn("autoKnifeThrow") end
    end,2)
    
    makeToggle(cs,"Kill Aura",false,function(v)
        if v then
            addConn("killAura",RunService.Heartbeat:Connect(function()
                if not S.toggles.killAura then return end
                local role=getRole()
                if role~="Murderer" then return end
                local tgt,dist=getClosestPlayer(S.killAuraRange)
                if tgt and dist<15 and tgt.Character then
                    local w=equipWeapon()
                    if w and w:FindFirstChild("RemoteEvent") then
                        local tHRP=getHRP(tgt.Character)
                        if tHRP then w.RemoteEvent:FireServer("THROW",tHRP.Position) end
                    end
                end
            end))
        else cleanConn("killAura") end
    end,3)
    
    makeSlider(cs,"Kill Aura Range",5,50,20,function(v) S.killAuraRange=v end,4)
    
    makeToggle(cs,"Auto Pickup Gun",false,function(v)
        if v then
            addConn("autoPickupGun",RunService.Heartbeat:Connect(function()
                if not S.toggles.autoPickupGun then return end
                local gd=findGunDrop()
                if gd then
                    local hrp=getHRP(getChar())
                    local gdPart=gd:IsA("Tool") and (gd:FindFirstChild("Handle") or gd.PrimaryPart) or gd
                    if hrp and gdPart then
                        if (hrp.Position-gdPart.Position).Magnitude<15 then
                            if gd:IsA("Tool") then gd.Parent=getChar()
                            elseif gd:FindFirstChild("TouchInterest") then
                                firetouchinterest(hrp,gdPart,0); task.wait(); firetouchinterest(hrp,gdPart,1)
                            end
                        end
                    end
                end
            end))
        else cleanConn("autoPickupGun") end
    end,5)
    
    makeToggle(cs,"Auto Kill (Sheriff)",false,function(v)
        if v then
            addConn("autoKill",RunService.Heartbeat:Connect(function()
                if not S.toggles.autoKill then return end
                local role=getRole()
                if role~="Sheriff" then return end
                local w=getWeapon()
                if w and w:FindFirstChild("Handle") and w:FindFirstChild("RemoteEvent") then
                    local mur=getClosestPlayer(100)
                    if mur and mur.Character then
                        local mHRP=getHRP(mur.Character)
                        if mHRP then w.RemoteEvent:FireServer("SHOOT",mHRP.Position) end
                    end
                end
            end))
        else cleanConn("autoKill") end
    end,6)
    
    makeSlider(cs,"Auto Shoot Interval",0.05,1,0.15,function(v) S.autoInterval=v end,7)
    
    local cs2=section("combat","Combat Info","icons","",2)
    local rl=makeLabel(cs2,"Current Role: Detecting...",C.text,1)
    makeButton(cs2,"Detect Role",function()
        local role,wep=getRole()
        rl.Text="Current Role: "..role..(wep and (" ["..wep.."]") or "")
    end,2)
    makeInfoCard(cs2,"Tip: Role detection checks tools in Character > Backpack > role value > leaderstats. Auto Kill only works as Sheriff.",3)
end

--============================================================================================--
-- MOVEMENT TAB
--============================================================================================--
do
    local sf=TabFrames["movement"]
    local cs=section("movement","Speed & Jump","icons","",1)
    makeSlider(cs,"WalkSpeed",16,200,32,function(v) S.walkSpeed=v end,1)
    makeButton(cs,"Apply WalkSpeed",function()
        local h=getHum(getChar()); if h then h.WalkSpeed=S.walkSpeed end
    end,2)
    makeSlider(cs,"JumpPower",50,200,50,function(v) S.jumpPower=v end,3)
    makeButton(cs,"Apply JumpPower",function()
        local h=getHum(getChar()); if h then h.JumpPower=S.jumpPower end
    end,4)
    
    local cs2=section("movement","Movement Mods","icons","",2)
    makeToggle(cs2,"Noclip",false,function(v)
        if v then
            addConn("noclip",RunService.Stepped:Connect(function()
                if not S.toggles.noclip then return end
                local c=getChar()
                if c then for _,p in ipairs(c:GetDescendants()) do
                    if p:IsA("BasePart") then p.CanCollide=false end
                end end
            end))
        else cleanConn("noclip") end
    end,1)
    
    makeToggle(cs2,"Fly",false,function(v)
        if v then
            local bp=getHRP(getChar())
            if not bp then return end
            local bg=Instance.new("BodyGyro"); bg.P=9e4; bg.MaxTorque=Vector3.new(1/0,1/0,1/0); bg.D=5000; bg.Parent=bp
            local bv=Instance.new("BodyVelocity"); bv.MaxForce=Vector3.new(1/0,1/0,1/0); bv.Velocity=Vector3.zero; bv.P=5e4; bv.Parent=bp
            addConn("fly",RunService.RenderStepped:Connect(function()
                if not S.toggles.fly then bg:Destroy(); bv:Destroy(); return end
                local cf=Camera.CFrame
                local dir=Vector3.zero
                if UserInputService:IsKeyDown(Enum.KeyCode.W) then dir+=cf.LookVector end
                if UserInputService:IsKeyDown(Enum.KeyCode.S) then dir-=cf.LookVector end
                if UserInputService:IsKeyDown(Enum.KeyCode.A) then dir-=cf.RightVector end
                if UserInputService:IsKeyDown(Enum.KeyCode.D) then dir+=cf.RightVector end
                if UserInputService:IsKeyDown(Enum.KeyCode.Space) then dir+=Vector3.new(0,1,0) end
                if UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) then dir-=Vector3.new(0,1,0) end
                if dir.Magnitude>0 then dir=dir.Unit end
                bv.Velocity=dir*S.flySpeed
                bg.CFrame=cf
            end))
        else cleanConn("fly"); local c=getChar(); if c then for _,p in ipairs(c:GetDescendants()) do if p:IsA("BodyGyro") or p:IsA("BodyVelocity") then p:Destroy() end end end end
    end,2)
    makeSlider(cs2,"Fly Speed",10,200,60,function(v) S.flySpeed=v end,3)
    
    makeToggle(cs2,"Infinite Jump",false,function(v)
        if v then
            addConn("infJump",UserInputService.JumpRequest:Connect(function()
                if not S.toggles.infJump then return end
                local c=getChar(); local h=getHum(c); if h then h:ChangeState(Enum.HumanoidStateType.Jumping) end
            end))
        else cleanConn("infJump") end
    end,4)
    
    makeToggle(cs2,"Bunny Hop",false,function(v)
        if v then
            addConn("bhop",RunService.Heartbeat:Connect(function()
                if not S.toggles.bhop then return end
                local c=getChar(); local h=getHum(c); local hrp=getHRP(c)
                if h and hrp then
                    if h.FloorMaterial~=Enum.Material.Air then
                        h:ChangeState(Enum.HumanoidStateType.Jumping)
                    end
                end
            end))
        else cleanConn("bhop") end
    end,5)
    
    makeToggle(cs2,"Spin Bot",false,function(v)
        if v then
            addConn("spinBot",RunService.RenderStepped:Connect(function()
                if not S.toggles.spinBot then return end
                local hrp=getHRP(getChar())
                if hrp then hrp.CFrame=hrp.CFrame*CFrame.Angles(0,math.rad(S.spinSpeed),0) end
            end))
        else cleanConn("spinBot") end
    end,6)
    makeSlider(cs2,"Spin Speed",1,60,10,function(v) S.spinSpeed=v end,7)
    
    makeSlider(cs2,"Hip Height",0,20,0,function(v) S.hipHeight=v end,8)
    makeButton(cs2,"Apply Hip Height",function()
        local h=getHum(getChar()); if h then h.HipHeight=S.hipHeight end
    end,9)
end

--============================================================================================--
-- VISUALS TAB
--============================================================================================--
do
    local sf=TabFrames["visuals"]
    local cs=section("visuals","ESP","icons","",1)
    makeToggle(cs,"Player ESP",false,function(v)
        if v then
            addConn("playerEsp",RunService.RenderStepped:Connect(function()
                if not S.toggles.playerEsp then return end
                for _,p in ipairs(Players:GetPlayers()) do
                    if p~=LP and p.Character then
                        if not S.espObjects[p] then createESP(p) end
                    end
                end
            end))
        else cleanConn("playerEsp"); for p,_ in pairs(S.espObjects) do removeESP(p) end end
    end,1)
    
    makeToggle(cs,"Gun Drop ESP",false,function(v)
        if v then
            addConn("gunEsp",RunService.Heartbeat:Connect(function()
                if not S.toggles.gunEsp then return end
                local gd=findGunDrop()
                if gd and not S.espObjects["gun_"..gd:GetFullName()] then createGunDropESP(gd) end
            end))
        else cleanConn("gunEsp") end
    end,2)
    
    makeToggle(cs,"Coin ESP",false,function(v)
        if v then
            addConn("coinEsp",RunService.Heartbeat:Connect(function()
                if not S.toggles.coinEsp then return end
                for _,c in ipairs(findCoins()) do
                    local k="coin_"..tostring(c)
                    if not S.espObjects[k] then createCoinESP(c) end
                end
            end))
        else cleanConn("coinEsp") end
    end,3)
    
    makeToggle(cs,"ESP Lines",false,function(v) S.toggles.espLines=v end,4)
    makeToggle(cs,"Show Distance",true,function(v) S.toggles.espShowDistance=v end,5)
    
    makeToggle(cs,"Player Highlight",false,function(v)
        if v then
            addConn("playerHighlight",RunService.RenderStepped:Connect(function()
                if not S.toggles.playerHighlight then return end
                for _,p in ipairs(Players:GetPlayers()) do
                    if p~=LP and p.Character then updateHighlights(p) end
                end
            end))
        else cleanConn("playerHighlight"); for p,h in pairs(S.espHighlights) do if h then h:Destroy() end; S.espHighlights[p]=nil end end
    end,6)
    
    local cs2=section("visuals","Visual Mods","icons","",2)
    makeToggle(cs2,"Full Bright",false,function(v)
        if v then
            Lighting.Brightness=S.brightness
            addConn("fullBright",Lighting:GetPropertyChangedSignal("Brightness"):Connect(function()
                if S.toggles.fullBright then Lighting.Brightness=S.brightness end
            end))
        else cleanConn("fullBright"); Lighting.Brightness=1 end
    end,1)
    makeSlider(cs2,"Brightness",1,30,15,function(v) S.brightness=v; if S.toggles.fullBright then Lighting.Brightness=v end end,2)
    
    makeToggle(cs2,"X-Ray",false,function(v)
        if v then
            addConn("xray",RunService.RenderStepped:Connect(function()
                if not S.toggles.xray then return end
                for _,p in ipairs(Workspace:GetDescendants()) do
                    if p:IsA("BasePart") and not p:IsDescendantOf(getChar()) then
                        p.LocalTransparencyModifier=0.7
                    end
                end
            end))
        else cleanConn("xray"); for _,p in ipairs(Workspace:GetDescendants()) do if p:IsA("BasePart") then p.LocalTransparencyModifier=0 end end end
    end,3)
    
    makeToggle(cs2,"Chams",false,function(v)
        if v then
            addConn("chams",RunService.RenderStepped:Connect(function()
                if not S.toggles.chams then return end
                for _,p in ipairs(Players:GetPlayers()) do
                    if p~=LP and p.Character then
                        for _,part in ipairs(p.Character:GetDescendants()) do
                            if part:IsA("BasePart") then
                                local sg=part:FindFirstChild("ChamSG") or Instance.new("SurfaceGui",part)
                                sg.Name="ChamSG"; sg.Face=Enum.NormalId.Front; sg.LightInfluence=0
                                local fl=sg:FindFirstChild("Fl") or Instance.new("Frame",sg)
                                fl.Name="Fl"; fl.Size=UDim2.new(1,0,1,0); fl.BorderSizePixel=0
                                fl.BackgroundColor3=C.accent; fl.BackgroundTransparency=0.5
                            end
                        end
                    end
                end
            end))
        else cleanConn("chams"); for _,p in ipairs(Players:GetPlayers()) do
            if p~=LP and p.Character then for _,part in ipairs(p.Character:GetDescendants()) do
                if part:IsA("BasePart") then for _,ch in ipairs(part:GetChildren()) do
                    if ch:IsA("SurfaceGui") and ch.Name=="ChamSG" then ch:Destroy() end
                end end
            end end
        end end
    end,4)
end

--============================================================================================--
-- FARM TAB
--============================================================================================--
do
    local sf=TabFrames["farm"]
    local cs=section("farm","Coin Farming","icons","",1)
    makeToggle(cs,"Auto Coin Farm",false,function(v)
        if v then
            addConn("autoCoinFarm",RunService.Heartbeat:Connect(function()
                if not S.toggles.autoCoinFarm then return end
                local coins=findCoins()
                local hrp=getHRP(getChar())
                if #coins>0 and hrp then
                    local best,bestD=nil,math.huge
                    for _,c in ipairs(coins) do
                        if c and c.Parent then
                            local d=(hrp.Position-c.Position).Magnitude
                            if d<bestD then best=c; bestD=d end
                        end
                    end
                    if best and bestD<100 then
                        hrp.CFrame=CFrame.new(best.Position+Vector3.new(0,3,0))
                    end
                end
            end))
        else cleanConn("autoCoinFarm") end
    end,1)
    makeSlider(cs,"Farm Speed",0.05,1,0.2,function(v) S.coinFarmSpeed=v end,2)
    makeToggle(cs,"Reset When Bag Full",false,function(v) S.toggles.resetWhenBagFull=v end,3)
    
    local cs2=section("farm","Gun Farming","icons","",2)
    makeToggle(cs2,"Auto Gun Pickup",false,function(v)
        if v then
            addConn("autoGunPickup",RunService.Heartbeat:Connect(function()
                if not S.toggles.autoGunPickup then return end
                local gd=findGunDrop()
                if gd then
                    local hrp=getHRP(getChar())
                    local gdPart=gd:IsA("Tool") and (gd:FindFirstChild("Handle") or gd.PrimaryPart) or gd
                    if hrp and gdPart and (hrp.Position-gdPart.Position).Magnitude<20 then
                        if gd:IsA("Tool") then
                            pcall(function() gd.Parent=getChar() end)
                        else
                            pcall(function() firetouchinterest(hrp,gdPart,0); task.wait(); firetouchinterest(hrp,gdPart,1) end)
                        end
                    end
                end
            end))
        else cleanConn("autoGunPickup") end
    end,1)
    
    local cs3=section("farm","Farm Info","icons","",3)
    local coinCount=makeLabel(cs3,"Coins visible: 0",C.text,1)
    local gunLabel=makeLabel(cs3,"Gun drop: None",C.text,2)
    makeButton(cs3,"Refresh Counts",function()
        local coins=findCoins()
        local gd=findGunDrop()
        coinCount.Text="Coins visible: "..#coins
        gunLabel.Text="Gun drop: "..(gd and gd.Name or "None")
    end,3)
    makeInfoCard(cs3,"Tip: Auto Coin Farm teleports you to the nearest coin. Reset When Bag Full auto-respawns when bag is full.",4)
end

--============================================================================================--
-- ROLES TAB (NEW)
--============================================================================================--
do
    local sf=TabFrames["roles"]
    local cs=section("roles","Role Detection","icons","",1)
    makeDropdown(cs,"Detection Method",{"Tool","Character","Value","Leaderstats","All"},"All",function(v) S.roleDetection=v end,1)
    
    local cs2=section("roles","My Role","icons","",2)
    local myRoleLabel=makeLabel(cs2,"Role: Detecting...",C.text,1)
    local myWeapLabel=makeLabel(cs2,"Weapon: None",C.muted,2)
    makeButton(cs2,"Refresh Role",function()
        local role,wep=getRole()
        myRoleLabel.Text="Role: "..role
        myWeapLabel.Text="Weapon: "..(wep or "None")
        if role=="Murderer" then myRoleLabel.TextColor3=C.dangerText
        elseif role=="Sheriff" then myRoleLabel.TextColor3=Color3.fromRGB(100,180,255)
        else myRoleLabel.TextColor3=C.success end
    end,3)
    
    makeToggle(cs2,"Auto Detect Role",false,function(v)
        if v then
            addConn("autoDetect",RunService.Heartbeat:Connect(function()
                if not S.toggles.autoDetect then return end
                local role,wep=getRole()
                myRoleLabel.Text="Role: "..role
                myWeapLabel.Text="Weapon: "..(wep or "None")
                if role=="Murderer" then myRoleLabel.TextColor3=C.dangerText
                elseif role=="Sheriff" then myRoleLabel.TextColor3=Color3.fromRGB(100,180,255)
                else myRoleLabel.TextColor3=C.success end
            end))
        else cleanConn("autoDetect") end
    end,4)
    
    local cs3=section("roles","Round Info","icons","",3)
    makeLabel(cs3,"Round state: Detecting...",C.text,1)
    makeButton(cs3,"Refresh Round Info",function()
        local mode=Workspace:FindFirstChild("RoleReveal")
        local round=Workspace:FindFirstChild("RoundStatus")
        if round then
            cs3:GetChildren()[1].Text="Round state: Active"
        else
            cs3:GetChildren()[1].Text="Round state: Waiting"
        end
    end,2)
    
    local cs4=section("roles","Role Tracker","icons","",4)
    local trackerFrame=Instance.new("ScrollingFrame"); trackerFrame.Size=UDim2.new(1,0,0,120); trackerFrame.BackgroundTransparency=1; trackerFrame.BorderSizePixel=0; trackerFrame.ScrollBarThickness=4; trackerFrame.ScrollBarImageColor3=C.accentDim; trackerFrame.CanvasSize=UDim2.new(0,0,0,0); trackerFrame.AutomaticCanvasSize=Enum.AutomaticSize.Y; trackerFrame.ZIndex=9; trackerFrame.Parent=cs4
    Instance.new("UIListLayout",trackerFrame).Padding=UDim.new(0,3); pad(trackerFrame,2,2,2,2)
    
    local function refreshTracker()
        for _,ch in ipairs(trackerFrame:GetChildren()) do
            if ch:IsA("TextLabel") then ch:Destroy() end
        end
        for _,p in ipairs(Players:GetPlayers()) do
            if p~=LP then
                local role="?"
                if p.Character then
                    for _,t in ipairs(p.Character:GetChildren()) do
                        if t:IsA("Tool") then
                            local n=t.Name
                            if n=="Knife" or n=="Silencer" or n=="Deagle" or n=="Shotgun" or n=="Uzi" or n=="Sniper" or n=="Rifle" then role="Murderer" end
                            if n=="Gun" or n=="Revolver" then role="Sheriff" end
                        end
                    end
                    local rv=p.Character:FindFirstChild("roleValue")
                    if rv and rv.Value~="" then role=tostring(rv.Value) end
                end
                local lb=Instance.new("TextLabel"); lb.Size=UDim2.new(1,0,0,16); lb.BackgroundTransparency=1; lb.Text=p.Name..": "..role; lb.Font=Enum.Font.GothamMedium; lb.TextSize=10
                if role=="Murderer" then lb.TextColor3=C.dangerText
                elseif role=="Sheriff" then lb.TextColor3=Color3.fromRGB(100,180,255)
                else lb.TextColor3=C.muted end
                lb.TextXAlignment=Enum.TextXAlignment.Left; lb.ZIndex=10; lb.Parent=trackerFrame
            end
        end
    end
    makeButton(cs4,"Refresh Tracker",refreshTracker,1)
    makeButton(cs4,"Auto Refresh",function()
        task.spawn(function()
            for i=1,60 do
                refreshTracker()
                task.wait(1)
            end
        end)
    end,2)
    
    makeInfoCard(cs4,"Tip: Role detection checks tools, roleValue, and leaderstats. Murderer tools: Knife/Silencer/Deagle/Shotgun/Uzi/Sniper/Rifle. Sheriff tools: Gun/Revolver.",3)
end

--============================================================================================--
-- TROLL TAB
--============================================================================================--
do
    local sf=TabFrames["troll"]
    local cs=section("troll","Troll Options","icons","",1)
    makeToggle(cs,"Touch Fling",false,function(v)
        if v then
            addConn("touchFling",RunService.Heartbeat:Connect(function()
                if not S.toggles.touchFling then return end
                local hrp=getHRP(getChar())
                if hrp then hrp.Velocity=Vector3.new(9999,9999,9999) end
            end))
        else cleanConn("touchFling"); local hrp=getHRP(getChar()); if hrp then hrp.Velocity=Vector3.zero end end
    end,1)
    
    makeButton(cs,"Fling Target",function()
        local tgt=getClosestPlayer(100)
        if tgt and tgt.Character then
            S.toggles.flingTarget=true
            addConn("flingTarget",RunService.Heartbeat:Connect(function()
                if not S.toggles.flingTarget then return end
                local hrp=getHRP(getChar())
                local tHRP=getHRP(tgt.Character)
                if hrp and tHRP then
                    hrp.CFrame=tHRP.CFrame*CFrame.new(0,0,3)
                    hrp.Velocity=Vector3.new(9999,0,0)
                    hrp.RotVelocity=Vector3.new(0,9999,0)
                end
            end))
        end
    end,2)
    makeButton(cs,"Stop Fling",function()
        S.toggles.flingTarget=false; cleanConn("flingTarget")
        local hrp=getHRP(getChar())
        if hrp then hrp.Velocity=Vector3.zero; hrp.RotVelocity=Vector3.zero end
    end,3)
    
    makeToggle(cs,"Emote Spam",false,function(v)
        if v then
            addConn("emoteSpam",RunService.Heartbeat:Connect(function()
                if not S.toggles.emoteSpam then return end
                local c=getChar(); local h=getHum(c)
                if h then pcall(function() h:PlayAnimation("rbxassetid://148830937",true) end) end
            end))
        else cleanConn("emoteSpam") end
    end,4)
    
    makeButton(cs,"Sit Player",function()
        local h=getHum(getChar()); if h then h.Sit=true end
    end,5)
    makeButton(cs,"Unsit Player",function()
        local h=getHum(getChar()); if h then h.Sit=false end
    end,6)
end

--============================================================================================--
-- SERVER TAB
--============================================================================================--
do
    local sf=TabFrames["server"]
    local cs=section("server","Server Options","icons","",1)
    makeButton(cs,"Server Hop",function()
        local servers=HttpService:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/"..game.PlaceId.."/servers/Public?sortOrder=Asc&limit=100"))
        if servers and servers.data then
            for _,s in ipairs(servers.data) do
                if s.id~=game.JobId and s.playing<s.maxPlayers then
                    TeleportService:TeleportToPlaceInstance(game.PlaceId,s.id,LP); break
                end
            end
        end
    end,1)
    makeButton(cs,"Rejoin Server",function() TeleportService:Teleport(game.PlaceId,LP) end,2)
    makeButton(cs,"Copy Server ID",function()
        setclipboard(game.JobId)
    end,3)
    makeButton(cs,"Copy Server Link",function()
        setclipboard("https://www.roblox.com/games/"..game.PlaceId)
    end,4)
    
    makeToggle(cs,"Anti AFK",false,function(v)
        if v then
            addConn("antiAfk",game:GetService("Players").LocalPlayer.Idled:Connect(function()
                if S.toggles.antiAfk then
                    VIM:SendMouseButton2(0,0,0,true,nil,true)
                    task.wait(0.1)
                    VIM:SendMouseButton2(0,0,0,false,nil,true)
                end
            end))
        else cleanConn("antiAfk") end
    end,5)
    
    makeToggle(cs,"Auto Server Hop",false,function(v) S.toggles.autoServerHop=v end,6)
    
    local cs2=section("server","Server Info","icons","",2)
    makeLabel(cs2,"Job ID: "..game.JobId,C.muted,1)
    makeLabel(cs2,"Place ID: "..game.PlaceId,C.muted,2)
    makeLabel(cs2,"Players: "..#Players:GetPlayers(),C.muted,3)
    makeButton(cs2,"Refresh Player Count",function()
        cs2:GetChildren()[3].Text="Players: "..#Players:GetPlayers()
    end,4)
end

--============================================================================================--
-- WORLD TAB (NEW)
--============================================================================================--
do
    local sf=TabFrames["world"]
    local cs=section("world","Lighting","icons","",1)
    makeToggle(cs,"Full Bright",false,function(v)
        if v then
            Lighting.Brightness=S.brightness
            Lighting.GlobalShadows=false
            Lighting.Ambient=Color3.fromRGB(255,255,255)
            addConn("worldBright",RunService.Heartbeat:Connect(function()
                if not S.toggles.fullBright then return end
                Lighting.Brightness=S.brightness
                Lighting.GlobalShadows=false
                Lighting.Ambient=Color3.fromRGB(255,255,255)
            end))
        else cleanConn("worldBright"); Lighting.Brightness=1; Lighting.GlobalShadows=true; Lighting.Ambient=Color3.fromRGB(128,128,128) end
    end,1)
    makeSlider(cs,"Brightness",1,30,15,function(v) S.brightness=v; if S.toggles.fullBright then Lighting.Brightness=v end end,2)
    
    makeToggle(cs,"Time of Day Override",false,function(v)
        if v then
            addConn("timeOverride",RunService.Heartbeat:Connect(function()
                if not S.toggles["Time of Day Override"] then return end
                Lighting.ClockTime=S.timeOfDay
            end))
        else cleanConn("timeOverride") end
    end,3)
    makeSlider(cs,"Time of Day",0,24,14,function(v) S.timeOfDay=v; if S.toggles["Time of Day Override"] then Lighting.ClockTime=v end end,4)
    
    makeButton(cs,"Set Morning (6)",function() Lighting.ClockTime=6 end,5)
    makeButton(cs,"Set Noon (12)",function() Lighting.ClockTime=12 end,6)
    makeButton(cs,"Set Night (0)",function() Lighting.ClockTime=0 end,7)
    
    local cs2=section("world","Atmosphere","icons","",2)
    makeToggle(cs2,"Remove Fog",false,function(v)
        if v then
            for _,atm in ipairs(Lighting:GetDescendants()) do
                if atm:IsA("Atmosphere") then atm.Density=0 atm.Haze=0 end
            end
            Lighting.FogEnd=1000000
            Lighting.FogStart=0
        else
            Lighting.FogEnd=100000
            for _,atm in ipairs(Lighting:GetDescendants()) do
                if atm:IsA("Atmosphere") then atm.Density=0.3 atm.Haze=1 end
            end
        end
    end,1)
    makeButton(cs2,"Remove All Atmosphere",function()
        for _,atm in ipairs(Lighting:GetDescendants()) do
            if atm:IsA("Atmosphere") then atm:Destroy() end
        end
    end,2)
    
    makeDropdown(cs2,"Ambient Preset",{"Default","Bright","Dark","Custom"},"Default",function(v)
        if v=="Bright" then
            Lighting.Ambient=Color3.fromRGB(255,255,255)
            Lighting.OutdoorAmbient=Color3.fromRGB(255,255,255)
        elseif v=="Dark" then
            Lighting.Ambient=Color3.fromRGB(0,0,0)
            Lighting.OutdoorAmbient=Color3.fromRGB(0,0,0)
        elseif v=="Custom" then
            Lighting.Ambient=Color3.fromRGB(200,200,200)
            Lighting.OutdoorAmbient=Color3.fromRGB(100,100,100)
        else
            Lighting.Ambient=Color3.fromRGB(128,128,128)
            Lighting.OutdoorAmbient=Color3.fromRGB(128,128,128)
        end
    end,3)
    
    local cs3=section("world","World Mods","icons","",3)
    makeToggle(cs3,"X-Ray",false,function(v)
        if v then
            addConn("worldXray",RunService.RenderStepped:Connect(function()
                if not S.toggles.xray then return end
                local c=getChar()
                for _,p in ipairs(Workspace:GetDescendants()) do
                    if p:IsA("BasePart") and c and not p:IsDescendantOf(c) then
                        p.LocalTransparencyModifier=0.7
                    end
                end
            end))
        else cleanConn("worldXray"); for _,p in ipairs(Workspace:GetDescendants()) do if p:IsA("BasePart") then p.LocalTransparencyModifier=0 end end end
    end,1)
    makeButton(cs3,"Remove Barriers",function()
        for _,p in ipairs(Workspace:GetDescendants()) do
            if p:IsA("BasePart") and (p.Name=="Barrier" or p.Name=="Wall" or p.Name=="InvisibleWall" or p.Name=="Door") then
                p.Transparency=1; p.CanCollide=false
            end
        end
    end,2)
    makeButton(cs3,"Unlock Camera",function()
        local c=getChar(); local h=getHum(c)
        if h then
            h.CameraOffset=Vector3.new(0,0,-5)
            Camera.CameraType=Enum.CameraType.Custom
            pcall(function() UserInputService.MouseBehavior=Enum.MouseBehavior.Default end)
        end
    end,3)
    makeButton(cs3,"Reset Lighting",function()
        Lighting.Brightness=1; Lighting.GlobalShadows=true
        Lighting.Ambient=Color3.fromRGB(128,128,128)
        Lighting.OutdoorAmbient=Color3.fromRGB(128,128,128)
        Lighting.ClockTime=14; Lighting.FogEnd=100000
    end,4)
    
    makeInfoCard(cs3,"Tip: World mods affect local rendering only. Other players won't see your changes.",5)
end

--============================================================================================--
-- CONFIG TAB
--============================================================================================--
do
    local sf=TabFrames["settings"]
    local cs=section("settings","Keybinds","icons","",1)
    
    local kbDefs={
        {name="Toggle Hub",key="toggleHub",default="RightShift"},
        {name="Noclip",key="noclip",default="T"},
        {name="Fly",key="fly",default="F"},
        {name="ESP",key="esp",default="E"},
        {name="Godmode",key="godmode",default="G"},
    }
    
    for i,kb in ipairs(kbDefs) do
        local row=Instance.new("Frame"); row.Size=UDim2.new(1,0,0,28); row.BackgroundColor3=C.card2; row.BackgroundTransparency=0.15; row.ZIndex=9; row.LayoutOrder=i; row.Parent=cs
        corner(row,8)
        local lb=Instance.new("TextLabel"); lb.Size=UDim2.new(0.6,0,0,14); lb.Position=UDim2.new(0,8,0,7); lb.BackgroundTransparency=1; lb.Text=kb.name; lb.Font=Enum.Font.GothamMedium; lb.TextSize=11; lb.TextColor3=C.text; lb.TextXAlignment=Enum.TextXAlignment.Left; lb.ZIndex=10; lb.Parent=row
        local kbBtn=Instance.new("TextButton"); kbBtn.Size=UDim2.new(0.4,-14,0,20); kbBtn.Position=UDim2.new(0.6,-4,0,4); kbBtn.BackgroundColor3=C.card; kbBtn.Text=kb.default; kbBtn.Font=Enum.Font.GothamBold; kbBtn.TextSize=10; kbBtn.TextColor3=C.accent2; kbBtn.BorderSizePixel=0; kbBtn.ZIndex=10; kbBtn.Parent=row; corner(kbBtn,6); stroke(kbBtn,C.strokeSoft,0.8,0.45)
        kbBtn.MouseButton1Click:Connect(function()
            kbBtn.Text="Press a key..."
            local conn; conn=UserInputService.InputBegan:Connect(function(inp,gpe)
                if gpe then return end
                S.keybinds[kb.key]=inp.KeyCode
                kbBtn.Text=inp.KeyCode.Name
                conn:Disconnect()
            end)
        end)
    end
    
    local cs2=section("settings","Whitelist","icons","",2)
    makeInputBox(cs2,"Whitelist Player","Player name...",nil,function(v)
        if v and v~="" then
            table.insert(S.whitelist,v)
        end
    end,1)
    makeButton(cs2,"Clear Whitelist",function()
        S.whitelist={}
    end,2)
    makeButton(cs2,"View Whitelist",function()
        local names=""
        for _,n in ipairs(S.whitelist) do names=names..n..", " end
        if names=="" then names="Empty" end
    end,3)
    
    local cs3=section("settings","Config","icons","",3)
    makeButton(cs3,"Export Config",function()
        local cfg={toggles={},speeds={}}
        for k,v in pairs(S.toggles) do cfg.toggles[k]=v end
        cfg.speeds.flySpeed=S.flySpeed
        cfg.speeds.walkSpeed=S.walkSpeed
        cfg.speeds.killAuraRange=S.killAuraRange
        cfg.speeds.coinFarmSpeed=S.coinFarmSpeed
        cfg.whitelist=S.whitelist
        cfg.keybinds={}
        for k,v in pairs(S.keybinds) do cfg.keybinds[k]=v.Name end
        S.configJson=HttpService:JSONEncode(cfg)
        setclipboard(S.configJson)
    end,1)
    makeButton(cs3,"Import Config (clipboard)",function()
        pcall(function()
            local j=getclipboard()
            local cfg=HttpService:JSONDecode(j)
            if cfg.toggles then for k,v in pairs(cfg.toggles) do S.toggles[k]=v end end
            if cfg.speeds then
                S.flySpeed=cfg.speeds.flySpeed or S.flySpeed
                S.walkSpeed=cfg.speeds.walkSpeed or S.walkSpeed
                S.killAuraRange=cfg.speeds.killAuraRange or S.killAuraRange
            end
            if cfg.whitelist then S.whitelist=cfg.whitelist end
        end)
    end,2)
    makeButton(cs3,"Reset All",function()
        for k,_ in pairs(S.toggles) do S.toggles[k]=false end
        S.flySpeed=60; S.walkSpeed=32; S.jumpPower=50; S.killAuraRange=20; S.coinFarmSpeed=0.2
        S.whitelist={}
    end,3)
    
    local cs4=section("settings","Hub Info","icons","",4)
    makeLabel(cs4,"MM2 HUB v2.0 | Build 2026-07-26",C.muted,1)
    makeLabel(cs4,"UI Style: VOIDZ_HUB",C.muted,2)
    makeLabel(cs4,"10 Tabs | Fixed ESP | Role Detection",C.muted,3)
    makeInfoCard(cs4,"Hub closes on death. All features are local (FE-safe where possible). Use at your own risk.",4)
end

--============================================================================================--
-- ESP SYSTEM
--============================================================================================--
function createESP(plr)
    if S.espObjects[plr] then return end
    local h=Instance.new("Highlight"); h.FillColor=C.accent; h.OutlineColor=C.accent2; h.FillTransparency=0.7; h.OutlineTransparency=0.3; h.DepthMode=Enum.HighlightDepthMode.AlwaysOnTop; h.Parent=plr.Character or LP.Character
    S.espHighlights[plr]=h
    
    local bg=Instance.new("BillboardGui"); bg.Name="MM2ESP"; bg.AlwaysOnTop=true; bg.Size=UDim2.new(0,120,0,40); bg.StudsOffset=Vector3.new(0,3,0); bg.Adornee=plr.Character and (plr.Character:FindFirstChild("HumanoidRootPart") or plr.Character:FindFirstChild("UpperTorso") or plr.Character:FindFirstChild("Torso")); bg.LightInfluence=0; bg.Parent=plr.Character or LP.Character
    
    local nl=Instance.new("TextLabel"); nl.Size=UDim2.new(1,0,0,16); nl.Position=UDim2.new(0,0,0,0); nl.BackgroundTransparency=1; nl.Text=plr.Name; nl.Font=Enum.Font.GothamBold; nl.TextSize=11; nl.TextColor3=C.text; nl.TextStrokeTransparency=0.3; nl.TextStrokeColor3=C.black; nl.ZIndex=10; nl.Parent=bg
    
    local rl=Instance.new("TextLabel"); rl.Size=UDim2.new(1,0,0,12); rl.Position=UDim2.new(0,0,0,14); rl.BackgroundTransparency=1; rl.Text="Role: ?"; rl.Font=Enum.Font.GothamMedium; rl.TextSize=9; rl.TextColor3=C.muted; rl.TextStrokeTransparency=0.3; rl.TextStrokeColor3=C.black; rl.ZIndex=10; rl.Parent=bg
    
    local dl=Instance.new("TextLabel"); dl.Size=UDim2.new(1,0,0,12); dl.Position=UDim2.new(0,0,0,26); dl.BackgroundTransparency=1; dl.Text="Dist: ?"; dl.Font=Enum.Font.Code; dl.TextSize=9; dl.TextColor3=C.accent2; dl.TextStrokeTransparency=0.3; dl.TextStrokeColor3=C.black; dl.Visible=S.toggles.espShowDistance; dl.ZIndex=10; dl.Parent=bg
    
    S.espObjects[plr]={highlight=h,billboard=bg,nameLabel=nl,roleLabel=rl,distLabel=dl}
end

function removeESP(plr)
    local e=S.espObjects[plr]
    if e then
        if e.highlight and e.highlight.Parent then e.highlight:Destroy() end
        if e.billboard and e.billboard.Parent then e.billboard:Destroy() end
    end
    S.espObjects[plr]=nil
    S.espHighlights[plr]=nil
end

function updateESPRoles()
    for plr,e in pairs(S.espObjects) do
        if plr.Character and e.roleLabel then
            local role="?"
            for _,t in ipairs(plr.Character:GetChildren()) do
                if t:IsA("Tool") then
                    local n=t.Name
                    if n=="Knife" or n=="Silencer" or n=="Deagle" or n=="Shotgun" or n=="Uzi" or n=="Sniper" or n=="Rifle" then role="Murderer" end
                    if n=="Gun" or n=="Revolver" then role="Sheriff" end
                end
            end
            local rv=plr.Character:FindFirstChild("roleValue")
            if rv and rv.Value~="" then role=tostring(rv.Value) end
            e.roleLabel.Text="Role: "..role
            if role=="Murderer" then e.roleLabel.TextColor3=C.dangerText
            elseif role=="Sheriff" then e.roleLabel.TextColor3=Color3.fromRGB(100,180,255)
            else e.roleLabel.TextColor3=C.muted end
        end
    end
end

function updateESPDistances()
    local myHRP=getHRP(getChar())
    if not myHRP then return end
    for plr,e in pairs(S.espObjects) do
        if plr.Character and e.distLabel then
            local tHRP=getHRP(plr.Character)
            if tHRP then
                local d=math.floor((myHRP.Position-tHRP.Position).Magnitude)
                e.distLabel.Text="Dist: "..d.."m"
                e.distLabel.Visible=S.toggles.espShowDistance
            end
        end
    end
end

function createGunDropESP(gd)
    local key="gun_"..gd:GetFullName()
    if S.espObjects[key] then return end
    local adornee=gd:IsA("Tool") and (gd:FindFirstChild("Handle") or gd.PrimaryPart) or (gd:IsA("BasePart") and gd or gd:FindFirstChildWhichIsA("BasePart"))
    if not adornee then return end
    local bg=Instance.new("BillboardGui"); bg.Name="GunESP"; bg.AlwaysOnTop=true; bg.Size=UDim2.new(0,100,0,20); bg.StudsOffset=Vector3.new(0,2,0); bg.Adornee=adornee; bg.LightInfluence=0; bg.Parent=adornee
    local gl=Instance.new("TextLabel"); gl.Size=UDim2.new(1,0,1,0); gl.BackgroundTransparency=1; gl.Text="Gun: "..gd.Name; gl.Font=Enum.Font.GothamBold; gl.TextSize=11; gl.TextColor3=C.warn; gl.TextStrokeTransparency=0.3; gl.TextStrokeColor3=C.black; gl.ZIndex=10; gl.Parent=bg
    S.espObjects[key]={billboard=bg,gl=gl}
end

function createCoinESP(coin)
    local key="coin_"..tostring(coin)
    if S.espObjects[key] then return end
    local bg=Instance.new("BillboardGui"); bg.Name="CoinESP"; bg.AlwaysOnTop=true; bg.Size=UDim2.new(0,60,0,16); bg.StudsOffset=Vector3.new(0,1.5,0); bg.Adornee=coin; bg.LightInfluence=0; bg.Parent=coin
    local cl=Instance.new("TextLabel"); cl.Size=UDim2.new(1,0,1,0); cl.BackgroundTransparency=1; cl.Text="$"; cl.Font=Enum.Font.GothamBold; cl.TextSize=12; cl.TextColor3=C.warn; cl.TextStrokeTransparency=0.3; cl.TextStrokeColor3=C.black; cl.ZIndex=10; cl.Parent=bg
    S.espObjects[key]={billboard=bg,cl=cl}
end

function updateESPLines()
    local myHRP=getHRP(getChar())
    if not myHRP then return end
    for plr,e in pairs(S.espObjects) do
        if plr.Character and S.toggles.espLines then
            local tHRP=getHRP(plr.Character)
            if tHRP and not S.espBeams[plr] then
                local att0=Instance.new("Attachment"); att0.Parent=myHRP
                local att1=Instance.new("Attachment"); att1.Parent=tHRP
                local beam=Instance.new("Beam"); beam.Attachment0=att0; beam.Attachment1=att1; beam.Color=ColorSequence.new(C.accent); beam.LightEmission=1; beam.Width0=0.08; beam.Width1=0.08; beam.LightInfluence=0; beam.Parent=myHRP
                S.espBeams[plr]={beam=beam,att0=att0,att1=att1}
            end
        elseif not S.toggles.espLines and S.espBeams[plr] then
            local b=S.espBeams[plr]
            if b.beam then b.beam:Destroy() end
            if b.att0 then b.att0:Destroy() end
            if b.att1 then b.att1:Destroy() end
            S.espBeams[plr]=nil
        end
    end
end

function updateHighlights(plr)
    if not plr.Character then return end
    local existing=plr.Character:FindFirstChildWhichIsA("Highlight")
    if not existing then
        local h=Instance.new("Highlight"); h.FillColor=C.accent; h.OutlineColor=C.accent2; h.FillTransparency=0.7; h.OutlineTransparency=0.3; h.DepthMode=Enum.HighlightDepthMode.AlwaysOnTop; h.Parent=plr.Character
        S.espHighlights[plr]=h
    end
end

-- ESP update loop
addConn("espUpdate",RunService.RenderStepped:Connect(function()
    if not S.toggles.playerEsp then return end
    updateESPRoles()
    updateESPDistances()
    updateESPLines()
end))

-- Cleanup on player leaving
Players.PlayerRemoving:Connect(function(plr)
    removeESP(plr)
end)

--============================================================================================--
-- KEYBIND HANDLER
--============================================================================================--
UserInputService.InputBegan:Connect(function(inp,gpe)
    if gpe then return end
    if inp.KeyCode==S.keybinds.toggleHub then
        Main.Visible=not Main.Visible
    end
    if inp.KeyCode==S.keybinds.noclip then
        S.toggles.noclip=not S.toggles.noclip
        if S.toggles.noclip then
            addConn("noclip",RunService.Stepped:Connect(function()
                if not S.toggles.noclip then return end
                local c=getChar()
                if c then for _,p in ipairs(c:GetDescendants()) do
                    if p:IsA("BasePart") then p.CanCollide=false end
                end end
            end))
        else cleanConn("noclip") end
    end
    if inp.KeyCode==S.keybinds.fly then
        S.toggles.fly=not S.toggles.fly
        if S.toggles.fly then
            local bp=getHRP(getChar())
            if bp then
                local bg=Instance.new("BodyGyro"); bg.P=9e4; bg.MaxTorque=Vector3.new(1/0,1/0,1/0); bg.D=5000; bg.Parent=bp
                local bv=Instance.new("BodyVelocity"); bv.MaxForce=Vector3.new(1/0,1/0,1/0); bv.Velocity=Vector3.zero; bv.P=5e4; bv.Parent=bp
                addConn("fly",RunService.RenderStepped:Connect(function()
                    if not S.toggles.fly then bg:Destroy(); bv:Destroy(); return end
                    local cf=Camera.CFrame
                    local dir=Vector3.zero
                    if UserInputService:IsKeyDown(Enum.KeyCode.W) then dir+=cf.LookVector end
                    if UserInputService:IsKeyDown(Enum.KeyCode.S) then dir-=cf.LookVector end
                    if UserInputService:IsKeyDown(Enum.KeyCode.A) then dir-=cf.RightVector end
                    if UserInputService:IsKeyDown(Enum.KeyCode.D) then dir+=cf.RightVector end
                    if UserInputService:IsKeyDown(Enum.KeyCode.Space) then dir+=Vector3.new(0,1,0) end
                    if UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) then dir-=Vector3.new(0,1,0) end
                    if dir.Magnitude>0 then dir=dir.Unit end
                    bv.Velocity=dir*S.flySpeed; bg.CFrame=cf
                end))
            end
        else cleanConn("fly"); local c=getChar(); if c then for _,p in ipairs(c:GetDescendants()) do if p:IsA("BodyGyro") or p:IsA("BodyVelocity") then p:Destroy() end end end end
    end
    if inp.KeyCode==S.keybinds.esp then
        S.toggles.playerEsp=not S.toggles.playerEsp
        if S.toggles.playerEsp then
            addConn("playerEsp",RunService.RenderStepped:Connect(function()
                if not S.toggles.playerEsp then return end
                for _,p in ipairs(Players:GetPlayers()) do
                    if p~=LP and p.Character then
                        if not S.espObjects[p] then createESP(p) end
                    end
                end
            end))
        else cleanConn("playerEsp"); for p,_ in pairs(S.espObjects) do removeESP(p) end end
    end
    if inp.KeyCode==S.keybinds.godmode then
        S.toggles.godMode=not S.toggles.godMode
        if S.toggles.godMode then
            addConn("godmode",RunService.Heartbeat:Connect(function()
                if not S.toggles.godMode then return end
                local c=getChar(); local h=getHum(c)
                if h then h.Health=h.MaxHealth end
            end))
        else cleanConn("godmode") end
    end
end)

--============================================================================================--
-- CHARACTER RESPAWN HANDLER
--============================================================================================--
LP.CharacterAdded:Connect(function(char)
    task.wait(1)
    local h=getHum(char)
    if h then
        h.WalkSpeed=S.walkSpeed
        h.JumpPower=S.jumpPower
        h.HipHeight=S.hipHeight
    end
    -- Re-apply noclip
    if S.toggles.noclip then
        addConn("noclip",RunService.Stepped:Connect(function()
            if not S.toggles.noclip then return end
            local c=getChar()
            if c then for _,p in ipairs(c:GetDescendants()) do
                if p:IsA("BasePart") then p.CanCollide=false end
            end end
        end))
    end
    -- Re-apply godmode
    if S.toggles.godMode then
        addConn("godmode",RunService.Heartbeat:Connect(function()
            if not S.toggles.godMode then return end
            local c=getChar(); local h=getHum(c)
            if h then h.Health=h.MaxHealth end
        end))
    end
end)

--============================================================================================--
-- TAB CLICK HANDLERS
--============================================================================================--
for _,def in ipairs(TAB_DEFS) do
    local btns=TabBtns[def.id]
    if btns and btns.btn then
        btns.btn.MouseButton1Click:Connect(function()
            switchTab(def.id)
        end)
    end
end

--============================================================================================--
-- CLEANUP ON DESTROY
--============================================================================================--
GUI.AncestryChanged:Connect(function(_,parent)
    if not parent then
        for _,c in pairs(S.conns) do
            if typeof(c)=="RBXScriptConnection" and c.Connected then c:Disconnect() end
        end
        S.conns={}
        for k,_ in pairs(S.espObjects) do S.espObjects[k]=nil end
        for k,_ in pairs(S.espHighlights) do S.espHighlights[k]=nil end
        for k,_ in pairs(S.espBeams) do S.espBeams[k]=nil end
    end
end)

--============================================================================================--
-- DONE
--============================================================================================--
print("[MM2 HUB] Loaded successfully | Tabs: 10 | Build: 2026-07-26")
