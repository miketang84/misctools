#!/usr/bin/env lua

require 'socket'

local host = "www.xstfcyy.com"
local file = "/"


local fd = io.open('/dev/null', 'w')


function monitor()
	local t1 = socket.gettime()
	local c = assert(socket.connect(host, 80))
	c:send("GET " .. file .. " HTTP/1.0\r\n\r\n")

	while true do
		local s, status, partial = c:receive(2^10)
		fd:write(s or partial)
		if status == "closed" then break end

	end

	local t2 = socket.gettime()
	local record_file = io.open('record_data.txt', 'a')
	print(os.date("%Y-%m-%d %H:%M:%S", t1) .. '\t' .. tostring(t2 - t1))
	record_file:write(os.date("%Y-%m-%d %H:%M:%S", t1) .. '\t' .. tostring(t2 - t1) .. '\n')
	record_file:close()	

	c:close()
	socket.sleep(2)
end

while true do
	local ret, err = pcall(monitor)
end



fd:close()

print("\nOK")
