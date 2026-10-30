local UIUtil = require(script.Parent.Parent.Core.UIUtil)
local Toggle = {}; Toggle.__index = Toggle
function Toggle.new(section, options)
    local frame = Instance.new("TextButton", section.frame); frame.Name = options.Name or "Toggle"; frame.Size = UDim2.new(1, 0, 0, 38); frame.Text = ""; frame.BackgroundColor3 = section.tab.window.theme.Surface; frame.AutoButtonColor = false; UIUtil.corner(frame, 7)
    local label = UIUtil.label(frame, options.Name or "Toggle", 13, section.tab.window.theme.Text); label.Position = UDim2.fromOffset(12, 8); label.Size = UDim2.new(1, -65, 0, 22)
    local knob = Instance.new("Frame", frame); knob.Size = UDim2.fromOffset(30, 16); knob.Position = UDim2.new(1, -43, .5, -8); knob.BackgroundColor3 = section.tab.window.theme.Border; UIUtil.corner(knob, 8)
    local self = setmetatable({ instance = frame, value = options.Default == true, callback = options.Callback, knob = knob, onColor = section.tab.window.theme.Blue }, Toggle)
    function self:SetValue(value) self.value = value == true; self.knob.BackgroundColor3 = self.value and self.onColor or section.tab.window.theme.Border; if self.callback then task.spawn(self.callback, self.value) end end
    function self:GetValue() return self.value end
    section.tab.window.connections:Track(frame.Activated:Connect(function() self:SetValue(not self.value) end)); self:SetValue(self.value)
    return self
end
function Toggle:Destroy() self.instance:Destroy() end
return Toggle