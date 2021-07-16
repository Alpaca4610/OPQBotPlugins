local log = require("log")
local Api = require("coreApi")
local json = require("json")
local http = require("http")

function ReceiveFriendMsg(CurrentQQ, data)
if data.FromUin == 3500673819 then--防止自我复读
        return 0
end
if string.find(data.Content, "poem") then
        response, error_message =
            http.request(
            "GET",
            "https://v1.jinrishici.com/all"
        )
        local html = response.body
        local str = html
		local j = json.decode(str)
            ApiRet =
                Api.Api_SendMsg(
                CurrentQQ,
                {
                    toUser = data.FromUin,
                    sendToType = 1,
                    sendMsgType = "TextMsg",
                    groupid = 0,
                    content = "“" ..j.content.. "”\n" ..j.author.. "《"..j.origin.. "》",
                    atUser = 0
                }
            )
            html = nil
            str = nil
            j = nil
            log.notice("From Lua SendMsg Ret-->%d", ApiRet.Ret)
        end
    return 1
end
function ReceiveGroupMsg(CurrentQQ, data)
    if data.FromUserId == 3500673819 then--防止自我复读
		return 1 
	end

    if string.find(data.Content, "poem") then
        response, error_message =
            http.request(
            "GET",
            "https://v1.jinrishici.com/all"
        )
        local html = response.body
        local str = html
		local j = json.decode(str)
            ApiRet =
                Api.Api_SendMsg(
                CurrentQQ,
                {
                    toUser = data.FromGroupId,
                    sendToType = 2,
                    sendMsgType = "TextMsg",
                    groupid = 0,
                    content = "“" ..j.content.. "”\n" ..j.author.. "《"..j.origin.. "》",
                    atUser = 0
                }
            )
            html = nil
            str = nil
            j = nil
            log.notice("From Lua SendMsg Ret-->%d", ApiRet.Ret)
        end
    return 1
end
