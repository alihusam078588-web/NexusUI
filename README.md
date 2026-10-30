# NEXUS UI 1.0.0

**One Framework. Unlimited Possibilities.**

NEXUS UI is a reusable Roblox Luau UI framework built from standard Roblox `Instance` objects. It is the primary deliverable in this package; the demo consumes the same public API that your experience will use.

## Install in Roblox Studio
1. Create a `Folder` named `NexusUI` in `ReplicatedStorage`.
2. Copy the contents of `src` into it, preserving `Core`, `Components`, `Themes`, and `Systems` folders.
3. Add `examples/BasicDemo.client.lua` to `StarterPlayerScripts` as a LocalScript.
4. Require `ReplicatedStorage.NexusUI.Nexus` from your own LocalScript.

## Quick start
```lua
local Nexus = require(game.ReplicatedStorage.NexusUI.Nexus)
local Window = Nexus:CreateWindow({ Title = "My Application", Theme = "NEXUS Dark" })
local Tab = Window:CreateTab({ Name = "Main", Icon = "home" })
local Section = Tab:CreateSection({ Name = "General" })
Section:CreateButton({ Name = "Example Button", Callback = function() print("Clicked!") end })
Section:CreateToggle({ Name = "Example Toggle", Default = false, Callback = function(value) print(value) end })
```

Every component returns a controller with `GetValue`, `SetValue` where applicable, and `Destroy`. Call `Window:Destroy()` when the experience removes the interface. No exploit executor, loadstring, remote code, anti-cheat bypass, or unsupported dependency is used.

See `docs/API.md`, `docs/CONFIGURATION.md`, and `docs/PLATFORM_LIMITATIONS.md`.