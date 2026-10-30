local UIUtil = require(script.Parent.Parent.Core.UIUtil)
local Notifications = {}
Notifications.__index = Notifications
function Notifications.new(window)
    local holder = Instance.new("Frame", window.gui); holder.Name = "Notifications"; holder.BackgroundTransparency = 1; holder.Position = UDim2.new(1, -285, 0, 16); holder.Size = UDim2.fromOffset(265, 0); holder.AutomaticSize = Enum.AutomaticSize.Y
    local layout = Instance.new("UIListLayout", holder); layout.Padding = UDim.new(0, 7)
    return setmetatable({ window = window, holder = holder }, Notifications)
end
function Notifications:Show(options)
    local card = Instance.new("Frame", self.holder); card.Size = UDim2.new(1, 0, 0, 68); card.BackgroundColor3 = self.window.theme.Surface; UIUtil.corner(card, 8); UIUtil.stroke(card, self.window.theme.Border)
    local title = UIUtil.label(card, options.Title or "NEXUS UI", 14, self.window.theme.Text); title.Position = UDim2.fromOffset(12, 9); title.Size = UDim2.new(1, -24, 0, 20)
    local content = UIUtil.label(card, options.Content or "", 11, self.window.theme.Muted); content.Position = UDim2.fromOffset(12, 33); content.Size = UDim2.new(1, -24, 0, 20)
    task.delay(options.Duration or 4, function() if card.Parent then card:Destroy() end end)
    return card
end
return Notifications