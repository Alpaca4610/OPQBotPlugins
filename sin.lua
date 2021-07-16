local log = require("log")
local Api = require("coreApi")
local json = require("json")
local http = require("http")

function ReceiveFriendMsg(CurrentQQ, data)
    return 1
end

function ReceiveGroupMsg(CurrentQQ, data)
    if data.FromUin ==3500673819 then--防止自我复读
        return 1 end
    if string.find(data.Content, "sin") == 1 or string.find(data.Content,"上号") == 1 or string.find(data.Content,"上车") == 1 then
    
    response, error_message =
			    http.request(
			    "GET",
			    "http://104.46.230.176/Imgapi/test.php"
			)
			local html = response.body
			local strJson = json.decode(html)
			local img_url = strJson["fruits"]
			
        Api.Api_SendMsg( 
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
        return 1
    end
end

function ReceiveEvents(CurrentQQ, data, extData)
    return 1
end

