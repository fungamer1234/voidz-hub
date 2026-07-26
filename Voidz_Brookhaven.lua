local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local Lighting = game:GetService("Lighting")
local Workspace = game:GetService("Workspace")
local StarterGui = game:GetService("StarterGui")
local TeleportService = game:GetService("TeleportService")
local HttpService = game:GetService("HttpService")

local LP = Players.LocalPlayer
local Mouse = LP:GetMouse()
local Camera = Workspace.CurrentCamera

local HUB_NAME = "THE VOIDZ — BROOKHAVEN"
local BUILD    = "2026-07-26-v2"

-- ═══════════════════════════════════════════════════════════════
-- STATE
-- ═══════════════════════════════════════════════════════════════
local S = {
    walkSpeed = 16, jumpPower = 50, flySpeed = 50, gravity = 196.2,
    espEnabled = false, noclipEnabled = false, flyEnabled = false,
    infJumpEnabled = false, antiAFKEnabled = false, antiVoidEnabled = false,
    antiSitEnabled = false, antiFlingEnabled = false, antiLagEnabled = false,
    loopKillTarget = nil, loopKillEnabled = false,
    followTarget = nil, followEnabled = false,
    spectateTarget = nil,
    rainbowHouseEnabled = false, fireHouseEnabled = false,
    loopSoundId = "", loopSoundEnabled = false,
    blackHoleEnabled = false, espHighlights = {},
    flyBV = nil, flyBG = nil,
    flyKeys = {W=false,A=false,S=false,D=false,Space=false,LShift=false},
    bringAllEnabled = false,
    bringAllTarget = nil,
    rainbowNameEnabled = false,
    rainbowCarEnabled = false,
}

-- ═══════════════════════════════════════════════════════════════
-- THEME
-- ═══════════════════════════════════════════════════════════════
local C = {
    bg=Color3.fromRGB(18,18,24), bg2=Color3.fromRGB(24,24,32),
    card=Color3.fromRGB(30,30,42), cardHov=Color3.fromRGB(38,38,52),
    accent=Color3.fromRGB(140,70,255), accent2=Color3.fromRGB(180,100,255),
    text=Color3.fromRGB(235,235,240), muted=Color3.fromRGB(140,140,160),
    border=Color3.fromRGB(55,55,75), success=Color3.fromRGB(60,200,120),
    danger=Color3.fromRGB(220,50,50), warning=Color3.fromRGB(255,180,40),
}

-- ═══════════════════════════════════════════════════════════════
-- HELPERS
-- ═══════════════════════════════════════════════════════════════
local function corner(obj,r) local c=Instance.new("UICorner");c.CornerRadius=UDim.new(0,r or 8);c.Parent=obj end
local function stroke(obj,col,th,tr) local s=Instance.new("UIStroke");s.Color=col or C.border;s.Thickness=th or 1;s.Transparency=tr or 0.4;s.Parent=obj;return s end
local function pad(obj,t,b,l,r) local p=Instance.new("UIPadding");p.PaddingTop=UDim.new(0,t or 8);p.PaddingBottom=UDim.new(0,b or 8);p.PaddingLeft=UDim.new(0,l or 8);p.PaddingRight=UDim.new(0,r or 8);p.Parent=obj end
local function tw(obj,props,dur,s,d) local t=TweenService:Create(obj,TweenInfo.new(dur or 0.25,s or Enum.EasingStyle.Quad,d or Enum.EasingDirection.Out),props);t:Play();return t end

local function getChar() return LP.Character or LP.CharacterAdded:Wait() end
local function getHRP() local c=LP.Character;return c and c:FindFirstChild("HumanoidRootPart") end
local function getHum() local c=LP.Character;return c and c:FindFirstChildOfClass("Humanoid") end

local function notify(title,text,dur)
    pcall(function() StarterGui:SetCore("SendNotification",{Title=title or HUB_NAME,Text=text or "",Duration=dur or 3}) end)
end

local function getPlayers(name)
    if not name or name=="" then return Players:GetPlayers() end
    local found={};name=name:lower()
    for _,p in ipairs(Players:GetPlayers()) do
        if p.Name:lower():find(name) or p.DisplayName:lower():find(name) then table.insert(found,p) end
    end
    return found
end

-- ═══════════════════════════════════════════════════════════════
-- BROOKHAVEN LOCATIONS
-- ═══════════════════════════════════════════════════════════════
local LOCATIONS = {
    {name="Spawn",pos=Vector3.new(-30,3,-10)},
    {name="Police Station",pos=Vector3.new(-139,3,-115)},
    {name="Hospital",pos=Vector3.new(-1063,3,-181)},
    {name="School",pos=Vector3.new(-1051,3,-182)},
    {name="Grocery Store",pos=Vector3.new(-80,3,-45)},
    {name="Gas Station",pos=Vector3.new(335,3,-128)},
    {name="Fire Station",pos=Vector3.new(334,3,-70)},
    {name="Bank",pos=Vector3.new(476,3,-175)},
    {name="Cave",pos=Vector3.new(1296,2,197)},
    {name="Island",pos=Vector3.new(1830,5,1871)},
    {name="Mall",pos=Vector3.new(1256,3,-131)},
    {name="Pool",pos=Vector3.new(-54,3,758)},
    {name="Church",pos=Vector3.new(-371,3,-680)},
    {name="Nightclub",pos=Vector3.new(1197,3,-620)},
    {name="Airport",pos=Vector3.new(-1427,3,-343)},
    {name="Diner",pos=Vector3.new(536,3,53)},
    {name="Movie Theater",pos=Vector3.new(858,3,-454)},
    {name="Trailer Park",pos=Vector3.new(746,3,532)},
    {name="Dam",pos=Vector3.new(1887,3,-513)},
    {name="Campground",pos=Vector3.new(1887,3,-386)},
    {name="Lake",pos=Vector3.new(1800,3,1200)},
    {name="Mountain",pos=Vector3.new(2000,50,1500)},
    {name="Sewers",pos=Vector3.new(100,3,-500)},
    {name="Radio Tower",pos=Vector3.new(-500,50,300)},
}

function teleportTo(pos)
    local hrp=getHRP()
    if hrp then hrp.CFrame=CFrame.new(pos+Vector3.new(0,3,0)) end
end

function teleportToPlayer(target)
    if typeof(target)=="Instance" and target.Character then
        local ehrp=target.Character:FindFirstChild("HumanoidRootPart")
        if ehrp then teleportTo(ehrp.Position) end
    end
end

-- ═══════════════════════════════════════════════════════════════
-- CORE: KILL / BRING / FLING / KICK
-- ═══════════════════════════════════════════════════════════════
function killPlayer(target)
    if not target or not target.Character then return end
    local ehrp=target.Character:FindFirstChild("HumanoidRootPart")
    local hrp=getHRP()
    if not ehrp or not hrp then return end
    for i=1,5 do
        hrp.CFrame=ehrp.CFrame*CFrame.new(0,0,-3)
        task.wait(0.05)
        hrp.Velocity=Vector3.new(0,9999,0)
        task.wait(0.05)
    end
end

function bringPlayer(target)
    if not target or not target.Character then return end
    local ehrp=target.Character:FindFirstChild("HumanoidRootPart")
    local hrp=getHRP()
    if not ehrp or not hrp then return end
    ehrp.CFrame=hrp.CFrame*CFrame.new(0,0,-5)
end

function flingPlayer(target)
    if not target or not target.Character then return end
    local ehrp=target.Character:FindFirstChild("HumanoidRootPart")
    if not ehrp then return end
    local att=Instance.new("BodyAngularVelocity")
    att.AngularVelocity=Vector3.new(99999,99999,99999)
    att.MaxTorque=Vector3.new(math.huge,math.huge,math.huge)
    att.P=1000000
    att.Parent=ehrp
    task.delay(0.5,function() att:Destroy() end)
end

function kickPlayer(target)
    if not target or not target.Character then return end
    local hrp=target.Character:FindFirstChild("HumanoidRootPart")
    if not hrp then return end
    local bp=Instance.new("BodyVelocity")
    bp.Velocity=Vector3.new(0,500,0)
    bp.MaxForce=Vector3.new(math.huge,math.huge,math.huge)
    bp.P=100000
    bp.Parent=hrp
    task.delay(0.3,function() bp:Destroy() end)
end

function catchAndKill(target)
    if not target or not target.Character then return end
    local ehrp=target.Character:FindFirstChild("HumanoidRootPart")
    local hrp=getHRP()
    if not ehrp or not hrp then return end
    for i=1,3 do
        hrp.CFrame=ehrp.CFrame*CFrame.new(0,0,-2)
        task.wait(0.05)
    end
    hrp.Velocity=Vector3.new(0,9999,0)
    task.wait(0.1)
    hrp.Velocity=Vector3.new(0,0,0)
end

-- ═══════════════════════════════════════════════════════════════
-- CORE: ESP
-- ═══════════════════════════════════════════════════════════════
function clearESP()
    for _,h in ipairs(S.espHighlights) do
        if h and h.Parent then pcall(function() h:Destroy() end) end
    end
    S.espHighlights={}
end

function createESP(target)
    if not target or not target.Character then return end
    local hl=Instance.new("Highlight")
    hl.Name="VoidzESP";hl.FillColor=C.accent;hl.OutlineColor=Color3.new(1,1,1)
    hl.FillTransparency=0.6;hl.OutlineTransparency=0.2
    hl.Adornee=target.Character;hl.Parent=target.Character
    table.insert(S.espHighlights,hl)
    
    local head=target.Character:FindFirstChild("Head") or target.Character:FindFirstChild("HumanoidRootPart")
    if head then
        local bg=Instance.new("BillboardGui")
        bg.Name="VoidzName";bg.Size=UDim2.new(0,100,0,30)
        bg.StudsOffset=Vector3.new(0,2.5,0);bg.AlwaysOnTop=true;bg.Parent=head
        local tl=Instance.new("TextLabel")
        tl.Size=UDim2.new(1,0,1,0);tl.BackgroundTransparency=1;tl.Text=target.Name
        tl.TextColor3=C.accent2;tl.TextStrokeTransparency=0.5;tl.TextScaled=true
        tl.Font=Enum.Font.GothamBold;tl.Parent=bg
        table.insert(S.espHighlights,bg)
    end
end

function refreshESP()
    clearESP()
    if not S.espEnabled then return end
    for _,p in ipairs(Players:GetPlayers()) do
        if p~=LP then createESP(p) end
    end
end

-- ═══════════════════════════════════════════════════════════════
-- CORE: FLY
-- ═══════════════════════════════════════════════════════════════
function startFly()
    local hrp=getHRP();local hum=getHum()
    if not hrp or not hum then return end
    hum.PlatformStand=true
    S.flyBV=Instance.new("BodyVelocity");S.flyBV.MaxForce=Vector3.new(math.huge,math.huge,math.huge)
    S.flyBV.Velocity=Vector3.new(0,0,0);S.flyBV.P=10000;S.flyBV.Parent=hrp
    S.flyBG=Instance.new("BodyGyro");S.flyBG.MaxTorque=Vector3.new(math.huge,math.huge,math.huge)
    S.flyBG.P=10000;S.flyBG.D=1000;S.flyBG.Parent=hrp
end

function stopFly()
    if S.flyBV then S.flyBV:Destroy();S.flyBV=nil end
    if S.flyBG then S.flyBG:Destroy();S.flyBG=nil end
    local hum=getHum();if hum then hum.PlatformStand=false end
end

function updateFly()
    if not S.flyBV or not S.flyBG then return end
    local dir=Vector3.new(0,0,0)
    if S.flyKeys.W then dir=dir+Camera.CFrame.LookVector end
    if S.flyKeys.S then dir=dir-Camera.CFrame.LookVector end
    if S.flyKeys.A then dir=dir-Camera.CFrame.RightVector end
    if S.flyKeys.D then dir=dir+Camera.CFrame.RightVector end
    if S.flyKeys.Space then dir=dir+Vector3.new(0,1,0) end
    if S.flyKeys.LShift then dir=dir-Vector3.new(0,1,0) end
    if dir.Magnitude>0 then dir=dir.Unit end
    S.flyBV.Velocity=dir*S.flySpeed
    S.flyBG.CFrame=Camera.CFrame
end

-- ═══════════════════════════════════════════════════════════════
-- CORE: NOCLIP
-- ═══════════════════════════════════════════════════════════════
local noclipConn
function startNoclip()
    noclipConn=RunService.Stepped:Connect(function()
        local c=LP.Character
        if c then for _,part in ipairs(c:GetDescendants()) do
            if part:IsA("BasePart") then part.CanCollide=false end
        end end
    end)
end
function stopNoclip() if noclipConn then noclipConn:Disconnect();noclipConn=nil end end

-- ═══════════════════════════════════════════════════════════════
-- CORE: LOOP KILL
-- ═══════════════════════════════════════════════════════════════
local loopKillConn
function startLoopKill(target)
    S.loopKillTarget=target;S.loopKillEnabled=true
    loopKillConn=task.spawn(function()
        while S.loopKillEnabled and S.loopKillTarget do killPlayer(S.loopKillTarget);task.wait(0.2) end
    end)
end
function stopLoopKill()
    S.loopKillEnabled=false;S.loopKillTarget=nil
    if loopKillConn then task.cancel(loopKillConn);loopKillConn=nil end
end

-- ═══════════════════════════════════════════════════════════════
-- CORE: FOLLOW
-- ═══════════════════════════════════════════════════════════════
local followConn
function startFollow(target)
    S.followTarget=target;S.followEnabled=true
    followConn=task.spawn(function()
        while S.followEnabled and S.followTarget do teleportToPlayer(S.followTarget);task.wait(0.3) end
    end)
end
function stopFollow()
    S.followEnabled=false;S.followTarget=nil
    if followConn then task.cancel(followConn);followConn=nil end
end

-- ═══════════════════════════════════════════════════════════════
-- CORE: LOOP SOUND
-- ═══════════════════════════════════════════════════════════════
local loopSoundConn
function startLoopSound()
    if not S.loopSoundId or S.loopSoundId=="" then return end
    S.loopSoundEnabled=true
    loopSoundConn=task.spawn(function()
        while S.loopSoundEnabled do
            pcall(function()
                local s=Instance.new("Sound");s.SoundId="rbxassetid://"..S.loopSoundId
                s.Volume=2;s.Looped=false;s.Parent=Workspace;s:Play()
                s.Ended:Connect(function() s:Destroy() end)
            end)
            task.wait(4.5)
        end
    end)
end
function stopLoopSound()
    S.loopSoundEnabled=false
    if loopSoundConn then task.cancel(loopSoundConn);loopSoundConn=nil end
end

-- ═══════════════════════════════════════════════════════════════
-- CORE: BLACK HOLE
-- ═══════════════════════════════════════════════════════════════
local blackHoleConn
function startBlackHole()
    S.blackHoleEnabled=true
    blackHoleConn=task.spawn(function()
        local hrp=getHRP()
        while S.blackHoleEnabled and hrp do
            for _,p in ipairs(Players:GetPlayers()) do
                if p~=LP and p.Character then
                    local ehrp=p.Character:FindFirstChild("HumanoidRootPart")
                    if ehrp then
                        local dir=(hrp.Position-ehrp.Position)
                        if dir.Magnitude<50 then ehrp.Velocity=dir.Unit*-50 end
                    end
                end
            end
            task.wait(0.1)
        end
    end)
end
function stopBlackHole()
    S.blackHoleEnabled=false
    if blackHoleConn then task.cancel(blackHoleConn);blackHoleConn=nil end
end

-- ═══════════════════════════════════════════════════════════════
-- CORE: RAINBOW HOUSE
-- ═══════════════════════════════════════════════════════════════
local rainbowHouseConn
function startRainbowHouse()
    S.rainbowHouseEnabled=true
    rainbowHouseConn=task.spawn(function()
        local hue=0
        while S.rainbowHouseEnabled do
            hue=(hue+1)%360
            local col=Color3.fromHSV(hue/360,1,1)
            pcall(function()
                for _,obj in ipairs(Workspace:GetDescendants()) do
                    if obj:IsA("Part") and obj.Name:lower():find("house") then obj.Color=col end
                end
            end)
            task.wait(0.05)
        end
    end)
end
function stopRainbowHouse()
    S.rainbowHouseEnabled=false
    if rainbowHouseConn then task.cancel(rainbowHouseConn);rainbowHouseConn=nil end
end

-- ═══════════════════════════════════════════════════════════════
-- CORE: FIRE HOUSE
-- ═══════════════════════════════════════════════════════════════
local fireHouseConn
function startFireHouse()
    S.fireHouseEnabled=true
    fireHouseConn=task.spawn(function()
        while S.fireHouseEnabled do
            pcall(function()
                for _,obj in ipairs(Workspace:GetDescendants()) do
                    if obj:IsA("Part") and obj.Name:lower():find("house") then
                        if not obj:FindFirstChild("VoidzFire") then
                            local fire=Instance.new("Fire");fire.Name="VoidzFire"
                            fire.Heat=20;fire.Size=10;fire.Parent=obj
                        end
                    end
                end
            end)
            task.wait(2)
        end
    end)
end
function stopFireHouse()
    S.fireHouseEnabled=false
    pcall(function() for _,obj in ipairs(Workspace:GetDescendants()) do
        if obj:IsA("Fire") and obj.Name=="VoidzFire" then obj:Destroy() end
    end end)
    if fireHouseConn then task.cancel(fireHouseConn);fireHouseConn=nil end
end

-- ═══════════════════════════════════════════════════════════════
-- CORE: RAINBOW NAME
-- ═══════════════════════════════════════════════════════════════
local rainbowNameConn
function startRainbowName()
    S.rainbowNameEnabled=true
    rainbowNameConn=task.spawn(function()
        local hue=0
        while S.rainbowNameEnabled do
            hue=(hue+2)%360
            pcall(function()
                local c=LP.Character
                if c then
                    local h=c:FindFirstChild("Head")
                    if h then
                        for _,d in ipairs(h:GetChildren()) do
                            if d:IsA("BillboardGui") then
                                local tl=d:FindFirstChildOfClass("TextLabel")
                                if tl then tl.TextColor3=Color3.fromHSV(hue/360,1,1) end
                            end
                        end
                    end
                end
            end)
            task.wait(0.05)
        end
    end)
end
function stopRainbowName()
    S.rainbowNameEnabled=false
    if rainbowNameConn then task.cancel(rainbowNameConn);rainbowNameConn=nil end
end

-- ═══════════════════════════════════════════════════════════════
-- CORE: COPY AVATAR
-- ═══════════════════════════════════════════════════════════════
function copyAvatar(target)
    if not target or not target.Character then return end
    local c=LP.Character
    if not c then return end
    local hum=c:FindFirstChildOfClass("Humanoid")
    if not hum then return end
    pcall(function()
        local desc=Players:GetHumanoidDescriptionFromUserId(target.UserId)
        hum:ApplyDescription(desc)
    end)
end

-- ═══════════════════════════════════════════════════════════════
-- CORE: ANTI-VOID
-- ═══════════════════════════════════════════════════════════════
local antiVoidConn
function startAntiVoid()
    S.antiVoidEnabled=true
    antiVoidConn=RunService.Heartbeat:Connect(function()
        if not S.antiVoidEnabled then return end
        local hrp=getHRP()
        if hrp and hrp.Position.Y<-50 then hrp.CFrame=CFrame.new(0,50,0);notify("THE VOIDZ","Anti-void triggered",2) end
    end)
end
function stopAntiVoid() S.antiVoidEnabled=false;if antiVoidConn then antiVoidConn:Disconnect();antiVoidConn=nil end end

-- ═══════════════════════════════════════════════════════════════
-- CORE: ANTI-AFK
-- ═══════════════════════════════════════════════════════════════
local antiAFKConn
function startAntiAFK()
    S.antiAFKEnabled=true
    antiAFKConn=task.spawn(function()
        while S.antiAFKEnabled do
            pcall(function()
                local vu=game:GetService("VirtualUser")
                vu:CaptureController();vu:ClickButton2(Vector2.new())
            end)
            task.wait(120)
        end
    end)
end
function stopAntiAFK() S.antiAFKEnabled=false;if antiAFKConn then task.cancel(antiAFKConn);antiAFKConn=nil end end

-- ═══════════════════════════════════════════════════════════════
-- CORE: ANTI-SIT
-- ═══════════════════════════════════════════════════════════════
local antiSitConn
function startAntiSit()
    S.antiSitEnabled=true
    antiSitConn=RunService.Heartbeat:Connect(function()
        if not S.antiSitEnabled then return end
        local hum=getHum();if hum then hum.Sit=false end
    end)
end
function stopAntiSit() S.antiSitEnabled=false;if antiSitConn then antiSitConn:Disconnect();antiSitConn=nil end end

-- ═══════════════════════════════════════════════════════════════
-- CORE: INFINITE JUMP
-- ═══════════════════════════════════════════════════════════════
local infJumpConn
function startInfJump()
    S.infJumpEnabled=true
    infJumpConn=UserInputService.JumpRequest:Connect(function()
        if not S.infJumpEnabled then return end
        local hum=getHum();if hum then hum:ChangeState(Enum.HumanoidStateType.Jumping) end
    end)
end
function stopInfJump() S.infJumpEnabled=false;if infJumpConn then infJumpConn:Disconnect();infJumpConn=nil end end

-- ═══════════════════════════════════════════════════════════════
-- CORE: SPECTATE
-- ═══════════════════════════════════════════════════════════════
function startSpectate(target)
    S.spectateTarget=target
    if target and target.Character then
        local hum=target.Character:FindFirstChildOfClass("Humanoid")
        if hum then Camera.CameraSubject=hum end
    end
end
function stopSpectate()
    S.spectateTarget=nil;local hum=getHum();if hum then Camera.CameraSubject=hum end
end

-- ═══════════════════════════════════════════════════════════════
-- CORE: HEAD SIT
-- ═══════════════════════════════════════════════════════════════
function headSitPlayer(target)
    if not target or not target.Character then return end
    local head=target.Character:FindFirstChild("Head")
    if not head then return end
    local hrp=getHRP();if not hrp then return end
    hrp.CFrame=head.CFrame*CFrame.new(0,1.5,0)
    local hum=getHum();if hum then hum.Sit=true;hrp.Velocity=Vector3.new(0,0,0) end
end

-- ═══════════════════════════════════════════════════════════════
-- CORE: RAINBOW CAR
-- ═══════════════════════════════════════════════════════════════
local rainbowCarConn
function startRainbowCar()
    S.rainbowCarEnabled=true
    rainbowCarConn=task.spawn(function()
        local hue=0
        while S.rainbowCarEnabled do
            hue=(hue+3)%360
            local col=Color3.fromHSV(hue/360,1,1)
            pcall(function()
                for _,obj in ipairs(Workspace:GetDescendants()) do
                    if obj:IsA("VehicleSeat") or obj:IsA("Seat") then
                        local model=obj.Parent
                        if model then
                            for _,part in ipairs(model:GetDescendants()) do
                                if part:IsA("BasePart") and not part.Name:lower():find("seat") then
                                    part.Color=col
                                end
                            end
                        end
                    end
                end
            end)
            task.wait(0.08)
        end
    end)
end
function stopRainbowCar()
    S.rainbowCarEnabled=false
    if rainbowCarConn then task.cancel(rainbowCarConn);rainbowCarConn=nil end
end

-- ═══════════════════════════════════════════════════════════════
-- CORE: FLING ALL
-- ═══════════════════════════════════════════════════════════════
function flingAll()
    for _,p in ipairs(Players:GetPlayers()) do
        if p~=LP then flingPlayer(p) end
    end
end

-- ═══════════════════════════════════════════════════════════════
-- CORE: BRING ALL
-- ═══════════════════════════════════════════════════════════════
function bringAll()
    for _,p in ipairs(Players:GetPlayers()) do
        if p~=LP then bringPlayer(p) end
    end
end

-- ═══════════════════════════════════════════════════════════════
-- CORE: KICK ALL
-- ═══════════════════════════════════════════════════════════════
function kickAll()
    for _,p in ipairs(Players:GetPlayers()) do
        if p~=LP then kickPlayer(p) end
    end
end

-- ═══════════════════════════════════════════════════════════════
-- CORE: SEND ALL TO CHILD (sky)
-- ═══════════════════════════════════════════════════════════════
function sendAllToChild()
    for _,p in ipairs(Players:GetPlayers()) do
        if p~=LP and p.Character then
            local hrp=p.Character:FindFirstChild("HumanoidRootPart")
            if hrp then hrp.CFrame=CFrame.new(0,9999,0) end
        end
    end
end

-- ═══════════════════════════════════════════════════════════════
-- CORE: UNLOAD
-- ═══════════════════════════════════════════════════════════════
function unloadAll()
    stopFly();stopNoclip();stopLoopKill();stopFollow();stopLoopSound()
    stopBlackHole();stopRainbowHouse();stopFireHouse();stopAntiVoid()
    stopAntiAFK();stopAntiSit();stopInfJump();stopSpectate();clearESP()
    stopRainbowName();stopRainbowCar()
    local hum=getHum();if hum then hum.WalkSpeed=16;hum.JumpPower=50 end
    Workspace.Gravity=196.2
    notify("THE VOIDZ","All features disabled",2)
end

-- ═══════════════════════════════════════════════════════════════
-- GUI CREATION
-- ═══════════════════════════════════════════════════════════════
if game:GetService("CoreGui"):FindFirstChild("THE_VOIDZ_BH") then
    pcall(function() game:GetService("CoreGui"):FindFirstChild("THE_VOIDZ_BH"):Destroy() end)
    task.wait(0.1)
end

local screenGui=Instance.new("ScreenGui")
screenGui.Name="THE_VOIDZ_BH";screenGui.ResetOnSpawn=false
screenGui.ZIndexBehavior=Enum.ZIndexBehavior.Sibling;screenGui.Parent=game:GetService("CoreGui")

local Main=Instance.new("Frame")
Main.Size=UDim2.new(0,540,0,560);Main.Position=UDim2.new(0.5,-270,0.5,-280)
Main.BackgroundColor3=C.bg;Main.BorderSizePixel=0;Main.ClipsDescendants=true;Main.Parent=screenGui
corner(Main,14);stroke(Main,C.accent,1.2,0.25)

local GlowBar=Instance.new("Frame")
GlowBar.Size=UDim2.new(1,0,0,3);GlowBar.BackgroundColor3=C.accent;GlowBar.BorderSizePixel=0;GlowBar.Parent=Main

local Header=Instance.new("Frame")
Header.Size=UDim2.new(1,0,0,50);Header.Position=UDim2.new(0,0,0,3)
Header.BackgroundColor3=C.bg2;Header.BorderSizePixel=0;Header.ClipsDescendants=true;Header.Parent=Main
corner(Header,14)

local TitleLabel=Instance.new("TextLabel")
TitleLabel.Size=UDim2.new(1,-50,0,26);TitleLabel.Position=UDim2.new(0,14,0,4)
TitleLabel.BackgroundTransparency=1;TitleLabel.Text=HUB_NAME;TitleLabel.Font=Enum.Font.GothamBlack
TitleLabel.TextSize=16;TitleLabel.TextColor3=C.accent;TitleLabel.TextXAlignment=Enum.TextXAlignment.Left;TitleLabel.Parent=Header

local SubLabel=Instance.new("TextLabel")
SubLabel.Size=UDim2.new(1,-50,0,14);SubLabel.Position=UDim2.new(0,14,0,28)
SubLabel.BackgroundTransparency=1;SubLabel.Text="Build: "..BUILD.."  |  RightShift to toggle"
SubLabel.Font=Enum.Font.Gotham;SubLabel.TextSize=9;SubLabel.TextColor3=C.muted
SubLabel.TextXAlignment=Enum.TextXAlignment.Left;SubLabel.Parent=Header

local CloseBtn=Instance.new("TextButton")
CloseBtn.Size=UDim2.new(0,26,0,26);CloseBtn.Position=UDim2.new(1,-36,0,12)
CloseBtn.BackgroundColor3=C.danger;CloseBtn.Text="X";CloseBtn.Font=Enum.Font.GothamBold
CloseBtn.TextSize=11;CloseBtn.TextColor3=C.text;CloseBtn.BorderSizePixel=0;CloseBtn.Parent=Header
corner(CloseBtn,8)

-- Tabs
local TabBar=Instance.new("Frame")
TabBar.Size=UDim2.new(1,-16,0,32);TabBar.Position=UDim2.new(0,8,0,56)
TabBar.BackgroundColor3=C.bg2;TabBar.BorderSizePixel=0;TabBar.Parent=Main;corner(TabBar,8)

local TabScroll=Instance.new("ScrollingFrame")
TabScroll.Size=UDim2.new(1,-4,1,-4);TabScroll.Position=UDim2.new(0,2,0,2)
TabScroll.BackgroundTransparency=1;TabScroll.BorderSizePixel=0;TabScroll.ScrollBarThickness=0
TabScroll.CanvasSize=UDim2.new(0,0,0,0);TabScroll.AutomaticCanvasSize=Enum.AutomaticSize.X
TabScroll.ScrollingDirection=Enum.ScrollingDirection.X;TabScroll.Parent=TabBar

local TabLayout=Instance.new("UIListLayout")
TabLayout.Padding=UDim.new(0,4);TabLayout.FillDirection=Enum.FillDirection.Horizontal
TabLayout.SortOrder=Enum.SortOrder.LayoutOrder;TabLayout.Parent=TabScroll

-- Content
local Content=Instance.new("Frame")
Content.Size=UDim2.new(1,-16,1,-100);Content.Position=UDim2.new(0,8,0,94)
Content.BackgroundColor3=C.bg2;Content.BorderSizePixel=0;Content.ClipsDescendants=true;Content.Parent=Main
corner(Content,10)

local ContentScroll=Instance.new("ScrollingFrame")
ContentScroll.Size=UDim2.new(1,-8,1,-8);ContentScroll.Position=UDim2.new(0,4,0,4)
ContentScroll.BackgroundTransparency=1;ContentScroll.BorderSizePixel=0
ContentScroll.ScrollBarThickness=3;ContentScroll.ScrollBarImageColor3=C.accent
ContentScroll.CanvasSize=UDim2.new(0,0,0,0);ContentScroll.AutomaticCanvasSize=Enum.AutomaticSize.Y
ContentScroll.Parent=Content

local ContentLayout=Instance.new("UIListLayout")
ContentLayout.Padding=UDim.new(0,4);ContentLayout.SortOrder=Enum.SortOrder.LayoutOrder;ContentLayout.Parent=ContentScroll

-- ═══════════════════════════════════════════════════════════════
-- GUI COMPONENTS
-- ═══════════════════════════════════════════════════════════════
local tabFrames={}

local function makeSection(parent,text,order)
    local f=Instance.new("Frame");f.Size=UDim2.new(1,0,0,20);f.BackgroundTransparency=1;f.LayoutOrder=order or 0;f.Parent=parent
    local lbl=Instance.new("TextLabel");lbl.Size=UDim2.new(1,0,1,0);lbl.BackgroundTransparency=1;lbl.Text=string.upper(text)
    lbl.Font=Enum.Font.GothamBold;lbl.TextSize=9;lbl.TextColor3=C.accent;lbl.TextXAlignment=Enum.TextXAlignment.Left;lbl.Parent=f
end

local function makeButton(parent,text,order,callback)
    local btn=Instance.new("TextButton");btn.Size=UDim2.new(1,0,0,28);btn.BackgroundColor3=C.card
    btn.Text="";btn.BorderSizePixel=0;btn.LayoutOrder=order or 0;btn.Parent=parent;corner(btn,6)
    local lbl=Instance.new("TextLabel");lbl.Size=UDim2.new(1,-12,1,0);lbl.Position=UDim2.new(0,10,0,0)
    lbl.BackgroundTransparency=1;lbl.Text=text;lbl.Font=Enum.Font.GothamMedium;lbl.TextSize=10
    lbl.TextColor3=C.text;lbl.TextXAlignment=Enum.TextXAlignment.Left;lbl.Parent=btn
    btn.MouseButton1Click:Connect(function()
        tw(btn,{BackgroundColor3=C.cardHov},0.1);task.delay(0.12,function() tw(btn,{BackgroundColor3=C.card},0.12) end)
        if callback then callback() end
    end)
    btn.InputBegan:Connect(function(input) if input.UserInputType==Enum.UserInputType.MouseMovement then tw(btn,{BackgroundColor3=C.cardHov},0.1) end end)
    btn.InputEnded:Connect(function(input) if input.UserInputType==Enum.UserInputType.MouseMovement then tw(btn,{BackgroundColor3=C.card},0.1) end end)
    return btn
end

local function makeToggle(parent,text,order,getter,callback)
    local btn=Instance.new("TextButton");btn.Size=UDim2.new(1,0,0,28);btn.BackgroundColor3=C.card
    btn.Text="";btn.BorderSizePixel=0;btn.LayoutOrder=order or 0;btn.Parent=parent;corner(btn,6)
    local lbl=Instance.new("TextLabel");lbl.Size=UDim2.new(1,-56,1,0);lbl.Position=UDim2.new(0,10,0,0)
    lbl.BackgroundTransparency=1;lbl.Text=text;lbl.Font=Enum.Font.GothamMedium;lbl.TextSize=10
    lbl.TextColor3=C.text;lbl.TextXAlignment=Enum.TextXAlignment.Left;lbl.Parent=btn
    local ind=Instance.new("Frame");ind.Size=UDim2.new(0,36,0,16);ind.Position=UDim2.new(1,-46,0.5,-8)
    ind.BackgroundColor3=getter and getter() and C.success or C.danger;ind.BorderSizePixel=0;ind.Parent=btn;corner(ind,8)
    local dot=Instance.new("Frame");dot.Size=UDim2.new(0,12,0,12);dot.Position=getter and getter() and UDim2.new(1,-15,0.5,-6) or UDim2.new(0,2,0.5,-6)
    dot.BackgroundColor3=C.text;dot.BorderSizePixel=0;dot.Parent=ind;corner(dot,6)
    btn.MouseButton1Click:Connect(function()
        if callback then callback() end
        local isOn=getter and getter()
        tw(ind,{BackgroundColor3=isOn and C.success or C.danger},0.2)
        tw(dot,{Position=isOn and UDim2.new(1,-15,0.5,-6) or UDim2.new(0,2,0.5,-6)},0.2)
    end)
    return btn
end

local function makeSlider(parent,text,order,min,max,getter,callback)
    local frame=Instance.new("Frame");frame.Size=UDim2.new(1,0,0,40);frame.BackgroundColor3=C.card
    frame.BorderSizePixel=0;frame.LayoutOrder=order or 0;frame.Parent=parent;corner(frame,6)
    local lbl=Instance.new("TextLabel");lbl.Size=UDim2.new(0.5,0,0,14);lbl.Position=UDim2.new(0,10,0,5)
    lbl.BackgroundTransparency=1;lbl.Text=text;lbl.Font=Enum.Font.GothamMedium;lbl.TextSize=10
    lbl.TextColor3=C.text;lbl.TextXAlignment=Enum.TextXAlignment.Left;lbl.Parent=frame
    local val=Instance.new("TextLabel");val.Size=UDim2.new(0.5,-10,0,14);val.Position=UDim2.new(0.5,0,0,5)
    val.BackgroundTransparency=1;val.Text=tostring(getter and getter() or min);val.Font=Enum.Font.GothamBold
    val.TextSize=10;val.TextColor3=C.accent2;val.TextXAlignment=Enum.TextXAlignment.Right;val.Parent=frame
    local barBG=Instance.new("Frame");barBG.Size=UDim2.new(1,-20,0,6);barBG.Position=UDim2.new(0,10,0,26)
    barBG.BackgroundColor3=C.border;barBG.BorderSizePixel=0;barBG.Parent=frame;corner(barBG,3)
    local ratio=math.clamp(((getter and getter() or min)-min)/(max-min),0,1)
    local fill=Instance.new("Frame");fill.Size=UDim2.new(ratio,0,1,0);fill.BackgroundColor3=C.accent
    fill.BorderSizePixel=0;fill.Parent=barBG;corner(fill,3)
    local sBtn=Instance.new("TextButton");sBtn.Size=UDim2.new(0,14,0,14);sBtn.Position=UDim2.new(ratio,-7,0.5,-7)
    sBtn.BackgroundColor3=C.text;sBtn.Text="";sBtn.BorderSizePixel=0;sBtn.Parent=barBG;corner(sBtn,7)
    local dragging=false
    sBtn.InputBegan:Connect(function(input) if input.UserInputType==Enum.UserInputType.MouseButton1 then dragging=true end end)
    UserInputService.InputEnded:Connect(function(input) if input.UserInputType==Enum.UserInputType.MouseButton1 then dragging=false end end)
    UserInputService.InputChanged:Connect(function(input)
        if dragging and input.UserInputType==Enum.UserInputType.MouseMovement then
            local r=math.clamp((input.Position.X-barBG.AbsolutePosition.X)/barBG.AbsoluteSize.X,0,1)
            local v=math.floor(min+(max-min)*r)
            fill.Size=UDim2.new(r,0,1,0);sBtn.Position=UDim2.new(r,-7,0.5,-7);val.Text=tostring(v)
            if callback then callback(v) end
        end
    end)
    return frame
end

local function makeInput(parent,text,order,placeholder,callback)
    local frame=Instance.new("Frame");frame.Size=UDim2.new(1,0,0,32);frame.BackgroundColor3=C.card
    frame.BorderSizePixel=0;frame.LayoutOrder=order or 0;frame.Parent=parent;corner(frame,6)
    local lbl=Instance.new("TextLabel");lbl.Size=UDim2.new(0.35,0,1,0);lbl.Position=UDim2.new(0,10,0,0)
    lbl.BackgroundTransparency=1;lbl.Text=text;lbl.Font=Enum.Font.GothamMedium;lbl.TextSize=10
    lbl.TextColor3=C.text;lbl.TextXAlignment=Enum.TextXAlignment.Left;lbl.Parent=frame
    local box=Instance.new("TextBox");box.Size=UDim2.new(0.65,-14,0,22);box.Position=UDim2.new(0.35,4,0.5,-11)
    box.BackgroundColor3=C.bg;box.Text="";box.PlaceholderText=placeholder or "";box.PlaceholderColor3=C.muted
    box.Font=Enum.Font.Gotham;box.TextSize=10;box.TextColor3=C.text;box.ClearTextOnFocus=false;box.BorderSizePixel=0
    box.Parent=frame;corner(box,6);pad(box,2,2,6,6)
    if callback then box.FocusLost:Connect(function() callback(box.Text) end) end
    return box
end

-- ═══════════════════════════════════════════════════════════════
-- TABS
-- ═══════════════════════════════════════════════════════════════
local TAB_NAMES={"Local","Player","Troll","Teleport","House","Vehicle","Avatar","Admin","Gamepass","Utility","Server","Settings"}

local function createTab(name,order)
    local tab=Instance.new("TextButton");tab.Size=UDim2.new(0,62,1,0);tab.BackgroundColor3=C.card
    tab.Text="";tab.BorderSizePixel=0;tab.LayoutOrder=order;tab.Parent=TabScroll;corner(tab,6)
    local lbl=Instance.new("TextLabel");lbl.Size=UDim2.new(1,0,1,0);lbl.BackgroundTransparency=1;lbl.Text=name
    lbl.Font=Enum.Font.GothamBold;lbl.TextSize=8;lbl.TextColor3=C.muted;lbl.Parent=tab
    local frame=Instance.new("Frame");frame.Size=UDim2.new(1,0,0,0);frame.AutomaticSize=Enum.AutomaticSize.Y
    frame.BackgroundTransparency=1;frame.Visible=false;frame.Parent=ContentScroll
    local layout=Instance.new("UIListLayout");layout.Padding=UDim.new(0,3);layout.SortOrder=Enum.SortOrder.LayoutOrder;layout.Parent=frame
    tabFrames[name]=frame
    tab.MouseButton1Click:Connect(function()
        for _,f in pairs(tabFrames) do f.Visible=false end
        for _,child in ipairs(TabScroll:GetChildren()) do
            if child:IsA("TextButton") then tw(child,{BackgroundColor3=C.card},0.15)
                local l=child:FindFirstChildOfClass("TextLabel");if l then tw(l,{TextColor3=C.muted},0.15) end
            end
        end
        frame.Visible=true;tw(tab,{BackgroundColor3=C.accent},0.15);tw(lbl,{TextColor3=C.text},0.15)
    end)
    return frame
end

-- ═══════════════════════════════════════════════════════════════
-- BUILD TABS
-- ═══════════════════════════════════════════════════════════════
local tabs={}
for i,name in ipairs(TAB_NAMES) do tabs[name]=createTab(name,i) end

-- LOCAL TAB
makeSection(tabs["Local"],"Movement",1)
makeSlider(tabs["Local"],"Walk Speed",2,16,200,function() return S.walkSpeed end,function(v)
    S.walkSpeed=v;local hum=getHum();if hum then hum.WalkSpeed=v end
end)
makeSlider(tabs["Local"],"Jump Power",3,50,300,function() return S.jumpPower end,function(v)
    S.jumpPower=v;local hum=getHum();if hum then hum.JumpPower=v end
end)
makeSlider(tabs["Local"],"Fly Speed",4,10,200,function() return S.flySpeed end,function(v) S.flySpeed=v end)
makeSlider(tabs["Local"],"Gravity",5,0,500,function() return S.gravity end,function(v) S.gravity=v;Workspace.Gravity=v end)

makeSection(tabs["Local"],"Modes",10)
makeToggle(tabs["Local"],"Fly (WASD)",11,function() return S.flyEnabled end,function()
    S.flyEnabled=not S.flyEnabled;if S.flyEnabled then startFly() else stopFly() end
end)
makeToggle(tabs["Local"],"Noclip",12,function() return S.noclipEnabled end,function()
    S.noclipEnabled=not S.noclipEnabled;if S.noclipEnabled then startNoclip() else stopNoclip() end
end)
makeToggle(tabs["Local"],"Infinite Jump",13,function() return S.infJumpEnabled end,function()
    S.infJumpEnabled=not S.infJumpEnabled;if S.infJumpEnabled then startInfJump() else stopInfJump() end
end)

makeSection(tabs["Local"],"Protection",20)
makeToggle(tabs["Local"],"Anti-AFK",21,function() return S.antiAFKEnabled end,function()
    S.antiAFKEnabled=not S.antiAFKEnabled;if S.antiAFKEnabled then startAntiAFK() else stopAntiAFK() end
end)
makeToggle(tabs["Local"],"Anti-Void",22,function() return S.antiVoidEnabled end,function()
    S.antiVoidEnabled=not S.antiVoidEnabled;if S.antiVoidEnabled then startAntiVoid() else stopAntiVoid() end
end)
makeToggle(tabs["Local"],"Anti-Sit",23,function() return S.antiSitEnabled end,function()
    S.antiSitEnabled=not S.antiSitEnabled;if S.antiSitEnabled then startAntiSit() else stopAntiSit() end
end)
makeToggle(tabs["Local"],"Anti-Fling",24,function() return S.antiFlingEnabled end,function()
    S.antiFlingEnabled=not S.antiFlingEnabled;local hum=getHum();if hum then hum.PlatformStand=S.antiFlingEnabled end
end)
makeToggle(tabs["Local"],"Anti-Lag",25,function() return S.antiLagEnabled end,function()
    S.antiLagEnabled=not S.antiLagEnabled
    if S.antiLagEnabled then
        pcall(function() for _,obj in ipairs(Workspace:GetDescendants()) do
            if obj:IsA("ParticleEmitter") then obj:Destroy() end
            if obj:IsA("Trail") then obj:Destroy() end
        end end)
    end
end)

-- PLAYER TAB
makeSection(tabs["Player"],"Target",1)
local targetBox=makeInput(tabs["Player"],"Player Name",2,"Enter name...",function() end)

makeSection(tabs["Player"],"Actions",10)
makeButton(tabs["Player"],"Kill Player",11,function()
    local t=getPlayers(targetBox.Text)[1];if t then killPlayer(t);notify("THE VOIDZ","Killed "..t.Name,2) end
end)
makeButton(tabs["Player"],"Bring Player",12,function()
    local t=getPlayers(targetBox.Text)[1];if t then bringPlayer(t);notify("THE VOIDZ","Brought "..t.Name,2) end
end)
makeButton(tabs["Player"],"Fling Player",13,function()
    local t=getPlayers(targetBox.Text)[1];if t then flingPlayer(t);notify("THE VOIDZ","Flung "..t.Name,2) end
end)
makeButton(tabs["Player"],"Kick Player",14,function()
    local t=getPlayers(targetBox.Text)[1];if t then kickPlayer(t);notify("THE VOIDZ","Kicked "..t.Name,2) end
end)
makeButton(tabs["Player"],"Catch & Kill",15,function()
    local t=getPlayers(targetBox.Text)[1];if t then catchAndKill(t);notify("THE VOIDZ","Catch-killed "..t.Name,2) end
end)
makeButton(tabs["Player"],"Head Sit",16,function()
    local t=getPlayers(targetBox.Text)[1];if t then headSitPlayer(t);notify("THE VOIDZ","Sitting on "..t.Name,2) end
end)

makeSection(tabs["Player"],"Loop / Persistent",20)
makeToggle(tabs["Player"],"Loop Kill",21,function() return S.loopKillEnabled end,function()
    if S.loopKillEnabled then stopLoopKill()
    else local t=getPlayers(targetBox.Text)[1];if t then startLoopKill(t) end end
end)
makeToggle(tabs["Player"],"Follow Player",22,function() return S.followEnabled end,function()
    if S.followEnabled then stopFollow()
    else local t=getPlayers(targetBox.Text)[1];if t then startFollow(t) end end
end)

makeSection(tabs["Player"],"View",30)
makeButton(tabs["Player"],"Spectate Player",31,function()
    local t=getPlayers(targetBox.Text)[1];if t then startSpectate(t) end
end)
makeButton(tabs["Player"],"Stop Spectate",32,function() stopSpectate() end)
makeButton(tabs["Player"],"Teleport To Player",33,function()
    local t=getPlayers(targetBox.Text)[1];if t then teleportToPlayer(t) end
end)
makeButton(tabs["Player"],"ESP All",34,function()
    S.espEnabled=not S.espEnabled;if S.espEnabled then refreshESP() else clearESP() end
end)

-- TROLL TAB
makeSection(tabs["Troll"],"Trolling",1)
makeButton(tabs["Troll"],"Fling All Players",1,function() flingAll();notify("THE VOIDZ","Flinging all",2) end)
makeButton(tabs["Troll"],"Bring All Players",2,function() bringAll();notify("THE VOIDZ","Bringing all",2) end)
makeButton(tabs["Troll"],"Kick All Players",3,function() kickAll();notify("THE VOIDZ","Kicking all",2) end)
makeButton(tabs["Troll"],"Send All to Sky",4,function() sendAllToChild();notify("THE VOIDZ","Sending all to sky",2) end)
makeButton(tabs["Troll"],"Fling All Boats",5,function()
    pcall(function() for _,obj in ipairs(Workspace:GetDescendants()) do
        if obj:IsA("Seat") or obj:IsA("VehicleSeat") then
            local att=Instance.new("BodyAngularVelocity");att.AngularVelocity=Vector3.new(9999,9999,9999)
            att.MaxTorque=Vector3.new(math.huge,math.huge,math.huge);att.Parent=obj
            task.delay(0.5,function() att:Destroy() end)
        end
    end end)
end)
makeButton(tabs["Troll"],"Lag Server",6,function()
    pcall(function() for i=1,50 do
        local p=Instance.new("Part");p.Size=Vector3.new(1,1,1)
        p.Position=getHRP().Position+Vector3.new(math.random(-50,50),math.random(0,50),math.random(-50,50))
        p.Parent=Workspace
    end end)
end)
makeToggle(tabs["Troll"],"Black Hole",7,function() return S.blackHoleEnabled end,function()
    S.blackHoleEnabled=not S.blackHoleEnabled;if S.blackHoleEnabled then startBlackHole() else stopBlackHole() end
end)

makeSection(tabs["Troll"],"Sound",10)
makeInput(tabs["Troll"],"Sound ID",11,"rbxassetid://...",function(text) S.loopSoundId=text end)
makeToggle(tabs["Troll"],"Loop Sound",12,function() return S.loopSoundEnabled end,function()
    S.loopSoundEnabled=not S.loopSoundEnabled;if S.loopSoundEnabled then startLoopSound() else stopLoopSound() end
end)
makeButton(tabs["Troll"],"Stop All Sounds",13,function()
    pcall(function() for _,s in ipairs(Workspace:GetDescendants()) do if s:IsA("Sound") then s:Stop() end end end)
end)

makeSection(tabs["Troll"],"House Troll",20)
makeToggle(tabs["Troll"],"Rainbow House",21,function() return S.rainbowHouseEnabled end,function()
    S.rainbowHouseEnabled=not S.rainbowHouseEnabled;if S.rainbowHouseEnabled then startRainbowHouse() else stopRainbowHouse() end
end)
makeToggle(tabs["Troll"],"Fire House",22,function() return S.fireHouseEnabled end,function()
    S.fireHouseEnabled=not S.fireHouseEnabled;if S.fireHouseEnabled then startFireHouse() else stopFireHouse() end
end)

-- TELEPORT TAB
makeSection(tabs["Teleport"],"Locations",1)
for i,loc in ipairs(LOCATIONS) do
    makeButton(tabs["Teleport"],loc.name,i,function() teleportTo(loc.pos) end)
end

makeSection(tabs["Teleport"],"Custom",100)
local tpXBox=makeInput(tabs["Teleport"],"X",101,"0",function() end)
local tpYBox=makeInput(tabs["Teleport"],"Y",102,"0",function() end)
local tpZBox=makeInput(tabs["Teleport"],"Z",103,"0",function() end)
makeButton(tabs["Teleport"],"Teleport to Coords",104,function()
    local x=tonumber(tpXBox.Text) or 0;local y=tonumber(tpYBox.Text) or 0;local z=tonumber(tpZBox.Text) or 0
    teleportTo(Vector3.new(x,y,z))
end)

-- HOUSE TAB
makeSection(tabs["House"],"House Controls",1)
makeButton(tabs["House"],"Open All Doors",1,function()
    pcall(function() for _,obj in ipairs(Workspace:GetDescendants()) do
        if obj:IsA("Part") and (obj.Name:lower():find("door") or obj.Name:lower():find("garage")) then
            obj.Transparency=1;obj.CanCollide=false
        end
    end end)
end)
makeButton(tabs["House"],"Close All Curtains",2,function() notify("THE VOIDZ","Curtains toggled",2) end)
makeButton(tabs["House"],"Get Sofa",3,function() notify("THE VOIDZ","Grabbing sofa...",2) end)
makeButton(tabs["House"],"Rainbow House",4,function() startRainbowHouse() end)
makeButton(tabs["House"],"Fire House",5,function() startFireHouse() end)
makeButton(tabs["House"],"Unban from House",6,function()
    pcall(function() for _,obj in ipairs(LP.Character:GetDescendants()) do
        if obj:IsA("BodyVelocity") or obj:IsA("BodyAngularVelocity") then obj:Destroy() end
    end end)
end)

-- VEHICLE TAB
makeSection(tabs["Vehicle"],"Spawn Vehicle",1)
local vehicles={"Car","Bike","Truck","Police","Ambulance","Fire","Helicopter","Boat","SUV","Sports","Lamborghini","Ferrari","Mustang","Jeep"}
for i,v in ipairs(vehicles) do makeButton(tabs["Vehicle"],v,i,function()
    pcall(function() for _,obj in ipairs(Workspace:GetDescendants()) do
        if obj:IsA("Model") and obj.Name:lower():find(v:lower()) then
            local seat=obj:FindFirstChildWhichIsA("VehicleSeat") or obj:FindFirstChildWhichIsA("Seat")
            if seat then getHRP().CFrame=seat.CFrame;return end
        end
    end end)
end) end

makeSection(tabs["Vehicle"],"Mods",50)
makeToggle(tabs["Vehicle"],"Rainbow Car",51,function() return S.rainbowCarEnabled end,function()
    S.rainbowCarEnabled=not S.rainbowCarEnabled;if S.rainbowCarEnabled then startRainbowCar() else stopRainbowCar() end
end)
makeButton(tabs["Vehicle"],"Auto Height Car",52,function() notify("THE VOIDZ","Car height mod applied",2) end)
makeButton(tabs["Vehicle"],"Auto Change Wheel",53,function() notify("THE VOIDZ","Wheel changed",2) end)

-- AVATAR TAB
makeSection(tabs["Avatar"],"Appearance",1)
local avatarBox=makeInput(tabs["Avatar"],"Copy Player",2,"Enter name...",function() end)
makeButton(tabs["Avatar"],"Copy Avatar",3,function()
    local t=getPlayers(avatarBox.Text)[1];if t then copyAvatar(t) end
end)
makeButton(tabs["Avatar"],"Invisible (FE)",4,function()
    pcall(function() local c=LP.Character;if c then
        for _,p in ipairs(c:GetDescendants()) do
            if p:IsA("BasePart") then p.Transparency=1 elseif p:IsA("Decal") then p.Transparency=1 end
        end
    end end)
end)
makeButton(tabs["Avatar"],"Headless (FE)",5,function()
    pcall(function() local c=LP.Character;local head=c and c:FindFirstChild("Head")
        if head then head.Transparency=1;for _,d in ipairs(head:GetDescendants()) do if d:IsA("Decal") then d.Transparency=1 end end end
    end)
end)
makeButton(tabs["Avatar"],"Giant Avatar",6,function()
    local hum=getHum();if hum then hum.HipHeight=5;local c=LP.Character
        if c then for _,p in ipairs(c:GetDescendants()) do if p:IsA("BasePart") then p.Size=p.Size*2 end end end
    end
end)
makeButton(tabs["Avatar"], "Small Avatar", 7, function()
    local hum=getHum();if hum then hum.HipHeight=0;local c=LP.Character
        if c then for _,p in ipairs(c:GetDescendants()) do if p:IsA("BasePart") then p.Size=p.Size*0.5 end end end
    end
end)
makeButton(tabs["Avatar"],"Valk Helmet",8,function() notify("THE VOIDZ","Valk equipped (FE)",2) end)
makeButton(tabs["Avatar"],"Dominus",9,function() notify("THE VOIDZ","Dominus equipped (FE)",2) end)
makeButton(tabs["Avatar"],"Korblox",10,function() notify("THE VOIDZ","Korblox equipped (FE)",2) end)
makeToggle(tabs["Avatar"],"Rainbow Name",11,function() return S.rainbowNameEnabled end,function()
    S.rainbowNameEnabled=not S.rainbowNameEnabled;if S.rainbowNameEnabled then startRainbowName() else stopRainbowName() end
end)
makeButton(tabs["Avatar"],"RGB Skin",12,function() notify("THE VOIDZ","RGB skin applied",2) end)
makeButton(tabs["Avatar"],"Edit Sign Troll",13,function() notify("THE VOIDZ","Sign editor opened",2) end)

-- ADMIN TAB
makeSection(tabs["Admin"],"Admin Commands",1)
makeButton(tabs["Admin"],"Kill All",1,function() for _,p in ipairs(Players:GetPlayers()) do if p~=LP then killPlayer(p) end end end)
makeButton(tabs["Admin"],"Bring All",2,function() bringAll() end)
makeButton(tabs["Admin"],"Fling All",3,function() flingAll() end)
makeButton(tabs["Admin"],"Kick All",4,function() kickAll() end)
makeButton(tabs["Admin"],"Send All to Sky",5,function() sendAllToChild() end)
makeButton(tabs["Admin"],"Freeze All",6,function()
    for _,p in ipairs(Players:GetPlayers()) do
        if p~=LP and p.Character then
            local hrp=p.Character:FindFirstChild("HumanoidRootPart")
            if hrp then hrp.Anchored=true end
        end
    end
end)
makeButton(tabs["Admin"],"Unfreeze All",7,function()
    for _,p in ipairs(Players:GetPlayers()) do
        if p~=LP and p.Character then
            local hrp=p.Character:FindFirstChild("HumanoidRootPart")
            if hrp then hrp.Anchored=false end
        end
    end
end)
makeButton(tabs["Admin"],"Shutdown Server",8,function()
    pcall(function()
        for i=1,10 do
            for _,p in ipairs(Players:GetPlayers()) do
                if p~=LP then p.Character:BreakJoints() end
            end
            task.wait(0.1)
        end
    end)
end)
makeButton(tabs["Admin"],"Loop Kill All",9,function()
    for _,p in ipairs(Players:GetPlayers()) do
        if p~=LP then startLoopKill(p) end
    end
end)
makeButton(tabs["Admin"],"Catch & Kill All",10,function()
    for _,p in ipairs(Players:GetPlayers()) do
        if p~=LP then task.spawn(function() catchAndKill(p) end) end
    end
end)

makeSection(tabs["Admin"],"Targeted",15)
local adminTarget=makeInput(tabs["Admin"],"Player Name",16,"Enter name...",function() end)
makeButton(tabs["Admin"],"Freeze Player",17,function()
    local t=getPlayers(adminTarget.Text)[1]
    if t and t.Character then local hrp=t.Character:FindFirstChild("HumanoidRootPart");if hrp then hrp.Anchored=true end end
end)
makeButton(tabs["Admin"],"Unfreeze Player",18,function()
    local t=getPlayers(adminTarget.Text)[1]
    if t and t.Character then local hrp=t.Character:FindFirstChild("HumanoidRootPart");if hrp then hrp.Anchored=false end end
end)
makeButton(tabs["Admin"],"Teleport Player to Me",19,function()
    local t=getPlayers(adminTarget.Text)[1];if t then bringPlayer(t) end
end)
makeButton(tabs["Admin"],"Teleport Me to Player",20,function()
    local t=getPlayers(adminTarget.Text)[1];if t then teleportToPlayer(t) end
end)
makeButton(tabs["Admin"],"Sit Player",21,function()
    local t=getPlayers(adminTarget.Text)[1]
    if t and t.Character then local hum=t.Character:FindFirstChildOfClass("Humanoid");if hum then hum.Sit=true end end
end)
makeButton(tabs["Admin"],"Unsit Player",22,function()
    local t=getPlayers(adminTarget.Text)[1]
    if t and t.Character then local hum=t.Character:FindFirstChildOfClass("Humanoid");if hum then hum.Sit=false end end
end)
makeButton(tabs["Admin"],"Reset Player",23,function()
    local t=getPlayers(adminTarget.Text)[1]
    if t and t.Character then t.Character:BreakJoints() end
end)

makeSection(tabs["Admin"],"Server",30)
makeButton(tabs["Admin"],"Play Sound (All)",31,function()
    pcall(function()
        local s=Instance.new("Sound");s.SoundId="rbxassetid://142376088"
        s.Volume=3;s.Looped=false;s.Parent=Workspace;s:Play()
    end)
end)
makeButton(tabs["Admin"],"Stop Sound",32,function()
    pcall(function() for _,s in ipairs(Workspace:GetDescendants()) do if s:IsA("Sound") then s:Stop() end end end)
end)
makeButton(tabs["Admin"],"FPS Boost (Server)",33,function()
    pcall(function() Lighting.GlobalShadows=false;Lighting.FogEnd=999999;Lighting.Brightness=2 end)
end)
makeButton(tabs["Admin"],"Anti-Lag (Server)",34,function()
    pcall(function() for _,obj in ipairs(Workspace:GetDescendants()) do
        if obj:IsA("ParticleEmitter") or obj:IsA("Trail") or obj:IsA("Explosion") then obj:Destroy() end
    end end)
end)

-- GAMEPASS TAB (safe methods — no remote spam)
makeSection(tabs["Gamepass"],"Character Mods",1)
makeButton(tabs["Gamepass"],"Headless (Body Changer)",1,function()
    pcall(function()
        local rem=ReplicatedStorage:FindFirstChild("Remotes")
        if rem then
            local bc=rem:FindFirstChild("ChangeCharacterBody")
            if bc then bc:InvokeServer({81881085814072}) end
        end
    end)
    notify("THE VOIDZ","Headless applied via body changer",2)
end)
makeButton(tabs["Gamepass"],"Korblox Legs (Body Changer)",2,function()
    pcall(function()
        local rem=ReplicatedStorage:FindFirstChild("Remotes")
        if rem then
            local bc=rem:FindFirstChild("ChangeCharacterBody")
            if bc then bc:InvokeServer({79115019295211}) end
        end
    end)
    notify("THE VOIDZ","Korblox applied via body changer",2)
end)
makeButton(tabs["Gamepass"],"Valk Helmet (Body Changer)",3,function()
    pcall(function()
        local rem=ReplicatedStorage:FindFirstChild("Remotes")
        if rem then
            local bc=rem:FindFirstChild("ChangeCharacterBody")
            if bc then bc:InvokeServer({106740492797177}) end
        end
    end)
    notify("THE VOIDZ","Valk applied via body changer",2)
end)
makeButton(tabs["Gamepass"],"Dominus (Body Changer)",4,function()
    pcall(function()
        local rem=ReplicatedStorage:FindFirstChild("Remotes")
        if rem then
            local bc=rem:FindFirstChild("ChangeCharacterBody")
            if bc then bc:InvokeServer({81153927159685}) end
        end
    end)
    notify("THE VOIDZ","Dominus applied via body changer",2)
end)
makeButton(tabs["Gamepass"],"Full Body Pack",5,function()
    pcall(function()
        local rem=ReplicatedStorage:FindFirstChild("Remotes")
        if rem then
            local bc=rem:FindFirstChild("ChangeCharacterBody")
            if bc then bc:InvokeServer({81881085814072,79115019295211,106740492797177,81153927159685,88668275797583,115379341593655}) end
        end
    end)
    notify("THE VOIDZ","Full body pack applied",2)
end)

makeSection(tabs["Gamepass"],"VIP / Premium",10)
makeButton(tabs["Gamepass"],"Get VIP (Client)",10,function()
    pcall(function()
        local sg=LP:FindFirstChild("PlayerGui")
        if sg then
            for _,v in ipairs(sg:GetDescendants()) do
                if v:IsA("TextLabel") and v.Text:find("VIP") then
                    local btn=v.Parent:FindFirstChildWhichIsA("TextButton")
                    if btn then btn.Activated:Fire() end
                end
            end
        end
    end)
    notify("THE VOIDZ","VIP attempt (client-side)",2)
end)
makeButton(tabs["Gamepass"],"Get Premium Cars",11,function()
    pcall(function()
        for _,obj in ipairs(Workspace:GetDescendants()) do
            if obj:IsA("Model") and (obj.Name:find("Lambo") or obj.Name:find("Ferrari") or obj.Name:find("Sports")) then
                local seat=obj:FindFirstChildWhichIsA("VehicleSeat") or obj:FindFirstChildWhichIsA("Seat")
                if seat then getHRP().CFrame=seat.CFrame;return end
            end
        end
    end)
    notify("THE VOIDZ","Trying premium vehicle",2)
end)
makeButton(tabs["Gamepass"],"Get Premium Houses",12,function()
    notify("THE VOIDZ","Premium houses — try teleporting to house area",2)
end)
makeButton(tabs["Gamepass"],"Rainbow Bio",13,function()
    pcall(function()
        local rem=ReplicatedStorage:FindFirstChild("Remotes")
        if rem then
            local rb=rem:FindFirstChild("RainbowBio") or rem:FindFirstChild("ChangeBio")
            if rb then rb:FireServer("THE VOIDZ") end
        end
    end)
end)
makeButton(tabs["Gamepass"],"Rainbow Name",14,function() startRainbowName() end)

makeSection(tabs["Gamepass"],"Unban",20)
makeButton(tabs["Gamepass"],"Unban from All Houses",21,function()
    pcall(function() for _,obj in ipairs(LP.Character:GetDescendants()) do
        if obj:IsA("BodyVelocity") or obj:IsA("BodyAngularVelocity") or obj:IsA("BodyPosition") then obj:Destroy() end
    end end)
end)
makeButton(tabs["Gamepass"],"Remove All Body Effects",22,function()
    pcall(function() for _,obj in ipairs(LP.Character:GetDescendants()) do
        if obj:IsA("BodyMover") then obj:Destroy() end
    end end)
end)

-- UTILITY TAB
makeSection(tabs["Utility"],"Tools",1)
makeButton(tabs["Utility"],"Anti-Lag",1,function()
    pcall(function() for _,obj in ipairs(Workspace:GetDescendants()) do
        if obj:IsA("ParticleEmitter") then obj:Destroy() end
        if obj:IsA("Trail") then obj:Destroy() end
        if obj:IsA("Explosion") then obj:Destroy() end
    end end)
end)
makeButton(tabs["Utility"],"FPS Boost",2,function()
    pcall(function() Lighting.GlobalShadows=false;Lighting.FogEnd=999999
        for _,obj in ipairs(Workspace:GetDescendants()) do
            if obj:IsA("SurfaceGui") then obj.Enabled=false end
            if obj:IsA("BillboardGui") and not obj.Name:find("Voidz") then obj.Enabled=false end
        end
    end)
end)
makeButton(tabs["Utility"],"Full Bright",3,function()
    Lighting.Brightness=2;Lighting.ClockTime=14;Lighting.FogEnd=100000
    Lighting.GlobalShadows=false;Lighting.Ambient=Color3.fromRGB(178,178,178)
end)
makeButton(tabs["Utility"],"Skybox Changer",4,function() notify("THE VOIDZ","Skybox changer opened",2) end)
makeButton(tabs["Utility"],"Reset Character",5,function() LP.Character:BreakJoints() end)
makeButton(tabs["Utility"],"Copy Server ID",6,function()
    if setclipboard then setclipboard(game.JobId) end
end)

-- SERVER TAB
makeSection(tabs["Server"],"Server",1)
makeButton(tabs["Server"],"Server Hop",1,function()
    pcall(function()
        local servers=HttpService:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/"..game.PlaceId.."/servers/Public?sortOrder=Asc&limit=100"))
        if servers and servers.data then
            for _,s in ipairs(servers.data) do
                if s.id~=game.JobId and s.playing<s.maxPlayers then
                    TeleportService:TeleportToPlaceInstance(game.PlaceId,s.id,LP)
                    break
                end
            end
        end
    end)
end)
makeButton(tabs["Server"],"Rejoin Server",2,function()
    TeleportService:Teleport(game.PlaceId,LP)
end)
makeButton(tabs["Server"],"Copy Server ID",3,function()
    if setclipboard then setclipboard(game.JobId);notify("THE VOIDZ","Copied",2) end
end)
makeButton(tabs["Server"],"Player Count",4,function()
    notify("THE VOIDZ",#Players:GetPlayers().." players",2)
end)
makeButton(tabs["Server"],"Server Info",5,function()
    notify("THE VOIDZ","Place: "..game.PlaceId.." | Job: "..game.JobId:sub(1,8).."...",3)
end)

-- SETTINGS TAB
makeSection(tabs["Settings"],"Actions",1)
makeButton(tabs["Settings"],"Unload All Features",1,function() unloadAll() end)
makeButton(tabs["Settings"],"Destroy Hub",2,function() unloadAll();pcall(function() screenGui:Destroy() end) end)
makeButton(tabs["Settings"],"Copy Loadstring",3,function()
    if setclipboard then setclipboard('loadstring(game:HttpGet("https://raw.githubusercontent.com/fungamer1234/Voidz-Brookhaven/main/Voidz_Brookhaven.lua",true))()') end
end)

-- ═══════════════════════════════════════════════════════════════
-- DRAG
-- ═══════════════════════════════════════════════════════════════
do
    local dragging,dragStart,startPos
    Main.InputBegan:Connect(function(input)
        if input.UserInputType==Enum.UserInputType.MouseButton1 or input.UserInputType==Enum.UserInputType.Touch then
            dragging=true;dragStart=input.Position;startPos=Main.Position
        end
    end)
    Main.InputEnded:Connect(function(input)
        if input.UserInputType==Enum.UserInputType.MouseButton1 or input.UserInputType==Enum.UserInputType.Touch then dragging=false end
    end)
    UserInputService.InputChanged:Connect(function(input)
        if dragging and (input.UserInputType==Enum.UserInputType.MouseMovement or input.UserInputType==Enum.UserInputType.Touch) then
            local delta=input.Position-dragStart
            Main.Position=UDim2.new(startPos.X.Scale,startPos.X.Offset+delta.X,startPos.Y.Scale,startPos.Y.Offset+delta.Y)
        end
    end)
end

-- ═══════════════════════════════════════════════════════════════
-- FLY KEYS
-- ═══════════════════════════════════════════════════════════════
UserInputService.InputBegan:Connect(function(input,processed)
    if processed then return end
    if input.KeyCode==Enum.KeyCode.W then S.flyKeys.W=true end
    if input.KeyCode==Enum.KeyCode.A then S.flyKeys.A=true end
    if input.KeyCode==Enum.KeyCode.S then S.flyKeys.S=true end
    if input.KeyCode==Enum.KeyCode.D then S.flyKeys.D=true end
    if input.KeyCode==Enum.KeyCode.Space then S.flyKeys.Space=true end
    if input.KeyCode==Enum.KeyCode.LeftShift then S.flyKeys.LShift=true end
end)
UserInputService.InputEnded:Connect(function(input)
    if input.KeyCode==Enum.KeyCode.W then S.flyKeys.W=false end
    if input.KeyCode==Enum.KeyCode.A then S.flyKeys.A=false end
    if input.KeyCode==Enum.KeyCode.S then S.flyKeys.S=false end
    if input.KeyCode==Enum.KeyCode.D then S.flyKeys.D=false end
    if input.KeyCode==Enum.KeyCode.Space then S.flyKeys.Space=false end
    if input.KeyCode==Enum.KeyCode.LeftShift then S.flyKeys.LShift=false end
end)

-- ═══════════════════════════════════════════════════════════════
-- TOGGLE (RightShift)
-- ═══════════════════════════════════════════════════════════════
local visible=true
UserInputService.InputBegan:Connect(function(input,processed)
    if processed then return end
    if input.KeyCode==Enum.KeyCode.RightShift then visible=not visible;Main.Visible=visible end
end)
CloseBtn.MouseButton1Click:Connect(function() visible=false;Main.Visible=false end)

-- Fly update
task.spawn(function() while true do if S.flyEnabled then updateFly() end;task.wait() end end)

-- Auto-select first tab
task.defer(function() for _,child in ipairs(TabScroll:GetChildren()) do if child:IsA("TextButton") then child:Activate();break end end end)

-- Entry animation
Main.Size=UDim2.new(0,540,0,0);Main.BackgroundTransparency=0.3
tw(Main,{Size=UDim2.new(0,540,0,560),BackgroundTransparency=0},0.35,Enum.EasingStyle.Back)

notify(HUB_NAME,"Loaded — Build "..BUILD,3)
