-- NEXUS UI 1.0.0 | Public ModuleScript entry point.
-- Designed for legitimate Roblox Studio experiences and supported APIs.
local Window = require(script.Parent.Core.Window)
local ThemeManager = require(script.Parent.Themes.ThemeManager)

local Nexus = { Version = "1.0.0", ThemeManager = ThemeManager }

function Nexus:CreateWindow(options)
    assert(type(options) == "table", "NEXUS UI: CreateWindow expects an options table")
    return Window.new(options)
end

function Nexus:GetTheme(name)
    return ThemeManager:Get(name)
end

return Nexus