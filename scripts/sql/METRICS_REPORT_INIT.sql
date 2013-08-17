delete from metrics_report;

insert into metrics_report (report_id, report_name, report_template, report_options, report_type, value_columns, execute_sql)
values(5, '每周内存使用率', 'line-time-series', '
{
	title:{
		text: "Weekly Heap Usage"
	},
	xAxis: {
		type: "datetime",
		tickInterval: 86400000
	},
	yAxis: {
		title: {
			text: "内存(MBytes)"
		},
		min: 0
	}
}
', 'WEEK', 'check_time,heap_used', '
select timestamp(t2.check_time+INTERVAL 8 HOUR) as check_time, t2.heap_used/1024/1024 as heap_used from metrics_record t1, metrics_usage_runtime t2 where t1.record_id = t2.record_id
and t1.service_group=? and t1.service = ? and t2.check_time >= ? and t2.check_time < ? and t1.host_name = ? order by t2.check_time asc
', 'service_group,service');

insert into metrics_report (report_id, report_name, report_template, report_options, report_type, value_columns, execute_sql, parameter_columns)
values(6, '每月内存使用率', 'line-time-series', '
{
	title:{
		text: "Monthly Heap Usage"
	},
	xAxis: {
		type: "datetime",
		tickInterval: 86400000
	},
	yAxis: {
		title: {
			text: "内存(MBytes)"
		},
		min: 0
	}
}
', 'MONTH', 'check_time,heap_used', '
select timestamp(t2.check_time+INTERVAL 8 HOUR) as check_time, t2.heap_used/1024/1024 as heap_used from metrics_record t1, metrics_usage_runtime t2 where t1.record_id = t2.record_id
and t1.service_group=? and t1.service = ? and t2.check_time >= ? and t2.check_time < ? and t1.host_name = ? order by t2.check_time asc
', 'service_group,service');

insert into metrics_report (report_id, report_name, report_template, report_options, report_type, value_columns, execute_sql, parameter_columns)
values(7, '每日CPU使用率', 'line-time-series', '
{
	title:{
		text: "Daily CPU Utilization"
	},
	xAxis: {
		type: "datetime",
		tickInterval: 3600000
	},
	yAxis: {
		title: {
			text: "CPU Utilization(%)"
		},
		min: 0
	}
}
', 'DAY', 'check_time,cpu_time', '
select timestamp(t2.check_time+INTERVAL 8 HOUR) as check_time, (t2.cpu_time-t2.up_time)/1000 as cpu_time from metrics_record t1, metrics_usage_runtime t2 where t1.record_id = t2.record_id
and t1.service_group=? and t1.service = ? and t2.check_time >= ? and t2.check_time < ? and t1.host_name = ? order by t2.check_time asc
', 'service_group,service');
