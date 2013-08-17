package org.easymetrics.easymetrics.server.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.velocity.app.VelocityEngine;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.ui.Model;
import org.springframework.ui.velocity.VelocityEngineUtils;

public abstract class BaseVelocityController extends BaseController {

	private final Logger	LOGGER	= LoggerFactory.getLogger(getClass());

	@Resource
	private VelocityEngine	velocityEngine;

	protected void forward(HttpServletRequest _request, HttpServletResponse _response, String url) throws ServletException, IOException {
		_request.getRequestDispatcher(url).forward(_request, _response);
	}

	protected void forward(HttpServletRequest _request, HttpServletResponse _response, String url, Model model) throws ServletException, IOException {
		_request.setAttribute("model", model);
		_request.getRequestDispatcher(url).forward(_request, _response);
	}

	protected void _redirect(HttpServletResponse _response, String url) throws IOException {
		_response.sendRedirect(url);
	}

	protected void _redirect(String url) throws IOException {
		_redirect(this.response, url);
	}

	/**
	 * 跳转到错误页面
	 * 
	 * @param _request
	 * @param _response
	 * @param url
	 */
	protected void forwardError(HttpServletRequest _request, HttpServletResponse _response, String error) {
		try {
			_request.setAttribute("error", "<!-错误信息提示：" + error + "  错误信息结束->");
			_request.getRequestDispatcher("/error.do").forward(_request, _response);
		} catch (IOException e) {
			LOGGER.error("", e);
		} catch (ServletException e) {
			LOGGER.error("", e);
		}
	}

	protected void html(HttpServletResponse _response) {
		_response.setContentType("text/html");
	}

	protected void echoHtml(HttpServletResponse _response, Model model, String tpl) throws IOException {
		html(_response);
		echo(_response, model, tpl);
	}

	protected void echoHtml(HttpServletRequest _request, HttpServletResponse _response, Model model, String tpl) throws IOException {
		html(_response);
		model.addAttribute("request", _request);
		model.addAttribute("response", _response);
		model.addAttribute("session", _request.getSession());
		model.addAttribute("cookie", _request.getCookies());

		echo(_response, model, tpl);
	}

	protected void echoHtml(Model model, String tpl) {
		try {
			echoHtml(this.request, this.response, model, tpl);
		} catch (IOException e) {
			LOGGER.error("", e);
		}
	}

	protected void jpg(HttpServletResponse _response) {
		_response.setContentType("image/jpeg");
	}

	protected void echoJpg(HttpServletResponse _response, Model model, String tpl) throws IOException {
		jpg(_response);
		echo(_response, model, tpl);
	}

	protected void xml(HttpServletResponse _response) {
		_response.setContentType("text/xml;charset=" + this.velocityEngine.getProperty("encoding").toString());
	}

	protected void echoXml(HttpServletResponse _response, Model model, String tpl) throws IOException {
		xml(_response);
		echo(_response, model, tpl);
	}

	protected void json(HttpServletResponse _response) {
		_response.setContentType("application/json;charset=" + this.velocityEngine.getProperty("encoding").toString());
	}

	protected void echoJson(HttpServletResponse _response, Model model, String tpl) throws IOException {
		json(_response);
		echo(_response, model, tpl);
	}

	protected void echoString(HttpServletResponse _response, String con) throws IOException {
		PrintWriter out = _response.getWriter();
		out.write(con);
		out.flush();
		out.close();
		return;
	}

	@SuppressWarnings("unchecked")
	protected void echo(HttpServletResponse _response, Model model, String tpl) throws IOException {
		PrintWriter out = _response.getWriter();

		if (model.containsAttribute("request")) {
			this.request = (HttpServletRequest) model.asMap().get("request");
			model.addAttribute("request", this.request);
		}
		String templateLocation = tpl + this.velocityEngine.getProperty("suffix").toString();
		String encoding = this.velocityEngine.getProperty("encoding").toString();
		String output = VelocityEngineUtils.mergeTemplateIntoString(this.velocityEngine, templateLocation, encoding, (Map<String, Object>) model);
		if (logger.isDebugEnabled()) {
			logger.debug("Write output: " + output);
		}
		out.write(output);
		out.flush();
		out.close();
		return;
	}
}
