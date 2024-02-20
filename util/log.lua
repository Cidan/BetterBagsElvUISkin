local ns = (select(2, ...))

local levels = {
    DEBUG = 1,
    INFO = 2,
    WARN = 3,
    ERROR = 4,
}

local function log_message(level_name, level_color, ...)
    local config_level = ns.config.log.level and levels[ns.config.log.level:upper()] or levels.WARN
    if levels[level_name] < config_level then return "" end
    local prefix = "|cFF00FF00[|r|cFF" .. level_color .. level_name .. "|r|cFF00FF00]|r "
    local message = strjoin(" ", ...)
    return prefix .. message
end

local function debug(...)
    print(log_message("DEBUG", "10b981", ...))
end

local function info(...)
    print(log_message("INFO", "0ea5e9", ...))
end

local function warn(...)
    print(log_message("WARN", "eab308", ...))
end

local function error(...)
    print(log_message("ERROR", "dc2626", ...))
end

local function error_handler(...)
    _G.geterrorhandler()(log_message("ERROR", "dc2626", "BetterBagsElvUISkin Error\n", ...))
end

local function call_with_log(...)
    local func_list = { ... }
    for i = 1, #func_list do
        if func_list[i] then
            local status = xpcall(func_list[i], error_handler)
            if not status then
                error("Error occurred in call_with_log. function index: " .. i)
            end
        end
    end
end

ns.debug = debug
ns.info = info
ns.warn = warn
ns.error = error
ns.util.call_with_log = call_with_log
