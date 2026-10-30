local Lifecycle = {}
Lifecycle.__index = Lifecycle

function Lifecycle.new()
    return setmetatable({ connections = {}, instances = {}, destroyed = false }, Lifecycle)
end

function Lifecycle:track(connection)
    table.insert(self.connections, connection)
    return connection
end

function Lifecycle:trackInstance(instance)
    table.insert(self.instances, instance)
    return instance
end

function Lifecycle:destroy()
    if self.destroyed then return end
    self.destroyed = true
    for _, connection in self.connections do
        if connection.Disconnect then connection:Disconnect() end
    end
    for _, instance in self.instances do
        if instance.Destroy then instance:Destroy() end
    end
    table.clear(self.connections)
    table.clear(self.instances)
end

return Lifecycle