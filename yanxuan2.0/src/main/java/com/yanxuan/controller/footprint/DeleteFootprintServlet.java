package com.yanxuan.controller.footprint;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yanxuan.entity.UserInfo;
import com.yanxuan.service.FootprintService;

/**
 * Servlet implementation class DeleteFootprintServlet
 */
@WebServlet("/DeleteFootprintServlet")
public class DeleteFootprintServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf8");

		HttpSession session = request.getSession();
		UserInfo user = (UserInfo) session.getAttribute("user");
		Integer goodId = Integer.parseInt(request.getParameter("goodId"));
		FootprintService fService=new FootprintService();
		fService.deleteFootprint(user.getUserId(), goodId);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
