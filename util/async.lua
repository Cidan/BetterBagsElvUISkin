local ns = (select(2, ...))

local DEFAULT_DELAY = 0.01

local function delay(seconds, callback, ...)
	local args = { ... }

	if type(seconds) == "function" then
		table.insert(args, 1, callback)
		callback = seconds
		seconds = DEFAULT_DELAY
	end

	if not callback then
		return
	end

	C_Timer.After(seconds or DEFAULT_DELAY, function()
		callback(unpack(args))
	end)
end

ns.util.delay = delay
