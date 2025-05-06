-- Ball Landing Prediction Script (no UI)

repeat wait() until workspace:FindFirstChild("Ball")

local Workspace  = game:GetService("Workspace")
local RunService = game:GetService("RunService")

-- Original physics function for landing prediction
local function PHYSICS_STUFF(velocity, position)
    local acceleration = -workspace.Gravity
    local timeToLand = (-velocity.y - math.sqrt(
        velocity.y * velocity.y
        - 4 * 0.5 * acceleration * position.y
    )) / (2 * 0.5 * acceleration)
    local horizontalVelocity = Vector3.new(velocity.x, 0, velocity.z)
    return position + horizontalVelocity * timeToLand + Vector3.new(0, -position.y, 0)
end

-- Table mapping each Ball model to its Marker part
local markers = {}

-- Create a white neon Marker for a given Ball model
local function setupMarker(ballModel)
    if markers[ballModel] then return end
    local m = Instance.new("Part")
    m.Name         = "Marker"
    m.Size         = Vector3.new(2, 2, 2)
    m.Shape        = Enum.PartType.Ball
    m.BrickColor   = BrickColor.new("White")
    m.Material     = Enum.Material.Neon
    m.CanCollide   = false
    m.Anchored     = true
    m.Transparency = 0.5
    m.Parent       = Workspace
    markers[ballModel] = m
end

-- Destroy and remove the Marker for a Ball model
local function cleanupMarker(ballModel)
    local m = markers[ballModel]
    if m then
        m:Destroy()
        markers[ballModel] = nil
    end
end

-- Initial setup: create markers for existing Ball models
for _, v in ipairs(Workspace:GetChildren()) do
    if v:IsA("Model") and v.Name == "Ball" then
        setupMarker(v)
    end
end

-- Listen for new Ball models
Workspace.ChildAdded:Connect(function(v)
    if v:IsA("Model") and v.Name == "Ball" then
        setupMarker(v)
    end
end)

-- Listen for Ball models being removed
Workspace.ChildRemoved:Connect(function(v)
    if v:IsA("Model") and v.Name == "Ball" then
        cleanupMarker(v)
    end
end)

-- Update each Marker’s position every frame
RunService:BindToRenderStep("VisualizeLandingPositions", Enum.RenderPriority.Camera.Value, function()
    for ballModel, marker in pairs(markers) do
        local part = ballModel:FindFirstChild("BallPart")
        if part then
            -- Use either a Velocity Value object or the part’s Velocity
            local velVal = ballModel:FindFirstChild("Velocity")
            local vel = (velVal and velVal.Value) or part.Velocity
            local landPos = PHYSICS_STUFF(vel, part.Position)
            marker.CFrame = CFrame.new(landPos)
        else
            cleanupMarker(ballModel)
        end
    end
end)
