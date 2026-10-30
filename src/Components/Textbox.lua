local UIUtil = require(script.Parent.Parent.Core.UIUtil)
local Textbox = {}; Textbox.__index = Textbox
function Textbox.new(section, options)
    local box = Instance.new("TextBox", section.frame); box.Name = options.Name or "Textbox"; box.PlaceholderText = options.Name or "Enter text"; box.Text = options.Default or ""; box.Size = UDim2.new(1, 0, 0, 38); box.BackgroundColor3 = section.tab.window.theme.Surface; box.TextColor3 = section.tab.window.theme.Text; box.PlaceholderColor3 = section.tab.window.theme.Muted; box.Font = Enum.Font.Gotham; box.TextSize = 13; UIUtil.corner(box, 7)
    local self = setmetatable({ instance = box, callback = options.Callback }, Textbox)
    section.tab.window.connections:Track(box.FocusLost:Connect(function() if self.callback then task.spawn(self.callback, box.Text) end end))
    function self:SetValue(value) box.Text = tostring(value) end
    function self:GetValue() return box.Text end
    return self
end
function Textbox:Destroy() self.instance:Destroy() end
return Textbox