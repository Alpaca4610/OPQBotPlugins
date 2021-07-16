local log = require("log")
local Api = require("coreApi")
local json = require("json")
local http = require("http")

function task1(CurrentQQ, task)
		
		groupArr = {} --在花括号中填入QQ群号，用英文逗号隔开
		len = #groupArr
		menu =  "喂！三点几嚟！做 做撚啊做！饮茶先啦！三点几饮 饮茶先啦！做咁多都冇用嘅！老细唔锡你嘅嚟！喂饮下茶先啊！三点几嚟！做碌鸠啊做！"				

for i=1, len, 1 do
					    Api.Api_SendMsg(--调用发消息的接口
					    CurrentQQ,
					    {
					       toUser = groupArr[i], --回复当前消息的来源群ID
					       sendToType = 2, --2发送给群1发送给好友3私聊
					       sendMsgType = "TextMsg", --进行文本复读回复
					       groupid = 0, --不是私聊自然就为0咯
					       content = menu, --回复内容
					       atUser = 0, --是否 填上data.FromUserId就可以复读给他并@了
					       
					    }
					)
					end
return 1;
end
