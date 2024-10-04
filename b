-- Load the DrRay library from the GitHub repository Library
local DrRayLibrary = loadstring(game:HttpGet("https://raw.githubusercontent.com/AZYsGithub/DrRay-UI-Library/main/DrRay.lua"))()
-- Create a new window and set its title and theme
local window = DrRayLibrary:Load("4.2 by hokalaza", "Default")
-- Create the first tab with an image ID
local tab1 = DrRayLibrary.newTab("Main", "ImageIdHere")
tab1.newLabel("Hello!")
tab1.newButton("predict ball", "An marker that predict ball", function()
    repeat wait() until workspace:FindFirstChild("Ball")

-- Constants
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

-- Marker
local Marker = Instance.new("Part")
Marker.Name = "Marker"
Marker.Size = Vector3.new(2, 2, 2)
Marker.Shape = Enum.PartType.Ball
Marker.BrickColor = BrickColor.new("Bright violet")
Marker.CanCollide = false
Marker.Anchored = true
Marker.Parent = workspace
Marker.Transparency = 1
Marker.Material = Enum.Material.Neon

-- Physics
local function PHYSICS_STUFF(velocity, position)
    local acceleration = -workspace.Gravity
    local timeToLand = (-velocity.y - math.sqrt(velocity.y * velocity.y - 4 * 0.5 * acceleration * position.y)) / (2 * 0.5 * acceleration)
    local horizontalVelocity = Vector3.new(velocity.x, 0, velocity.z)
    local landingPosition = position + horizontalVelocity * timeToLand + Vector3.new(0, -position.y, 0)
    return landingPosition
end

-- Construct
RunService:BindToRenderStep("VisualizeLandingPosition", Enum.RenderPriority.Camera.Value, function()
    Marker.Transparency = 0.5
    for _, ballModel in ipairs(workspace:GetChildren()) do
        if ballModel:IsA("Model") and ballModel.Name == "Ball" then
            local ball = ballModel:FindFirstChild("BallPart")
            if ball then
                local initialVelocity = ballModel.Velocity
                local landingPosition = PHYSICS_STUFF(initialVelocity.Value, ball.Position)
                Marker.CFrame = CFrame.new(landingPosition)
            end
        end
    end
end)
end)
tab1.newButton("inf stamina", "Once you reset your character,you will have to click on this again.", function()
local aux = loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/Upbolt/Hydroxide/revision/ohaux.lua"))()
local player = game.Players.LocalPlayer.Name
local scriptPath = workspace[player].CharacterScript
local closureName = "handleStaminaRegen"
local upvalueIndex = 2
local closureConstants = {
	[1] = "Velocity",
	[2] = "Magnitude",
	[3] = 16.5,
	[4] = "Stamina",
	[5] = "tick",
	[7] = 1.5
}

local closure = aux.searchClosure(scriptPath, closureName, upvalueIndex, closureConstants)
local value = math.huge
local elementIndex = "Stamina"



debug.getupvalue(closure, upvalueIndex)[elementIndex] = value
end)
tab1.newButton("no serve line fault", "it works on pickup and ranked.", function()
game.Workspace.ServeLF.Size = Vector3.new(0.001, 1, 0.001)
end)
tab1.newButton("no backrow line fault", "same as no serve line fault but you can jump on front as backrower", function()
workspace.BackrowLF.Size = Vector3.new(0, 0, 0)
end)
tab1.newInput("Jumpower", "Input your number", function(text)
    local Player = game.Players.LocalPlayer
local Character = Player.Character or Player.Character:Wait()
local Humanoid = Character.Humanoid
Humanoid.JumpHeight = (text) -- so bat ki
Humanoid.UseJumpPower = false
end)
tab1.newInput("Speed changer", " once you wanted set to default, just reset", function(text)
while true do
wait()
game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = (text)
end
end)
tab1.newButton("reset jump power", "reset jump power to default", function()
local Player = game.Players.LocalPlayer
local Character = Player.Character or Player.Character:Wait()
local Humanoid = Character.Humanoid
Humanoid.UseJumpPower = true
end)
tab1.newButton("2022 Material", "On", function()
game:GetService("MaterialService").Use2022Materials = true
end)
tab1.newButton("2022 Material", "Off", function()
game:GetService("MaterialService").Use2022Materials = false
end)
