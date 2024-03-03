local ns = select(2, ...)
local util = ns.util

local function update_icon(item)
	if item and item.icon then
		item.icon:SetTexCoord(unpack(ns.tex_coords))
	end
end

local function skin(target)
	local container = target.frame
	local skin_icon = util.with_flag(update_icon)

	container:StripTextures(true)
	container:SetTemplate(ns.config.transparent and "Transparent")
	container.Bg:Hide()

	hooksecurefunc(target.content, "AddCell", function(_, _, item)
		skin_icon(item)
	end)

	hooksecurefunc(target.iconGrid, "AddCell", function(_, _, item)
		skin_icon(item)
	end)

	for _, cell in ipairs(target.content.cells) do
		skin_icon(cell)
	end

	for _, cell in ipairs(target.iconGrid.cells) do
		skin_icon(cell)
	end
end

local function handler()
	local module = ns.BetterBags:GetModule("Currency")
	local do_skin = util.with_flag(skin, ns.api.callback("currency"))

	util.post_hook(module, "Create", function(ctx)
		local frame = ctx.result and ctx.result[1]

		if not frame then
			return
		end

		util.lazy.try(do_skin, frame)
	end)
end

ns.skin.currency = handler
