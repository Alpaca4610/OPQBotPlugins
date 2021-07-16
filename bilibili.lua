local log = require("log")
local Api = require("coreApi")
local json = require("json")
local http = require("http")

function ReceiveFriendMsg(CurrentQQ, data)
	if data.FromUin ==3500673819 then--防止自我复读
        return 1 end
		if string.find(data.Content, "B站封面解析") == 1 then --判断一下所接收的消息里是否含有复读机字样 有则进行处理
        keyWord = data.Content:gsub("B站封面解析", "") --提取关键词 保存到keyWord里
				keyWord = keyWord:gsub(" ", "") --去除空格
				log.notice("keyWord-->%s",keyWord)
		if keyWord == "" then
							return 1
					end
    response, error_message =
        http.request(
        "GET",
        "https://v1.alapi.cn/api/bbcover",
        {
            query = "？c=" ..
                keyWord,
            headers = {
                Accept = "*/*"
            }
        }
    )
    local html = response.body
    local j = json.decode(html)
    local img_url = j.data.cover
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
		if string.find(data.Content, "B站封面解析") == 1 then --判断一下所接收的消息里是否含有复读机字样 有则进行处理
        keyWord = data.Content:gsub("B站封面解析", "") --提取关键词 保存到keyWord里
				keyWord = keyWord:gsub(" ", "") --去除空格
				log.notice("keyWord-->%s",keyWord)
		if keyWord == "" then
							return 1
					end
    response, error_message =
        http.request(
        "GET",
        "https://v1.alapi.cn/api/bbcover?c="..keyWord
    )
    local html = response.body
    local j = json.decode(html)
    local img_url = j.data.cover
    
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
