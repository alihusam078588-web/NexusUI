local UserInputService = game:GetService("UserInputService")
local UIUtil = require(script.Parent.Parent.Core.UIUtil)
local Keybind = {}; Keybind.__index = Keybind
function Keybind.new(section, options)
    local button = Instance.new("TextButton", section.frame); button.Name = options.Name or "Keybind"; button.Text = (options.Name or "Keybind") .. "  [" .. tostring(options.Default or Enum.KeyCode.RightShift.Name) .. "]"; button.Size = UDim2.new(1, 0, 0, 38); button.BackgroundColor3 = section.tab.window.theme.Surface; button.TextColor3 = section.tab.window.theme.Text; button.Font = Enum.Font.Gotham; button.TextSize = 13; UIUtil.corner(button, 7)
    local self = setmetatable({ instance = button, key = options.Default or Enum.KeyCode.RightShift, callback = options.Callback, listening = false }, Keybind)
    section.tab.window.connections:Track(button.Activated:Connect(function() self.listening = true; button.Text = (options.Name or "Keybind") .. "  [press a key]" end))
    section.tab.window.connections:Track(UserInputService.InputBegan:Connect(function(input, processed) if not processed and self.listening and input.KeyCode ~= Enum.KeyCode.Unknown then self.listening = false; self.key = input.KeyCode; button.Text = (options.Name or "Keybind") .. "  [" .. input.KeyCode.Name .. "]" elseif not processed and input.KeyCode == self.key and self.callback then task.spawn(self.callback, input.KeyCode) end end))
    return self
end
function Keybind:GetValue() return self.key end
function Keybind:Destroy() self.instance:Destroy() end
return Keybind