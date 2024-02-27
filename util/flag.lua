local ns = (select(2, ...))

local function get_flag(frame)
	return frame.__bb_elvui_skin == true
end

local function set_flag(frame)
	if frame then
		frame.__bb_elvui_skin = true
	end
end

local function with_flag(callback)
	return function(frame, ...)
		if not frame or type(frame) ~= "table" then
			return
		end
		if get_flag(frame) then
			return
		end
		set_flag(frame)
		callback(frame, ...)
	end
end

ns.util.get_flag = get_flag
ns.util.set_flag = set_flag
ns.util.with_flag = with_flag
