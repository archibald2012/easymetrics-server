package org.easymetrics.easymetrics.server.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import org.apache.commons.lang.builder.ToStringBuilder;
import org.apache.commons.lang.builder.ToStringStyle;
import org.easymetrics.easymetrics.server.model.MetricsReport;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementSetter;
import org.springframework.jdbc.core.RowMapper;

public class MetricsReportDao {

	private static final Logger	LOGGER						= LoggerFactory.getLogger(MetricsReportDao.class);

	private static final String	LOAD_METRICS_REPORT_BY_ID	= "SELECT REPORT_ID, REPORT_NAME, REPORT_OPTIONS, REPORT_TEMPLATE, REPORT_TYPE, REPORT_CATEGORY, SERIES_COLUMN, SERIES_VALUE, VALUE_COLUMNS, EXECUTE_SQL, PARAMETER_COLUMNS, ORDER_BY FROM METRICS_REPORT WHERE REPORT_ID = ?";
	private static final String	LOAD_ALL_METRICS_REPORT		= "SELECT REPORT_ID, REPORT_NAME, REPORT_OPTIONS, REPORT_TEMPLATE, REPORT_TYPE, REPORT_CATEGORY, SERIES_COLUMN, SERIES_VALUE, VALUE_COLUMNS, EXECUTE_SQL, PARAMETER_COLUMNS, ORDER_BY FROM METRICS_REPORT ORDER BY REPORT_ID ASC";

	private JdbcTemplate		jdbcTemplate;

	public MetricsReport getReportById(int reportId) {
		return jdbcTemplate.queryForObject(LOAD_METRICS_REPORT_BY_ID, new Object[] { reportId }, new MetricsReportMapper());
	}

	public List<MetricsReport> loadAllReports() {
		return jdbcTemplate.query(LOAD_ALL_METRICS_REPORT, new MetricsReportMapper());
	}

	public List<Map<String, Object>> executeReportSql(final String sql, final Object[] parameters) {

		long startTime = System.currentTimeMillis();

		List<Map<String, Object>> ret = jdbcTemplate.query(sql, new PreparedStatementSetter() {

			@Override
			public void setValues(PreparedStatement ps) throws SQLException {
				for (int i = 1; i <= parameters.length; i++) {
					ps.setObject(i, parameters[i - 1]);
				}
			}
		}, new RowMapper<Map<String, Object>>() {

			@Override
			public Map<String, Object> mapRow(ResultSet rs, int rowNum) throws SQLException {
				Map<String, Object> data = new LinkedHashMap<String, Object>();
				ResultSetMetaData md = rs.getMetaData();
				for (int i = 1; i <= md.getColumnCount(); i++) {
					String columnName = md.getColumnName(i);
					data.put(columnName.toLowerCase(), rs.getObject(columnName));
				}
				return data;
			}
		});

		if (LOGGER.isDebugEnabled()) {
			LOGGER.debug("Execute report sql finished. Runtime estimated: " + (System.currentTimeMillis() - startTime) + "ms.");
		}

		return ret;
	}

	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}

	public void setDataSource(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}

	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this, ToStringStyle.SHORT_PREFIX_STYLE);
	}

	private final class MetricsReportMapper implements RowMapper<MetricsReport> {
		@Override
		public MetricsReport mapRow(ResultSet rs, int rowNum) throws SQLException {
			MetricsReport report = new MetricsReport();
			report.setReportId(rs.getInt("REPORT_ID"));
			report.setReportName(rs.getString("REPORT_NAME"));
			report.setReportOptions(rs.getString("REPORT_OPTIONS"));
			report.setReportTemplate(rs.getString("REPORT_TEMPLATE"));
			report.setReportType(rs.getString("REPORT_TYPE"));
			report.setReportCategory(rs.getString("REPORT_CATEGORY"));
			report.setExecuteSql(rs.getString("EXECUTE_SQL"));
			report.setSeriesColumn(rs.getString("SERIES_COLUMN"));
			report.setOrderBy(rs.getString("ORDER_BY"));
			String seriesValue = rs.getString("SERIES_VALUE");
			report.setSeriesValue(seriesValue.split(","));
			String valueColumns = rs.getString("VALUE_COLUMNS");
			report.setValueColumns(valueColumns.split(","));
			String parameterColumns = rs.getString("PARAMETER_COLUMNS");
			if (parameterColumns != null) {
				report.setParameterColumns(parameterColumns.split(","));
			}

			return report;
		}
	}
}
