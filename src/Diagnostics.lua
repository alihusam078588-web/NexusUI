local Diagnostics = {}
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")

function Diagnostics.capabilities()
    return {
        touch = UserInputService and UserInputService.TouchEnabled or false,
        viewport = workspace.CurrentCamera and workspace.CurrentCamera.ViewportSize or Vector2.zero,
        tween = TweenService ~= nil,
    }
end

function Diagnostics.warn(message)
    warn("[NEXUS UI] " .. tostring(message))
end

return Diagnostics