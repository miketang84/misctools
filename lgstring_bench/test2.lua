local socket = require 'socket'
local lgstring = require 'lgstring'

local t1 = socket.gettime()

local tmpl = "ffffffff{{ fdsfsdf fdsfs fdsfds f}}fffnklfsdlks{{fsdfsdfsdffsdf fdsfsdf }}dlvdlvlxcvmxclv{%fdsf fdsfsdfd%}mcxlnvclkvndklvfsdfjsdofjewriojetgijregjrfgfdlgj{fdsfsdfsdfsdfds}fdkgjdflvm{{dsf sfdfd}}lcbmlf{^ fdsfsd fsdf ffdf^}bdfbjdofigjdgjfdklvgj{{fsdfsdfsdfsf}}lfvdlvjfdlvmlxkm{{fsdfsdfsdfsfddsf}}vclvmclmvclbcvb;dbmdflkvbdflkvdfklvdfvfdvnfdlvgkfdkgfdklggggggggggggggggggggggggggggggggggggggggggggggggggggddddddddddd"


local code = {'local _result, _children = {}, {}\n'}

local text, block

for i=1, 10000 do

--for text, block in tmpl:gmatch("([^{]-)(%b{})") do
for text, block in lgstring.matchtagset(tmpl) do
	--local act = VIEW_ACTIONS[block:sub(1,2)]

	if act then
		code[#code+1] =  '_result[#_result+1] = [==[' .. text .. ']==]'
		--code[#code+1] = act(block:sub(3,-3))
	elseif #block > 2 then
		code[#code+1] = '_result[#_result+1] = [==[' .. text .. block .. ']==]'
	else
		code[#code+1] =  '_result[#_result+1] = [==[' .. text .. ']==]'
	end
end

code[#code+1] = 'return table.concat(_result)'

end

local t2 = socket.gettime()

print(t2 - t1)