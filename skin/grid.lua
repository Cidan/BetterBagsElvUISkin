local ns = select(2, ...)
local util = ns.util
local E = unpack(ElvUI)
local S = E.Skins

local function skin(target)
	local bar = target.bar

	S:HandleTrimScrollBar(bar)

	if bar.Back and bar.Back.Texture then
		bar.Back.Texture:Hide()
	end

	if bar.Forward and bar.Forward.Texture then
		bar.Forward.Texture:Hide()
	end
end

local function handler()
	local module = ns.BetterBags:GetModule("Grid")
	local do_skin = util.with_flag(skin, ns.api.callback("grid"))

	util.post_hook(module, "Create", function(ctx)
		local frame = ctx.result and ctx.result[1]

		if not frame then
			return
		end

		util.lazy.try(do_skin, frame)
	end)
end

ns.skin.grid = handler
