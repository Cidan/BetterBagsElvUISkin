local ns = select(2, ...)
local util = ns.util
local E = unpack(ElvUI)
local S = E.Skins

local function modify_script(original_obj, target_obj, event_name, callback)
	local old_script = original_obj:GetScript(event_name)

	original_obj:SetScript(event_name, function(...)
		if old_script then
			old_script(...)
		end

		if callback then
			callback(...)
		end
	end)
end

local function skin(target)
	local container = target.frame
	local searchBox = target.searchBox
	local portrait = container:GetPortrait()

	container:StripTextures(true)
	container:SetTemplate(ns.config.transparent and "Transparent")
	container.Bg:Hide()

	if container.CloseButton then
		S:HandleCloseButton(container.CloseButton)
	end

	if portrait then
		local button, hl_tex
		for _, child in pairs({ portrait:GetParent():GetChildren() }) do
			if child:GetObjectType() == "Button" then
				button = child
				break
			end
		end

		for _, region in pairs({ button:GetRegions() }) do
			if region:GetObjectType() == "Texture" then
				hl_tex = region
				break
			end
		end

		container.new_portrait = container:CreateTexture(nil, "ARTWORK")
		container.new_portrait:CreateBackdrop()
		container.new_portrait:SetSize(24, 24)
		container.new_portrait:SetPoint("TOPLEFT", 8, -8)
		container.new_portrait:SetTexture([[Interface\Icons\INV_Misc_Bag_07]])
		container.new_portrait:SetTexCoord(0.1, 0.9, 0.1, 0.9)

		button:SetParent(container)
		button:ClearAllPoints()
		button:SetAllPoints(container.new_portrait)

		local new_hl_tex = button:CreateTexture(nil, "OVERLAY")
		new_hl_tex:SetAllPoints(container.new_portrait)
		new_hl_tex:SetTexture(E.Media.Textures.White8x8)
		new_hl_tex:SetBlendMode("ADD")
		new_hl_tex:SetAlpha(0)

		modify_script(button, container.new_portrait, "OnLeave", function()
			new_hl_tex:SetAlpha(0)
		end)

		modify_script(button, container.new_portrait, "OnEnter", function()
			new_hl_tex:SetAlpha(0.2)
		end)

		hl_tex:Hide()
		hl_tex:Kill()
	end

	if searchBox then
		S:HandleEditBox(searchBox.textBox)
	end
end

local function handler()
	local module = ns.BetterBags:GetModule("BagFrame")
	local do_skin = util.with_flag(skin, ns.api.callback("bag"))

	util.post_hook(module, "Create", function(ctx)
		local frame = ctx.result and ctx.result[1]

		if not frame then
			return
		end

		util.lazy.try(do_skin, frame)
	end)
end

ns.skin.bag = handler
