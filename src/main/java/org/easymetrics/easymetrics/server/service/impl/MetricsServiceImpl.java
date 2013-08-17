package org.easymetrics.easymetrics.server.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.easymetrics.easymetrics.model.Record;
import org.easymetrics.easymetrics.publish.dao.DefaultMetricsDao;
import org.easymetrics.easymetrics.server.dao.MetricsQueryDao;
import org.easymetrics.easymetrics.server.dao.MetricsReportDao;
import org.easymetrics.easymetrics.server.model.MetricsReport;
import org.easymetrics.easymetrics.server.service.MetricsService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class MetricsServiceImpl implements MetricsService {

	@SuppressWarnings("unused")
	private static final Logger	LOGGER	= LoggerFactory.getLogger(MetricsServiceImpl.class);

	private DefaultMetricsDao	metricsDao;

	private MetricsQueryDao		metricsQueryDao;

	private MetricsReportDao	metricsReportDao;

	@Override
	public MetricsReport getReport(int reportId) {
		return metricsReportDao.getReportById(reportId);
	}

	@Override
	public List<MetricsReport> getAllMetricsReport() {
		return metricsReportDao.loadAllReports();
	}

	@Override
	public Map<String, List<Object[]>> getReportData(String sql, String seriesColumnName, String[] seriesColumnValues, String[] parameterColumnNames,
			String[] valueColumns, Map<String, Object> parameters, Date startTime, Date endTime) {

		Map<String, List<Object[]>> reportData = new HashMap<String, List<Object[]>>();
		for (String series : seriesColumnValues) {
			List<Object> param = new ArrayList<Object>();
			param.add(startTime);
			param.add(endTime);
			param.add(series);
			if (parameterColumnNames != null) {
				for (int i = 0; i < parameterColumnNames.length; i++) {
					String parameterColumn = parameterColumnNames[i];
					if (StringUtils.isNotBlank(parameterColumn)) {
						param.add(parameters.get(parameterColumn));
					}
				}
			}

			List<Map<String, Object>> result = metricsReportDao.executeReportSql(sql, param.toArray());
			List<Object[]> data = groupBySeries(result, valueColumns);
			reportData.put(series, data);
		}

		return reportData;
	}

	@Override
	public List<String> getDistinctHost(String serviceGroup, String service) {
		return metricsQueryDao.getDistinctHost(serviceGroup, service);
	}

	@Override
	public int saveRecord(Record record) {
		return metricsDao.saveRecord(record);
	}

	private List<Object[]> groupBySeries(List<Map<String, Object>> dataList, String[] valueColumns) {
		List<Object[]> ret = new ArrayList<Object[]>();
		if (dataList != null) {
			for (Map<String, Object> map : dataList) {
				Object[] values = new Object[valueColumns.length];
				for (int i = 0; i < valueColumns.length; i++) {
					values[i] = map.get(valueColumns[i]);
				}
				ret.add(values);
			}
		}
		return ret;
	}

	public void setMetricsQueryDao(MetricsQueryDao metricsQueryDao) {
		this.metricsQueryDao = metricsQueryDao;
	}

	public void setMetricsReportDao(MetricsReportDao metricsReportDao) {
		this.metricsReportDao = metricsReportDao;
	}

	public void setMetricsDao(DefaultMetricsDao defaultMetricsDao) {
		this.metricsDao = defaultMetricsDao;
	}

	class TimeSeriesData implements Comparable<TimeSeriesData> {

		private long	timestamp;
		private Object	value;

		public TimeSeriesData(long timestamp, Object value) {
			this.timestamp = timestamp;
			this.value = value;
		}

		public long getTimestamp() {
			return timestamp;
		}

		public Object getValue() {
			return value;
		}

		@Override
		public int compareTo(TimeSeriesData arg0) {
			return this.timestamp > arg0.timestamp ? 1 : -1;
		}

	}
}
