
---------// [ NOTIFY ] \\----------
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")

local function LiquidGlassNotify(Title, Text, Icon, Duration)
	local PlayerGui = Players.LocalPlayer:WaitForChild("PlayerGui")
	local UI = PlayerGui:FindFirstChild("LiquidGlassNotifyUI")

	if not UI then
		UI = Instance.new("ScreenGui")
		UI.Name = "LiquidGlassNotifyUI"
		UI.ResetOnSpawn = false
		UI.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
		UI.DisplayOrder = 9999
		UI.Parent = PlayerGui
	end

	local NotifyContainer = UI:FindFirstChild("NotifyContainer")
	if not NotifyContainer then
		NotifyContainer = Instance.new("Frame")
		NotifyContainer.Name = "NotifyContainer"
		NotifyContainer.BackgroundTransparency = 1
		NotifyContainer.Parent = UI

		local UIList = Instance.new("UIListLayout")
		UIList.VerticalAlignment = Enum.VerticalAlignment.Bottom
		UIList.HorizontalAlignment = Enum.HorizontalAlignment.Right
		UIList.Padding = UDim.new(0, 15)
		UIList.SortOrder = Enum.SortOrder.LayoutOrder
		UIList.Parent = NotifyContainer

		local UIPadding = Instance.new("UIPadding")
		UIPadding.PaddingBottom = UDim.new(0, 40)
		UIPadding.PaddingRight = UDim.new(0, 40)
		UIPadding.PaddingTop = UDim.new(0, 40)
		UIPadding.PaddingLeft = UDim.new(0, 40)
		UIPadding.Parent = NotifyContainer

		if UserInputService.TouchEnabled then
			NotifyContainer.Size = UDim2.new(1, 0, 0.5, 0)
			NotifyContainer.Position = UDim2.new(0, 0, 0, 0)
			UIList.VerticalAlignment = Enum.VerticalAlignment.Top
			UIList.HorizontalAlignment = Enum.HorizontalAlignment.Center
		else
			NotifyContainer.Size = UDim2.new(0, 400, 1, 0)
			NotifyContainer.Position = UDim2.new(1, -400, 0, 0)
			UIList.VerticalAlignment = Enum.VerticalAlignment.Bottom
		end
	end

	local DisplayTime = Duration or 5
	local IconAsset = Icon or "rbxassetid://82500352718600"

	local Card = Instance.new("Frame")
	Card.Name = "LiquidCard"
	Card.Size = UDim2.new(1, 0, 0, 0)
	Card.BackgroundTransparency = 1
	Card.ClipsDescendants = false
	Card.LayoutOrder = -os.clock() * 1000
	Card.Parent = NotifyContainer

	local MainGlass = Instance.new("CanvasGroup")
	MainGlass.Name = "MainGlass"
	MainGlass.Size = UDim2.new(0.5, 0, 0.5, 0)
	MainGlass.Position = UDim2.new(0.5, 0, 0.5, 0)
	MainGlass.AnchorPoint = Vector2.new(0.5, 0.5)
	MainGlass.BackgroundColor3 = Color3.fromRGB(30, 30, 35)
	MainGlass.BackgroundTransparency = 1
	MainGlass.GroupTransparency = 1
	MainGlass.BorderSizePixel = 0
	MainGlass.Parent = Card

	local GlassCorner = Instance.new("UICorner")
	GlassCorner.CornerRadius = UDim.new(0, 22)
	GlassCorner.Parent = MainGlass

	local Gradient = Instance.new("UIGradient")
	Gradient.Color = ColorSequence.new({
		ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)),
		ColorSequenceKeypoint.new(1, Color3.fromRGB(180, 180, 200))
	})
	Gradient.Rotation = 45
	Gradient.Parent = MainGlass

	local ReflectionOverlay = Instance.new("Frame")
	ReflectionOverlay.Name = "Reflection"
	ReflectionOverlay.Size = UDim2.new(1, 0, 1, 0)
	ReflectionOverlay.BackgroundTransparency = 1
	ReflectionOverlay.Parent = MainGlass

	local ReflectionGradient = Instance.new("UIGradient")
	ReflectionGradient.Rotation = -45
	ReflectionGradient.Transparency = NumberSequence.new({
		NumberSequenceKeypoint.new(0, 0.8),
		NumberSequenceKeypoint.new(0.5, 1),
		NumberSequenceKeypoint.new(1, 0.9)
	})
	ReflectionGradient.Parent = ReflectionOverlay

	local InnerStroke = Instance.new("UIStroke")
	InnerStroke.Color = Color3.fromRGB(255, 255, 255)
	InnerStroke.Transparency = 0.9
	InnerStroke.Thickness = 1.8
	InnerStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
	InnerStroke.Parent = MainGlass

	local Glow = Instance.new("ImageLabel")
	Glow.Name = "Aura"
	Glow.BackgroundTransparency = 1
	Glow.Position = UDim2.new(0, -25, 0, -25)
	Glow.Size = UDim2.new(1, 50, 1, 50)
	Glow.ZIndex = -1
	Glow.Image = "rbxassetid://5028857084"
	Glow.ImageColor3 = Color3.fromRGB(255, 255, 255)
	Glow.ImageTransparency = 1
	Glow.Parent = MainGlass

	local Content = Instance.new("Frame")
	Content.Size = UDim2.new(1, 0, 1, 0)
	Content.BackgroundTransparency = 1
	Content.Parent = MainGlass

	local IconContainer = Instance.new("Frame")
	IconContainer.Size = UDim2.new(0, 50, 0, 50)
	IconContainer.Position = UDim2.new(0, 18, 0.5, -25)
	IconContainer.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	IconContainer.BackgroundTransparency = 0.92
	IconContainer.Parent = Content

	local IconCorner = Instance.new("UICorner")
	IconCorner.CornerRadius = UDim.new(0, 14)
	IconCorner.Parent = IconContainer

	local IconImg = Instance.new("ImageLabel")
	IconImg.Size = UDim2.new(0, 32, 0, 32)
	IconImg.Position = UDim2.new(0.5, -16, 0.5, -16)
	IconImg.BackgroundTransparency = 1
	IconImg.Image = IconAsset
	IconImg.Parent = IconContainer

	local TitleLabel = Instance.new("TextLabel")
	TitleLabel.Size = UDim2.new(1, -95, 0, 24)
	TitleLabel.Position = UDim2.new(0, 80, 0.5, -22)
	TitleLabel.BackgroundTransparency = 1
	TitleLabel.Font = Enum.Font.GothamBold
	TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
	TitleLabel.TextSize = 16
	TitleLabel.Text = Title or "Notification"
	TitleLabel.TextXAlignment = Enum.TextXAlignment.Left
	TitleLabel.Parent = Content

	local DescLabel = Instance.new("TextLabel")
	DescLabel.Size = UDim2.new(1, -95, 0, 32)
	DescLabel.Position = UDim2.new(0, 80, 0.5, 2)
	DescLabel.BackgroundTransparency = 1
	DescLabel.Font = Enum.Font.GothamMedium
	DescLabel.TextColor3 = Color3.fromRGB(210, 210, 215)
	DescLabel.TextSize = 13
	DescLabel.Text = Text or ""
	DescLabel.TextXAlignment = Enum.TextXAlignment.Left
	DescLabel.TextYAlignment = Enum.TextYAlignment.Top
	DescLabel.TextWrapped = true
	DescLabel.Parent = Content

	local TimerTrack = Instance.new("Frame")
	TimerTrack.Size = UDim2.new(1, -40, 0, 3)
	TimerTrack.Position = UDim2.new(0.5, 0, 1, -8)
	TimerTrack.AnchorPoint = Vector2.new(0.5, 0)
	TimerTrack.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	TimerTrack.BackgroundTransparency = 0.94
	TimerTrack.BorderSizePixel = 0
	TimerTrack.Parent = MainGlass

	local TimerFill = Instance.new("Frame")
	TimerFill.Size = UDim2.new(0, 0, 1, 0)
	TimerFill.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	TimerFill.BackgroundTransparency = 0.4
	TimerFill.BorderSizePixel = 0
	TimerFill.Parent = TimerTrack

	local TimerCorner = Instance.new("UICorner")
	TimerCorner.CornerRadius = UDim.new(1, 0)
	TimerCorner.Parent = TimerTrack

	local TimerFillCorner = Instance.new("UICorner")
	TimerFillCorner.CornerRadius = UDim.new(1, 0)
	TimerFillCorner.Parent = TimerFill

	local SpringInfo = TweenInfo.new(0.9, Enum.EasingStyle.Back, Enum.EasingDirection.Out)
	local FadeInfo = TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)

	TweenService:Create(Card, TweenInfo.new(0.5, Enum.EasingStyle.Quart), {Size = UDim2.new(1, 0, 0, 95)}):Play()

	task.delay(0.05, function()
		TweenService:Create(MainGlass, SpringInfo, {Size = UDim2.new(1, 0, 1, 0), GroupTransparency = 0.15}):Play()
		TweenService:Create(MainGlass, FadeInfo, {BackgroundTransparency = 0.25}):Play()
		TweenService:Create(Glow, TweenInfo.new(1.2), {ImageTransparency = 0.7}):Play()
	end)

	task.delay(0.3, function()
		TweenService:Create(TimerFill, TweenInfo.new(DisplayTime, Enum.EasingStyle.Linear), {Size = UDim2.new(1, 0, 1, 0)}):Play()
	end)

	task.delay(DisplayTime + 0.8, function()
		local ExitSpring = TweenInfo.new(0.6, Enum.EasingStyle.Back, Enum.EasingDirection.In)
		TweenService:Create(MainGlass, ExitSpring, {Size = UDim2.new(0.7, 0, 0.7, 0), GroupTransparency = 1}):Play()
		TweenService:Create(Glow, TweenInfo.new(0.4), {ImageTransparency = 1}):Play()

		task.wait(0.4)
		local FinalCollapse = TweenService:Create(Card, TweenInfo.new(0.4, Enum.EasingStyle.Quart), {Size = UDim2.new(1, 0, 0, 0)})
		FinalCollapse:Play()
		FinalCollapse.Completed:Wait()
		Card:Destroy()
	end)
end

LiquidGlassNotify("Trigon Hub", "Loaded!", "rbxassetid://82500352718600", 5)

----------// [  FISCH  ] \\----------
local Collection = {}; Collection.__index = Collection
local CollectionService = game:GetService("CollectionService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local HttpService = game:GetService("HttpService")
local Workspace = game:GetService("Workspace")
local GuiService = game:GetService("GuiService")
local Lighting = game:GetService("Lighting")
local TweenService = game:GetService("TweenService")
local TeleportService = game:GetService("TeleportService")
local VirtualInputManager = game:GetService("VirtualInputManager")
local VirtualUser = game:GetService("VirtualUser")
local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")
local Backpack = LocalPlayer:WaitForChild("Backpack")
local Camera = Workspace.CurrentCamera

local function ImproveFps()
    RunService.Heartbeat:Connect(function()
        Lighting.GlobalShadows = false
        Workspace.CurrentCamera.CameraType = Enum.CameraType.Scriptable
    end)
end
ImproveFps()
-------// Logic \\-------

local fishCaught = 0
local scriptStartTime = tick()
local _v = {}

local Remotes = ReplicatedStorage.events
local fishingAnimation = ReplicatedStorage.resources.animations.fishing

local zoneTeleportList = {}
for _, v in pairs(workspace.zones.player:GetChildren()) do
    table.insert(zoneTeleportList, v.Name)
end
table.sort(zoneTeleportList)

local rodList = {}
for _, v in pairs(ReplicatedStorage.shared.modules.RodSkins:GetChildren()) do
    table.insert(rodList, v.Name)
end
table.sort(rodList)

local itemList = {}
for _, v in pairs(workspace.Items:GetChildren()) do
    table.insert(itemList, v.Name)
end
table.sort(itemList)

function Collection:tpPlayer(targetPos)
	local LocalPlayer = Players.LocalPlayer
	local character = LocalPlayer.Character
	local hrp = character:FindFirstChild("HumanoidRootPart")
	if hrp then
		hrp.CFrame = targetPos
	end
end

function Collection:getPlayerPos()
    local LocalPlayer = Players.LocalPlayer
    local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
    local root = char:FindFirstChild("HumanoidRootPart")
    return root and root.Position or Vector3.zero
end

function Collection:FireProximity(proximity)
	if proximity:IsA("ProximityPrompt") and proximity.Enabled then
		proximity:InputHoldBegin()
        proximity.HoldDuration = 0
        proximity:InputHoldEnd()
	end
end

function gradient(text)
	local startColor, endColor = Color3.fromHex("#009EFF"), Color3.fromHex("#0005FF")
    local result = ""
    local length = #text
    for i = 1, length do
        local t = (i - 1) / math.max(length - 1, 1)
        local r = math.floor((startColor.R + (endColor.R - startColor.R) * t) * 255)
        local g = math.floor((startColor.G + (endColor.G - startColor.G) * t) * 255)
        local b = math.floor((startColor.B + (endColor.B - startColor.B) * t) * 255)
        local char = text:sub(i, i)
        result = result .. "<font color=\"rgb(" .. r ..", " .. g .. ", " .. b .. ")\">" .. char .. "</font>"
    end
    return "<b>"..result.."</b>"
end

function Collection:ShakeUi(ShakeUI)
    local SafeZone = ShakeUI:WaitForChild("safezone", 1)
    if not SafeZone then return end

    local alive = true
    local conn

    local function press(button)
        if not alive or not button or not button.Parent then return end
        button.Selectable = true
        GuiService.SelectedObject = button
        for _ = 1, 1 do
            VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.Return, false, game)
            VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.Return, false, game)
        end
    end
    
    for _, child in ipairs(SafeZone:GetChildren()) do
        if child:IsA("ImageButton") then
            press(child)
        end
    end
    
    conn = SafeZone.ChildAdded:Connect(function(child)
        if child:IsA("ImageButton") then
            press(child)
        end
    end)

    task.spawn(function()
        while alive and SafeZone:IsDescendantOf(LocalPlayer.PlayerGui) do
            task.wait(0.1)
        end
        alive = false
        if conn then conn:Disconnect() end
        GuiService.SelectedObject = nil
    end)
end

function NoClip()
    local LocalPlayer = Players.LocalPlayer
    local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
	for _, part in ipairs(Character:GetDescendants()) do
		if part:IsA("BasePart") then
			part.CanCollide = false
		end
	end
end

function Collection:findItem(tem)
    local LocalPlayer = Players.LocalPlayer
    local backpack = LocalPlayer:WaitForChild("Backpack")
    local character = LocalPlayer.Character
    
    for _, tool in ipairs(character:GetChildren()) do
        if tool:IsA("Tool") and tool.Name:lower():find(tem:lower()) then
            return tool
        end
    end
    
    for _, tool in ipairs(backpack:GetChildren()) do
        if tool:IsA("Tool") and tool.Name:lower():find(tem:lower()) then
            return tool
        end
    end
    
    return nil
end

function Collection:equipItem(tem)
    local LocalPlayer = Players.LocalPlayer
    local item = Collection:findItem(tem)
    local humanoid = LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
    
    if item and humanoid and item.Parent == LocalPlayer:FindFirstChild("Backpack") then
        humanoid:equipTool(item)
	end
end

function Collection:findHeldItem()
    local LocalPlayer = Players.LocalPlayer
    local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
    return character:FindFirstChildOfClass("Tool")
end

function Collection:getPlayerStats()
    local LocalPlayer = Players.LocalPlayer
    local PlayerStats = workspace:FindFirstChild("PlayerStats")
    if not PlayerStats then return nil end
    
    local playerStat = PlayerStats:FindFirstChild(LocalPlayer.Name)
    if not playerStat then return nil end
    
    return playerStat:FindFirstChild("T"):FindFirstChild(LocalPlayer.Name)
end

function Collection:rodName()
    local stats = Collection:getPlayerStats()
    if not stats then return nil end
    
    local statsData = stats:FindFirstChild("Stats")
    if not statsData then return nil end
    
    return statsData:FindFirstChild("rod").Value
end

function Collection:equipRod()
    local rodName = Collection:rodName()
    if rodName then
        Collection:equipItem(rodName)
    end
end

function Collection:unequipTools()
    local LocalPlayer = Players.LocalPlayer
    local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
    local humanoid = character:FindFirstChildOfClass("Humanoid")
    if humanoid then
        humanoid:UnequipTools()
    end
end

local ReelController = require(game:GetService("ReplicatedStorage").client.legacyControllers.ReelController)
local originalNew = ReelController.new

ReelController.new = function(...)
    local instance = originalNew(...)
    instance.barSize = 1.0
    instance.minBarSize = 1.0
    instance.barPosition = 0.5

    local originalUpdate = instance.Update
    function instance:Update(...)
        local result = originalUpdate(self, ...)
        self.barSize = 1.0
        self.minBarSize = 1.0
        self.barPosition = 0.5
        return result
    end
    
    return instance
end

function Collection:castRod(rod)
    local LocalPlayer = Players.LocalPlayer
    local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
    character:SetAttribute("Fishing", true)
    
    local humanoid = character:FindFirstChildOfClass("Humanoid")
    if humanoid then
        humanoid.WalkSpeed = 4
        
        local throw = humanoid:LoadAnimation(fishingAnimation.throw)
        throw.Priority = Enum.AnimationPriority.Action3
        throw:Play()
        
        local waiting = humanoid:LoadAnimation(fishingAnimation.waiting)
        waiting.Priority = Enum.AnimationPriority.Action3
        waiting:Play()
    end
    
    if rod and rod.events and rod.events.castAsync then
        rod.events.castAsync:InvokeServer(98, 1)
    end
end

local reelInProgress = false

function Collection:InstantReel()
    if reelInProgress then return end
    reelInProgress = true

    local PlayerGui = Players.LocalPlayer:WaitForChild("PlayerGui")
    local reelGui
    local startTime = tick()

    while tick() - startTime < 3 do
        reelGui = PlayerGui:FindFirstChild("reel")
        if reelGui then break end
        task.wait(0.1)
    end

    if not reelGui then
        reelInProgress = false
        return
    end

    local delayValue = getgenv().SuperInstantReelDelay or 0.15
    if delayValue < 0.15 then delayValue = 0.15 end
    
    task.wait(delayValue)
    
    if not reelGui.Parent then
        reelInProgress = false
        return
    end

    local net = ReplicatedStorage:WaitForChild("packages"):WaitForChild("Net")
    net:WaitForChild("RE/Reel/Finish"):FireServer({e = 100, p = true, l = {}})

    local Backpack = Players.LocalPlayer:WaitForChild("Backpack")
    local connection = Backpack.ChildAdded:Connect(function()
        if reelGui and reelGui.Parent then
            reelGui:Destroy()
        end
        reelInProgress = false
        connection:Disconnect()
    end)

    task.delay(1, function()
        if connection.Connected then
            connection:Disconnect()
            if reelGui and reelGui.Parent then
                reelGui:Destroy()
            end
            reelInProgress = false
        end
    end)
end

function Collection:FastReel()
    local PlayerGui = Players.LocalPlayer:WaitForChild("PlayerGui")
    local reelGui = PlayerGui:FindFirstChild("reel")
    
    if not reelGui then return end
    
    local Backpack = Players.LocalPlayer:WaitForChild("Backpack")
    local net = ReplicatedStorage:WaitForChild("packages"):WaitForChild("Net")
    
    net:WaitForChild("RE/Reel/Finish"):FireServer({
        e = 100,
        p = true,
        l = {}
    })
    
    task.delay(0.1, function()
        if reelGui and reelGui.Parent then
            reelGui:Destroy()
        end
    end)
end

function Collection:modifyReelUi(ui)
    if not ui then return end
    local bar = ui:FindFirstChild("bar")
    if not bar then return end
    local playerbar = bar:FindFirstChild("playerbar")
    if not playerbar then return end
    
    local currentScale = playerbar.Size.X.Scale
    playerbar.Size = UDim2.new(currentScale + 0.625, 0, playerbar.Size.Y.Scale, 0)
end

function ChangeAvatar()
    local LocalPlayer = Players.LocalPlayer
    local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
    local randomColor = Color3.fromRGB(math.random(0, 255), math.random(0, 255), math.random(0, 255))

    for _, obj in ipairs(character:GetChildren()) do
        if obj:IsA("Accessory") or obj:IsA("Clothing") or obj:IsA("ShirtGraphic") then
            obj:Destroy()
        end
    end

    for _, obj in ipairs(character:GetChildren()) do
        if obj:IsA("MeshPart") or obj:IsA("Part") then
            obj.Color = randomColor
            obj.Material = Enum.Material.SmoothPlastic
            
            local decal = obj:FindFirstChildWhichIsA("Decal")
            if decal then decal:Destroy() end
            
            for _, child in ipairs(obj:GetChildren()) do
                if child:IsA("SpecialMesh") then
                    child:Destroy()
                end
            end
        end
    end

    local headParts = {"Head", "Torso", "Right Leg", "Left Leg", "Right Arm", "Left Arm"}
    for _, partName in ipairs(headParts) do
        local part = character:FindFirstChild(partName)
        if part then
            local mesh = Instance.new("SpecialMesh")
            mesh.MeshId = "rbxassetid://112170046286421"
            mesh.MeshType = Enum.MeshType.FileMesh
            
            if partName == "Head" then
                mesh.Scale = Vector3.new(1.5, 1.5, 1.5)
                mesh.Offset = Vector3.new(0, 0.3, 0)
                mesh.TextureId = "rbxassetid://99764942615873"
            elseif partName == "Torso" then
                mesh.Scale = Vector3.new(1.3, 2, 1)
            elseif partName == "Right Leg" or partName == "Left Leg" then
                mesh.Scale = Vector3.new(0.9, 2, 0.9)
            elseif partName == "Right Arm" then
                mesh.Scale = Vector3.new(0.6, 1.4, 0.6)
                mesh.Offset = Vector3.new(-0.5, 0.1, 0)
            elseif partName == "Left Arm" then
                mesh.Scale = Vector3.new(0.6, 1.4, 0.6)
                mesh.Offset = Vector3.new(0.5, 0.1, 0)
            end
            
            mesh.Parent = part
        end
    end
end

function Collection:EnableSecurity(state)
    if not state then return end
    
    local LocalPlayer = Players.LocalPlayer
    local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
    local hrp = character:FindFirstChild("HumanoidRootPart")
    if not hrp then return end
    
    local userui = hrp:FindFirstChild("user")
    if not userui then return end
    
    local securityElements = {
        { obj = userui.level, text = "Security Level" },
        { obj = userui.user, text = "Security" },
        { obj = userui.streak, text = "Security Streak", color = Color3.fromRGB(0, 229, 255) },
        { obj = LocalPlayer.PlayerGui.hud.safezone.coins, text = "Security C$" },
        { obj = LocalPlayer.PlayerGui.hud.safezone.lvl, text = "Security Level" }
    }
    
    ChangeAvatar()
    
    for _, element in ipairs(securityElements) do
        if element.obj and element.obj.ClassName == "TextLabel" then
            element.obj.Text = element.text
            if element.color then
                element.obj.TextColor3 = element.color
            end
            
            element.obj:GetPropertyChangedSignal("Text"):Connect(function()
                if element.obj.Text ~= element.text then
                    element.obj.Text = element.text
                    if element.color then
                        element.obj.TextColor3 = element.color
                    end
                end
            end)
        end
    end
    
    local statList = LocalPlayer.PlayerGui.hud.safezone.StatChangeList
    statList.ChildAdded:Connect(function(child)
        child.Text = string.format("+%s Aura", tostring(math.random(1, 1000)))
        child.TextColor3 = Color3.fromRGB(0, 229, 255)
    end)
end

function Collection:disableAnimation()
    local LocalPlayer = Players.LocalPlayer
    local character = LocalPlayer.Character
    if not character then return end

    local humanoid = character:FindFirstChildOfClass("Humanoid")
    if not humanoid then return end

    local animator = humanoid:FindFirstChildOfClass("Animator")
    if not animator then return end

    if _v.disableAnimationConn then
        _v.disableAnimationConn:Disconnect()
        _v.disableAnimationConn = nil
    end

    for _, track in pairs(animator:GetPlayingAnimationTracks()) do
        track:Stop()
    end
    
    _v.disableAnimationConn = animator.AnimationPlayed:Connect(function(track)
        track:Stop()
    end)
end

local flyEnabled = false
local flySpeed = 48
local flightConnection

function Collection:Fly(state)
    flyEnabled = state
    
    if flyEnabled then
        local LocalPlayer = Players.LocalPlayer
        local character = LocalPlayer.Character
        if not character or not character:FindFirstChild("HumanoidRootPart") then return end
        
        local humanoid = character:FindFirstChildOfClass("Humanoid")
        if not humanoid then return end
        
        local bodyGyro = Instance.new("BodyGyro")
        local bodyVelocity = Instance.new("BodyVelocity")
        
        bodyGyro.P = 9000
        bodyGyro.maxTorque = Vector3.new(8999999488, 8999999488, 8999999488)
        bodyGyro.cframe = character.HumanoidRootPart.CFrame
        bodyGyro.Parent = character.HumanoidRootPart
        
        bodyVelocity.velocity = Vector3.new(0, 0, 0)
        bodyVelocity.maxForce = Vector3.new(8999999488, 8999999488, 8999999488)
        bodyVelocity.Parent = character.HumanoidRootPart
        humanoid.PlatformStand = true
        
        flightConnection = RunService.Heartbeat:Connect(function()
            if not flyEnabled or not character:FindFirstChild("HumanoidRootPart") then
                if flightConnection then flightConnection:Disconnect() end
                return
            end
            
            local cam = workspace.CurrentCamera.CFrame
            local moveVec = Vector3.new()
            
            if UserInputService:IsKeyDown(Enum.KeyCode.W) then
                moveVec = moveVec + cam.LookVector
            end
            if UserInputService:IsKeyDown(Enum.KeyCode.S) then
                moveVec = moveVec - cam.LookVector
            end
            if UserInputService:IsKeyDown(Enum.KeyCode.A) then
                moveVec = moveVec - cam.RightVector
            end
            if UserInputService:IsKeyDown(Enum.KeyCode.D) then
                moveVec = moveVec + cam.RightVector
            end
            
            if moveVec.Magnitude > 0 then
                moveVec = moveVec.Unit * flySpeed
            end
            
            if UserInputService:IsKeyDown(Enum.KeyCode.Space) then
                moveVec = moveVec + Vector3.new(0, flySpeed, 0)
            end
            
            if UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) then
                moveVec = moveVec + Vector3.new(0, -flySpeed, 0)
            end
            
            bodyVelocity.velocity = moveVec
            bodyGyro.cframe = cam
        end)
    else
        if flightConnection then
            flightConnection:Disconnect()
            flightConnection = nil
        end
        
        local LocalPlayer = Players.LocalPlayer
        local character = LocalPlayer.Character
        if character then
            local humanoid = character:FindFirstChildOfClass("Humanoid")
            if humanoid then
                humanoid.PlatformStand = false
            end
        end
    end
end

local poolRegistry = {
    ["Megalodon Default"] = "Megalodon",
    ["Megalodon Ancient"] = "Megalodon",
    ["Megalodon Phantom"] = "Megalodon",
    ["The Kraken Pool"] = "Kraken",
    ["Orcas Pool"] = "Orca",
    ["Whales Pool"] = "Blue Whale",
    ["Forsaken Veil - Scylla"] = "Scylla",
    ["Mosslurker"] = "Mosslurker",
    ["Narwhal"] = "Narwhal",
    ["Beluga"] = "Narwhal",
    ["Magician Narwhal"] = "Narwhal",
    ["FischFright25"] = "Frightful Pool"
}

function Collection:updatePoolStatus()
    local fishingZone = workspace.zones.fishing
    if not fishingZone then return end
    
    for poolName, poolType in pairs(poolRegistry) do
        local poolInstance = fishingZone:FindFirstChild(poolName)
        local statusText = poolInstance and "✓ Spawned" or "✗ Not Spawned"
    end
end

function Collection:getActivePool()
    local fishingZone = workspace.zones.fishing
    local activePools = {}
    
    for poolName, poolType in pairs(poolRegistry) do
        if fishingZone:FindFirstChild(poolName) then
            table.insert(activePools, poolType)
        end
    end
    
    return activePools
end

function Collection:useItem(tem)
    local LocalPlayer = Players.LocalPlayer
    local item = Collection:findItem(tem)
    
    if item then
        local humanoid = LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
        if humanoid and item.Parent == LocalPlayer:FindFirstChild("Backpack") then
            humanoid:equipTool(item)
        end
        item:Activate()
    end
end

function Hop()
    local gameId = game.PlaceId
    
    while true do
        local success, response = pcall(function()
            return HttpService:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/" .. gameId .. "/servers/Public?sortOrder=Asc&limit=100"))
        end)
        
        if success and response.data then
            for _, server in ipairs(response.data) do
                if server.playing < server.maxPlayers and server.id ~= game.JobId then
                    TeleportService:TeleportToPlaceInstance(gameId, server.id, LocalPlayer)
                    return
                end
            end
        end
        
        task.wait(1)
    end
end


-------// Start of Script \\-------

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Sindex-Saliii/Sindex-Main/refs/heads/main/DummyUI.lua"))()

local Window = Library:Window({
    Title = "Trigon Hub [ Fisch ]",
    Desc = "by x.saliii",
    Icon = 82500352718600,
    Theme = "Ocean",
    Config = {
        Keybind = Enum.KeyCode.RightControl,
        Size = UDim2.new(0, 500, 0, 400)
    },
    CloseUIButton = {
        Enabled = true,
        Text = "Close UI",
    }
})
Window:SelectTab(1)
local Tabs = {
	Main = Window:Tab({Title = 'Main', Icon = 'layout-grid'}),
    Window:Line(),
	Shop = Window:Tab({Title = 'Shop', Icon = 'shopping-basket'}),
	Teleport = Window:Tab({Title = 'Teleport', Icon = 'rss'}),
	Visual = Window:Tab({Title = 'Visual', Icon = 'eye'}),
	Setting = Window:Tab({Title = 'Setting', Icon = 'cog'}),
    Window:Line(),
	Trigon = Window:Tab({Title = 'Trigon', Icon = 'play'})
}

Tabs.Main:Section({Title = "Main Tab"})
Tabs.Shop:Section({Title = "Shop Tab"})
Tabs.Teleport:Section({Title = "Teleport Tab"})
Tabs.Visual:Section({Title = "Visual Tab"})
Tabs.Setting:Section({Title = "Setting Tab"})
Tabs.Trigon:Section({Title = "Trigon Evo"})

                

Tabs.Trigon:Button({
    Title = "Trigon Discord Link",
    Description = "Copies the Trigon Discord invite link to clipboard",
    Callback = function()
        setclipboard("https://discord.gg/VVpRBZ9cZb")
        LiquidGlassNotify("Trigon Evo", "Discord Link Copied to Clipboard", "rbxassetid://82500352718600", 5)
    end
})

Tabs.Trigon:Button({
    Title = "Copy Trigon HWID",
    Description = "Copies your HWID to clipboard",
    Callback = function()
        local hwid = getHwid()
        setclipboard(hwid)
        LiquidGlassNotify("Trigon Evo", "HWID Copied to Clipboard", "rbxassetid://82500352718600", 5)
    end
})

----// [ Main Tabs ] \\----

Tabs.Main:Toggle({
    Title = "Auto Fishing",
    Description = "Automatically catch fish for you",
    Value = false,
    Callback = function(v)
        getgenv().Settings.Fisching["Auto Fishing"] = v
        LiquidGlassNotify("Trigon Evo", "Auto Fishing "..(v and "Enabled" or "Disabled"), "rbxassetid://82500352718600", 5)
    end
})

task.spawn(function()
    while task.wait(0.1) do
        local Success, Error = pcall(function()
            if getgenv().Settings.Fisching["Auto Fishing"] then
                if not getgenv().Settings.Fisching["Auto Fishing"] then return end 
                local rod = Collection:findHeldItem()

                if rod and rod.Name == Collection:rodName() then
                    local casted = rod.values.casted
                    local lure = rod.values.lure
                    if not casted.Value and lure.Value == 0 then
                        if getgenv().Settings.Setup["Choose Cast Method"] == "Remote" then
                            Collection:castRod(rod)
                        elseif getgenv().Settings.Setup["Choose Cast Method"] == "Virtual Input" then
                            VirtualInputManager:SendMouseButtonEvent(0, 0, 0, true, game, 0)
                            task.wait(0.5)
                            VirtualInputManager:SendMouseButtonEvent(0, 0, 0, false, game, 0)
                        end
                    end
                end
            end
        end)
        if not Success then
            task.wait(3)
            warn("Error Auto Fishing : " .. Error)
        end
    end
end)

Tabs.Main:Dropdown({
    Title = "Select Rod",
    Description = "Choose which rod to use for fishing",
    Options = rodList,
    Value = rodList[1],
    Callback = function(v)
        getgenv().Settings.Fisching["Enable Equip Rod"] = v
        LiquidGlassNotify("Trigon Evo", "Selected Rod: "..v, "rbxassetid://82500352718600", 5)
    end
})

task.spawn(function()
    while task.wait(0.5) do
        local Success, Error = pcall(function()
            if getgenv().Settings.Fisching["Enable Equip Rod"] then
                local held = Collection:findHeldItem()

                if not held or held.Name ~= Collection:rodName() then
                    Collection:equipRod()
                end
            end
        end)
    end
end)


Tabs.Main:Dropdown({
    Title = "Shaking Method",
    Description = "Choose the method for shaking the bobber",
    Options = {"Normal","Fast","Nearly Instant"},
    Value = "Fast",
    Callback = function(v)
        getgenv().Settings["Shaking Method"] = v
        LiquidGlassNotify("Trigon Evo", "Shaking Method set to "..v, "rbxassetid://82500352718600", 5)
    end
})

getgenv().Settings.Fisching["Enable Shake Ui"] = true
task.spawn(function()
    while task.wait(0.1) do 
        local Success, Error = pcall(function()
            if getgenv().Settings.Fisching["Enable Shake Ui"] then
                if not getgenv().Settings.Fisching["Enable Shake Ui"] then return end 
                if LocalPlayer.PlayerGui:FindFirstChild("shakeui") then
                    local ShakeUI = LocalPlayer.PlayerGui:FindFirstChild("shakeui")
                    if ShakeUI then
                        if getgenv().Settings["Shaking Method"] == "Normal" then
                            Collection:ShakeUiv2v1(ShakeUI)
                        elseif getgenv().Settings["Shaking Method"] == "Fast" then
                            Collection:ShakeUiZ(ShakeUI)
                        elseif getgenv().Settings["Shaking Method"] == "Nearly Instant" then
                            Collection:ShakeUiv5(ShakeUI)
                        end
                    end
                end
            end
        end)
    end
end)
