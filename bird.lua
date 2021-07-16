local log = require("log")
local Api = require("coreApi")
local json = require("json")
local http = require("http")

function ReceiveFriendMsg(CurrentQQ, data)
	if data.FromUin ==3500673819 then--防止自我复读
		return 1 end
	if string.find(data.Content, "bird") == 1 then
			response, error_message =
			    http.request(
			    "GET",
			    "https://api.furry.bot/V2/animals/birb"	
			)			
			local html = response.body
			local strJson = json.decode(html)
			--local f,l = string.find(html,"url":")
			local temp = tostring(strJson["images"][1]["url"])
			local temp1 = temp
			local img_url = temp1
			log.notice("the img_url is %s",temp)
	
	    luaPic =
	        Api.Api_SendMsg(--调用发消息的接口
	        CurrentQQ,
	         {
								toUser = data.FromUin, --回复当前消息的来源群ID
								sendToType = 1, --2发送给群1发送给好友3私聊
								groupid = 0, --不是私聊自然就为0咯
								atUser = 0, --是否 填上data.FromUserId就可以复读给他并@了
								sendMsgType = "PicMsg",
								content = "",
								picUrl = img_url,
								picBase64Buf = "",
								fileMd5 = ""
						}
	    )
	end
    return 1
end

function ReceiveGroupMsg(CurrentQQ, data)
	if data.FromUin ==3500673819 then--防止自我复读
		return 1 end
	if string.find(data.Content, "bird") == 1 then
			response, error_message =
			    http.request(
			    "GET",
			    "https://api.furry.bot/V2/animals/birb"	
			)			
			local html = response.body
			local strJson = json.decode(html)
			--local f,l = string.find(html,"url":")
			local temp = tostring(strJson["images"][1]["url"])
			local temp1 = temp
			local img_url = temp1
			log.notice("the img_url is %s",temp)
	
	    luaPic =
	        Api.Api_SendMsg(--调用发消息的接口
	        CurrentQQ,
	         {
								toUser = data.FromGroupId, --回复当前消息的来源群ID
								sendToType = 2, --2发送给群1发送给好友3私聊
								groupid = 0, --不是私聊自然就为0咯
								atUser = 0, --是否 填上data.FromUserId就可以复读给他并@了
								sendMsgType = "PicMsg",
								content = "",
								picUrl = img_url,
								picBase64Buf = "",
								fileMd5 = ""
						}
	    )
	end
    return 1
end

function ReceiveEvents(CurrentQQ, data, extData)
    
    return 1
end
