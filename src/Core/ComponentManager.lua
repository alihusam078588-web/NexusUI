local ComponentManager = {}
ComponentManager.__index = ComponentManager

function ComponentManager.new(section)
    return setmetatable({ section = section, components = {} }, ComponentManager)
end

function ComponentManager:Add(module, options)
    local component = module.new(self.section, options or {})
    table.insert(self.components, component)
    return component
end

function ComponentManager:Destroy()
    for _, component in ipairs(self.components) do
        if component.Destroy then component:Destroy() end
    end
    table.clear(self.components)
end

return ComponentManager