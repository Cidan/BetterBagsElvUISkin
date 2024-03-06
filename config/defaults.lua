local ns = (select(2, ...))

local plugins_style = {
	{ "ElvUI_ToxiUI", "toxiui" },
	{ "ElvUI_WindTools", "windtools" },
	{ "ElvUI_MerathilisUI", "merathilisui" },
	{ "ElvUI_BenikUI", "benikui" },
}

local defaults = {
	log_level = "error",
	transparent = true,
	cooldown = true,
	style = (function()
		for _, plugin_data in ipairs(plugins_style) do
			if ns.blz.IsAddOnLoaded(plugin_data[1]) then
				return plugin_data[2]
			end
		end
		return "elvui"
	end)(),
}

ns.defaults = defaults
