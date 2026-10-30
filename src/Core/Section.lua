local ComponentManager = require(script.Parent.ComponentManager)
local Components = script.Parent.Parent.Components
local Section = {}
Section.__index = Section

function Section.new(tab, options)
    local frame = Instance.new("Frame")
    frame.Name = options.Name or "Section"
    frame.BackgroundTransparency = 1
    frame.Size = UDim2.new(1, 0, 0, 40)
    frame.AutomaticSize = Enum.AutomaticSize.Y
    frame.Parent = tab.page
    local layout = Instance.new("UIListLayout", frame)
    layout.Padding = UDim.new(0, 8)
    local heading = Instance.new("TextLabel", frame)
    heading.BackgroundTransparency = 1
    heading.Text = string.upper(options.Name or "SECTION")
    heading.TextColor3 = tab.window.theme.Muted
    heading.Font = Enum.Font.GothamMedium
    heading.TextSize = 11
    heading.Size = UDim2.new(1, 0, 0, 22)
    heading.TextXAlignment = Enum.TextXAlignment.Left
    return setmetatable({ tab = tab, frame = frame, manager = nil }, Section)
end

function Section:Init()
    self.manager = ComponentManager.new(self)
    return self
end

function Section:CreateButton(options) return self.manager:Add(require(Components.Button), options) end
function Section:CreateToggle(options) return self.manager:Add(require(Components.Toggle), options) end
function Section:CreateSlider(options) return self.manager:Add(require(Components.Slider), options) end
function Section:CreateDropdown(options) return self.manager:Add(require(Components.Dropdown), options) end
function Section:CreateKeybind(options) return self.manager:Add(require(Components.Keybind), options) end
function Section:CreateTextbox(options) return self.manager:Add(require(Components.Textbox), options) end
function Section:CreateLabel(options) return self.manager:Add(require(Components.Label), options) end
function Section:CreateParagraph(options) return self.manager:Add(require(Components.Paragraph), options) end

function Section:Destroy()
    if self.manager then self.manager:Destroy() end
    self.frame:Destroy()
end

return Section