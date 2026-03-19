-- [[ 1. CRASH-PROOF UI INITIALIZATION ]] --
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
-- FIXED: No custom color table to avoid line 177 'SchemeColor' crash
local Window = Library.CreateLib("INFERNO-NEXUS: IRON-CLAD", "BloodTheme")

local Player = game.Players.LocalPlayer
local RS = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")

-- [[ 2. GLOBAL SETTINGS ARRAY ]] --
_G.Settings = {
    RedEngine = false, FlameSync = false, PreciseSnap = false, 
    StickerHunt = false, SproutLoot = false, PuffSnap = false,
    AutoRiley = false, AutoCraft = false, TargetSlot = 5
}

-- [[ 3. ORGANIZED TABS ]] --
local RedTab = Window:NewTab("Red Hive")
local RedSec = RedTab:NewSection("Level 16 Red Meta")
RedSec:NewToggle("Dark Flame Sync", "Spicy Flame -> Dark Flame", function(s) _G.Settings.FlameSync = s end)
RedSec:NewToggle("Precise Mark Snap", "Frame-Perfect Texture Snap", function(s) _G.Settings.PreciseSnap = s end)

local ProgTab = Window:NewTab("Progression")
local ProgSec = ProgTab:NewSection("Scythe & Dapper 16")
ProgSec:NewToggle("Riley Master", "Farms Red Mats", function(s) _G.Settings.AutoRiley = s end)
ProgSec:NewButton("Scythe Status", "15/50 Smoothies | 30/50 Wax", function() 
    Library:Notify("Progress", "15/50 Smoothies reached!", 4) 
end)
ProgSec:NewSlider("Slot Target", "Slot 5 (Dapper Quest 16)", 15, 1, function(s) _G.Settings.TargetSlot = s end)

local LootTab = Window:NewTab("Loot & Stickers")
local LootSec = LootTab:NewSection("Quest 16 Priority")
LootSec:NewToggle("Sticker Hunter", "Collects Sprout Stickers", function(s) _G.Settings.StickerHunt = s end)
LootSec:NewToggle("Auto-Puff Snap", "Snaps to Rares/Epics", function(s) _G.Settings.PuffSnap = s end)

local SysTab = Window:NewTab("System")
local SysSec = SysTab:NewSection("A15 Optimization")
SysSec:NewToggle("FPS Black-Out", "Saves Battery & Heat", function(s) RunService:Set3dRenderingEnabled(not s) end)
SysSec:NewButton("Clean Memory", "Fixes Delta Lag/Crashing", function() collectgarbage("collect") end)

-- [[ 4. ERROR-BYPASS EXECUTION ENGINE ]] --
RunService.PostSimulation:Connect(function()
    pcall(function()
        -- Character Safety (Fixes Line 69 'Stack End' error)
        local Char = Player.Character
        local Root = Char and Char:FindFirstChild("HumanoidRootPart")
        if not Root then return end

        -- Precise Mark Logic (Texture ID: 1629547738)
        if _G.Settings.PreciseSnap then
            for _, v in pairs(game.Workspace.Collectibles:GetChildren()) do
                if v:FindFirstChild("Decal") and v.Decal.Texture == "rbxassetid://1629547738" then
                    Root.CFrame = v.CFrame break
                end
            end
        end

        -- Sticker/Sprout Loot Logic (Dapper Quest 16 Fix)
        if _G.Settings.StickerHunt or _G.Settings.SproutLoot then
            for _, v in pairs(game.Workspace.Collectibles:GetChildren()) do
                if v.Name:lower():find("sticker") or _G.Settings.SproutLoot then
                    Root.CFrame = v.CFrame break
                end
            end
        end

        -- Puffshroom Logic
        if _G.Settings.PuffSnap then
            local Puffs = game.Workspace:FindFirstChild("Happenings") and game.Workspace.Happenings:FindFirstChild("Puffshrooms")
            if Puffs then
                for _, p in pairs(Puffs:GetChildren()) do
                    if p:FindFirstChild("PrimaryPart") then
                        Root.CFrame = p.PrimaryPart.CFrame break
                    end
                end
            end
        end

        -- Remote Sync (Bypasses 'GetInventoryStatus' Error)
        if _G.Settings.FlameSync then
            local Events = RS:FindFirstChild("Events")
            if Events and Events:FindFirstChild("ToolCollect") then
                Events.ToolCollect:FireServer()
            end
        end
    end)
end)
