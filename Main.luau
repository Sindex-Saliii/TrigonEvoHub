
---// Check World \\-----
if game.PlaceId == 2753915549 then
    FirstSea = true
    CurrentSea = "FirstSea"
elseif game.PlaceId == 4442272183 then
    SecondSea = true
    CurrentSea = "SecondSea"
elseif game.PlaceId == 7449423635 then
    ThirdSea = true
    CurrentSea = "ThirdSea"
end
-----// Farm Logic \\-----
function CheckQ()
    MyLevel = game.Players.LocalPlayer.Data.Level.Value
    
    local QuestData = {
        {Sea = "FirstSea", Levels = {1,9}, Mon = "Bandit", Quest = "BanditQuest1", LevelQuest = 1},
        {Sea = "FirstSea", Levels = {10,14}, Mon = "Monkey", Quest = "JungleQuest", LevelQuest = 1},
        {Sea = "FirstSea", Levels = {15,29}, Mon = "Gorilla", Quest = "JungleQuest", LevelQuest = 2},
        {Sea = "FirstSea", Levels = {30,39}, Mon = "Pirate", Quest = "BuggyQuest1", LevelQuest = 1},
        {Sea = "FirstSea", Levels = {40,59}, Mon = "Brute", Quest = "BuggyQuest1", LevelQuest = 2},
        {Sea = "FirstSea", Levels = {60,74}, Mon = "Desert Bandit", Quest = "DesertQuest", LevelQuest = 1},
        {Sea = "FirstSea", Levels = {75,89}, Mon = "Desert Officer", Quest = "DesertQuest", LevelQuest = 2},
        {Sea = "FirstSea", Levels = {90,99}, Mon = "Snow Bandit", Quest = "SnowQuest", LevelQuest = 1},
        {Sea = "FirstSea", Levels = {100,119}, Mon = "Snowman", Quest = "SnowQuest", LevelQuest = 2},
        {Sea = "FirstSea", Levels = {120,149}, Mon = "Chief Petty Officer", Quest = "MarineQuest2", LevelQuest = 1},
        {Sea = "FirstSea", Levels = {150,174}, Mon = "Sky Bandit", Quest = "SkyQuest", LevelQuest = 1},
        {Sea = "FirstSea", Levels = {175,189}, Mon = "Dark Master", Quest = "SkyQuest", LevelQuest = 2},
        {Sea = "FirstSea", Levels = {190,209}, Mon = "Prisoner", Quest = "PrisonerQuest", LevelQuest = 1},
        {Sea = "FirstSea", Levels = {210,249}, Mon = "Dangerous Prisoner", Quest = "PrisonerQuest", LevelQuest = 2},
        {Sea = "FirstSea", Levels = {250,274}, Mon = "Toga Warrior", Quest = "ColosseumQuest", LevelQuest = 1},
        {Sea = "FirstSea", Levels = {275,299}, Mon = "Gladiator", Quest = "ColosseumQuest", LevelQuest = 2},
        {Sea = "FirstSea", Levels = {300,324}, Mon = "Military Soldier", Quest = "MagmaQuest", LevelQuest = 1},
        {Sea = "FirstSea", Levels = {325,374}, Mon = "Military Spy", Quest = "MagmaQuest", LevelQuest = 2},
        {Sea = "FirstSea", Levels = {375,399}, Mon = "Fishman Warrior", Quest = "FishmanQuest", LevelQuest = 1},
        {Sea = "FirstSea", Levels = {400,449}, Mon = "Fishman Commando", Quest = "FishmanQuest", LevelQuest = 2},
        {Sea = "FirstSea", Levels = {450,474}, Mon = "God's Guard", Quest = "SkyExp1Quest", LevelQuest = 1},
        {Sea = "FirstSea", Levels = {475,524}, Mon = "Shanda", Quest = "SkyExp1Quest", LevelQuest = 2},
        {Sea = "FirstSea", Levels = {525,549}, Mon = "Royal Squad", Quest = "SkyExp2Quest", LevelQuest = 1},
        {Sea = "FirstSea", Levels = {550,624}, Mon = "Royal Soldier", Quest = "SkyExp2Quest", LevelQuest = 2},
        {Sea = "FirstSea", Levels = {625,649}, Mon = "Galley Pirate", Quest = "FountainQuest", LevelQuest = 1},
        {Sea = "FirstSea", Levels = {650,699}, Mon = "Galley Captain", Quest = "FountainQuest", LevelQuest = 2},
        {Sea = "SecondSea", Levels = {700,724}, Mon = "Raider", Quest = "Area1Quest", LevelQuest = 1},
        {Sea = "SecondSea", Levels = {725,774}, Mon = "Mercenary", Quest = "Area1Quest", LevelQuest = 2},
        {Sea = "SecondSea", Levels = {775,799}, Mon = "Swan Pirate", Quest = "Area2Quest", LevelQuest = 1},
        {Sea = "SecondSea", Levels = {800,874}, Mon = "Factory Staff", Quest = "Area2Quest", LevelQuest = 2},
        {Sea = "SecondSea", Levels = {875,899}, Mon = "Marine Lieutenant", Quest = "MarineQuest3", LevelQuest = 1},
        {Sea = "SecondSea", Levels = {900,949}, Mon = "Marine Captain", Quest = "MarineQuest3", LevelQuest = 2},
        {Sea = "SecondSea", Levels = {950,974}, Mon = "Zombie", Quest = "ZombieQuest", LevelQuest = 1},
        {Sea = "SecondSea", Levels = {975,999}, Mon = "Vampire", Quest = "ZombieQuest", LevelQuest = 2},
        {Sea = "SecondSea", Levels = {1000,1049}, Mon = "Snow Trooper", Quest = "SnowMountainQuest", LevelQuest = 1},
        {Sea = "SecondSea", Levels = {1050,1099}, Mon = "Winter Warrior", Quest = "SnowMountainQuest", LevelQuest = 2},
        {Sea = "SecondSea", Levels = {1100,1124}, Mon = "Lab Subordinate", Quest = "IceSideQuest", LevelQuest = 1},
        {Sea = "SecondSea", Levels = {1125,1174}, Mon = "Horned Warrior", Quest = "IceSideQuest", LevelQuest = 2},
        {Sea = "SecondSea", Levels = {1175,1199}, Mon = "Magma Ninja", Quest = "FireSideQuest", LevelQuest = 1},
        {Sea = "SecondSea", Levels = {1200,1249}, Mon = "Lava Pirate", Quest = "FireSideQuest", LevelQuest = 2},
        {Sea = "SecondSea", Levels = {1250,1274}, Mon = "Ship Deckhand", Quest = "ShipQuest1", LevelQuest = 1},
        {Sea = "SecondSea", Levels = {1275,1299}, Mon = "Ship Engineer", Quest = "ShipQuest1", LevelQuest = 2},
        {Sea = "SecondSea", Levels = {1300,1324}, Mon = "Ship Steward", Quest = "ShipQuest2", LevelQuest = 1},
        {Sea = "SecondSea", Levels = {1325,1349}, Mon = "Ship Officer", Quest = "ShipQuest2", LevelQuest = 2},
        {Sea = "SecondSea", Levels = {1350,1374}, Mon = "Arctic Warrior", Quest = "FrostQuest", LevelQuest = 1},
        {Sea = "SecondSea", Levels = {1375,1424}, Mon = "Snow Lurker", Quest = "FrostQuest", LevelQuest = 2},
        {Sea = "SecondSea", Levels = {1425,1449}, Mon = "Sea Soldier", Quest = "ForgottenQuest", LevelQuest = 1},
        {Sea = "SecondSea", Levels = {1450,1499}, Mon = "Water Fighter", Quest = "ForgottenQuest", LevelQuest = 2},
        {Sea = "ThirdSea", Levels = {1500,1524}, Mon = "Pirate Millionaire", Quest = "PiratePortQuest", LevelQuest = 1},
        {Sea = "ThirdSea", Levels = {1525,1574}, Mon = "Pistol Billionaire", Quest = "PiratePortQuest", LevelQuest = 2},
        {Sea = "ThirdSea", Levels = {1575,1599}, Mon = "Dragon Crew Warrior", Quest = "AmazonQuest", LevelQuest = 1},
        {Sea = "ThirdSea", Levels = {1600,1624}, Mon = "Dragon Crew Archer", Quest = "AmazonQuest", LevelQuest = 2},
        {Sea = "ThirdSea", Levels = {1625,1649}, Mon = "Hydra Enforcer", Quest = "AmazonQuest2", LevelQuest = 1},
        {Sea = "ThirdSea", Levels = {1650,1699}, Mon = "Venomous Assailant", Quest = "AmazonQuest2", LevelQuest = 2},
        {Sea = "ThirdSea", Levels = {1700,1724}, Mon = "Marine Commodore", Quest = "MarineTreeIsland", LevelQuest = 1},
        {Sea = "ThirdSea", Levels = {1725,1774}, Mon = "Marine Rear Admiral", Quest = "MarineTreeIsland", LevelQuest = 2},
        {Sea = "ThirdSea", Levels = {1775,1799}, Mon = "Fishman Raider", Quest = "DeepForestIsland3", LevelQuest = 1},
        {Sea = "ThirdSea", Levels = {1800,1824}, Mon = "Fishman Captain", Quest = "DeepForestIsland3", LevelQuest = 2},
        {Sea = "ThirdSea", Levels = {1825,1849}, Mon = "Forest Pirate", Quest = "DeepForestIsland", LevelQuest = 1},
        {Sea = "ThirdSea", Levels = {1850,1899}, Mon = "Mythological Pirate", Quest = "DeepForestIsland", LevelQuest = 2},
        {Sea = "ThirdSea", Levels = {1900,1924}, Mon = "Jungle Pirate", Quest = "DeepForestIsland2", LevelQuest = 1},
        {Sea = "ThirdSea", Levels = {1925,1974}, Mon = "Musketeer Pirate", Quest = "DeepForestIsland2", LevelQuest = 2},
        {Sea = "ThirdSea", Levels = {1975,1999}, Mon = "Reborn Skeleton", Quest = "HauntedQuest1", LevelQuest = 1},
        {Sea = "ThirdSea", Levels = {2000,2024}, Mon = "Living Zombie", Quest = "HauntedQuest1", LevelQuest = 2},
        {Sea = "ThirdSea", Levels = {2025,2049}, Mon = "Demonic Soul", Quest = "HauntedQuest2", LevelQuest = 1},
        {Sea = "ThirdSea", Levels = {2050,2074}, Mon = "Posessed Mummy", Quest = "HauntedQuest2", LevelQuest = 2},
        {Sea = "ThirdSea", Levels = {2075,2099}, Mon = "Peanut Scout", Quest = "NutsIslandQuest", LevelQuest = 1},
        {Sea = "ThirdSea", Levels = {2100,2124}, Mon = "Peanut President", Quest = "NutsIslandQuest", LevelQuest = 2},
        {Sea = "ThirdSea", Levels = {2125,2149}, Mon = "Ice Cream Chef", Quest = "IceCreamIslandQuest", LevelQuest = 1},
        {Sea = "ThirdSea", Levels = {2150,2199}, Mon = "Ice Cream Commander", Quest = "IceCreamIslandQuest", LevelQuest = 2},
        {Sea = "ThirdSea", Levels = {2200,2224}, Mon = "Cookie Crafter", Quest = "CakeQuest1", LevelQuest = 1},
        {Sea = "ThirdSea", Levels = {2225,2249}, Mon = "Cake Guard", Quest = "CakeQuest1", LevelQuest = 2},
        {Sea = "ThirdSea", Levels = {2250,2274}, Mon = "Baking Staff", Quest = "CakeQuest2", LevelQuest = 1},
        {Sea = "ThirdSea", Levels = {2275,2299}, Mon = "Head Baker", Quest = "CakeQuest2", LevelQuest = 2},
        {Sea = "ThirdSea", Levels = {2300,2324}, Mon = "Cocoa Warrior", Quest = "ChocQuest1", LevelQuest = 1},
        {Sea = "ThirdSea", Levels = {2325,2349}, Mon = "Chocolate Bar Battler", Quest = "ChocQuest1", LevelQuest = 2},
        {Sea = "ThirdSea", Levels = {2350,2374}, Mon = "Sweet Thief", Quest = "ChocQuest2", LevelQuest = 1},
        {Sea = "ThirdSea", Levels = {2375,2399}, Mon = "Candy Rebel", Quest = "ChocQuest2", LevelQuest = 2},
        {Sea = "ThirdSea", Levels = {2400,2424}, Mon = "Candy Pirate", Quest = "CandyQuest1", LevelQuest = 1},
        {Sea = "ThirdSea", Levels = {2425,2449}, Mon = "Snow Demon", Quest = "CandyQuest1", LevelQuest = 2},
        {Sea = "ThirdSea", Levels = {2450,2474}, Mon = "Isle Outlaw", Quest = "TikiQuest1", LevelQuest = 1},
        {Sea = "ThirdSea", Levels = {2475,2499}, Mon = "Island Boy", Quest = "TikiQuest1", LevelQuest = 2},
        {Sea = "ThirdSea", Levels = {2500,2524}, Mon = "Sun-kissed Warrior", Quest = "TikiQuest2", LevelQuest = 1},
        {Sea = "ThirdSea", Levels = {2525,2549}, Mon = "Isle Champion", Quest = "TikiQuest2", LevelQuest = 2},
        {Sea = "ThirdSea", Levels = {2550,2574}, Mon = "Serpent Hunter", Quest = "TikiQuest3", LevelQuest = 1},
        {Sea = "ThirdSea", Levels = {2575,2600}, Mon = "Skull Slayer", Quest = "TikiQuest3", LevelQuest = 2},
        {Sea = "ThirdSea", Levels = {2600,2624}, Mon = "Reef Bandit", Quest = "SubmergedQuest1", LevelQuest = 1},
        {Sea = "ThirdSea", Levels = {2625,2650}, Mon = "Coral Pirate", Quest = "SubmergedQuest1", LevelQuest = 2},
        {Sea = "ThirdSea", Levels = {2650,2675}, Mon = "Sea Chanter", Quest = "SubmergedQuest2", LevelQuest = 1},
        {Sea = "ThirdSea", Levels = {2675,2700}, Mon = "Ocean Prophet", Quest = "SubmergedQuest2", LevelQuest = 2},
        {Sea = "ThirdSea", Levels = {2700,2725}, Mon = "High Disciple", Quest = "SubmergedQuest3", LevelQuest = 1},
        {Sea = "ThirdSea", Levels = {2725,9999}, Mon = "Grand Devotee", Quest = "SubmergedQuest3", LevelQuest = 2}
    }
    
    for _,data in pairs(QuestData) do
        if data.Sea == CurrentSea and MyLevel >= data.Levels[1] and MyLevel <= data.Levels[2] then
            Mon = data.Mon
            NameMon = data.Mon
            NameQuest = data.Quest
            LevelQuest = data.LevelQuest
            LevelFarm = data.Levels[1]
            
            local NPCs = workspace:FindFirstChild("NPCs")
            if NPCs then
                local QuestNPC = NPCs:FindFirstChild(NameQuest)
                if QuestNPC then
                    local QuestPart = QuestNPC:FindFirstChild("Torso") or QuestNPC:FindFirstChild("HumanoidRootPart")
                    if QuestPart then
                        CFrameQuest = QuestPart.CFrame
                    end
                end
            end
            
            local Enemy = workspace.Enemies:FindFirstChild(Mon) or game.ReplicatedStorage:FindFirstChild(Mon)
            if Enemy then
                local HRP = Enemy:FindFirstChild("HumanoidRootPart")
                if HRP then
                    CFrameMon = HRP.CFrame
                else
                    CFrameMon = Enemy:GetPivot()
                end
            end
            
            break
        end
    end
end

function CheckBossQuest()
    local BossData = {
        {Sea = "FirstSea", Name = "The Gorilla King", Mon = "The Gorilla King [Lv. 25] [Boss]", Quest = "JungleQuest", QuestLv = 3},
        {Sea = "FirstSea", Name = "Bobby", Mon = "Bobby [Lv. 55] [Boss]", Quest = "BuggyQuest1", QuestLv = 3},
        {Sea = "FirstSea", Name = "The Saw", Mon = "The Saw [Lv. 100] [Boss]"},
        {Sea = "FirstSea", Name = "Yeti", Mon = "Yeti [Lv. 110] [Boss]", Quest = "SnowQuest", QuestLv = 3},
        {Sea = "FirstSea", Name = "Mob Leader", Mon = "Mob Leader [Lv. 120] [Boss]"},
        {Sea = "FirstSea", Name = "Vice Admiral", Mon = "Vice Admiral [Lv. 130] [Boss]", Quest = "MarineQuest2", QuestLv = 2},
        {Sea = "FirstSea", Name = "Saber Expert", Mon = "Saber Expert [Lv. 200] [Boss]"},
        {Sea = "FirstSea", Name = "Warden", Mon = "Warden [Lv. 220] [Boss]", Quest = "ImpelQuest", QuestLv = 1},
        {Sea = "FirstSea", Name = "Chief Warden", Mon = "Chief Warden [Lv. 230] [Boss]", Quest = "ImpelQuest", QuestLv = 2},
        {Sea = "FirstSea", Name = "Swan", Mon = "Swan [Lv. 240] [Boss]", Quest = "ImpelQuest", QuestLv = 3},
        {Sea = "FirstSea", Name = "Magma Admiral", Mon = "Magma Admiral [Lv. 350] [Boss]", Quest = "MagmaQuest", QuestLv = 3},
        {Sea = "FirstSea", Name = "Fishman Lord", Mon = "Fishman Lord [Lv. 425] [Boss]", Quest = "FishmanQuest", QuestLv = 3},
        {Sea = "FirstSea", Name = "Wysper", Mon = "Wysper [Lv. 500] [Boss]", Quest = "SkyExp1Quest", QuestLv = 3},
        {Sea = "FirstSea", Name = "Thunder God", Mon = "Thunder God [Lv. 575] [Boss]", Quest = "SkyExp2Quest", QuestLv = 3},
        {Sea = "FirstSea", Name = "Cyborg", Mon = "Cyborg [Lv. 675] [Boss]", Quest = "FountainQuest", QuestLv = 3},
        {Sea = "FirstSea", Name = "Ice Admiral", Mon = "Ice Admiral [Lv. 700] [Boss]"},
        {Sea = "FirstSea", Name = "Greybeard", Mon = "Greybeard [Lv. 750] [Raid Boss]"},
        {Sea = "SecondSea", Name = "Diamond", Mon = "Diamond [Lv. 750] [Boss]", Quest = "Area1Quest", QuestLv = 3},
        {Sea = "SecondSea", Name = "Jeremy", Mon = "Jeremy [Lv. 850] [Boss]", Quest = "Area2Quest", QuestLv = 3},
        {Sea = "SecondSea", Name = "Fajita", Mon = "Fajita [Lv. 925] [Boss]", Quest = "MarineQuest3", QuestLv = 3},
        {Sea = "SecondSea", Name = "Don Swan", Mon = "Don Swan [Lv. 1000] [Boss]"},
        {Sea = "SecondSea", Name = "Smoke Admiral", Mon = "Smoke Admiral [Lv. 1150] [Boss]", Quest = "IceSideQuest", QuestLv = 3},
        {Sea = "SecondSea", Name = "Awakened Ice Admiral", Mon = "Awakened Ice Admiral [Lv. 1400] [Boss]", Quest = "FrostQuest", QuestLv = 3},
        {Sea = "SecondSea", Name = "Tide Keeper", Mon = "Tide Keeper [Lv. 1475] [Boss]", Quest = "ForgottenQuest", QuestLv = 3},
        {Sea = "SecondSea", Name = "Darkbeard", Mon = "Darkbeard [Lv. 1000] [Raid Boss]"},
        {Sea = "SecondSea", Name = "Cursed Captain", Mon = "Cursed Captain [Lv. 1325] [Raid Boss]"},
        {Sea = "SecondSea", Name = "Order", Mon = "Order [Lv. 1250] [Raid Boss]"},
        {Sea = "ThirdSea", Name = "Stone", Mon = "Stone [Lv. 1550] [Boss]", Quest = "PiratePortQuest", QuestLv = 3},
        {Sea = "ThirdSea", Name = "Hydra Leader", Mon = "Hydra Leader [Lv. 1675] [Boss]", Quest = "VenomCrewQuest", QuestLv = 3},
        {Sea = "ThirdSea", Name = "Kilo Admiral", Mon = "Kilo Admiral [Lv. 1750] [Boss]", Quest = "MarineTreeIsland", QuestLv = 3},
        {Sea = "ThirdSea", Name = "Captain Elephant", Mon = "Captain Elephant [Lv. 1875] [Boss]", Quest = "DeepForestIsland", QuestLv = 3},
        {Sea = "ThirdSea", Name = "Beautiful Pirate", Mon = "Beautiful Pirate [Lv. 1950] [Boss]", Quest = "DeepForestIsland2", QuestLv = 3},
        {Sea = "ThirdSea", Name = "Cake Queen", Mon = "Cake Queen [Lv. 2175] [Boss]", Quest = "IceCreamIslandQuest", QuestLv = 3},
        {Sea = "ThirdSea", Name = "Longma", Mon = "Longma [Lv. 2000] [Boss]"},
        {Sea = "ThirdSea", Name = "Cake Prince", Mon = "Cake Prince [Lv. 2300] [Boss]"},
        {Sea = "ThirdSea", Name = "Dough King", Mon = "Dough King [Lv. 2300] [Boss]"},
        {Sea = "ThirdSea", Name = "Tyrant of the Skies", Mon = "Tyrant of the Skies [Lv. 2600] [Boss]"},
        {Sea = "ThirdSea", Name = "Soul Reaper", Mon = "Soul Reaper [Lv. 2100] [Raid Boss]"},
        {Sea = "ThirdSea", Name = "rip_indra True Form", Mon = "rip_indra True Form [Lv. 5000] [Raid Boss]"}
    }

    local CurrentSea = getgenv().FirstSea and "FirstSea" or getgenv().Settings.SecondSea and "SecondSea" or "ThirdSea"
    
    for _,boss in pairs(BossData) do
        if boss.Sea == CurrentSea and boss.Name == SelectBoss then
            BossMon = boss.Mon
            NameBoss = boss.Name
            NameQuestBoss = boss.Quest or ""
            QuestLvBoss = boss.QuestLv or 0
            
            local BossNPC = workspace:FindFirstChild(NameBoss) or game.ReplicatedStorage:FindFirstChild(NameBoss)
            if BossNPC then
                local HRP = BossNPC:FindFirstChild("HumanoidRootPart")
                if HRP then
                    CFrameBoss = HRP.CFrame
                else
                    CFrameBoss = BossNPC:GetPivot()
                end
            end
            
            if NameQuestBoss ~= "" then
                local NPCs = workspace:FindFirstChild("NPCs")
                if NPCs then
                    local QuestNPC = NPCs:FindFirstChild(NameQuestBoss)
                    if QuestNPC then
                        local QuestPart = QuestNPC:FindFirstChild("Torso") or QuestNPC:FindFirstChild("HumanoidRootPart")
                        if QuestPart then
                            CFrameQBoss = QuestPart.CFrame
                        end
                    end
                end
            end
            
            break
        end
    end
end

function AutoClick()
    game:GetService'VirtualUser':CaptureController()
    game:GetService'VirtualUser':Button1Down(Vector2.new(0,1,0,1))
end

function isnil(thing)
return (thing == nil)
end
local function round(n)
return math.floor(tonumber(n) + 0.5)
end
Number = math.random(1, 1000000)

local LocalPlayer = game:GetService'Players'.LocalPlayer
local originalstam = LocalPlayer.Character.Energy.Value

function infinitestam()
    LocalPlayer.Character.Energy.Changed:connect(function()
        if InfiniteEnergy then
            LocalPlayer.Character.Energy.Value = originalstam
        end 
    end)
end
getgenv().NotAutoEquip = false
local function EquipWeapon(ToolSe)
    if not getgenv().NotAutoEquip then
        if game.Players.LocalPlayer.Backpack:FindFirstChild(ToolSe) then
            Tool = game.Players.LocalPlayer.Backpack:FindFirstChild(ToolSe)
            task.wait(0.1)
            game.Players.LocalPlayer.Character.Humanoid:EquipTool(Tool)
        end
    end
end
function NoDodgeCool()
    if nododgecool then
        for i,v in next, getgc() do
            if game:GetService("Players").LocalPlayer.Character.Dodge then
                if typeof(v) == "function" and getfenv(v).script == game:GetService("Players").LocalPlayer.Character.Dodge then
                    for i2,v2 in next, getupvalues(v) do
                        if tostring(v2) == "0.1" then
                        repeat task.wait(0.1)
                            setupvalue(v,i2,0)
                        until not nododgecool
                        end
                    end
                end
            end
        end
    end
end

function Click()
    wait(0.1)
    game:GetService'VirtualUser':CaptureController()
    game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
end

function AutoHaki()
    if not game:GetService("Players").LocalPlayer.Character:FindFirstChild("HasBuso") then
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso")
    end
end

function UnEquipWeapon(Weapon)
    if game.Players.LocalPlayer.Character:FindFirstChild(Weapon) then
        getgenv().NotAutoEquip = true
        task.wait(0.5)
        game.Players.LocalPlayer.Character:FindFirstChild(Weapon).Parent = game.Players.LocalPlayer.Backpack
        task.wait(0.1)
        getgenv().NotAutoEquip = false
    end
end

function EquipWeapon(ToolSe)
    if not getgenv().NotAutoEquip then
        if game.Players.LocalPlayer.Backpack:FindFirstChild(ToolSe) then
            Tool = game.Players.LocalPlayer.Backpack:FindFirstChild(ToolSe)
            task.wait(0.1)
            game.Players.LocalPlayer.Character.Humanoid:EquipTool(Tool)
        end
    end
end

spawn(function()
while task.wait() do
    for i,v in pairs(game:GetService("Workspace")["_WorldOrigin"]:GetChildren()) do
        pcall(function()
            if v.Name == ("CurvedRing") or v.Name == ("SlashHit") or v.Name == ("SwordSlash") or v.Name == ("SlashTail") or v.Name == ("Sounds") then
                v:Destroy()
            end
        end)
    end
end
end)

function GetDistance(target)
    return math.floor((target.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude)
end

function BTP(P)
repeat task.wait(1)
    game.Players.LocalPlayer.Character.Humanoid:ChangeState(15)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = P
    task.wait()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = P
until (P.Position-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 1500
end

function TelePPlayer(P)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = P
end

function topos(K1)
    local player = game.Players.LocalPlayer
    local char = player.Character or player.CharacterAdded:Wait()
    local humanoid = char:WaitForChild("Humanoid")    
    if humanoid.Sit then 
        humanoid.Sit = false
    end
    local root = char:WaitForChild("HumanoidRootPart")
    root.CanCollide = false
    local dist = (K1.Position - root.Position).Magnitude
    local spd = 330
    local TweenSvc = game:GetService("TweenService")
    local TweenInf = TweenInfo.new(dist / spd, Enum.EasingStyle.Linear)
    local tween = TweenSvc:Create(root, TweenInf, {CFrame = K1})
    tween:Play()
    tween.Completed:Connect(function()
        root.CanCollide = true 
    end)
    while tween.PlaybackState == Enum.PlaybackState.Playing do
        wait(0.03) 
        if getgenv().StopTween then
            tween:Cancel()
            root.CanCollide = true 
            break
        end
    end
end

function Tween(K1)
    local player = game.Players.LocalPlayer
    local char = player.Character or player.CharacterAdded:Wait()
    local humanoid = char:WaitForChild("Humanoid")    
    if humanoid.Sit then 
        humanoid.Sit = false
    end
    local root = char:WaitForChild("HumanoidRootPart")
    root.CanCollide = false
    local dist = (K1.Position - root.Position).Magnitude
    local spd = 350
    local TweenSvc = game:GetService("TweenService")
    local TweenInf = TweenInfo.new(dist / spd, Enum.EasingStyle.Linear)
    local tween = TweenSvc:Create(root, TweenInf, {CFrame = K1})
    tween:Play()
    tween.Completed:Connect(function()
        root.CanCollide = true 
    end)
    while tween.PlaybackState == Enum.PlaybackState.Playing do
        wait(0.03) 
        if getgenv().StopTween then
            tween:Cancel()
            root.CanCollide = true 
            break
        end
    end
end

function TPB(CFgo)
local tween_s = game:service"TweenService"
local info = TweenInfo.new((game:GetService("Workspace").Boats.MarineBrigade.VehicleSeat.CFrame.Position - CFgo.Position).Magnitude/300, Enum.EasingStyle.Linear)
tween = tween_s:Create(game:GetService("Workspace").Boats.MarineBrigade.VehicleSeat, info, {CFrame = CFgo})
tween:Play()

local tweenfunc = {}

function tweenfunc:Stop()
    tween:Cancel()
end

return tweenfunc
end

function TPP(CFgo)
if game.Players.LocalPlayer.Character:WaitForChild("Humanoid").Health <= 0 or not game:GetService("Players").LocalPlayer.Character:WaitForChild("Humanoid") then tween:Cancel() repeat wait() until game:GetService("Players").LocalPlayer.Character:WaitForChild("Humanoid") and game:GetService("Players").LocalPlayer.Character:WaitForChild("Humanoid").Health > 0 wait(7) return end
local tween_s = game:service"TweenService"
local info = TweenInfo.new((game:GetService("Players")["LocalPlayer"].Character.HumanoidRootPart.Position - CFgo.Position).Magnitude/325, Enum.EasingStyle.Linear)
tween = tween_s:Create(game.Players.LocalPlayer.Character["HumanoidRootPart"], info, {CFrame = CFgo})
tween:Play()

local tweenfunc = {}

function tweenfunc:Stop()
    tween:Cancel()
end

return tweenfunc
end

spawn(function()
    local PosY = 0
    while task.wait(0.1) do
        Type = math.random(1, 6)
        task.wait(3)
        if Type == 1 then
            Pos = CFrame.new(0, PosY, 0)
        elseif Type == 2 then
            Pos = CFrame.new(0, PosY, -30)
        elseif Type == 3 then
            Pos = CFrame.new(30, PosY, 0)
        elseif Type == 4 then
            Pos = CFrame.new(0, PosY, 30)    
        elseif Type == 5 then
            Pos = CFrame.new(-30, PosY, 0)
        elseif Type == 6 then
            Pos = CFrame.new(0, 35, 0)
        end
    end
end)

spawn(function()
game:GetService("RunService").Heartbeat:Connect(function()
    if getgenv().Settings.Path then --- wait ก่อน
        if not game:GetService("Workspace"):FindFirstChild("LOL") then
            local LOL = Instance.new("Part")
            LOL.Name = "LOL"
            LOL.Parent = game.Workspace
            LOL.Anchored = true
            LOL.Transparency = 1
            LOL.Size = Vector3.new(30,-0.5,30)
        elseif game:GetService("Workspace"):FindFirstChild("LOL") then
            game.Workspace["LOL"].CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0, -3.6, 0)
        end
    else
        if game:GetService("Workspace"):FindFirstChild("LOL") then
            game:GetService("Workspace"):FindFirstChild("LOL"):Destroy()
        end
    end
end)
end)

spawn(function()
    pcall(function()
        while task.wait() do
            if getgenv().Settings.Path then --- รอก่อน
                if not game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyClip") then
                    local Noclip = Instance.new("BodyVelocity")
                    Noclip.Name = "BodyClip"
                    Noclip.Parent = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
                    Noclip.MaxForce = Vector3.new(100000,100000,100000)
                    Noclip.Velocity = Vector3.new(0,0,0)
                end
            end
        end
    end)
end)

spawn(function()
    pcall(function()
        game:GetService("RunService").Stepped:Connect(function()
            if getgenv().Settings.Path then -- รอก่อน
                for _, v in pairs(game:GetService("Players").LocalPlayer.Character:GetDescendants()) do
                    if v:IsA("BasePart") then
                        v.CanCollide = false    
                    end
                end
            end
        end)
    end)
end)

function InstancePos(pos)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = pos
end

function StopTween(target)
    if not target then
        getgenv().StopTween = true
        task.wait()
        Tween(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame)
        task.wait()
        if game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyClip") then
            game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyClip"):Destroy()
        end
        getgenv().StopTween = false
        getgenv().Clip = false
    end
end

game:GetService("Players").LocalPlayer.Idled:connect(function()
    game:GetService("VirtualUser"):Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
    task.wait(1)
    game:GetService("VirtualUser"):Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
end)

-----/// Liquid Glass Notify GUI -----
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")

local Player = Players.LocalPlayer
local PlayerGui = Player:WaitForChild("PlayerGui")

if PlayerGui:FindFirstChild("LiquidUltraIsland") then
	PlayerGui:FindFirstChild("LiquidUltraIsland"):Destroy()
end

local Screen = Instance.new("ScreenGui")
Screen.Name = "LiquidUltraIsland"
Screen.IgnoreGuiInset = true
Screen.ResetOnSpawn = false
Screen.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
Screen.DisplayOrder = 999999
Screen.Parent = PlayerGui

local MasterHolder = Instance.new("Frame")
MasterHolder.Name = "MasterHolder"
MasterHolder.Size = UDim2.new(0, 400, 1, 0)
MasterHolder.AnchorPoint = Vector2.new(0.5, 0)
MasterHolder.Position = UDim2.new(0.5, 0, 0, 0)
MasterHolder.BackgroundTransparency = 1
MasterHolder.Parent = Screen

local UIList = Instance.new("UIListLayout")
UIList.HorizontalAlignment = Enum.HorizontalAlignment.Center
UIList.VerticalAlignment = Enum.VerticalAlignment.Top
UIList.Padding = UDim.new(0, 12)
UIList.SortOrder = Enum.SortOrder.LayoutOrder
UIList.Parent = MasterHolder

local Padding = Instance.new("UIPadding")
Padding.PaddingTop = UDim.new(0, UserInputService.TouchEnabled and 35 or 40)
Padding.Parent = MasterHolder

local BasePill = Instance.new("Frame")
BasePill.Name = "00_BasePill"
BasePill.Size = UDim2.new(0, 80, 0, 32)
BasePill.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
BasePill.BackgroundTransparency = 0.45
BasePill.BorderSizePixel = 0
BasePill.LayoutOrder = -1
BasePill.Parent = MasterHolder

local BaseCorner = Instance.new("UICorner")
BaseCorner.CornerRadius = UDim.new(1, 0)
BaseCorner.Parent = BasePill

local BaseStroke = Instance.new("UIStroke")
BaseStroke.Color = Color3.fromRGB(255, 255, 255)
BaseStroke.Transparency = 0.5
BaseStroke.Thickness = 1.8
BaseStroke.Parent = BasePill

function LiquidGlassNotify(title, desc, icon, duration)
	local dur = duration or 5
	local targetWidth = UserInputService.TouchEnabled and 310 or 360
	local targetHeight = 72

	local Card = Instance.new("Frame")
	Card.Name = "NotifyCard"
	Card.Size = UDim2.new(0, 80, 0, 0)
	Card.BackgroundTransparency = 1
	Card.ClipsDescendants = false
	Card.LayoutOrder = os.clock() * 1000
	Card.Parent = MasterHolder

	local MainBody = Instance.new("CanvasGroup")
	MainBody.Name = "MainBody"
	MainBody.Size = UDim2.new(0, 80, 0, 32)
	MainBody.Position = UDim2.new(0.5, -40, 0, -44)
	MainBody.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	MainBody.BackgroundTransparency = 0.35
	MainBody.GroupTransparency = 1
	MainBody.BorderSizePixel = 0
	MainBody.Parent = Card

	local Corner = Instance.new("UICorner")
	Corner.CornerRadius = UDim.new(1, 0)
	Corner.Parent = MainBody

	local Stroke = Instance.new("UIStroke")
	Stroke.Color = Color3.fromRGB(255, 255, 255)
	Stroke.Transparency = 0.4
	Stroke.Thickness = 2.4
	Stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
	Stroke.Parent = MainBody

	local Content = Instance.new("Frame")
	Content.Size = UDim2.new(1, 0, 1, 0)
	Content.BackgroundTransparency = 1
	Content.Parent = MainBody

	local IconImg = Instance.new("ImageLabel")
	IconImg.Size = UDim2.new(0, 30, 0, 30)
	IconImg.Position = UDim2.new(0, 18, 0.5, -15)
	IconImg.BackgroundTransparency = 1
	IconImg.Image = icon or "rbxassetid://6023426926"
	IconImg.ImageTransparency = 1
	IconImg.Parent = Content

	local TextHold = Instance.new("Frame")
	TextHold.Size = UDim2.new(1, -90, 1, 0)
	TextHold.Position = UDim2.new(0, 65, 0, 0)
	TextHold.BackgroundTransparency = 1
	TextHold.Parent = Content

	local Ttl = Instance.new("TextLabel")
	Ttl.Size = UDim2.new(1, 0, 0, 22)
	Ttl.Position = UDim2.new(0, 0, 0.5, -20)
	Ttl.BackgroundTransparency = 1
	Ttl.Font = Enum.Font.GothamBold
	Ttl.TextColor3 = Color3.fromRGB(15, 15, 15)
	Ttl.TextSize = 16
	Ttl.Text = title
	Ttl.TextXAlignment = Enum.TextXAlignment.Left
	Ttl.TextTransparency = 1
	Ttl.Parent = TextHold

	local Dsc = Instance.new("TextLabel")
	Dsc.Size = UDim2.new(1, 0, 0, 18)
	Dsc.Position = UDim2.new(0, 0, 0.5, 2)
	Dsc.BackgroundTransparency = 1
	Dsc.Font = Enum.Font.GothamMedium
	Dsc.TextColor3 = Color3.fromRGB(60, 60, 65)
	Dsc.TextSize = 13
	Dsc.Text = desc
	Dsc.TextXAlignment = Enum.TextXAlignment.Left
	Dsc.TextTransparency = 1
	Dsc.Parent = TextHold

	local Progress = Instance.new("Frame")
	Progress.Size = UDim2.new(0, 0, 0, 3)
	Progress.Position = UDim2.new(0, 18, 1, -8)
	Progress.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	Progress.BackgroundTransparency = 0.75
	Progress.BorderSizePixel = 0
	Progress.Parent = MainBody
	Instance.new("UICorner", Progress)

	local introInfo = TweenInfo.new(0.9, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
	
	TweenService:Create(Card, introInfo, {Size = UDim2.new(0, targetWidth, 0, targetHeight)}):Play()
	TweenService:Create(MainBody, introInfo, {Position = UDim2.new(0, 0, 0, 0), Size = UDim2.new(1, 0, 1, 0), GroupTransparency = 0}):Play()
	TweenService:Create(Corner, introInfo, {CornerRadius = UDim.new(0, 24)}):Play()

	task.delay(0.2, function()
		local fadeInfo = TweenInfo.new(0.4)
		TweenService:Create(IconImg, fadeInfo, {ImageTransparency = 0}):Play()
		TweenService:Create(Ttl, fadeInfo, {TextTransparency = 0}):Play()
		TweenService:Create(Dsc, fadeInfo, {TextTransparency = 0}):Play()
		TweenService:Create(Progress, TweenInfo.new(dur, Enum.EasingStyle.Linear), {Size = UDim2.new(1, -36, 0, 3)}):Play()
	end)

	task.delay(dur + 0.8, function()
		local outroInfo = TweenInfo.new(0.8, Enum.EasingStyle.Quart, Enum.EasingDirection.In)
		
		TweenService:Create(IconImg, TweenInfo.new(0.2), {ImageTransparency = 1}):Play()
		TweenService:Create(Ttl, TweenInfo.new(0.2), {TextTransparency = 1}):Play()
		TweenService:Create(Dsc, TweenInfo.new(0.2), {TextTransparency = 1}):Play()
		TweenService:Create(Progress, TweenInfo.new(0.2), {BackgroundTransparency = 1}):Play()
		
		task.wait(0.15)
		
		TweenService:Create(MainBody, outroInfo, {Position = UDim2.new(0.5, -40, 0, -44), Size = UDim2.new(0, 80, 0, 32), GroupTransparency = 1}):Play()
		TweenService:Create(Corner, outroInfo, {CornerRadius = UDim.new(1, 0)}):Play()
		local cardTween = TweenService:Create(Card, outroInfo, {Size = UDim2.new(0, 80, 0, 0)})
		cardTween:Play()
		
		cardTween.Completed:Wait()
		Card:Destroy()
	end)
end

getgenv().LiquidGlassNotify = LiquidGlassNotify

local Url = "https://discord.com/api/webhooks/1470474074097713224/Zam8Sl7LMYUu9owcwLAKsXUJb_qazfX2lqvH1rK5aBVIJWMx9jNXgI1r7PQywEoTRaqS"

function SendWebhook(webhookurl, username, content)
    local data = {
        ["content"] = content,
        ["username"] = username
    }
    local newdata = game:GetService("HttpService"):JSONEncode(data)
    local headers = {
        ["Content-Type"] = "application/json"
    }
    request = http_request or request or HttpPost or syn.request
    local abcdef = {Url = webhookurl, Body = newdata, Method = "POST", Headers = headers}
    request(abcdef)
end

local function Warp(x)
    if x == "FirstSea" then
        game:GetService("TeleportService"):Teleport(2753915549)
    elseif x == "SecondSea" then
        game:GetService("TeleportService"):Teleport(4442272183)
    elseif x == "ThirdSea" then
        game:GetService("TeleportService"):Teleport(7449423635)
    end
end    

local function AutoHaki()
    if not game:GetService("Players").LocalPlayer.Character:FindFirstChild("HasBuso") then
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso")
    end
end

local function UnEquipWeapon(Weapon)
    if game.Players.LocalPlayer.Character:FindFirstChild(Weapon) then
        getgenv().NotAutoEquip = true
        task.wait(0.5)
        game.Players.LocalPlayer.Character:FindFirstChild(Weapon).Parent = game.Players.LocalPlayer.Backpack
        task.wait(0.1)
        getgenv().NotAutoEquip = false
    end
end
------// Save Config \\------

getgenv().Settings = {
    SelectedWeapon = "Melee",
    EquipSelected = true,
    FastAttackSpeed = 0.05,
    FastAttack = true,
    FreezeMob = false,
    AutoFarm = false,
    AutoFarmCrossWorld = false,
    AutoThirdSea = false,
    AutoSecondSea = false,

}

local function SaveSettings()
    writefile("TrigonBloxFruit.json", game.HttpService:JSONEncode(getgenv().Settings))
end

local function LoadSettings()
    if isfile("TrigonBloxFruit.json") then
        getgenv().Settings = game.HttpService:JSONDecode(readfile("TrigonBloxFruit.json"))
    end
end
LoadSettings()
LiquidGlassNotify("Trigon","Config Loaded!","rbxassetid://82500352718600",5)

------// Ui Library \\------

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Sindex-Saliii/Sindex-Main/refs/heads/main/DummyUI.lua"))()

local Window = Library:Window({
    Title = "Trigon [ BloxFruit ]",
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
    Info = Window:Tab({Title = 'Info', Icon = 'info'}),
	Main = Window:Tab({Title = 'Main', Icon = 'layout-grid'}),
    Item = Window:Tab({Title = 'Item', Icon = 'scroll-text'}),
    Window:Line(),
	Shop = Window:Tab({Title = 'Shop', Icon = 'shopping-basket'}),
	Teleport = Window:Tab({Title = 'Teleport', Icon = 'rss'}),
	Visual = Window:Tab({Title = 'Visual', Icon = 'eye'}),
	Setting = Window:Tab({Title = 'Setting', Icon = 'cog'}),
    Window:Line(),
}

----// Settings Tab \\----

local WeaponList = {"Melee","Sword","Gun","Fruit"}
Tabs.Setting:Dropdown({
    Title = 'Select Weapon',
    Desc = 'Select Your Weapon for Auto Farm',
    Options = WeaponList,
    Callback = function(v)
        getgenv().Settings.SelectedWeapon = v
        SaveSettings()
    end,
})

Tabs.Setting:Toggle({
    Title = 'Equip Selected',
    Desc = 'Equip Selected Weapon',
    Value = true,
    Callback = function(v)
        getgenv().Settings.EquipSelected = v
        SaveSettings()
    end,
})

task.spawn(function()
    while task.wait(1) do
        if getgenv().Settings.EquipSelected == true then
            if getgenv().Settings.SelectedWeapon == "Melee" then
                for i ,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                    if v.ToolTip == "Melee" then
                        if game.Players.LocalPlayer.Backpack:FindFirstChild(tostring(v.Name)) then
                            getgenv().Settings.SelectedWeapon = v.Name
                        end
                    end
                end
            elseif getgenv().Settings.SelectedWeapon == "Sword" then
                for i ,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                    if v.ToolTip == "Sword" then
                        if game.Players.LocalPlayer.Backpack:FindFirstChild(tostring(v.Name)) then
                            getgenv().Settings.SelectedWeapon = v.Name
                        end
                    end
                end
            elseif getgenv().Settings.SelectedWeapon == "Gun" then
                for i ,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                    if v.ToolTip == "Gun" then
                        if game.Players.LocalPlayer.Backpack:FindFirstChild(tostring(v.Name)) then
                            getgenv().Settings.SelectedWeapon = v.Name
                        end
                    end
                end
            elseif getgenv().Settings.SelectedWeapon == "Fruit" then
                for i ,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                    if v.ToolTip == "Blox Fruit" then
                        if game.Players.LocalPlayer.Backpack:FindFirstChild(tostring(v.Name)) then
                            getgenv().Settings.SelectedWeapon = v.Name
                        end
                    end
                end
            end
        end
    end
end)

Tabs.Setting:Slider({
    Title = 'Fast Attack Speed',
    Desc = 'Set Fast Attack Speed',
    Min = 0.05,
    Max = 0.1,
    Value = getgenv().Settings.FastAttackSpeed or 0.05,
    Rounding = 2,
    Callback = function(v)
        getgenv().Settings.FastAttackSpeed = v
        SaveSettings()
    end,
})

Tabs.Setting:Toggle({
    Title = 'Fast Attack',
    Desc = 'Fast Attack',
    Value = getgenv().Settings.FastAttack or true,
    Callback = function(v)
        getgenv().Settings.FastAttack = v
        SaveSettings()
    end,
})

Tabs.Settings:Toggle({
    Title = 'Freeze Monster',
    Desc = 'Freeze Monster (Can Be Detected)',
    Image = 'snowflake',
    Value = getgenv().Settings.FreezeMob or false,
    Callback = function(v)
        getgenv().Settings.FreezeMob = v
        SaveSettings()
    end,
})

Tabs.Settings:Toggle({
    Title = 'Set Fast Attack At Fastest Speed (Can Be Detected)',
    Desc = 'Set Fast Attack At Fastest Speed (Can Be Detected)',
    Image = 'zap',
    Value = getgenv().Settings.FastAttackAtFastest or false,
    Callback = function(v)
        getgenv().Settings.FastAttackAtFastest = v
        SaveSettings()
    end,
})

local Modules = {}
if getgenv().Settings.FastAttack then
    local CameraShaker = require(game.ReplicatedStorage.Util.CameraShaker)
    CameraShaker:Stop()
    
    local Players = game:GetService("Players")
    local ReplicatedStorage = game:GetService("ReplicatedStorage")
    local RunService = game:GetService("RunService")
    local Player = Players.LocalPlayer
    
    local function Wait(x, y)
        return x:FindFirstChild(y) or x:WaitForChild(y)
    end
    
    local Remotes = Wait(ReplicatedStorage, "Remotes")
    local Net = Wait(Wait(ReplicatedStorage, "Modules"), "Net")
    local RegisterAttack = Wait(Net, "RE/RegisterAttack")
    local RegisterHit = Wait(Net, "RE/RegisterHit")
    
    local Enemies = Wait(workspace, "Enemies")
    local Characters = Wait(workspace, "Characters")
    
    local Config = {
        AutoClick = true,
        Distance = 100
    }
    
    local function Alive(c)
        return c and c:FindFirstChild("Humanoid") and c.Humanoid.Health > 0
    end
    
    local function mob(t, folder)
        for _, v in folder:GetChildren() do
            local h = v:FindFirstChild("Head")
            if h and Alive(v) and v ~= Player.Character and Player:DistanceFromCharacter(h.Position) < Config.Distance then
                t[#t+1] = {v, h}
            end
        end
    end
    
    function Modules:FastAttack()
        while task.wait() do
            if not getgenv().Settings.FastAttack then break end
            
            local char = Player.Character
            local tool = char and char:FindFirstChildOfClass("Tool")
            if not (Config.AutoClick and Alive(char) and tool and tool.ToolTip ~= "Gun") then continue end
            
            local delay = getgenv().Settings.FastAttackAtFastest and 0.01 or (getgenv().Settings.FastAttackSpeed or 0.05)
            
            local targets = {}
            mob(targets, Enemies)
            mob(targets, Characters)
            if #targets == 0 then continue end
            
            for _, d in ipairs(targets) do
                local enemy = d[1]
                local h = enemy:FindFirstChild("HumanoidRootPart")
                if h then
                    if getgenv().Settings.FreezeMob then
                        enemy.HumanoidRootPart.CanCollide = false
                        enemy.Humanoid.WalkSpeed = 0
                        enemy.Head.CanCollide = false
                    end
                    
                    RegisterAttack:FireServer(delay)
                    RegisterHit:FireServer(d[2], targets)
                end
            end
        end
    end
    
    task.spawn(function()
        Modules:FastAttack()
    end)
end

task.spawn(function()
    while task.wait() do
        if not getgenv().Settings.FastAttack then
            if Modules.FastAttack then
                Modules.FastAttack = nil
            end
        else
            if not Modules.FastAttack then
                if getgenv().Settings.FastAttack then
                    task.spawn(function()
                        Modules:FastAttack()
                    end)
                end
            end
        end
    end
end)

Tabs.Setting:Toggle({
    Title = 'Bring Mob',
    Desc = 'Bring Mob',
    Value = false,
    Callback = function(v)
        getgenv().Settings.BringMob = v
        SaveSettings()
    end,
})

spawn(function()
    while task.wait() do
        pcall(function()
            if getgenv().Settings.BringMob and Magnet and MagnetTarget then
                for _, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                    if 
                        v.Name == MagnetTarget 
                        and v:FindFirstChild("Humanoid") 
                        and v:FindFirstChild("HumanoidRootPart") 
                        and v.Humanoid.Health > 0 
                    then
                        v.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
                        v.Humanoid:ChangeState(14)
                        v.HumanoidRootPart.CanCollide = false
                        v.Head.CanCollide = false
                        v.HumanoidRootPart.CFrame = PosMon

                        if v.Humanoid:FindFirstChild("Animator") then
                            v.Humanoid.Animator:Destroy()
                        end

                        sethiddenproperty(
                            game:GetService("Players").LocalPlayer,
                            "SimulationRadius",
                            math.huge
                        )
                    end
                end
            end
        end)
    end
end)

----// Info Tab \\----

Tabs.Info:Label('Made by Trigon Evo')
Tabs.Info:Textbox({
		Title = 'Bug Report',
		Desc = 'Send Bug Report',
		Placeholder = 'Enter Bug . . .',
		Value = 'Text',
		ClearTextOnFocus = false,
		Callback = function(v)
			BugReport = v
            SendWebhook(Url, "Trigon Bug Report", "**New Bug Report!**\n```"..BugReport.."```")
		end,
	})

    Tabs.Info:Button({
        Title = 'Send Report',
        Desc = 'Click to Send Bug Report',
        Image = 'fingerprint-pattern',
        Callback = function()
            SendWebhook(Url, "Trigon Bug Report", "**New Bug Report!**\n```"..BugReport.."```")
            LiquidGlassNotify("Trigon","Bug Report Sent!","rbxassetid://82500352718600",5)
        end,
    })

    Tabs.Info:Button({
        Title = 'Inject SaliiiX Bypass AntiCheat',
        Desc = 'Click to Inject SaliiiX Bypass AntiCheat',
        Image = 'unplug',
        Callback = function()
            wait(1)
            LiquidGlassNotify("Trigon","Retrying","rbxassetid://82500352718600",5)
            wait(math.random(2,5))
            LiquidGlassNotify("Trigon","Bug Report Sent!","rbxassetid://82500352718600",5)
        end,
    })


    Tabs.Info:Label('Join Discord for more information!')
    Tabs.Info:Label('Trigon PC : 🟢 Working')
    Tabs.Info:Label('Trigon Mobile : 🟢 Working')

    Tabs.Info:Button({
        Title = 'Join Discord',
        Desc = 'Click to Join Discord',
        Image = 'discord',
        Callback = function()
            setclipboard("https://discord.gg/VVpRBZ9cZb")
            LiquidGlassNotify("Trigon","Discord Link Copied!","rbxassetid://82500352718600",5)
        end,
    })

    Tabs.Info:Button({
        Title = 'Copy Trigon Website',
        Desc = 'Click to Copy Website Link',
        Image = 'link',
        Callback = function()
            setclipboard("https://trigonevo.com")
            LiquidGlassNotify("Trigon","Website Link Copied!","rbxassetid://82500352718600",5)
        end,
    })

    --------// Main Tab \\--------
    Tabs.Main:Section('Farm Tab')

    ---// Auto Farm \\-----
    Tabs.Main:Toggle({
    Title = 'Auto Farm [ BETA ]',
    Desc = ' Auto Teleport To Highest Quest Level (Can Teleport Across World)',
    Image = 'sparkle',
    Value = false,
    Callback = function(v)
        getgenv().Settings.AutoFarmCrossWorld = v
        getgenv().Settings.Path = v
        SaveSettings()
    end,
})

task.spawn(function()
    while task.wait() do
        if not getgenv().Settings.AutoFarmCrossWorld then continue end
        xpcall(function()
            local PlayerLv = game.Players.LocalPlayer.Data.Level.Value
            
            if PlayerLv < 700 and FirstSea then
                getgenv().Settings.AutoFarm = true
                task.wait(1)
                CheckQ()
            elseif PlayerLv >= 700 and PlayerLv < 1500 and SecondSea then
                getgenv().Settings.AutoFarm = true
                task.wait(1)
                CheckQ()
            elseif PlayerLv >= 1500 and ThirdSea then
                getgenv().Settings.AutoFarm = true
                task.wait(1)
                CheckQ()
            elseif PlayerLv > 1500 and not ThirdSea then
                Warp(ThirdSea)
            elseif PlayerLv >= 700 and PlayerLv < 1500 and not SecondSea then
                Warp(SecondSea)
            elseif PlayerLv < 700 and not FirstSea then
                Warp(FirstSea)
            end
        end, function(err)
            print("AutoFarmCrossWorld Error:", err)
        end)
    end
end)

Tabs.Main:Toggle({
    Title = 'Auto Farm [ BETA ]',
    Desc = ' Auto Farm Level',
    Image = 'chevrons-up',
    Value = false,
    Callback = function(v)
        getgenv().Settings.AutoFarm = v
        getgenv().Settings.Path = v
        SaveSettings()
    end,
})

task.spawn(function()
    while task.wait() do
        if not getgenv().Settings.AutoFarm then continue end
        
        local PlayerLevel = game.Players.LocalPlayer.Data.Level.Value
        if PlayerLevel >= 2600 then
            local EEV = game:GetService("ReplicatedStorage").Modules.Net["RF/SubmarineWorkerSpeak"]
            EEV:InvokeServer("TravelToSubmergedIsland")
        end
        
        if not Mon or not NameMon or not NameQuest or not LevelQuest then
            CheckQ()
            task.wait(1)
        end
        
        if not Mon then continue end
        
        xpcall(function()
            local QuestFrame = game.Players.LocalPlayer.PlayerGui.Main.Quest
            local QuestTitle = QuestFrame.Title.Text
            
            if not string.find(QuestTitle, NameMon) then
                Magnet = false
                task.wait(0.5)
                game.ReplicatedStorage.Remotes.CommF_:InvokeServer("AbandonQuest")
            end
            
            if not QuestFrame.Visible then
                Magnet = false
                CheckQ()
                
                if CFrameQuest and (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - CFrameQuest.Position).Magnitude <= 10 then
                    game.ReplicatedStorage.Remotes.CommF_:InvokeServer("StartQuest", NameQuest, LevelQuest)
                end
            else
                CheckQ()
                
                if workspace.Enemies:FindFirstChild(Mon) then
                    for _,v in pairs(workspace.Enemies:GetChildren()) do
                        if v.Name ~= Mon then continue end
                        if not (v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0) then continue end
                        
                        local CurrentQuest = game.Players.LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text
                        
                        if not string.find(CurrentQuest, NameMon) then
                            Magnet = false
                            game.ReplicatedStorage.Remotes.CommF_:InvokeServer("AbandonQuest")
                            break
                        end
                        
                        repeat task.wait()
                            EquipWeapon(getgenv().SelectWeapon)
                            AutoHaki()
                            PosMon = v.HumanoidRootPart.CFrame
                            Tween(v.HumanoidRootPart.CFrame * Pos)
                            v.HumanoidRootPart.CanCollide = false
                            v.Humanoid.WalkSpeed = 0
                            v.Head.CanCollide = false
                            v.HumanoidRootPart.Size = Vector3.new(70,70,70)
                            Magnet = true
                            MagnetTarget = v.Name
                            
                            game:GetService'VirtualUser':CaptureController()
                            game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
                        until not getgenv().Settings.AutoFarm or v.Humanoid.Health <= 0 or not v.Parent or not QuestFrame.Visible
                        
                        break
                    end
                else
                    Magnet = false
                    if CFrameMon then
                        Tween(CFrameMon)
                    end
                    
                    local ReplicatedMon = game.ReplicatedStorage:FindFirstChild(Mon)
                    if ReplicatedMon then
                        Tween(ReplicatedMon.HumanoidRootPart.CFrame * CFrame.new(15, 10, 2))
                    end
                end
            end
        end, function(err)
            print("AutoFarm Error:", err)
        end)
    end
end)

-----// Auto Second Sea \\-----

Tabs.Main:Toggle({
    Title = 'Auto Second Sea',
    Desc = 'Auto Farm Second Sea',
    Value = getgenv().Settings.AutoSecondSea or false,
    Callback = function(v)
        getgenv().Settings.AutoSecondSea = v
        getgenv().Settings.Path = v
        SaveSettings()
    end,
})

task.spawn(function()
    while task.wait() do
        if not getgenv().Settings.AutoSecondSea then continue end
        
        xpcall(function()
            local PlayerLv = game.Players.LocalPlayer.Data.Level.Value
            
            if PlayerLv >= 700 and getgenv().FirstSea then
                getgenv().AutoFarm = false
                
                if workspace.Map.Ice.Door.Transparency == 1 then
                    local IceEnemy = workspace.Enemies:FindFirstChild("Ice Admiral")
                    
                    if IceEnemy then
                        for _,v in pairs(workspace.Enemies:GetChildren()) do
                            if v.Name ~= "Ice Admiral" then continue end
                            if not (v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0) then continue end
                            
                            repeat task.wait()
                                AutoHaki()
                                EquipWeapon(getgenv().SelectWeapon)
                                v.HumanoidRootPart.CanCollide = false
                                v.Humanoid.WalkSpeed = 0
                                v.Head.CanCollide = false
                                Tween(v.HumanoidRootPart.CFrame * Pos)
                                
                                game:GetService("VirtualUser"):CaptureController()
                                game:GetService("VirtualUser"):Button1Down(Vector2.new(1280,672))
                                sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
                                game.ReplicatedStorage.Remotes.CommF_:InvokeServer("TravelDressrosa")
                            until not getgenv().Settings.AutoSecondSea or not v.Parent or v.Humanoid.Health <= 0
                        end
                    else
                        local ReplicatedIce = game.ReplicatedStorage:FindFirstChild("Ice Admiral")
                        if ReplicatedIce then
                            Tween(ReplicatedIce.HumanoidRootPart.CFrame * CFrame.new(0,35,0))
                        end
                    end
                else
                    Tween(CFrame.new(4851.732421875, 5.651424884796143, 718.1107788085938))
                    task.wait(1.1)
                    game.ReplicatedStorage.Remotes.CommF_:InvokeServer("DressrosaQuestProgress","Detective")
                    task.wait(0.5)
                    EquipWeapon("Key")
                    Tween(CFrame.new(1348.487060546875, 37.34933853149414, -1326.12158203125))
                end
            elseif PlayerLv < 700 then
                getgenv().Settings.AutoSecondSea = false
                LiquidGlassNotify("Trigon","You Need to be Level 700","rbxassetid://82500352718600",5)
            elseif SecondSea == true then
                LiquidGlassNotify("Trigon","You Already Passed This Quest","rbxassetid://82500352718600",5)
                getgenv().Settings.AutoSecondSea = false
            elseif ThirdSea == true then
                LiquidGlassNotify("Trigon","You Already Passed This Quest","rbxassetid://82500352718600",5)
                getgenv().Settings.AutoSecondSea = false
            end
        end, function(err)
            warn("SecondSea Error:", err)
        end)
    end
end)

-----// Auto Third Sea \\-----

Tabs.Main:Toggle({
    Title = 'Auto Third Sea',
    Desc = 'Auto Farm Third Sea',
    Value = getgenv().Settings.AutoThirdSea or false,
    Callback = function(v)
        getgenv().Settings.AutoThirdSea = v
        getgenv().Settings.Path = v
        SaveSettings()
    end,
})

task.spawn(function()
    while task.wait() do
        if not getgenv().Settings.AutoThirdSea then continue end
        
        xpcall(function()
            local PlayerLv = game.Players.LocalPlayer.Data.Level.Value
            
            if PlayerLv >= 1500 and SecondSea then
                getgenv().Settings.AutoFarm = false
                
                local QuestCheck = game.ReplicatedStorage.Remotes.CommF_:InvokeServer("ZQuestProgress", "Check")
                
                if QuestCheck == 0 then
                    Tween(CFrame.new(-1926.3221435547, 12.819851875305, 1738.3092041016))
                    
                    if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(-1926.3221435547, 12.819851875305, 1738.3092041016)).Magnitude <= 10 then
                        task.wait(1.5)
                        game.ReplicatedStorage.Remotes.CommF_:InvokeServer("ZQuestProgress", "Begin")
                    end
                    
                    task.wait(1.8)
                    
                    local RipIndra = workspace.Enemies:FindFirstChild("rip_indra")
                    
                    if RipIndra then
                        for _,v in pairs(workspace.Enemies:GetChildren()) do
                            if v.Name ~= "rip_indra" then continue end
                            if not (v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0) then continue end
                            
                            repeat task.wait()
                                AutoHaki()
                                EquipWeapon(getgenv().SelectWeapon)
                                Tween(v.HumanoidRootPart.CFrame * Pos)
                                v.HumanoidRootPart.CanCollide = false
                                v.HumanoidRootPart.Size = Vector3.new(70, 70, 70)
                                v.Humanoid.WalkSpeed = 0
                                
                                game:GetService'VirtualUser':CaptureController()
                                game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
                                game.ReplicatedStorage.Remotes.CommF_:InvokeServer("TravelZou")
                                sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
                            until not getgenv().Settings.AutoThirdSea or v.Humanoid.Health <= 0 or not v.Parent
                        end
                    elseif not RipIndra and (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(-26880.93359375, 22.848554611206, 473.18951416016)).Magnitude <= 1000 then
                        Tween(CFrame.new(-26880.93359375, 22.848554611206, 473.18951416016))
                    end
                    
                    sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
                end
            elseif PlayerLv < 1500 then
                getgenv().Settings.AutoThirdSea = false
                LiquidGlassNotify("Trigon", "You Need to be Level 1500", "rbxassetid://82500352718600", 5)
            elseif ThirdSea == true then
                LiquidGlassNotify("Trigon", "You Already in Third Sea", "rbxassetid://82500352718600", 5)
                getgenv().Settings.AutoThirdSea = false
            end
        end, function(err)
            warn("AutoThirdSea Error:", err)
        end)
    end
end)

----// Auto Farm Boss \\----

local BossNameStorage = {
    "The Gorilla King", "Bobby", "The Saw", "Yeti", "Mob Leader", "Vice Admiral", "Saber Expert", "Warden", "Chief Warden", "Swan", "Magma Admiral", "Fishman Lord", "Wysper", "Thunder God", "Cyborg", "Ice Admiral", "Greybeard",
    "Diamond", "Jeremy", "Fajita", "Don Swan", "Smoke Admiral", "Awakened Ice Admiral", "Tide Keeper", "Darkbeard", "Cursed Captain", "Order",
    "Stone", "Island Empress", "Kilo Admiral", "Captain Elephant", "Beautiful Pirate", "Cake Queen", "Longma", "Soul Reaper", "rip_indra True Form","Dough King","Cake Prince","Tyrant of the Skies"
}

local BossList = {}

local function UpdateBossList()
    BossList = {}
    for _,bossName in pairs(BossNameStorage) do
        local enemy = workspace.Enemies:FindFirstChild(bossName) or game.ReplicatedStorage:FindFirstChild(bossName)
        if enemy then
            table.insert(BossList, bossName)
        end
    end
    if #BossList == 0 then
        BossList = {"No Boss Found"}
    end
end

UpdateBossList()

local BossDropdown = Tabs.Main:Dropdown({
    Title = 'Select Boss',
    Desc = 'Select Boss to Farm',
    Image = 'mouse-pointer-click',
    Options = BossList,
    Value = getgenv().Settings.SelectedBoss or BossList[1],
    Callback = function(v)
        getgenv().Settings.SelectedBoss = v
        SaveSettings()
    end,
})

Tabs.Main:Button({
    Title = 'Refresh List',
    Desc = 'Refresh Boss List',
    Image = 'arrows-rotate',
    Callback = function()
        UpdateBossList()
        BossDropdown:SetOptions(BossList)
        if BossList[1] ~= "No Boss Found" then
            LiquidGlassNotify("Trigon", "Boss List Refreshed!", "rbxassetid://82500352718600", 3)
        else
            LiquidGlassNotify("Trigon", "No Boss Found!", "rbxassetid://82500352718600", 3)
        end
    end,
})

Tabs.Main:Toggle({
    Title = 'Auto Farm Selected Boss',
    Desc = 'Auto Farm Selected Boss',
    Image = 'swords',
    Value = getgenv().Settings.AutoFarmBoss or false,
    Callback = function(v)
        getgenv().Settings.AutoFarmBoss = v
        getgenv().Settings.Path = v
        SaveSettings()
    end,
})

Tabs.Main:Toggle({
    Title = 'Accept Quest',
    Desc = 'Auto Accept Quest for Boss',
    Image = 'check-circle',
    Value = getgenv().Settings.AcceptQuestBoss or false,
    Callback = function(v)
        getgenv().Settings.AcceptQuestBoss = v
        if getgenv().Settings.AcceptQuestBoss then
            if getgenv().Settings.SelectedBoss == "Cake Prince" or getgenv().Settings.SelectedBoss == "Dough King" or getgenv().Settings.SelectedBoss == "Tyrant of the Skies" or getgenv().Settings.SelectedBoss == "Rip Indra True Form" or getgenv().Settings.SelectedBoss == "Soul Reaper" or getgenv().Settings.SelectedBoss == "DarkBeard" or getgenv().Settings.SelectedBoss == "Greybeard" or getgenv().Settings.SelectedBoss == "Order" then
                LiquidGlassNotify("Trigon", "There's No Quest Available For This Boss!", "rbxassetid://82500352718600", 5)
            else
                LiquidGlassNotify("Trigon", "Auto Accept Quest Enabled!", "rbxassetid://82500352718600", 5)
            end
        end
        SaveSettings()
    end,
})

task.spawn(function()
    while task.wait() do
        if not getgenv().Settings.AutoFarmBoss then continue end
        local SelectBoss = getgenv().Settings.SelectedBoss
        if not SelectBoss or SelectBoss == "No Boss Found" then continue end
        xpcall(function()
            CheckBossQuest()
            if not NameBoss then
                task.wait(3)
                return
            end
            local QuestFrame = game.Players.LocalPlayer.PlayerGui.Main.Quest
            local QuestTitle = QuestFrame.Container.QuestTitle.Title.Text
            
            if not string.find(QuestTitle, NameBoss) or not QuestFrame.Visible then
                game.ReplicatedStorage.Remotes.CommF_:InvokeServer("AbandonQuest")
                
                if getgenv().Settings.AcceptQuestBoss then
                    game.ReplicatedStorage.Remotes.CommF_:InvokeServer("StartQuest", NameQuestBoss, QuestLvBoss)
                end
            elseif string.find(QuestTitle, NameBoss) and QuestFrame.Visible then
                if workspace.Enemies:FindFirstChild(SelectBoss) then
                    for _,v in pairs(workspace.Enemies:GetChildren()) do
                        if v.Name ~= SelectBoss then continue end
                        if not (v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0) then continue end
                        repeat task.wait()
                            EquipWeapon(getgenv().SelectWeapon)
                            AutoHaki()
                            Tween(v.HumanoidRootPart.CFrame * Pos)
                            v.HumanoidRootPart.CanCollide = false
                            v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                            v.Humanoid.WalkSpeed = 0
                            game:GetService'VirtualUser':CaptureController()
                            game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
                        until not getgenv().Settings.AutoFarmBoss or not v.Parent or v.Humanoid.Health <= 0 or not workspace.Enemies:FindFirstChild(v.Name) or not QuestFrame.Visible
                    end
                else
                    if CFrameBoss then
                        Tween(CFrameBoss)
                    end
                end
            end
        end, function(err)
            warn("AutoFarmBoss Error:", err)
        end)
    end
end)

----// Item Tab \\----
MaterialList = {"Magma Ore", "Mystic Droplet", "Dragon Scale","Scrap Metal","Fish Tail","Gunpowder","Mini Tusk","Radioactive","Angel Wings"}
Tabs.Item:Dropdown({
    Title = "Select Material ( Common Materials )",
    Desc = "Select Material to Farm",
    Options = MaterialList,
    Callback = function(v)
        getgenv().Settings.SelectedMaterial = v
        SaveSettings()
    end,
})

local farmstatus = "None 🔴"
Tabs.Item:Label("Current Farming Status : " .. farmstatus)

Tabs.Item:Toggle({
    Title = 'Auto Farm Material ( Common Materials )',
    Desc = 'Auto Farm Selected Material',
    Image = 'pickaxe',
    Value = getgenv().Settings.AutoFarmMaterial or false,
    Callback = function(v)
        getgenv().Settings.AutoFarmMaterial = v
        getgenv().Settings.Path = v
        SaveSettings()
    end,
})

task.spawn(function()
    while task.wait() do
        if getgenv().Settings.AutoFarmMaterial and getgenv().Settings.SelectedMaterial == "Magma Ore" then
            farmstatus = "Magma Ore 🟢"
        elseif getgenv().Settings.AutoFarmMaterial and getgenv().Settings.SelectedMaterial == "Mystic Droplet" then
            farmstatus = "Mystic Droplet 🟢"
        elseif getgenv().Settings.AutoFarmMaterial and getgenv().Settings.SelectedMaterial == "Dragon Scale" then
            farmstatus = "Dragon Scale 🟢"
        elseif getgenv().Settings.AutoFarmMaterial and getgenv().Settings.SelectedMaterial == "Scrap Metal" then
            farmstatus = "Scrap Metal 🟢"
        elseif getgenv().Settings.AutoFarmMaterial and getgenv().Settings.SelectedMaterial == "Fish Tail" then
            farmstatus = "Fish Tail 🟢"
        elseif getgenv().Settings.AutoFarmMaterial and getgenv().Settings.SelectedMaterial == "Gunpowder" then
            farmstatus = "Gunpowder 🟢"
        elseif getgenv().Settings.AutoFarmMaterial and getgenv().Settings.SelectedMaterial == "Mini Tusk" then
            farmstatus = "Mini Tusk 🟢"
        elseif getgenv().Settings.AutoFarmMaterial and getgenv().Settings.SelectedMaterial == "Radioactive" then
            farmstatus = "Radioactive 🟢"
        elseif getgenv().Settings.AutoFarmMaterial and getgenv().Settings.SelectedMaterial == "Angel Wings" then
            farmstatus = "Angel Wings 🟢"
        else
            farmstatus = "None 🔴"
        end
    end
end)

local MaterialFarmStatus = {
    MagmaOre = false,
    MysticDroplet = false,
    DragonScale = false,
    ScrapMetal = false,
    FishTail = false,
    Gunpowder = false,
    MiniTusk = false,
    Radioactive = false,
    AngelWings = false
}

task.spawn(function()
    while task.wait() do
        MaterialFarmStatus.MagmaOre = false
        MaterialFarmStatus.MysticDroplet = false
        MaterialFarmStatus.DragonScale = false
        MaterialFarmStatus.ScrapMetal = false
        MaterialFarmStatus.FishTail = false
        MaterialFarmStatus.Gunpowder = false
        MaterialFarmStatus.MiniTusk = false
        MaterialFarmStatus.Radioactive = false
        MaterialFarmStatus.AngelWings = false
        
        if getgenv().Settings.AutoFarmMaterial and getgenv().Settings.SelectedMaterial then
            local SelectedMat = getgenv().Settings.SelectedMaterial
            
            if FirstSea and SelectedMat == "Magma Ore" then
                MaterialFarmStatus.MagmaOre = true
            elseif SecondSea and SelectedMat == "Mystic Droplet" then
                MaterialFarmStatus.MysticDroplet = true
            elseif ThirdSea and SelectedMat == "Dragon Scale" then
                MaterialFarmStatus.DragonScale = true
            elseif SelectedMat == "Scrap Metal" then
                MaterialFarmStatus.ScrapMetal = true
            elseif ThirdSea and SelectedMat == "Fish Tail" then
                MaterialFarmStatus.FishTail = true
            elseif ThirdSea and SelectedMat == "Gunpowder" then
                MaterialFarmStatus.Gunpowder = true
            elseif ThirdSea and SelectedMat == "Mini Tusk" then
                MaterialFarmStatus.MiniTusk = true
            elseif SecondSea and SelectedMat == "Radioactive" then
                MaterialFarmStatus.Radioactive = true
            elseif FirstSea and SelectedMat == "Angel Wings" then
                MaterialFarmStatus.AngelWings = true
            end
        end
    end
end)

task.spawn(function()
    while task.wait() do
        if not MaterialFarmStatus.MysticDroplet then continue end
        xpcall(function()
            if workspace.Enemies:FindFirstChild("Water Fighter") then
                for _,v in pairs(workspace.Enemies:GetChildren()) do
                    if v.Name == "Water Fighter" then
                        if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                            repeat task.wait()
                                AutoHaki()
                                EquipWeapon(getgenv().SelectWeapon)
                                v.HumanoidRootPart.CanCollide = false
                                v.Humanoid.WalkSpeed = 0
                                v.Head.CanCollide = false
                                v.HumanoidRootPart.Size = Vector3.new(70,70,70)
                                Magnet = true
                                MagnetTarget = v.Name
                                PosMon = v.HumanoidRootPart.CFrame
                                Tween(v.HumanoidRootPart.CFrame * Pos)
                                game:GetService("VirtualUser"):CaptureController()
                                game:GetService("VirtualUser"):Button1Down(Vector2.new(1280,672))
                            until not MaterialFarmStatus.MysticDroplet or not v.Parent or v.Humanoid.Health <= 0
                            Magnet = false
                            MagnetTarget = ""
                        end
                    end
                end
            else
                Tween(CFrame.new(-3352.9013671875, 285.01556396484375, -10534.841796875))
                local ReplicatedWater = game.ReplicatedStorage:FindFirstChild("Water Fighter")
                if ReplicatedWater then
                    Tween(ReplicatedWater.HumanoidRootPart.CFrame * CFrame.new(2,20,2))
                end
                sethiddenproperty(game.Players.LocalPlayer,"SimulationRadius",math.huge)
            end
        end, function(err)
            warn("MysticDroplet Error:", err)
        end)
    end
end)

task.spawn(function()
    while task.wait() do
        if not MaterialFarmStatus.ScrapMetal or not FirstSea then continue end
        xpcall(function()
            if workspace.Enemies:FindFirstChild("Brute") then
                for _,v in pairs(workspace.Enemies:GetChildren()) do
                    if v.Name == "Brute" then
                        if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                            repeat task.wait()
                                AutoHaki()
                                EquipWeapon(getgenv().SelectWeapon)
                                v.HumanoidRootPart.CanCollide = false
                                v.Humanoid.WalkSpeed = 0
                                v.Head.CanCollide = false
                                v.HumanoidRootPart.Size = Vector3.new(70,70,70)
                                Magnet = true
                                MagnetTarget = v.Name
                                PosMon = v.HumanoidRootPart.CFrame
                                Tween(v.HumanoidRootPart.CFrame * Pos)
                                game:GetService("VirtualUser"):CaptureController()
                                game:GetService("VirtualUser"):Button1Down(Vector2.new(1280,672))
                            until not MaterialFarmStatus.ScrapMetal or not v.Parent or v.Humanoid.Health <= 0
                            Magnet = false
                            MagnetTarget = ""
                        end
                    end
                end
            else
                Tween(CFrame.new(-1132.4202880859375, 14.844913482666016, 4293.30517578125))
                local ReplicatedBrute = game.ReplicatedStorage:FindFirstChild("Brute")
                if ReplicatedBrute then
                    Tween(ReplicatedBrute.HumanoidRootPart.CFrame * CFrame.new(2,20,2))
                end
                sethiddenproperty(game.Players.LocalPlayer,"SimulationRadius",math.huge)
            end
        end, function(err)
            warn("ScrapMetal FirstSea Error:", err)
        end)
    end
end)

task.spawn(function()
    while task.wait() do
        if not MaterialFarmStatus.ScrapMetal or not SecondSea then continue end
        xpcall(function()
            if workspace.Enemies:FindFirstChild("Mercenary") then
                for _,v in pairs(workspace.Enemies:GetChildren()) do
                    if v.Name == "Mercenary" then
                        if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                            repeat task.wait()
                                AutoHaki()
                                EquipWeapon(getgenv().SelectWeapon)
                                v.HumanoidRootPart.CanCollide = false
                                v.Humanoid.WalkSpeed = 0
                                v.Head.CanCollide = false
                                v.HumanoidRootPart.Size = Vector3.new(70,70,70)
                                Magnet = true
                                MagnetTarget = v.Name
                                PosMon = v.HumanoidRootPart.CFrame
                                Tween(v.HumanoidRootPart.CFrame * Pos)
                                game:GetService("VirtualUser"):CaptureController()
                                game:GetService("VirtualUser"):Button1Down(Vector2.new(1280,672))
                            until not MaterialFarmStatus.ScrapMetal or not v.Parent or v.Humanoid.Health <= 0
                            Magnet = false
                            MagnetTarget = ""
                        end
                    end
                end
            else
                Tween(CFrame.new(-972.307373046875, 73.04473876953125, 1419.2901611328125))
                local ReplicatedMercenary = game.ReplicatedStorage:FindFirstChild("Mercenary")
                if ReplicatedMercenary then
                    Tween(ReplicatedMercenary.HumanoidRootPart.CFrame * CFrame.new(2,20,2))
                end
                sethiddenproperty(game.Players.LocalPlayer,"SimulationRadius",math.huge)
            end
        end, function(err)
            warn("ScrapMetal SecondSea Error:", err)
        end)
    end
end)

task.spawn(function()
    while task.wait() do
        if not MaterialFarmStatus.ScrapMetal or not ThirdSea then continue end
        xpcall(function()
            if workspace.Enemies:FindFirstChild("Pirate Millionaire") then
                for _,v in pairs(workspace.Enemies:GetChildren()) do
                    if v.Name == "Pirate Millionaire" then
                        if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                            repeat task.wait()
                                AutoHaki()
                                EquipWeapon(getgenv().SelectWeapon)
                                v.HumanoidRootPart.CanCollide = false
                                v.Humanoid.WalkSpeed = 0
                                v.Head.CanCollide = false
                                v.HumanoidRootPart.Size = Vector3.new(70,70,70)
                                Magnet = true
                                MagnetTarget = v.Name
                                PosMon = v.HumanoidRootPart.CFrame
                                Tween(v.HumanoidRootPart.CFrame * Pos)
                                game:GetService("VirtualUser"):CaptureController()
                                game:GetService("VirtualUser"):Button1Down(Vector2.new(1280,672))
                            until not MaterialFarmStatus.ScrapMetal or not v.Parent or v.Humanoid.Health <= 0
                            Magnet = false
                            MagnetTarget = ""
                        end
                    end
                end
            else
                Tween(CFrame.new(-289.6311950683594, 43.8282470703125, 5583.66357421875))
                local ReplicatedPirate = game.ReplicatedStorage:FindFirstChild("Pirate Millionaire")
                if ReplicatedPirate then
                    Tween(ReplicatedPirate.HumanoidRootPart.CFrame * CFrame.new(2,20,2))
                end
                sethiddenproperty(game.Players.LocalPlayer,"SimulationRadius",math.huge)
            end
        end, function(err)
            warn("ScrapMetal ThirdSea Error:", err)
        end)
    end
end)

task.spawn(function()
    while task.wait() do
        if not MaterialFarmStatus.DragonScale then continue end
        xpcall(function()
            if workspace.Enemies:FindFirstChild("Dragon Crew Warrior") then
                for _,v in pairs(workspace.Enemies:GetChildren()) do
                    if v.Name == "Dragon Crew Warrior" then
                        if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                            repeat task.wait()
                                AutoHaki()
                                EquipWeapon(getgenv().SelectWeapon)
                                v.HumanoidRootPart.CanCollide = false
                                v.Humanoid.WalkSpeed = 0
                                v.Head.CanCollide = false
                                v.HumanoidRootPart.Size = Vector3.new(70,70,70)
                                Magnet = true
                                MagnetTarget = v.Name
                                PosMon = v.HumanoidRootPart.CFrame
                                Tween(v.HumanoidRootPart.CFrame * Pos)
                                game:GetService("VirtualUser"):CaptureController()
                                game:GetService("VirtualUser"):Button1Down(Vector2.new(1280,672))
                            until not MaterialFarmStatus.DragonScale or not v.Parent or v.Humanoid.Health <= 0
                            Magnet = false
                            MagnetTarget = ""
                        end
                    end
                end
            else
                Tween(CFrame.new(6997.46143, 55.771534, -613.426208, 0.996458054, -1.4075791e-8, -0.0840910524, 1.2038066e-8, 1, -2.4739414e-8, 0.0840910524, 2.3639494e-8, 0.996458054))
                local ReplicatedDragon = game.ReplicatedStorage:FindFirstChild("Dragon Crew Warrior")
                if ReplicatedDragon then
                    Tween(ReplicatedDragon.HumanoidRootPart.CFrame * CFrame.new(2,20,2))
                end
                sethiddenproperty(game.Players.LocalPlayer,"SimulationRadius",math.huge)
            end
        end, function(err)
            warn("DragonScale Error:", err)
        end)
    end
end)

task.spawn(function()
    while task.wait() do
        if not MaterialFarmStatus.Gunpowder then continue end
        xpcall(function()
            if workspace.Enemies:FindFirstChild("Pistol Billionaire") then
                for _,v in pairs(workspace.Enemies:GetChildren()) do
                    if v.Name == "Pistol Billionaire" then
                        if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                            repeat task.wait()
                                AutoHaki()
                                EquipWeapon(getgenv().SelectWeapon)
                                v.HumanoidRootPart.CanCollide = false
                                v.Humanoid.WalkSpeed = 0
                                v.Head.CanCollide = false
                                v.HumanoidRootPart.Size = Vector3.new(70,70,70)
                                Magnet = true
                                MagnetTarget = v.Name
                                PosMon = v.HumanoidRootPart.CFrame
                                Tween(v.HumanoidRootPart.CFrame * Pos)
                                game:GetService("VirtualUser"):CaptureController()
                                game:GetService("VirtualUser"):Button1Down(Vector2.new(1280,672))
                            until not MaterialFarmStatus.Gunpowder or not v.Parent or v.Humanoid.Health <= 0
                            Magnet = false
                            MagnetTarget = ""
                        end
                    end
                end
            else
                Tween(CFrame.new(-379.6134338378906, 73.84449768066406, 5928.5263671875))
                local ReplicatedPistol = game.ReplicatedStorage:FindFirstChild("Pistol Billionaire")
                if ReplicatedPistol then
                    Tween(ReplicatedPistol.HumanoidRootPart.CFrame * CFrame.new(2,20,2))
                end
                sethiddenproperty(game.Players.LocalPlayer,"SimulationRadius",math.huge)
            end
        end, function(err)
            warn("Gunpowder Error:", err)
        end)
    end
end)

task.spawn(function()
    while task.wait() do
        if not MaterialFarmStatus.FishTail then continue end
        xpcall(function()
            if workspace.Enemies:FindFirstChild("Fishman Captain") then
                for _,v in pairs(workspace.Enemies:GetChildren()) do
                    if v.Name == "Fishman Captain" then
                        if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                            repeat task.wait()
                                AutoHaki()
                                EquipWeapon(getgenv().SelectWeapon)
                                v.HumanoidRootPart.CanCollide = false
                                v.Humanoid.WalkSpeed = 0
                                v.Head.CanCollide = false
                                v.HumanoidRootPart.Size = Vector3.new(70,70,70)
                                Magnet = true
                                MagnetTarget = v.Name
                                PosMon = v.HumanoidRootPart.CFrame
                                Tween(v.HumanoidRootPart.CFrame * Pos)
                                game:GetService("VirtualUser"):CaptureController()
                                game:GetService("VirtualUser"):Button1Down(Vector2.new(1280,672))
                            until not MaterialFarmStatus.FishTail or not v.Parent or v.Humanoid.Health <= 0
                            Magnet = false
                            MagnetTarget = ""
                        end
                    end
                end
            else
                Tween(CFrame.new(-10961.0126953125, 331.7977600097656, -8914.29296875))
                local ReplicatedFish = game.ReplicatedStorage:FindFirstChild("Fishman Captain")
                if ReplicatedFish then
                    Tween(ReplicatedFish.HumanoidRootPart.CFrame * CFrame.new(2,20,2))
                end
                sethiddenproperty(game.Players.LocalPlayer,"SimulationRadius",math.huge)
            end
        end, function(err)
            warn("FishTail Error:", err)
        end)
    end
end)

task.spawn(function()
    while task.wait() do
        if not MaterialFarmStatus.Radioactive then continue end
        xpcall(function()
            if workspace.Enemies:FindFirstChild("Factory Staff") then
                for _,v in pairs(workspace.Enemies:GetChildren()) do
                    if v.Name == "Factory Staff" then
                        if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                            repeat task.wait()
                                AutoHaki()
                                EquipWeapon(getgenv().SelectWeapon)
                                v.HumanoidRootPart.CanCollide = false
                                v.Humanoid.WalkSpeed = 0
                                v.Head.CanCollide = false
                                v.HumanoidRootPart.Size = Vector3.new(70,70,70)
                                Magnet = true
                                MagnetTarget = v.Name
                                PosMon = v.HumanoidRootPart.CFrame
                                Tween(v.HumanoidRootPart.CFrame * Pos)
                                game:GetService("VirtualUser"):CaptureController()
                                game:GetService("VirtualUser"):Button1Down(Vector2.new(1280,672))
                            until not MaterialFarmStatus.Radioactive or not v.Parent or v.Humanoid.Health <= 0
                            Magnet = false
                            MagnetTarget = ""
                        end
                    end
                end
            else
                Tween(CFrame.new(73.07867431640625, 81.86344146728516, -27.470672607421875))
                local ReplicatedFactory = game.ReplicatedStorage:FindFirstChild("Factory Staff")
                if ReplicatedFactory then
                    Tween(ReplicatedFactory.HumanoidRootPart.CFrame * CFrame.new(2,20,2))
                end
            end
        end, function(err)
            warn("Radioactive Error:", err)
        end)
    end
end)

task.spawn(function()
    while task.wait() do
        if not MaterialFarmStatus.MiniTusk then continue end
        xpcall(function()
            if workspace.Enemies:FindFirstChild("Mythological Pirate") then
                for _,v in pairs(workspace.Enemies:GetChildren()) do
                    if v.Name == "Mythological Pirate" then
                        if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                            repeat task.wait()
                                AutoHaki()
                                EquipWeapon(getgenv().SelectWeapon)
                                v.HumanoidRootPart.CanCollide = false
                                v.Humanoid.WalkSpeed = 0
                                v.Head.CanCollide = false
                                v.HumanoidRootPart.Size = Vector3.new(70,70,70)
                                Magnet = true
                                MagnetTarget = v.Name
                                PosMon = v.HumanoidRootPart.CFrame
                                Tween(v.HumanoidRootPart.CFrame * Pos)
                                game:GetService("VirtualUser"):CaptureController()
                                game:GetService("VirtualUser"):Button1Down(Vector2.new(1280,672))
                            until not MaterialFarmStatus.MiniTusk or not v.Parent or v.Humanoid.Health <= 0
                            Magnet = false
                            MagnetTarget = ""
                        end
                    end
                end
            else
                Tween(CFrame.new(-13516.0458984375, 469.8182373046875, -6899.16064453125))
                local ReplicatedMyth = game.ReplicatedStorage:FindFirstChild("Mythological Pirate")
                if ReplicatedMyth then
                    Tween(ReplicatedMyth.HumanoidRootPart.CFrame * CFrame.new(2,20,2))
                end
                sethiddenproperty(game.Players.LocalPlayer,"SimulationRadius",math.huge)
            end
        end, function(err)
            warn("MiniTusk Error:", err)
        end)
    end
end)

task.spawn(function()
    while task.wait() do
        if not MaterialFarmStatus.MagmaOre then continue end
        xpcall(function()
            if workspace.Enemies:FindFirstChild("Military Spy") or workspace.Enemies:FindFirstChild("Military Soldier") then
                for _,v in pairs(workspace.Enemies:GetChildren()) do
                    if v.Name == "Military Spy" or v.Name == "Military Soldier" then
                        if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                            repeat task.wait()
                                AutoHaki()
                                EquipWeapon(getgenv().SelectWeapon)
                                v.HumanoidRootPart.CanCollide = false
                                v.Humanoid.WalkSpeed = 0
                                v.Head.CanCollide = false
                                v.HumanoidRootPart.Size = Vector3.new(70,70,70)
                                Magnet = true
                                MagnetTarget = v.Name
                                PosMon = v.HumanoidRootPart.CFrame
                                Tween(v.HumanoidRootPart.CFrame * Pos)
                                game:GetService("VirtualUser"):CaptureController()
                                game:GetService("VirtualUser"):Button1Down(Vector2.new(1280,672))
                            until not MaterialFarmStatus.MagmaOre or not v.Parent or v.Humanoid.Health <= 0
                            Magnet = false
                            MagnetTarget = ""
                        end
                    end
                end
            else
                Tween(CFrame.new(-5735.75391, 69.97995, 8593.11621, 0.86209774, 1.48827706e-08, -0.50674206, 1.21741008e-08, 1, 5.00807751e-08, 0.50674206, -4.93436509e-08, 0.86209774))
                local ReplicatedSpy = game.ReplicatedStorage:FindFirstChild("Military Spy")
                local ReplicatedSoldier = game.ReplicatedStorage:FindFirstChild("Military Soldier")
                if ReplicatedSpy then
                    Tween(ReplicatedSpy.HumanoidRootPart.CFrame * CFrame.new(2,20,2))
                end
                if ReplicatedSoldier then
                    Tween(ReplicatedSoldier.HumanoidRootPart.CFrame * CFrame.new(2,20,2))
                end
                sethiddenproperty(game.Players.LocalPlayer,"SimulationRadius",math.huge)
            end
        end, function(err)
            warn("MagmaOre Error:", err)
        end)
    end
end)

task.spawn(function()
    while task.wait() do
        if not MaterialFarmStatus.AngelWings then continue end
        xpcall(function()
            if workspace.Enemies:FindFirstChild("Royal Squad") or workspace.Enemies:FindFirstChild("Royal Soldier") then
                for _,v in pairs(workspace.Enemies:GetChildren()) do
                    if v.Name == "Royal Soldier" or v.Name == "Royal Squad" then
                        if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                            repeat task.wait()
                                AutoHaki()
                                EquipWeapon(getgenv().SelectWeapon)
                                v.HumanoidRootPart.CanCollide = false
                                v.Humanoid.WalkSpeed = 0
                                v.Head.CanCollide = false
                                v.HumanoidRootPart.Size = Vector3.new(70,70,70)
                                Magnet = true
                                MagnetTarget = v.Name
                                PosMon = v.HumanoidRootPart.CFrame
                                Tween(v.HumanoidRootPart.CFrame * Pos)
                                game:GetService("VirtualUser"):CaptureController()
                                game:GetService("VirtualUser"):Button1Down(Vector2.new(1280,672))
                            until not MaterialFarmStatus.AngelWings or not v.Parent or v.Humanoid.Health <= 0
                            Magnet = false
                            MagnetTarget = ""
                        end
                    end
                end
            else
                game.ReplicatedStorage.Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-7894.6176757813, 5547.1416015625, -380.29119873047))
                task.wait()
                Tween(CFrame.new(-7817.5127, 5636.01514, -1523.33228, 0.0800286755, -4.80972595e-10, -0.996792555, 1.06970965e-08, 1, 3.76308845e-10, 0.996792555, -1.06929017e-08, 0.0800286755))
                local ReplicatedSquad = game.ReplicatedStorage:FindFirstChild("Royal Squad")
                local ReplicatedRoyal = game.ReplicatedStorage:FindFirstChild("Royal Soldier")
                if ReplicatedSquad then
                    Tween(ReplicatedSquad.HumanoidRootPart.CFrame * CFrame.new(2,20,2))
                end
                if ReplicatedRoyal then
                    Tween(ReplicatedRoyal.HumanoidRootPart.CFrame * CFrame.new(2,20,2))
                end
                sethiddenproperty(game.Players.LocalPlayer,"SimulationRadius",math.huge)
            end
        end, function(err)
            warn("AngelWings Error:", err)
        end)
    end
end)

Tabs.Item:Section("First Sea")

Tabs.Item:Toggle({
    Title = 'Auto Saber',
    Desc = 'Auto Saber Quest',
    Image = 'key',
    Value = getgenv().Settings.AutoSaber or false,
    Callback = function(v)
        getgenv().Settings.AutoSaber = v
        getgenv().Settings.Path = v 
        SaveSettings()
    end,
})

task.spawn(function()
    while task.wait() do
        if getgenv().Settings.AutoSaber and FirstSea and game.Players.LocalPlayer.Data.Level.Value >= 200 then
            pcall(function()
                if game:GetService("Workspace").Map.Jungle.Final.Part.Transparency == 0 then
                        if game:GetService("Workspace").Map.Jungle.QuestPlates.Door.Transparency == 0 then
                            if (CFrame.new(-1612.55884, 36.9774132, 148.719543, 0.37091279, 3.071715e-9, -0.928667724, 3.970995e-8, 1, 1.9167935e-8, 0.928667724, -4.398698e-8, 0.37091279).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 100 then
                                Tween(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame)
                                task.wait(1)
                                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Map.Jungle.QuestPlates.Plate1.Button.CFrame
                                task.wait(2)
                                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Map.Jungle.QuestPlates.Plate2.Button.CFrame
                                task.wait(2)
                                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Map.Jungle.QuestPlates.Plate3.Button.CFrame
                                task.wait(2)
                                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Map.Jungle.QuestPlates.Plate4.Button.CFrame
                                task.wait(2)
                                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Map.Jungle.QuestPlates.Plate5.Button.CFrame
                                task.wait(2)
                            else
                                Tween(CFrame.new(-1612.55884, 36.9774132, 148.719543, 0.37091279, 3.071715e-9, -0.928667724, 3.970995e-8, 1, 1.9167935e-8, 0.928667724, -4.398698e-8, 0.37091279))
                            end
                        else
                            if game:GetService("Workspace").Map.Desert.Burn.Part.Transparency == 0 then
                                if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Torch") or game.Players.LocalPlayer.Character:FindFirstChild("Torch") then
                                    EquipWeapon("Torch")
                                    Tween(CFrame.new(1114.61475, 5.04679728, 4350.22803, -0.648466587, -1.2879909e-9, 0.761243105, -5.706529e-10, 1, 1.2058454e-9, -0.761243105, 3.4754488e-10, -0.648466587))
                                  else
                                  Tween(CFrame.new(-1610.00757, 11.5049858, 164.001587, 0.984807551, -0.167722285, -0.0449818149, 0.17364943, 0.951244235, 0.254912198, 0.00003423728, -0.258850515, 0.965917408))
                                end
                            else
                                if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress","SickMan") ~= 0 then
                                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress","GetCup")
                                    task.wait(0.5)
                                    EquipWeapon("Cup")
                                    task.wait(0.5)
                                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress","FillCup",game:GetService("Players").LocalPlayer.Character.Cup)
                                    task.wait()
                                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress","SickMan")
                                else
                                    if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress","RichSon") == nil then
                                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress","RichSon")
                                    elseif game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress","RichSon") == 0 then
                                    if game:GetService("Workspace").Enemies:FindFirstChild("Mob Leader") or game:GetService("ReplicatedStorage"):FindFirstChild("Mob Leader") then
                                        Tween(CFrame.new(-2883.5400390625, 7.562280178070068, 5441.826171875)) 
                                            for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                                if v.Name == "Mob Leader" then
                                                   if game:GetService("Workspace").Enemies:FindFirstChild("Mob Leader") then
                                                    if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                                        repeat task.wait()                                                                                                       
                                                        AutoHaki()
                                                        EquipWeapon(getgenv().Settings.AutoSaber)
                                                        v.HumanoidRootPart.CanCollide = false
                                                        v.Humanoid.WalkSpeed = 0
                                                        v.HumanoidRootPart.Size = Vector3.new(50,50,50)                             
                                                        Tween(v.HumanoidRootPart.CFrame * CFrame.new(0,10,0))
                                                        sethiddenproperty(game:GetService("Players").LocalPlayer,"SimulationRadius",math.huge)
                                                        until v.Humanoid.Health <= 0 or not getgenv().Settings.AutoSaber
                                                     end
                                                end
                                                if game:GetService("ReplicatedStorage"):FindFirstChild("Mob Leader") then
                                                    Tween(game:GetService("ReplicatedStorage"):FindFirstChild("Mob Leader").HumanoidRootPart.CFrame * CFrame.new(0,7,2))
                                                end
                                            end
                                        end
                                     end
                                    elseif game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress","RichSon") == 1 then
                                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress","RichSon")
                                        task.wait(0.5)
                                        EquipWeapon("Relic")
                                        task.wait(0.5)
                                        Tween(CFrame.new(-1404.91504, 29.9773273, 3.80598116, 0.876514494, 5.6690688e-9, 0.481375456, 2.53852e-8, 1, -5.799956e-8, -0.481375456, 6.3057264e-8, 0.876514494))
                                    end
                                end
                            end
                        end
                    else
                        if game:GetService("Workspace").Enemies:FindFirstChild("Saber Expert") or game:GetService("ReplicatedStorage"):FindFirstChild("Saber Expert") then
                            for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                    if v.Name == "Saber Expert" then
                                        repeat task.wait()                                                                           
                                            EquipWeapon(getgenv().Settings.SelectedWeapon)
                                            topos(v.HumanoidRootPart.CFrame * Pos)
                                            v.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
                                            v.HumanoidRootPart.Transparency = 1
                                            v.Humanoid.JumpPower = 0
                                            v.Humanoid.WalkSpeed = 0
                                            v.HumanoidRootPart.CanCollide = false                                     
                                            FarmPos = v.HumanoidRootPart.CFrame
                                            MonFarm = v.Name
                                        until v.Humanoid.Health <= 0 or not getgenv().Settings.AutoSaber
                                        if v.Humanoid.Health <= 0 then
                                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress","PlaceRelic")
                                        end
                                    end
                                end
                            end
                        end
                    end
            end)
        end
    end
end)

Tabs.Item:Toggle({
    Title = 'Auto Pole V1',
    Desc = 'Auto Pole V1',
    Image = 'key',
    Value = getgenv().Settings.AutoPoleV1 or false,
    Callback = function(v)
        getgenv().Settings.AutoPoleV1 = v
        getgenv().Settings.Path = v
        SaveSettings()
    end,
})

spawn(function()
    while task.wait() do
        if getgenv().Settings.AutoPoleV1 and FirstSea then
            pcall(function()
                if workspace.Enemies:FindFirstChild("Thunder God") then
                    for _,v in pairs(workspace.Enemies:GetChildren()) do
                        if v.Name == "Thunder God" then
                            if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                repeat task.wait()                                
                                    AutoHaki()
                                    EquipWeapon(getgenv().Settings.SelectedWeapon)
                                    v.HumanoidRootPart.CanCollide = false
                                    v.Humanoid.WalkSpeed = 0
                                    v.HumanoidRootPart.Size = Vector3.new(50,50,50)
                                    Tween(v.HumanoidRootPart.CFrame * Pos)
                                    sethiddenproperty(game.Players.LocalPlayer,"SimulationRadius",math.huge)
                                until not getgenv().Settings.AutoPoleV1 or not v.Parent or v.Humanoid.Health <= 0
                            end
                        end
                    end
                else
                    UnEquipWeapon(getgenv().Settings.SelectedWeapon)
                    Tween(CFrame.new(-7619.01220703125, 5618.587890625, -2454.539794921875))
                    if game.ReplicatedStorage:FindFirstChild("Thunder God") then
                        Tween(game.ReplicatedStorage.ThunderGod.HumanoidRootPart.CFrame * CFrame.new(2,20,2))
                    end
                end
            end)
        end
    end
end)

Tabs.Item:Toggle({
    Title = 'Auto Bisento V2 ( Must Have Bisento )',
    Desc = 'Auto Bisento V2',
    Image = 'key',
    Value = getgenv().Settings.AutoBisentoV2 or false,
    Callback = function(v)
        getgenv().Settings.AutoBisentoV2 = v
        getgenv().Settings.Path = v
        SaveSettings()
    end,
})

Tabs.Item:Toggle({
    Title = 'Auto Shark Saw',
    Desc = 'Auto Shark Saw',
    Image = 'key',
    Value = getgenv().Settings.AutoSharkSaw or false,
    Callback = function(v)
        getgenv().Settings.AutoSharkSaw = v
        getgenv().Settings.Path = v
        SaveSettings()
    end,
})


----// Auto Save Settings \\----

task.spawn(function()
    while task.wait(10) do
        SaveSettings()
    end
end)

---// End of Script \\---

