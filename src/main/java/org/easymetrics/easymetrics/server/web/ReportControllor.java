package org.easymetrics.easymetrics.server.web;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.easymetrics.easymetrics.server.model.MetricsReport;
import org.easymetrics.easymetrics.server.model.ReportType;
import org.easymetrics.easymetrics.server.service.MetricsService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.alibaba.fastjson.JSON;

@Controller
public class ReportControllor extends BaseVelocityController {

	private static final String	REQUEST_PARAMETER_ID	= "id";

	private static final String	REQUEST_PARAMETER_DATE	= "date";

	@Resource
	private MetricsService		metricsService;

	@SuppressWarnings({ "unchecked" })
	@RequestMapping(value = "/index.do", method = RequestMethod.GET)
	public void genReport(HttpServletRequest _request, HttpServletResponse _response, Model model) throws ParseException, IOException {
		Integer reportId = null;
		String date = null;
		Map<String, Object> parameters = new HashMap<String, Object>();
		for (Object parameterName : _request.getParameterMap().keySet()) {
			if (REQUEST_PARAMETER_ID.equals(parameterName)) {
				reportId = Integer.parseInt(_request.getParameter((String)parameterName));
			} else if (REQUEST_PARAMETER_DATE.equals(parameterName)) {
				date = _request.getParameter(REQUEST_PARAMETER_DATE);
			} else {
				parameters.put((String)parameterName, _request.getParameter((String)parameterName));
			}
		}

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date reportDate = (date == null) ? new Date() : sdf.parse(date);

		MetricsReport report = metricsService.getReport(reportId);
		ReportType type = ReportType.valueOf(report.getReportType());

		Date startTime = null;
		Date endTime = null;
		String subTitle = null;
		switch (type) {
		case DAY:
			startTime = getStartOfDay(reportDate);
			endTime = getEndOfDay(reportDate);
			subTitle = sdf.format(reportDate);
			break;
		case WEEK:
			startTime = getFirstDayOfWeek(reportDate);
			endTime = getLastDayOfWeek(reportDate);
			subTitle = sdf.format(startTime) + "-" + sdf.format(endTime);
			break;
		case MONTH:
			startTime = getFirstDayOfMonth(reportDate);
			endTime = getLastDayOfMonth(reportDate);
			subTitle = sdf.format(startTime) + "-" + sdf.format(endTime);
			break;
		case YEAR:
			startTime = getFirstDayOfYear(reportDate);
			endTime = getEndDayOfYear(reportDate);
			subTitle = String.valueOf(getYear(reportDate));
			break;
		default:
			throw new RuntimeException("report type " + report.getReportType() + " not supported.");
		}

		Map<String, List<Object[]>> reportData = metricsService.getReportData(report.getExecuteSql(), null, report.getSeriesValue(),
				report.getParameterColumns(), report.getValueColumns(), parameters, startTime, endTime);
		List<Map<String, Object>> seriesOptions = new ArrayList<Map<String, Object>>();
		for (Entry<String, List<Object[]>> e : reportData.entrySet()) {
			Map<String, Object> seriesEntry = new HashMap<String, Object>();
			seriesEntry.put("name", e.getKey());
			seriesEntry.put("data", e.getValue());
			seriesOptions.add(seriesEntry);
		}
		model.addAttribute("seriesOptions", JSON.toJSONString(seriesOptions));

		Map<String, Object> attributes = new HashMap<String, Object>();

		String reportOptions = report.getReportOptions();
		if (StringUtils.isNotBlank(reportOptions)) {
			attributes.putAll(JSON.parseObject(report.getReportOptions(), Map.class));
		}

		Map<String, Object> subTitleAttribute = new HashMap<String, Object>();
		attributes.put("subTitle", subTitleAttribute);
		subTitleAttribute.put("text", subTitle);

		List<MetricsReport> metricsReports = metricsService.getAllMetricsReport();
		Map<String, List<MetricsReport>> reports = new HashMap<String, List<MetricsReport>>();
		if (metricsReports != null) {
			for (MetricsReport r : metricsReports) {
				List<MetricsReport> list = reports.get(r.getReportCategory());
				if (list == null) {
					list = new ArrayList<MetricsReport>();
					reports.put(r.getReportCategory(), list);
				}
				list.add(r);
			}
			attributes.put("metricsReport", reports);
		}
		
		attributes.put("id", reportId);
		attributes.put("reportDate", sdf.format(reportDate));

		model.addAllAttributes(attributes);

		echoHtml(_request, _response, model, report.getReportTemplate());
	}

	private int getYear(Date date) {
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(date);
		return calendar.get(Calendar.YEAR);
	}

	private Date getFirstDayOfYear(Date date) {
		Calendar c = Calendar.getInstance();
		c.set(Calendar.MONTH, 1);
		c.setTime(date);
		c.set(Calendar.HOUR_OF_DAY, 0);
		c.set(Calendar.MINUTE, 0);
		c.set(Calendar.SECOND, 0);
		c.set(Calendar.MILLISECOND, 0);
		return c.getTime();
	}

	private Date getEndDayOfYear(Date date) {
		Calendar c = Calendar.getInstance();
		c.set(Calendar.MONTH, 12);
		c.setTime(date);
		c.set(Calendar.HOUR_OF_DAY, 23);
		c.set(Calendar.MINUTE, 59);
		c.set(Calendar.SECOND, 59);
		c.set(Calendar.MILLISECOND, 0);
		return c.getTime();
	}

	private Date getFirstDayOfMonth(Date date) {
		Calendar c = Calendar.getInstance();
		c.setTime(date);
		c.set(Calendar.DAY_OF_MONTH, 1);
		c.set(Calendar.HOUR_OF_DAY, 0);
		c.set(Calendar.MINUTE, 0);
		c.set(Calendar.SECOND, 0);
		c.set(Calendar.MILLISECOND, 0);
		return c.getTime();
	}

	private Date getLastDayOfMonth(Date date) {
		Date lastMonth = addMonths(date, 1);
		lastMonth = getFirstDayOfMonth(lastMonth);
		Date lastDay = addDays(lastMonth, -1);
		return getEndOfDay(lastDay);
	}

	private Date addDays(final Date date, int days) {
		Calendar cal = Calendar.getInstance();
		cal.setTime(date);
		cal.add(Calendar.DAY_OF_MONTH, days);
		return new Date(cal.getTime().getTime());
	}

	private Date addMonths(Date date, int months) {
		Calendar cal = Calendar.getInstance();
		cal.setTime(date);
		cal.add(Calendar.MONTH, months);
		return cal.getTime();
	}

	private Date getFirstDayOfWeek(Date date) {
		Calendar c = Calendar.getInstance();
		c.setFirstDayOfWeek(Calendar.MONDAY);
		c.setTime(date);
		c.set(Calendar.DAY_OF_WEEK, c.getFirstDayOfWeek());
		c.set(Calendar.HOUR_OF_DAY, 0);
		c.set(Calendar.MINUTE, 0);
		c.set(Calendar.SECOND, 0);
		c.set(Calendar.MILLISECOND, 0);
		return c.getTime();
	}

	private Date getLastDayOfWeek(Date date) {
		Calendar c = Calendar.getInstance();
		c.setFirstDayOfWeek(Calendar.MONDAY);
		c.setTime(date);
		c.set(Calendar.DAY_OF_WEEK, c.getFirstDayOfWeek() + 6);
		c.set(Calendar.HOUR_OF_DAY, 23);
		c.set(Calendar.MINUTE, 59);
		c.set(Calendar.SECOND, 59);
		c.set(Calendar.MILLISECOND, 0);
		return c.getTime();
	}

	private Date getStartOfDay(Date date) {
		Calendar c = Calendar.getInstance();
		c.setTime(date);
		c.set(Calendar.HOUR_OF_DAY, 0);
		c.set(Calendar.MINUTE, 0);
		c.set(Calendar.SECOND, 0);
		c.set(Calendar.MILLISECOND, 0);
		return c.getTime();
	}

	private Date getEndOfDay(Date date) {
		Calendar c = Calendar.getInstance();
		c.setTime(date);
		c.set(Calendar.HOUR_OF_DAY, 23);
		c.set(Calendar.MINUTE, 59);
		c.set(Calendar.SECOND, 59);
		c.set(Calendar.MILLISECOND, 0);
		return c.getTime();
	}
}
