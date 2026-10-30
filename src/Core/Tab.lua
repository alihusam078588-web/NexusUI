local Section = require(script.Parent.Section)
local Tab = {}
Tab.__index = Tab

function Tab.new(window, options)
    local button = Instance.new("TextButton")
    button.Name = options.Name or "Tab"
    button.Text = options.Name or "Tab"
    button.Font = Enum.Font.GothamMedium
    button.TextSize = 13
    button.TextColor3 = window.theme.Muted
    button.BackgroundTransparency = 1
    button.Size = UDim2.fromOffset(105, 34)
    button.Parent = window.tabBar
    local page = Instance.new("ScrollingFrame")
    page.Name = button.Name .. "Page"
    page.BackgroundTransparency = 1
    page.BorderSizePixel = 0
    page.Size = UDim2.new(1, -32, 1, -112)
    page.Position = UDim2.fromOffset(16, 100)
    page.ScrollBarThickness = 3
    page.AutomaticCanvasSize = Enum.AutomaticSize.Y
    page.CanvasSize = UDim2.new()
    page.Visible = false
    page.Parent = window.main
    local layout = Instance.new("UIListLayout", page)
    layout.Padding = UDim.new(0, 14)
    local tab = setmetatable({ window = window, button = button, page = page, sections = {} }, Tab)
    window.connections:Track(button.Activated:Connect(function() tab:Select() end))
    return tab
end

function Tab:Select()
    for _, other in ipairs(self.window.tabs) do other.page.Visible = false; other.button.TextColor3 = self.window.theme.Muted end
    self.page.Visible = true; self.button.TextColor3 = self.window.theme.Blue
end

function Tab:CreateSection(options)
    local section = Section.new(self, options or {}):Init()
    table.insert(self.sections, section)
    return section
end

function Tab:Destroy()
    for _, section in ipairs(self.sections) do section:Destroy() end
    self.button:Destroy(); self.page:Destroy()
end

return Tab