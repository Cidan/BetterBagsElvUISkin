local ns = (select(2, ...))

local function noop() end

local function with_flag(callback, api_callback)
	return function(frame, ...)
		if not frame or type(frame) ~= "table" or frame.__bb_elvui_skin then
			return
		end

		frame.__bb_elvui_skin = true
		callback(frame, ...)
		if api_callback then
			api_callback(frame, ...)
		end
	end
end

ns.util.with_flag = with_flag
ns.noop = noop
