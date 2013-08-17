delete from metrics_report where report_id in (7,8,9,10,11,12);


insert into metrics_report (report_id, report_name, report_template, report_options, report_type, value_columns, execute_sql, series_value, report_category)
values(7, '每日消息吞吐率', 'spline-irregular-time', '
{
	title:{
		text: "通行证 Daily Throughput"
	},
	xAxis: {
		type: "datetime",
		tickInterval: 3600000
	},
	yAxis: {
		title: {
			text: "Transactions Per Second"
		},
		min: 0
	}
}
', 'DAY', 'check_time,tps', '
SELECT
	TIMESTAMP (t2.start_time + INTERVAL 8 HOUR) AS check_time,
	(t2.count * 1000/ t2.duration) AS tps
FROM
	metrics_record t1,
	metrics_aggregation t2
WHERE
	t1.record_id = t2.record_id
AND t1.service_group = \'Main\' and t1.service=\'aaa\' 
AND t2.start_time >= ? and t2.start_time < ? 
AND t2.component_name = \'ServerChannelHandler\' 
AND t2.function_name = \'messageReceived\' 
AND t1.host_name = ? order by t2.start_time asc
', '192.168.1.1,192.168.1.2', '通行证服务器');

insert into metrics_report (report_id, report_name, report_template, report_options, report_type, value_columns, execute_sql, series_value, report_category)
values(8, '每日消息吞吐率', 'spline-irregular-time', '
{
	title:{
		text: "元宝 Daily Throughput"
	},
	xAxis: {
		type: "datetime",
		tickInterval: 3600000
	},
	yAxis: {
		title: {
			text: "Transactions Per Second"
		},
		min: 0
	}
}
', 'DAY', 'check_time,tps', '
SELECT
	TIMESTAMP (t2.start_time + INTERVAL 8 HOUR) AS check_time,
	(t2.count * 1000/ t2.duration) AS tps
FROM
	metrics_record t1,
	metrics_aggregation t2
WHERE
	t1.record_id = t2.record_id
AND t1.service_group = \'Main\' and t1.service=\'gas\' 
AND t2.start_time >= ? and t2.start_time < ? 
AND t2.component_name = \'ServerChannelHandler\' 
AND t2.function_name = \'messageReceived\' 
AND t1.host_name = ? order by t2.start_time asc
', '192.168.1.1,192.168.1.2', '元宝服务器');

insert into metrics_report (report_id, report_name, report_template, report_options, report_type, value_columns, execute_sql, series_value, report_category)
values(9, '每日消息吞吐率', 'spline-irregular-time', '
{
	title:{
		text: "列表服务器 Daily Throughput"
	},
	xAxis: {
		type: "datetime",
		tickInterval: 3600000
	},
	yAxis: {
		title: {
			text: "Transactions Per Second"
		},
		min: 0
	}
}
', 'DAY', 'check_time,tps', '
SELECT
	TIMESTAMP (t2.start_time + INTERVAL 8 HOUR) AS check_time,
	(t2.count * 1000/ t2.duration) AS tps
FROM
	metrics_record t1,
	metrics_aggregation t2
WHERE
	t1.record_id = t2.record_id
AND t1.service_group = \'Main\' and t1.service=\'gzs\' 
AND t2.start_time >= ? and t2.start_time < ? 
AND t2.component_name = \'ServerChannelHandler\' 
AND t2.function_name = \'messageReceived\' 
AND t1.host_name = ? order by t2.start_time asc
', '192.168.1.1,192.168.1.2', '列表服务器');

insert into metrics_report (report_id, report_name, report_template, report_options, report_type, value_columns, execute_sql, series_value, report_category)
values(10, '每日消息吞吐率', 'spline-irregular-time', '
{
	title:{
		text: "下载服务器 Daily Throughput"
	},
	xAxis: {
		type: "datetime",
		tickInterval: 3600000
	},
	yAxis: {
		title: {
			text: "Transactions Per Second"
		},
		min: 0
	}
}
', 'DAY', 'check_time,tps', '
SELECT
	TIMESTAMP (t2.start_time + INTERVAL 8 HOUR) AS check_time,
	(t2.count * 1000/ t2.duration) AS tps
FROM
	metrics_record t1,
	metrics_aggregation t2
WHERE
	t1.record_id = t2.record_id
AND t1.service_group = \'Main\' and t1.service=\'fds\' 
AND t2.start_time >= ? and t2.start_time < ? 
AND t2.component_name = \'ServerChannelHandler\' 
AND t2.function_name = \'messageReceived\' 
AND t1.host_name = ? order by t2.start_time asc
', '192.168.1.1,192.168.1.2', '下载服务器');

insert into metrics_report (report_id, report_name, report_template, report_options, report_type, value_columns, execute_sql, series_value, report_category)
values(11, '每日消息吞吐率', 'spline-irregular-time', '
{
	title:{
		text: "斗地主服务器 Daily Throughput"
	},
	xAxis: {
		type: "datetime",
		tickInterval: 3600000
	},
	yAxis: {
		title: {
			text: "Transactions Per Second"
		},
		min: 0
	}
}
', 'DAY', 'check_time,tps', '
SELECT
	TIMESTAMP (t2.start_time + INTERVAL 8 HOUR) AS check_time,
	(t2.count * 1000/ t2.duration) AS tps
FROM
	metrics_record t1,
	metrics_aggregation t2
WHERE
	t1.record_id = t2.record_id
AND t1.service_group = \'Main\' and t1.service=\'ddz\' 
AND t2.start_time >= ? and t2.start_time < ? 
AND t2.component_name = \'ServerChannelHandler\' 
AND t2.function_name = \'messageReceived\' 
AND t1.host_name = ? order by t2.start_time asc
', 'ddz.51zhile.com,ddz2.51zhile.com', '斗地主服务器');

insert into metrics_report (report_id, report_name, report_template, report_options, report_type, value_columns, execute_sql, series_value, report_category)
values(12, '每日消息吞吐率', 'spline-irregular-time', '
{
	title:{
		text: "剑侠棋缘服务器 Daily Throughput"
	},
	xAxis: {
		type: "datetime",
		tickInterval: 3600000
	},
	yAxis: {
		title: {
			text: "Transactions Per Second"
		},
		min: 0
	}
}
', 'DAY', 'check_time,tps', '
SELECT
	TIMESTAMP (t2.start_time + INTERVAL 8 HOUR) AS check_time,
	(t2.count * 1000/ t2.duration) AS tps
FROM
	metrics_record t1,
	metrics_aggregation t2
WHERE
	t1.record_id = t2.record_id
AND t1.service_group = \'Main\' and t1.service=\'xj\' 
AND t2.start_time >= ? and t2.start_time < ? 
AND t2.component_name = \'ServerChannelHandler\' 
AND t2.function_name = \'messageReceived\' 
AND t1.host_name = ? order by t2.start_time asc
', '192.168.1.1,192.168.1.2', '剑侠棋缘服务器');

