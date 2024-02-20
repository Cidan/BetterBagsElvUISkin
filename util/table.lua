local ns = (select(2, ...))

local function list_extend(list, ...)
    for _, other in ipairs({ ... }) do
        for _, item in ipairs(other) do
            table.insert(list, item)
        end
    end
    return list
end

local function list_filter(list, func)
    local result = {}
    for _, item in ipairs(list) do
        if func(item) then
            table.insert(result, item)
        end
    end
    return result
end

local function list_map(list, func)
    local result = {}
    for _, item in ipairs(list) do
        table.insert(result, func(item))
    end
    return result
end

local function list_size(list)
    return #list
end

-- mode: "keep", "force"
local function tbl_extend(mode, ...)
    local result = {}
    local tbls = { ... }
    if #tbls == 0 then
        return result
    end
    if #tbls == 1 then
        return tbls[1]
    end
    for _, tbl in ipairs(tbls) do
        for k, v in pairs(tbl) do
            if result[k] == nil or mode == "force" then
                result[k] = v
            end
        end
    end
    return result
end

ns.util.list_extend = list_extend
ns.util.list_filter = list_filter
ns.util.list_map = list_map
ns.util.list_size = list_size
ns.util.tbl_extend = tbl_extend
