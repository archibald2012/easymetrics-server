package org.easymetrics.easymetrics.server.service;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.easymetrics.easymetrics.model.Record;
import org.easymetrics.easymetrics.server.model.MetricsReport;

public interface MetricsService {

	List<String> getDistinctHost(String serviceGroup, String service);

	int saveRecord(Record record);

	MetricsReport getReport(int reportId);
	
	List<MetricsReport> getAllMetricsReport();

	Map<String, List<Object[]>> getReportData(String sql, String seriesColumnName, String[] seriesColumnValues, String[] parameterColumnNames,
			String[] valueColumns, Map<String, Object> parameters, Date startTime, Date endTime);
}
