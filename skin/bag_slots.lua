local ns = select(2, ...)
local util = ns.util

local function skin(target)
	local panel = target.frame

	panel:StripTextures(true)
	panel:SetTemplate(ns.config.transparent and "Transparent")
	panel.Bg:Hide()
end

local function handler()
	local module = ns.BetterBags:GetModule("BagSlots")
	local do_skin = util.with_flag(skin, ns.api.callback("bag_slots"))

	util.post_hook(module, "CreatePanel", function(ctx)
		local frame = ctx.result and ctx.result[1]
		if not frame then
			return
		end

		util.lazy.try(do_skin, frame)
	end)
end

ns.skin.bag_slots = handler
