local Plugin = {}
Plugin.Id = "nexus-inspector"
Plugin.Version = "1.0.0"

function Plugin.install(nexus)
    local panel = nexus.root:panel({ size = UDim2.fromOffset(320, 180) })
    panel.Name = "InspectorPlugin"
    return function() panel:Destroy() end
end

return Plugin