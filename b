-- Load the DrRay library from the GitHub repository Library
local DrRayLibrary = loadstring(game:HttpGet("https://raw.githubusercontent.com/AZYsGithub/DrRay-UI-Library/main/DrRay.lua"))()
-- Create a new window and set its title and theme
local window = DrRayLibrary:Load("4.2 by hokalaza", "Default")
-- Create the first tab with an image ID
local tab1 = DrRayLibrary.newTab("This script no longer works", "ImageIdHere")
tab1.newLabel("Coming back with powerful later, please wait us")
