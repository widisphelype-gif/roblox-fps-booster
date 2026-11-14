-- Roblox FPS Booster
-- Instale este LocalScript em StarterPlayer > StarterPlayerScripts.
-- Deixe Config.lua e Optimizer.lua como ModuleScripts irmãos.

local Players = game:GetService("Players")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local Config = require(script.Parent:WaitForChild("Config"))
local Optimizer = require(script.Parent:WaitForChild("Optimizer"))

local function createToggle()
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "RobloxFPSBoosterUI"
    screenGui.ResetOnSpawn = false
    screenGui.IgnoreGuiInset = true
    screenGui.Parent = playerGui

    local button = Instance.new("TextButton")
    button.Name = "ToggleButton"
    button.AnchorPoint = Vector2.new(1, 0)
    button.Position = UDim2.new(1, -14, 0, 48)
    button.Size = UDim2.fromOffset(142, 42)
    button.BackgroundColor3 = Color3.fromRGB(25, 28, 35)
    button.TextColor3 = Color3.fromRGB(255, 255, 255)
    button.TextSize = 14
    button.Font = Enum.Font.GothamBold
    button.AutoButtonColor = true
    button.Text = Config.ButtonText or "FPS BOOST"
    button.Parent = screenGui

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 10)
    corner.Parent = button

    local stroke = Instance.new("UIStroke")
    stroke.Color = Color3.fromRGB(75, 170, 255)
    stroke.Thickness = 1.5
    stroke.Parent = button

    local function updateButton()
        if Optimizer.IsApplied() then
            button.Text = "FPS BOOST: ON"
            button.BackgroundColor3 = Color3.fromRGB(20, 105, 65)
        else
            button.Text = "FPS BOOST: OFF"
            button.BackgroundColor3 = Color3.fromRGB(25, 28, 35)
        end
    end

    button.Activated:Connect(function()
        if Optimizer.IsApplied() then
            Optimizer.Restore()
        else
            Optimizer.Apply(Config)
        end
        updateButton()
    end)

    updateButton()
end

if Config.AutoApply then
    Optimizer.Apply(Config)
end

createToggle()

-- A interface é local e pode ser removida sem afetar a experiência.
