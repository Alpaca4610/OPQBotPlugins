local log = require("log")
local Api = require("coreApi")
local json = require("json")
local http = require("http")

local img_url = "https://api.r10086.com/P站系列4.php"
function ReceiveFriendMsg(CurrentQQ, data)
    if data.FromUin ==3500673819 then--防止自我复读
        return 1 end
    if string.find(data.Content, "pixiv") == 1 then
        Api.Api_SendMsg( 
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
    if data.FromUserId == 810212113 then--防止自我复读
        return 1 end
    if string.find(data.Content, "pixiv") == 1 then
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

