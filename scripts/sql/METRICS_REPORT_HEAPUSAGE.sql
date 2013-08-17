delete from metrics_report where report_id in (1,2,3,4,5,6);

insert into metrics_report (report_id, report_name, report_template, report_options, report_type, value_columns, execute_sql, series_value, report_category)
values(1, '每日内存使用率', 'spline-irregular-time', '
{
	title:{
		text: "通行证服务器 Daily Heap Usage"
	},
	xAxis: {
		type: "datetime",
		tickInterval: 3600000
	},
	yAxis: {
		title: {
			text: "内存(MBytes)"
		},
		min: 0
	}
}
', 'DAY', 'check_time,heap_used', '
SELECT
	TIMESTAMP (t2.check_time + INTERVAL 8 HOUR) AS check_time,
	t2.heap_used / 1024 / 1024 AS heap_used
FROM
	metrics_record t1,
	metrics_usage_runtime t2
WHERE
	t1.record_id = t2.record_id
AND t1.service_group =\'Main\' 
AND t1.service = \'aaa\' 
AND t2.check_time >= ? 
AND t2.check_time < ? 
AND t1.host_name = ? 
ORDER BY t2.check_time ASC', '192.168.1.1,192.168.1.2', '通行证服务器');

insert into metrics_report (report_id, report_name, report_template, report_options, report_type, value_columns, execute_sql, series_value, report_category)
values(2, '每日内存使用率', 'spline-irregular-time', '
{
	title:{
		text: "元宝服务器 Daily Heap Usage"
	},
	xAxis: {
		type: "datetime",
		tickInterval: 3600000
	},
	yAxis: {
		title: {
			text: "内存(MBytes)"
		},
		min: 0
	}
}
', 'DAY', 'check_time,heap_used', '
SELECT
	TIMESTAMP (t2.check_time + INTERVAL 8 HOUR) AS check_time,
	t2.heap_used / 1024 / 1024 AS heap_used
FROM
	metrics_record t1,
	metrics_usage_runtime t2
WHERE
	t1.record_id = t2.record_id
AND t1.service_group =\'Main\' 
AND t1.service = \'gas\' 
AND t2.check_time >= ? 
AND t2.check_time < ? 
AND t1.host_name = ? 
ORDER BY t2.check_time ASC', '192.168.1.1,192.168.1.2', '元宝服务器');

insert into metrics_report (report_id, report_name, report_template, report_options, report_type, value_columns, execute_sql, series_value, report_category)
values(3, '每日内存使用率', 'spline-irregular-time', '
{
	title:{
		text: "列表服务器 Daily Heap Usage"
	},
	xAxis: {
		type: "datetime",
		tickInterval: 3600000
	},
	yAxis: {
		title: {
			text: "内存(MBytes)"
		},
		min: 0
	}
}
', 'DAY', 'check_time,heap_used', '
SELECT
	TIMESTAMP (t2.check_time + INTERVAL 8 HOUR) AS check_time,
	t2.heap_used / 1024 / 1024 AS heap_used
FROM
	metrics_record t1,
	metrics_usage_runtime t2
WHERE
	t1.record_id = t2.record_id
AND t1.service_group =\'Main\' 
AND t1.service = \'gzs\' 
AND t2.check_time >= ? 
AND t2.check_time < ? 
AND t1.host_name = ? 
ORDER BY t2.check_time ASC', '192.168.1.1,192.168.1.2', '列表服务器');

insert into metrics_report (report_id, report_name, report_template, report_options, report_type, value_columns, execute_sql, series_value, report_category)
values(4, '每日内存使用率', 'spline-irregular-time', '
{
	title:{
		text: "下载服务器 Daily Heap Usage"
	},
	xAxis: {
		type: "datetime",
		tickInterval: 3600000
	},
	yAxis: {
		title: {
			text: "内存(MBytes)"
		},
		min: 0
	}
}
', 'DAY', 'check_time,heap_used', '
SELECT
	TIMESTAMP (t2.check_time + INTERVAL 8 HOUR) AS check_time,
	t2.heap_used / 1024 / 1024 AS heap_used
FROM
	metrics_record t1,
	metrics_usage_runtime t2
WHERE
	t1.record_id = t2.record_id
AND t1.service_group =\'Main\' 
AND t1.service = \'fds\' 
AND t2.check_time >= ? 
AND t2.check_time < ? 
AND t1.host_name = ? 
ORDER BY t2.check_time ASC', '192.168.1.1,192.168.1.2', '下载服务器');

insert into metrics_report (report_id, report_name, report_template, report_options, report_type, value_columns, execute_sql, series_value, report_category)
values(5, '每日内存使用率', 'spline-irregular-time', '
{
	title:{
		text: "斗地主服务器 Daily Heap Usage"
	},
	xAxis: {
		type: "datetime",
		tickInterval: 3600000
	},
	yAxis: {
		title: {
			text: "内存(MBytes)"
		},
		min: 0
	}
}
', 'DAY', 'check_time,heap_used', '
SELECT
	TIMESTAMP (t2.check_time + INTERVAL 8 HOUR) AS check_time,
	t2.heap_used / 1024 / 1024 AS heap_used
FROM
	metrics_record t1,
	metrics_usage_runtime t2
WHERE
	t1.record_id = t2.record_id
AND t1.service_group =\'Main\' 
AND t1.service = \'ddz\' 
AND t2.check_time >= ? 
AND t2.check_time < ? 
AND t1.host_name = ? 
ORDER BY t2.check_time ASC', 'ddz.51zhile.com,ddz2.51zhile.com', '斗地主服务器');

insert into metrics_report (report_id, report_name, report_template, report_options, report_type, value_columns, execute_sql, series_value, report_category)
values(6, '每日内存使用率', 'spline-irregular-time', '
{
	title:{
		text: "剑侠棋缘服务器 Daily Heap Usage"
	},
	xAxis: {
		type: "datetime",
		tickInterval: 3600000
	},
	yAxis: {
		title: {
			text: "内存(MBytes)"
		},
		min: 0
	}
}
', 'DAY', 'check_time,heap_used', '
SELECT
	TIMESTAMP (t2.check_time + INTERVAL 8 HOUR) AS check_time,
	t2.heap_used / 1024 / 1024 AS heap_used
FROM
	metrics_record t1,
	metrics_usage_runtime t2
WHERE
	t1.record_id = t2.record_id
AND t1.service_group =\'Main\' 
AND t1.service = \'xj\' 
AND t2.check_time >= ? 
AND t2.check_time < ? 
AND t1.host_name = ? 
ORDER BY t2.check_time ASC', '192.168.1.1,192.168.1.2', '剑侠棋缘服务器');
