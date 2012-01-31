#!/usr/bin/env lua

require"lfs"
require 'gd'

local max_width = 400
local max_height = 300



function guessPhotoFormat(path)
	local im_src
	local name, ext = path:match('(.+)%.(%w+)$')
	
	ext = ext:lower()
	if ext == 'jpg' or ext == 'jpeg' then 
		im_src = gd.createFromJpeg(path)
	elseif ext == 'png' then
		im_src = gd.createFromPng(path)
	elseif ext == 'gif' then
		im_src = gd.createFromGif(path)
	end
	
	return im_src
end

function scale(path)
	local im_src = guessPhotoFormat(path)
	local im_des
	local keep = false
	local w, h = im_src:sizeXY()
	
	local wr = w / max_width
	local hr = h / max_height
	
	if w <= max_width and h <= max_height then
		keep = true
	end
	
	local nw, nh
	if keep then
		im_des = gd.createTrueColor(w, h)
		im_des:copyResampled(im_src, 0, 0, 0, 0, w, h, w, h)
	else
		if wr > hr then
			-- by width scale
			nw = max_width
			nh = nw * h / w
			im_des = gd.createTrueColor(nw, nh)
		elseif wr < hr then
			-- by height scale
			nh = max_height
			nw = nh * w / h
			im_des = gd.createTrueColor(nw, nh)
		end
		im_des:copyResampled(im_src, 0, 0, 0, 0, nw, nh, w, h)
	end

	-- 分离文件的文件名和扩展名
	local newpath = path
	local dir_path, file_path = newpath:match('^(.+)/(.+)$')
	file_path = 'thumb_' .. file_path
	newpath = dir_path .. '_new' .. '/' .. file_path
	print('-->', newpath)
	-- 存储文件到磁盘上
	im_des:png(newpath)
	
	return true
end

function iterdir (path)
	lfs.mkdir(path .. '_new')
    for file in lfs.dir(path) do
        if file ~= "." and file ~= ".." then
            local f = path..'/'..file
            print ("\t "..f)
            local attr = lfs.attributes (f)
            assert (type(attr) == "table")
            if attr.mode == "directory" then
                iterdir (f)
            else
                scale(f)
            end
        end
    end
end

local dest_dir = arg[1]
if lfs.attributes(dest_dir).mode ~= 'directory' then error('Wrong directory.') end

if dest_dir:sub(-1, -1) == '/' then
	dest_dir = dest_dir:sub(1, -2)
end

iterdir (dest_dir)
