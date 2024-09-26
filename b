-- Load the DrRay library from the GitHub repository Library
local DrRayLibrary = loadstring(game:HttpGet("https://raw.githubusercontent.com/AZYsGithub/DrRay-UI-Library/main/DrRay.lua"))()
-- Create a new window and set its title and theme
local window = DrRayLibrary:Load("4.2 by hokalaza", "Default")
-- Create the first tab with an image ID
local tab1 = DrRayLibrary.newTab("Main", "ImageIdHere")
tab1.newLabel("Hello!")
tab1.newButton("predict ball", "An marker that predict ball", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/nani201992/4.2/main/h"))()
end)
tab1.newButton("inf stamina", "Once you reset your character,you will have to click on this again.", function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/nani201992/4.2/main/inf%20stamina"))()
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
tab1.newInput("toc do", "la vong` lap nen bi khung. lai mot ti", function(text)
local gmt = getrawmetatable(game)
setreadonly(gmt, false)
local oldindex = gmt.__index
gmt.__index = newcclosure(function(self,k)
if k == "Walkspeed" then
return 20
end
return oldindex(self,k)
end)
while true do
wait(0.00000001)
game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = (text)
end
end)
tab1.newButton("reset jump power", "reset jump power to default", function()
local Player = game.Players.LocalPlayer
local Character = Player.Character or Player.Character:Wait()
local Humanoid = Character.Humanoid
Humanoid.UseJumpPower = true
end)
