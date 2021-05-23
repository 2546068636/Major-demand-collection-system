package com.me.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;

import com.me.dao.UserDao;

/**
 * Servlet Filter implementation class LFilter
 */
@WebFilter("/LFilter")
public class LFilter implements Filter {
	private FilterConfig _filterConfig = null;
	private String[] excludedPageArray;
	private String excludedPages;

	/**
	 * Default constructor.
	 */
	public LFilter() {
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
		_filterConfig = null;
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest req, ServletResponse rep, FilterChain chain)
			throws IOException, ServletException {
		// TODO Auto-generated method stub
		HttpServletRequest rq = (HttpServletRequest) req;
		HttpServletResponse rs = (HttpServletResponse) rep;
		boolean isExcludedPage = false;
		for (String page : excludedPageArray) { // 判断是否在过滤url之外
			if (rq.getServletPath().equals(page)) {
				isExcludedPage = true;
				break;
			}
		}

		if (isExcludedPage) { // 在过滤url之外
			chain.doFilter(rq, rs);
		} else { // 不在过滤url之外，判断登录
			HttpServletRequest request = (HttpServletRequest) req;
			HttpServletResponse response = (HttpServletResponse) rep;
			UserDao user = (UserDao) request.getSession().getAttribute("user");
			String path = request.getRequestURI();
			if (user == null && path.indexOf("login") == -1) {

				response.sendRedirect(request.getContextPath() + "/login.jsp");
				return;
			} else {
				chain.doFilter(request, response);
			}
		}
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
		_filterConfig = fConfig;
		excludedPages = _filterConfig.getInitParameter("excludedPages");
		System.out.println(excludedPages);
		if (StringUtils.isNotEmpty(excludedPages)) {
			excludedPageArray = excludedPages.split(",");
		}
	}

}
