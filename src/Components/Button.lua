local UIUtil = require(script.Parent.Parent.Core.UIUtil)
local Button = {}; Button.__index = Button
function Button.new(section, options)
    local button = Instance.new("TextButton", section.frame); button.Name = options.Name or "Button"; button.Size = UDim2.new(1, 0, 0, 38); button.Text = options.Name or "Button"; button.Font = Enum.Font.GothamMedium; button.TextSize = 13; button.TextColor3 = section.tab.window.theme.Text; button.BackgroundColor3 = section.tab.window.theme.Surface; button.AutoButtonColor = false; UIUtil.corner(button, 7); UIUtil.stroke(button, section.tab.window.theme.Border)
    local self = setmetatable({ instance = button, callback = options.Callback }, Button)
    section.tab.window.connections:Track(button.Activated:Connect(function() if self.callback then task.spawn(self.callback) end end))
    return self
end
function Button:Destroy() self.instance:Destroy() end
return Button