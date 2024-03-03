local ns = select(2, ...)
local util = ns.util
local E = unpack(ElvUI)
local S = E.Skins

local function skin(target)
	local container = target.frame

	container:StripTextures(true)
	container:SetTemplate(ns.config.transparent and "Transparent")
	container.Bg:Hide()

	if container.CloseButton then
		S:HandleCloseButton(container.CloseButton)
	end

	if target.searchBox then
		S:HandleEditBox(target.searchBox.textBox)
	end

	container.new_portrait = container:CreateTexture(nil, "ARTWORK")
	container.new_portrait:CreateBackdrop()
	container.new_portrait:SetSize(24, 24)
	container.new_portrait:SetPoint("TOPLEFT", 8, -8)
	container.new_portrait:SetTexture([[Interface\Icons\INV_Misc_Bag_07]])
	container.new_portrait:SetTexCoord(0.1, 0.9, 0.1, 0.9)

	local new_hl_tex = container:CreateTexture(nil, "OVERLAY")
	new_hl_tex:SetAllPoints(container.new_portrait)
	new_hl_tex:SetTexture(E.Media.Textures.White8x8)
	new_hl_tex:SetBlendMode("ADD")
	new_hl_tex:SetAlpha(0)

	local handle_btn = function(button)
		button:SetParent(container)
		button:ClearAllPoints()
		button:SetAllPoints(container.new_portrait)

		local on_enter = button:GetScript("OnEnter")
		button:SetScript("OnEnter", function(...)
			on_enter(...)
			new_hl_tex:SetAlpha(0.2)
		end)

		local on_leave = button:GetScript("OnLeave")

		button:SetScript("OnLeave", function(...)
			on_leave(...)
			new_hl_tex:SetAlpha(0)
		end)
	end

	if container.GetPortrait then
		-- Retail
		for _, child in pairs({ container:GetPortrait():GetParent():GetChildren() }) do
			if child:GetObjectType() == "Button" then
				handle_btn(child)
				for _, region in pairs({ child:GetRegions() }) do
					if region:GetObjectType() == "Texture" then
						region:Hide()
						region:Kill()
						break
					end
				end
				break
			end
		end
	else
		-- Classic
		for _, child in pairs({ container:GetChildren() }) do
			if child:GetObjectType() == "Button" and child:GetNumPoints() == 1 and child:GetPoint(1) == "CENTER" then
				handle_btn(child)
				break
			end
		end
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
