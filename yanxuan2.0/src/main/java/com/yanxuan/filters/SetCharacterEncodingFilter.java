package com.yanxuan.filters;

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
import javax.servlet.jsp.jstl.core.Config;



public class SetCharacterEncodingFilter implements Filter {

private String encode = null;
	public void destroy() {
		
	}

	
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		HttpServletRequest request2 = (HttpServletRequest)request;
		HttpServletResponse response2 =(HttpServletResponse)response;
		if(this.encode != null && !this.encode.equals("")) {
			request2.setCharacterEncoding(this.encode);
			response2.setCharacterEncoding(this.encode);
		}else {
			request2.setCharacterEncoding("UTF-8");
			response2.setCharacterEncoding("UTF-8");
		}
		chain.doFilter(request, response);
	}

	
	public void init(FilterConfig Config) throws ServletException {
		this.encode = Config.getInitParameter("encode");
	}

}
