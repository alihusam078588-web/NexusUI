local dark = require(script.Parent.NEXUSDark)
local UserInputService = game:GetService("UserInputService")
local Adaptive = table.clone(dark)
Adaptive.Name = "Adaptive"
function Adaptive:Resolve()
    local resolved = table.clone(self)
    if UserInputService.TouchEnabled then
        resolved.Surface = Color3.fromRGB(22, 26, 40)
        resolved.SurfaceHover = Color3.fromRGB(35, 42, 63)
    end
    return resolved
end
return Adaptive