local log = require("log")
local Api = require("coreApi")
local json = require("json")
local http = require("http")

function ReceiveFriendMsg(CurrentQQ, data)
	if data.FromUin ==3500673819 then--防止自我复读
		  return 1 end
	if string.find(data.Content, "菜单") == 1 then
		
		menu =  	
					"##部分功能仅群聊可用##\n"..
					"0.群聊和机器人聊天请@机器人，私聊直接发送\n"..
					"以下命令直接发送即可，冒号后面为功能触发口令（不同的子功能用逗号分隔，不触发需要+号）\n"..
					"1.看图命令(若失败请多试几次)：漫画、插画、首页推荐、周排行、cos、cos周排行、cos月排行、随机、周排行、pixiv、二次元、东方project\n"..
					"2.天气查询：降水、气温、雷达、华东(北、南、西)、西南、能见度、最高(低)气温实况图\n"..
					"3.QQ音乐：点歌+歌名\n"..
					"4.搜图+图片(一起发送) 不保证准确\n"	..
					"5.语音+文字(文字转语音)(可以私聊)\n"..
					"6.番剧搜索：搜番+图片（一起发送） 不保证准确(不可私聊)\n"..
					"7.财经功能(不带空格):上证指数、创业板指数、股票代码+代码(不能有空格)、基金代码+代码(不能有空格)\n"..					
					"8.骰子(不带空格): roll+数字 (默认六面骰)\n"..
					"9.唱歌（发语音）：唱歌+歌曲名（可以私聊）\n"..
					"10.小动物图片：bird,cat,dog\n"..
					"11.其他：舔狗日记、网易云热评、一言、poem\n"..
					"12.闪图：闪我、闪她+@某人\n"..
					"13.获取B站视频封面(不要+号)：B站封面解析+BV(AV)号\n"
					
					luaMsg =
					    Api.Api_SendMsg(--调用发消息的接口
					    CurrentQQ,
					    {
					       toUser = data.FromUin, --回复当前消息的来源群ID
					       sendToType = 1, --2发送给群1发送给好友3私聊
					       sendMsgType = "TextMsg", --进行文本复读回复
					       groupid = 0, --不是私聊自然就为0咯
					       content = menu, --回复内容
					       atUser = 0 --是否 填上data.FromUserId就可以复读给他并@了
					    }
 
					)
	end
	return 1
end

function ReceiveGroupMsg(CurrentQQ, data)
	if data.FromUserId ==3500673819 then--防止自我复读
		  return 1 end
	
	if string.find(data.Content, "菜单") == 1 then
		
		menu =  
					"##部分功能仅群聊可用##\n"..
					"0.群聊和机器人聊天请@机器人，私聊直接发送\n"..
					"以下命令直接发送即可，冒号后面为功能触发口令（不同的子功能用逗号分隔，不触发需要+号）\n"..
					"1.看图命令(若失败请多试几次)：漫画、插画、首页推荐、周排行、cos、cos周排行、cos月排行、随机、周排行、pixiv、二次元、东方project\n"..
					"2.天气查询：降水、气温、雷达、华东(北、南、西)、西南、能见度、最高(低)气温实况图\n"..
					"3.QQ音乐：点歌+歌名\n"..
					"4.搜图+图片(一起发送) 不保证准确\n"	..
					"5.语音+文字(文字转语音)(可以私聊)\n"..
					"6.番剧搜索：搜番+图片（一起发送） 不保证准确(不可私聊)\n"..
					"7.财经功能(不带空格):上证指数、创业板指数、股票代码+代码(不能有空格)、基金代码+代码(不能有空格)\n"..					
					"8.骰子(不带空格): roll+数字 (默认六面骰)\n"..
					"9.唱歌（发语音）：唱歌+歌曲名（可以私聊）\n"..
					"10.小动物图片：bird,cat,dog\n"..
					"11.其他：舔狗日记、网易云热评、一言、poem\n"..
					"12.闪图：闪我、闪她+@某人\n"..
					"13.获取B站视频封面(不要+号)：B站封面解析+BV(AV)号\n"
					
 
luaMsg =
					    Api.Api_SendMsg(--调用发消息的接口
					    CurrentQQ,
					    {
					       toUser = data.FromGroupId, --回复当前消息的来源群ID
					       sendToType = 2, --2发送给群1发送给好友3私聊
					       sendMsgType = "TextMsg", --进行文本复读回复
					       groupid = 0, --不是私聊自然就为0咯
					       content = menu, --回复内容
					       atUser = 0 --是否 填上data.FromUserId就可以复读给他并@了
					    }
 
					)
					Api.Api_SendMsg(--调用发消息的接口
					    CurrentQQ,
					    {
					       toUser = data.FromGroupId, --回复当前消息的来源群ID
					       sendToType = 2, --2发送给群1发送给好友3私聊
					       sendMsgType = "TextMsg", --进行文本复读回复
					       groupid = 0, --不是私聊自然就为0咯
					       content = "除聊天功能外其余功能不需要@机器人！！！！", --回复内容
					       atUser = 0 --是否 填上data.FromUserId就可以复读给他并@了
					    }
 
					)
				end
		
    return 1
end

function ReceiveEvents(CurrentQQ, data, extData)
    return 1
end
	
