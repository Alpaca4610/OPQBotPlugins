local log = require("log")
local Api = require("coreApi")
local json = require("json")
local http = require("http")

local img_url = "BUPT/2019"
function ReceiveFriendMsg(CurrentQQ, data)
    if data.FromUin ==3500673819 then--防止自我复读
        return 1 end
    if string.find(data.Content, "2019排") == 1 then
        Api.Api_SendMsg( 
            CurrentQQ,
            {
                
					toUser = data.FromUin, --回复当前消息的来源群ID
					sendToType = 1, --2发送给群1发送给好友3私聊
					groupid = 0, --不是私聊自然就为0咯
					atUser = 0, --是否 填上data.FromUserId就可以复读给他并@了
					sendMsgType = "PicMsg",
					content = "",
					picUrl = "/home/pi/IOTQQ/OPQBot_6.0.18_linux_arm/Plugins/BUPT/2019.jpg",
					picBase64Buf = "",
					fileMd5 = ""
            }
        )
        return 1
    end
    
    if string.find(data.Content, "北邮分数") == 1 then
        Api.Api_SendMsg( 
            CurrentQQ,
            {
                
					toUser = data.FromUin, --回复当前消息的来源群ID
					sendToType = 1, --2发送给群1发送给好友3私聊
					groupid = 0, --不是私聊自然就为0咯
					atUser = 0, --是否 填上data.FromUserId就可以复读给他并@了
					sendMsgType = "PicMsg",
					content = "",
					picUrl = "/home/pi/QQBot/OPQBot_6.0.6_linux_arm/Plugins/BUPT/2020.jpg",
					picBase64Buf = "",
					fileMd5 = ""
            }
        )
        return 1
    end

    if string.find(data.Content, "专业介绍") == 1 then
        Api.Api_SendMsg( 
            CurrentQQ,
            {
                
					toUser = data.FromUin, --回复当前消息的来源群ID
					sendToType = 1, --2发送给群1发送给好友3私聊
					groupid = 0, --不是私聊自然就为0咯
					atUser = 0, --是否 填上data.FromUserId就可以复读给他并@了
					sendMsgType = "PicMsg",
					content = "",
					picUrl = "/home/pi/IOTQQ/OPQBot_6.0.18_linux_arm/Plugins/BUPT/专业.jpg",
					picBase64Buf = "",
					fileMd5 = ""
            }
        )
        return 1
    end

    if string.find(data.Content, "转专业") == 1 then
        Api.Api_SendMsg( 
            CurrentQQ,
            {
                
					toUser = data.FromUin, --回复当前消息的来源群ID
					sendToType = 1, --2发送给群1发送给好友3私聊
					groupid = 0, --不是私聊自然就为0咯
					atUser = 0, --是否 填上data.FromUserId就可以复读给他并@了
					sendMsgType = "TextMsg",
					content = "为了充分调动学生学习的积极性和主动性，我校从2017级学生开始对于大部分专业实施转专业申请零门槛政策，让学生们有机会根据自己的兴趣、特长和爱好选择适合自己的专业，具体以教务处最新转专业政策为准。\n"..
                    "其中，艺术类专业学生不得申请转专业，国际学院学生不得申请转专业，其他学院学生不得申请转入国际学院专业，通过我校高水平艺术团招生录取的学生不得转入国际学院专业和软件学院专业。"
            }
        )
        return 1
    end

    if string.find(data.Content, "保研政策") == 1 then
        Api.Api_SendMsg( 
            CurrentQQ,
            {
                
					toUser = data.FromUin, --回复当前消息的来源群ID
					sendToType = 1, --2发送给群1发送给好友3私聊
					groupid = 0, --不是私聊自然就为0咯
					atUser = 0, --是否 填上data.FromUserId就可以复读给他并@了
					sendMsgType = "TextMsg",
					content = "近几年来我校推荐免试研究生的比例一般在19%左右（具体指标根据教育部每年相关规定确定)，主要通过以下三种途径确定推免资格:\n"..
                    "(1）一般根据学生大学前三年的综合排名确定推免资格。\n"..
                    "(2)对于学科竞赛成绩优异的学生，可有机会获得学校直接推免资格。\n"..
                    "(3）对有特涨学术专长或具有突出培养潜质者，经三名以上本校本专业教授联名推荐,学校审查通过后，可不受综合排名限制获得推免资格。\n"..
                    "同时，根据教育部文件精神，我校每年在优秀应届本科毕业生中，招收具有当年学术型推荐免试资格的部分毕业生直接攻读博士研究生。",
					picBase64Buf = "",
					fileMd5 = ""
            }
        )
        return 1
    end
end

function ReceiveGroupMsg(CurrentQQ, data)
    if data.FromUin ==3500673819 then--防止自我复读
        return 1 end
    if string.find(data.Content, "2019排") == 1 then
        	local path = "/home/pi/IOTQQ/OPQBot_6.0.18_linux_arm/Plugins/BUPT/2019.jpg"
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
    return 1
    end

    if string.find(data.Content, "北邮分数") == 1 then
local path = "/home/pi/IOTQQ/OPQBot_6.0.18_linux_arm/Plugins/BUPT/2020.jpg"
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
        return 1
    end

    if string.find(data.Content, "专业介绍") == 1 then
local path = "/home/pi/IOTQQ/OPQBot_6.0.18_linux_arm/Plugins/BUPT/专业.jpg"
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
        return 1
    end

    if string.find(data.Content, "转专业") == 1 then
        Api.Api_SendMsg( 
            CurrentQQ,
            {
                
					toUser = data.FromGroupId, --回复当前消息的来源群ID
					sendToType = 2, --2发送给群1发送给好友3私聊
					groupid = 0, --不是私聊自然就为0咯
					atUser = 0, --是否 填上data.FromUserId就可以复读给他并@了
					sendMsgType = "TextMsg",
					content = "为了充分调动学生学习的积极性和主动性，我校从2017级学生开始对于大部分专业实施转专业申请零门槛政策，让学生们有机会根据自己的兴趣、特长和爱好选择适合自己的专业，具体以教务处最新转专业政策为准。\n"..
                    "其中，艺术类专业学生不得申请转专业，国际学院学生不得申请转专业，其他学院学生不得申请转入国际学院专业，通过我校高水平艺术团招生录取的学生不得转入国际学院专业和软件学院专业。",					
					picBase64Buf = "",
					fileMd5 = ""
            }
        )
        return 1
    end

    if string.find(data.Content, "保研政策") == 1 then
        Api.Api_SendMsg( 
            CurrentQQ,
            {
                
					toUser = data.FromGroupId, --回复当前消息的来源群ID
					sendToType = 2, --2发送给群1发送给好友3私聊
					groupid = 0, --不是私聊自然就为0咯
					atUser = 0, --是否 填上data.FromUserId就可以复读给他并@了
					sendMsgType = "TextMsg",
					content = "近几年来我校推荐免试研究生的比例一般在19%左右（具体指标根据教育部每年相关规定确定)，主要通过以下三种途径确定推免资格:\n"..
                    "(1）一般根据学生大学前三年的综合排名确定推免资格。\n"..
                    "(2)对于学科竞赛成绩优异的学生，可有机会获得学校直接推免资格。\n"..
                    "(3）对有学术专长或具有突出培养潜质者，经三名以上本校本专业教授联名推荐,学校审查通过后，可不受综合排名限制获得推免资格。\n"..
                    "同时，根据教育部文件精神，我校每年在优秀应届本科毕业生中，招收具有当年学术型推荐免试资格的部分毕业生直接攻读博士研究生。",
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

function readImg(filePath)
    local f, err = io.open(filePath, "rb")
    if err ~= nil then
        return nil, err
    end
    local content = f:read("*all")
    f:close()
    return content, err
end
