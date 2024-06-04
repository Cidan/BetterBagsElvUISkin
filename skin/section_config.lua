local ns = select(2, ...)
local util = ns.util

local function skin(target)
    local container = target.frame
    if not container then
        return
    end

    container:StripTextures(true)
    container:SetTemplate(ns.config.transparent and "Transparent")
    container.Bg:Hide()

    if container.TitleContainer then
        container.TitleContainer:StripTextures()
    end
end

local function handler()
    local module = ns.BetterBags:GetModule("SectionConfig", true)

    -- Only exist in alpha version
    if not module then
        return
    end

    local do_skin = util.with_flag(skin, ns.api.callback("section_config"))

    util.post_hook(
        module,
        "Create",
        function(ctx)
            local frame = ctx.result and ctx.result[1]

            if not frame then
                return
            end

            util.lazy.try(do_skin, frame)
        end
    )
end

ns.skin.section_config = handler
