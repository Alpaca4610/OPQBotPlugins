local log = require("log")
local Api = require("coreApi")
local json = require("json")
local http = require("http")

function ReceiveFriendMsg(CurrentQQ, data)
    
    return 1
end

function ReceiveGroupMsg(CurrentQQ, data)
    if data.FromUin == 3500673819 then--防止自我复读
        return 1 end
    local randomNum = math.random(1,60)
    log.notice("%s",randomNum)
	if (randomNum) == 1 then
        keyWord = data.Content
        if keyWord == nil then
            return 1
        end
        
          local signPostBody, err = json.encode({
           userid = "bot"
        })

        response, error_message =
               http.request(
               "POST",
               "https://openai.weixin.qq.com/openapi/sign/XXX", --XXX为你的KEY
               {
                   headers = {
 ["Content-Type"] = "application/json",
 ["User-Agent"] = "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.163 Safari/537.36"                   
},
                   body = signPostBody
               }
           )
           
           local html1 = response.body
        local strJson1 = json.decode(html1)
        local signkey = strJson1.signature
        
        local postBody, err = json.encode({
    signature = signkey,
    query = keyWord,
})
        response, error_message =
               http.request(
               "POST",
               "https://openai.weixin.qq.com/openapi/aibot/XXX", --XXX为你的KEY
               {
                   headers = {
 ["Content-Type"] = "application/json",
 ["User-Agent"] = "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.163 Safari/537.36"                   
},
                   body = postBody
               }
           )
           
        local html = response.body
        local strJson = json.decode(html)
        local contents = strJson.answer

        Api.Api_SendMsg(
            CurrentQQ,
            {
                    toUser = data.FromGroupId,
                    sendToType = 2,
                    sendMsgType = "TextMsg",
                    groupid = 0,
                    content = contents,
                    atUser = 0,
                    --voiceUrl = "https://dds.dui.ai/runtime/v1/synthesize?voiceId=qianranfa&speed=0.8&volume=100&audioType=wav&text=" ..
                    --contents, --将回复的文字转成语音并听过网络Url方式发送回复语音
                    --voiceBase64Buf = "",
                    --picUrl = "",
                    --picBase64Buf = ""
            }
        )
        return 1
    end
end

function ReceiveEvents(CurrentQQ, data, extData)
    return 1
end

