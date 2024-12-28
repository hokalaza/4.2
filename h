
local DrRayLibrary = loadstring(game:HttpGet("https://raw.githubusercontent.com/AZYsGithub/DrRay-UI-Library/main/DrRay.lua"))()
local window = DrRayLibrary:Load("doi truong source", "Default")
local tab = DrRayLibrary.newTab("main", "ImageIdHere")
tab.newInput("nhảy cao", "điền số  (10 là bình thường)", function(text)
    local h = game.Players.LocalPlayer.Character.Humanoid
h.UseJumpPower = false
h.JumpHeight = (text)
end)
tab.newButton("dự đoán bóng", "vì ăn cắp source nên đéo biết tắt", function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/hokalaza/4.2/refs/heads/main/b"))()
end)
tab.newInput("chạy nhanh??", "Ko thể chạy mượt (reset nv để trở lại bth)", function(text)
    while true do wait()
game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = (text)
end
end)
tab.newInput("tilt", "2000 la auto mid, 3000 la bth", function(text)
game.Players.LocalPlayer.Character.HumanoidRootPart.Tilt.P = (text)
end)
tab.newButton("no lfs", "Ko lỗi vạch (serve)", function()
game.workspace.ServeLF.Size = Vector3.new(0, 01, 01)
end)
tab.newButton("no lfs", "Ko lỗi vạch (br)", function()
game.workspace.BackrowLF.Size = Vector3.new(0, 01, 01)
end)
tab.newToggle("Toggle", "Toggle! (prints the state)", true, function(toggleState)
    if toggleState then
        game:GetService("MaterialService").Use2022Materials = true   
 else
        game:GetService("MaterialService").Use2022Materials = false
    end
end)
