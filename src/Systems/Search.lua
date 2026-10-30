local Search = {}
function Search.Filter(items, query, getter)
    local result = {}; query = string.lower(query or "")
    for _, item in ipairs(items) do if string.find(string.lower(getter and getter(item) or tostring(item)), query, 1, true) then table.insert(result, item) end end
    return result
end
return Search