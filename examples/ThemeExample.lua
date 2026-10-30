local Nexus = require(game.ReplicatedStorage.NexusUI.Nexus)
local theme = Nexus.Theme.get("NEXUS Dark")

print("Primary accent:", theme.blue)
local app = Nexus.create({ profile = "lightweight", accent = theme.crimson })
-- Lightweight mode disables decorative motion while preserving touch targets.