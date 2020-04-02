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
import javax.servlet.http.HttpSession;

import com.yanxuan.entity.UserInfo;


/**
 * 登录过滤器：防止重复登录
 * @author 1
 *
 */
public class LoginFilter implements Filter {

   
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		HttpServletRequest httpServletRequest = (HttpServletRequest) request;
		HttpServletResponse httpServletResponse = (HttpServletResponse) response;
		
		HttpSession session = httpServletRequest.getSession();
		UserInfo user=  (UserInfo)session.getAttribute("user");
		
		if(user==null) {
			System.out.println("当前还没有登录状态！！！");
			chain.doFilter(request, response);	
		}else {
			System.out.println("当前已经登录成功！不允许在登录状态下再次登录！！！");
			httpServletResponse.sendRedirect("/index.jsp");
		}
	}

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		
	}

	@Override
	public void destroy() {
		
	}

	

}
