local ns = (select(2, ...))

local dependencies = { "ElvUI", "BetterBags" }

-- Just for faster lookup
local dependencies_name_map = {}
for _, name in ipairs(dependencies) do
    dependencies_name_map[name] = true
end

-- Use the trigger to lazy load the skinning when all dependencies are loaded
local _, updater = ns.util.new_trigger(
    function(data)
        return data >= #dependencies
    end,
    function()
        ns.util.delay(1, function()
            ns.util.call_with_log(
                ns.skin.bag_frame,
                function()
                    print(1)
                    local a = 0
                    return a["a"]["b"]
                end
            )
        end)
    end,
    ns.util.list_size(ns.util.list_filter(dependencies, function(name)
        return IsAddOnLoaded(name)
    end))
)

-- Add a handler to the ADDON_LOADED event
ns.util.handle_event("ADDON_LOADED", function(_, _, addon_name)
    if dependencies_name_map[addon_name] then
        updater(function(data) return data + 1 end)
    end
end)
