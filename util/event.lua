local ns = (select(2, ...))

local M = CreateFrame("Frame")

local handlers = {}

M:SetScript(
    "OnEvent",
    function(self, event, ...)
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
    end
)

function M.add_handler(event, handler)
    if not handlers[event] then
        M:RegisterEvent(event)
    end

    if not handlers[event] then
        handlers[event] = {}
    end

    tinsert(handlers[event], handler)
end

ns.util.event = M
