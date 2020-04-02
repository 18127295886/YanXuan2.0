package com.yanxuan.controller.footprint;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yanxuan.entity.Footprint;
import com.yanxuan.entity.UserInfo;
import com.yanxuan.service.FootprintService;

/**
 * Servlet implementation class AddFootprintServlet
 */
@WebServlet("/addFootprintServlet")
public class AddFootprintServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		UserInfo user = (UserInfo) session.getAttribute("user");
		Integer goodId = Integer.parseInt(request.getParameter("goodId"));
		FootprintService fService=new FootprintService();
		Footprint footprint=new Footprint();
		footprint.setUserId(user.getUserId());
		footprint.setGoodId(goodId);
		fService.addFootpring(footprint);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
