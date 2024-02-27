local ns = (select(2, ...))

local function new_trigger(wait_for, callback, init_data)
	if not wait_for or not callback then
		return
	end

	local ctx = {
		triggered = false,
		wait_for = wait_for,
		callback = callback,
		data = init_data or nil,
	}

	local is_triggered = function()
		return ctx.triggered
	end

	local updater = function(update_func)
		if update_func then
			ctx.data = update_func(ctx.data)
		end

		if ctx.wait_for and ctx.wait_for(ctx.data) then
			ctx.triggered = true
			if ctx.callback then
				ctx.callback(ctx.data)
			end
		end
	end

	updater() -- check if already can be triggered

	return is_triggered, updater
end

ns.util.new_trigger = new_trigger
