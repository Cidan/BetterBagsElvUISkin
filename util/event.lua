local ns = (select(2, ...))

local f = CreateFrame("Frame")

local handlers = {}

f:SetScript("OnEvent", function(_, event, ...)
	if handlers[event] then
		local event_handlers = handlers[event]
		if type(event_handlers) == "function" then
			event_handlers(...)
			return
		elseif type(event_handlers) == "table" then
			for _, handler in ipairs(event_handlers) do
				handler(...)
			end
		end
	end
end)

local function handle_event(event, handler)
	if not handlers[event] then
		f:RegisterEvent(event)
	end

	if not handlers[event] then
		handlers[event] = {}
	end

	table.insert(handlers[event], handler)
end

ns.util.handle_event = handle_event
