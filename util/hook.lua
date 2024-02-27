local ns = (select(2, ...))

local function hook(obj, method_name, pre_func, post_func, call_original)
	obj = obj or _G
	local original = obj and obj[method_name]
	if original then
		obj[method_name] = function(...)
			local ctx = {
				obj = obj,
				method = method_name,
				args = { ... },
				result = nil,
			}

			if pre_func then
				local ok, err = pcall(pre_func, ctx)
				if not ok then
					ns.error(format("Pre-hook failed. method:%s error:%s", method_name, err))
				end
			end

			if call_original then
				ctx.result = { original(...) }
			end
			if post_func then
				local ok, err = pcall(post_func, ctx)
				if not ok then
					ns.error(format("Post-hook failed. method:%s error:%s", method_name, err))
				end
			end

			return unpack(ctx.result or {})
		end
	end
end

local function post_hook(obj, method_name, post_func)
	hook(obj, method_name, nil, post_func, true)
end

local function pre_hook(obj, method_name, pre_func)
	hook(obj, method_name, pre_func, nil, true)
end

ns.util.hook = hook
ns.util.post_hook = post_hook
ns.util.pre_hook = pre_hook
