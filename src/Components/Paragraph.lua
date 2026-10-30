local UIUtil = require(script.Parent.Parent.Core.UIUtil)
local Paragraph = {}; Paragraph.__index = Paragraph
function Paragraph.new(section, options)
    local frame = Instance.new("Frame", section.frame); frame.Name = options.Name or "Paragraph"; frame.Size = UDim2.new(1, 0, 0, 64); frame.BackgroundColor3 = section.tab.window.theme.Surface; UIUtil.corner(frame, 7)
    local title = UIUtil.label(frame, options.Title or options.Name or "", 13, section.tab.window.theme.Text); title.Position = UDim2.fromOffset(12, 8); title.Size = UDim2.new(1, -24, 0, 20)
    local body = UIUtil.label(frame, options.Content or "", 11, section.tab.window.theme.Muted); body.Position = UDim2.fromOffset(12, 31); body.Size = UDim2.new(1, -24, 0, 25); body.TextWrapped = true
    return setmetatable({ instance = frame, body = body }, Paragraph)
end
function Paragraph:SetContent(text) self.body.Text = text end
function Paragraph:Destroy() self.instance:Destroy() end
return Paragraph