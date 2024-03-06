local ns = (select(2, ...))

local function apply()
	if not ns.blz.IsAddOnLoaded("ElvUI_BenikUI") then
		ns.debug("style.benikui: BenikUI is not loaded")
		return
	end

	if not _G["ElvUI_BenikUI"] then
		ns.debug("style.benikui: BenikUI is not loaded")
		return
	end

	local func = function(target)
		target.frame:CreateSoftShadow()
		target.frame:BuiStyle("Outside")
	end

	ns.api.register("bag", 1, func)
	ns.api.register("bag_slots", 1, func)
	ns.api.register("currency", 1, func)
	ns.api.register("question", 1, func)
end

ns.style.benikui = apply
