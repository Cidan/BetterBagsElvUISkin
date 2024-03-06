local ns = (select(2, ...))

local function shadow_func(ws)
	return function(target)
		ws:CreateShadow(target.frame)
	end
end

local function apply()
	if not ns.blz.IsAddOnLoaded("ElvUI_WindTools") then
		ns.debug("style.windtools: WindTools is not loaded")
		return
	end

	if not _G["WindTools"] then
		ns.debug("style.windtools: WindTools is not loaded")
		return
	end

	local ws = _G["WindTools"][1].Modules.Skins
	local func = shadow_func(ws)

	ns.api.register("bag", 1, func)
	ns.api.register("bag_slots", 1, func)
	ns.api.register("currency", 1, func)
	ns.api.register("question", 1, func)
end

ns.style.windtools = apply
