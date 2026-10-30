local UIUtil = require(script.Parent.Parent.Core.UIUtil)
local UserInputService = game:GetService("UserInputService")
local Slider = {}; Slider.__index = Slider
function Slider.new(section, options)
    local frame = Instance.new("Frame", section.frame); frame.Name = options.Name or "Slider"; frame.Size = UDim2.new(1, 0, 0, 58); frame.BackgroundColor3 = section.tab.window.theme.Surface; UIUtil.corner(frame, 7)
    local label = UIUtil.label(frame, options.Name or "Slider", 13, section.tab.window.theme.Text); label.Position = UDim2.fromOffset(12, 6); label.Size = UDim2.new(.7, 0, 0, 20)
    local valueLabel = UIUtil.label(frame, "", 11, section.tab.window.theme.Blue); valueLabel.Position = UDim2.new(1, -65, 0, 6); valueLabel.Size = UDim2.fromOffset(53, 20); valueLabel.TextXAlignment = Enum.TextXAlignment.Right
    local bar = Instance.new("TextButton", frame); bar.Text = ""; bar.Size = UDim2.new(1, -24, 0, 8); bar.Position = UDim2.fromOffset(12, 38); bar.BackgroundColor3 = section.tab.window.theme.Border; UIUtil.corner(bar, 5)
    local fill = Instance.new("Frame", bar); fill.BackgroundColor3 = section.tab.window.theme.Blue; fill.Size = UDim2.new(0, 0, 1, 0); UIUtil.corner(fill, 5)
    local min, max = options.Min or 0, options.Max or 100; local self = setmetatable({ instance = frame, value = options.Default or min, callback = options.Callback }, Slider)
    function self:SetValue(value) self.value = math.clamp(value, min, max); local alpha = (self.value - min) / math.max(max - min, 1); fill.Size = UDim2.new(alpha, 0, 1, 0); valueLabel.Text = tostring(self.value); if self.callback then task.spawn(self.callback, self.value) end end
    function self:GetValue() return self.value end
    local function update(input) local alpha = math.clamp((input.Position.X - bar.AbsolutePosition.X) / bar.AbsoluteSize.X, 0, 1); self:SetValue(math.floor(min + (max - min) * alpha + .5)) end
    section.tab.window.connections:Track(bar.Activated:Connect(update)); section.tab.window.connections:Track(UserInputService.InputChanged:Connect(function(input) if input.UserInputType == Enum.UserInputType.MouseMovement and UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) then update(input) end end)); self:SetValue(self.value)
    return self
end
function Slider:Destroy() self.instance:Destroy() end
return Slider