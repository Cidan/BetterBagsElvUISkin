local ns = select(2, ...)
local util = ns.util
local E = unpack(ElvUI)
local S = E.Skins

local function skin(target)
	local frame, input, yes_btn, no_btn = target.frame, target.input, target.yes, target.no

	frame:StripTextures(true)
	frame:SetTemplate(ns.config.transparent and "Transparent")
	frame.Bg:Hide()

	if frame.TitleContainer and frame.TitleContainer.TitleBg then
		frame.TitleContainer.TitleBg:Hide()
	end

	if input then
		S:HandleEditBox(input)
	end

	if yes_btn then
		S:HandleButton(yes_btn)
	end

	if no_btn then
		S:HandleButton(no_btn)
	end
end

local function handler()
	local module = ns.BetterBags:GetModule("Question")
	local do_skin = util.with_flag(skin, ns.api.callback("question"))

	local target, method = module._pool, "Acquire"
	if not target then
		target = module
		method = "_OnCreate"
	end

	util.post_hook(target, method, function(ctx)
		local frame = ctx.result and ctx.result[1]

		if not frame then
			return
		end

		util.lazy.try(do_skin, frame)
	end)
end

ns.skin.question = handler
