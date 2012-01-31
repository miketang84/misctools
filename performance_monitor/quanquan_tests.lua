local testing = require 'bamboo.testing'  
local json = require 'json'
  
  context("quanquan Testing", 
		  function()  
			  context("interaction", 
					  function() 
						  local tester = testing.browser("tester")  
						  local group_id = 17

						  test("login", 
							   function() 
								   local ret = tester:ajaxPost("/quanuser/login", {tel=11111111111, password='1BBD886460827015E5D605ED44252251'}) 
								   ptable(ret) 
								   assert_true(ret.success)
								   assert_not_blank(ret.user_id)
								   assert_not_blank(ret.username)
						   end)

						  test("update",
							   function()
								   local ret = tester:ajaxPost("/quanuser/update", {curnotice='我是顾锋'})
								   assert_true(ret.success)
						   end)

						  test("changepassword",
							   function()
								   local ret = tester:ajaxPost("/quanuser/updatepassword", {old_password='1BBD886460827015E5D605ED44252251', new_password='1BBD886460827015E5D605ED44252251'})
								   ptable(ret)
								   assert_true(ret.success)
						   end)
						  test("other's info",
							   function()
								   local ret = tester:ajaxPost("/quanuser/info", {user_id=3})
								   ptable(ret.user)
								   assert_true(ret.success)
						   end)
						  test("my info",
							   function()
								   local ret = tester:ajaxPost("/quanuser/info", {user_id=1})
								   ptable(ret)
								   assert_true(ret.success)
						   end)
						  test("briefinfo",
							   function()
								   local ret = tester:ajaxPost("/quanuser/briefinfo", {user_id=1})
								   ptable(ret)
								   assert_true(ret.success)
						   end)
						  test("invitedfriend",
							   function()
								   local ret = tester:ajaxPost("/quanuser/invitedfriend", {telephone=18888888888})
								   assert_true(ret.success)
						   end)
						  test("getcuruser",
							   function()
								   local ret = tester:ajaxPost("/quanuser/getcuruser")
								   assert_true(ret.success)
								   assert_not_blank(ret.user_id)
						   end)
						  test("getgroups",
							   function()
								   local ret = tester:ajaxPost("/quanuser/getgroups", {user_id=1})
								   assert_true(ret.success)
								   assert_not_empty(ret.groups)
						   end)
						  test("setnickname",
							   function()
								   local ret = tester:ajaxPost("/quanuser/setnickname", {user_id=5, nickname='唐刚'})
								   -- ptable(ret)
								   assert_true(ret.success)
						   end)
						  test("uploadcontacts",
							   function()
								   local ret = tester:ajaxPost("/quanuser/uploadcontacts", {telephone="533,433,633,18980880032", nickname="道哥,young,llp,guzong"})
								   assert_true(ret.success)
								   ret = tester:ajaxPost("/quanuser/uploadcontacts", {telephone="533", nickname="道哥！！"})
								   assert_true(ret.success)
						   end)
						  test("addclass",
							   function()
								   local ret = tester:ajaxPost("/quanuser/addclass", {classname="math", day="mon", time=1, teacher="windkoo", address="ruc"})
								   assert_true(ret.success)
						   end)
						  test("updateclass",
							   function()
								   local ret = tester:ajaxPost("/quanuser/updateclass", {classname="english", day="mon", time=1, teacher="windkoo1", address="ruc1"})
								   assert_true(ret.success)
						   end)
						  test("getclass",
							   function()
								   local ret = tester:ajaxPost("/quanuser/getclass")
								   ptable(ret.classes)
								   assert_true(ret.success)
								   assert_not_empty(ret.classes)
						   end)
						  test("getcourse",
							   function()
								   local ret = tester:ajaxPost("/quanuser/getcourse", {day=1})
								   ptable(ret.courses)
								   assert_true(ret.success)
								   assert_not_empty(ret.courses)
						   end)					   
						  test("classinfo",
							   function()
								   local ret = tester:ajaxPost("/quanuser/classinfo", {day="mon", time=1})
								   assert_true(ret.success)
								   assert_not_empty(ret.class)
						   end)
						  test("delclass",
							   function()
								   local ret = tester:ajaxPost("/quanuser/delclass", {day="mon", time=1})
								   assert_true(ret.success)
						   end)

						  



						  


						  test('creategroup',
						  	   function()
						  		   local ret = tester:ajaxPost('/quangroup/create', {name='新建的测试群'})
						  		   assert_true(ret.success)
						  		   assert_not_blank(ret.group_id)
						  		   group_id = ret.group_id
						   end)
						  test('addmember',
							   function()
								   local ret = tester:ajaxPost('/quangroup/addmember', {group_id=group_id, user_id=5})
								   assert_true(ret.success)
						   end)
						  test('groupinfo',
							   function()
								   print(group_id)
								   local ret = tester:ajaxPost('/quangroup/info', {group_id=group_id})
								   assert_true(ret.success)
								   assert_not_empty(ret.group)
								   assert_not_empty(ret.group.users)
								   -- ptable(ret)
						   end)
						  test('groupupdate',
							   function()
								   local ret = tester:ajaxPost('/quangroup/update', {group_id=group_id, curnotice='公告', category='同学群'})
								   assert_true(ret.success)
						   end)
						  test('addadmin',
							   function()
								   local ret = tester:ajaxPost('/quangroup/addadmin', {group_id=group_id, user_id=5})
								   ptable(ret)
								   assert_true(ret.success)
						   end)
						  test('deladmin',
							   function()
								   local ret = tester:ajaxPost('/quangroup/deladmin', {group_id=group_id, user_id=5})
								   assert_true(ret.success)
						   end)
						  test('delmember',
							   function()
								   local ret = tester:ajaxPost('/quangroup/delmember', {group_id=group_id, user_id=5})
								   assert_true(ret.success)
						   end)
						  test('useringroup',
							   function()
								   local ret = tester:ajaxPost('/quangroup/useringroup', {group_id=1,user_id=1})
								   assert_true(ret.success)
								   ret = tester:ajaxPost('/quangroup/useringroup', {group_id=1,user_id=7775})
								   assert_false(ret.success)
						   end)
						  test('dissolve',
						  	   function()
						  		   local ret = tester:ajaxPost('/quangroup/dissolve', {group_id = group_id})
						  		   assert_true(ret.success)
						   end)


				  end)  
	  end)  
  
