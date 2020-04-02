package com.yanxuan.controller.address;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yanxuan.entity.UserInfo;
import com.yanxuan.service.AddressService;

/**
 * Servlet implementation class NewAddresssServlet
 */
@WebServlet("/NewAddresssServlet")
public class NewAddressServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf8");
		//province=北京市& city=市辖区 & area=西城区 & address=1 & receiver=11 & mobile=13725115799 & defaultAddress=on
		
		HttpSession session = request.getSession();
		UserInfo user=(UserInfo)session.getAttribute("user");
		
		String province=request.getParameter("province");
		System.out.println(province);
		String city=request.getParameter("city");
		System.out.println(city);
		String area=request.getParameter("area");
		String address=request.getParameter("address");
		String receiver=request.getParameter("receiver");
		String mobile=request.getParameter("mobile");
		String defaultAddress=request.getParameter("defaultAddress");
		AddressService aService=new AddressService();
		//下面的方法未完成，却稍userid参数
		aService.newAddress(user.getUserId(),province, city, area, address, receiver, mobile);
		response.sendRedirect("addressServlet");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		
	}

}
