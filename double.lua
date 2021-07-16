local log = require("log")
local Api = require("coreApi")
local json = require("json")
local http = require("http")

function ReceiveFriendMsg(CurrentQQ, data)
    return 1
end

function ReceiveGroupMsg(CurrentQQ, data)
if string.find(data.Content, "双倍快乐") == 1 then
	local randomNum = math.random(0,235)
	local path = "/home/pi/QQBot/OPQBot_6.0.6_linux_arm/Plugins/1/Image"..randomNum..".jpg"
	res = readImg(path)
	base64 = PkgCodec.EncodeBase64(res)
	
	 Api.Api_SendMsg(
		CurrentQQ,
		{
				toUser = data.FromGroupId,
				sendToType = 2,
				sendMsgType = "PicMsg",
				groupid = 0,
				content = "",
				picUrl = "",
				picBase64Buf = base64,
				fileMd5 = "",
				atUser = 0
		}
	)
	
	local randomNum = math.random(0,235)
	local path = "/home/pi/QQBot/OPQBot_6.0.6_linux_arm/Plugins/1/Image"..randomNum..".jpg"
	res = readImg(path)
	base64 = PkgCodec.EncodeBase64(res)
	
	 Api.Api_SendMsg(
		CurrentQQ,
		{
				toUser = data.FromGroupId,
				sendToType = 2,
				sendMsgType = "PicMsg",
				groupid = 0,
				content = "",
				picUrl = "",
				picBase64Buf = base64,
				fileMd5 = "",
				atUser = 0
		}
	)
	end
    return 1
end
function ReceiveEvents(CurrentQQ, data, extData)
    return 1
end
function readImg(filePath)
    local f, err = io.open(filePath, "rb")
    if err ~= nil then
        return nil, err
    end
    local content = f:read("*all")
    f:close()
    return content, err
end

