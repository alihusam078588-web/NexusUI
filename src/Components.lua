local Components = {}
local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")

local Root = {}
Root.__index = Root

function Root.new(config, lifecycle)
    return setmetatable({ config = config, lifecycle = lifecycle, gui = nil }, Root)
end

function Root:mount()
    local gui = Instance.new("ScreenGui")
    gui.Name = "NexusUI"
    gui.ResetOnSpawn = false
    gui.Parent = Players.LocalPlayer:WaitForChild("PlayerGui")
    self.gui = self.lifecycle:trackInstance(gui)
    return gui
end

function Root:panel(properties)
    local panel = Instance.new("Frame")
    panel.BackgroundColor3 = properties.color or Color3.fromRGB(18, 20, 31)
    panel.BorderSizePixel = 0
    panel.Size = properties.size or UDim2.fromScale(0.4, 0.3)
    panel.Parent = self.gui
    self.lifecycle:trackInstance(panel)
    return panel
end

Components.Root = Root
Components.TweenService = TweenService
return Components