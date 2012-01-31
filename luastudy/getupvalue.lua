local xx = 100

function foo(a,b)
	local x
	do local cc = a - b end
	local func = debug.getinfo(2, 'f').func
	print('==>>', func)
	local i = 1
	while true do
		local name, value = debug.getupvalue(func, i)
		if not name then break end
		print(name, value)
		i = i + 1
	end
end

function bar(x)
	xx = 34
	local yy = 23
	print('------')
	foo(10, 20)
	local t = 10000
end

bar(40)
print('-->>', bar)
--print(_G['xx'])
