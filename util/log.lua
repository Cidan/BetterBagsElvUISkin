local ns = (select(2, ...))

local M = {
    level = {
        DEBUG = 1,
        INFO = 2,
        WARN = 3,
        ERROR = 4,
    }
}

local function log_message(lavel_name, level_color, ...)
    if M.level[lavel_name] < M.level[ns.config.log_level] then
        return
    end
    local prefix = "|cFF00FF00[|r|cFF" .. level_color .. lavel_name .. "|r|cFF00FF00]|r "
    local message = strjoin(" ", ...)
    return prefix .. message
end

function M.debug(...)
    print(log_message("DEBUG", "10b981", ...))
end

function M.info(...)
    print(log_message("INFO", "0ea5e9", ...))
end

function M.warn(...)
    print(log_message("WARN", "eab308", ...))
end

function M.error(...)
    print(log_message("ERROR", "dc2626", ...))
end

local function error_handler(...)
    _G.geterror_handler()(log_message("ERROR", "dc2626", "BetterBagsElvUISkin Error\n", ...))
end

function M.call_with_log(func_list)
    for i = 1, #func_list do
        if func_list[i] then
            xpcall(func_list[i], error_handler)
        end
    end
end

ns.util.log = M
ns.debug = M.debug
ns.info = M.info
ns.warn = M.warn
ns.error = M.error
ns.run = M.call_with_log