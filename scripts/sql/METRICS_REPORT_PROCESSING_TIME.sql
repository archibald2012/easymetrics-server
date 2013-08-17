delete from metrics_report where report_id > 18 and report_id <= 40;

insert into metrics_report (report_id, report_name, report_template, report_options, report_type, value_columns, execute_sql, series_value, report_category)
values(19, '每日CPU处理时间', 'spline-irregular-time', '
{
	title:{
		text: "通行证服务器 Daily Processing Time"
	},
	xAxis: {
		type: "datetime",
		tickInterval: 3600000
	},
	yAxis: {
		title: {
			text: "Hourly Averaged Time(ms)"
		},
		min: 0
	}
}
', 'DAY', 'check_time,average', '
SELECT
	TIMESTAMP (t2.start_time + INTERVAL 8 HOUR) AS check_time,
	t2.average AS average
FROM
	metrics_record t1,
	metrics_aggregation t2
WHERE
	t1.record_id = t2.record_id
AND t1.service_group = \'Main\'
AND t1.service = \'aaa\'
AND t2.start_time >= ?
AND t2.start_time < ?
AND t2.component_name = ?
ORDER BY t2.start_time asc', 'RegisterCourse,LoginCourse,LogoutCourse,CheckTokenCourse'
,'通行证服务器');
	
insert into metrics_report (report_id, report_name, report_template, report_options, report_type, value_columns, execute_sql, series_value, report_category)
values(20, '每日CPU处理时间', 'spline-irregular-time', '
{
	title:{
		text: "元宝服务器 Daily Processing Time"
	},
	xAxis: {
		type: "datetime",
		tickInterval: 3600000
	},
	yAxis: {
		title: {
			text: "Hourly Averaged Time(ms)"
		},
		min: 0
	}
}
', 'DAY', 'check_time,average', '
SELECT
	TIMESTAMP (t2.start_time + INTERVAL 8 HOUR) AS check_time,
	t2.average AS average
FROM
	metrics_record t1,
	metrics_aggregation t2
WHERE
	t1.record_id = t2.record_id
AND t1.service_group = \'Main\'
AND t1.service = \'gas\'
AND t2.start_time >= ?
AND t2.start_time < ?
AND t2.component_name = ?
ORDER BY t2.start_time asc', 'AccountInfoCourse,PaymentCourse'
,'元宝服务器');

insert into metrics_report (report_id, report_name, report_template, report_options, report_type, value_columns, execute_sql, series_value, report_category)
values(21, '每日CPU处理时间', 'spline-irregular-time', '
{
	title:{
		text: "列表服务器 Daily Processing Time"
	},
	xAxis: {
		type: "datetime",
		tickInterval: 3600000
	},
	yAxis: {
		title: {
			text: "Hourly Averaged Time(ms)"
		},
		min: 0
	}
}
', 'DAY', 'check_time,average', '
SELECT
	TIMESTAMP (t2.start_time + INTERVAL 8 HOUR) AS check_time,
	t2.average AS average
FROM
	metrics_record t1,
	metrics_aggregation t2
WHERE
	t1.record_id = t2.record_id
AND t1.service_group = \'Main\'
AND t1.service = \'gzs\'
AND t2.start_time >= ?
AND t2.start_time < ?
AND t2.component_name = ?
ORDER BY t2.start_time asc','AddRecentZoneCourse,GetRpgZoneCourse'
,'列表服务器');
	

insert into metrics_report (report_id, report_name, report_template, report_options, report_type, value_columns, execute_sql, series_value, report_category)
values(22, '每日CPU处理时间', 'spline-irregular-time', '
{
	title:{
		text: "下载服务器 Daily Processing Time"
	},
	xAxis: {
		type: "datetime",
		tickInterval: 3600000
	},
	yAxis: {
		title: {
			text: "Hourly Averaged Time(ms)"
		},
		min: 0
	}
}
', 'DAY', 'check_time,average', '
SELECT
	TIMESTAMP (t2.start_time + INTERVAL 8 HOUR) AS check_time,
	t2.average AS average
FROM
	metrics_record t1,
	metrics_aggregation t2
WHERE
	t1.record_id = t2.record_id
AND t1.service_group = \'Main\'
AND t1.service = \'fds\'
AND t2.start_time >= ?
AND t2.start_time < ?
AND t2.component_name = ?
ORDER BY t2.start_time asc','GetUpdateCourse,DownloadCourse,DownloadLogCourse'
,'下载服务器');
	

insert into metrics_report (report_id, report_name, report_template, report_options, report_type, value_columns, execute_sql, series_value, report_category)
values(23, '每日CPU处理时间', 'spline-irregular-time', '
{
	title:{
		text: "斗地主服务器 Daily Processing Time"
	},
	xAxis: {
		type: "datetime",
		tickInterval: 3600000
	},
	yAxis: {
		title: {
			text: "Hourly Averaged Time(ms)"
		},
		min: 0
	}
}
', 'DAY', 'check_time,average', '
SELECT
	TIMESTAMP (t2.start_time + INTERVAL 8 HOUR) AS check_time,
	t2.average AS average
FROM
	metrics_record t1,
	metrics_aggregation t2
WHERE
	t1.record_id = t2.record_id
AND t1.service_group = \'Main\'
AND t1.service = \'ddz\'
AND t2.start_time >= ?
AND t2.start_time < ?
AND t2.component_name = ?
ORDER BY t2.start_time asc','EnterRoomCourse,QuickPlayCourse,RaiseHandCourse,StandupCourse,TrusteeshipCourse,ChatCourse,BidCourse,DoubleCourse,PlayCardsCourse,ShowLordCardCourse'
,'斗地主服务器');
	
insert into metrics_report (report_id, report_name, report_template, report_options, report_type, value_columns, execute_sql, series_value, report_category)
values(24, '进入世界-每日CPU处理时间', 'spline-irregular-time', '
{
	title:{
		text: "进入世界 Daily Processing Time"
	},
	xAxis: {
		type: "datetime",
		tickInterval: 3600000
	},
	yAxis: {
		title: {
			text: "Hourly Averaged Time(ms)"
		},
		min: 0
	}
}
', 'DAY', 'check_time,average', '
SELECT
	TIMESTAMP (t2.start_time + INTERVAL 8 HOUR) AS check_time,
	t2.average AS average
FROM
	metrics_record t1,
	metrics_aggregation t2
WHERE
	t1.record_id = t2.record_id
AND t1.service_group = \'Main\'
AND t1.service = \'xj\'
AND t2.start_time >= ?
AND t2.start_time < ?
AND t2.component_name = ?
ORDER BY t2.start_time asc', 'EnterWorldCourse,CreateRpgPlayerCourse'
,'剑侠棋缘服务器');

insert into metrics_report (report_id, report_name, report_template, report_options, report_type, value_columns, execute_sql, series_value, report_category)
values(25, '背包-每日CPU处理时间', 'spline-irregular-time', '
{
	title:{
		text: "背包 Daily Processing Time"
	},
	xAxis: {
		type: "datetime",
		tickInterval: 3600000
	},
	yAxis: {
		title: {
			text: "Hourly Averaged Time(ms)"
		},
		min: 0
	}
}
', 'DAY', 'check_time,average', '
SELECT
	TIMESTAMP (t2.start_time + INTERVAL 8 HOUR) AS check_time,
	t2.average AS average
FROM
	metrics_record t1,
	metrics_aggregation t2
WHERE
	t1.record_id = t2.record_id
AND t1.service_group = \'Main\'
AND t1.service = \'xj\'
AND t2.start_time >= ?
AND t2.start_time < ?
AND t2.component_name = ?
ORDER BY t2.start_time asc', 'ArrangeBagCourse,ExpandBagCourse,GetBagItemsCourse,GetItemByIdCourse,GetItemInfoCourse,MergerMoveSwapItemCourse,RemoveItemCourse,SplitItemCourse'
,'剑侠棋缘服务器');


insert into metrics_report (report_id, report_name, report_template, report_options, report_type, value_columns, execute_sql, series_value, report_category)
values(26, '好友-每日CPU处理时间', 'spline-irregular-time', '
{
	title:{
		text: "好友 Daily Processing Time"
	},
	xAxis: {
		type: "datetime",
		tickInterval: 3600000
	},
	yAxis: {
		title: {
			text: "Hourly Averaged Time(ms)"
		},
		min: 0
	}
}
', 'DAY', 'check_time,average', '
SELECT
	TIMESTAMP (t2.start_time + INTERVAL 8 HOUR) AS check_time,
	t2.average AS average
FROM
	metrics_record t1,
	metrics_aggregation t2
WHERE
	t1.record_id = t2.record_id
AND t1.service_group = \'Main\'
AND t1.service = \'xj\'
AND t2.start_time >= ?
AND t2.start_time < ?
AND t2.component_name = ?
ORDER BY t2.start_time asc', 
'AddFriendCourse,ChangeFriendGroupCourse,ChangeFriendStateCourse,DeleteFriendCourse,GetFriendDetailCourse,GetFriendListCourse,GetNearbyPlayerListCourse,SearchFriendCourse'
,'剑侠棋缘服务器');


insert into metrics_report (report_id, report_name, report_template, report_options, report_type, value_columns, execute_sql, series_value, report_category)
values(27, '任务-每日CPU处理时间', 'spline-irregular-time', '
{
	title:{
		text: "任务 Daily Processing Time"
	},
	xAxis: {
		type: "datetime",
		tickInterval: 3600000
	},
	yAxis: {
		title: {
			text: "Hourly Averaged Time(ms)"
		},
		min: 0
	}
}
', 'DAY', 'check_time,average', '
SELECT
	TIMESTAMP (t2.start_time + INTERVAL 8 HOUR) AS check_time,
	t2.average AS average
FROM
	metrics_record t1,
	metrics_aggregation t2
WHERE
	t1.record_id = t2.record_id
AND t1.service_group = \'Main\'
AND t1.service = \'xj\'
AND t2.start_time >= ?
AND t2.start_time < ?
AND t2.component_name = ?
ORDER BY t2.start_time asc', 
'AbortQuestCourse,AcceptQuestCourse,ClickNpcCourse,QuestLoginCourse,QuestRegisterCourse,SelectJobCourse,SetNameCourse,SubmitQuestCourse'
,'剑侠棋缘服务器');


insert into metrics_report (report_id, report_name, report_template, report_options, report_type, value_columns, execute_sql, series_value, report_category)
values(28, '商店-每日CPU处理时间', 'spline-irregular-time', '
{
	title:{
		text: "商店 Daily Processing Time"
	},
	xAxis: {
		type: "datetime",
		tickInterval: 3600000
	},
	yAxis: {
		title: {
			text: "Hourly Averaged Time(ms)"
		},
		min: 0
	}
}
', 'DAY', 'check_time,average', '
SELECT
	TIMESTAMP (t2.start_time + INTERVAL 8 HOUR) AS check_time,
	t2.average AS average
FROM
	metrics_record t1,
	metrics_aggregation t2
WHERE
	t1.record_id = t2.record_id
AND t1.service_group = \'Main\'
AND t1.service = \'xj\'
AND t2.start_time >= ?
AND t2.start_time < ?
AND t2.component_name = ?
ORDER BY t2.start_time asc', 
'ShopBuyItemCourse,ShopItemListCourse,ShopRepurchaseItemCourse,ShopSellItemCourse'
,'剑侠棋缘服务器');


insert into metrics_report (report_id, report_name, report_template, report_options, report_type, value_columns, execute_sql, series_value, report_category)
values(29, '宝箱-每日CPU处理时间', 'spline-irregular-time', '
{
	title:{
		text: "宝箱 Daily Processing Time"
	},
	xAxis: {
		type: "datetime",
		tickInterval: 3600000
	},
	yAxis: {
		title: {
			text: "Hourly Averaged Time(ms)"
		},
		min: 0
	}
}
', 'DAY', 'check_time,average', '
SELECT
	TIMESTAMP (t2.start_time + INTERVAL 8 HOUR) AS check_time,
	t2.average AS average
FROM
	metrics_record t1,
	metrics_aggregation t2
WHERE
	t1.record_id = t2.record_id
AND t1.service_group = \'Main\'
AND t1.service = \'xj\'
AND t2.start_time >= ?
AND t2.start_time < ?
AND t2.component_name = ?
ORDER BY t2.start_time asc', 
'BuyDrawCardTimeCourse,GetContinueLoginBoxCourse,GetDrawCardInfoCourse,GetDrawCardItemCourse,GetFirstRechargeCourse,GetOnLineBoxCourse,GetVipBoxCourse,UseTreasureBoxCourse'
,'剑侠棋缘服务器');


insert into metrics_report (report_id, report_name, report_template, report_options, report_type, value_columns, execute_sql, series_value, report_category)
values(30, '邮箱-每日CPU处理时间', 'spline-irregular-time', '
{
	title:{
		text: "邮箱 Daily Processing Time"
	},
	xAxis: {
		type: "datetime",
		tickInterval: 3600000
	},
	yAxis: {
		title: {
			text: "Hourly Averaged Time(ms)"
		},
		min: 0
	}
}
', 'DAY', 'check_time,average', '
SELECT
	TIMESTAMP (t2.start_time + INTERVAL 8 HOUR) AS check_time,
	t2.average AS average
FROM
	metrics_record t1,
	metrics_aggregation t2
WHERE
	t1.record_id = t2.record_id
AND t1.service_group = \'Main\'
AND t1.service = \'xj\'
AND t2.start_time >= ?
AND t2.start_time < ?
AND t2.component_name = ?
ORDER BY t2.start_time asc', 
'DeleteMailCourse,GetMailListCourse,GetNewMailCountCourse,GetSavedMailListCourse,ReadMailCourse,ReceiveAttachmentCourse,ReturnMailCourse,SaveMailCourse,SendPrivateMailCourse,SendPublicMailCourse'
,'剑侠棋缘服务器');

insert into metrics_report (report_id, report_name, report_template, report_options, report_type, value_columns, execute_sql, series_value, report_category)
values(31, '押镖-每日CPU处理时间', 'spline-irregular-time', '
{
	title:{
		text: "押镖 Daily Processing Time"
	},
	xAxis: {
		type: "datetime",
		tickInterval: 3600000
	},
	yAxis: {
		title: {
			text: "Hourly Averaged Time(ms)"
		},
		min: 0
	}
}
', 'DAY', 'check_time,average', '
SELECT
	TIMESTAMP (t2.start_time + INTERVAL 8 HOUR) AS check_time,
	t2.average AS average
FROM
	metrics_record t1,
	metrics_aggregation t2
WHERE
	t1.record_id = t2.record_id
AND t1.service_group = \'Main\'
AND t1.service = \'xj\'
AND t2.start_time >= ?
AND t2.start_time < ?
AND t2.component_name = ?
ORDER BY t2.start_time asc', 
'BountyListCourse,ClearTimeCourse,CreateEscortCourse,EscortListCourse,GetEscortDetailInfoCourse,GetEscortDoneCourse,GetPlayerEscortInfoCourse,GoCreateEscortCourse,PlayerEscortBountyCourse,PlayerEscortWindowCloseCourse'
,'剑侠棋缘服务器');


insert into metrics_report (report_id, report_name, report_template, report_options, report_type, value_columns, execute_sql, series_value, report_category)
values(32, '装备-每日CPU处理时间', 'spline-irregular-time', '
{
	title:{
		text: "装备 Daily Processing Time"
	},
	xAxis: {
		type: "datetime",
		tickInterval: 3600000
	},
	yAxis: {
		title: {
			text: "Hourly Averaged Time(ms)"
		},
		min: 0
	}
}
', 'DAY', 'check_time,average', '
SELECT
	TIMESTAMP (t2.start_time + INTERVAL 8 HOUR) AS check_time,
	t2.average AS average
FROM
	metrics_record t1,
	metrics_aggregation t2
WHERE
	t1.record_id = t2.record_id
AND t1.service_group = \'Main\'
AND t1.service = \'xj\'
AND t2.start_time >= ?
AND t2.start_time < ?
AND t2.component_name = ?
ORDER BY t2.start_time asc', 
'CompositeCourse,GetCompositeInfoCourse,GetInlayInfoCourse,GetStrengthenInfoCourse,InlayCourse,RemoveInlayCourse,StrengthenCourse'
,'剑侠棋缘服务器');


insert into metrics_report (report_id, report_name, report_template, report_options, report_type, value_columns, execute_sql, series_value, report_category)
values(33, '战斗-每日CPU处理时间', 'spline-irregular-time', '
{
	title:{
		text: "战斗 Daily Processing Time"
	},
	xAxis: {
		type: "datetime",
		tickInterval: 3600000
	},
	yAxis: {
		title: {
			text: "Hourly Averaged Time(ms)"
		},
		min: 0
	}
}
', 'DAY', 'check_time,average', '
SELECT
	TIMESTAMP (t2.start_time + INTERVAL 8 HOUR) AS check_time,
	t2.average AS average
FROM
	metrics_record t1,
	metrics_aggregation t2
WHERE
	t1.record_id = t2.record_id
AND t1.service_group = \'Main\'
AND t1.service = \'xj\'
AND t2.start_time >= ?
AND t2.start_time < ?
AND t2.component_name = ?
ORDER BY t2.start_time asc', 
'AnswerMemAwayCourse,ArenaBuyChallengeNumCourse,ArenaClearTimeCourse,BattleCourse,BossInstanceReviveCourse,BuyInstanceTimeCourse,EnterInstanceCourse,ExitInstanceCourse,GetAllInstanceInfoCourse,GetArenaPlayerInfoCourse,GetArenaTop20Course,GetBossInstanceInfoCourse,GetHelperInfoCourse,ReadBattleReportCourse,ReadInstanceBattleReportCourse'
,'剑侠棋缘服务器');


insert into metrics_report (report_id, report_name, report_template, report_options, report_type, value_columns, execute_sql, series_value, report_category)
values(34, '活动-每日CPU处理时间', 'spline-irregular-time', '
{
	title:{
		text: "活动 Daily Processing Time"
	},
	xAxis: {
		type: "datetime",
		tickInterval: 3600000
	},
	yAxis: {
		title: {
			text: "Hourly Averaged Time(ms)"
		},
		min: 0
	}
}
', 'DAY', 'check_time,average', '
SELECT
	TIMESTAMP (t2.start_time + INTERVAL 8 HOUR) AS check_time,
	t2.average AS average
FROM
	metrics_record t1,
	metrics_aggregation t2
WHERE
	t1.record_id = t2.record_id
AND t1.service_group = \'Main\'
AND t1.service = \'xj\'
AND t2.start_time >= ?
AND t2.start_time < ?
AND t2.component_name = ?
ORDER BY t2.start_time asc', 
'GetChallengeCourse,GetActivityRewardCourse,ChallengeNotifyCourse,GetContinuousVictoryActivityCourse,GetContinuousVictoryRewardCourse,GetDailyActivityListCourse,GetMaxMultipleActivityCourse,GetOpenServiceActivityCourse,JoinActivityCourse,WeiboShareCourse'
,'剑侠棋缘服务器');

insert into metrics_report (report_id, report_name, report_template, report_options, report_type, value_columns, execute_sql, series_value, report_category)
values(35, '聊天-每日CPU处理时间', 'spline-irregular-time', '
{
	title:{
		text: "聊天 Daily Processing Time"
	},
	xAxis: {
		type: "datetime",
		tickInterval: 3600000
	},
	yAxis: {
		title: {
			text: "Hourly Averaged Time(ms)"
		},
		min: 0
	}
}
', 'DAY', 'check_time,average', '
SELECT
	TIMESTAMP (t2.start_time + INTERVAL 8 HOUR) AS check_time,
	t2.average AS average
FROM
	metrics_record t1,
	metrics_aggregation t2
WHERE
	t1.record_id = t2.record_id
AND t1.service_group = \'Main\'
AND t1.service = \'xj\'
AND t2.start_time >= ?
AND t2.start_time < ?
AND t2.component_name = ?
ORDER BY t2.start_time asc', 
'AnnouncementCourse,GetMessageListCourse,PrivateChatCourse,PublicChatCourse,ShortMessageCourse'
,'剑侠棋缘服务器');

insert into metrics_report (report_id, report_name, report_template, report_options, report_type, value_columns, execute_sql, series_value, report_category)
values(36, '拍卖-每日CPU处理时间', 'spline-irregular-time', '
{
	title:{
		text: "拍卖 Daily Processing Time"
	},
	xAxis: {
		type: "datetime",
		tickInterval: 3600000
	},
	yAxis: {
		title: {
			text: "Hourly Averaged Time(ms)"
		},
		min: 0
	}
}
', 'DAY', 'check_time,average', '
SELECT
	TIMESTAMP (t2.start_time + INTERVAL 8 HOUR) AS check_time,
	t2.average AS average
FROM
	metrics_record t1,
	metrics_aggregation t2
WHERE
	t1.record_id = t2.record_id
AND t1.service_group = \'Main\'
AND t1.service = \'xj\'
AND t2.start_time >= ?
AND t2.start_time < ?
AND t2.component_name = ?
ORDER BY t2.start_time asc', 
'AuctionListCourse,BuyItemCourse,RetrieveItemCourse,SellItemCourse,SellItemListCourse'
,'剑侠棋缘服务器');


insert into metrics_report (report_id, report_name, report_template, report_options, report_type, value_columns, execute_sql, series_value, report_category)
values(37, '组队-每日CPU处理时间', 'spline-irregular-time', '
{
	title:{
		text: "组队 Daily Processing Time"
	},
	xAxis: {
		type: "datetime",
		tickInterval: 3600000
	},
	yAxis: {
		title: {
			text: "Hourly Averaged Time(ms)"
		},
		min: 0
	}
}
', 'DAY', 'check_time,average', '
SELECT
	TIMESTAMP (t2.start_time + INTERVAL 8 HOUR) AS check_time,
	t2.average AS average
FROM
	metrics_record t1,
	metrics_aggregation t2
WHERE
	t1.record_id = t2.record_id
AND t1.service_group = \'Main\'
AND t1.service = \'xj\'
AND t2.start_time >= ?
AND t2.start_time < ?
AND t2.component_name = ?
ORDER BY t2.start_time asc', 
'AnswerJoinPartyCourse,AnswerReturnToPartyCourse,AwayFromPartyCourse,ChangePartyFormationCourse,ChangePartyLeaderCourse,CreatePartyCourse,DismissPartyCourse,GetPartyFormationCourse,GetPartyMemberInfoCourse,JoinPartyCourse,LeavePartyCourse,OustPartyCourse,PartyMemberListCourse,ReturnToPartyCourse'
,'剑侠棋缘服务器');


insert into metrics_report (report_id, report_name, report_template, report_options, report_type, value_columns, execute_sql, series_value, report_category)
values(38, '招财-每日CPU处理时间', 'spline-irregular-time', '
{
	title:{
		text: "招财 Daily Processing Time"
	},
	xAxis: {
		type: "datetime",
		tickInterval: 3600000
	},
	yAxis: {
		title: {
			text: "Hourly Averaged Time(ms)"
		},
		min: 0
	}
}
', 'DAY', 'check_time,average', '
SELECT
	TIMESTAMP (t2.start_time + INTERVAL 8 HOUR) AS check_time,
	t2.average AS average
FROM
	metrics_record t1,
	metrics_aggregation t2
WHERE
	t1.record_id = t2.record_id
AND t1.service_group = \'Main\'
AND t1.service = \'xj\'
AND t2.start_time >= ?
AND t2.start_time < ?
AND t2.component_name = ?
ORDER BY t2.start_time asc', 
'AutoBuyLuckyCharmCourse,BatchBuyLuckyCharmCourse,BuyLuckyCharmCourse,ExchangeMoneyCourse,GetBatchBuyLuckyCharmInfoCourse,GetBuyLuckyCharmInfoCourse,GetExchangeMoneyInfoCourse,PersonaSettingAutoBuyLuckyCharmCourse'
,'剑侠棋缘服务器');


insert into metrics_report (report_id, report_name, report_template, report_options, report_type, value_columns, execute_sql, series_value, report_category)
values(39, '人物-每日CPU处理时间', 'spline-irregular-time', '
{
	title:{
		text: "人物 Daily Processing Time"
	},
	xAxis: {
		type: "datetime",
		tickInterval: 3600000
	},
	yAxis: {
		title: {
			text: "Hourly Averaged Time(ms)"
		},
		min: 0
	}
}
', 'DAY', 'check_time,average', '
SELECT
	TIMESTAMP (t2.start_time + INTERVAL 8 HOUR) AS check_time,
	t2.average AS average
FROM
	metrics_record t1,
	metrics_aggregation t2
WHERE
	t1.record_id = t2.record_id
AND t1.service_group = \'Main\'
AND t1.service = \'xj\'
AND t2.start_time >= ?
AND t2.start_time < ?
AND t2.component_name = ?
ORDER BY t2.start_time asc', 
'BuyStrengthCourse,EquipCourse,GainActiveDegreeRewardCourse,GetNpcListCourse,GetRankingListCourse,MoveToCourse,MoveToOtherMapCourse,PersonaSettingCourse,QuitGameCourse,SitCourse,StandCourse,UnEquipCourse,ViewOtherPlayerInfoCourse,ViewWorldMapCourse'
,'剑侠棋缘服务器');


insert into metrics_report (report_id, report_name, report_template, report_options, report_type, value_columns, execute_sql, series_value, report_category)
values(40, '技能-每日CPU处理时间', 'spline-irregular-time', '
{
	title:{
		text: "技能 Daily Processing Time"
	},
	xAxis: {
		type: "datetime",
		tickInterval: 3600000
	},
	yAxis: {
		title: {
			text: "Hourly Averaged Time(ms)"
		},
		min: 0
	}
}
', 'DAY', 'check_time,average', '
SELECT
	TIMESTAMP (t2.start_time + INTERVAL 8 HOUR) AS check_time,
	t2.average AS average
FROM
	metrics_record t1,
	metrics_aggregation t2
WHERE
	t1.record_id = t2.record_id
AND t1.service_group = \'Main\'
AND t1.service = \'xj\'
AND t2.start_time >= ?
AND t2.start_time < ?
AND t2.component_name = ?
ORDER BY t2.start_time asc', 
'DragSkillCourse,GetSkillListCourse,GetSkillShortCutListCourse,LearnSkillCourse,ResetSkillCourse,UpdateSkillCourse'
,'剑侠棋缘服务器');