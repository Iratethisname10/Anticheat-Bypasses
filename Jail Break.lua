local network

for _, v in next, getgc(true) do
	if typeof(v) == "table" then
		if rawget(v, "FireServer") then
			network = v
		end
	end
end

local old = getupvalue(network.FireServer, 1)
local bypassed = false

setupvalue(network.FireServer, 1, function(fireId, ...)
	local args = {...}

	if #args == 2 and args[2] == false and not bypassed then
		bypassed = true
		return
	end

	return old(fireId, ...)
end)
