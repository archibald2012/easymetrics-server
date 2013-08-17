package org.easymetrics.easymetrics.server.model;

import java.io.Serializable;

import org.apache.commons.lang.builder.ToStringBuilder;
import org.apache.commons.lang.builder.ToStringStyle;

public class MetricsReport implements Serializable {

	private static final long	serialVersionUID	= 1L;

	private Integer				reportId;
	private String				reportName;
	private String				reportTemplate;
	private String				reportOptions;
	private String				reportType;
	private String				reportCategory;
	private String				executeSql;
	private String				seriesColumn;
	private String[]			seriesValue;
	private String[]			valueColumns;
	private String[]			parameterColumns;
	private String				orderBy;

	public Integer getReportId() {
		return reportId;
	}

	public void setReportId(Integer reportId) {
		this.reportId = reportId;
	}

	public String getReportName() {
		return reportName;
	}

	public void setReportName(String reportName) {
		this.reportName = reportName;
	}

	public String getReportOptions() {
		return reportOptions;
	}

	public void setReportOptions(String reportOptions) {
		this.reportOptions = reportOptions;
	}

	public String[] getValueColumns() {
		return valueColumns;
	}

	public void setValueColumns(String[] valueColumns) {
		this.valueColumns = valueColumns;
	}

	public String getReportCategory() {
		return reportCategory;
	}

	public void setReportCategory(String reportCategory) {
		this.reportCategory = reportCategory;
	}

	public String getSeriesColumn() {
		return seriesColumn;
	}

	public void setSeriesColumn(String seriesColumn) {
		this.seriesColumn = seriesColumn;
	}

	public String[] getSeriesValue() {
		return seriesValue;
	}

	public void setSeriesValue(String[] seriesValue) {
		this.seriesValue = seriesValue;
	}

	public String getReportType() {
		return reportType;
	}

	public void setReportType(String reportType) {
		this.reportType = reportType;
	}

	public String getExecuteSql() {
		return executeSql;
	}

	public void setExecuteSql(String executeSql) {
		this.executeSql = executeSql;
	}

	public String[] getParameterColumns() {
		return parameterColumns;
	}

	public void setParameterColumns(String[] parameterColumns) {
		this.parameterColumns = parameterColumns;
	}

	public String getReportTemplate() {
		return reportTemplate;
	}

	public void setReportTemplate(String reportTemplate) {
		this.reportTemplate = reportTemplate;
	}

	public String getOrderBy() {
		return orderBy;
	}

	public void setOrderBy(String orderBy) {
		this.orderBy = orderBy;
	}

	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this, ToStringStyle.SHORT_PREFIX_STYLE);
	}

}
