delete from metrics_report where report_id in (13,14,15,16,17,18);

insert into metrics_report (report_id, report_name, report_template, report_options, report_type, value_columns, execute_sql, series_value, report_category)
values(13, '每日数据库响应时间', 'spline-irregular-time', '
{
	title:{
		text: "通行证 Daily Database Performance Metrics"
	},
	xAxis: {
		type: "datetime",
		tickInterval: 3600000
	},
	yAxis: {
		title: {
			text: "Averaged Processing Time(ms)"
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
AND t2.component_name = \'IbatisDelegate\' 
and t2.function_name = ? 
order by t2.start_time asc
', 'insert,update,delete,queryForObject,queryForList,batchInsert,batchUpdate'
,'通行证服务器');

insert into metrics_report (report_id, report_name, report_template, report_options, report_type, value_columns, execute_sql, series_value, report_category)
values(14, '每日数据库响应时间', 'spline-irregular-time', '
{
	title:{
		text: "元宝 Daily Database Performance Metrics"
	},
	xAxis: {
		type: "datetime",
		tickInterval: 3600000
	},
	yAxis: {
		title: {
			text: "Averaged Processing Time(ms)"
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
AND t2.component_name = \'IbatisDelegate\' 
and t2.function_name = ? 
order by t2.start_time asc
', 'insert,update,delete,queryForObject,queryForList,batchInsert,batchUpdate'
,'元宝服务器');

insert into metrics_report (report_id, report_name, report_template, report_options, report_type, value_columns, execute_sql, series_value, report_category)
values(15, '每日数据库响应时间', 'spline-irregular-time', '
{
	title:{
		text: "列表服务器 Daily Database Performance Metrics"
	},
	xAxis: {
		type: "datetime",
		tickInterval: 3600000
	},
	yAxis: {
		title: {
			text: "Averaged Processing Time(ms)"
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
AND t2.component_name = \'IbatisDelegate\' 
and t2.function_name = ? 
order by t2.start_time asc
', 'insert,update,delete,queryForObject,queryForList,batchInsert,batchUpdate'
,'列表服务器');

insert into metrics_report (report_id, report_name, report_template, report_options, report_type, value_columns, execute_sql, series_value, report_category)
values(16, '每日数据库响应时间', 'spline-irregular-time', '
{
	title:{
		text: "下载服务器 Daily Database Performance Metrics"
	},
	xAxis: {
		type: "datetime",
		tickInterval: 3600000
	},
	yAxis: {
		title: {
			text: "Averaged Processing Time(ms)"
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
AND t2.component_name = \'IbatisDelegate\' 
and t2.function_name = ? 
order by t2.start_time asc
', 'insert,update,delete,queryForObject,queryForList,batchInsert,batchUpdate'
,'下载服务器');

insert into metrics_report (report_id, report_name, report_template, report_options, report_type, value_columns, execute_sql, series_value, report_category)
values(17, '每日数据库响应时间', 'spline-irregular-time', '
{
	title:{
		text: "斗地主服务器 Daily Database Performance Metrics"
	},
	xAxis: {
		type: "datetime",
		tickInterval: 3600000
	},
	yAxis: {
		title: {
			text: "Averaged Processing Time(ms)"
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
AND t2.component_name = \'IbatisDelegate\' 
and t2.function_name = ? 
order by t2.start_time asc
', 'insert,update,delete,queryForObject,queryForList,batchInsert,batchUpdate'
,'斗地主服务器');

insert into metrics_report (report_id, report_name, report_template, report_options, report_type, value_columns, execute_sql, series_value, report_category)
values(18, '每日数据库响应时间', 'spline-irregular-time', '
{
	title:{
		text: "剑侠棋缘服务器 Daily Database Performance Metrics"
	},
	xAxis: {
		type: "datetime",
		tickInterval: 3600000
	},
	yAxis: {
		title: {
			text: "Averaged Processing Time(ms)"
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
AND t2.component_name = \'IbatisDelegate\' 
and t2.function_name = ? 
order by t2.start_time asc
', 'insert,update,delete,queryForObject,queryForList,batchInsert,batchUpdate'
,'剑侠棋缘服务器');
