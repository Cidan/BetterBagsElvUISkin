local ns = select(2, ...)
local util = ns.util
local E = unpack(ElvUI)
local S = E.Skins

local function skin(target)
	local text_box = target.textBox
	if searchBox then
		S:HandleEditBox(text_box)
	end
end

local function handler()
	local module = ns.BetterBags:GetModule("Search")
	local do_skin = util.with_flag(skin, ns.api.callback("search"))

	util.post_hook(module, "CreateBox", function(ctx)
		local frame = ctx.result and ctx.result[1]

		if not frame then
			return
		end

		util.lazy.try(do_skin, frame)
	end)
end

ns.skin.search = handler
