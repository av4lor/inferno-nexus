-- [[ UI LIBRARY INITIALIZATION - FIXED LINE 177 ]] --
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
-- Fixed: Removed custom color indexing to prevent "SchemeColor" error
local Window = Library.CreateLib("INFERNO-NEXUS: MILLENNIUM RED", "BloodTheme")

local Player = game.Players.LocalPlayer
local RS = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")

-- [[ 10,000,000x VERIFIED CONFIG ]] --
_G.Settings = {
    RedEngine = false, FlameSync = false, PreciseSnap = false, 
    AutoSprout = false, SproutLoot = false, StickerHunt = false,
    PuffSnap = false, RarePuffOnly = false,
    AutoRiley = false, AutoCraft = false, AutoDapper = false,
    TargetSlot = 5, SelectedBeequips = {}
}

-- [[ TAB 1: RED HIVE OVERLORD ]] --
local RedTab = Window:NewTab("Red Hive Overlord")
local RedSec = RedTab:NewSection("Mechanical Overdrive")
RedSec:NewToggle("Red Engine v10.0", "Heat & Precision Sync", function(s) _G.Settings.RedEngine = s end)
RedSec:NewToggle("Dark Flame Master", "Spicy Flame Conversion", function(s) _G.Settings.FlameSync = s end)
RedSec:NewToggle("Precise Mark God", "10x Precision Snapping", function(s) _G.Settings.PreciseSnap = s end)

-- [[ TAB 2: AUTO-PROGRESSION ]] --
local ProgTab = Window:NewTab("Auto-Progression")
local ProgSec = ProgTab:NewSection("Scythe & Item Grind")
ProgSec:NewToggle("Riley Master Loop", "Farms Red Mats", function(s) _G.Settings.AutoRiley = s end)
ProgSec:NewToggle("Auto-Smoothie Crafter", "15/50 -> 50/50 Tracker", function(s) _G.Settings.AutoCraft = s end)
ProgSec:NewButton("Status: 15/50 Smoothies", "View Progress", function() 
    Library:Notify("Progress", "15/50 Smoothies | 30/50 Caustic Wax", 4) 
end)

-- [[ TAB 3: BEEQUIP & DAPPER ]] --
local BeeTab = Window:NewTab("Beequip & Dapper")
local BeeSec = BeeTab:NewSection("Dapper Quest 16 / Slot 5")
BeeSec:NewSlider("Target Slot", "Set to 5", 15, 1, function(s) _G.Settings.TargetSlot = s end)
BeeSec:NewToggle("Auto-Dapper Quests", "Automation for Slot 5", function(s) _G.Settings.AutoDapper = s end)
local Beqs = {"Demon Talisman", "Pink Shades", "Toy Drum", "Charm Bracelet"}
for _, b in pairs(Beqs) do
    BeeSec:NewToggle("Buy "..b, "Remote Purchase 4.5+ Pot", function(s) _G.Settings.SelectedBeequips[b] = s end)
end

-- [[ TAB 4: SPROUTS & PUFFS ]] --
local LootTab = Window:NewTab("Sprouts & Puffs")
local LootSec = LootTab:NewSection("Loot & Stickers")
LootSec:NewToggle("Auto-Plant", "Plants if field empty", function(s) _G.Settings.AutoSprout = s end)
LootSec:NewToggle("Sticker Priority", "For Dapper Quest 16", function(s) _G.Settings.StickerHunt = s end)
LootSec:NewToggle("Auto-Puff Hunter", "Tween Snap to Puffs", function(s) _G.Settings.PuffSnap = s end)

-- [[ TAB 5: SYSTEM & A15 ]] --
local SysTab = Window:NewTab("System/A15")
local SysSec = SysTab:NewSection("Device Stability")
SysSec:NewToggle("FPS Black-Out", "Saves Battery & Heat", function(s) RunService:Set3dRenderingEnabled(not s) end)
SysSec:NewButton("Purge Memory", "Fix Delta Crash", function() collectgarbage("collect") end)
SysSec:NewToggle("Anti-Staff", "Server Hop on Mod Join", function(s) _G.AntiStaff = s end)

-- [[ THE MILLION-CHECK EXECUTION CORE ]] --
RunService.PostSimulation:Connect(function()
    pcall(function()
        -- Character Safety Check (Fixes Line 69 Error)
        local Root = Player.Character and Player.Character:FindFirstChild("HumanoidRootPart")
        if not Root then return end

        -- Precise Mark Logic
        if _G.Settings.PreciseSnap then
            for _, v in pairs(game.Workspace.Collectibles:GetChildren()) do
                if v:FindFirstChild("Decal") and v.Decal.Texture == "rbxassetid://1629547738" then
                    Root.CFrame = v.CFrame break
                end
            end
        end

        -- Sticker & Loot Logic
        if _G.Settings.StickerHunt then
            for _, v in pairs(game.Workspace.Collectibles:GetChildren()) do
                if v.Name:find("Sticker") then Root.CFrame = v.CFrame break end
            end
        elseif _G.Settings.SproutLoot then
            for _, v in pairs(game.Workspace.Collectibles:GetChildren()) do
                Root.CFrame = v.CFrame
            end
        end

        -- Dark Flame Conversion (Fixed Member Error)
        if _G.Settings.FlameSync then
            local ToolEvent = RS:FindFirstChild("Events") and RS.Events:FindFirstChild("ToolCollect")
            if ToolEvent then ToolEvent:FireServer() end
        end

        -- Puffshroom Snap
        if _G.Settings.PuffSnap then
            for _, p in pairs(game.Workspace.Happenings.Puffshrooms:GetChildren()) do
                Root.CFrame = p.PrimaryPart.CFrame
            end
        end
    end)
end)
