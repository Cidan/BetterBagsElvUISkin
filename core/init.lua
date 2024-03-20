local ns = (select(2, ...))
local util = ns.util
local E = unpack(ElvUI)

local dependencies = {
	"ElvUI",
	"BetterBags",
}

local dependencies_search_map = util.list_to_tbl(dependencies, function(k)
	return k, true
end)

local function disable_masque()
	if ns.BetterBags then
		local masque = ns.BetterBags:GetModule("Masque")
		masque.OnEnable = util.noop
	end
end

local function init_addon()
	ns.BetterBags = LibStub("AceAddon-3.0"):GetAddon("BetterBags")

	ns.tex_coords = { 0, 1, 0, 1 }
	local modifier = 0.04 * E.db.general.cropIcon
	for i, v in ipairs(ns.tex_coords) do
		if i % 2 == 0 then
			ns.tex_coords[i] = v - modifier
		else
			ns.tex_coords[i] = v + modifier
		end
	end
end

local _, updater = util.new_trigger(
	function(data)
		return data >= #dependencies
	end,
	function()
		init_addon()
		disable_masque()
		for _, handler in pairs(ns.skin) do
			handler()
		end
	end,
	util.list_size(util.list_filter(dependencies, function(name)
		return ns.blz.IsAddOnLoaded(name)
	end))
)

util.handle_event("PLAYER_ENTERING_WORLD", function()
	BetterBagsElvUISkinDB = util.tbl_extend("keep", BetterBagsElvUISkinDB or {}, ns.defaults)
	ns.config = setmetatable({}, {
		__index = BetterBagsElvUISkinDB,
		__newindex = BetterBagsElvUISkinDB,
	})

	if ns.config.style ~= "elvui" and ns.style[ns.config.style] then
		ns.call(ns.style[ns.config.style])()
	end

	util.lazy.set_ready()
end)

util.handle_event("ADDON_LOADED", function(_, _, addon)
	if dependencies_search_map[addon] then
		updater(function(data)
			return data + 1
		end)
	end
end)
