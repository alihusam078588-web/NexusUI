local Nexus = require(game.ReplicatedStorage.NexusUI.Nexus)

local Window = Nexus:CreateWindow({ Title = "NEXUS UI Demo", Theme = "NEXUS Dark" })
local Tab = Window:CreateTab({ Name = "Main", Icon = "home" })
local Section = Tab:CreateSection({ Name = "General" })

Section:CreateParagraph({ Title = "Welcome", Content = "Every control below is created by the public NEXUS UI API." })
Section:CreateButton({ Name = "Example Button", Callback = function() Window:Notify({ Title = "NEXUS UI", Content = "Clicked!" }) end })
Section:CreateToggle({ Name = "Example Toggle", Default = false, Callback = function(value) print("Toggle:", value) end })
Section:CreateSlider({ Name = "Example Slider", Min = 0, Max = 100, Default = 50, Callback = function(value) print("Slider:", value) end })
Section:CreateDropdown({ Name = "Example Dropdown", Options = { "One", "Two", "Three" }, Callback = function(value) print("Dropdown:", value) end })
Section:CreateTextbox({ Name = "Example Textbox", Callback = function(value) print("Textbox:", value) end })
Section:CreateKeybind({ Name = "Toggle Key", Default = Enum.KeyCode.RightShift, Callback = function() print("Key pressed") end })

local Info = Window:CreateTab({ Name = "About" }):CreateSection({ Name = "Framework" })
Info:CreateLabel({ Text = "NEXUS UI 1.0.0" })
Info:CreateParagraph({ Title = "Supported APIs", Content = "Instances, UserInputService, TweenService, and standard Roblox Studio LocalScripts only." })

script.Destroying:Connect(function() Window:Destroy() end)