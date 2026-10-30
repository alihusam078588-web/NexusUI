local UIUtil = require(script.Parent.Parent.Core.UIUtil)
local Label = {}; Label.__index = Label
function Label.new(section, options)
    local label = UIUtil.label(section.frame, options.Text or options.Name or "Label", options.TextSize or 13, section.tab.window.theme.Text); label.Name = options.Name or "Label"; label.AutomaticSize = Enum.AutomaticSize.Y; label.Size = UDim2.new(1, 0, 0, 22); return setmetatable({ instance = label }, Label)
end
function Label:SetText(text) self.instance.Text = text end
function Label:Destroy() self.instance:Destroy() end
return Label