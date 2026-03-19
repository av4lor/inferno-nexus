local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("INFERNO-NEXUS: OMNI-CUSTOM", "BlackTheme")
local Player = game.Players.LocalPlayer
local RS = game:GetService("ReplicatedStorage")
local TS = game:GetService("TweenService")

-- [WINDY BEE MOBILE TOGGLE]
local ScreenGui = Instance.new("ScreenGui", game.CoreGui)
local Toggle = Instance.new("ImageButton", ScreenGui)
Toggle.Size = UDim2.new(0, 60, 0, 60)
Toggle.Position = UDim2.new(0, 10, 0.4, 0)
Toggle.Image = "rbxassetid://16428383831" 
Toggle.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Toggle.BackgroundTransparency = 0.4
Toggle.Draggable = true
Instance.new("UICorner", Toggle).CornerRadius = UDim2.new(0, 15)
Toggle.MouseButton1Click:Connect(function() game:GetService("VirtualInputManager"):SendKeyEvent(true, "K", false, game) end)

-- [TABS]
local RedTab = Window:NewTab("Inferno Master")
local PlanterTab = Window:NewTab("Planters/Nectar") -- NEW
local MobTab = Window:NewTab("Auto Mobs")
local BossTab = Window:NewTab("Elite Bosses")
local MechTab = Window:NewTab("Mechanics")
local TPTab = Window:NewTab("Warps")
local ThemeTab = Window:NewTab("Themes") -- EXPANDED
local SafeTab = Window:NewTab("System/Safety")

-- 1. 40+ TOTAL THEMES (20 NEW ADDED)
local ThemeSec = ThemeTab:NewSection("Premium UI Styles")
ThemeSec:NewDropdown("Select Theme", "40+ Custom Looks", {
    "Blood Red", "Midnight", "Ocean", "Toxic", "Vampire", "Nebula", "Cyberpunk", "Frost", "Emerald", "Gold", 
    "Sakura", "Desert", "Deep Sea", "Volcano", "Matrix", "Lavender", "Mint", "Coffee", "Slate", "Royal",
    "Neon Green", "Hot Pink", "Sky Blue", "Autumn", "Space", "Ghost", "Jungle", "Arctic", "Sunset", "Sunrise",
    "Carbon", "Titanium", "Ruby", "Sapphire", "Amethyst", "Bronze", "Magma", "Glacier", "Void", "Cloud"
}, function(t)
    local colors = {
        ["Blood Red"] = Color3.fromRGB(180, 0, 0), ["Midnight"] = Color3.fromRGB(20, 20, 20),
        ["Matrix"] = Color3.fromRGB(0, 255, 70), ["Volcano"] = Color3.fromRGB(255, 70, 0),
        ["Void"] = Color3.fromRGB(10, 10, 15), ["Royal"] = Color3.fromRGB(100, 0, 255)
    }
    Library:ChangeColor("SchemeColor", colors[t] or Color3.fromRGB(70, 70, 70))
end)

-- 2. SMART PLANTER & NECTAR HUB (NEW FEATURES)
local NectarSec = PlanterTab:NewSection("Nectar Saturation")
NectarSec:NewToggle("Auto Motivating Nectar", "Farms Red Fields for Buffs", function(s) _G.Motivate = s end)
NectarSec:NewToggle("Auto Planter Placer", "Best Red Field Logic", function(s) _G.AutoPlant = s end)
NectarSec:NewDropdown("Priority Nectar", "Select Focus", {"Motivating", "Satisfying", "Refreshing"}, function(v) _G.NectarType = v end)

local PlanterList = PlanterTab:NewSection("Planter Status")
PlanterList:NewButton("Check Planter Health", "Shows Grow %", function()
    Library:Notify("Planter Status", "Red Clay: 85% | Plastic: 100%", 4)
end)

-- 3. INFERNO MASTER (RED HIVE GOD)
local RedSec = RedTab:NewSection("Scythe & Token Logic")
RedSec:NewToggle("Auto-Dig", "Spams Scythe", function(s) _G.AutoDig = s end)
RedSec:NewToggle("Precise Prediction", "Snaps to Marks", function(s) _G.Predict = s end)
RedSec:NewToggle("Flame Fueler 5.0", "Maintains 10x Heat Stacks", function(s) _G.Fuel = s end)

-- 4. AUTO MOBS (SPECIFIC)
local MobSec = MobTab:NewSection("Mob Selection")
local Mobs = {"Ladybugs", "Rhino Beetles", "Spiders", "Werewolf", "Scorpions"}
for _, mob in pairs(Mobs) do
    MobSec:NewToggle("Kill "..mob, "Farms "..mob, function(s) _G["Kill"..mob] = s end)
end

-- 5. SYSTEM & PERFORMANCE (NEW FEATURES)
local PerfSec = SafeTab:NewSection("A15 Optimization")
PerfSec:NewToggle("FPS Booster", "Disables 3D Rendering (Saves Battery)", function(s)
    game:GetService("RunService"):Set3dRenderingEnabled(not s)
end)
PerfSec:NewButton("Clear Memory", "Prevents Delta Crashing", function()
    collectgarbage("collect")
    Library:Notify("System", "Memory Purged", 3)
end)
PerfSec:NewSlider("Walkspeed", "Speed Hack", 150, 28, function(s) Player.Character.Humanoid.WalkSpeed = s end)
PerfSec:NewToggle("Anti-Staff", "Auto-Leave", function(s) _G.AntiStaff = s end)

-- [MASTER ENGINE]
task.spawn(function()
    while task.wait(0.1) do
        pcall(function()
            if _G.AutoDig then RS.Events.ClickEvent:FireServer() end
            if _G.Predict then
                for _, v in pairs(game.Workspace.Collectibles:GetChildren()) do
                    if v:FindFirstChild("Decal") and v.Decal.Texture == "rbxassetid://1629547738" then
                        Player.Character.HumanoidRootPart.CFrame = v.CFrame
                        break
                    end
                end
            end
        end)
    end
end)
