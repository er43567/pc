package cn.lrxzl.unclezhang.servlet;
import java.io.IOException;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.dispatcher.ng.filter.StrutsPrepareAndExecuteFilter;

public class TheDoor extends StrutsPrepareAndExecuteFilter {
	@Override
	public void doFilter(ServletRequest req, ServletResponse res,
			FilterChain chain) throws IOException, ServletException {
		
		HttpServletRequest request = (HttpServletRequest) req;
		String url = request.getRequestURL().toString();
		if (!(url == null || url.lastIndexOf("loadNoticeCount")>=0)) {
			System.out.println(url);
		}
		
		/*if (request.getSession().getAttribute("user") == null) {
			if (!url.contains("login.jsp") && !url.contains("AjaxAction!login")) {
				return;
			}
		}*/
		super.doFilter(req, res, chain);
	}
	
}
