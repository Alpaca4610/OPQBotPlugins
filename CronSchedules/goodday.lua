local log = require("log")
local Api = require("coreApi")
local json = require("json")
local http = require("http")

function task1(CurrentQQ, task)
		
		groupArr = {} --在花括号中填入QQ群号，用英文逗号隔开
		len1 = #groupArr
		
		UserArr = {} --在花括号中填入QQ号，用英文逗号隔开
		len2 = #UserArr

for i=1, len1, 1 do
					    Api.Api_SendMsg(--调用发消息的接口
					    CurrentQQ,
					    {
					       toUser = groupArr[i], --回复当前消息的来源群ID
					       sendToType = 2, --2发送给群1发送给好友3私聊
					       sendMsgType = "PicMsg", --进行文本复读回复
					       groupid = 0, --不是私聊自然就为0咯
					       content = "早安", --回复内容
					       atUser = 0, --是否 填上data.FromUserId就可以复读给他并@了
					       picUrl = "https://api.xingzhige.com/API/60s/api.php"
					    }
					)
					end
					
					for i=1, len2, 1 do
					Api.Api_SendMsg(--调用发消息的接口
					    CurrentQQ,
					    {
					       toUser = UserArr[i], --回复当前消息的来源群ID
					       sendToType = 1, --2发送给群1发送给好友3私聊
					       sendMsgType = "PicMsg", --进行文本复读回复
					       groupid = 0, --不是私聊自然就为0咯
					       content = "早安", --回复内容
					       atUser = 0, --是否 填上data.FromUserId就可以复读给他并@了
					       picUrl = "https://api.xingzhige.com/API/60s/api.php"
					    }
					)
					end
return 1;
end
