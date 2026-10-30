local Configuration = {}
Configuration.__index = Configuration
function Configuration.new(seed) return setmetatable({ values = seed or {}, changed = {} }, Configuration) end
function Configuration:Set(key, value) self.values[key] = value; for _, callback in ipairs(self.changed[key] or {}) do task.spawn(callback, value) end end
function Configuration:Get(key, fallback) local value = self.values[key]; return value == nil and fallback or value end
function Configuration:OnChanged(key, callback) self.changed[key] = self.changed[key] or {}; table.insert(self.changed[key], callback) end
return Configuration