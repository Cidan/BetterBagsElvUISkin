local ns = select(2, ...)
local util = ns.util
local E = unpack(ElvUI)

local function skin(target)
	local button = target.frame

	button:SetTemplate(ns.config.transparent and "Transparent")
	button:StyleButton()

	button.SetBackdrop = ns.noop
	button.SetBackdropColor = ns.noop

	if button.ItemSlotBackground then
		button.ItemSlotBackground:SetAlpha(0)
	end

	button:GetNormalTexture():SetAlpha(0)
	button:SetHighlightTexture(E.Media.Textures.White8x8)
	button:GetHighlightTexture():SetVertexColor(1, 1, 1, 0.3)
	button:SetPushedTexture(E.Media.Textures.White8x8)
	button:GetPushedTexture():SetVertexColor(1, 1, 1, 0.3)

	button.searchOverlay:SetColorTexture(0, 0, 0, 0.8)

	local update_border_color = button.SetBackdropBorderColor
	button.SetBackdropBorderColor = ns.noop

	button.icon:SetTexCoord(unpack(ns.tex_coords))
	button.icon:SetInside()

	if button.IconTexture and button.IconTexture:GetObjectType() == "Texture" then
		local setTexture = button.IconTexture.SetTexture
		button.IconTexture:SetTexCoord(unpack(ns.tex_coords))
		button.IconTexture.SetTexCoord = ns.noop
		hooksecurefunc(button.IconTexture, "SetTexture", function(texture, path)
			if texture and path and path == [[Interface\BUTTONS\UI-EmptySlot]] then
				setTexture(texture, "")
			end
		end)
	end

	if button.IconBorder then
		button.IconBorder:SetTexture("")
		button.IconBorder.SetTexture = ns.noop
		button.IconBorder:Hide()
		button.IconBorder.Show = ns.noop
		button.IconBorder.SetShown = ns.noop

		hooksecurefunc(button.IconBorder, "SetVertexColor", function(tex)
			local r, g, b, a = tex:GetVertexColor()
			if not (r == 1 and g == 1 and b == 1) then
				update_border_color(button, r, g, b, a)
			else
				update_border_color(button, unpack(E.media.bordercolor))
			end
		end)

		hooksecurefunc(button.IconBorder, "SetShown", function(_, isShown)
			if not isShown then
				update_border_color(button, unpack(E.media.bordercolor))
			end
		end)

		hooksecurefunc(button.IconBorder, "Hide", function()
			update_border_color(button, unpack(E.media.bordercolor))
		end)
	end
end

local function handler()
	local module = ns.BetterBags:GetModule("BagButton")
	local do_skin = util.with_flag(skin, ns.api.callback("bag_button"))

	if module._pool and module._pool.EnumerateActive and module._pool.EnumerateActive then
		for _, frame in module._pool:EnumerateActive() do
			util.lazy.try(do_skin, frame)
		end

		for _, frame in module._pool:EnumerateInactive() do
			util.lazy.try(do_skin, frame)
		end
	end

	util.post_hook(module, "Create", function(ctx)
		local frame = ctx.result and ctx.result[1]
		if not frame then
			return
		end

		util.lazy.try(do_skin, frame)
	end)
end

ns.skin.bag_button = handler
