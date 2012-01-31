local xx = 100

function foo(a,b)
	local x
	do local cc = a - b end
	local i = 1
	while true do
		local name, value = debug.getlocal(2, i)
		if not name then break end
		print(name, value)
		i = i + 1
	end
end

function bar(x)
	local xx = 34
	local yy = 23
	print('------')
	foo(10, 20)
	local t = 10000
end

bar(40)
print('-->>', bar)
--print(_G['xx'])
