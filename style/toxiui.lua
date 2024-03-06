local ns = (select(2, ...))

local function wt_shadow_func(ws)
	return function(target)
		ws:CreateShadow(target.frame)
	end
end

local function toxi_shadow_func(ts)
	return function(target)
		if ts.db and ts.db.shadowEnabled then
			target.frame:TXCreateSoftShadow(ts.db.shadowSize, ts.db.shadowAlpha)
		end
	end
end

local function apply()
	local func

	if ns.blz.IsAddOnLoaded("ElvUI_WindTools") then
		local ws = _G["WindTools"][1].Modules.Skins
		func = wt_shadow_func(ws)
	else
		if not _G["ElvUI_ToxiUI"] then
			ns.debug("style.toxiui: ToxiUI is not loaded")
			return
		end

		local ts = _G["ElvUI_ToxiUI"][1]:GetModule("Theme")
		func = toxi_shadow_func(ts)
	end

	ns.api.register("bag", 1, func)
	ns.api.register("bag_slots", 1, func)
	ns.api.register("currency", 1, func)
	ns.api.register("question", 1, func)
end

ns.style.toxiui = apply
