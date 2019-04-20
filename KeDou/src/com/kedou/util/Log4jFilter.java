package com.kedou.util;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.MDC;

/**
 * Servlet Filter implementation class Log4jFilter
 */
@WebFilter("/Log4jFilter")
public class Log4jFilter implements Filter {

    /**
     * Default constructor. 
     */
    public Log4jFilter() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	@Override
	public void doFilter(ServletRequest req, ServletResponse res,FilterChain chain) throws IOException, ServletException {
		String ip = req.getRemoteAddr();
		String userName = (String)((HttpServletRequest)req).getSession().getAttribute("userName");//获取用户名
		MDC.put("ip", ip);
		MDC.put("userName", userName);
		chain.doFilter(req, res);
		MDC.remove("ip");
		MDC.remove("userName");
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
