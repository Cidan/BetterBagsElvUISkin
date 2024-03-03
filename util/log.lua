local ns = (select(2, ...))

local levels = {
	DEBUG = 1,
	INFO = 2,
	WARN = 3,
	ERROR = 4,
}

local function log_message(level_name, level_color, ...)
	local lvl = ns.config and ns.config.log_level and levels[ns.config.log_level:upper()] or levels.WARN
	if levels[level_name] < lvl then
		return
	end
	local prefix = "|cFF00FF00[|r|cFF" .. level_color .. level_name .. "|r|cFF00FF00]|r "
	local combined = string.join(" ", ...)
	print(prefix .. combined)
end

local function debug(...)
	log_message("DEBUG", "10b981", ...)
end

local function info(...)
	log_message("INFO", "0ea5e9", ...)
end

local function warn(...)
	log_message("WARN", "eab308", ...)
end

local function error(...)
	log_message("ERROR", "dc2626", ...)
end

local function call(func)
	if type(func) ~= "function" then
		error("call: func is not a function")
	end

	return function(...)
		local success, result = pcall(func, ...)
		if not success then
			error("call: " .. result)
		end

		return result
	end
end

ns.debug = debug
ns.info = info
ns.warn = warn
ns.error = error
ns.call = call
