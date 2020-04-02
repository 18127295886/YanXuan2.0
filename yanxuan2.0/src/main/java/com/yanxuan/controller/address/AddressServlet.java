package com.yanxuan.controller.address;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import com.yanxuan.entity.Address;
import com.yanxuan.entity.UserInfo;
import com.yanxuan.service.AddressService;
import com.yanxuan.utils.DButils;



public class AddressServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
      

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		HttpSession session = request.getSession();
		UserInfo user=(UserInfo)session.getAttribute("user");
		AddressService aService=new AddressService();
		List<Address> userAddressList=aService.selectAddress(user.getUserId());

		request.setAttribute("userAddressList", userAddressList);
		request.getRequestDispatcher("/pages/user/address.jsp").forward(request,response);
	}

}
