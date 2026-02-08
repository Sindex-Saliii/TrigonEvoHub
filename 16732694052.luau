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

getgenv().Settings = {
    Setup = {
        ["Save Settings"] = true,
        ["Protect User"] = false,
        ["Walk On Water"] = false,
        ["Disable Animation"] = false,
        ["Disable Clip"] = false,
        ["Enable Fly"] = false,
        ["Enable Equip Rod"] = false,
        ["Choose Cast Method"] = "Remote",
        ["Choose Shake Method"] = "v1",
        ["Choose Reel Method"] = "v1",
        ["Choose Bobber Method"] = "v1"
    },
    Fisching = {
        ["Enable Instant Bobber"] = false,
        ["Enable Equip Rod"]= false,
        ["Enable Shake Ui"] = false,
        ["Enable Cast Rod"] = false,
        ["Enable Reel Minigame"] = false,
        ["Enable Perfect Catch"] = false,
        ["Enable Sell Inventory"] = false,
        ["Sell Delay"] = 5,
    },
}


function Collection:Load()
    print("Loaded!")
	if readfile and writefile and isfile and isfolder then
		if not isfolder("SleeperHub") then
			makefolder("SleeperHub")
		end
		if not isfolder("SleeperHub/Fisch/Settings/") then
			makefolder("SleeperHub/Fisch/Settings/")
		end
		if not isfile("SleeperHub/Fisch/Settings/Sleep-" .. game.Players.LocalPlayer.Name .. ".json") then
			writefile("SleeperHub/Fisch/Settings/Sleep-" .. game.Players.LocalPlayer.Name .. ".json", game:GetService("HttpService"):JSONEncode(getgenv().Settings))
		else
			local Decode = game:GetService("HttpService"):JSONDecode(readfile("SleeperHub/Fisch/Settings/Sleep-" .. game.Players.LocalPlayer.Name .. ".json"))
			for i,v in pairs(Decode) do
				getgenv().Settings[i] = v
			end
		end
	else
		return warn("Status : Undetected Executor")
	end
end

function Collection:SaveSetting()
    print("Save!")
	if readfile and writefile and isfile and isfolder then
		if not isfile("SleeperHub/Fisch/Settings/Sleep-" .. game.Players.LocalPlayer.Name .. ".json") then
			Collection:Load()
		else
			local Decode = game:GetService("HttpService"):JSONDecode(readfile("SleeperHub/Fisch/Settings/Sleep-" .. game.Players.LocalPlayer.Name .. ".json"))
			local Array = {}
			for i,v in pairs(getgenv().Settings) do
				Array[i] = v
			end
			writefile("SleeperHub/Fisch/Settings/Sleep-" .. game.Players.LocalPlayer.Name .. ".json", game:GetService("HttpService"):JSONEncode(Array))
		end
	else
		return warn("Status : Undetected Executor")
	end
end

Collection:Load()

local sizeuitoapply
local dragmethod

if UserInputService.TouchEnabled and not UserInputService.KeyboardEnabled then
    sizeuitoapply = UDim2.fromOffset(615, 360)
    dragmethod = 2
elseif UserInputService.KeyboardEnabled and UserInputService.MouseEnabled then
    sizeuitoapply = UDim2.fromOffset(800, 505)
    dragmethod = 1
else
    sizeuitoapply = UDim2.fromOffset(650, 475)
    dragmethod = 1
end

local MacLib = loadstring(game:HttpGet("https://github.com/biggaboy212/Maclib/releases/latest/download/maclib.txt"))()

local Window = MacLib:Window({
    Title = "SleeperHub | Fisch",
    Subtitle = "discord.gg/sleeperhub",
    Size = sizeuitoapply,
    DragStyle = dragmethod,
    DisabledWindowControls = {},
    ShowUserInfo = false,
    Keybind = Enum.KeyCode.RightControl,
    AcrylicBlur = false,
})


local Global_Setting = Window:GlobalSetting({
    Name = "Discord Server",
    Default = false,
    Callback = function(State)
        setclipboard("discord.gg/sleeperhub")
    end,
})

local gui = Instance.new("ScreenGui", LocalPlayer:WaitForChild("PlayerGui"))
gui.Name = "SleeperHub.Ui"
gui.ResetOnSpawn = false

local icon = Instance.new("ImageButton")
icon.Name = "SleeperHub.Logo"
icon.Size = UDim2.new(0, 55, 0, 50)
icon.Position = UDim2.new(0, 200, 0, 150)
icon.BackgroundTransparency = 1
icon.Image = "rbxassetid://101411626689887"
icon.Parent = gui

Instance.new("UICorner", icon).CornerRadius = UDim.new(0, 8)

local dragging = false
local dragStart, startPos
local moved = false

icon.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        moved = false
        dragStart = input.Position
        startPos = icon.Position
        input.Changed:Once(function()
            dragging = false
        end)
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
        local delta = input.Position - dragStart
        if math.abs(delta.X) > 6 or math.abs(delta.Y) > 6 then
            moved = true
        end
        icon.Position = UDim2.new( startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)

icon.Activated:Connect(function()
    if moved then return end
    Window:SetState(not Window.Open)
end)

local fishCaught = 0
local scriptStartTime = tick()

local Remotes = ReplicatedStorage.events
local fishingAnimation = ReplicatedStorage.resources.animations.fishing

local _v = {}

local zoneTeleportList = {}
for _, v in pairs(workspace.zones.player:GetChildren()) do
    if table.find(zoneTeleportList, v.Name) then continue end
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

--[[ 5. Functions & Utility ]]

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

function Collection:ShakeUiv1(ShakeUI)
    local LocalPlayer = Players.LocalPlayer
    local SafeZone = ShakeUI:WaitForChild("safezone", 1)
        
    if not SafeZone then return end
    local Connection
    Connection = SafeZone.ChildAdded:Connect(function(Child)
        if Child:IsA("ImageButton") then
            Child.Selectable = true
            GuiService.SelectedObject = Child
            for i = 1, 1 do
                VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.Return, false, game)
                task.wait(0.1)
                VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.Return, false, game)
            end
        end
    end)
end

function Collection:ShakeUiv2(ShakeUI)
    local LocalPlayer = Players.LocalPlayer
    local SafeZone = ShakeUI:WaitForChild("safezone", 1)
        
    if not SafeZone then return end
    local Connection
    Connection = SafeZone.ChildAdded:Connect(function(Child)
        if Child:IsA("ImageButton") then
            Child.Selectable = true
            GuiService.SelectedObject = Child
            for i = 1, 1 do
                VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.Return, false, game)
                task.wait(0.1)
                VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.Return, false, game)
            end
        end
    end)
    local heartbeatConnection = RunService.Heartbeat:Connect(function()
        for _, child in pairs(SafeZone:GetChildren()) do
            if child:IsA("ImageButton") then
                child.Selectable = true
                GuiService.SelectedObject = child
                VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.Return, false, game)
                task.wait(0.1)
                VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.Return, false, game)
            end
        end
    end)
    task.spawn(function()
        while SafeZone and SafeZone:IsDescendantOf(LocalPlayer.PlayerGui) do
            task.wait(0.1)
        end
        if Connection then Connection:Disconnect() end
        if renderConnection then renderConnection:Disconnect() end
        if heartbeatConnection then heartbeatConnection:Disconnect() end
        GuiService.SelectedObject = nil
    end)
end

function Collection:ShakeUiv3(ShakeUI)
    local LocalPlayer = Players.LocalPlayer
    local SafeZone = ShakeUI:WaitForChild("safezone", 1)
        
    if not SafeZone then return end
    local Connection
    Connection = SafeZone.ChildAdded:Connect(function(Child)
        if Child:IsA("ImageButton") then
            Child.Selectable = true
            GuiService.SelectedObject = Child
            for i = 1, 1 do
                VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.Return, false, game)
                task.wait(0.1)
                VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.Return, false, game)
            end
        end
    end)
    local renderConnection = RunService.RenderStepped:Connect(function()
        for _, child in pairs(SafeZone:GetChildren()) do
            if child:IsA("ImageButton") then
                child.Selectable = true
                GuiService.SelectedObject = child
                VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.Return, false, game)
                task.wait(0.1)
                VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.Return, false, game)
            end
        end
    end)
    local heartbeatConnection = RunService.Heartbeat:Connect(function()
        for _, child in pairs(SafeZone:GetChildren()) do
            if child:IsA("ImageButton") then
                child.Selectable = true
                GuiService.SelectedObject = child
                VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.Return, false, game)
                task.wait(0.1)
                VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.Return, false, game)
            end
        end
    end)
    task.spawn(function()
        while SafeZone and SafeZone:IsDescendantOf(LocalPlayer.PlayerGui) do
            task.wait(0.1)
        end
        if Connection then Connection:Disconnect() end
        if renderConnection then renderConnection:Disconnect() end
        if heartbeatConnection then heartbeatConnection:Disconnect() end
        GuiService.SelectedObject = nil
    end)
end

function Collection:ShakeUiZ(ShakeUI)
    local SafeZone = ShakeUI:WaitForChild("safezone", 1)
    if not SafeZone then return end

    local Connection, heartbeatConnection
    local pressing = false

    local function pressButton(button)
        if pressing then return end
        pressing = true
        button.Selectable = true
        GuiService.SelectedObject = button
        for i = 1, 1 do
            VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.Return, false, game)
            task.wait(0.1)
            VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.Return, false, game)
        end
        pressing = false
    end

    Connection = SafeZone.ChildAdded:Connect(function(child)
        if child:IsA("ImageButton") then
            pressButton(child)
        end
    end)
    heartbeatConnection = RunService.Heartbeat:Connect(function()
        local buttons = {}
        for _, child in pairs(SafeZone:GetChildren()) do
            if child:IsA("ImageButton") then
                table.insert(buttons, child)
            end
        end
        for _, btn in pairs(buttons) do
            pressButton(btn)
        end
    end)
    task.spawn(function()
        while SafeZone and SafeZone:IsDescendantOf(LocalPlayer.PlayerGui) do
            task.wait(0.1)
        end
        if Connection then Connection:Disconnect() end
        if heartbeatConnection then heartbeatConnection:Disconnect() end
        GuiService.SelectedObject = nil
    end)
end

function Collection:ShakeUiv5(ShakeUI)
    local SafeZone = ShakeUI:WaitForChild("safezone", 1)
    if not SafeZone then return end

    local alive = true
    local conn

    local function press(button)
        if not alive or not button or not button.Parent then return end
        button.Selectable = true
        GuiService.SelectedObject = button
        for i = 1, 1 do
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

    local heldItem = character:FindFirstChildOfClass("Tool")
    if heldItem then
        return heldItem
    end
end

function Collection:getPlayerStats()
    local LocalPlayer = Players.LocalPlayer
    return workspace:FindFirstChild("PlayerStats"):FindFirstChild(LocalPlayer.Name):FindFirstChild("T"):FindFirstChild(LocalPlayer.Name) 
end

function Collection:rodName()
    local LocalPlayer = Players.LocalPlayer
    local PlayerStats = workspace:FindFirstChild("PlayerStats"):FindFirstChild(LocalPlayer.Name):FindFirstChild("T"):FindFirstChild(LocalPlayer.Name)
    return PlayerStats:FindFirstChild("Stats"):FindFirstChild("rod").Value
end

function Collection:equipRod()
    Collection:equipItem(Collection:rodName())
end

function Collection:unequipTools()
    local LocalPlayer = Players.LocalPlayer
    local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
    local humanoid = character:FindFirstChildOfClass("Humanoid")
    humanoid:UnequipTools()
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

local isReeling = false

function Collection:castRod(rod)
    local LocalPlayer = Players.LocalPlayer
    local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
    character:SetAttribute("Fishing", true)
    local humanoid = character:FindFirstChildOfClass("Humanoid")
    humanoid.WalkSpeed = 4
    local throw = humanoid:LoadAnimation(fishingAnimation.throw)
    throw.Priority = Enum.AnimationPriority.Action3
    throw:Play()
    rod.events.castAsync:InvokeServer(98, 1)
    local waiting = humanoid:LoadAnimation(fishingAnimation.waiting)
    waiting.Priority = Enum.AnimationPriority.Action3
    waiting:Play()
end

function Collection:InstantReel()
    if finishing then return end
    finishing = true

    local reelGui
    local start = tick()

    repeat
        reelGui = PlayerGui:FindFirstChild("reel")
        task.wait(0.1)
    until reelGui or tick() - start > 3

    if not reelGui then
        finishing = false
        return
    end

    task.wait(math.max(tonumber(getgenv().SuperInstantReelDelay) or 0.15, 0.15))
    if not reelGui.Parent then
        finishing = false
        return
    end

    ReplicatedStorage:WaitForChild("packages"):WaitForChild("Net"):WaitForChild("RE/Reel/Finish"):FireServer({e = 100, p = true, l = {} })

    local Backpack = Players.LocalPlayer:WaitForChild("Backpack")
    local destroyed = false

    local conn
    conn = Backpack.ChildAdded:Connect(function(item)
        if destroyed then return end
        destroyed = true

        if reelGui and reelGui.Parent then
            reelGui:Destroy()
        end

        finishing = false
        conn:Disconnect()
    end)

    task.delay(1, function()
        if not destroyed then
            if reelGui and reelGui.Parent then
                reelGui:Destroy()
            end
            finishing = false
            if conn then conn:Disconnect() end
        end
    end)
end

function Collection:ReelMinigamev1()
    local LocalPlayer = Players.LocalPlayer
    if LocalPlayer.PlayerGui:FindFirstChild("reel") then
        task.wait(1.5)
        local args = {
            {
                e = 100,
                p = false,
                l = {}
            }
        }
        game:GetService("ReplicatedStorage"):WaitForChild("packages"):WaitForChild("Net"):WaitForChild("RE/Reel/Finish"):FireServer(unpack(args))
    end
end

function Collection:ReelMinigamev2()
    local LocalPlayer = Players.LocalPlayer
    if LocalPlayer.PlayerGui:FindFirstChild("reel") then
        task.wait(1.5)
        local args = {
            {
                e = 100,
                p = false,
                l = {}
            }
        }
        game:GetService("ReplicatedStorage"):WaitForChild("packages"):WaitForChild("Net"):WaitForChild("RE/Reel/Finish"):FireServer(unpack(args))
    end
end

local finishing = false

function Collection:ReelMinigamev3()
    if finishing then return end
    finishing = true

    local reelGui
    local start = os.clock()

    repeat
        reelGui = PlayerGui:FindFirstChild("reel")
        task.wait(0.1)
    until reelGui or os.clock() - start > 3

    if not reelGui then
        finishing = false
        return
    end

    task.wait(0.2)

    if not reelGui.Parent then
        finishing = false
        return
    end

    ReplicatedStorage
        :WaitForChild("packages")
        :WaitForChild("Net")
        :WaitForChild("RE/Reel/Finish")
        :FireServer({
            e = 100,
            p = true,
            l = {}
        })

    local cleaned = false
    local conn

    local function cleanup()
        if cleaned then return end
        cleaned = true

        if reelGui and reelGui.Parent then
            reelGui:Destroy()
        end

        finishing = false
        if conn then conn:Disconnect() end
    end

    conn = Backpack.ChildAdded:Connect(function()
        cleanup()
    end)

    task.delay(1, cleanup)
end

local finishing2 = false

function Collection:FastestFishing()
    if finishing2 then return end
    finishing2 = true

    local LocalPlayer = Players.LocalPlayer
    local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")
    local Backpack = LocalPlayer:WaitForChild("Backpack")

    local reelGui
    local start = os.clock()

    repeat
        reelGui = PlayerGui:FindFirstChild("reel")
        RunService.Heartbeat:Wait()
    until reelGui or os.clock() - start > 2

    if not reelGui then
        finishing2 = false
        return
    end

    RunService.Heartbeat:Wait()

    if not reelGui.Parent then
        finishing2 = false
        return
    end

    ReplicatedStorage
        :WaitForChild("packages")
        :WaitForChild("Net")
        :WaitForChild("RE/Reel/Finish")
        :FireServer({
            e = 100,
            p = true,
            l = {}
        })

    local cleaned = false
    local conn

    local function cleanup()
        if cleaned then return end
        cleaned = true

        if reelGui and reelGui.Parent then
            reelGui:Destroy()
        end

        finishing2 = false
        if conn then conn:Disconnect() end
    end

    conn = Backpack.ChildAdded:Connect(cleanup)

    task.delay(1, cleanup)
end

local finishing4 = false

function Collection:ReelMinigamev4()
    if finishing4 then 
        return 
    end
    finishing4 = true

    local Backpack = LocalPlayer:WaitForChild("Backpack")

    local reelGui
    local start = os.clock()

    repeat
        reelGui = PlayerGui:FindFirstChild("reel")
        task.wait()
    until reelGui or os.clock() - start > 2

    if not reelGui then
        finishing4 = false
        return
    end

    local fired = false
    local cleaned = false
    local connChild, connBackpack

    local function finish()
        if fired then 
            return 
        end

        fired = true

        ReplicatedStorage:WaitForChild("packages"):WaitForChild("Net"):WaitForChild("RE/Reel/Finish"):FireServer({ e = 100, p = true, l = {}})
    end

    local function cleanup()
        if cleaned then 
            return 
        end
        cleaned = true

        if reelGui and reelGui.Parent then
            reelGui:Destroy()
        end

        finishing4 = false
        if connChild then 
            connChild:Disconnect() *
        end
        if connBackpack then 
            connBackpack:Disconnect() 
        end
    end

    connChild = reelGui.ChildAdded:Connect(function()
        finish()
    end)

    if #reelGui:GetChildren() > 0 then
        finish()
    end

    connBackpack = Backpack.ChildAdded:Connect(cleanup)

    task.delay(1, cleanup)
end


function Collection:modifyReelUi(ui)
    if not ui then return end
    local bar = ui:FindFirstChild("bar")
    if not bar then return end
    local playerbar = bar:FindFirstChild("playerbar")
    if not playerbar then return end
    playerbar.Size = UDim2.new(
        (playerbar.Size.X.Scale + 0.625) * 1, 0,
        playerbar.Size.Y.Scale, 0
    )
end

function ChangeAvatar()
    local LocalPlayer = Players.LocalPlayer
    local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()

    local randomColor = Color3.fromRGB(
        math.random(0, 255),
        math.random(0, 255),
        math.random(0, 255)
    )

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

    local Head = character:FindFirstChild("Head")
    local Torso = character:FindFirstChild("Torso")
    local RightLeg = character:FindFirstChild("Right Leg")
    local LeftLeg = character:FindFirstChild("Left Leg")
    local RightArm = character:FindFirstChild("Right Arm")
    local LeftArm = character:FindFirstChild("Left Arm")

    if not (Head and Torso and RightLeg and LeftLeg and RightArm and LeftArm) then return end

    local function addMesh(part, scale, offset)
        local mesh = Instance.new("SpecialMesh")
        mesh.MeshId = "rbxassetid://112170046286421"
        mesh.MeshType = Enum.MeshType.FileMesh
        mesh.Scale = scale
        mesh.Offset = offset or Vector3.zero
        mesh.Parent = part
        return mesh
    end

    local headMesh = addMesh(Head, Vector3.new(1.5,1.5,1.5), Vector3.new(0,0.3,0))
    headMesh.TextureId = "rbxassetid://99764942615873"

    addMesh(Torso, Vector3.new(1.3,2,1))
    addMesh(RightLeg, Vector3.new(0.9,2,0.9))
    addMesh(LeftLeg, Vector3.new(0.9,2,0.9))

    addMesh(RightArm, Vector3.new(0.6,1.4,0.6), Vector3.new(-0.5,0.1,0))
    addMesh(LeftArm, Vector3.new(0.6,1.4,0.6), Vector3.new(0.5,0.1,0))
end

function Collection:EnableSecurity(state)
    if state and getgenv().Settings.Setup["Protect User"] then
        pcall(function()
            local LocalPlayer = Players.LocalPlayer
            local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
            local hrp = character:FindFirstChild("HumanoidRootPart")
            
            local userui = hrp:FindFirstChild("user")
            local protectList = {
                { Obj = userui.level, Text = "Security Level" },
                { Obj = userui.user, Text = "Security" },
                { Obj = userui.streak, Text = "Security Streak", Color = Color3.fromRGB(0, 229, 255) },
                { Obj = userui.streak, Text = "Security User", Color = Color3.fromRGB(0, 229, 255) },
                { Obj = LocalPlayer.PlayerGui.hud.safezone.coins, Text = "Security C$" },
                { Obj = LocalPlayer.PlayerGui.hud.safezone.lvl, Text = "Security Level" }
            }
            if getgenv().Settings.Setup["Protect User"] then
                ChangeAvatar()
                for _, v in pairs(protectList) do
                    local obj = v.Obj
                    if obj.ClassName == "TextLabel" then
                        obj.Text = v.Text
                        if v.Color then
                            obj.TextColor3 = v.Color
                        end
                        obj:GetPropertyChangedSignal("Text"):Connect(function()
                            if getgenv().protect_User and obj.Text ~= v.Text then
                                obj.Text = v.Text
                            end
                        end)
                    end
                end
                LocalPlayer.PlayerGui.hud.safezone.StatChangeList.ChildAdded:Connect(function(child)
                    if getgenv().protect_User then
                        child.Text = string.format("+%s Aura", tostring(math.random(1, 1000)))
                        child.TextColor3 = Color3.fromRGB(0, 229, 255)
                    end
                end)
            end
        end)
    end
end

function Collection:disableAnimation()
    local LocalPlayer = Players.LocalPlayer
    local character = LocalPlayer.Character
    if not character then return end

    local humanoid = character:FindFirstChildOfClass("Humanoid")
    if not humanoid then return end

    local animator = humanoid:FindFirstChildOfClass("Animator")
    if not animator then return end

    if getgenv().Settings.Setup["Disable Animation"] then
        for _, track in pairs(animator:GetPlayingAnimationTracks()) do
            track:Stop()
        end
        if _v.disableAnimationConn then
            disableAnimationConn:Disconnect()
        end
        _v.disableAnimationConn = animator.AnimationPlayed:Connect(function(track)
            if getgenv().Settings.Setup["Disable Animation"] then
                track:Stop()
            end
        end)
    else
        if _v.disableAnimationConn then
            _v.disableAnimationConn:Disconnect()
            _v.disableAnimationConn = nil
        end
    end
end

local flyEnabled = false
local flySpeed = 48
local bodyVelocity, bodyGyro
local flightConnection

function Collection:Fly(state)
    flyEnabled = state
    local LocalPlayer = Players.LocalPlayer
    if flyEnabled then
        local character = LocalPlayer.Character
        if not character or not character:FindFirstChild("HumanoidRootPart") then return end
        
        local humanoid = character:FindFirstChildOfClass("Humanoid")
        if not humanoid then return end
        
        bodyGyro = Instance.new("BodyGyro")
        bodyVelocity = Instance.new("BodyVelocity")
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
        if bodyVelocity then bodyVelocity:Destroy() end
        if bodyGyro then bodyGyro:Destroy() end
        
        local character = LocalPlayer.Character
        if character then
            local humanoid = character:FindFirstChildOfClass("Humanoid")
            if humanoid then
                humanoid.PlatformStand = false
            end
        end
        
        if flightConnection then
            flightConnection:Disconnect()
            flightConnection = nil
        end
    end
end

local emoji = {
    Check = utf8.char(0x2705),
    CrossMark = utf8.char(0x274E)
}

local status = {
    spawned = (emoji.Check .. " Spawned"),
    notSpawned = (emoji.CrossMark .. " Not Spawned")
}

local poolStatusParagraph = {
    Megalodon = nil,
    Kraken = nil,
    Orca = nil,
    ["Blue Whale"] = nil,
    Scylla = nil,
    Mosslurker = nil,
    Narwhal = nil,
    ["Frightful Pool"] = nil,
}

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
    for poolName, pool in pairs(poolRegistry) do
        local poolParagraph = poolStatusParagraph[pool]
        local poolInstance = fishingZone:FindFirstChild(poolName)
        if poolInstance and poolParagraph then
            local suffix;
            pcall(function()
                -- Megalodon
                if pool == "Megalodon" then
                    if poolName == "Megalodon Ancient" then suffix = "Ancient"
                    elseif poolName == "Megalodon Phantom" then suffix = "Phantom" end
                end
                -- Blue Whale
                if pool == "Blue Whale" then
                    local mobySpawn = poolInstance:FindFirstChild("MobySpawn")
                    local whale = mobySpawn and mobySpawn:FindFirstChild("Whale")
                    if whale then
                        suffix = "Moby"
                    end
                end
                -- Narwhal
                if pool == "Narwhal" then
                    suffix = poolName
                end
                -- Frightful
                if pool == "Frightful Pool" then
                    local PoiTitle = poolInstance.POIHeader.title
                    suffix = string.match(PoiTitle.Text, "^%S+")
                end
            end)

            if suffix then
                poolParagraph:SetContent(status.spawned .. string.format(" (%s)", gradient(suffix)))
            else
                poolParagraph:SetContent(status.spawned)
            end
        else
            poolParagraph:SetContent(status.notSpawned)
        end
    end
end

function Collection:getActivePool()
    local fishingZone = workspace.zones.fishing
    local activePool = {}
    for poolName, pool in pairs(poolRegistry) do
        local poolInstance = fishingZone:FindFirstChild(poolName)
        if poolInstance then table.insert(activePool, pool) end
    end
    return activePool
end

function Collection:useItem(tem)
    local LocalPlayer = Players.LocalPlayer
    local item = Collection:findItem(tem)
    local humanoid = LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
    
    if item and humanoid and item.Parent == LocalPlayer:FindFirstChild("Backpack") then
        humanoid:equipTool(item)
	end
    if item then item:Activate() end
end

function Hop()
    while true do
        local success, body = pcall(function()
            return game:HttpGet(("https://games.roblox.com/v1/games/%d/servers/Public?sortOrder=Asc&limit=100"):format(gameId))
        end)
        if success then
            local data = HttpService:JSONDecode(body)
            for _, server in ipairs(data.data) do
                if server.playing < server.maxPlayers and server.id ~= game.JobId then
                    while true do
                        pcall(function()
                            TeleportService:TeleportToPlaceInstance(gameId, server.id, LocalPlayer)
                        end)
                        task.wait(0.1)
                    end
                end
            end
        end
        task.wait(0.2)
    end
end


local world = ReplicatedStorage:FindFirstChild("world")
local server_weather = world:FindFirstChild("weather").Value
local server_cycle = world:FindFirstChild("cycle").Value
local server_season = world:FindFirstChild("season").Value
local server_event = world:FindFirstChild("event").Value
local server_luck = world:FindFirstChild("luck_Server").Value

local Group_1 = Window:TabGroup()

local Setup = Group_1:Tab({
  Name = "Setup",
  Image = "cog", -- Image can be at maximum 16 pixels wide and 16 pixels tall.
})
local Fisching = Group_1:Tab({
  Name = "Fisching",
  Image = "fishing-hook", -- Image can be at maximum 16 pixels wide and 16 pixels tall.
})
local Premium = Group_1:Tab({
  Name = "Premium",
  Image = "star", -- Image can be at maximum 16 pixels wide and 16 pixels tall.
})
local Farm = Group_1:Tab({
  Name = "Farm",
  Image = "accessibility", -- Image can be at maximum 16 pixels wide and 16 pixels tall.
})

local Group_2 = Window:TabGroup()

local Shop = Group_2:Tab({
  Name = "Shop",
  Image = "shopping-cart", -- Image can be at maximum 16 pixels wide and 16 pixels tall.
})

local Teleport = Group_2:Tab({
  Name = "Teleport",
  Image = "tree-palm", -- Image can be at maximum 16 pixels wide and 16 pixels tall.
})

local Group_3 = Window:TabGroup()

local Extra = Group_3:Tab({
  Name = "Extra",
  Image = "bug-play", -- Image can be at maximum 16 pixels wide and 16 pixels tall.
})

local Visual = Group_3:Tab({
  Name = "Visua & Dupe",
  Image = "activity", -- Image can be at maximum 16 pixels wide and 16 pixels tall.
})

local Section_1 = Setup:Section({
  Side = "Right"
})

Section_1:Toggle({
	Name = "Auto Save Settings",
	Default = getgenv().Settings.Setup["Save Settings"],
	Callback = function(state)
		getgenv().Settings.Setup["Save Settings"] = state
	end,
})

local Section_2 = Setup:Section({
  Side = "Right"
})

Section_2:Toggle({
	Name = "Disable User Infos",
	Default = getgenv().Settings.Setup["Protect User"],
	Callback = function(state)
		getgenv().Settings.Setup["Protect User"] = state
        Collection:EnableSecurity(state)
        if getgenv().Settings.Setup["Save Settings"] then
            Collection:SaveSetting()
        end
	end,
})

Section_2:Toggle({
	Name = "Walk On Water",
	Default = getgenv().Settings.Setup["Walk On Water"],
	Callback = function(state)
		getgenv().Settings.Setup["Walk On Water"] = state
        if getgenv().Settings.Setup["Save Settings"] then
            Collection:SaveSetting()
        end
	end,
})

task.spawn(function()
    while task.wait(0.1) do
        local Success, Error = pcall(function()
            if getgenv().Settings.Setup["Walk On Water"] then
                if not getgenv().Settings.Setup["Walk On Water"] then return end
                for i, v in pairs(workspace.zones.fishing:GetChildren()) do
                    if not getgenv().Settings.Setup["Walk On Water"] then
                        v.CanCollide = false
                    else
                        v.CanCollide = true
                    end
                end
            end
        end)
        if not Success then
            task.wait(3)
            warn("Error Walk On Water : " .. Error)
        end
    end
end)

Section_2:Toggle({
	Name = "Disable Mobillity",
	Default = getgenv().Settings.Setup["Disable Animation"],
	Callback = function(state)
		getgenv().Settings.Setup["Disable Animation"] = state
        if getgenv().Settings.Setup["Save Settings"] then
            Collection:SaveSetting()
        end
	end,
})

local oldPos = nil

task.spawn(function()
    while task.wait() do
        local Success, Error = pcall(function()
            if getgenv().Settings.Setup["Disable Animation"] then
                local LocalPlayer = Players.LocalPlayer
                local character = LocalPlayer.Character
                local hrp = character:FindFirstChild("HumanoidRootPart")
				if oldPos == nil then
					oldPos = hrp.CFrame
				end
				hrp.CFrame = oldPos
				hrp.Velocity = Vector3.zero
            end
        end)
    end
end)

Section_2:Toggle({
	Name = "Disable Clip",
	Default = getgenv().Settings.Setup["Disable Clip"],
	Callback = function(state)
		getgenv().Settings.Setup["Disable Clip"] = state
        if state then
			MainTab.NoClipConn = RunService.Stepped:Connect(NoClip)
		elseif MainTab.NoClipConn then
			MainTab.NoClipConn:Disconnect()
			MainTab.NoClipConn = nil
		end
        if getgenv().Settings.Setup["Save Settings"] then
            Collection:SaveSetting()
        end
	end,
})

Section_2:Toggle({
	Name = "Enable Fly",
	Default = getgenv().Settings.Setup["Enable Fly"],
	Callback = function(state)
        getgenv().Settings.Setup["Enable Fly"] = state
		Collection:Fly(state)
        if getgenv().Settings.Setup["Save Settings"] then
            Collection:SaveSetting()
        end
	end,
})

Section_2:Toggle({
	Name = "Enable Radar",
	Default = false,
	Callback = function(state)
        getgenv().Radar = state
        for _, radar in pairs(game:GetService("CollectionService"):GetTagged("radarTag")) do
            if radar:IsA("BillboardGui") or radar:IsA("SurfaceGui") then
                radar.Enabled = getgenv().Radar
            end
        end
	end,
})


local Section_3 = Setup:Section({
  Side = "Left"
})

Section_3:Dropdown({
	Name = "Choose Cast Method",
	Search = true,
	Multi = false,
	Required = true,
	Options = {"Remote", "Virtual Input"},
	Default = getgenv().Settings.Setup["Choose Cast Method"],
	Callback = function(Choosed)
		getgenv().Settings.Setup["Choose Cast Method"] = Choosed
        if getgenv().Settings.Setup["Save Settings"] then
            Collection:SaveSetting()
        end
	end,
})

Section_3:Dropdown({
	Name = "Choose Shake Method",
	Search = true,
	Multi = false,
	Required = true,
	Options = {"Slow", "Normal", "Semi-Fast", "Fast", "Super Fast"},
	Default = getgenv().Settings.Setup["Choose Shake Method"],
	Callback = function(Choosed)
		getgenv().Settings.Setup["Choose Shake Method"] = Choosed
        if getgenv().Settings.Setup["Save Settings"] then
            Collection:SaveSetting()
        end
	end,
})

Section_3:Dropdown({
	Name = "Choose Reel Method",
	Search = true,
	Multi = false,
	Required = true,
	Options = {"Slow", "Normal", "Semi-Fast", "Fast", "Instant", "Super Instant"},
	Default = getgenv().Settings.Setup["Choose Reel Method"],
	Callback = function(Choosed)
		getgenv().Settings.Setup["Choose Reel Method"] = Choosed
        if getgenv().Settings.Setup["Save Settings"] then
            Collection:SaveSetting()
        end
	end,
})

Section_3:Input({
	Name = "v4 Delay",
	Placeholder = "Enter Delay...",
	AcceptedCharacters = "All",
	Callback = function(value)
		getgenv().SuperInstantReelDelay = value
	end,
})

Section_3:Dropdown({
	Name = "Choose Bobber Method",
	Search = true,
	Multi = false,
	Required = true,
	Options = {"v1", "v2"},
	Default = getgenv().Settings.Setup["Choose Bobber Method"],
	Callback = function(Choosed)
		getgenv().Settings.Setup["Choose Bobber Method"] = Choosed
        if getgenv().Settings.Setup["Save Settings"] then
            Collection:SaveSetting()
        end
	end,
})

local Section_4 = Fisching:Section({
  Side = "Right"
})

Section_4:Toggle({
	Name = "Enable Equip Rod",
	Default = getgenv().Settings.Fisching["Enable Equip Rod"],
	Callback = function(state)
        getgenv().Settings.Fisching["Enable Equip Rod"] = state
        if getgenv().Settings.Setup["Save Settings"] then
            Collection:SaveSetting()
        end
	end,
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

Section_4:Toggle({
	Name = "Enable Instant Bobber",
	Default = getgenv().Settings.Fisching["Enable Instant Bobber"],
	Callback = function(state)
        getgenv().Settings.Fisching["Enable Instant Bobber"] = state
        if getgenv().Settings.Setup["Save Settings"] then
            Collection:SaveSetting()
        end
	end,
})

task.spawn(function()
    while task.wait(0.15) do
        local Success, Error = pcall(function()
            if getgenv().Settings.Fisching["Enable Instant Bobber"] then
                local rod = Collection:findHeldItem()

                if rod and rod.Name == Collection:rodName() then
                    local bobber = rod:FindFirstChild("bobber")
                    if bobber then
                        local LocalPlayer = Players.LocalPlayer
                        local character = LocalPlayer.Character
                        local hrp = character:FindFirstChild("HumanoidRootPart")
                        if getgenv().Settings.Setup["Choose Bobber Method"] == "v1" then
                            bobber.CFrame = hrp.CFrame - Vector3.new(0, 10, 0)
                        elseif getgenv().Settings.Setup["Choose Bobber Method"] == "v2" then
                            local hrp = Players.LocalPlayer.Character and Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                            bobber.CFrame = hrp.CFrame * CFrame.new(4, -6, 0)
                        end
                    end
                end
            end
        end)
        if not Success then
            task.wait(3)
            warn("Error Instant Bobber : " .. Error)
        end
    end
end)


local Section_5 = Fisching:Section({
  Side = "Left"
})

Section_5:Toggle({
	Name = "Enable Shake Ui",
	Default = getgenv().Settings.Fisching["Enable Shake Ui"],
	Callback = function(state)
        getgenv().Settings.Fisching["Enable Shake Ui"] = state
        if getgenv().Settings.Setup["Save Settings"] then
            Collection:SaveSetting()
        end
	end,
})

task.spawn(function()
    while task.wait(0.1) do 
        local Success, Error = pcall(function()
            if getgenv().Settings.Fisching["Enable Shake Ui"] then
                if not getgenv().Settings.Fisching["Enable Shake Ui"] then return end 
                if LocalPlayer.PlayerGui:FindFirstChild("shakeui") then
                    local ShakeUI = LocalPlayer.PlayerGui:FindFirstChild("shakeui")
                    if ShakeUI then
                        if getgenv().Settings.Setup["Choose Shake Method"] == "Slow" then
                            Collection:ShakeUiv1(ShakeUI)
                        elseif getgenv().Settings.Setup["Choose Shake Method"] == "Normal" then
                            Collection:ShakeUiv2v1(ShakeUI)
                        elseif getgenv().Settings.Setup["Choose Shake Method"] == "Semi-Fast" then
                            Collection:ShakeUiv3(ShakeUI)
                        elseif getgenv().Settings.Setup["Choose Shake Method"] == "Fast" then
                            Collection:ShakeUiZ(ShakeUI)
                        elseif getgenv().Settings.Setup["Choose Shake Method"] == "Super Fast" then
                            Collection:ShakeUiv5(ShakeUI)
                        end
                    end
                end
            end
        end)
    end
end)


Section_5:Toggle({
	Name = "Enable Cast Rod",
	Default = getgenv().Settings.Fisching["Enable Cast Rod"],
	Callback = function(state)
        getgenv().Settings.Fisching["Enable Cast Rod"] = state
        if getgenv().Settings.Setup["Save Settings"] then
            Collection:SaveSetting()
        end
	end,
})

task.spawn(function()
    while task.wait(0.1) do
        local Success, Error = pcall(function()
            if getgenv().Settings.Fisching["Enable Cast Rod"] then
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
            wait(3)
            warn("Eror Auto Cast Rod : " .. Error)
        end
    end
end)

Section_5:Toggle({
	Name = "Enable Reel Minigame",
	Default = getgenv().Settings.Fisching["Enable Reel Minigame"],
	Callback = function(state)
        getgenv().Settings.Fisching["Enable Reel Minigame"] = state
        if getgenv().Settings.Setup["Save Settings"] then
            Collection:SaveSetting()
        end
	end,
})

task.spawn(function()
    while task.wait(0.1) do
        local Success, Error = pcall(function()
            if getgenv().Settings.Fisching["Enable Reel Minigame"] then
                if LocalPlayer.PlayerGui:FindFirstChild("reel") then
                    LocalPlayer.Character:GetAttributeChangedSignal("Reeling"):Wait()
                    if getgenv().Settings.Setup["Choose Reel Method"] == "Slow" then
                        Collection:ReelMinigamev1()
                    elseif getgenv().Settings.Setup["Choose Reel Method"] == "Normal" then
                        Collection:ReelMinigamev2()
                    elseif getgenv().Settings.Setup["Choose Reel Method"] == "Semi-Fast" then
                        Collection:ReelMinigamev3()
                    elseif getgenv().Settings.Setup["Choose Reel Method"] == "Fast" then
                        Collection:InstantReel()
                    elseif getgenv().Settings.Setup["Choose Reel Method"] == "Instant" then
                        Collection:FastestFishing()
                    elseif getgenv().Settings.Setup["Choose Reel Method"] == "Super Instant" then
                        Collection:ReelMinigamev4()
                    end
                end
            end
        end)
        if not Success then
            task.wait(3)
            warn("Error Reel Minigame : " .. Error)
        end
    end
end)

local Section_8 = Fisching:Section({
  Side = "Right"
})

Section_8:Slider({
	Name = "Sell Delay (s)",
	Default = getgenv().Settings.Fisching["Sell Delay"],
	Minimum = 1,
	Maximum = 30,
	DisplayMethod = "Value",
	Callback = function(Value)
		getgenv().Settings.Fisching["Sell Delay"] = Value
        if getgenv().Settings.Setup["Save Settings"] then
            Collection:SaveSetting()
        end
	end,
})

Section_8:Toggle({
	Name = "Enable Sell Inventory",
	Default = getgenv().Settings.Fisching["Enable Sell Inventory"],
	Callback = function(state)
        getgenv().Settings.Fisching["Enable Sell Inventory"] = state
        if getgenv().Settings.Setup["Save Settings"] then
            Collection:SaveSetting()
        end
	end,
})

task.spawn(function()
    while task.wait(1) do
        local Success, Error = pcall(function()
            if getgenv().Settings.Fisching["Enable Sell Inventory"] then
                local canSell = true
                if LocalPlayer.PlayerGui:FindFirstChild("reel") then 
                    canSell = false 
                end
                local rod = Collection:findHeldItem()
                if rod and rod.Name == Collection:rodName() then
                    local casted = rod.values.casted
                    local lure = rod.values.lure
                    if casted.Value or lure.Value > 0 then 
                        canSell = false 
                    end
                end
                local delay = canSell and getgenv().Settings.Fisching["Sell Delay"] or 5
                if canSell then 
                    Remotes.SellAll:InvokeServer() 
                end
                task.wait(delay)
            end
        end)
        if not Success then
            task.wait(3)
            warn("Error Auto sell : " .. Error)
        end
    end
end)



local Section_6 = Farm:Section({
  Side = "Left"
})

Section_6:Dropdown({
	Name = "Choose Totems Events",
	Search = true,
	Multi = false,
	Required = false,
	Options = {"Megalodon", "Kraken", "Blue Whale", "Scylla"},
	Default = "",
	Callback = function(value)
		getgenv().Select_Events_Totem = value
	end,
})

Section_6:Toggle({
	Name = "Automatic Summon Totems Event",
	Default = false,
	Callback = function(state)
        getgenv().Summon_Totem_Event = state
	end,
})

task.spawn(function()
    while task.wait(1) do
        local Success, Error = pcall(function()
            if getgenv().Summon_Totem_Event then
                local selected = getgenv().Select_Events_Totem
                local activePool = Collection:getActivePool()
                if not table.find(activePool, selected) then 
                    task.wait(5) 
                    if selected == "Megalodon" or selected == "Kraken" or selected == "Scylla" then
                        if server_cycle == "Day" then
                            Collection:useItem("sundial totem")
                            task.wait(2)
                        else
                            Collection:useItem("sundial totem")
                            task.wait(2)
                        end
                    elseif selected == "Blue Whale" then
                        if server_weather ~= "Foggy" or server_weather ~= "Windy" then
                            Collection:useItem("tempest totem")
                        end
                        if server_weather == "Rain" then
                            Collection:useItem("smokescreen totem")
                        end
                    end
                end
            end
        end)
        if not Success then
            task.wait(3)
            warn("Error Auto Totems : " .. Error)
        end
    end
end)


Section_6:Dropdown({
	Name = "Choose Extra Totems Events",
	Search = true,
	Multi = false,
	Required = false,
	Options = {"Aurora", "Eclipse", "Sundial"},
	Default = "",
	Callback = function(value)
		getgenv().Select_Others_Totem = value
	end,
})

Section_6:Toggle({
	Name = "Automatic Summon Extra Totems Event",
	Default = false,
	Callback = function(state)
        getgenv().Summon_Extra_Event = state
	end,
})

task.spawn(function()
    while task.wait(2) do
        local Success, Error = pcall(function()
            if getgenv().Summon_Extra_Event then
                if getgenv().Select_Others_Totem == "Aurora" then
                    if server_weather ~= "Aurora_Borealis" then
                        if server_cycle == "Day" then 
                            Collection:useItem("sundial totem") 
                            task.wait(2) 
                        end
                        Collection:useItem("aurora totem")
                    end
                elseif getgenv().Select_Others_Totem == "Eclipse" then
                    if server_weather ~= "Eclipse" then
                        if server_cycle == "Night" then 
                            Collection:useItem("sundial totem") 
                            task.wait(2) 
                        end
                        Collection:useItem("eclipse totem")
                    end
                elseif getgenv().Select_Others_Totem == "Sundial" then
                    Collection:useItem("sundial totem")
                    task.wait(2)
                end
            end
        end)
        if not Success then
            task.wait(3)
            warn("Error Auto Summon extra totem : " .. Error)
        end
    end
end)


local Section_7 = Premium:Section({
  Side = "Right"
})

Section_7:Toggle({
	Name = "Forgotten Temple (Premium)",
    Description = "Automatically do Forgotten Temple Quest only Premium",
	Default = false,
	Callback = function(state)
        getgenv().Auto_Forgetten_Quest = state
	end,
})

task.spawn(function()
    while task.wait(1) do
        local Success, Error = pcall(function()
            if getgenv().Auto_Forgetten_Quest then

                if not LRM_IsUserPremium then 
                    print("No Premium user is only for premium")
                    return 
                end

                local PlayerStats = Collection:getPlayerStats()
                local locationsdiscovered = PlayerStats.Stats.tracker_locationsdiscovered
                if not locationsdiscovered:FindFirstChild("Mossjaw RestDiscovered") then
                    Collection:tpPlayer(CFrame.new(-5081.69921875, -1759.5615234375, -10162.7998046875))
                    task.wait(3)
                    local runeLocations = {
                        Glyph = CFrame.new(-5462.517578125, -1751.124755859375, -9624.595703125),
                        Toxic = CFrame.new(-4454.50244140625, -1639.9052734375, -10170.380859375),
                        Spike = CFrame.new(-5766.38916015625, -1759.6162109375, -10121.7490234375),
                        Vine = CFrame.new(-5179.13916015625, -1716.4112548828125, -10408.7470703125),
                        Water = CFrame.new(-4849.26953125, -1747.1673583984375, -9295.3623046875)
                    }
                    local runePedestal = {
                        Glyph = workspace.Glyph.GlyphRunePedestal["Meshes/RunePedestal_Cylinder.021 (1)"],
                        Toxic = workspace.Toxic.ToxicRunePedestal["Meshes/RunePedestal_Cylinder.021 (1)"],
                        Spike = workspace.Spike.SpikeRunePedestal["Meshes/RunePedestal_Cylinder.021 (1)"],
                        Vine = workspace.Vine.VineRunePedestal["Meshes/RunePedestal_Cylinder.021 (1)"],
                        Water = workspace.Water.WaterRunePedestal["Meshes/RunePedestal_Cylinder.021 (1)"]
                    }
                    for _, rune in pairs({"Glyph", "Toxic", "Spike", "Vine", "Water"}) do
                        local locations = runeLocations[rune]
                        local pedestal = runePedestal[rune]
                        Collection:tpPlayer(locations + Vector3.new(0, 1, 0))
                        task.wait(2)
                        Collection:equipItem(rune .. " rune")
                        Collection:tpPlayer(CFrame.new(pedestal.Parent.Parent.WorldPivot.Position) + Vector3.new(0, 3, 0))
                        task.wait(2)
                        Collection:FireProximity(pedestal.ProximityPrompt)
                        task.wait(1)
                    end
                end
            end
        end)
        if not Success then
            task.wait(4)
            warn("Error Forgotten Temple Quest : " .. Error)
        end
    end
end)

local Section_9 = Shop:Section({
  Side = "Left"
})

Section_9:Input({
	Name = "Buy Amount",
	Placeholder = "Amount",
	AcceptedCharacters = "Numeric",
	Callback = function(input)
		getgenv().Buy_Amont = input
	end,
})

Section_9:Button({
	Name = "Buy Relic",
	Callback = function()
		local oldPos = Collection:getPlayerPos()
        Collection:tpPlayer(CFrame.new(-928.0328369140625, 223.7000274658203, -998.7449951171875))
        task.wait(3)
        for i = 1, tonumber(getgenv().Buy_Amont) do
            workspace.world.npcs.Merlin.Merlin:GetChildren()[3]:InvokeServer()
        end
        Collection:tpPlayer(CFrame.new(oldPos))
	end,
})

Section_9:Button({
	Name = "Buy Relic",
	Callback = function()
		local oldPos = Collection:getPlayerPos()
        Collection:tpPlayer(CFrame.new(-928.0328369140625, 223.7000274658203, -998.7449951171875))
        task.wait(3)
        for i = 1, tonumber(getgenv().Buy_Amont) do
            workspace.world.npcs.Merlin.Merlin:GetChildren()[9]:InvokeServer()
        end
        Collection:tpPlayer(CFrame.new(oldPos))
	end,
})

local Section_10 = Shop:Section({
  Side = "Right"
})

Section_10:Dropdown({
	Name = "Choose Rod",
	Search = true,
	Multi = false,
	Required = false,
	Options = rodList,
	Default = "",
	Callback = function(value)
		getgenv().Choosen_Rod = value
	end,
})

Section_10:Button({
	Name = "Buy Rod",
	Callback = function()
		if Sgetgenv().Choosen_Rod ~= "" then
            Remotes.purchase:FireServer(getgenv().Choosen_Rod, "Rod")
		end
	end,
})

local Section_11 = Shop:Section({
  Side = "Left"
})

Section_10:Dropdown({
	Name = "Choose Stuff",
	Search = true,
	Multi = false,
	Required = false,
	Options = itemList,
	Default = "",
	Callback = function(value)
		getgenv().Choosen_Stuff = value
	end,
})

Section_10:Button({
	Name = "Buy Stuff",
	Callback = function()
		if getgenv().Choosen_Stuff ~= "" then
            for i = 1, tonumber(getgenv().Buy_Amont) do
                Remotes.purchase:FireServer(getgenv().Choosen_Stuff, "Item")
            end
		end
	end,
})

local Section_12 = Shop:Section({
  Side = "Right"
})

Section_12:Dropdown({
	Name = "Choose bait",
	Search = true,
	Multi = false,
	Required = false,
	Options = {"Quality Bait Crate", "Bait Crate"},
	Default = "Bait Crate",
	Callback = function(value)
		getgenv().Selected_Crate_Bait = value
	end,
})

Section_12:Button({
	Name = "Buy bait",
	Callback = function()
		local Event = game:GetService("ReplicatedStorage").events.purchase
        Event:FireServer(getgenv().Selected_Crate_Bait, "Fish", nil, tonumber(getgenv().Buy_Amont))
	end,
})

local Section_13 = Teleport:Section({
  Side = "Left"
})

Section_13:Dropdown({
	Name = "Choose Zone",
	Search = true,
	Multi = false,
	Required = false,
	Options = zoneTeleportList,
	Default = "",
	Callback = function(value)
		getgenv().Selected_Zones = value
	end,
})

Section_13:Button({
	Name = "Go to Zone",
	Callback = function()
		if getgenv().Selected_Zones ~= "" then
            local zone = workspace.zones.fishing:FindFirstChild(getgenv().Selected_Zones)
			Collection:tpPlayer(zone.CFrame)
		end
	end,
})

local Section_14 = Extra:Section({
  Side = "Left"
})

Section_14:Button({
	Name = "Rejoin",
	Callback = function()
		game:GetService("TeleportService"):Teleport(game.PlaceId)
	end,
})

Section_14:Button({
	Name = "Hop",
	Callback = function()
		Hop()
	end,
})

local Section_15 = Extra:Section({
  Side = "Right"
})

Section_15:Input({
	Name = "Job Id",
	Placeholder = "Enter",
	AcceptedCharacters = "All",
	Callback = function(input)
		getgenv().InputPlaceId = input
	end,
})

Section_15:Button({
	Name = "Copy Job Id",
	Callback = function()
		setclipboard(tostring(game.PlaceId))
	end,
})

Section_15:Button({
	Name = "Teleport",
	Callback = function()
		game:GetService("ReplicatedStorage").__ServerBrowser:InvokeServer("teleport",tostring(getgenv().InputPlaceId))
	end,
})

local Section_17 = Visual:Section({
  Side = "Right"
})

Section_17:Input({
	Name = "Amount",
	Placeholder = "Amount...",
	AcceptedCharacters = "Numeric",
	Callback = function(input)
		getgenv().Amount = input
	end,
})

Section_17:Input({
	Name = "Insect Number",
	Placeholder = "Number...",
	AcceptedCharacters = "Numeric",
	Callback = function(input)
		getgenv().Insect_Per_Loop = input
	end,
})

Section_17:Input({
	Name = "Insect Name",
	Placeholder = "Name",
	AcceptedCharacters = "All",
	Callback = function(input)
		getgenv().Insect_Name = input
	end,
})

Section_17:Button({
	Name = "Dupe Insect",
	Callback = function()
		for i = 1, getgenv().Amount do
            local Event = game:GetService("ReplicatedStorage").events.anno_bait
            firesignal(Event.OnClientEvent, 
                getgenv().Insect_Name,
                getgenv().Insect_Per_Loop
            )
        end
	end,
})


local Section_16 = Visual:Section({
  Side = "Left"
})

Section_16:Toggle({
	Name = "Infnite Fish Spear",
    Description = "",
	Default = false,
	Callback = function(state)
        getgenv().Inf_Spear = state
	end,
})

task.spawn(function()
    while task.wait(0.03) do
        local Success, Error = pcall(function()
            if getgenv().Inf_Spear then
                if LocalPlayer.Character then
                    LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(-2585, 144, -1942)
                end
                
                local Remote = game:GetService("ReplicatedStorage").packages.Net["RE/SpearFishing/Minigame"]
                
                for i, v in next, CollectionService:GetTagged("SpearfishingZone") do
                    local Zone = v.ZoneFish
                    for _, Fish in next, Zone:GetChildren() do
                        task.spawn(function()
                            Remote:FireServer(Fish:GetAttribute("UID"))
                            task.wait()
                            Remote:FireServer(Fish:GetAttribute("UID"), true)
                        end)
                        task.wait()
                    end
                end
            end
        end)
        if not Success then
            warn("Error inf spear : " .. Error)
        end
    end
end)

Section_16:Toggle({
	Name = "Infnite Oxygen",
    Description = "",
	Default = false,
	Callback = function(state)
        getgenv().Infinite_Oxygen = state
        LocalPlayer.character.Resources.oxygen.Enabled = not state
	end,
})



function hookPlayerGui()
    local LocalPlayer = Players.LocalPlayer
    LocalPlayer.PlayerGui.ChildAdded:Connect(function(gui)
        if gui.Name == "reel" then
            if getgenv().Settings.Fisching["Enable Reel Minigame"] then
                Collection:modifyReelUi(gui)
            end
        end
    end)
end

hookPlayerGui()

LocalPlayer.CharacterAdded:Connect(function(character)
    if getgenv().Settings.Setup["Protect User"] then
        local hrp = character:FindFirstChild("HumanoidRootPart")
        local userui = hrp:WaitForChild("user", 10)
        if userui then
            Collection:applyProtect()
        end
        hookPlayerGui()
        Collection:disableAnimation()
        character.Resources.oxygen.Enabled = not getgenv().Infinite_Oxygen
    end
end)

game:GetService("CollectionService"):GetInstanceAddedSignal("radarTag"):Connect(function(radar)
    if radar:IsA("BillboardGui") or radar:IsA("SurfaceGui") then
        radar.Enabled = getgenv().Radar
    end
end)

world:FindFirstChild("weather").Changed:Connect(function(newValue)
	server_weather = newValue
end)
world:FindFirstChild("cycle").Changed:Connect(function(newValue)
	server_cycle = newValue
end)
world:FindFirstChild("season").Changed:Connect(function(newValue)
	server_season = newValue
end)
world:FindFirstChild("event").Changed:Connect(function(newValue)
	server_event = newValue
end)
world:FindFirstChild("luck_Server").Changed:Connect(function(newValue)
	server_luck = newValue
end)



Window:Notify({
    Title = "SleeperHub",
    Description = "Script Fully Load!",
    Lifetime = 5
})




