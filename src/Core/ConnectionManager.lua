local ConnectionManager = {}
ConnectionManager.__index = ConnectionManager

function ConnectionManager.new()
    return setmetatable({ items = {}, destroyed = false }, ConnectionManager)
end

function ConnectionManager:Track(connection)
    if self.destroyed then connection:Disconnect() else table.insert(self.items, connection) end
    return connection
end

function ConnectionManager:Destroy()
    if self.destroyed then return end
    self.destroyed = true
    for _, connection in ipairs(self.items) do connection:Disconnect() end
    table.clear(self.items)
end

return ConnectionManager