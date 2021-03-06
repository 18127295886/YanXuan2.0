package com.yanxuan.controller.address;

import java.io.IOException;

import javax.mail.Session;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yanxuan.entity.GoodInfo;
import com.yanxuan.entity.UserInfo;
import com.yanxuan.service.AddressService;

/**
 * Servlet implementation class SetDefaultAddressServlet
 */
@WebServlet("/SetDefaultAddressServlet")
public class SetDefaultAddressServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		UserInfo user=(UserInfo)session.getAttribute("user");
//		System.out.println(user.getUserId());
		Integer userAddress=Integer.parseInt(request.getParameter("addrId"));
//		System.out.println(userAddress);
		
		AddressService aService=new AddressService();
		aService.setDefaultAddress(user.getUserId(), userAddress);
		
		user.setUserAddress(userAddress);
		session.setAttribute("user", user);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
	}

}
