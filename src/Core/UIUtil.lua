local TweenService = game:GetService("TweenService")
local UIUtil = {}

function UIUtil.corner(parent, radius)
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, radius or 8)
    corner.Parent = parent
end

function UIUtil.stroke(parent, color)
    local stroke = Instance.new("UIStroke")
    stroke.Color = color
    stroke.Transparency = 0.35
    stroke.Parent = parent
end

function UIUtil.label(parent, text, size, color)
    local label = Instance.new("TextLabel")
    label.BackgroundTransparency = 1
    label.Text = text or ""
    label.TextColor3 = color or Color3.new(1, 1, 1)
    label.Font = Enum.Font.Gotham
    label.TextSize = size or 14
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Size = UDim2.new(1, 0, 0, 22)
    label.Parent = parent
    return label
end

function UIUtil.tween(instance, info, properties)
    local tween = TweenService:Create(instance, info, properties)
    tween:Play()
    return tween
end

return UIUtil