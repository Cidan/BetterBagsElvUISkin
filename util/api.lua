local ns = (select(2, ...))

local M = {}

local api_callbacks = {}

function M.callback(name)
	return function(...)
		if not api_callbacks[name] then
			return
		end

		table.sort(api_callbacks[name], function(a, b)
			return a.order < b.order
		end)

		ns.debug("api.callback: " .. name .. " num: ", #api_callbacks[name])

		for _, callback in ipairs(api_callbacks[name]) do
			callback.func(...)
		end
	end
end

function M.register(name, order, func)
	if not name or not func then
		ns.error("api.register: name and func are required")
	end

	if not api_callbacks[name] then
		api_callbacks[name] = {}
	end

	table.insert(api_callbacks[name], {
		order = order,
		func = func,
	})

	ns.debug("api.register: " .. name .. " num: ", #api_callbacks[name])
end

ns.api = M
