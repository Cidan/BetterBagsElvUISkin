local ns = (select(2, ...))

local function get_flag(frame)
    return frame.__bb_elvui_skin == true
end

local function set_flag(frame)
    if frame then
        frame.__bb_elvui_skin = true
    end
end

ns.util.get_flag = get_flag
ns.util.set_flag = set_flag