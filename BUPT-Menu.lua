local log = require("log")
local Api = require("coreApi")
local json = require("json")
local http = require("http")

function ReceiveFriendMsg(CurrentQQ, data)
	if data.FromUin ==3500673819 then--防止自我复读
		  return 1 end
	if string.find(data.Content, "BUPT咨询") == 1 or string.find(data.Content, "北邮咨询") == 1 then
		
		menu =  	"北邮咨询菜单\n"..					
		"以下命令直接发送即可，若机器人无响应请重复发送\n"..
		"1.近年各专业录取排名-分数--北邮分数\n"..
		"2.专业简要介绍--专业介绍\n"..
		"3.转专业政策--转专业\n"..
		"4.北邮保研政策--保研政策\n"..
		"5.随机校园图片--北邮图\n"
					
					luaMsg =
					    Api.Api_SendMsg(--调用发消息的接口
					    CurrentQQ,
					    {
					       toUser = data.FromUin, --回复当前消息的来源群ID
					       sendToType = 1, --2发送给群1发送给好友3私聊
					       sendMsgType = "TextMsg", --进行文本复读回复
					       groupid = 0, --不是私聊自然就为0咯
					       content = menu, --回复内容
					       atUser = 0 --是否 填上data.FromUserId就可以复读给他并@了
					    }
 
					)
	end
	return 1
end

function ReceiveGroupMsg(CurrentQQ, data)
	if data.FromUserId ==3500673819 then--防止自我复读
		  return 1 end
	
	if string.find(data.Content, "BUPT咨询") == 1 or string.find(data.Content, "北邮咨询") == 1 then
		
		menu =  	
		"北邮咨询菜单\n"..					
		"以下命令直接发送即可，若机器人无响应请重复发送\n"..
		"1.近年各专业录取排名-分数--北邮分数\n"..
		"2.专业简要介绍--专业介绍\n"..
		"3.转专业政策--转专业\n"..
		"4.北邮保研政策--保研政策\n"..
		"5.随机校园图片--北邮图\n"
					
 
luaMsg =
					    Api.Api_SendMsg(--调用发消息的接口
					    CurrentQQ,
					    {
					       toUser = data.FromGroupId, --回复当前消息的来源群ID
					       sendToType = 2, --2发送给群1发送给好友3私聊
					       sendMsgType = "TextMsg", --进行文本复读回复
					       groupid = 0, --不是私聊自然就为0咯
					       content = menu, --回复内容
					       atUser = 0 --是否 填上data.FromUserId就可以复读给他并@了
					    }
 
					)
				end
		
    return 1
end

function ReceiveEvents(CurrentQQ, data, extData)
    return 1
end
	
