local ns = (select(2, ...))

local M = {}

function M.delay(seconds, callback, ...)
    local args = { ... }
    if not callback then return end
    C_Timer.After(seconds or 0.01, function()
        callback(unpack(args))
    end)
end

ns.util.async = M