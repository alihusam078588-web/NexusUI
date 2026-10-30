local TweenService = game:GetService("TweenService")
local Animations = {}
function Animations.Play(instance, properties, duration)
    return TweenService:Create(instance, TweenInfo.new(duration or .2, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), properties)
end
function Animations.FadeIn(instance, duration) instance.Visible = true; local tween = Animations.Play(instance, { BackgroundTransparency = 0 }, duration); tween:Play(); return tween end
return Animations