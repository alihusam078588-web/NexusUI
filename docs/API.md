# NEXUS UI API

`Nexus:CreateWindow({ Title, Theme, Width, Height, Configuration })` creates a draggable ScreenGui window. Themes default to `NEXUS Dark` and fall back safely when an unknown name is supplied.

`Window:CreateTab({ Name, Icon })` returns a tab. `Tab:CreateSection({ Name })` returns a section.

Sections expose `CreateButton`, `CreateToggle`, `CreateSlider`, `CreateDropdown`, `CreateKeybind`, `CreateTextbox`, `CreateLabel`, and `CreateParagraph`. All take an options table and return a component controller. Callbacks run through `task.spawn` so UI input remains responsive.

`Window:Notify({ Title, Content, Duration })` creates an auto-dismissing notification. `Window:SetTheme(name)` changes the active theme reference. `Window:SaveConfiguration()` returns the current configuration table. `Window:Destroy()` disconnects all tracked input connections and destroys every Instance.