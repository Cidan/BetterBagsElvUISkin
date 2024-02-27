local ns = (select(2, ...))

local function list_extend(list, ...)
	for _, other in ipairs({ ... }) do
		for _, item in ipairs(other) do
			table.insert(list, item)
		end
	end
	return list
end

local function list_filter(list, func)
	local result = {}
	for _, item in ipairs(list) do
		if func(item) then
			table.insert(result, item)
		end
	end
	return result
end

local function list_map(list, func)
	local result = {}
	for _, item in ipairs(list) do
		table.insert(result, func(item))
	end
	return result
end

local function list_size(list)
	return #list
end

local function list_to_tbl(list, func)
	local result = {}
	for _, item in ipairs(list) do
		local k, v = func(item)
		result[k] = v
	end
	return result
end

-- mode: "keep", "force"
local function tbl_extend(mode, ...)
	local result = {}
	local tbls = { ... }
	if #tbls == 0 then
		return result
	end
	if #tbls == 1 then
		return tbls[1]
	end
	for _, tbl in ipairs(tbls) do
		for k, v in pairs(tbl) do
			if result[k] == nil or mode == "force" then
				result[k] = v
			end
		end
	end
	return result
end

local function inspect(tbl, depth, indent, level)
	depth = depth ~= nil and depth or 1 -- where to end the recursion
	indent = indent ~= nil and indent or 2
	level = level ~= nil and level or 1

	if depth == 0 then
		return "{...}"
	end

	local lines = {}

	for k, v in pairs(tbl) do
		local line = string.rep(" ", indent * level) .. k .. " = "
		if type(v) == "table" then
			line = line .. inspect(v, depth - 1, indent, level + 1)
		elseif type(v) == "string" then
			line = line .. '"' .. v .. '"'
		else
			line = line .. tostring(v)
		end
		table.insert(lines, line)
	end

	if #lines == 0 then
		return "{}"
	end

	return "{\n" .. table.concat(lines, ",\n") .. "\n" .. string.rep(" ", indent * (level - 1)) .. "}"
end

ns.util.list_extend = list_extend
ns.util.list_filter = list_filter
ns.util.list_map = list_map
ns.util.list_to_tbl = list_to_tbl
ns.util.list_size = list_size
ns.util.tbl_extend = tbl_extend
ns.util.inspect = inspect
