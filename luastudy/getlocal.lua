xx = 100

function foo(a,b)
	local x
	do local cc = a - b end
	local i = 1
	while true do
		local name, value = debug.getlocal(1, i)
		if not name then break end
		print(name, value)
		i = i + 1
	end
end

foo(10, 20)