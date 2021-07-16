local log = require("log")
local Api = require("coreApi")
local json = require("json")
local http = require("http")
function ReceiveFriendMsg(CurrentQQ, data)
	if data.FromUin ==3500673819 then--防止自我复读
        return 1 end
  keyWord  = " "
  if string.find(data.Content, "基金代码") == 1 then
      keyWord = data.Content:gsub("基金代码", "")
          if keyWord == nil then
              return 1
          end
  log.notice("kw-->",keyWord)
  response, error_message =
  http.request(
  "GET",
           "https://api.doctorxiong.club/v1/fund?code="..keyWord
)

              local html = response.body
              
              local datas = json.decode(html)
              local code = datas.data[1].code  
              local name = datas.data[1].name
              local netWorthDate = datas.data[1].netWorthDate
              local netWorth = datas.data[1].netWorth
              local expectWorth = datas.data[1].expectWorth
              local expectGrowth = datas.data[1].expectGrowth
              local dayGrowth = datas.data[1].dayGrowth
              local lastWeekGrowth = datas.data[1].lastWeekGrowth
              local lastMonthGrowth = datas.data[1].lastMonthGrowth

contents = string.format(
                                "基金代码：%s\n基金名称：%s\n当前基金单位净值：%s\n当前基金单位净值估算：%s\n当前基金单位净值估算日涨幅,单位为百分比：%s\n单位净值日涨幅,单位为百分比：%s\n单位净值周涨幅,单位为百分比：%s\n单位净值月涨幅,单位为百分比:%s\n净值更新日期:%s\n",
                                  code,
                                  name,
                                  netWorth,
                                  expectWorth,
                                  expectGrowth,
                                  dayGrowth,
                                  lastWeekGrowth,
                                  lastMonthGrowth,
                                  netWorthDate
                                )
log.notice("%s",contents)
           Api.Api_SendMsg(--调用发消息的接口
					    CurrentQQ,
					    {
					       toUser = data.FromUin, --回复当前消息的来源群ID
					       sendToType = 1, --2发送给群1发送给好友3私聊
					       sendMsgType = "TextMsg", --进行文本复读回复
					       groupid = 0, --不是私聊自然就为0咯
					       content = contents, --回复内容
					       atUser = 0 --是否 填上data.FromUserId就可以复读给他并@了
					    }
 
					)
      end
		return 1
end

function ReceiveGroupMsg(CurrentQQ, data)
	if data.FromUin ==3500673819 then--防止自我复读
        return 1 end
  keyWord  = " "
  if string.find(data.Content, "基金代码") == 1 then
      keyWord = data.Content:gsub("基金代码", "")
          if keyWord == nil then
              return 1
          end
  response, error_message =
  http.request(
  "GET",
           "https://api.doctorxiong.club/v1/fund?code="..keyWord
)

              local html = response.body
              local datas = json.decode(html)
              local code = datas.data[1].code  
              local name = datas.data[1].name
              local netWorthDate = datas.data[1].netWorthDate
              local netWorth = datas.data[1].netWorth
              local expectWorth = datas.data[1].expectWorth
              local expectGrowth = datas.data[1].expectGrowth
              local dayGrowth = datas.data[1].dayGrowth
              local lastWeekGrowth = datas.data[1].lastWeekGrowth
              local lastMonthGrowth = datas.data[1].lastMonthGrowth

contents1 = string.format(
                                "基金代码：%s\n基金名称：%s\n当前基金单位净值：%s\n当前基金单位净值估算：%s\n当前基金单位净值估算日涨幅,单位为百分比：%s\n单位净值日涨幅,单位为百分比：%s\n单位净值周涨幅,单位为百分比：%s\n单位净值月涨幅,单位为百分比:%s\n净值更新日期:%s\n",
                                  code,
                                  name,
                                  netWorth,
                                  expectWorth,
                                  expectGrowth,
                                  dayGrowth,
                                  lastWeekGrowth,
                                  lastMonthGrowth,
                                  netWorthDate
                                )

           Api.Api_SendMsg(--调用发消息的接口
					    CurrentQQ,
					    {
					       toUser = data.FromGroupId, --回复当前消息的来源群ID
					       sendToType = 2, --2发送给群1发送给好友3私聊
					       sendMsgType = "TextMsg", --进行文本复读回复
					       groupid = 0, --不是私聊自然就为0咯
					       content = contents1, --回复内容
					       atUser = 0 --是否 填上data.FromUserId就可以复读给他并@了
					    }
 
					)
      end
		return 1
	end
	
			
function ReceiveEvents(CurrentQQ, data, extData)
    return 1
end

