local log = require("log")
local Api = require("coreApi")
local json = require("json")
local http = require("http")

function ReceiveFriendMsg(CurrentQQ, data)
    return 1
end

function ReceiveGroupMsg(CurrentQQ, data)
	if data.FromUin == 3500673819 then
        return 1 end
	if string.find(data.Content, "furry") == 1 then
			response, error_message =
			    http.request(
			  "GET",			   
			  "https://api.furry.bot/V2/furry/hug",
			   {
			   headers = {["User-Agent"] = "Mozilla/5.0 (X11; Linux armv7l) AppleWebKit/537.36 (KHTML, like Gecko) Raspbian Chromium/78.0.3904.108 Chrome/78.0.3904.108 Safari/537.36",
			             ["cookie"] =  "__cfduid=d25562a254eaad253ca0e869d721365fd1613105873; yiff=s%3AOjtPcXcjXdP6EjNXvhDLDsp7A8tiIBzJ.z%2Bp8Ci%2FwZJujWMhCdk23etQ010ACnXrUk%2BO50zoL774"
				     }
		})
			local html = response.body
			local strJson = json.decode(html)
			local img_url = tostring(strJson["images"][1]["url"])
			log.notice("the img_url is %s",img_url)
	
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
