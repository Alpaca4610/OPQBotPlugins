local log = require("log")
local Api = require("coreApi")
local json = require("json")
local http = require("http")

function ReceiveFriendMsg(CurrentQQ, data)
    if string.find(data.Content, "唱歌") == 1 then
        local keyWord = data.Content:gsub("唱歌", "");
        local w = "https://api.xingzhige.com/API/cg/api.php?msg=" .. keyWord ..
                      "&n=1";
        response, error_message = http.request("GET", w, {
            headers = {
                ["Content-Type"] = "application/json",
                ["User-Agent"] = "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.163 Safari/537.36"
            }
        })

        local html = response.body

        Api.Api_SendMsg(CurrentQQ, {
            toUser = data.FromUin,
            sendToType = 1,
            sendMsgType = "VoiceMsg",
            groupid = 0,
            content = "",
            atUser = 0,
            picBase64Buf = "",
            voiceUrl = html, -- 将回复的文字转成语音并听过网络Url方式发送回复语音
            voiceBase64Buf = ""
            -- picUrl = "",
            -- picBase64Buf = ""
        })

    end
    return 1
end

function ReceiveGroupMsg(CurrentQQ, data)
    if data.FromUin == 3500673819 then -- 防止自我复读
        return 1
    end -- 防止自我复读

    if string.find(data.Content, "唱歌") == 1 then
        local keyWord = data.Content:gsub("唱歌", "");
        local w = "https://api.xingzhige.com/API/cg/api.php?msg=" .. keyWord ..
                      "&n=1";
        response, error_message = http.request("GET", w, {
            headers = {
                ["Content-Type"] = "application/json",
                ["User-Agent"] = "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.163 Safari/537.36"
            }
        })

        local html = response.body

        Api.Api_SendMsg(CurrentQQ, {
            toUser = data.FromGroupId,
            sendToType = 2,
            sendMsgType = "VoiceMsg",
            groupid = 0,
            content = "",
            atUser = 0,
            picBase64Buf = "",
            voiceUrl = html, -- 将回复的文字转成语音并听过网络Url方式发送回复语音
            voiceBase64Buf = ""
            -- picUrl = "",
            -- picBase64Buf = ""
        })

    end
end

function ReceiveEvents(CurrentQQ, data, extData) return 1 end

