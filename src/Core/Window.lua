local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local Tab = require(script.Parent.Tab)
local ConnectionManager = require(script.Parent.ConnectionManager)
local ThemeManager = require(script.Parent.Parent.Themes.ThemeManager)
local Notifications = require(script.Parent.Parent.Systems.Notifications)
local Configuration = require(script.Parent.Parent.Systems.Configuration)
local UIUtil = require(script.Parent.UIUtil)
local Window = {}
Window.__index = Window

function Window.new(options)
    local self = setmetatable({ options = options, tabs = {}, theme = ThemeManager:Get(options.Theme), connections = ConnectionManager.new(), config = Configuration.new(options.Configuration) }, Window)
    local gui = Instance.new("ScreenGui")
    gui.Name = "NexusUI_" .. (options.Title or "Window")
    gui.ResetOnSpawn = false
    gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    gui.Parent = Players.LocalPlayer:WaitForChild("PlayerGui")
    self.gui = gui
    local main = Instance.new("Frame", gui)
    main.Name = "Window"
    main.Size = UDim2.fromOffset(options.Width or 540, options.Height or 420)
    main.Position = UDim2.fromScale(.5, .5)
    main.AnchorPoint = Vector2.new(.5, .5)
    main.BackgroundColor3 = self.theme.Background
    main.BorderSizePixel = 0
    UIUtil.corner(main, 12); UIUtil.stroke(main, self.theme.Border)
    self.main = main
    local title = Instance.new("TextLabel", main)
    title.BackgroundTransparency = 1; title.Position = UDim2.fromOffset(18, 15); title.Size = UDim2.new(1, -36, 0, 24)
    title.Text = options.Title or "NEXUS UI"; title.TextColor3 = self.theme.Text; title.TextSize = 17; title.Font = Enum.Font.GothamBold; title.TextXAlignment = Enum.TextXAlignment.Left
    self.tabBar = Instance.new("Frame", main); self.tabBar.BackgroundTransparency = 1; self.tabBar.Position = UDim2.fromOffset(16, 53); self.tabBar.Size = UDim2.new(1, -32, 0, 35)
    local layout = Instance.new("UIListLayout", self.tabBar); layout.FillDirection = Enum.FillDirection.Horizontal; layout.Padding = UDim.new(0, 4)
    self.notifications = Notifications.new(self)
    self:enableDragging(title)
    return self
end

function Window:enableDragging(handle)
    local dragging, origin, start
    self.connections:Track(handle.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then dragging = true; origin = input.Position; start = self.main.Position end
    end))
    self.connections:Track(UserInputService.InputChanged:Connect(function(input)
        if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then local delta = input.Position - origin; self.main.Position = start + UDim2.fromOffset(delta.X, delta.Y) end
    end))
    self.connections:Track(UserInputService.InputEnded:Connect(function(input) if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then dragging = false end end))
end

function Window:CreateTab(options)
    local tab = Tab.new(self, options or {}); table.insert(self.tabs, tab); if #self.tabs == 1 then tab:Select() end; return tab
end
function Window:Notify(options) return self.notifications:Show(options or {}) end
function Window:SetTheme(name)
    self.theme = ThemeManager:Get(name)
    self.main.BackgroundColor3 = self.theme.Background
    for _, instance in ipairs(self.main:GetDescendants()) do
        if instance:IsA("TextLabel") or instance:IsA("TextButton") or instance:IsA("TextBox") then
            instance.TextColor3 = self.theme.Text
        elseif instance:IsA("Frame") then
            instance.BackgroundColor3 = self.theme.Surface
        end
    end
    return self.theme
end
function Window:SaveConfiguration() return self.config.values end
function Window:Destroy()
    for _, tab in ipairs(self.tabs) do tab:Destroy() end
    self.connections:Destroy(); self.gui:Destroy(); self.tabs = {}
end

return Window