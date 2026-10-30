local ThemeManager = {}
local themes = { ["NEXUS Dark"] = require(script.NEXUSDark), Adaptive = require(script.Adaptive) }

function ThemeManager:Get(name)
    local theme = themes[name] or themes["NEXUS Dark"]
    return theme.Resolve and theme:Resolve() or theme
end

function ThemeManager:Register(name, theme)
    assert(type(name) == "string" and type(theme) == "table", "NEXUS UI: invalid theme")
    themes[name] = theme
end

function ThemeManager:Apply(instance, theme)
    if instance:IsA("GuiObject") then instance.BackgroundColor3 = theme.Surface end
end

return ThemeManager