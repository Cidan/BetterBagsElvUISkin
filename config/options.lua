local ns = (select(2, ...))
local E = unpack(ElvUI)

local localization = {
	["enUS"] = {
		["BetterBags Skin"] = "|cff5385edB|r|cff518eebe|r|cff5098e9t|r|cff4ea1e8t|r|cff4cabe6e|r|cff4ab4e4r|r|cff48bbe2B|r|cff46c2e1a|r|cff45c9dfg|r|cff43d0des|r |cff41d7ddS|r|cff41d7ddk|r|cff41d7ddi|r|cff41d7ddn|r",
		["Log Level"] = "Log Level",
		["Set the log level for BetterBags ElvUI Skin."] = "Set the log level for BetterBags ElvUI Skin.",
		["Transparent"] = "Transparent",
		["Use ElvUI transparent background for BetterBags."] = "Use ElvUI transparent background for BetterBags.",
		["ElvUI Cooldown"] = "ElvUI Cooldown",
		["Let ElvUI Cooldowns handles items in BetterBags."] = "Let ElvUI Cooldowns handles items in BetterBags.",
		["Style"] = "Style",
		["WindTools"] = "|cff5385edW|r|cff5094eai|r|cff4da4e7n|r|cff4ab4e4d|r|cff47c0e1T|r|cff44cbdfo|r|cff41d7ddo|r|cff41d7ddl|r|cff41d7dds|r",
		["Apply the style for fitting specific ElvUI plugins."] = "Apply the style for fitting specific ElvUI plugins.",
		["Reset Skin"] = "Reset Skin",
		["Reset the skin settings to default."] = "Reset the skin settings to default.",
		["Reset BetterBags"] = "Reset BetterBags",
		["Reset the BetterBags settings to default."] = "Reset the BetterBags settings to default.",
		["Are you sure you want to reset the settings to default?"] = "Are you sure you want to reset the settings to default?",
	},
	["zhCN"] = {
		["BetterBags Skin"] = "|cff5385edB|r|cff5190ebe|r|cff4f9be9t|r|cff4da6e7t|r|cff4ab1e4e|r|cff48bae2r|r|cff46c2e1B|r|cff45c9dfa|r|cff43d1deg|r|cff41d7dds|r |cff41d7dd皮|r|cff41d7dd肤|r",
		["Log Level"] = "日志等级",
		["Set the log level for BetterBags ElvUI Skin."] = "设置 BetterBags ElvUI 皮肤的日志等级。",
		["Transparent"] = "透明",
		["Use ElvUI transparent background for BetterBags."] = "使用 ElvUI 透明背景。",
		["ElvUI Cooldown"] = "ElvUI 冷却",
		["Let ElvUI Cooldowns handles items in BetterBags."] = "让 ElvUI 冷却处理 BetterBags 中的物品。",
		["Style"] = "风格",
		["WindTools"] = "|cff5385edW|r|cff5192ebi|r|cff4e9fe8n|r|cff4bace5d|r |cff49b8e3工|r|cff42d3dd具|r|cff41d7dd箱|r",
		["Apply the style for fitting specific ElvUI plugins."] = "应用特定 ElvUI 插件的风格。",
		["Reset Skin"] = "重置皮肤",
		["Reset the skin settings to default."] = "重置皮肤设置为默认。",
		["Reset BetterBags"] = "重置 BetterBags",
		["Reset the BetterBags settings to default."] = "重置 BetterBags 设置为默认。",
		["Are you sure you want to reset the settings to default?"] = "您确定要重置设置为默认吗？",
	},
	["zhTW"] = {
		["BetterBags Skin"] = "|cff5385edB|r|cff5190ebe|r|cff4f9be9t|r|cff4da6e7t|r|cff4ab1e4e|r|cff48bae2r|r|cff46c2e1B|r|cff45c9dfa|r|cff43d1deg|r|cff41d7dds|r |cff41d7dd皮|r|cff41d7dd膚|r",
		["Log Level"] = "日誌等級",
		["Set the log level for BetterBags ElvUI Skin."] = "設置 BetterBags ElvUI 皮膚的日誌等級。",
		["Transparent"] = "透明",
		["Use ElvUI transparent background for BetterBags."] = "使用 ElvUI 透明背景。",
		["ElvUI Cooldown"] = "ElvUI 冷卻",
		["Let ElvUI Cooldowns handles items in BetterBags."] = "讓 ElvUI 冷卻處理 BetterBags 中的物品。",
		["Style"] = "風格",
		["WindTools"] = "|cff5385edW|r|cff5192ebi|r|cff4e9fe8n|r|cff4bace5d|r |cff49b8e3工|r|cff42d3dd具|r|cff41d7dd箱|r",
		["Apply the style for fitting specific ElvUI plugins."] = "應用特定 ElvUI 插件的風格。",
		["Reset Skin"] = "重置皮膚",
		["Reset the skin settings to default."] = "重置皮膚設置為默認。",
		["Reset BetterBags"] = "重置 BetterBags",
		["Reset the BetterBags settings to default."] = "重置 BetterBags 設置為默認。",
		["Are you sure you want to reset the settings to default?"] = "您確定要重置設置為默認嗎？",
	},
	["koKR"] = {
		["BetterBags Skin"] = "|cff5385edB|r|cff518eebe|r|cff5098e9t|r|cff4ea1e8t|r|cff4cabe6e|r|cff4ab4e4r|r|cff48bbe2B|r|cff46c2e1a|r|cff45c9dfg|r|cff43d0des|r |cff41d7ddS|r|cff41d7ddk|r|cff41d7ddi|r|cff41d7ddn|r",
		["Log Level"] = "로그 레벨",
		["Set the log level for BetterBags ElvUI Skin."] = "BetterBags ElvUI 스킨의 로그 레벨을 설정합니다.",
		["Transparent"] = "투명",
		["Use ElvUI transparent background for BetterBags."] = "BetterBags에 ElvUI 투명 배경을 사용합니다.",
		["ElvUI Cooldown"] = "ElvUI 재사용 대기시간",
		["Let ElvUI Cooldowns handles items in BetterBags."] = "BetterBags의 항목을 ElvUI 재사용 대기시간으로 처리합니다.",
		["Style"] = "스타일",
		["WindTools"] = "|cff5385edW|r|cff5094eai|r|cff4da4e7n|r|cff4ab4e4d|r|cff47c0e1T|r|cff44cbdfo|r|cff41d7ddo|r|cff41d7ddl|r|cff41d7dds|r",
		["Apply the style for fitting specific ElvUI plugins."] = "특정 ElvUI 플러그인에 맞는 스타일을 적용합니다.",
		["Reset Skin"] = "스킨 초기화",
		["Reset the skin settings to default."] = "스킨 설정을 기본값으로 재설정합니다.",
		["Reset BetterBags"] = "BetterBags 초기화",
		["Reset the BetterBags settings to default."] = "BetterBags 설정을 기본값으로 재설정합니다.",
		["Are you sure you want to reset the settings to default?"] = "설정을 기본값으로 재설정하시겠습니까?",
	},
	["ruRU"] = {
		["BetterBags Skin"] = "|cff5385edB|r|cff518eebe|r|cff5098e9t|r|cff4ea1e8t|r|cff4cabe6e|r|cff4ab4e4r|r|cff48bbe2B|r|cff46c2e1a|r|cff45c9dfg|r|cff43d0des|r |cff41d7ddS|r|cff41d7ddk|r|cff41d7ddi|r|cff41d7ddn|r",
		["Log Level"] = "Уровень журнала",
		["Set the log level for BetterBags ElvUI Skin."] = "Установите уровень журнала для BetterBags ElvUI Skin.",
		["Transparent"] = "Прозрачный",
		["Use ElvUI transparent background for BetterBags."] = "Используйте прозрачный фон ElvUI для BetterBags.",
		["ElvUI Cooldown"] = "ElvUI Восстановление",
		["Let ElvUI Cooldowns handles items in BetterBags."] = "Позвольте ElvUI Cooldowns обрабатывать предметы в BetterBags.",
		["Style"] = "Стиль",
		["WindTools"] = "|cff5385edW|r|cff5094eai|r|cff4da4e7n|r|cff4ab4e4d|r|cff47c0e1T|r|cff44cbdfo|r|cff41d7ddo|r|cff41d7ddl|r|cff41d7dds|r",
		["Apply the style for fitting specific ElvUI plugins."] = "Примените стиль для подгонки конкретных плагинов ElvUI.",
		["Reset Skin"] = "Сбросить скин",
		["Reset the skin settings to default."] = "Сбросить настройки скина на значения по умолчанию.",
		["Reset BetterBags"] = "Сбросить BetterBags",
		["Reset the BetterBags settings to default."] = "Сбросить настройки BetterBags на значения по умолчанию.",
		["Are you sure you want to reset the settings to default?"] = "Вы уверены, что хотите сбросить настройки на значения по умолчанию?",
	},
	["deDE"] = {
		["BetterBags Skin"] = "|cff5385edB|r|cff518eebe|r|cff5098e9t|r|cff4ea1e8t|r|cff4cabe6e|r|cff4ab4e4r|r|cff48bbe2B|r|cff46c2e1a|r|cff45c9dfg|r|cff43d0des|r |cff41d7ddS|r|cff41d7ddk|r|cff41d7ddi|r|cff41d7ddn|r",
		["Log Level"] = "Log-Level",
		["Set the log level for BetterBags ElvUI Skin."] = "Legen Sie das Log-Level für BetterBags ElvUI Skin fest.",
		["Transparent"] = "Transparent",
		["Use ElvUI transparent background for BetterBags."] = "Verwenden Sie den transparenten Hintergrund von ElvUI für BetterBags.",
		["ElvUI Cooldown"] = "ElvUI Abklingzeit",
		["Let ElvUI Cooldowns handles items in BetterBags."] = "Lassen Sie ElvUI Cooldowns die Gegenstände in BetterBags behandeln.",
		["Style"] = "Stil",
		["WindTools"] = "|cff5385edW|r|cff5094eai|r|cff4da4e7n|r|cff4ab4e4d|r|cff47c0e1T|r|cff44cbdfo|r|cff41d7ddo|r|cff41d7ddl|r|cff41d7dds|r",
		["Apply the style for fitting specific ElvUI plugins."] = "Wenden Sie den Stil an, um spezifische ElvUI-Plugins anzupassen.",
		["Reset Skin"] = "Skin zurücksetzen",
		["Reset the skin settings to default."] = "Setzen Sie die Skin-Einstellungen auf die Standardeinstellungen zurück.",
		["Reset BetterBags"] = "BetterBags zurücksetzen",
		["Reset the BetterBags settings to default."] = "Setzen Sie die BetterBags-Einstellungen auf die Standardeinstellungen zurück.",
		["Are you sure you want to reset the settings to default?"] = "Möchten Sie die Einstellungen wirklich auf die Standardeinstellungen zurücksetzen?",
	},
}

E.Libs.EP:RegisterPlugin("BetterBagsElvUISkin", function()
	local l = setmetatable({}, {
		__index = function(_, k)
			local lang_db = localization[E.global.general.locale] or localization.enUS
			return lang_db and lang_db[k] or k
		end,
	})

	local icon = "|TInterface/Addons/BetterBagsElvUISkin/media/icon.png:14:14:0:0:64:64:5:59:5:59|t "

	E.Options.args.BetterBagsSkin = {
		type = "group",
		childGroups = "tree",
		name = icon .. l["BetterBags Skin"],
		get = function(info)
			return ns.config[info[#info]]
		end,
		set = function(info, value)
			ns.config[info[#info]] = value
			E:StaticPopup_Show("PRIVATE_RL")
		end,
		args = {
			style = {
				order = 1,
				type = "select",
				name = l["Style"],
				desc = l["Apply the style for fitting specific ElvUI plugins."],
				values = {
					elvui = "ElvUI",
					windtools = l["WindTools"],
					benikui = "|cff00c0faBenikUI|r",
					merathilisui = "|cffffffffMerathilis|r|cffff7d0aUI|r",
					toxiui = "|cffffffffToxi|r|cff18a8ffUI|r",
				},
			},
			transparent = {
				order = 2,
				type = "toggle",
				name = l["Transparent"],
				desc = l["Use ElvUI transparent background for BetterBags."],
			},
			cooldown = {
				order = 3,
				type = "toggle",
				name = l["ElvUI Cooldown"],
				desc = l["Let ElvUI Cooldowns handles items in BetterBags."],
			},
			log_level = {
				order = 4,
				type = "select",
				name = l["Log Level"],
				desc = l["Set the log level for BetterBags ElvUI Skin."],
				values = {
					debug = "DEBUG",
					info = "INFO",
					warn = "WARN",
					error = "ERROR",
				},
			},
			reset_skin = {
				order = 5,
				type = "execute",
				name = "|cffff0000" .. l["Reset Skin"] .. "|r",
				desc = l["Reset the skin settings to default."],
				confirm = function()
					return l["Are you sure you want to reset the settings to default?"]
				end,
				func = function()
					BetterBagsElvUISkinDB = nil
					ReloadUI()
				end,
			},
			reset_betterbags = {
				order = 6,
				type = "execute",
				name = "|cffff0000" .. l["Reset BetterBags"] .. "|r",
				desc = l["Reset the BetterBags settings to default."],
				confirm = function()
					return l["Are you sure you want to reset the settings to default?"]
				end,
				func = function()
					BetterBagsDB = nil
					ReloadUI()
				end,
			},
		},
	}
end)
