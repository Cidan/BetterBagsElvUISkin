local ns = (select(2, ...))

local M = {}

local ready = false
local lazy_list = {}

function M.set_ready()
	ready = true
	ns.debug("lazy: ready")
	ns.debug("lazy: start to execute, num:", #lazy_list)

	for _, f in ipairs(lazy_list) do
		ns.util.delay(ns.call(f[1]), unpack(f[2]))
	end

	ns.debug("lazy: done")
end

function M.try(f, ...)
	if ready then
		ns.util.delay(ns.call(f), ...)
	else
		ns.debug("lazy: queue")
		table.insert(lazy_list, { f, { ... } })
	end
end

ns.util.lazy = M
