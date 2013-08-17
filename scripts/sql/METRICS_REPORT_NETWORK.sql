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
