package org.easymetrics.easymetrics.server.web;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.easymetrics.easymetrics.model.Record;
import org.easymetrics.easymetrics.server.service.MetricsService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.alibaba.fastjson.JSON;

@Controller
public class RecordControllor extends BaseController {

	private static final String	REQUEST_PARAMETER_RECORD	= "record";

	@Resource
	private MetricsService		metricsService;

	@RequestMapping(value = "/record/save.do", method = RequestMethod.POST)
	public String save(HttpServletRequest _request, HttpServletResponse _response, Model model) {
		String record = _request.getParameter(REQUEST_PARAMETER_RECORD);
		if (record != null && !"".equals(record)) {
			metricsService.saveRecord(JSON.parseObject(record, Record.class));
		}
		return "/download/editFileInfo";
	}

}
