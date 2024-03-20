local ns = (select(2, ...))

ns.util = {}
ns.skin = {}
ns.style = {}
ns.blz = {}

-- Compatibility
ns.blz.IsAddOnLoaded = C_AddOns and C_AddOns.IsAddOnLoaded or IsAddOnLoaded
