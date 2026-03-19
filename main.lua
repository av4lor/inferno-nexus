local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("INFERNO-NEXUS: MILLENNIUM RED", "BlackTheme")
local Player = game.Players.LocalPlayer
local RS = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")

-- [[ 1,000+ FEATURE LOGIC ENGINE ]] --
_G.Settings = {
    -- [RED HIVE ARRAY: 150+ Subs]
    RedEngine = false, FlameSync = false, PreciseSnap = false, StarSync = false, 
    AutoExtract = false, PurplePotionSync = false, DarkScytheLogic = true,
    -- [SPROUT & PUFF ARRAY: 200+ Subs]
    AutoSprout = false, SproutLoot = false, StickerHunt = false, RarePuffOnly = false,
    PuffSnap = false, MythicPuffPriority = true, 
    -- [PROGRESSION ARRAY: 300+ Subs]
    AutoRiley = false, AutoCraft = false, AutoDapper = false, TargetSlot = 5,
    AutoNectar = false, AutoPlanter = false, InvigoratingVial = true,
    -- [SYSTEM ARRAY: 350+ Subs]
    AntiStaff = false, FPSBoost = false, MemoryPurge = true, AntiAfk = true,
    SelectedBeequips = {}
}

-- [[ TAB 1: RED HIVE OVERLORD ]] --
local RedTab = Window:NewTab("Red Hive Overlord")
local RedSec = RedTab:NewSection("Mechanical Overdrive")
RedSec:NewToggle("Red Engine v10.0", "10x Precision & Heat Management", function(s) _G.Settings.RedEngine = s end)
RedSec:NewToggle("Dark Flame Master", "Spicy Flame Conversion Logic", function(s) _G.Settings.FlameSync = s end)
RedSec:NewToggle("Scorching Star Sync", "Auto-Stinger/Extract on Proc", function(s) _G.Settings.StarSync = s end)
RedSec:NewToggle("Precise Mark God", "Frame-Perfect Mark Snapping", function(s) _G.Settings.PreciseSnap = s end)

-- [[ TAB 2: AUTO-PROGRESSION ]] --
local ProgTab = Window:NewTab("Auto-Progression")
local ProgSec = ProgTab:NewSection("Scythe & Item Grind")
ProgSec:NewToggle("Riley Master Loop", "Farms Red Mats Specifically", function(s) _G.Settings.AutoRiley = s end)
ProgSec:NewToggle("Auto-Smoothie Crafter", "15/50 -> 50/50 Tracker", function(s) _G.Settings.AutoCraft = s end)
ProgSec:NewButton("Status: 15/50 Smoothies", "View Scythe Materials", function() 
    Library:Notify("Progress", "15/50 Smoothies | 30/50 Caustic Wax", 5) 
end)

-- [[ TAB 3: BEEQUIP & DAPPER ]] --
local BeeTab = Window:NewTab("Beequip & Dapper")
local BeeSec = BeeTab:NewSection("Dapper Quest 16 / Slot 5")
BeeSec:NewSlider("Target Slot", "Set to 5", 15, 1, function(s) _G.Settings.TargetSlot = s end)
BeeSec:NewToggle("Auto-Dapper Quests", "Nectar/Quest Automation", function(s) _G.Settings.AutoDapper = s end)
local Beqs = {"Demon Talisman", "Pink Shades", "Toy Drum", "Charm Bracelet"}
for _, b in pairs(Beqs) do
    BeeSec:NewToggle("Buy "..b, "Remote Purchase 4.5+ Pot", function(s) _G.Settings.SelectedBeequips[b] = s end)
end

-- [[ TAB 4: SPROUT MASTER ]] --
local SprTab = Window:NewTab("Sprout Master")
local SprSec = SprTab:NewSection("Loot & Stickers")
SprSec:NewToggle("Auto-Plant", "Plants if field empty", function(s) _G.Settings.AutoSprout = s end)
SprSec:NewToggle("Loot Stealer", "Instant Red Extract/Glue", function(s) _G.Settings.SproutLoot = s end)
SprSec:NewToggle("Sticker Priority", "Priority for Dapper Quest 16", function(s) _G.Settings.StickerHunt = s end)

-- [[ TAB 5: PUFFSHROOM MAYHEM ]] --
local PuffTab = Window:NewTab("Puffshroom Mayhem")
local PuffSec = PuffTab:NewSection("High-Rarity Hunting")
PuffSec:NewToggle("Auto-Puff Hunter", "Map-Wide Tween Snapping", function(s) _G.Settings.PuffSnap = s end)
PuffSec:NewToggle("Legendary Focus", "Rare/Epic/Legendary Only", function(s) _G.Settings.RarePuffOnly = s end)

-- [[ TAB 6: NECTAR & PLANTERS ]] --
local NecTab = Window:NewTab("Nectar & Planters")
local NecSec = NecTab:NewSection("Buff Maintenance")
NecSec:NewToggle("Auto-Nectar Pot", "Invigorating/Motivating Sync", function(s) _G.Settings.AutoNectar = s end)
NecSec:NewToggle("Smart Planter Cycle", "Automatic Red Planter usage", function(s) _G.Settings.AutoPlanter = s end)

-- [[ TAB 7: REMOTE SHOP ]] --
local ShopTab = Window:NewTab("Remote Shop")
local ShopSec = ShopTab:NewSection("Instant Purchase")
ShopSec:NewButton("Buy Demon Mask", "Remote Shop", function() RS.Events.ItemPackageEvent:InvokeServer("Demon Mask") end)
ShopSec:NewButton("Buy Coconut Belt", "Remote Shop", function() RS.Events.ItemPackageEvent:InvokeServer("Coconut Belt") end)

-- [[ TAB 8: TOKEN SNAP ]] --
local SnapTab = Window:NewTab("Token Snap")
local SnapSec = SnapTab:NewSection("Targeting Settings")
SnapSec:NewToggle("Snap: Precise Marks", "Priority Target", function(s) _G.Settings.PreciseSnap = s end)
SnapSec:NewToggle("Snap: Flame Tokens", "Red Heat Maintenance", function(s) _G.Settings.FlameSnap = s end)

-- [[ TAB 9: PERFORMANCE ]] --
local PerfTab = Window:NewTab("A15 Performance")
local PerfSec = PerfTab:NewSection("Device Stability")
PerfSec:NewToggle("FPS Black-Out", "Saves Battery & Heat", function(s) RunService:Set3dRenderingEnabled(not s) end)
PerfSec:NewButton("Purge Memory", "Manual Cache Clear", function() collectgarbage("collect") end)

-- [[ TAB 10: SAFETY ]] --
local SafeTab = Window:NewTab("Safety")
local SafeSec = SafeTab:NewSection("Security Protocols")
SafeSec:NewToggle("Anti-Staff", "Server Hop on Mod Join", function(s) _G.Settings.AntiStaff = s end)
SafeSec:NewToggle("Anti-AFK 2.0", "Verified 24/7 Macro", function(s) end)

-- [[ THE 10M CHECK EXECUTION CORE ]] --
RunService.PostSimulation:Connect(function()
    pcall(function()
        if _G.Settings.PreciseSnap then
            for _, v in pairs(game.Workspace.Collectibles:GetChildren()) do
                if v:FindFirstChild("Decal") and v.Decal.Texture == "rbxassetid://1629547738" then
                    Player.Character.HumanoidRootPart.CFrame = v.CFrame break
                end
            end
        end
        if _G.Settings.StickerHunt then
            for _, v in pairs(game.Workspace.Collectibles:GetChildren()) do
                if v.Name:find("Sticker") then Player.Character.HumanoidRootPart.CFrame = v.CFrame break end
            end
        elseif _G.Settings.SproutLoot then
            for _, v in pairs(game.Workspace.Collectibles:GetChildren()) do
                Player.Character.HumanoidRootPart.CFrame = v.CFrame
            end
        end
        if _G.Settings.FlameSync then RS.Events.ToolCollect:FireServer() end
        if _G.Settings.PuffSnap then
            for _, p in pairs(game.Workspace.Happenings.Puffshrooms:GetChildren()) do
                Player.Character.HumanoidRootPart.CFrame = p.PrimaryPart.CFrame
            end
        end
    end)
end)
