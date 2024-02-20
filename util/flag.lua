local ns = (select(2, ...))

function ns.util.get_flag(frame)
    return frame.__bb_elvui_skin == true
end

function ns.util.set_flag(frame)
    if frame then
        frame.__bb_elvui_skin = true
    end
end
