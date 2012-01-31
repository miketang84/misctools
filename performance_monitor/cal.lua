
local record_list = {
	dates = {},
	eclipses = {},
}
local date0, time_eclipse
for line in io.lines('record_data_120108_19.txt') do
	--print(line)
	date0, time_eclipse = line:match("^(%d%d%d%d%-%d%d%-%d%d %d%d:%d%d:%d%d)\t([%d%.]+)$")
	--print(date0, time_eclipse)
	if date0 and time_eclipse then
		table.insert(record_list.dates, date0)
		table.insert(record_list.eclipses, tonumber(time_eclipse))
	end
end

local sum = 0
local average = 0
for _, v in ipairs(record_list.eclipses) do
	sum = sum + v
end

local sample_num = #record_list.eclipses
average = sum / sample_num

print('sample_num:', sample_num)
print('sum:', sum, '\naverage:', average)

local fangcha = 0
local tmp0 = 0
for _, v in ipairs(record_list.eclipses) do
	tmp0 = tmp0 + (v - average)^2
end
fangcha = math.sqrt(tmp0 / sample_num)
print("fangcha:", fangcha)

local counter1 = 0
local counter2 = 0
for _, v in ipairs(record_list.eclipses) do
	if v > 2.5 then
		counter1 = counter1 + 1
	end
	
	if v > 5 then
		counter2 = counter2 + 1
	end
end
print('larger than 2.5:', counter1)
print('larger than 2.5 number 比例 %:', counter1 * 100 / sample_num )

print('larger than 5:', counter2)
print('larger than 5 number 比例 %:', counter2 * 100 / sample_num )
