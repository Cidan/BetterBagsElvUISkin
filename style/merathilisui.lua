local ns = (select(2, ...))

local function shadow_func(ms)
	return function(target)
		ms:CreateShadow(target.frame)
	end
end

local function apply()
	if not ns.blz.IsAddOnLoaded("ElvUI_MerathilisUI") then
		ns.debug("style.merathilisui: MerathilisUI is not loaded")
		return
	end

	if not _G["ElvUI_MerathilisUI"] then
		ns.debug("style.merathilisui: MerathilisUI is not loaded")
		return
	end

	local ms = _G["ElvUI_MerathilisUI"][1].Modules.Skins
	local func = shadow_func(ms)

	ns.api.register("bag", 1, func)
	ns.api.register("bag_slots", 1, func)
	ns.api.register("currency", 1, func)
	ns.api.register("question", 1, func)
end

ns.style.merathilisui = apply
