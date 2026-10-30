local UIUtil = require(script.Parent.Parent.Core.UIUtil)
local Dropdown = {}; Dropdown.__index = Dropdown
function Dropdown.new(section, options)
    local frame = Instance.new("TextButton", section.frame); frame.Name = options.Name or "Dropdown"; frame.Text = ""; frame.Size = UDim2.new(1, 0, 0, 42); frame.BackgroundColor3 = section.tab.window.theme.Surface; UIUtil.corner(frame, 7)
    local label = UIUtil.label(frame, options.Name or "Dropdown", 13, section.tab.window.theme.Text); label.Position = UDim2.fromOffset(12, 4); label.Size = UDim2.new(.5, 0, 0, 18)
    local valueLabel = UIUtil.label(frame, tostring(options.Default or (options.Options and options.Options[1]) or "Select"), 11, section.tab.window.theme.Blue); valueLabel.Position = UDim2.new(.5, 0, 0, 4); valueLabel.Size = UDim2.new(.5, -12, 0, 18); valueLabel.TextXAlignment = Enum.TextXAlignment.Right
    local self = setmetatable({ instance = frame, value = options.Default or (options.Options and options.Options[1]), options = options.Options or {}, callback = options.Callback, index = 1 }, Dropdown)
    function self:SetValue(value) self.value = value; valueLabel.Text = tostring(value); if self.callback then task.spawn(self.callback, value) end end
    function self:GetValue() return self.value end
    for index, option in ipairs(self.options) do if option == self.value then self.index = index end end
    section.tab.window.connections:Track(frame.Activated:Connect(function() if #self.options > 0 then self.index = (self.index % #self.options) + 1; self:SetValue(self.options[self.index]) end end))
    return self
end
function Dropdown:Destroy() self.instance:Destroy() end
return Dropdown