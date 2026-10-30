local UserInputService = game:GetService("UserInputService")
local DeviceManager = {}
function DeviceManager:IsTouch() return UserInputService.TouchEnabled end
function DeviceManager:IsMobile() return UserInputService.TouchEnabled and not UserInputService.KeyboardEnabled end
function DeviceManager:GetViewport() return workspace.CurrentCamera and workspace.CurrentCamera.ViewportSize or Vector2.zero end
return DeviceManager