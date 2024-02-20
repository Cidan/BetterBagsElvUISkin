local ns = (select(2, ...))

if not ns or not ns.util then return end

local M = {}

function M.hook(obj, method_name, pre_func, post_func, call_original)
    obj = obj or _G
    local original = obj and obj[method_name]
    if original then
        obj[method_name] = function(...)
            local ctx = {
                obj = obj,
                method = method_name,
                args = { ... },
                result = nil
            }

            if pre_func then pre_func(ctx) end
            if call_original then ctx.result = { original(...) } end
            if post_func then post_func(ctx) end

            return ctx.result
        end
    end
end

ns.util.hook = M
