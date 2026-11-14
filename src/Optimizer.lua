-- Roblox FPS Booster - Otimizador local
-- Todas as alterações são feitas pelo cliente e não alteram o servidor.
-- As propriedades originais são guardadas para permitir restauração.

local Workspace = game:GetService("Workspace")
local Lighting = game:GetService("Lighting")

local Optimizer = {}

local originalValues = {}
local connections = {}
local isApplied = false
local activeConfig = nil

local function rememberAndSet(instance, property, value)
    local ok, currentValue = pcall(function()
        return instance[property]
    end)

    if not ok then
        return
    end

    originalValues[instance] = originalValues[instance] or {}

    if originalValues[instance][property] == nil then
        originalValues[instance][property] = currentValue
    end

    pcall(function()
        instance[property] = value
    end)
end

local function optimizeInstance(instance, config)
    if not instance or not instance.Parent then
        return
    end

    if config.DisableParticles and instance:IsA("ParticleEmitter") then
        rememberAndSet(instance, "Enabled", false)
    end

    if config.DisableTrailsAndBeams
        and (instance:IsA("Trail") or instance:IsA("Beam")) then
        rememberAndSet(instance, "Enabled", false)
    end

    if config.DisableFireSmokeAndSparkles
        and (instance:IsA("Fire")
            or instance:IsA("Smoke")
            or instance:IsA("Sparkles")) then
        rememberAndSet(instance, "Enabled", false)
    end

    if config.DisablePostProcessing and instance:IsA("PostEffect") then
        rememberAndSet(instance, "Enabled", false)
    end

    if config.DisableHighlights and instance:IsA("Highlight") then
        rememberAndSet(instance, "Enabled", false)
    end

    if config.DisablePartShadows and instance:IsA("BasePart") then
        rememberAndSet(instance, "CastShadow", false)
    end
end

local function optimizeContainer(container, config)
    for _, instance in ipairs(container:GetDescendants()) do
        optimizeInstance(instance, config)
    end
end

function Optimizer.Apply(config)
    if isApplied then
        return
    end

    activeConfig = config or {}
    isApplied = true

    optimizeContainer(Workspace, activeConfig)
    optimizeContainer(Lighting, activeConfig)

    if activeConfig.OptimizeNewDescendants then
        table.insert(connections, Workspace.DescendantAdded:Connect(function(instance)
            if isApplied then
                optimizeInstance(instance, activeConfig)
            end
        end))

        table.insert(connections, Lighting.DescendantAdded:Connect(function(instance)
            if isApplied then
                optimizeInstance(instance, activeConfig)
            end
        end))
    end
end

function Optimizer.Restore()
    if not isApplied then
        return
    end

    isApplied = false

    for _, connection in ipairs(connections) do
        connection:Disconnect()
    end
    table.clear(connections)

    for instance, properties in pairs(originalValues) do
        if instance and instance.Parent then
            for property, value in pairs(properties) do
                pcall(function()
                    instance[property] = value
                end)
            end
        end
    end

    table.clear(originalValues)
    activeConfig = nil
end

function Optimizer.IsApplied()
    return isApplied
end

return Optimizer
