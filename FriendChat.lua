local log = require("log")
local Api = require("coreApi")
local json = require("json")
local http = require("http")

function ReceiveFriendMsg(CurrentQQ, data)
    if data.FromUin == XXXXXXXX then --防复读，XXXXXXX为机器人QQ号
        return 1 end
if string.find(data.MsgType,"PicMsg") == 1 then 
        return 1 end
        
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
               "https://openai.weixin.qq.com/openapi/sign/XXXXXXX",--XXXXXXX为你的KEY
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
               "https://openai.weixin.qq.com/openapi/aibot/XXXXXXX",--XXXXXXX为你的KEY
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
                    toUser = data.FromUin,
                    sendToType = 1,
                    sendMsgType = "TextMsg",
                    groupid = 0,
                    content = contents,               
                    atUser = 0,
                    --voiceUrl = "https://dds.dui.ai/runtime/v1/synthesize?voiceId=qianranfa&speed=0.8&volume=100&audioType=wav&text=" ..contents, --将回复的文字转成语音并听过网络Url方式发送回复语音
                    --voiceBase64Buf = "",
                    --picUrl = "",
                    --picBase64Buf = ""
            }
        )
        return 1
    end

function ReceiveGroupMsg(CurrentQQ, data)
    
    return 1
end

function ReceiveEvents(CurrentQQ, data, extData)
    return 1
end

